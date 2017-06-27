//
//  Response.h
//  KH2017
//
//  Created by 三海教育 on 2017/6/16.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject

@property (nonatomic, copy) NSString *resCode;

@property (nonatomic, copy) NSString *resMsg;

@property (nonatomic, copy) NSString *currTime;

@property (nonatomic, copy) NSDictionary *data;

@end
