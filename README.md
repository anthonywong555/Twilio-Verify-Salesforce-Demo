# Twilio Verify Salesforce Demo

As part of Twilio's account security offerings, the Twilio Verify API makes it simple to add user verification to your web application. It supports codes sent via voice, SMS, and email.

![](./assets/Twilio-Verify-Demo.gif)

## Prerequisite

You will need the following:

- [Twilio Account](https://www.twilio.com/try-twilio)
- [Account SID and Auth Token](https://www.twilio.com/console)
- [Verify Service SID](https://www.twilio.com/console/verify/services)

## Getting Started
### Install

- Package Id: 04t5e000000lsIf
- [Production](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5e000000lsIf)
- [Sandbox](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t5e000000lsIf)

### Twilio Credentials

1. Go to Setup > Quick Find > Named Credentials.
2. Click on Twilio Verify.
3. Click Edit.
4. In the Username text field add your Twilio Account SID.
5. In the Password text field add your Twilio Auth Token.
6. Click Save.

### Verify Service

1. Go to Setup > Quick Find > Flows.
2. Click on Twilio Verify.
3. Under Toolbox, click Manager tab.
4. Under Variables, click VerifyServiceSID.
5. In the Default Value text field add your Verify Service SID.
6. Click Save.
7. Click Save As and Activate.