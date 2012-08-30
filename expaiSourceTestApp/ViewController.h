//
//  ViewController.h
//  expaiSourceTestApp
//
//  Created by jiang yan on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZBarSDK.h"


@interface ViewController : UIViewController <ZBarReaderDelegate>
{

    UIButton            *expaiButton;
    UILabel             *barCodeLabel;
}

@end    
