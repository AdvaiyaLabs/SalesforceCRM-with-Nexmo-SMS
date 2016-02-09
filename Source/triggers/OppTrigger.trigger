trigger OppTrigger on Opportunity (before insert) {
       
String msg = '';
String sAmount = '';
String sName;
String sAccount = ''; 
String mobile = '';
Double budgetAmount = 0;
Boolean enable = false;
    
Set<Id> ownerIds = new Set<Id>();
Set<Id> AccountIds = new Set<Id>();
for (Opportunity op : Trigger.new) {
   ownerIds.add(op.OwnerId);
   accountIds.add(op.AccountId);
}

Nexmo_SMS__c[] nSms = [select Budget_Amount__c,SMS_Enable__c from Nexmo_SMS__c limit 1];
if(nSms.size() != 0){
	budgetAmount = nSms[0].Budget_Amount__c;
	enable = nSms[0].SMS_Enable__c;
}
//Double budgetAmount = [select Budget_Amount__c from Nexmo_SMS__c limit 1].Budget_Amount__c;
//Boolean enable = [select SMS_Enable__c from Nexmo_SMS__c limit 1].SMS_Enable__c;    
    
Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Name FROM Account WHERE Id IN :accountIds]);
Map<Id, User> userMap = new Map<Id, User>([SELECT Id, Name,MobilePhone, ManagerID, Manager.Name, Manager.MobilePhone FROM User WHERE Id IN :OwnerIds]);
//Map<Id, Group> groupMap = new Map<Id, Group>([SELECT Name FROM Group WHERE Id IN :OwnerIds]);
 
for (Opportunity op : Trigger.new) {
    if(op.AccountId != NULL){
      // add the account name
      sName = accountMap.get(op.AccountId).Name;
      sAccount = ' for '+ sName;  
    }
        if(op.Amount >= budgetAmount){
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
        
            sAmount = ' with probable value '+ currencySymol+op.Amount;
            msg = 'A new opportunity "'+ op.Name +'"'+ sAccount + sAmount +' has been added';
        }        
}
    System.debug('Trigger Called');
    if(msg != '' && mobile != '' && mobile != null && enable == true){
    	Nexmo.sendNotification(msg,mobile);
    	//Nexmo.sendEmail(msg,mobile);
    }
   
}