//
//  DouTuCore.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/21.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "DouTuCore.h"
#import "Utils.h"
#import "DouTuLa.h"
#import "ImageProto.h"

@implementation DouTuCore

- (void) getImages:(NSString *)param cb:(void (^)(NSMutableArray *))callback {
    NSArray<Class>* protos = @[[DouTuLa class]];
    for (Class proto in protos) {
        NSObject* instance = [[proto alloc]init];
        [instance performSelector:@selector(getImages:cb:) withObject:param withObject:callback];
    }
}

@end

