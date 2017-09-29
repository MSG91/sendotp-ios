SendOTP iOS Usage Documentation

Download SendOTPFramework.framework
Import SendOTPFramework.framework in your project.

Go to the project target  -> General -> Embeded Binaries then add the SendOTPFramework in it.

-Login or create account at MSG91 to use sendOTP services.
Get your authKey

After login at MSG91 follow below steps to get your authkey

-Select API option available on panel.
-If you are first time user then generate new authkey.




----------------------------------------ObjectiveC--------------------------------------------

Go to your class which is going to call the SendOTP 


Import the following ->

#import <SendOTPFramework/AuthenticationViewController.h>

Accept the following delegates -  <SendOTPAuthenticationViewControllerDelegate>

SendOTPAuthenticationViewControllerDelegate

Call the AuthenticationViewController using following code.


        NSString *frameworkDirPath = [[NSBundle mainBundle] privateFrameworksPath];
        NSString *frameworkBundlePath = [frameworkDirPath stringByAppendingPathComponent:@"SendOTPFramework.framework"];
        NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
        AuthenticationViewController *authenticationViewController = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:frameworkBundle];

        // Mandatory auth key......
        authenticationViewController.authkey = @"171178AUdY9sBsHp599c5f2b";

        authenticationViewController.navBarColor = [UIColor blueColor];

        authenticationViewController.navBarColor = [UIColor colorWithRed:30/255.0f green:118/255.0f blue:186/255.0f alpha:1];

        // set navbar title color
        authenticationViewController.navBarTitleColor = [UIColor whiteColor];

        // set company logo
        authenticationViewController.companyImage = [UIImage imageNamed:@"defaultLogo"];

        // set custom message here with ##OTP##
        authenticationViewController.customMessage = @"Your verification code is ##OTP##.";

        // set the sender id here
        authenticationViewController.senderId = @"OTPSMS";

        // set access type here
        authenticationViewController.accessTypeShouldBeHTTP = false; // sets https by default
        [self presentViewController:authenticationViewController animated:YES completion:nil];


Implement following delegate methods-

        // Called when authentication is successfull.
        -(void)authenticationisSuccessfulForMobileNumber:(NSString *)mobNo withCountryCode:(NSString *)countryCode{
            NSLog(@"Success");
        }

// Called when authentication is Failed.

        -(void)authenticationisFailedForMobileNumber:(NSString *)mobNo withCountryCode:(NSString *)countryCode{
            NSLog(@"Failed");
        }

// Called when authentication is Cancelled.

        -(void)canceledAuthentication{
           
        }


----------------------------------------Swift3.0--------------------------------------------


Import the following ->
import SendOTPFramework

Accept the following delegates -  SendOTPAuthenticationViewControllerDelegate

Call the AuthenticationViewController using following code.

        let frameworkBundle = Bundle(identifier: "com.walkover.SendOTPFramework")
        let authViewControler :AuthenticationViewController = AuthenticationViewController.init(nibName: "AuthenticationViewController", bundle: frameworkBundle)
        authViewControler.delegate = self
        authViewControler.navBarColor = UIColor.blue

        // set navbar title color
        authViewControler.navBarTitleColor = UIColor.white

        //Set your auth key here
        authViewControler.authkey = "171178AUdY9sBsHp599c5f2b"

        // set company logo
        authViewControler.companyImage = #imageLiteral(resourceName: "defaultLogo.png")

        // set custom message here with ##OTP##
        authViewControler.customMessage = "Your verification code is ##OTP##."

        // set the sender id here
        authViewControler.senderId = "OTPSMS"

        // set access type here
        authViewControler.accessTypeShouldBeHTTP = false // sets https by default

        self.present(authViewControler, animated: true, completion: nil)

        
        Implement following delegate methods-

// Called when authentication is successfull.

        func authenticationisSuccessful(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Success")
        }

// Called when authentication is failed.

        func authenticationisFailed(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Failure")
        }

// Called when authentication is Cancelled.

        func canceledAuthentication() {
        print("Failure")
        }

