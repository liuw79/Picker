//
//  BIDDoubleComponentPickerViewController.m
//  Picker
//
//  Created by LIU WEI on 12-11-27.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import "BIDDoubleComponentPickerViewController.h"

@interface BIDDoubleComponentPickerViewController ()

@end

@implementation BIDDoubleComponentPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)buttonPress:(id)sender
{
    NSInteger whichName = [self.picker selectedRowInComponent:0];
    NSInteger whichFruit = [self.picker selectedRowInComponent:1];
    
    NSString *strName = self.nameArray[whichName];
    NSString *strFruit = self.fruitArray[whichFruit];
    
    NSString *message = [[NSString alloc] initWithFormat:@"%@ 爱 %@", strName, strFruit];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"告诉你" message:message delegate:self
                                          cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];
    
    [message release];
    [alert release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameArray = [[NSArray alloc] initWithObjects:@"张三",@"李四",@"光老板", nil];
    self.fruitArray = [[NSArray alloc] initWithObjects:@"Apple", @"美女", @"Banana", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma picker data source
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.nameArray.count;
    }
    
    return [self.fruitArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

#pragma picker delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.nameArray[row];
    }
    else
    {
        return self.fruitArray[row];
    }
}



@end
