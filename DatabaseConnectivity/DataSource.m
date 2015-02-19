//
//  DataSource.m
//  Database Connectivity
//
//  Created by NaumanSaleem on 17/12/2014.
//  Copyright (c) 2014 chauSolutions. All rights reserved.
//

#import "DataSource.h"
#define DataBaseName @"db.sqlite"
@implementation DataSource
@synthesize databaseObj;
//The technique to create singleton database object
+ (id)sharedInstance {
    static DataSource *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self CopyDatabase];
        databaseObj = [FMDatabase databaseWithPath:[self DatabasePath]];
    }
    
    return self;
    
    // Do any additional setup after loading the view from its nib.
}

- (NSString*)DatabasePath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [Paths objectAtIndex:0];
    // NSLog(@" dir = %@",DocumentDir);
    return [documentsDir stringByAppendingPathComponent:DataBaseName];
    
}
//The method will coppy the database to documents directory from bundle
- (void)CopyDatabase
{
    BOOL success;
    NSLog(@" full path = %@",[self DatabasePath]);
    
    success = [[NSFileManager defaultManager] fileExistsAtPath:[self DatabasePath]];
    NSString *FileDB = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:DataBaseName];
    
    if (success==YES)
    {
        NSLog(@"File Exist");
        
    }
    else
    {
        [[NSFileManager defaultManager] copyItemAtPath:FileDB toPath:[self DatabasePath] error:nil];
        
    }
}

@end
