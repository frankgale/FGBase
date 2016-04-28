//
//  JsonUtil.h
//  FGBase
//
//  Created by Ken Feng on 16/4/20.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonUtil : NSObject

/**
 *  Json转字典
 *
 *  @param jsonStr json数据
 *
 *  @return 字典
 */
+ (NSDictionary *)JsonToDict:(NSString *)jsonStr;

/**
 *  字典转对象
 *
 *  @param C   类
 *  @param dic 字典
 *
 *  @return 转好的对象
 */
+ (id)DictToModel:(NSString *)cName andDict:(NSDictionary *)dic;

@end
