//
//  PhotoLibrary.h
//  PhotoPicker
//
//  Created by Vijay R. Gaonkar on 3/6/13.
//  Copyright (c) 2013 Vijay R. Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoLibrary : NSObject

- (NSDictionary *)  photoList;

- (NSUInteger)      numberOfCategories;

- (NSString *)      nameForCategory:(NSUInteger)category;

- (NSUInteger)      numberOfPhotosInCategory:(NSUInteger)category;

- (NSString *)      nameForPhotoInCategory:(NSUInteger)category
                                atPosition:(NSUInteger)position;

- (UIImage *)       imageForPhotoInCategory:(NSUInteger)category
                                 atPosition:(NSUInteger)position;

@end
