trigger OppUpdate on Opportunity (before update) {

String msg = '';
String sAccount = '';
String sName;
String mobile = '';
Double budgetAmount = 0;
Boolean enable = false;

Set<Id> ownerIds = new Set<Id>();    
Set<Id> AccountIds = new Set<Id>();
for (Opportunity op : Trigger.new) {
    ownerIds.add(op.OwnerId);
   accountIds.add(op.AccountId);
}

Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Name FROM Account WHERE Id IN :accountIds]);
Map<Id, User> userMap = new Map<Id, User>([SELECT Id, Name,MobilePhone, ManagerID, Manager.Name, Manager.MobilePhone FROM User WHERE Id IN :OwnerIds]);

Nexmo_SMS__c[] nSms = [select Budget_Amount__c,SMS_Enable__c from Nexmo_SMS__c limit 1];
if(nSms.size() != 0){
	budgetAmount = nSms[0].Budget_Amount__c;
	enable = nSms[0].SMS_Enable__c;
}
//Double budgetAmount = [select Budget_Amount__c from Nexmo_SMS__c limit 1].Budget_Amount__c;
//Boolean enable = [select SMS_Enable__c from Nexmo_SMS__c limit 1].SMS_Enable__c;    
  
    
  for (Opportunity op : Trigger.new) {
    Opportunity oldOpp = Trigger.oldMap.get(op.Id);
    Double oldOppAmount = oldOpp.Amount;
    Double newOppAmount = op.Amount;
    if (oldOppAmount != newOppAmount && newOppAmount >= budgetAmount) {
      
        if(op.AccountId != NULL){
          // add the account name
          sName = accountMap.get(op.AccountId).Name;
          sAccount = ' for '+ sName;  
        }
      
      mobile = userMap.get(op.OwnerId).Manager.MobilePhone;
        if(mobile == null){
                mobile = userMap.get(op.OwnerId).MobilePhone;
            }
      String Iso = userInfo.getDefaultCurrency();
        String currencySymol =  
            ('USD' == Iso ? '$' : 
             ('CAD' == Iso ? '$' : 
              ('EUR' == Iso ? '€' : 
               ('GBP' == Iso ? '£' : 
                ('JPY' == Iso ? '¥' : 
                 ('KRW' == Iso ? '?' : 
                  ('CNY' == Iso ? '?' : 
                   Iso)))))));
        //System.debug('currency symbol==='+currencySymol);
          
      msg = 'An opportunity "'+ op.Name +'"'+ sAccount +' has been updated with probable value '+ currencySymol+op.Amount;
     if(msg != '' && mobile != '' && enable == true){         
      //Nexmo.sendEmail(msg,mobile);
      Nexmo.sendNotification(msg,mobile);
         System.debug('update trigger called');         
     }    
    }
  }
}