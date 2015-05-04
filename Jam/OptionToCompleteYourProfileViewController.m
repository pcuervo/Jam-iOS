//
//  OptionToCompleteYourProfileViewController.m
//  Jam
//
//  Created by Chirag Sharma on 4/29/15.
//  Copyright (c) 2015 Chirag Sharma. All rights reserved.
//

#import "OptionToCompleteYourProfileViewController.h"

@interface OptionToCompleteYourProfileViewController ()

@end

@implementation OptionToCompleteYourProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self loadInitialView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadInitialView{
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [skipButton addTarget:self
                   action:@selector(skip)
         forControlEvents:UIControlEventTouchUpInside];
    [skipButton setTitle:@"Skip" forState:UIControlStateNormal];
    skipButton.frame = CGRectMake(250, 40, 60, 15);
    [self.view addSubview:skipButton];
    
    UIButton *completeYourProfileButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [completeYourProfileButton addTarget:self
                                  action:@selector(completeYorProfile)
                        forControlEvents:UIControlEventTouchUpInside];
    [completeYourProfileButton setTitle:@"Complete your Profile" forState:UIControlStateNormal];
    completeYourProfileButton.frame = CGRectMake(80.0, 350, 160.0, 40.0);
    [self.view addSubview:completeYourProfileButton];
}

-(void)skip{
    HomeViewController *hvc = [[HomeViewController alloc] init];
    [self.navigationController pushViewController:hvc animated:YES];
}

-(void)completeYorProfile{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
