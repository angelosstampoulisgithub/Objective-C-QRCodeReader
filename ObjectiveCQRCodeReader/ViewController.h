//
//  ViewController.h
//  ObjectiveCQRCodeReader
//
//  Created by Angelos Staboulis on 18/10/24.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Helper.h"
@interface ViewController : UIViewController
@property AVCaptureDevice *device;
@property AVCaptureSession *captureSession;
@property AVCaptureMetadataOutput *metadataOutput;
@property Helper *helper;
@end

