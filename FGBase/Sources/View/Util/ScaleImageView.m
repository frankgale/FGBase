//
//  ScaleImageView.m
//  FGBase
//
//  Created by Ken Feng on 16/4/21.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import "ScaleImageView.h"

@interface ScaleImageView ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end


@implementation ScaleImageView

- (UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
    }
    return _imagePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(openPhotoLibrary) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
//    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
//    picker.delegate = self;
//    picker.allowsEditing = YES;//设置可编辑
//    picker.sourceType = sourceType;
//    [self presentViewController:picker animated:YES completion:nil];//进入照相界面
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openPhotoLibrary{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.sourceType = sourceType;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

#pragma mark ----- delegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    /**
     info 内容
     UIImagePickerControllerCropRect = "NSRect: {{0, 0}, {2668, 1772}}";
     UIImagePickerControllerEditedImage = "<UIImage: 0x7fcf7590e2f0> size {748, 496} orientation 0 scale 1.000000";
     UIImagePickerControllerMediaType = "public.image";
     UIImagePickerControllerOriginalImage = "<UIImage: 0x7fcf759907c0> size {2668, 1772} orientation 0 scale 1.000000";
     UIImagePickerControllerReferenceURL = "assets-library://asset/asset.JPG?id=A4A6230D-EB4F-43B5-875C-973E2F7129FE&ext=JPG";
     */
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", [info objectForKey:@"UIImagePickerControllerReferenceURL"]);
    NSData *data = [NSData dataWithContentsOfURL:[info objectForKey:@"UIImagePickerControllerReferenceURL"]];
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
//    NSLog(@"%@", info);
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
