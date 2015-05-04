//
//  SliderView.h
//  Jam
//
//  Created by Chirag Sharma on 4/29/15.
//  Copyright (c) 2015 Chirag Sharma. All rights reserved.
//
@protocol SliderViewDelegate

@end

#import <UIKit/UIKit.h>

@interface SliderView : UIView<UITableViewDataSource, UITableViewDelegate>
@property(retain,nonatomic) id<SliderViewDelegate> delegate;

-(void)createView;
-(void)removeSliderScreen;

@end
