//
//  SliderView.m
//  Jam
//
//  Created by Chirag Sharma on 4/29/15.
//  Copyright (c) 2015 Chirag Sharma. All rights reserved.
//

#import "SliderView.h"

@implementation SliderView
{
    CGRect screenBounds;
    UIImageView *sliderBackground;
    NSArray *listArray;
    UITableView *tableViewOfSlider;
}
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        screenBounds=frame;
        self.backgroundColor = [UIColor lightGrayColor];
        // [self setBackgroundColor:[UIColor colorWithRed:36.0/255.0 green:41.0/255.0 blue:48.0/255.0 alpha:0.9]];
    }
    return self;
}

-(void)createView
{
    listArray=[[NSArray alloc] initWithObjects:@"Home",@"Mensajes", @"Notificaciones", @"Búsqueda", @"Salir", nil];
    self.backgroundColor = [UIColor whiteColor];
    
    tableViewOfSlider=[[UITableView alloc] init];
    [tableViewOfSlider setFrame:CGRectMake(0, 0, screenBounds.size.width - 1, screenBounds.size.height)];
    [tableViewOfSlider setBounces:NO];
    [tableViewOfSlider setBackgroundColor:[UIColor darkGrayColor]];
    [tableViewOfSlider setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableViewOfSlider setDelegate:self];
    [tableViewOfSlider setDataSource:self];
    [self addSubview:tableViewOfSlider];
}

#pragma mark - UITableView Delegate and Datasource Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"list count %lu", (unsigned long)listArray.count);
    return listArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    } else {
        UIImageView *lineImage=(UIImageView*)[cell.contentView viewWithTag:101];
        [lineImage removeFromSuperview];
        lineImage=nil;
    }
    cell.backgroundView=nil;
    cell.backgroundColor=[UIColor clearColor];
    
    
    cell.textLabel.text = [listArray objectAtIndex:indexPath.row];
    if (indexPath.row==0) {
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Remove Screen
-(void)removeSliderScreen
{
    for (UIView *subParts in sliderBackground.subviews) {
        [subParts removeFromSuperview];
    }
    [sliderBackground removeFromSuperview];
    sliderBackground=nil;
}


@end
