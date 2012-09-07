//
//  ViewController.m
//  FileSystem
//
//  Created by Apple on 9/7/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import "ViewController.h"
#import "FileIO.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtWrite;
@synthesize lblDisplay;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.jpeg"]];
    self.lblDisplay.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg_pattern_example.jpeg"]];
    UIAlertView *tellWel = [[UIAlertView alloc] initWithTitle:@"File System" message:@"Welcome to Simple File System Tutorail" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [tellWel show];
}

- (void)viewDidUnload
{
    [self setTxtWrite:nil];
    [self setLblDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnSave:(id)sender {
    if (![self.txtWrite.text isEqualToString:@""]) {
        FileIO *file = [[FileIO alloc] init];
        [file WriteToStringFile:[self.txtWrite.text mutableCopy]];
        UIAlertView * msg  = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"Save new text file successful" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil  ];
        [msg show];
        self.txtWrite.text = @"";
    }else {
        UIAlertView * msg  = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Input text first !" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil  ];
        [msg show];
    }
    [txtWrite resignFirstResponder];
}

- (IBAction)btnRead:(id)sender {
    FileIO *readFile = [[FileIO alloc] init];
    self.lblDisplay.text = [readFile readFromFile];
}

- (IBAction)btnAppend:(id)sender {
    if (![self.txtWrite.text isEqualToString:@""]) {
    FileIO *file = [[FileIO alloc] init];
    [file AppendToStringFile:[self.txtWrite.text mutableCopy]];
    UIAlertView * msg  = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"Append text file successful" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil  ];
    [msg show];
    self.txtWrite.text = @"";
    }
    else {
        UIAlertView * msg  = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Input text first !" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil  ];
        [msg show];
    }
    [txtWrite resignFirstResponder];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [txtWrite resignFirstResponder];
}



@end
