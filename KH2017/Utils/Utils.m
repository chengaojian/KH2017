//
//  Utils.m
//  KH2017
//
//  Created by 三海教育 on 2017/6/27.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import "Utils.h"

@interface Utils ()

@end

@implementation Utils

+ (NSString *)changeTimeStampFormattingToDate:(NSString *)timeStr {
    
    if ([timeStr isEqualToString:@""]) {
        return nil;
    }
    if (timeStr.length == 13) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy年MM月dd日"];
        NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [formatter setTimeZone:zone];
        NSTimeInterval dateIndeteger;
        dateIndeteger = [[timeStr substringToIndex:10] doubleValue];
        NSDate  *date = [NSDate dateWithTimeIntervalSince1970:dateIndeteger];
        NSString *dateStr = [formatter stringFromDate:date];
        return dateStr;
    }
    return nil;
}

+ (void)setImageView:(UIImageView *)imageView withResId:(NSString *)resId {
    
    NSString *resUrlStr = [NSString stringWithFormat:@"http://r.kehai.com/file/loadImage/%@.r?userIdentity=2&deviceId=5A364A08126C422594E40C3F3C532C9B&userId=51000001274064&netType=1&appVersion=121&imgId=236863821380844480&appId=stu_release&token=eyJ1c2VySUQiOjUxMDAwMDAxMjc0MDY0LCJleHBpcmUiOjE1MDEwNjI0MjI4NzQsImlzc3VlVGltZSI6MTQ5ODQ3MDQyMjg3NCwic2lnbmF0dXJlIjoiMmFlZTQ2MGUyNGQ3M2U3ZWVhNWY0MDZjNDkxZTU3MjQiLCJkZXZpY2VJZCI6IjVBMzY0QTA4MTI2QzQyMjU5NEU0MEMzRjNDNTMyQzlCIn0=&",resId];
    [imageView sd_setImageWithURL:[NSURL URLWithString:resUrlStr] placeholderImage:[UIImage imageNamed:@""]];
}

@end
