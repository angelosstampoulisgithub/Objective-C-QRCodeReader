//
//  Helper.m
//  ObjectiveCQRCodeReader
//
//  Created by Angelos Staboulis on 18/10/24.
//

#import "Helper.h"

@implementation Helper
- (id)init
{
    self = [super init];
    if(self)
    {
        _pmetadataOutput =  [[AVCaptureMetadataOutput alloc] init];
        _pcaptureSession =  [[AVCaptureSession alloc] init];
        AVCaptureDevice *videoCaptureDevice = [AVCaptureDevice
             defaultDeviceWithMediaType:AVMediaTypeVideo];

         NSError *error = nil;
         AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput
             deviceInputWithDevice:videoCaptureDevice error:&error];
        
        
        if ([_pcaptureSession canAddInput:deviceInput]) {
            [_pcaptureSession addInput:deviceInput];
        }
        
        if ([_pcaptureSession canAddOutput:_pmetadataOutput]) {
            [_pcaptureSession addOutput:_pmetadataOutput];
            [_pmetadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
            
            _pmetadataOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
        }
        [self runCaptureSession];
    }
    return self;
}

- (void)createPreview:(UIView *)view{
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_pcaptureSession];
    previewLayer.frame = view.layer.bounds;
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [view.layer addSublayer:previewLayer];
}
- (void)runCaptureSession{
    if (![_pcaptureSession isRunning]) {
        NSLog(@"capture session");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self->_pcaptureSession startRunning];
        });
    }


}
- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    if ([_pcaptureSession isRunning]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self->_pcaptureSession stopRunning];
        });
    }

       for (AVMetadataObject *metadataObject in metadataObjects) {
           AVMetadataMachineReadableCodeObject *readableObject =
               (AVMetadataMachineReadableCodeObject *)metadataObject;
                   NSLog(@"readable=%@",readableObject.stringValue);
        }
}
@end
