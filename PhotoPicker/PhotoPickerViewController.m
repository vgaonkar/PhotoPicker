//
//  PhotoPickerViewController.m
//  PhotoPicker
//
//  Created by Vijay R. Gaonkar on 3/6/13.
//  Copyright (c) 2013 Vijay R. Gaonkar. All rights reserved.
//

#import "PhotoPickerViewController.h"

#define NUMBER_OF_COMPONENTS 2
#define CATEGORY_NAME 0
#define PHOTOS_IN_CATEGORY 1

@interface PhotoPickerViewController ()

@end


@implementation PhotoPickerViewController


- (IBAction)        alphaSlider:(UISlider *)sender
{    
    self.display.alpha = sender.value;
}


- (PhotoLibrary *)  photoLibrary
{    
    if (!_photoLibrary){
        _photoLibrary = [[PhotoLibrary alloc]init];
    }
    
    return _photoLibrary;
}


- (void)    viewDidLoad
{    
    [super viewDidLoad];
    //Display the first image of the first category
    self.display.image = [self.photoLibrary imageForPhotoInCategory:CATEGORY_NAME
                                                         atPosition:0];
    //don't resize
    self.display.contentMode=UIViewContentModeScaleAspectFit;
}

    
- (void)    didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)   numberOfComponentsInPickerView:(UIPickerView *)pickerView
{    
    return NUMBER_OF_COMPONENTS;
}


- (NSInteger)   pickerView:(UIPickerView *)pickerView
   numberOfRowsInComponent:(NSInteger)component
{    
    if (component == CATEGORY_NAME){
        return [self.photoLibrary numberOfCategories];
    }
    
    else{
        return [self.photoLibrary numberOfPhotosInCategory:[pickerView selectedRowInComponent:CATEGORY_NAME]];
    }
}


- (NSString *)  pickerView:(UIPickerView *)pickerView
               titleForRow:(NSInteger)row
              forComponent:(NSInteger)component
{    
    if (component == CATEGORY_NAME) {
        return [self.photoLibrary nameForCategory:row];
    }
    
    else {
        return [self.photoLibrary nameForPhotoInCategory:[pickerView selectedRowInComponent:CATEGORY_NAME]
                                              atPosition:row];
    }
}


- (void)    pickerView:(UIPickerView *)pickerView
          didSelectRow:(NSInteger)row
           inComponent:(NSInteger)component
{
    [self.pickerView reloadComponent:PHOTOS_IN_CATEGORY];

    if (component == CATEGORY_NAME) {
        [pickerView selectRow:CATEGORY_NAME inComponent:PHOTOS_IN_CATEGORY animated:YES];
        self.display.image = [self.photoLibrary
                              imageForPhotoInCategory:[pickerView selectedRowInComponent:CATEGORY_NAME]
                                                                              atPosition:0];
        //don't resize
        self.display.contentMode=UIViewContentModeScaleAspectFit;
    }
    
    else {
        self.display.image = [self.photoLibrary
                              imageForPhotoInCategory:[pickerView selectedRowInComponent:CATEGORY_NAME]
                                           atPosition:[pickerView
                               selectedRowInComponent:PHOTOS_IN_CATEGORY]];
        //don't resize
        self.display.contentMode=UIViewContentModeScaleAspectFit;
    }
}

@end
