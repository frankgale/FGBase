//
//  UIImage+Category.h
//  FGBase
//
//  Created by Ken Feng on 15/11/30.
//  Copyright © 2015年 vdaoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
/**
 *  自由拉伸一张图片
 *
 *  @param name 图片名字
 *  @param left 左边开始位置比例     值范围0～1
 *  @param top  上边开始位置比例     值范围0～1
 *
 *  @return 拉伸后的Image
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return Image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 *
 *  @param baseImage 基础图片
 *  @param theColor  设置颜色
 *
 *  @return 加深颜色之后的图片
 */
+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;


/**
 *  自由改变Image的大小
 *
 *  @param size 目的大小
 *
 *  @return 修改后的image
 */
- (UIImage *)cropImageWithSize:(CGSize)size;

@end
