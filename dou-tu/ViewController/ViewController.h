//
//  ViewController.h
//  dou-tu
//
//  Created by zoolsher on 2017/9/21.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DouTuCore.h"

@interface ViewController : NSViewController <NSCollectionViewDelegate,NSCollectionViewDataSource>
@property (strong) DouTuCore *douTuCore;
@property Boolean isloading;
@property (strong) NSMutableArray* imageListUrls;
@property (weak) IBOutlet NSTextFieldCell *textField;
@property (weak) IBOutlet NSButton *goButton;
@property (weak) IBOutlet NSCollectionView *imageTable;
- (IBAction)enterClicked:(NSTextFieldCell *)sender;
- (IBAction)click:(NSButtonCell *)sender;

@end

