@isTest
private class TwilioVerifyVerificationResponseTest {

    @isTest
    static void testParse() {
        String json = '{"status":"pending","date_updated":"2021-06-14T14:33:53Z","account_sid":"ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","to":"+15555555555","valid":false,"url":"https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Verifications/VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","sid":"VEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","date_created":"2021-06-14T14:33:53Z","service_sid":"VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","channel":"sms"}';

        TwilioVerifyVerificationResponse response;

        Test.startTest();
            response = TwilioVerifyVerificationResponse.parse(json);
        Test.stopTest();

        System.assertNotEquals(null, response, 'We expect the response to be not null.');
        System.assertEquals('pending', response.status, 'We expect the status to be `pending`.');
    }
}