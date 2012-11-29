//
//  BIDDependentComponentPickerViewController.h
//  Picker
//
//  Created by LIU WEI on 12-11-27.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kStateComponent 0
#define kZipComponent 1

@interface BIDDependentComponentPickerViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;

-(IBAction)buttonPressed;

@end
