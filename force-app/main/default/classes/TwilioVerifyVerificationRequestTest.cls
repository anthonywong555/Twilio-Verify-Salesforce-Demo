@isTest
private class TwilioVerifyVerificationRequestTest {
    
    @isTest
    static void testEmpty() {
        TwilioVerifyVerificationRequest request;
        
        Test.startTest();
            request = new TwilioVerifyVerificationRequest();
        Test.stopTest();

        System.assertNotEquals(null, request, 'We expect the object to not be null.');
    }

    @isTest
    static void testServiceSidAndToAndChannel() {
        String ServiceSid = 'VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        String To = '+15555555555';
        String Channel = 'sms';

        TwilioVerifyVerificationRequest request;
        
        Test.startTest();
            request = new TwilioVerifyVerificationRequest(ServiceSid, To, Channel);
        Test.stopTest();

        System.assertNotEquals(null, request, 'We expect the object to not be null.');
        System.assertEquals(ServiceSid, request.ServiceSid, 'We expect the service sid to match.');
        System.assertEquals(To, request.To, 'We expect the `to` to match.');
        System.assertEquals(To, request.To, 'We expect the channel to match.');
    }
}
