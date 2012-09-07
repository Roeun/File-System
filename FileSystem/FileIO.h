//
//  FileIO.h
//  FileSystem
//
//  Created by Apple on 9/7/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileIO : NSObject {
    NSFileManager *fileMgr;
    NSString *homeDir;
    NSString *fileName;
    NSString *filePath;
}

@property (nonatomic, retain) NSFileManager *fileMgr;
@property (nonatomic, retain) NSString *homeDir;
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSString *filePath;

- (NSString *) GetDocumentDirectory;
- (void) WriteToStringFile:(NSMutableString *) textToWrite;
- (NSString *) readFromFile;
- (NSString *) setFileName;
- (void) AppendToStringFile:(NSMutableString *)textToWrite;

@end
