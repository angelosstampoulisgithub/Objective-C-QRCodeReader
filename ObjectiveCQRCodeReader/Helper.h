//
//  Helper.h
//  ObjectiveCQRCodeReader
//
//  Created by Angelos Staboulis on 18/10/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface Helper : NSObject<AVCaptureMetadataOutputObjectsDelegate>
@property AVCaptureMetadataOutput *pmetadataOutput;
@property AVCaptureSession *pcaptureSession;
- (id)init;
-(void) createPreview:(UIView*) view;
-(void) runCaptureSession;
@end

NS_ASSUME_NONNULL_END
