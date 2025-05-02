 private static final String accountSid  = 'AC8eb7a0f2bbb7e80e7d9cce50113134ea';
    private static final String authToken  = '97a8c72c860498d9a4cce5871fefb6d2';
    private static final String fromPhone  = '+13254425755'; // Your Twilio number
//private static final String fromPhone  = '+16825519053'; // Your Twilio number
String toPhone = '+12148437289';  // Recipient's phone number
String messageBody = 'Hello from Salesforce Apex! This is a test SMS via Twilio.';
String endpoint = 'https://api.twilio.com/2010-04-01/Accounts/' + accountSid + '/Messages.json';

HttpRequest req = new HttpRequest();
req.setEndpoint(endpoint);
req.setMethod('POST');
req.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(
    Blob.valueOf(accountSid + ':' + authToken)
));
req.setHeader('Content-Type', 'application/x-www-form-urlencoded');

String body = 'To=' + EncodingUtil.urlEncode(toPhone, 'UTF-8') +
              '&From=' + EncodingUtil.urlEncode(fromPhone, 'UTF-8') +
              '&Body=' + EncodingUtil.urlEncode(messageBody, 'UTF-8');

req.setBody(body);

Http http = new Http();
HttpResponse res = http.send(req);

System.debug('Twilio Response Status: ' + res.getStatus());
System.debug('Twilio Response Body: ' + res.getBody());
