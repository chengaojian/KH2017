//
//  Utils.h
//  KH2017
//
//  Created by 三海教育 on 2017/6/27.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

// 根据时间戳转换为时间
+ (NSString *)changeTimeStampFormattingToDate:(NSString *)timeStr;

// 设置图片
+ (void)setImageView:(UIImageView *)imageView withResId:(NSString *)resId;

@end
