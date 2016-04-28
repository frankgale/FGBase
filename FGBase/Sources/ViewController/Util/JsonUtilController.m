//
//  UtimController.m
//  FGBase
//
//  Created by Ken Feng on 16/4/21.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import "JsonUtilController.h"

@interface JsonUtilController()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation JsonUtilController

#pragma mark ------  lazy loading
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"json转字典",@"字典转对象"];
    }
    return _dataArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark -----   tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
