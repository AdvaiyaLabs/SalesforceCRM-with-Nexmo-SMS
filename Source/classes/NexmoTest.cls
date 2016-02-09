@isTest
private class NexmoTest {
    
    public static List<Opportunity> OpportunityList;
    
   // Methods for testing
   /*public static testMethod void testMe() {
       String msg = 'Test Email';
        Nexmo.sendEmail(msg);
       Nexmo.sendNotification(msg);
    }*/
    
     private static testmethod void myUnitTest()
    {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('NexmoResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        mock.setHeader('Accept', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);
        /*
        // Use MultiStaticResourceCalloutMock to 
        // specify fake response for a certain endpoint and 
        // include response body in a static resource.    
        MultiStaticResourceCalloutMock multimock = new MultiStaticResourceCalloutMock();
        multimock.setStaticResource('https://rest.nexmo.com/account/numbers', 'mockResponse');
        multimock.setStaticResource('https://rest.nexmo.com/sms/json', 'mockResponse2');
        multimock.setStatusCode(200);
        multimock.setHeader('Content-Type', 'application/json');
        multimock.setHeader('Accept', 'application/json');
        // Set the mock callout mode
        Test.setMock(HttpCalloutMock.class, multimock);
        */
        Nexmo_SMS__c nex = new Nexmo_SMS__c(Name='Test Settings', Budget_Amount__c=1000, Nexmo_Api_Key__c = '5b2a23d7', Nexmo_Api_Secret__c='59d9fa03', SMS_Enable__c = true);
        insert nex;
        
        /*
        Lead myLead = new Lead(LastName = 'Fry', Company='Fry And Sons', Email = 'fns@test.com', AnnualRevenue = 1200);
		insert myLead;
		
		Database.LeadConvert lc = new Database.LeadConvert();
		lc.setLeadId(myLead.id);
		
		LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(convertStatus.MasterLabel);
		
		Database.LeadConvertResult lcr = Database.convertLead(lc);
		System.assert(lcr.isSuccess());
		
		String opName = lc.getOpportunityName();
		
		Opportunity opportunity = [select Name, Amount from Opportunity where Name = 'Fry And Sons' limit 1];
*/
        Opportunity opportunity = new Opportunity(Name = 'sha', Amount = 1200, StageName='Value Proposition', CloseDate = Date.newInstance(2016, 9, 28));
        insert opportunity;
        system.assertEquals('sha', opportunity.Name);
        
        //test.startTest();
            opportunity.Amount = 1500;
            update opportunity;
            system.assertEquals(1500, opportunity.Amount);
        //test.stopTest();
        
        PageReference pg = Page.Nexmo_Settings;
        Test.setCurrentPage(pg);
        ApexPages.StandardController stc = new ApexPages.StandardController(nex);		
        NexController controller = new NexController(stc);

    }
}