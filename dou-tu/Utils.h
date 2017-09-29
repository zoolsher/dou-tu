//
//  Utils.h
//  dou-tu
//
//  Created by zoolsher on 2017/9/28.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#ifndef Utils_h
#define Utils_h
#import <AFNetworking.h>

@interface Utils : NSObject

+(NSString *)URLEncodedString:(NSString *)str;
+(AFURLSessionManager *) downloadCenter;
+(void)clearTmpDirectory;

@end

#endif /* Utils_h */
