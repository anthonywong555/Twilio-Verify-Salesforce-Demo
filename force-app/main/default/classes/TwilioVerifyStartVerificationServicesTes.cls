@isTest
private class TwilioVerifyStartVerificationServicesTes {

    /**
     * Global Variables
     */
    static final String TEST_VERIFY_SERVICE_SID = 'VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
    static final String TEST_PHONE_NUMBER = '+15555555555';
    static final String TEST_CHANNEL = 'sms';
    static final Set<String> VALID_CHANNELS = new Set<String>{'sms', 'call', 'email'};

    static TwilioVerifyVerificationRequest request = new 
        TwilioVerifyVerificationRequest(
            TEST_VERIFY_SERVICE_SID,
            TEST_PHONE_NUMBER,
            TEST_CHANNEL
        );

    private class TwilioVerifyStartHttpResponseGenerator implements HttpCalloutMock {
        
        public HTTPResponse respond(HTTPRequest req) {
            String uri = req.getEndpoint();
            String body = req.getBody();

            String expectedURI = TwilioVerifyStartVerificationServices.generateURI(request);
            String expectedPayload = TwilioVerifyStartVerificationServices.generatePayload(request);
            
            System.assertEquals(expectedURI, uri, 'We expect that URL should match.');
        	System.assertEquals('POST', req.getMethod(), 'We expect that the URL Method is Post.');
            
            HttpResponse response = new HttpResponse();

            if(VALID_CHANNELS.contains(request.Channel)) {
                response.setHeader('Content-Type', 'application/json');
                response.setBody('{"status":"pending","date_updated":"2021-06-14T14:33:53Z","account_sid":"ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","to":"+15555555555","valid":false,"url":"https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Verifications/VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","sid":"VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","date_created":"2021-06-14T14:33:53Z","service_sid":"VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","channel":"sms"}');
                response.setStatusCode(201);
            } else {
                response.setHeader('Content-Type', 'application/json');
                response.setBody('{"code":60200,"message":"Invalid parameter: Channel","more_info":"https://www.twilio.com/docs/errors/60200","status":400}');
                response.setStatusCode(401);
            }

            return response;
        }
	}

    static void setup() {
        // Generate the Mock
        Test.setMock(HttpCalloutMock.class, new TwilioVerifyStartHttpResponseGenerator());
    }
    
    @isTest
    static void testStartVerificationList() {
        setup();

        List<TwilioVerifyVerificationRequest> requests = new List<TwilioVerifyVerificationRequest>{request}; 

        List<TwilioVerifyVerificationResponse> responses;
        
        Test.startTest();
            responses = TwilioVerifyStartVerificationServices.startVerification(requests);
        Test.stopTest();

        System.assertEquals(requests.size(), responses.size(), 'We expect the number of requests equal to the number of responses.');

        for(TwilioVerifyVerificationResponse response: responses) {
            System.assertEquals('pending', response.status, 'We expect the Verify\'s Status should be pending.');
        }
    }

    @isTest
    static void testStartVerification() {
        setup();

        TwilioVerifyVerificationResponse response;
        
        Test.startTest();
            response = TwilioVerifyStartVerificationServices.startVerification(request);
        Test.stopTest();

        System.assertEquals('pending', response.status, 'We expect the Verify\'s Status should be pending.');
    }

    @isTest
    static void testStartVerificationWithWrongChannel() {
        setup();

        request = new 
        TwilioVerifyVerificationRequest(
            TEST_VERIFY_SERVICE_SID,
            TEST_PHONE_NUMBER,
            'phone'
        );

        TwilioVerifyVerificationResponse response;
        
        Test.startTest();
            response = TwilioVerifyStartVerificationServices.startVerification(request);
        Test.stopTest();

        System.assertEquals('60200', response.code, 'We expect the error code to match due to incorrect channel.');
    }
}