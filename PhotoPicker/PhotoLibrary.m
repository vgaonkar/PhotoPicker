//
//  PhotoLibrary.m
//  PhotoPicker
//
//  Created by Vijay R. Gaonkar on 3/6/13.
//  Copyright (c) 2013 Vijay R. Gaonkar. All rights reserved.
//

#import "PhotoLibrary.h"

@implementation PhotoLibrary

//returns the dictionary that contains all the photos
- (NSDictionary *)photoList
{    
    NSString *path          = [[NSBundle mainBundle] pathForResource:@"Photos" ofType:@"plist"];
    NSDictionary *photoList = [NSDictionary dictionaryWithContentsOfFile:path];
    
    return photoList;
}


- (NSUInteger)  numberOfCategories
{    
    return [self.photoList count];
}


- (NSString *)  nameForCategory:(NSUInteger)category
{    
    NSArray *allCategories = [[self.photoList allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return [allCategories objectAtIndex:category];
}


- (NSUInteger)  numberOfPhotosInCategory:(NSUInteger)category
{
    NSArray *categoryName = [self.photoList objectForKey:[self nameForCategory:category]];
    
    return [categoryName count];
}


- (NSString *)  nameForPhotoInCategory:(NSUInteger)category
                            atPosition:(NSUInteger)position
{    
    NSArray *categoryList = [[[self.photoList objectForKey:[self nameForCategory:category]]allKeys]
                                  sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return [categoryList objectAtIndex:position];
}


- (UIImage *)   imageForPhotoInCategory:(NSUInteger)category
                             atPosition:(NSUInteger)position{
    
    NSDictionary *categoryList = [self.photoList valueForKey:[self nameForCategory:category]];
    NSString *imageName        = [categoryList objectForKey:[self nameForPhotoInCategory:category
                                                                              atPosition:position]];
    
    return [UIImage imageNamed:imageName];
}

@end
