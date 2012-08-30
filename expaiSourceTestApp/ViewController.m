//
//  ViewController.m
//  expaiSDKAPP
//
//  Created by jiang yan on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//
//  ViewController.m
//  expaiSDKTestApp
//
//  Created by jiang yan on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ZBarSDK.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}




#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //启亿拍SDK
    expaiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    expaiButton.backgroundColor = [UIColor clearColor];
    expaiButton.frame = CGRectMake(20, 20, 280, 30);
    [expaiButton setTitle:@"启动" forState:UIControlStateNormal];
    [expaiButton addTarget:self action:@selector(expaiActionCamera:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    barCodeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 270, 280, 120)];
    barCodeLabel.numberOfLines=0;
    barCodeLabel.text=@"此处将显示返回的条码或二维码信息";
    
    
    [self.view addSubview:expaiButton];
    [self.view addSubview:barCodeLabel];
    
    
    
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

;

//start up
-(IBAction)expaiActionCamera:(id)sender
{
    
    ZBarReaderViewController  *zbar=[ZBarReaderViewController new];
    
    zbar.readerDelegate=self;
    [zbar.scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    //zbar.showsZBarControls=NO;
    //zbar.showsCameraControls=NO;
    //zbar.videoQuality=UIImagePickerControllerQualityType640x480;
    [self presentModalViewController:zbar animated:YES];
        
}



#pragma readerDelegate
#pragma zBarReaderViewController
-(void)imagePickerController:(UIImagePickerController *)reader didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    


    
        //获取条码信息
        id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
		ZBarSymbol *symbol = nil;
		for(symbol in results)
			break;
        
        
        //如果获取的是QR二维码
        if (symbol.type==ZBAR_QRCODE) {
            NSString *barContentText = [[NSString alloc]initWithString:symbol.data];
            NSLog(@"================EXPAI PRINT::::::::barContentType:%d::::ZBAR_QRCODE:%@",symbol.type,barContentText);
            barCodeLabel.text=barContentText;
        }else
        {
            
            //获取的是普通条形码
            NSString *barContentText = [[NSString alloc]initWithString:symbol.data];
            NSLog(@"================EXPAI PRINT::::::::barContentType:%d::::barContentText:%@",symbol.type,barContentText);
            barCodeLabel.text=barContentText;
        }
        
    
    [reader dismissModalViewControllerAnimated:YES];
    
}





@end
