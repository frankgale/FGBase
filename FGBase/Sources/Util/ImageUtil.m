//
//  ImageUtil.m
//  FGBase
//
//  Created by Ken Feng on 16/4/21.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import "ImageUtil.h"

@implementation ImageUtil

+ (UIImage *)scaleImage:(UIImage *)image andNewSize:(CGSize)size{
    //获取需要缩放图片尺寸
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    //计算缩放比例
    CGFloat widthFactor = size.width / width;
    CGFloat heightFactor = size.height / height;
    CGFloat scaleFactor = widthFactor < height ? widthFactor : heightFactor;
    //根据缩放比例计算新的图片尺寸
    CGFloat scaleWidth = width *scaleFactor;
    CGFloat scaleHeight = height *scaleFactor;
    CGSize scaleSize = CGSizeMake(scaleWidth, scaleHeight);
    //绘制图形上下文环境
    UIGraphicsBeginImageContext(scaleSize);
    [image drawInRect:CGRectMake(0, 0, scaleWidth, scaleHeight)];
    //根据上下文环境获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}

@end
