//
//  slideFunction.h
//  Jugnoo
//
//  Created by Mac Mini 58 on 22/05/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SliderView.h"
@interface slideFunction : NSObject

+(void)slideView:(UIView *)uiv_slide withDuration:(double)d_duration toX:(CGFloat)xValue andY:(CGFloat)yValue onCompletion:(UIView *)moveView toX:(CGFloat)valueX andY:(CGFloat)valueY;

@end
