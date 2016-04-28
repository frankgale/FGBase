//
//  ImageUtil.h
//  FGBase
//
//  Created by Ken Feng on 16/4/21.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtil : NSObject

/**
 *  按照一定比例缩放图片
 *
 *  @param image 需要处理的图片
 *  @param size  需要缩放的尺寸
 *
 *  @return 缩放完成的图片
 */
+ (UIImage *)scaleImage:(UIImage *)image andNewSize:(CGSize)size;

@end
