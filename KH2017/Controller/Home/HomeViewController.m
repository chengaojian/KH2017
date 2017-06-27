//
//  HomeViewController.m
//  KH2017
//
//  Created by 三海教育 on 2017/6/10.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeViewModel.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "Response.h"
#import "HttpRequest.h"
#import "SDCycleScrollView.h"

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *homeCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *imagesUrlArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = [NSMutableArray array];
    self.imagesUrlArr = [NSMutableArray array];
    
    [self loadData];
    [self setupNav];
    [self setupUI];
    [self setupCollectionView];
    // Do any additional setup after loading the view.
}

- (void)loadData {
    
    
    HttpRequest *httpRequest = [HttpRequest sharedRequest];
    [httpRequest post:@"http://mapi.kehai.com/m/hwcourse/loadJzyList2.do?userIdentity=2&netType=1&currPage=1&subjectId=ignore&time=ignore&deviceId=776B697EC49E4F678F84598B6157E9A8&appId=stu_release&day=0&userId=51000001274023&token=eyJ1c2VySUQiOjUxMDAwMDAxMjc0MDIzLCJleHBpcmUiOjE1MDAxMTA4MDU0MzIsImlzc3VlVGltZSI6MTQ5NzUxODgwNTQzMiwic2lnbmF0dXJlIjoiMjRiYTg0NzZiYjE0NjMzNmIzMzU2ZTEwOGI2M2VjYjgiLCJkZXZpY2VJZCI6Ijc3NkI2OTdFQzQ5RTRGNjc4Rjg0NTk4QjYxNTdFOUE4In0=&isFirstLoading=0&appVersion=118&gradeId=1004&courseType=ignore&" params:nil success:^(Response *response) {
        NSLog(@"%@",response);
        if ([response.resCode isEqualToString:@"000"]) {
            NSLog(@"请求成功！");
            NSDictionary *responseDict = response.data;
            for (NSDictionary *dict in responseDict[@"list"]) {
                HomeViewModel *model = [HomeViewModel mj_objectWithKeyValues:dict];
                [self.dataArr addObject:model];
            }
        }
        [self.homeCollectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)setupNav {
    
}

- (void)setupUI {
    
    
}

- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 250);
    layout.itemSize = CGSizeMake(SCREEN_WIDTH / 2 , SCREEN_WIDTH / 2 * 0.8 );
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    
    self.homeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    self.homeCollectionView.delegate = self;
    self.homeCollectionView.dataSource = self;
    self.homeCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.homeCollectionView];
    
    // 注册单元格
    [self.homeCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCollectionViewCellID"];
    // 注册头部视图
    [self.homeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionViewHeader"];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    NSLog(@"%s---------",__func__);
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%s---------",__func__);
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s---------",__func__);
    HomeCollectionViewCell *cell = (HomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCellID" forIndexPath:indexPath];
    [cell configWithHomeCollectonViewCell:self.dataArr[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s---------",__func__);
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionViewHeader" forIndexPath:indexPath];
        
            SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) delegate:nil placeholderImage:nil];
            [self.imagesUrlArr addObject:@"http://r.kehai.com/file/loadImage/236863821380844480.r?userIdentity=2&deviceId=5A364A08126C422594E40C3F3C532C9B&userId=51000001274064&netType=1&appVersion=121&imgId=236863821380844480&appId=stu_release&token=eyJ1c2VySUQiOjUxMDAwMDAxMjc0MDY0LCJleHBpcmUiOjE1MDEwNjI0MjI4NzQsImlzc3VlVGltZSI6MTQ5ODQ3MDQyMjg3NCwic2lnbmF0dXJlIjoiMmFlZTQ2MGUyNGQ3M2U3ZWVhNWY0MDZjNDkxZTU3MjQiLCJkZXZpY2VJZCI6IjVBMzY0QTA4MTI2QzQyMjU5NEU0MEMzRjNDNTMyQzlCIn0=&"];
            [self.imagesUrlArr addObject:@"http://r.kehai.com/file/loadImage/236863821380844480.r?userIdentity=2&deviceId=5A364A08126C422594E40C3F3C532C9B&userId=51000001274064&netType=1&appVersion=121&imgId=236863821380844480&appId=stu_release&token=eyJ1c2VySUQiOjUxMDAwMDAxMjc0MDY0LCJleHBpcmUiOjE1MDEwNjI0MjI4NzQsImlzc3VlVGltZSI6MTQ5ODQ3MDQyMjg3NCwic2lnbmF0dXJlIjoiMmFlZTQ2MGUyNGQ3M2U3ZWVhNWY0MDZjNDkxZTU3MjQiLCJkZXZpY2VJZCI6IjVBMzY0QTA4MTI2QzQyMjU5NEU0MEMzRjNDNTMyQzlCIn0=&"];
            [self.imagesUrlArr addObject:@"http://r.kehai.com/file/loadImage/236863821380844480.r?userIdentity=2&deviceId=5A364A08126C422594E40C3F3C532C9B&userId=51000001274064&netType=1&appVersion=121&imgId=236863821380844480&appId=stu_release&token=eyJ1c2VySUQiOjUxMDAwMDAxMjc0MDY0LCJleHBpcmUiOjE1MDEwNjI0MjI4NzQsImlzc3VlVGltZSI6MTQ5ODQ3MDQyMjg3NCwic2lnbmF0dXJlIjoiMmFlZTQ2MGUyNGQ3M2U3ZWVhNWY0MDZjNDkxZTU3MjQiLCJkZXZpY2VJZCI6IjVBMzY0QTA4MTI2QzQyMjU5NEU0MEMzRjNDNTMyQzlCIn0=&"];
            cycleScrollView.imageURLStringsGroup = self.imagesUrlArr;
            [headerView addSubview:cycleScrollView];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 210, SCREEN_WIDTH, 30)];
        title.text = @"编辑·精选";
        title.font = [UIFont systemFontOfSize:18];
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
        [headerView addSubview:title];
        
        UIView *underLine = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 20) / 2, CGRectGetMaxY(title.frame) + 1, 20, 0.5)];
        underLine.backgroundColor = [UIColor colorWithRed:72/255.0 green:72/255.0 blue:72/255.0 alpha:1];
        [headerView addSubview:underLine];
        
        return headerView;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
