public class TwilioVerifyVerificationRequest {

    @AuraEnabled @InvocableVariable(label='Service Sid' description='The SID of the verification Service to create the resource under.' required=true)
    public String ServiceSid;
    
    @AuraEnabled @InvocableVariable(label='To' description='The phone number or email to verify. Phone numbers must be in E.164 format.' required=true)
    public String To;
    
    @AuraEnabled @InvocableVariable(label='Channel' description='The verification method to use. Can be: email, sms or call.' required=true)
    public String Channel;
    
    @AuraEnabled @InvocableVariable(label='Custom Friendly Name' description='A custom user defined friendly name that overwrites the existing one in the verification message.' required=false)
    public String CustomFriendlyName;
    
    @AuraEnabled @InvocableVariable(label='Send Digits' description='The digits to send after a phone call is answered, for example, to dial an extension. For more information, see the Programmable Voice documentation of sendDigits.' required=false)
    public String SendDigits;
    
    @AuraEnabled @InvocableVariable(label='Locale' description='The locale to use for the verification SMS or call. Can be: af, ar, ca, cs, da, de, el, en, en-GB, es, fi, fr, he, hi, hr, hu, id, it, ja, ko, ms, nb, nl, pl, pt, pr-BR, ro, ru, sv, th, tl, tr, vi, zh, zh-CN, or zh-HK.' required=false)
    public String Locale;
    
	@AuraEnabled @InvocableVariable(label='Custom Code' description='A pre-generated code to use for verification. The code can be between 4 and 10 characters, inclusive.' required=false)
    public String CustomCode;

    public TwilioVerifyVerificationRequest() {}

    public TwilioVerifyVerificationRequest(String ServiceSid, String To, String Channel) {
        this.ServiceSid = ServiceSid;
        this.To = To;
        this.Channel = Channel;
    }
}