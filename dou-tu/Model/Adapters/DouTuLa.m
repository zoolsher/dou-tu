//
//  DouTuLa.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/28.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "DouTuLa.h"
#import "Utils.h"

@implementation DouTuLa
-(void)getImages:(NSString*)param cb:(void (^)(NSMutableArray *))callback{
    // encode keyword
    NSString *keyword = [Utils URLEncodedString:param];
    // append url
    NSString *url = [@"https://www.doutula.com/search?keyword=" stringByAppendingString:keyword];
    //send get request
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // success
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError *error = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"original=\"(.*?)\""
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:&error];
        NSArray *matches = [regex matchesInString:html
                                          options:0
                                            range:NSMakeRange(0, [html length])];
        NSMutableArray<NSString *> *res = [NSMutableArray<NSString *> new];
        for (NSTextCheckingResult *match in matches) {
            NSRange matchRange = [match range];
            matchRange.location = matchRange.location+10;
            matchRange.length = matchRange.length-11;
            NSString* url = [html substringWithRange:matchRange];
            [res addObject: url];
        }
        callback(res);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        // failure
        NSLog(@"Error: %@", error);
    }];
    
}
@end
