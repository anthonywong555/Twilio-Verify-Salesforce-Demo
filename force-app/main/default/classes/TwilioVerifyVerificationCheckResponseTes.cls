@isTest
private class TwilioVerifyVerificationCheckResponseTes {

    @isTest
    static void testParse() {
        String json = '{"status":"approved","date_updated":"2021-06-14T14:28:45Z","account_sid":"ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","to":"+15555555555","valid":true,"sid":"VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","date_created":"2021-06-14T14:27:49Z","service_sid":"VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","channel":"sms"}';

        TwilioVerifyVerificationCheckResponse response;

        Test.startTest();
            response = TwilioVerifyVerificationCheckResponse.parse(json);
        Test.stopTest();

        System.assertNotEquals(null, response, 'We expect the response to be not null.');
        System.assertEquals('approved', response.status, 'We expect the status to be `approved`.');
    }
}
