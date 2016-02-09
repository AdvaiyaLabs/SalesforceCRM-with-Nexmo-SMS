public class Nexmo {
/*public static void sendMessage(Contact[] contact) {   
    System.debug('Send Message');
}    
    public static void sendEmail(String msg, String mobile) {
        String NexFrom = '';
         
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
      sendTo.add('varta.shrimali@advaiya.com');
        mail.setToAddresses(sendTo);
        String body = '';        
        body = msg;        
        
        mail.setHtmlBody(body);
        mails.add(mail);
        Messaging.sendEmail(mails);
            
    }*/
    
    @future (callout=true)
    public static void sendNotification(String msg, String mobile) {

        String NexApiKey = [select Nexmo_Api_Key__c from Nexmo_SMS__c limit 1].Nexmo_Api_Key__c;
        String NexApiSecret = [select Nexmo_Api_Secret__c from Nexmo_SMS__c limit 1].Nexmo_Api_Secret__c;
        String NexFrom = ''; //[select From__c from Nexmo_SMS__c limit 1].From__c;
        String NexTo = mobile; 
		
        //String  valTo = '917073111585,917073111555,917073111666,917073111777';
		//String[]  strTo =  valTo.spilt(',');
        if(NexApiKey != '' && NexApiSecret != '' && NexTo != null){
            //for(String strTo : NexTo.split(',')){
            HttpRequest req1 = new HttpRequest();
             HttpResponse res1 = new HttpResponse();
             Http http1 = new Http();    
             req1.setEndpoint('https://rest.nexmo.com/account/numbers?'+'api_key='+NexApiKey+'&api_secret='+NexApiSecret);
             req1.setMethod('GET');
             req1.setHeader('Content-Type', 'application/json');
             req1.setHeader('Accept', 'application/json');
            try {
                    res1 = http1.send(req1);
                	System.debug(res1.getBody());
                Integer count = 0;
                JSONParser parser = JSON.createParser(res1.getBody());
                while (parser.nextToken() != null && count == 0) {
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
                        String fieldName = parser.getText();
                        parser.nextToken();
                        if(fieldName == 'msisdn') {
                            NexFrom = parser.getText();
                            count = count+1;
                        } 
                    }
                }
			} catch(System.CalloutException e) {
                System.debug('Callout error: '+ e);
                System.debug(res1.toString());
            }
            
            	HttpRequest req = new HttpRequest();
                HttpResponse res = new HttpResponse();
                Http http = new Http();
                //req.setEndpoint('http://staging.advaiya.us/testapi/testcall.php');
                req.setEndpoint('https://rest.nexmo.com/sms/json?'+'api_key='+NexApiKey+'&api_secret='+NexApiSecret+'&from='+EncodingUtil.urlEncode(NexFrom, 'UTF-8')+'&to='+EncodingUtil.urlEncode(NexTo, 'UTF-8')+'&text='+EncodingUtil.urlEncode(msg, 'UTF-8'));
                req.setMethod('GET');
                //req.setBody('api_key='+NexApiKey+'&api_secret='+NexApiSecret+'&from='+EncodingUtil.urlEncode(frm, 'UTF-8')+'&to='+EncodingUtil.urlEncode(to, 'UTF-8')+'&text='+EncodingUtil.urlEncode('Test SMS', 'UTF-8'));
                req.setCompressed(true); // otherwise we hit a limit of 32000
            if(NexFrom != '' && NexFrom != null){
                try {
                    res = http.send(req);
                } catch(System.CalloutException e) {
                    System.debug('Callout error: '+ e);
                    System.debug(res.toString());
                }
            }
            //}
            System.debug(res.toString());
        }    
    }
}