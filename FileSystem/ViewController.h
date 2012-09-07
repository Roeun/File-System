//
//  ViewController.h
//  FileSystem
//
//  Created by Apple on 9/7/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtWrite;
@property (weak, nonatomic) IBOutlet UILabel *lblDisplay;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnRead:(id)sender;
- (IBAction)btnAppend:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
