//
//  ImageTableItem.h
//  dou-tu
//
//  Created by zoolsher on 2017/9/22.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ImageTableItem : NSCollectionViewItem
@property (weak) IBOutlet NSImageView *imageViewItem;
@property (copy) NSString* url;
-(void) setURLL:(NSString*) str;
@end
