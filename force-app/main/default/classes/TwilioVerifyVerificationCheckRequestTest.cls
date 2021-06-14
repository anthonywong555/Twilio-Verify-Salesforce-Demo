@isTest
private class TwilioVerifyVerificationCheckRequestTest {

    /**
     * Global Variables
     */
    static final String TEST_VERIFY_SERVICE_SID = 'VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
    static final String TEST_VERIFY_CODE = '1234';
    static final String TEST_PHONE_NUMBER = '+15555555555';

    @isTest
    static void testEmpty() {
        TwilioVerifyVerificationCheckRequest request;
        
        Test.startTest();
            request = new TwilioVerifyVerificationCheckRequest();
        Test.stopTest();

        System.assertNotEquals(null, request, 'We expect the object to not be null.');
    }

    @isTest
    static void testServiceSidAndCode() {
        TwilioVerifyVerificationCheckRequest request;

        Test.startTest();
            request = new TwilioVerifyVerificationCheckRequest(
                TEST_VERIFY_SERVICE_SID,
                TEST_VERIFY_CODE
            );
        Test.stopTest();

        System.assertEquals(TEST_VERIFY_SERVICE_SID, request.ServiceSid, 'We expect the service sid to match.');
        System.assertEquals(TEST_VERIFY_CODE, request.Code, 'We expect the code to match.');
    }

    @isTest
    static void testServiceSidAndCodeAndTo() {
        TwilioVerifyVerificationCheckRequest request;

        Test.startTest();
            request = new TwilioVerifyVerificationCheckRequest(
                TEST_VERIFY_SERVICE_SID,
                TEST_VERIFY_CODE,
                TEST_PHONE_NUMBER
            );
        Test.stopTest();

        System.assertEquals(TEST_VERIFY_SERVICE_SID, request.ServiceSid, 'We expect the service sid to match.');
        System.assertEquals(TEST_VERIFY_CODE, request.Code, 'We expect the code to match.');
        System.assertEquals(TEST_PHONE_NUMBER, request.To, 'We expect the `to` to match.');
    }
}