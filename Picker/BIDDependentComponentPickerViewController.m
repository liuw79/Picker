//
//  BIDDependentComponentPickerViewController.m
//  Picker
//
//  Created by LIU WEI on 12-11-27.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import "BIDDependentComponentPickerViewController.h"

@interface BIDDependentComponentPickerViewController ()

@end

@implementation BIDDependentComponentPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)buttonPressed
{
    NSInteger stateRow = [self.picker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.picker selectedRowInComponent:kZipComponent];
    
    NSString *state = [self.states objectAtIndex:stateRow];
    NSString *zip = [self.zips objectAtIndex:zipRow];
    
    NSString *title = [[NSString alloc] initWithFormat:@"You selected zip code %@.",zip];
    NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
    [title release];
    [message release];
    [alert release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"statedictionary"
                               withExtension:@"plist"];
    
    NSLog(@"%@ is the plist URL.", plistURL);
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.stateZips = dictionary;
    
    NSLog(@"stateZips:%@", self.stateZips);
    
    NSArray *components = [self.stateZips allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.states = sorted;
    NSLog(@"states:%@", self.states);
    
    NSString *selectedState = [self.states objectAtIndex:0];
    NSArray *array = [self.stateZips objectForKey:selectedState];
    self.zips = array;
    
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        return [self.states count];
    }
    
    return [self.zips count];
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        return [self.states objectAtIndex:row];
    }
    
    return [self.zips objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        NSString *selectedState = [self.states objectAtIndex:row];
        NSArray *array = [self.stateZips objectForKey:selectedState];
        self.zips =  array;
        [self.picker selectRow:0 inComponent:kZipComponent animated:YES];
        [self.picker reloadComponent:kZipComponent];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kZipComponent)
    {
        return 90;
    }
    return 200;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
