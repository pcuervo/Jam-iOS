//
//  ViewController.m
//  Jam
//
//  Created by Chirag Sharma on 4/16/15.
//  Copyright (c) 2015 Chirag Sharma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInitialView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)loadInitialView{
    UIButton *facebookButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [facebookButton addTarget:self
               action:@selector(fbSignUpFunction)
     forControlEvents:UIControlEventTouchUpInside];
    [facebookButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
    facebookButton.frame = CGRectMake(80.0, 450, 160.0, 40.0);
    [self.view addSubview:facebookButton];
}

-(void)fbSignUpFunction
{
    OptionToCompleteYourProfileViewController *ovc = [[OptionToCompleteYourProfileViewController alloc] init];
    [self.navigationController pushViewController:ovc animated:YES];
    return;
    //[self showActivityIndicator:@"Loading..."];
//    Reachability *reach = [Reachability reachabilityForInternetConnection];
//    NetworkStatus netStatus = [reach currentReachabilityStatus];
//    if (netStatus == NotReachable)
//    {
//        [self hideActivityIndicator];
//        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Could not connect to the server, please check your internet connection !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alertView show];
//    }
//    else
//    {
        [FBSession.activeSession closeAndClearTokenInformation];
        
        NSArray *permissions=[[NSArray alloc]initWithObjects:@"email", @"user_likes", nil];
        [FBSession openActiveSessionWithReadPermissions:permissions
                                           allowLoginUI:YES
                                      completionHandler:^(FBSession *session, FBSessionState status, NSError *error)
         {
             
             if(error)
             {
                 //                     NSLog(@"error=%d   %hhd",(int)error.fberrorCategory,error.fberrorShouldNotifyUser);
                 if (error.fberrorCategory == FBErrorCategoryUserCancelled)
                 {
                     //[self hideActivityIndicator];
                     //                             UIAlertView *LoginFailed=[[UIAlertView alloc]initWithTitle:@"Failed to login" message:@"App could not get the desired permissions to use your Facebook account." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                     //                             [LoginFailed show];
                     
                     
                 }
                 else if (error.fberrorCategory == FBErrorCategoryAuthenticationReopenSession)
                 {
                     //[self hideActivityIndicator];
                     UIAlertView *LoginFailed=[[UIAlertView alloc]initWithTitle:@"Session Error" message:@"Your current session is no longer valid. Please log in again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                     [LoginFailed show];
                 }
                 if(error.fberrorShouldNotifyUser == 1)
                 {
                    // [self hideActivityIndicator];
                     UIAlertView *LoginFailed=[[UIAlertView alloc]initWithTitle:@"Failed to login" message:[NSString stringWithFormat:@"%@",error.fberrorUserMessage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                     [LoginFailed show];
                     
                 }
                 
             }
             
             else if(FBSession.activeSession.isOpen)
             {
                 [[FBRequest requestForMe] startWithCompletionHandler:
                  ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error)
                  {
                      if (!error)
                      {
                          NSLog(@"user=%@",user);
                          NSString *fbMailID=[user objectForKey:@"email"];
                          NSLog(@"fbEmail=%@",fbMailID);
                          [[NSUserDefaults standardUserDefaults]setValue:fbMailID forKey:@"fbEmailAddress"];
                          NSLog(@"access token=%@",session.accessTokenData.accessToken);
                          
                          NSString *musicString = [[NSString alloc] initWithFormat:@"%@/music", user.id];
                          [FBRequestConnection startWithGraphPath:musicString
                                                completionHandler:^(
                                                                    FBRequestConnection *connection,
                                                                    id result,
                                                                    NSError *error
                                                                    ) {
                                                    NSLog(@"result %@",result);
                                                    /* handle the result */
                                                }];
                         // [self fbSignUpServerCall];
                          
                      }
                  }];
             }
         }];
        
    }
//}

//-(void)fbSignUpServerCall
//{
//    
//    NSString *token=[[[FBSession activeSession] accessTokenData] accessToken];
//    [[NSUserDefaults standardUserDefaults]setValue:token forKey:@"fbAccessToken"];
//    NSDictionary *postDict=[[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",token],@"token",[NSString stringWithFormat:@"%@",APIKey],@"apiKey", nil];
//    NSLog(@"dict=%@",postDict);
//    NSError *error = NULL;
//    NSData* data = [NSJSONSerialization dataWithJSONObject:postDict
//                                                   options:NSJSONWritingPrettyPrinted error:&error];
//    
//    NSString* dataString = [[NSString alloc] initWithData:data
//                                                 encoding:NSUTF8StringEncoding];
//    
//    NSData *postdata=[dataString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    NSString *postlength=[NSString stringWithFormat:@"%lu",(unsigned long)[postdata length]];
//    NSMutableURLRequest *URLrequest=[[NSMutableURLRequest alloc] init];
//    [URLrequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@user/authenticate/facebook",serverAddress]]];
//    [URLrequest setHTTPMethod:@"POST"];
//    [URLrequest setValue:postlength forHTTPHeaderField:@"Content-Length"];
//    [URLrequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [URLrequest setHTTPBody:postdata];
//    NSError *error1=nil;
//    NSHTTPURLResponse *response=nil;
//    NSData *responseData=[NSURLConnection sendSynchronousRequest:URLrequest returningResponse:&response error:&error1];
//    NSString *responseString=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"responseString = %@",responseString);
//    NSLog(@"statusCode=%ld",(long)response.statusCode);
//    if(response.statusCode == 200)
//    {
//        //account already exists so login
//        responseString = [responseString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//        [[NSUserDefaults standardUserDefaults]setValue:responseString forKey:@"userToken"];
//        NSString *fbemailId=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"fbEmailAddress"]];
//        [self pushNotificationServerCall:fbemailId];
//        [self hideActivityIndicator];
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kbowlingGameId];
//        MainViewController *mvc=[[MainViewController alloc]init];
//        [self.navigationController pushViewController:mvc animated:YES];
//        
//        
//    }
//    else if (response.statusCode == 201)
//    {
//        //new account created
//        responseString = [responseString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//        [[NSUserDefaults standardUserDefaults]setValue:responseString forKey:@"userToken"];
//        NSString *fbemailId=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"fbEmailAddress"]];
//        [self pushNotificationServerCall:fbemailId];
//        [self hideActivityIndicator];
//        // show username popup
//        [self showUsernameView];
//    }
//    else
//    {
//        //error for both cases -- signUp and login
//        UIAlertView *alertview2=[[UIAlertView alloc] initWithTitle:@"" message:@"An error occurred. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alertview2 show];
//        [self hideActivityIndicator];
//    }
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
