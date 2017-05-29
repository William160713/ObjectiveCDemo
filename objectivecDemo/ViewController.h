//
//  ViewController.h
//  objectivecDemo
//
//  Created by 蘇文良 on 2017/5/23.
//  Copyright © 2017年 蘇文良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"
#import <AVFoundation/AVFoundation.h>
#import <AFNetworking/AFNetworking.h>






@interface ViewController : UIViewController<FSCalendarDelegate,FSCalendarDataSource,AVCaptureMetadataOutputObjectsDelegate>




@property (weak, nonatomic) IBOutlet UISegmentedControl *Controller;


@property (weak, nonatomic) IBOutlet UIImageView *image;


@property (weak, nonatomic) IBOutlet UITextView *textView;


@property (weak, nonatomic) IBOutlet FSCalendar *calendar;

@property (weak, nonatomic) IBOutlet UILabel *netTest;



//QR
@property (weak, nonatomic) IBOutlet UIView *viewPreview;

@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@property (weak, nonatomic) IBOutlet UIButton *startBtn;


- (IBAction)startStopReading:(id)sender;



@property (nonatomic) BOOL isReading;

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

- (BOOL)startReading;
- (void)stopReading;

- (void)network;


@end








