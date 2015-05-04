//
//  HomeViewController.m
//  Jam
//
//  Created by Chirag Sharma on 4/20/15.
//  Copyright (c) 2015 Chirag Sharma. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
{
    SliderView *sliderScreen;
    FilterView *filterScreen;
    BOOL navigationBool;
    BOOL filterBool;
    CGRect screenBounds;
}
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
    screenBounds = [[UIScreen mainScreen] bounds];
    
    UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [chatButton addTarget:self
                   action:@selector(chat)
         forControlEvents:UIControlEventTouchUpInside];
    [chatButton setTitle:@"Chat" forState:UIControlStateNormal];
    chatButton.frame = CGRectMake(screenBounds.size.width - 70, 40, 60, 15);
    [self.view addSubview:chatButton];
    
    UIButton *filtersButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [filtersButton addTarget:self
                      action:@selector(filter)
            forControlEvents:UIControlEventTouchUpInside];
    [filtersButton setTitle:@"FILTERS" forState:UIControlStateNormal];
    filtersButton.frame = CGRectMake(60, 40, 200, 15);
    [self.view addSubview:filtersButton];
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [menuButton addTarget:self
                   action:@selector(menu)
         forControlEvents:UIControlEventTouchUpInside];
    [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(10, 40, 60, 15);
    [self.view addSubview:menuButton];
}

-(void)chat{

}


-(void)filter{
    if (filterBool) {
        [self upSwipe];
    }
    else{
//        UIView *clearColorview=[[UIView alloc]initWithFrame:CGRectMake(screenBounds.origin.x, screenBounds.origin.y, screenBounds.size.width, screenBounds.size.height )];
//        clearColorview.tag = 157; // clearviewtag
//        clearColorview.backgroundColor=[UIColor blackColor];
//        clearColorview.alpha=.5;
//        [self.view addSubview:clearColorview];
        filterBool = YES;
        [filterScreen removeFromSuperview];
        filterScreen=nil;
        filterScreen=[[FilterView alloc] initWithFrame:CGRectMake(0, -screenBounds.size.height, 320, screenBounds.size.height)];
        
        [filterScreen setDelegate:self];
        //[sliderScreen setPickupClassBool:NO];
        [filterScreen createView];
        [self.view addSubview:filterScreen];
        
        [slideFunction slideView:filterScreen withDuration:0.4 toX:0 andY:0 onCompletion:filterScreen toX:0 andY:0];
        
        UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upSwipe)];
        swipeUpGestureRecognizer.direction =  UISwipeGestureRecognizerDirectionUp;
        [sliderScreen addGestureRecognizer:swipeUpGestureRecognizer];
    }
}

-(void)menu{
    if (navigationBool) {
        [self leftswipe];
    }
    else{
        UIView *clearColorview=[[UIView alloc]initWithFrame:CGRectMake(screenBounds.origin.x, screenBounds.origin.y+64, screenBounds.size.width, screenBounds.size.height - 64 )];
        clearColorview.tag = 157; // clearviewtag
        clearColorview.backgroundColor=[UIColor blackColor];
        clearColorview.alpha=.5;
        [self.view addSubview:clearColorview];
        navigationBool = YES;
        [sliderScreen removeFromSuperview];
        sliderScreen=nil;
        sliderScreen=[[SliderView alloc] initWithFrame:CGRectMake(-240, 64, 220, screenBounds.size.height-64)];
        
        [sliderScreen setDelegate:self];
        //[sliderScreen setPickupClassBool:NO];
        [sliderScreen createView];
        [self.view addSubview:sliderScreen];
        
        [slideFunction slideView:sliderScreen withDuration:0.4 toX:0 andY:64 onCompletion:sliderScreen toX:0 andY:64];
        
        UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftswipe)];
        swipeUpGestureRecognizer.direction =  UISwipeGestureRecognizerDirectionLeft;
        [sliderScreen addGestureRecognizer:swipeUpGestureRecognizer];
    }
}

-(void)leftswipe{
    navigationBool = NO;
    if (sliderScreen) {
        
        [slideFunction slideView:sliderScreen withDuration:0.4 toX:-400 andY:64 onCompletion:sliderScreen toX:-400 andY:64];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.4]];
        UIImageView *clearView=(UIImageView *)[self.view viewWithTag:157];
        [clearView removeFromSuperview];
        [sliderScreen removeSliderScreen];
        [sliderScreen removeFromSuperview];
        sliderScreen=nil;
    }
}

-(void)upSwipe{
    filterBool = NO;
    if (filterScreen) {
        [slideFunction slideView:filterScreen withDuration:.40 toX:0    andY:-screenBounds.size.height onCompletion:filterScreen toX:0 andY: -screenBounds.size.height];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.4]];
        [filterScreen removeSliderScreen];
        [filterScreen removeFromSuperview];
        filterScreen=nil;
    }
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
