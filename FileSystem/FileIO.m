//
//  FileIO.m
//  FileSystem
//
//  Created by Apple on 9/7/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import "FileIO.h"

@implementation FileIO

@synthesize fileMgr;
@synthesize homeDir;
@synthesize fileName;
@synthesize filePath;


- (NSString *)  setFileName {
    fileName = @"mytextfile.txt";
    return fileName;
}

- (NSString *) GetDocumentDirectory {
    fileMgr = [NSFileManager defaultManager];
    homeDir  = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return homeDir;
}

- (void) WriteToStringFile:(NSMutableString *)textToWrite {
    [textToWrite appendString:@"\n"];
    filePath = [[NSString alloc] init];
    NSError *err;
    filePath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFileName];
    BOOL ok = [textToWrite writeToFile:self.filePath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",
              filePath, [err localizedFailureReason]);
    }
}

- (void) AppendToStringFile:(NSMutableString *)textToWrite {
    [textToWrite appendString:@"\n"];
    filePath = [[NSString alloc] init];
    filePath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFileName];
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[textToWrite dataUsingEncoding:NSUnicodeStringEncoding]];
    [fileHandler closeFile];
    
}

- (NSString *)  readFromFile {
    filePath = [[NSString alloc] init];
    NSError *error;
    NSString *title;
    filePath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFileName];
    NSString *txtInfile = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if (!txtInfile) {
        UIAlertView *tellErr = [[UIAlertView alloc] initWithTitle:title message:@"Unable to get text from file" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [tellErr show];
    }
    
    return txtInfile;
}


@end
