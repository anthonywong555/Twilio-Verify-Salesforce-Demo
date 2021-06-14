public class TwilioVerifyCheckVerificationServices {

    @InvocableMethod(
        label='Check Verification' 
        description='Check Verification Code.'
    	category='Twilio Verify'
    )
    public static List<TwilioVerifyVerificationCheckResponse> checkVerification(List<TwilioVerifyVerificationCheckRequest> requests) {
        List<TwilioVerifyVerificationCheckResponse> responses = new List<TwilioVerifyVerificationCheckResponse>();
        
        for(TwilioVerifyVerificationCheckRequest aRequest : requests) {
            TwilioVerifyVerificationCheckResponse aResponse = checkVerification(aRequest);
            responses.add(aResponse);
        }
        
        return responses;
    }
    
    public static TwilioVerifyVerificationCheckResponse checkVerification(TwilioVerifyVerificationCheckRequest request) {
        String uri = generateURI(request);
        System.debug(uri);
        
        String payload = generatePayload(request);
        System.debug(payload);
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(uri);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody(payload);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        TwilioVerifyVerificationCheckResponse result = (TwilioVerifyVerificationCheckResponse)JSON.deserialize(res.getBody(), TwilioVerifyVerificationCheckResponse.class);
        return result;
    }
    
    @TestVisible
    private static String generateURI(TwilioVerifyVerificationCheckRequest request) {
        String uri = Test.isRunningTest() ? 'http://callout.' + TwilioVerifyStartVerificationServices.TWILIO_VERIFY_NAMED_CREDENTIAL + '.com/VerificationCheck' : 'callout:' + TwilioVerifyStartVerificationServices.TWILIO_VERIFY_NAMED_CREDENTIAL + '/v2/Services/' + request.ServiceSid + '/VerificationCheck';
        return uri;
    }
    
    @TestVisible
    private static String generatePayload(TwilioVerifyVerificationCheckRequest request) {
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