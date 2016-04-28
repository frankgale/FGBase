//
//  ImageUtilController.m
//  FGBase
//
//  Created by Ken Feng on 16/4/21.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import "ImageUtilController.h"
#import "ScaleImageView.h"

@interface ImageUtilController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIImagePickerController *picker;
@end

@implementation ImageUtilController

#pragma mark ------  lazy loading
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"图片缩放",@"从图库获取图片",@"从相册获取图片",@"拍照获取图片"];
    }
    return _dataArray;
}

- (UIImagePickerController *)picker{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
    }
    return _picker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.picker.delegate = self;
    self.picker.editing = YES;
    // Do any additional setup after loading the view.
}

- (UIImage *)getImageFromCamera{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    self.picker.sourceType = sourceType;
    [self presentViewController:self.picker animated:YES completion:nil];
    return nil;
}

- (UIImage *)getImageFromPhoneLibrary{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.picker.sourceType = sourceType;
    [self presentViewController:self.picker animated:YES completion:nil];
    return nil;
}

- (UIImage *)getImageFromPhotosAlbum{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    self.picker.sourceType = sourceType;
    [self presentViewController:self.picker animated:YES completion:nil];
    return nil;
}

#pragma mark ------  imagePickerDelegate
//点击choose出发
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
}

//点击canel触发
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ------  tableViewDelegate
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[ScaleImageView new] animated:YES];
            break;
        case 1:
            [self getImageFromCamera];
            break;
        case 2:
            [self getImageFromPhotosAlbum];
            break;
        case 3:
            [self getImageFromPhoneLibrary];
            break;
        default:
            break;
    }
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
