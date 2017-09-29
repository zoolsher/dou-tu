//
//  Utils.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/28.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Utils.h"

@implementation Utils

AFURLSessionManager *manager = nil;

+(NSString *)URLEncodedString:(NSString *)str
{
    NSString *encodedString = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return encodedString;
}

+(AFURLSessionManager *) downloadCenter{
    if(manager == nil){
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return manager;
}

+ (void)clearTmpDirectory
{
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
    for (NSString *file in tmpDirectory) {
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
    }
}


@end
