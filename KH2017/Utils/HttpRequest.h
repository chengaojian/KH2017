//
//  HttpRequest.h
//  KH2017
//
//  Created by 三海教育 on 2017/6/16.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Response.h"

typedef void(^HttpRequestSuccessBlock)(Response *response);
typedef void(^HttpRequestFailedBlock)(NSError *error);

@interface HttpRequest : NSObject

+ (AFHTTPSessionManager *)sharedHttpSessionManager; 

+ (HttpRequest *)sharedRequest;

- (void)post:(NSString *)url params:(NSDictionary *)params success:(HttpRequestSuccessBlock)success failure:(HttpRequestFailedBlock)failure;

@end
