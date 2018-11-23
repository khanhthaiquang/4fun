//
//  DBManager.m
//  4Fun
//
//  Created by GMO on 11/20/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "DBManager.h"
#import <sqlite3.h>

@implementation DBManager

- (instancetype)initWithDatabaseFilename: (NSString *)dataFileName {
    self = [super init];
    if(self) {
//        set document directory path
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.documentDirectory = [path objectAtIndex:0];
//        keep the database in file name
        self.databaseFileName = dataFileName;
//        copy the database into the document directory if necessary
        [self copyDatabaseIntoDocumentDirectory];
    }
    return self;
}

- (void)copyDatabaseIntoDocumentDirectory {
    NSString *destinationPath = [self.documentDirectory stringByAppendingPathComponent:self.databaseFileName];
//    if the database does not exist in the document directory
    if(![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
//        copy it
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:self.databaseFileName];
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:&error];
//        if any error occured, write log message
        if(error != nil) {
            NSLog(@"%@",[error localizedDescription]);
        }
    }
}

- (void)runQuery:(const char *)query isQueryExcutable:(BOOL)queryExcutable {
//    sqlite3 object
    sqlite3 *sqlite3Database;
//    Set the database in the path
    NSString *databasePath = [self.documentDirectory stringByAppendingPathComponent:self.databaseFileName];
//    Reset result array
    if(self.resultsArray != nil) {
        [self.resultsArray removeAllObjects];
        self.resultsArray = nil;
    }
    self.resultsArray = [[NSMutableArray alloc] init];
//    Reset column name array
    if(self.columnNamesArray != nil) {
        [self.columnNamesArray removeAllObjects];
        self.columnNamesArray = nil;
    }
    self.columnNamesArray = [[NSMutableArray alloc] init];

//    open the database
    BOOL  openDatabaseResult = sqlite3_open([databasePath UTF8String], &sqlite3Database);
    if (openDatabaseResult == SQLITE_OK) {
//        Will be store the query after having been compiled into sqlite statement
        sqlite3_stmt *compiledStatement;
//        load all data from database to memory
        BOOL prepareStamentResult = sqlite3_prepare_v2(sqlite3Database, query, -1, &compiledStatement, NULL);
        if (prepareStamentResult == SQLITE_OK) {
//        if the query is non-excutable
            if(!queryExcutable) {
//            keep the data for each fetched row
                NSMutableArray *dataRowarray;
//            loop through the result and add them to the result array
                while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
//                   contain the data of a fetch row
                    dataRowarray = [[NSMutableArray alloc] init];
//                    total number of columns
                    int totalComlumns = sqlite3_column_count(compiledStatement);
//                    loop through all columns and fetch earch columns data
                    for (int i = 0;i < totalComlumns; i++){
                        [self.resultsArray addObject:dataRowarray];
                    }
                }
            }
            else {
//                there are used for an excutable query (insert, update, delete)
//                excute query
                BOOL excuteQueryResult = sqlite3_step(compiledStatement);
                if(excuteQueryResult == SQLITE_DONE) {
//                    keep the effect rows.
                    self.effectedRows = sqlite3_changes(sqlite3Database);
//                    keep the last insert row ID
                    self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
                }
                else {
//                    if could not excute query, log message
                    NSLog(@"BD error: %s",sqlite3_errmsg(sqlite3Database));
                }
            }
        }
        else {
//            if database does not open, write message
            NSLog(@"DB can't open: %s",sqlite3_errmsg(sqlite3Database));
        }
//        release the compiled stament from memory
        sqlite3_finalize(compiledStatement);
    }
//    close database
    sqlite3_close(sqlite3Database);
}

- (NSArray *)loadDataFromDB:(NSString *)query {
//    run not excutable query
    [self runQuery:[query UTF8String] isQueryExcutable:NO];
    return (NSArray *)self.resultsArray;
}

- (void)excutedQuery:(NSString *)query {
//    run excutable query
    [self runQuery:[query UTF8String] isQueryExcutable:YES];
}
@end
