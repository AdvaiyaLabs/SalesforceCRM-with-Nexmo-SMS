public with sharing class NexController {

//public String nexSmsId {get; set;} //account id
public Nexmo_SMS__c nSms {get; set;} // account record
public Boolean nSms_enable {get; set;}

/**
@purpose class constructor, fetch account details
*/
public NexController(ApexPages.StandardController controller) {
    //nexSmsId = controller.getId();
    nSms = new Nexmo_SMS__c();    

    //if(nexSmsId != null){
        try{
            nSms = [SELECT Id, Nexmo_Api_Key__c, Nexmo_Api_Secret__c, Budget_Amount__c, SMS_Enable__c FROM Nexmo_SMS__c order by id desc limit 1];
			//nSms_enable = nSms.SMS_Enable__c;            
        }catch(Exception e){ ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.error,'Unable to find the Nexmo Settings'); ApexPages.addMessage(msg); }
   // }
}
    
}