//
//  ImageProto.h
//  dou-tu
//
//  Created by zoolsher on 2017/9/28.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImageProto <NSObject>
-(void)getImages:(NSString*)param cb:(void (^)(NSMutableArray *))callback;
@end
