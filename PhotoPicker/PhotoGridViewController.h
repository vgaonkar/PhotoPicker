//
//  PhotoGridViewController.h
//  PhotoPicker
//
//  Created by Vijay R. Gaonkar on 3/6/13.
//  Copyright (c) 2013 Vijay R. Gaonkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoLibrary.h"

@interface PhotoGridViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong)   PhotoLibrary        *photoLibrary;
@property (weak, nonatomic)     IBOutlet UILabel    *imageName;

@end
