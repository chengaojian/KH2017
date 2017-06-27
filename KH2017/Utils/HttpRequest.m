//
//  HttpRequest.m
//  KH2017
//
//  Created by 三海教育 on 2017/6/16.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

static AFHTTPSessionManager *manager;

+ (AFHTTPSessionManager *)sharedHttpSessionManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10.0;
    });
    return manager;
}

+ (HttpRequest *)sharedRequest {
    
    static HttpRequest *_sharedRequest;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedRequest = [[HttpRequest alloc]init];
        manager = [self sharedHttpSessionManager];

    });
    return _sharedRequest;
}


- (void)post:(NSString *)url params:(NSDictionary *)params success:(HttpRequestSuccessBlock)success failure:(HttpRequestFailedBlock)failure {
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0;
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        Response *response = [[Response alloc]init];
        response.resCode = resultData[@"resCode"];
        response.resMsg = resultData[@"resMsg"];
        response.currTime = resultData[@"currTime"];
        response.data = resultData[@"data"];
        if (success) {
            success(response);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
