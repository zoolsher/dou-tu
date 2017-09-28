//
//  Utils.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/28.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"

@implementation Utils

+(NSString *)URLEncodedString:(NSString *)str
{
    NSString *encodedString = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return encodedString;
}

@end
