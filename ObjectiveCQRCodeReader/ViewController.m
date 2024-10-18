//
//  ViewController.m
//  ObjectiveCQRCodeReader
//
//  Created by Angelos Staboulis on 18/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _device = [[[AVCaptureDeviceDiscoverySession alloc] devices] firstObject];
    _helper = [[Helper alloc] init];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIView *qrCodeView = [self view];
    [qrCodeView setFrame:CGRectMake(50, 100, 250, 300)];
    [_helper createPreview:qrCodeView];
}

@end
