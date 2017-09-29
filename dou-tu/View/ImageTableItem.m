//
//  ImageTableItem.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/22.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import "ImageTableItem.h"
#import <AFNetworking.h>
#import "Utils.h"

@interface ImageTableItem ()

@end

@implementation ImageTableItem

- (void)viewDidLoad {
    [super viewDidLoad];
    NSImage *image = [NSImage imageNamed:@"145743e33ae2b7c"];
    [self.imageViewItem setImage:image];
    // Do view setup here.
}

-(void) setURLL:(NSString *) str{
    NSImage *image = [NSImage imageNamed:@"145743e33ae2b7c"];
    [self.imageViewItem setImage:image];
    self.url = str;
    AFURLSessionManager *manager = [Utils downloadCenter];
    NSURL *URL = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *tmpDirURL = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
        return [tmpDirURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if(response.URL.absoluteString != self.url){ return; }
        NSLog(@"%@",filePath);
        NSImage *image = [[NSImage alloc]initByReferencingURL:filePath];
        [self.imageViewItem setImage:image];
    }];
    [downloadTask resume];
    
}

-(void)mouseDown:(NSEvent *)event{
    NSLog(@"evet");
    NSPasteboard *board = [NSPasteboard generalPasteboard];
    NSImage *image = self.imageViewItem.image;
    [board clearContents];
    NSArray *copiedObjects = [NSArray arrayWithObject:image];
    [board writeObjects:copiedObjects];
    self.view.layer.borderWidth = 10;
    self.view.layer.borderColor = NSColor.blackColor.CGColor;
    [NSTimer scheduledTimerWithTimeInterval:0.3
                                     target:self
                                   selector:@selector(removeBorder)
                                   userInfo:nil
                                    repeats:NO];
}

-(void)removeBorder{
    self.view.layer.borderWidth = 0;
    self.view.layer.borderColor = NSColor.blackColor.CGColor;
}

@end
