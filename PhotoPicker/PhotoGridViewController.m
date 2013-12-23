//
//  PhotoGridViewController.m
//  PhotoPicker
//
//  Created by Vijay R. Gaonkar on 3/6/13.
//  Copyright (c) 2013 Vijay R. Gaonkar. All rights reserved.
//

#import "PhotoGridViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoCategoryReusableView.h"

@interface PhotoGridViewController ()

@end

@implementation PhotoGridViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"View Did Load");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 */


- (PhotoLibrary *)  photoLibrary
{    
    if (!_photoLibrary){
        _photoLibrary = [[PhotoLibrary alloc]init];
    }
    
    return _photoLibrary;
}


- (NSInteger)   numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.photoLibrary numberOfCategories];
}


- (NSInteger)        collectionView:(UICollectionView *)collectionView
             numberOfItemsInSection:(NSInteger)section
{
    return [self.photoLibrary numberOfPhotosInCategory:section];
}


- (UICollectionViewCell *)        collectionView:(UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell"
                                                                                            forIndexPath:indexPath];
    collectionViewCell.imageView.image          = [self.photoLibrary imageForPhotoInCategory:indexPath.section
                                                                                  atPosition:indexPath.item];
    
    return collectionViewCell;
}


- (UICollectionReusableView *)  collectionView:(UICollectionView *)collectionView
             viewForSupplementaryElementOfKind:(NSString *)kind
                                   atIndexPath:(NSIndexPath *)indexPath
{
    PhotoCategoryReusableView *categoryLabel = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                  withReuseIdentifier:@"categoryLabel"
                                                                                         forIndexPath:indexPath];
    categoryLabel.categoryName.text          = [self.photoLibrary nameForCategory:indexPath.section];
    
    return categoryLabel;
}


- (void)          collectionView:(UICollectionView *)collectionView
        didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.imageName.text = [self.photoLibrary nameForPhotoInCategory:indexPath.section
                                                         atPosition:indexPath.item];    
}

@end
