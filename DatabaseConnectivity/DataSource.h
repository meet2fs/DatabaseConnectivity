//
//  DataSource.h
//  Database Connectivity
//
//  Created by NaumanSaleem on 17/12/2014.
//  Copyright (c) 2014 DTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface DataSource : NSObject

@property (nonatomic,strong) FMDatabase *databaseObj;

+(id)sharedInstance;
- (NSString*)DatabasePath;

@end
