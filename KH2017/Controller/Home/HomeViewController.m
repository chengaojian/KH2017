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

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *homeCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
    [self setNav];
    [self initCollectionView];
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)dataArr {
   
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        HomeViewModel *model1 = [[HomeViewModel alloc]init];
        model1.title = @"中华文化跟你什么关系";
        model1.time = @"15804人观看";
        model1.row = 0;
        [_dataArr addObject:model1];
        
        HomeViewModel *model2 = [[HomeViewModel alloc]init];
        model2.title = @"希腊语是如何影响英语的？";
        model2.time = @"8259人观看";
        model2.row = 1;
        [_dataArr addObject:model2];
        
        HomeViewModel *model3 = [[HomeViewModel alloc]init];
        model3.title = @"10个男生想让女生知道的事";
        model3.time = @"110.5k人观看";
        model3.row = 2;
        [_dataArr addObject:model3];
        
        HomeViewModel *model4 = [[HomeViewModel alloc]init];
        model4.title = @"如果这个世界没有吃......";
        model4.time = @"1192人观看";
        model4.row = 3;
        [_dataArr addObject:model4];
//        for (int i = 0; i < 4; i ++) {
//            HomeViewModel *model = [[HomeViewModel alloc]init];
//            model.title = [NSString stringWithFormat:@"今天是%d号",i + 1];
//            model.time = [NSString stringWithFormat:@"2010-0%d-0%d",i + 1, i + 2];
//            model.row = i;
//            [_dataArr addObject:model];
//        }
    }
    return _dataArr;
}

- (void)loadData {
    
}

- (void)setNav {
    
}

- (void)initCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 50);
//    layout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 50);
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
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCollectionViewCell *cell = (HomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCellID" forIndexPath:indexPath];
    [cell configWithHomeCollectonViewCell:self.dataArr[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionViewHeader" forIndexPath:indexPath];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 30)];
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
