//
//  AppDelegate.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/21.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [Utils clearTmpDirectory];
    // Insert code here to tear down your application
}


@end
