//
//  FilterView.h
//  Jam
//
//  Created by Chirag Sharma on 4/30/15.
//  Copyright (c) 2015 Chirag Sharma. All rights reserved.
//
@protocol FilterViewDelegate
-(void)upSwipe;
@end

#import <UIKit/UIKit.h>

@interface FilterView : UIView<UITableViewDataSource, UITableViewDelegate>
@property(retain,nonatomic) id<FilterViewDelegate> delegate;

-(void)createView;
-(void)removeSliderScreen;
@end
