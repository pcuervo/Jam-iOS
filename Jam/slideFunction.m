//
//  slideFunction.m
//  Jugnoo
//
//  Created by Mac Mini 58 on 22/05/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import "slideFunction.h"

@implementation slideFunction

+(void)slideView:(UIView *)uiv_slide withDuration:(double)d_duration toX:(CGFloat)xValue andY:(CGFloat)yValue onCompletion:(UIView *)moveView toX:(CGFloat)valueX andY:(CGFloat)valueY
{
    [UIView animateWithDuration:d_duration
                     animations:^ {
                         [uiv_slide setFrame:CGRectMake(xValue, yValue, uiv_slide.frame.size.width, uiv_slide.frame.size.height)];
                     }completion:^(BOOL finished) {
                         [moveView setFrame:CGRectMake(valueX, valueY, moveView.frame.size.width, moveView.frame.size.height)];
                     }
     ];
}
@end
