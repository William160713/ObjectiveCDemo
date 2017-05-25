//
//  ViewController.h
//  objectivecDemo
//
//  Created by 蘇文良 on 2017/5/23.
//  Copyright © 2017年 蘇文良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FSCalendar/FSCalendar.h>


@interface ViewController : UIViewController<FSCalendarDelegate,FSCalendarDataSource>





@property (weak, nonatomic) IBOutlet UISegmentedControl *Controller;


@property (weak, nonatomic) IBOutlet UIImageView *image;


@property (weak, nonatomic) IBOutlet UITextView *textView;


@property (weak, nonatomic) IBOutlet FSCalendar *calendar;


@end


