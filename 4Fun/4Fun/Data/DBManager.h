//
//  DBManager.h
//  4Fun
//
//  Created by GMO on 11/20/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject
@property (nonatomic,strong) NSMutableArray *columnNamesArray;
@property (nonatomic) int effectedRows;
@property (nonatomic) long long lastInsertedRowID;
@property (nonatomic, strong) NSString *documentDirectory;
@property (nonatomic, strong) NSString *databaseFileName;
@property (nonatomic, strong) NSMutableArray *resultsArray;

- (instancetype)initWithDatabaseFilename: (NSString *)dataFileName;
- (NSArray *)loadDataFromDB:(NSString *)query;
- (void)excutedQuery:(NSString *)query;
- (void)copyDatabaseIntoDirectory;
- (void)runQuery:(const char *)query isQueryExcutable:(BOOL) queryExcutable;
@end
