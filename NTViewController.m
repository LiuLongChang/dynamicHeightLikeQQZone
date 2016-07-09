//
//  NTViewController.m
//  TableViewQQZone
//
//  Created by 刘隆昌 on 14-12-31.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import "NTViewController.h"

@interface NTViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
 
    UITableView * _tableView;
    NSMutableArray * _status;
    NSMutableArray * _statusCells;
    
}

@end

@implementation NTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self initData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

    
    
    
}


-(void)initData{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"statusinfo" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    _status = [NSMutableArray array];
    _statusCells = [NSMutableArray array];
    
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [_status addObject:[NTStatus statusWithDictionary:obj]];
        NTStatusTableViewCell * cell = [[NTStatusTableViewCell alloc]init];
        [_statusCells addObject:cell];
        
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _status.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"ID";
    NTStatusTableViewCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell = [[NTStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        
    }
    NTStatus * status = _status[indexPath.row];
    cell.status = status;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NTStatusTableViewCell * cell = _statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    return cell.height;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
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
