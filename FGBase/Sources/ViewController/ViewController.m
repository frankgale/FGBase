//
//  ViewController.m
//  FGBase
//
//  Created by Ken Feng on 16/4/20.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import "ViewController.h"
#import "JsonUtil.h"
#import "ImageUtil.h"
#import "Person.h"
#import "JsonUtilController.h"
#import "ImageUtilController.h"

@interface ViewController()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Person *p;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

#pragma mark ==== lazy loading
-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"json处理", @"image处理"];
    }
    return _dataArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark ==== delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifider";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[JsonUtilController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[ImageUtilController new] animated:YES];
            break;
        default:
            break;
    }
}


- (UIImage *)scaleImage{
    UIImage *image = [ImageUtil scaleImage:[UIImage imageNamed:@"icon512"] andNewSize:CGSizeMake(160, 160)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = CGPointMake(160, 160);
    [self.view addSubview:imageView];
    return image;
}

- (Person *)getPerson{
    NSString *cName = NSStringFromClass([Person class]);
    NSString *jsonStr = @"{\"name\": \"dapeng\",  \"sex\": \"1\" }";
    NSDictionary *dic = [JsonUtil JsonToDict:jsonStr];
    self.p = [JsonUtil DictToModel:cName andDict:dic];
    return self.p;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
