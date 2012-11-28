//
//  BIDDoubleComponentPickerViewController.h
//  Picker
//
//  Created by LIU WEI on 12-11-27.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDoubleComponentPickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet NSArray *nameArray;
@property (strong, nonatomic) IBOutlet NSArray *fruitArray;

-(IBAction)buttonPress:(id)sender;

@end
