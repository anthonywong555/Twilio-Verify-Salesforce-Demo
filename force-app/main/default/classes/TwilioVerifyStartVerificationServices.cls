public with sharing class TwilioVerifyStartVerificationServices {

    public static final String TWILIO_VERIFY_NAMED_CREDENTIAL = 'Twilio_Verify';
    
    @InvocableMethod(
        label='Start Verification' 
        description='Kick off Verification Process.'
    	category='Twilio Verify'
    )
    public static List<TwilioVerifyVerificationResponse> startVerification(List<TwilioVerifyVerificationRequest> requests) {
        List<TwilioVerifyVerificationResponse> responses = new List<TwilioVerifyVerificationResponse>();
        
        for(TwilioVerifyVerificationRequest aRequest : requests) {
            TwilioVerifyVerificationResponse aResponse = startVerification(aRequest);
            responses.add(aResponse);
        }
        
        return responses;
    }
    
    public static TwilioVerifyVerificationResponse startVerification(TwilioVerifyVerificationRequest request) {
        String uri = generateURI(request);
        String payload = generatePayload(request);
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(uri);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody(payload);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        TwilioVerifyVerificationResponse result = (TwilioVerifyVerificationResponse)JSON.deserialize(res.getBody(), TwilioVerifyVerificationResponse.class);
        return result;
    }
    
    @TestVisible
    private static String generateURI(TwilioVerifyVerificationRequest request) {
        String uri = Test.isRunningTest() ? 'http://callout.' + TWILIO_VERIFY_NAMED_CREDENTIAL + '.com/Verifications' : 'callout:' + TWILIO_VERIFY_NAMED_CREDENTIAL + '/v2/Services/' + request.ServiceSid + '/Verifications';
        return uri;
    }
    
    @TestVisible
    private static String generatePayload(TwilioVerifyVerificationRequest request) {
        Map<String, Object> requestInstance = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(request));
        requestInstance.remove('ServiceSid');
        
        Set<String> keys = requestInstance.keyset();
        List<String> values = new List<String>();
        for(String aKey : keys) {
            String value = (String)requestInstance.get(aKey);
            
            if(value != null) {
                values.add(aKey + '=' + EncodingUtil.urlEncode(value,'UTF-8'));
            }
        }
        
       	String payload = String.join(values, '&');
        return payload;
    }
}