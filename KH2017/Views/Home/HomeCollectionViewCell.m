//
//  HomeCollectionViewCell.m
//  KH2017
//
//  Created by 三海教育 on 2017/6/10.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *mark;

@end

@implementation HomeCollectionViewCell

- (void)configWithHomeCollectonViewCell:(HomeViewModel *)model {
    
    if (model.row == 0) {
        self.image.image = [UIImage imageNamed:@"1"];
    }
    if (model.row == 1) {
        self.image.image = [UIImage imageNamed:@"2"];
    }
    if (model.row == 2) {
        self.image.image = [UIImage imageNamed:@"3"];
    }
    self.image.layer.cornerRadius = 5.0;
    self.image.layer.masksToBounds = YES;
    self.title.text = model.title;
    self.title.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    self.time.text = model.time;
    self.time.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.mark.backgroundColor = [UIColor colorWithRed:122/255.0 green:183/255.0 blue:146/255.0 alpha:1];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
