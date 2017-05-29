//
//  ViewController.m
//  objectivecDemo
//
//  Created by 蘇文良 on 2017/5/23.
//  Copyright © 2017年 蘇文良. All rights reserved.
//

#import "ViewController.h"







@interface ViewController ()


@end


@implementation ViewController




- (IBAction)segmentController:(id)sender {
    
    switch (_Controller.selectedSegmentIndex) {
        case 0:
            _image.image = [UIImage imageNamed:@"真理大學"];
            _textView.text = @"真理大學（Aletheia University），是一所台灣基督長老教會在新北市淡水區創辦的私立大學，前身為淡水工商管理學院。Aletheia之校名來自希臘語 αλήθεια「真理」之意。國外則有哈佛和耶魯以拉丁文的同義字veritas其為校訓。是台灣教育史上第一所學院暨大學。";
            
            break;
            
        case 1:
            _image.image = [UIImage imageNamed:@"淡水老街"];
            _textView.text = @"一般人俗稱的老街指的就是中正路（昔日滬尾街），全長約１公里多，道路設計以６公尺車道及人行道為主要特色。於2000年間因道路拓寬建設，將原本的紅磚人行道鋪設成花岡岩地板。2004年新北市淡水環境藝術節，淡水在地藝術家以燒陶方式，於老街入口處創作長約16公尺的藝術牆，並提字為「藝航滬尾」。中正路一帶仍可見到台灣傳統的長條型連棟式街屋，沿途尚有馬偕博士石像公園，及淡水清水巖等古蹟。";
            break;
            
        case 2:
            _image.image = [UIImage imageNamed:@"牛津學堂"];
            _textView.text = @"馬偕博士於台灣傳教期間，深感創設新式學校之重要，乃於1880年回加拿大募款，獲其故鄉安大略省牛津郡報紙《前哨評論》（Sentinel Review）新聞社之刊載並大力發起募款活動，得到各方熱烈迴響，共募得加幣6,215元，作為其建校基金。1881年，馬偕博士重返淡水，擇定牛津學堂現址，親手規劃、監工，興建校舍。1882年7月26日如期峻工，取名「理學堂大書院」。因感懷其故鄉加拿大牛津郡鄉親之盛情襄贊，英文乃命名為Oxford College，故後人稱之為牛津學堂，此後成為長老教會培育傳教、醫療和教育的基地，同時是台灣第1個私人博物館。";
            break;
        default:
            break;
    }
}







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _calendar.delegate = self;
    _calendar.dataSource = self;
    _isReading = NO;
    _captureSession = nil;
    [self netWorkReachable];
  
   
   }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)startStopReading:(id)sender {
    if (!_isReading) {
        if ([self startReading]) {
       
            [_lblStatus setText:@"正在掃描QRCode"];
        }
    }
    else{
        [self stopReading];
      
        
    }
    
    _isReading = !_isReading;
    
}

- (BOOL)startReading {
    NSError *error;
    
   
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    if (!input) {
        
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:input];
    
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_viewPreview.layer.bounds];
    [_viewPreview.layer addSublayer:_videoPreviewLayer];
    
    [_captureSession startRunning];

    
    return YES;
   
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
            
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
         
            _isReading = NO;
        }
    }
}

-(void)stopReading{
    [_captureSession stopRunning];
    _captureSession = nil;
    
    [_videoPreviewLayer removeFromSuperlayer];
}



- (void)netWorkReachable {
    
    
    
    
    
    AFNetworkReachabilityManager *networkReachabilityManger = [AFNetworkReachabilityManager sharedManager];
    [networkReachabilityManger startMonitoring];
    

    
    
    [networkReachabilityManger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
    
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"網路未知");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                _netTest.text = @"沒有網路";
                NSLog(@"沒有網路");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            
              
                _netTest.text = @"有網路";
                NSLog(@"wifi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                _netTest.text = @"有網路";
                NSLog(@"3G");
                break;
            default:
                break;
        }
        
    }];
    
    
  
    
}



-(void)network {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"網路" message:@"現在正在使用網路" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"ok" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
    
    
};



@end
