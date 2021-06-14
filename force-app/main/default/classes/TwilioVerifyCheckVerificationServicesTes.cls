@isTest
private with sharing class TwilioVerifyCheckVerificationServicesTes {
    
    /**
     * Global Variables
     */
    static final String TEST_VERIFY_SERVICE_SID = 'VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
    static final String TEST_VERIFY_CODE = '1234';
    static final String TEST_PHONE_NUMBER = '+15555555555';

    static final TwilioVerifyVerificationCheckRequest request = new 
        TwilioVerifyVerificationCheckRequest(
            TEST_VERIFY_SERVICE_SID,
            TEST_VERIFY_CODE,
            TEST_PHONE_NUMBER
        );

    private class TwilioVerifyCheckHttpResponseGenerator implements HttpCalloutMock {
        
        public HTTPResponse respond(HTTPRequest req) {
            String uri = req.getEndpoint();
            String body = req.getBody();

            String expectedURI = TwilioVerifyCheckVerificationServices.generateURI(request);
            String expectedPayload = TwilioVerifyCheckVerificationServices.generatePayload(request);
            
            System.assertEquals(expectedURI, uri, 'We expect that URL should match.');
        	System.assertEquals('POST', req.getMethod(), 'We expect that the URL Method is Post.');
            
            HttpResponse response = new HttpResponse();

            if(body == expectedPayload) {
                response.setHeader('Content-Type', 'application/json');
                response.setBody('{"status":"approved","date_updated":"2021-06-14T14:28:45Z","account_sid":"ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","to":"+15555555555","valid":true,"sid":"VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","date_created":"2021-06-14T14:27:49Z","service_sid":"VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","channel":"sms"}');
                response.setStatusCode(200);
            } else {
                response.setHeader('Content-Type', 'application/json');
                response.setBody('{"status":"pending","date_updated":"2021-06-14T14:28:45Z","account_sid":"ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","to":"+15555555555","valid":true,"sid":"VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","date_created":"2021-06-14T14:27:49Z","service_sid":"VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","channel":"sms"}');
                response.setStatusCode(200);
            }

            return response;
        }
	}

    static void setup() {
        // Generate the Mock
        Test.setMock(HttpCalloutMock.class, new TwilioVerifyCheckHttpResponseGenerator());
    }

    @isTest
    static void testCheckVerificationListWithValidCode() {
        setup();

        List<TwilioVerifyVerificationCheckRequest> requests = 
            new List<TwilioVerifyVerificationCheckRequest>{request};
        List<TwilioVerifyVerificationCheckResponse> responses;
        
        Test.startTest();
            responses = TwilioVerifyCheckVerificationServices.checkVerification(requests);
        Test.stopTest();

        System.assertEquals(requests.size(), responses.size(), 'We expect the number of requests equal to the number of responses.');
        
        for(TwilioVerifyVerificationCheckResponse response : responses) {
            System.assertEquals('approved', response.status, 'We expect the Verify\'s Status should be approved.');
        }
    }

    @isTest
    static void testCheckVerificationWithValidCode() {
        setup();

        TwilioVerifyVerificationCheckResponse response;
        
        Test.startTest();
            response = TwilioVerifyCheckVerificationServices.checkVerification(request);
        Test.stopTest();

        System.assertEquals('approved', response.status, 'We expect the Verify\'s Status should be approved.');
    }

    @isTest
    static void testCheckVerificationWithInvalidCode() {
        setup();

        TwilioVerifyVerificationCheckRequest wrongCodeRequest = new 
            TwilioVerifyVerificationCheckRequest(
                TEST_VERIFY_SERVICE_SID,
                '5678',
                TEST_PHONE_NUMBER
            );

        TwilioVerifyVerificationCheckResponse response;
        
        Test.startTest();
            response = TwilioVerifyCheckVerificationServices.checkVerification(wrongCodeRequest);
        Test.stopTest();

        System.assertEquals('pending', response.status, 'We expect the Verify\'s Status should be pending.');
    }
}
