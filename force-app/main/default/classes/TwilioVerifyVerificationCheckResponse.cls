public class TwilioVerifyVerificationCheckResponse {

    /**
     * Standard Parameters
     */
    
    @AuraEnabled @InvocableVariable(label='Sid' description='The unique string that we created to identify the VerificationCheck resource.' required=true)
    public String sid;
    
    @AuraEnabled @InvocableVariable(label='Service Sid' description='The SID of the Service the resource is associated with.' required=true)
	public String service_sid;
    
    @AuraEnabled @InvocableVariable(label='Account Sid' description='The SID of the Account that created the VerificationCheck resource.' required=true)
	public String account_sid;
    
    @AuraEnabled @InvocableVariable(label='To' description='The phone number or email being verified. Phone numbers must be in E.164 format.' required=true)
	public String to;
    
    @AuraEnabled @InvocableVariable(label='Channel' description='The verification method to use. One of: email, sms or call.' required=true)
	public String channel;
    
    @AuraEnabled @InvocableVariable(label='Status' description='The status of the verification. Can be: pending, approved, or canceled.' required=true)
	public String status;
    
    @AuraEnabled @InvocableVariable(label='Service Sid' description='The ISO 8601 date and time in GMT when the Verification Check resource was created.' required=true)
	public String date_created;
    
    @AuraEnabled @InvocableVariable(label='Service Sid' description='The ISO 8601 date and time in GMT when the Verification Check resource was last updated.' required=true)
	public String date_updated;
    
    /**
     * Error Parameters
     */
    
    @AuraEnabled @InvocableVariable(label='Error Code' description='Error Code' required=false)
    public String code;
    
    @AuraEnabled @InvocableVariable(label='Message' description='Error Message.' required=false)
    public String message;

	public static TwilioVerifyVerificationCheckResponse parse(String json) {
		return (TwilioVerifyVerificationCheckResponse) System.JSON.deserialize(json, TwilioVerifyVerificationCheckResponse.class);
	}
}