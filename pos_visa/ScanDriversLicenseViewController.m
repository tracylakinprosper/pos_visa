//
//  ScanDriversLicenseViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/13/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "ScanDriversLicenseViewController.h"
#import "EditPersonalInfoViewController.h"
#import "EditPersonalInfoTableViewCell.h"
#import "PersonalData.h"

#import <Netverify/Netverify.h>


#define EditPersonalInfoStoryboardID

@interface ScanDriversLicenseViewController () <NetverifyViewControllerDelegate>

@property (nonatomic, strong) NetverifyViewController *netverifyViewController;

@end

@implementation ScanDriversLicenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self createNetverifyController];
    [self startNetverifySDK:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




#pragma mark - Jumio NetVerify

- (IBAction) startNetverifySDK: (id) sender {
    //To show the SDK, call the method below within your ViewController.
    [self presentViewController: self.netverifyViewController animated:YES completion:nil];
}


NSString * kJumioMerchantAPIToken  = @"d7c2acf3-2dfc-4fe7-b5f1-3dc841a97881";
NSString * kJumioMerchantAPISecret = @"6IIxS8gFBJcuQxXMd9hJKaGcDHEV0LQB";

/**
 * Present the NetverifyViewController
 */
- (void) createNetverifyController{
    //Perform the following call as soon as your app’s view controller is initialized. Create the NetverifyViewController instance by providing your  merchant API token, merchant API secret, a delegate object and the data center.
    self.netverifyViewController = [[NetverifyViewController alloc] initWithMerchantApiToken: kJumioMerchantAPIToken
                                                                                   apiSecret: kJumioMerchantAPISecret
                                                                                    delegate: self
                                                                                  dataCenter: JumioDataCenterUS];

//    self.netverifyViewController = [[NetverifyViewController alloc] initWithMerchantApiToken: @"d7c2acf3-2dfc-4fe7-b5f1-3dc841a97881"
//                                                                                   apiSecret: @"6IIxS8gFBJcuQxXMd9hJKaGcDHEV0LQB"
//                                                                                    delegate: self
//                                                                                  dataCenter: JumioDataCenterUS];

    //You can specify issuing country (ISO 3166-1 alpha 3 country code) and ID type or let the user choose them during the verification process.
    self.netverifyViewController.preselectedCountry = @"USA";
    self.netverifyViewController.preselectedDocumentType = NVDocumentTypeDriverLicense;
    
    //When a selected country and ID type support more document variants (paper and plastic), you can specify the document variant in advance or let the user choose during the verification process.
    //self.netverifyViewController.preselectedDocumentVariant = NVDocumentVariantPlastic;
    
    //The merchant scan reference allows you to identify the scan (max. 100 characters). Note: Must not contain sensitive data like PII (Personally Identifiable Information) or account login.
    //self.netverifyViewController.merchantScanReference = @"YOURSCANREFERENCE";
    
    //Use the following property to identify the scan in your reports (max. 100 characters).
    //self.netverifyViewController.merchantReportingCriteria = @"YOURREPORTINGCRITERIA";
    
    //You can also set a customer identifier (max. 100 characters). Note: The customer ID should not contain sensitive data like PII (Personally Identifiable Information) or account login.
    //self.netverifyViewController.customerId = @"CUSTOMERID";
    
    //Callback URL (max. 255 characters) for the confirmation after the verification is completed. This setting overrides your Jumio merchant settings.
    //self.netverifyViewController.callbackUrl = @"https://www.example.com";
    
    //Enable ID verification to receive a verification status and verified data positions (see Callback chapter). Note: Not possible for accounts configured as Fastfill only.
    //self.netverifyViewController.requireVerification = YES;
    
    //You can enable face match during the ID verification for a specific transaction. This setting overrides your default Jumio merchant settings.
    //self.netverifyViewController.requireFaceMatch = YES;
    
    //Use the following property to pass first and last name to Fastfill for name match.
    //self.netverifyViewController.name = @"FIRSTNAME LASTNAME";
    
    //Use the following method to pass first and last name to the verification.
    //[self.netverifyViewController setFirstName: @"FIRSTNAME" lastName: @"LASTNAME"];
    
    //Disable flag in scanView by setting this property to NO
    //self.netverifyViewController.showFlagOnInfoBar = NO;
    
    //Set the default camera position
    //self.netverifyViewController.cameraPosition = JumioCameraPositionFront;
    
    //Enable data extraction from visa documents
    //Note: Only possible for accounts configured as Fastfill.
    //self.netverifyViewController.enableVisa = YES;
    
    //Localizing labels
    //All label texts and button titles can be changed and localized using the Localizable-Netverify.strings file. Just adapt the values to your required language and use this file in your app.
    
    //Customizing look and feel
    //The SDK can be customized via UIAppearance to fit your application’s look and feel.
    //Please note, that only the below listed UIAppearance selectors are supported and taken into consideration. Experimenting with other UIAppearance or not UIAppearance selectors may cause unexpected behaviour or crashes both in the SDK or in your application. This is best avoided.
    
    // - Submit button: title color and background color selectors
    
    //[[NetverifySubmitButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setBackgroundColor:[UIColor blueColor] forState:UIControlStateNormal];
    //[[NetverifySubmitButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setBackgroundColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    //[[NetverifySubmitButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setBackgroundColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    //[[NetverifySubmitButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[[NetverifySubmitButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    //[[NetverifySubmitButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
    // - Navigation bar: tint color, title color, title image
    
    //[[UINavigationBar appearanceWhenContainedIn:[NetverifyViewController class], nil] setTintColor:[UIColor yellowColor]];
    
    //[[UINavigationBar appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    //[[NetverifyNavigationBarTitleImageView appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleImage:[UIImage imageNamed:@"<your-netverify-navigation-bar-title-image>"]];
    
    // - Navigation bar background color
    
    //[[UINavigationBar appearanceWhenContainedIn:[NetverifyViewController class], nil] setBarTintColor:[UIColor redColor]];
    
    // - Info Bar Text Color
    
    //[[NetverifyInfoBarLabel appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleColor:[UIColor yellowColor]];
    
    // - Background Image
    
    //[[NetverifyBackgroundImageView appearanceWhenContainedIn:[NetverifyViewController class], nil] setBackgroundImage:[UIImage imageNamed:@"<your-netverify-navigation-bar-title-image>"]];
    
    // - Submission Text Color
    
    //[[NetverifySubmissionTextView appearanceWhenContainedIn:[NetverifyViewController class], nil] setTextTintColor:[UIColor greenColor]];
    
    // - Help Button
    
    //[[NetverifyHelpButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //[[NetverifyHelpButton appearanceWhenContainedIn:[NetverifyViewController class], nil] setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    //You can get the current SDK version using the method below.
    //NSLog(@"%@", [self.netverifyViewController sdkVersion]);
}

#pragma mark - NetverifyViewControllerDelegate

/**
 * Implement the following delegate method for SDK initialization.
 * @param netverifyViewController The NetverifyViewController
 **/
- (void) netverifyViewControllerDidFinishInitializing: (NetverifyViewController*) netverifyViewController {
    NSLog(@"NetverifyViewController did finish initializing");
}

/**
 * Implement the following delegate method for successful scans.
 * Dismiss the SDK view in your app once you received the result.
 * @param documentData The NetverifyDocumentData of the scanned document
 * @param scanReference The scanReference of the scan attempt
 **/
- (void) netverifyViewController:(NetverifyViewController *)netverifyViewController didFinishWithDocumentData:(NetverifyDocumentData *)documentData scanReference:(NSString *)scanReference {
    NSLog(@"NetverifyViewController finished successfully with scan reference: %@", scanReference);
    
    //Dismiss the SDK
    [self dismissViewControllerAnimated: YES completion: nil];
    
    NSString *selectedCountry = documentData.selectedCountry;
    NVDocumentType selectedDocumentType = documentData.selectedDocumentType;
    NSString *documentTypeStr;
    switch (selectedDocumentType) {
        case NVDocumentTypeUnknown:
            documentTypeStr = @"Unknown";
            break;
        case NVDocumentTypeDriverLicense:
            documentTypeStr = @"DL";
            break;
        case NVDocumentTypeIdentityCard:
            documentTypeStr = @"ID";
            break;
        case NVDocumentTypePassport:
            documentTypeStr = @"PP";
            break;
        default:
            break;
    }
    
    //id
    NSString *idNumber = documentData.idNumber;
    NSString *personalNumber = documentData.personalNumber;
    NSDate *issuingDate = documentData.issuingDate;
    NSDate *expiryDate = documentData.expiryDate;
    NSString *issuingCountry = documentData.issuingCountry;
    NSString *optionalData1 = documentData.optionalData1;
    NSString *optionalData2 = documentData.optionalData2;
    
    //person
    NSString *lastName = documentData.lastName;
    NSString *firstName = documentData.firstName;
    NSString *middleName = documentData.middleName;
    NSDate *dateOfBirth = documentData.dob;
    NVGender gender = documentData.gender;
    NSString *genderStr;
    switch (gender) {
        case NVGenderUnknown:
            genderStr = @"Unknown";
            break;
        case NVGenderF:
            genderStr = @"female";
            break;
        case NVGenderM:
            genderStr = @"male";
            break;
        default:
            break;
    }
    NSString *originatingCountry = documentData.originatingCountry;
    
    //address
    NSString *street = documentData.street;
    NSString *city = documentData.city;
    NSString *state = documentData.state;
    NSString *postalCode = documentData.postalCode;
    
    // Raw MRZ data
    NetverifyMrzData *mrzData = documentData.mrzData;
    
    //name match
    BOOL nameMatch = documentData.nameMatch;
    NSInteger nameDistance = documentData.nameDistance;
    
    //face capture
    BOOL livenessDetected = documentData.livenessDetected;
    
    NSMutableString *message = [NSMutableString stringWithFormat:@"Selected Country: %@", selectedCountry];
    
    [message appendFormat:@"\nDocument Type: %@", documentTypeStr];
    [message appendFormat:@"\nID Number: %@", idNumber];
    if (personalNumber) [message appendFormat:@"\nPersonal Number: %@", personalNumber];
    if (issuingDate) [message appendFormat:@"\nIssuing Date: %@", issuingDate];
    if (expiryDate) [message appendFormat:@"\nExpiry Date: %@", expiryDate];
    if (issuingCountry) [message appendFormat:@"\nIssuing Country: %@", issuingCountry];
    if (optionalData1) [message appendFormat:@"\nOptional Data 1: %@", optionalData1];
    if (optionalData2) [message appendFormat:@"\nOptional Data 2: %@", optionalData2];
    if (lastName) [message appendFormat:@"\nLast Name: %@", lastName];
    if (firstName) [message appendFormat:@"\nFirst Name: %@", firstName];
    if (middleName) [message appendFormat:@"\nMiddle Name: %@", middleName];
    if (dateOfBirth) [message appendFormat:@"\ndob: %@", dateOfBirth];
    [message appendFormat:@"\nGender: %@", genderStr];
    if (originatingCountry) [message appendFormat:@"\nOriginating Country: %@", originatingCountry];
    if (street) [message appendFormat:@"\nStreet: %@", street];
    if (city) [message appendFormat:@"\nCity: %@", city];
    if (state) [message appendFormat:@"\nState: %@", state];
    if (postalCode) [message appendFormat:@"\nPostal Code: %@", postalCode];
    if (mrzData) [message appendFormat:@"\nMRZ Data: %@", mrzData];
    [message appendFormat:@"\nName Match: %u", nameMatch];
    [message appendFormat:@"\nName Distance: %ld", (long)nameDistance];
    [message appendFormat:@"\nLiveness Detected: %u", livenessDetected];
    
//    NSLog(@"%@",message);
//    [self showAlertWithTitle:@"Netverify Mobile SDK" message:message];
    
    PersonalData * personalData = [[PersonalData alloc] init];
    personalData.firstName      = documentData.firstName;
    personalData.lastName       = documentData.lastName;
    personalData.middleInitial  = documentData.middleName;
    personalData.suffix         = @"";
    personalData.apt            = @"";
    personalData.street         = documentData.street;
    personalData.city           = documentData.city;
    personalData.state          = documentData.state;
    personalData.postalCode     = documentData.postalCode;


    [self transitionToEditPersonalInfo:personalData];
    
}

NSString * const kEditPersonalInfoStoryboardID = @"EditPersonalInfoStoryboardID";

- (void) transitionToEditPersonalInfo:(PersonalData *) personalData
{
    EditPersonalInfoViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:@"EditPersonalInfoStoryboardID"];
    
    controller.personalData = personalData;
    
    [self.navigationController pushViewController:controller animated:YES];
}


/**
 * Implement the following delegate method for successful scans and user cancellation notifications. Dismiss the SDK view in your app once you received the result.
 * @param netverifyViewController The NetverifyViewController
 * @param error The returned Errors
 * @param scanReference The scanReference of the scan attempt
 **/
- (void) netverifyViewController:(NetverifyViewController *)netverifyViewController didCancelWithError:(NSError *)error scanReference:(NSString *)scanReference {
    NSLog(@"NetverifyViewController cancelled with error: %@, scanReference: %@", error.localizedDescription, scanReference);
    //Dismiss the SDK
    [self dismissViewControllerAnimated: YES completion: nil];
}

- (void) showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}


@end
