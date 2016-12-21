//
//  ViewController.m
//  Demo
//
//  Created by Freda on 2016/12/21.
//  Copyright © 2016年 freda. All rights reserved.
//

#import "ViewController.h"
#import "FRModel.h"
#import "FRCountDown.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (strong, nonatomic) FRCountDown *countDown;
@property (nonatomic,strong) NSArray *viewModels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _countDown = [[FRCountDown alloc]init];
    [self.view addSubview:self.tableView];
    
    
    //每一秒调用一次
    [_countDown countDownWithPER_SECBlock:^{
        [self updateTime];
    }];
}

- (void)updateTime {
    //所有可见的cell
    NSArray  *cells = self.tableView.visibleCells;
    for (int i = 0; i < self.viewModels.count; i++) {
        FRModel *model = self.viewModels[i];
        UITableViewCell *cell = cells[i];
        double timeInterval = [_countDown getNowTimeWithString:model.time];
        if (timeInterval <= 0) {
            //倒计时结束
            cell.detailTextLabel.text = @"可以抢";
        }else {
            cell.detailTextLabel.text = [_countDown countDownTime:timeInterval];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewdatasource,delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    FRModel *model = self.viewModels[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.time;
    return cell;
}


#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.frame;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.rowHeight = 40;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)viewModels {
    
    FRModel *model1 = [[FRModel alloc]init];
    model1.title = @"早餐红包";
    model1.time = @"2016-12-22 09:00:00";
    
    FRModel *model2 = [[FRModel alloc]init];
    model2.title = @"午餐红包";
    model2.time = @"2016-12-22 12:10:00";
    
    FRModel *model3 = [[FRModel alloc]init];
    model3.title = @"晚餐红包";
    model3.time = @"2016-12-22 18:45:00";
    
    FRModel *model4 = [[FRModel alloc]init];
    model4.title = @"夜宵红包";
    model4.time = @"2016-12-22 22:30:00";
    
    return @[model1,model2,model3,model4];
}



@end
