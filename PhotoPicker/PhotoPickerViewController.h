//
//  PhotoPickerViewController.h
//  PhotoPicker
//
//  Created by Vijay R. Gaonkar on 3/6/13.
//  Copyright (c) 2013 Vijay R. Gaonkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoLibrary.h"

@interface PhotoPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) PhotoLibrary            *photoLibrary;
@property (weak, nonatomic)   IBOutlet UIPickerView   *pickerView;
@property (weak, nonatomic)   IBOutlet UIImageView    *display;

@end
