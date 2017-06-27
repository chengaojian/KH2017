//
//  HomeViewModel.h
//  KH2017
//
//  Created by 三海教育 on 2017/6/13.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) NSInteger row;

// 讲作业接口数据
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *classStartTime;
@property (nonatomic, copy) NSString *gradeId;
@property (nonatomic, copy) NSString *courseTitle;
@property (nonatomic, copy) NSString *subjectId;
@property (nonatomic, copy) NSString *topicNum;
@property (nonatomic, copy) NSString *advertiseResId;
@property (nonatomic, copy) NSString *isHot;
@property (nonatomic, copy) NSString *courseId;
@property (nonatomic, copy) NSString *buyCourseCount;
@property (nonatomic, copy) NSString *isRecommend;

@end
