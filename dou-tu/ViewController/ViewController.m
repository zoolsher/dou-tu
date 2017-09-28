//
//  ViewController.m
//  dou-tu
//
//  Created by zoolsher on 2017/9/21.
//  Copyright © 2017年 zoolsher. All rights reserved.
//

#import "ViewController.h"
#import "DouTuCore.h"
#import "ImageTableItem.h"

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewLayout];
    // Do any additional setup after loading the view.
    self.imageListUrls = [NSMutableArray arrayWithArray:@[]];
    DouTuCore* d = [DouTuCore new];
    self.douTuCore = d;
    self.isloading = NO;
    
}


- (void) setLoading{
    self.isloading = YES;
    self.goButton.title = @"...";
}

-(void) setNoLoading{
    self.isloading = NO;
    self.goButton.title = @"go";
}

- (void)configViewLayout{
    NSCollectionViewFlowLayout* layout = [NSCollectionViewFlowLayout new];
    layout.itemSize = NSMakeSize(100, 100);
    self.imageTable.collectionViewLayout = layout;
    self.imageTable.layer.backgroundColor = NSColor.blackColor.CGColor;
    NSNib* nib = [[NSNib alloc]initWithNibNamed:@"ImageTableItem" bundle:nil];
    [self.imageTable registerNib:nib forItemWithIdentifier:@"id"];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void) refresh:(NSString *)str{
    if(self.isloading){
        return;
    }
    [self setLoading];
    [self.douTuCore getImages:str cb:^(NSMutableArray *list) {
        [self.imageListUrls addObjectsFromArray:list];
        [self.imageTable reloadData];
        NSLog(@"%@",list);
        [self setNoLoading];
    }];
}

- (IBAction)enterClicked:(NSTextFieldCell *)sender {
    NSString* str = self.textField.title;
    [self refresh:str];
}

- (IBAction)click:(NSButtonCell *)sender {
    NSString* str = self.textField.title;
    [self refresh:str];
}


- (nonnull NSCollectionViewItem *)collectionView:(nonnull NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ImageTableItem *item = (
    ImageTableItem*)[collectionView makeItemWithIdentifier:@"id" forIndexPath:indexPath];
    NSString* url = self.imageListUrls[indexPath.item];
    [item setURLL:url];
    return item;
}

- (NSInteger)collectionView:(nonnull NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageListUrls count];
}


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

@end
