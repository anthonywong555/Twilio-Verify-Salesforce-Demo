public class TwilioVerifyVerificationResponse {
    
    /**
     * Standard Parameters
     */
    
    @AuraEnabled @InvocableVariable(label='Sid' description='The unique string that we created to identify the Verification resource.' required=true)
	public String sid;
    
    @AuraEnabled @InvocableVariable(label='Service Sid' description='The SID of the Service the resource is associated with.' required=true)
	public String service_sid;
    
	@AuraEnabled @InvocableVariable(label='Account Sid' description='The SID of the Account that created the Verification resource.' required=true)
    public String account_sid;
    
	@AuraEnabled @InvocableVariable(label='To' description='The phone number or email being verified. Phone numbers must be in E.164 format.' required=true)
    public String to;
    
	@AuraEnabled @InvocableVariable(label='Channel' description='The verification method used. One of: email, sms or call.' required=true)
    public String channel;
	
    @AuraEnabled @InvocableVariable(label='Status' description='The status of the verification. One of: pending, approved, or canceled.' required=true)
    public String status;
	
    @AuraEnabled @InvocableVariable(label='Valid' description='Use "status" instead. Legacy property indicating whether the verification was successful.' required=true)
    public Boolean valid;
	
    @AuraEnabled @InvocableVariable(label='Date Created' description='The date and time in GMT when the resource was created specified in RFC 2822 format.' required=true)
    public String date_created;
	
    @AuraEnabled @InvocableVariable(label='Date Updated' description='The date and time in GMT when the resource was last updated specified in RFC 2822 format.' required=true)
    public String date_updated;
	
    @AuraEnabled @InvocableVariable(label='URL' description='The absolute URL of the Verification resource.' required=true)
    public String url;
    
    /**
     * Error Parameters
     */
    
    @AuraEnabled @InvocableVariable(label='Error Code' description='Error Code' required=false)
    public String code;
    
    @AuraEnabled @InvocableVariable(label='Message' description='Error Message.' required=false)
    public String message;

	public static TwilioVerifyVerificationResponse parse(String json) {
		return (TwilioVerifyVerificationResponse) System.JSON.deserialize(json, TwilioVerifyVerificationResponse.class);
	}
}