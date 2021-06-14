public class TwilioVerifyVerificationCheckRequest {

    @AuraEnabled @InvocableVariable(label='Service Sid' description='The SID of the verification Service to create the resource under.' required=true)
    public String ServiceSid;
    
    @AuraEnabled @InvocableVariable(label='Code' description='The 4-10 character string being verified.' required=true)
    public String Code;
    
    @AuraEnabled @InvocableVariable(label='To' description='The phone number or email to verify. Either this parameter or the verification_sid must be specified. Phone numbers must be in E.164 format.' required=false)
    public String To;
    
    @AuraEnabled @InvocableVariable(label='Verification Sid' description='A SID that uniquely identifies the Verification Check. Either this parameter or the to phone number/email must be specified.' required=false)
    public String VerificationSid;
}