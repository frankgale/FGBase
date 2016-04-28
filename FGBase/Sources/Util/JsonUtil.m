//
//  JsonUtil.m
//  FGBase
//
//  Created by Ken Feng on 16/4/20.
//  Copyright © 2016年 vdaoyun. All rights reserved.
//

#import "JsonUtil.h"
#import <objc/runtime.h>

@implementation JsonUtil

+ (NSDictionary *)JsonToDict:(NSString *)jsonStr{
    if (!jsonStr) {
        return nil;
    }
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"解析失败%@", error);
    }
    return dic;
}

+ (id)DictToModel:(NSString *)cName andDict:(NSDictionary *)dic{
    Class c = NSClassFromString(cName);
    id objc = [c new];
    NSMutableArray *keys = [NSMutableArray new];
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(c, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        [keys addObject:key];
    }
    for (NSString *key in keys) {
        id value = [dic valueForKey:key];
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
