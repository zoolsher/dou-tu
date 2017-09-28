//
//  DouTuCore.h
//  dou-tu
//
//  Created by zoolsher on 2017/9/21.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#ifndef DouTuCore_h
#define DouTuCore_h
#import <Foundation/Foundation.h>

@interface DouTuCore : NSObject

-(void)getImages:(NSString*)param cb:(void (^)(NSMutableArray *))callback;

@end


#endif /* DouTuCore_h */
