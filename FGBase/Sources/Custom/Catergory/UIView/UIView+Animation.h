//
//  UIView+Animation.h
//  FGBase
//
//  Created by Ken Feng on 15/11/30.
//  Copyright © 2015年 vdaoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

// 位移
- (void)moveTo:(CGPoint)destination duration:(CGFloat)secs option:(UIViewAnimationOptions)option;
- (void)moveTo:(CGPoint)destination duration:(CGFloat)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

//变形
/**
 *  旋转
 *
 *  @param degrees  <#degrees description#>
 *  @param secs     <#secs description#>
 *  @param delegate <#delegate description#>
 *  @param method   <#method description#>
 */
- (void)rootate:(int)degrees secs:(CGFloat)secs delegate:(id)delegate callback:(SEL)method;

/**
 *  缩放
 *
 *  @param secs     <#secs description#>
 *  @param scaleX   <#scaleX description#>
 *  @param scaleY   <#scaleY description#>
 *  @param delegate <#delegate description#>
 *  @param method   <#method description#>
 */
- (void)scale:(CGFloat)secs x:(CGFloat)scaleX y:(CGFloat)scaleY delegate:(id)delegate callback:(SEL)method;

/**
 *  顺时针旋转
 *
 *  @param secs 动画执行时间
 */
- (void)spinClockwise:(CGFloat)secs;

/**
 *  逆时针旋转
 *
 *  @param secs 动画执行时间
 */
- (void)spinCounterClockwise:(CGFloat)secs;

/**
 *  反翻页效果
 *
 *  @param secs 动画执行时间
 */
- (void)curlDown:(CGFloat)secs;

/**
 *  试图翻页后消失
 *
 *  @param secs 动画执行时间
 */
- (void)curlUpAndAway:(CGFloat)secs;

/**
 *  旋转缩放到一点后消失
 *
 *  @param secs 动画执行时间
 */
- (void)drainAway:(CGFloat)secs;

/**
 *  将视图改变到一定透明度
 *
 *  @param newAlpha 透明度范围 0 ～ 1
 *  @param secs     动画执行时间
 */
- (void)changeAlpha:(CGFloat)newAlpha secs:(CGFloat)secs;

/**
 *  改变透明度结束动画后还原
 *
 *  @param secs         alpha
 *  @param continuously 是否循环
 */
- (void)pulse:(CGFloat)secs continuously:(BOOL)continuously;

/**
 *  以渐变方式添加子控件
 *
 *  @param subview 需要添加的子控件
 */
- (void)addSubviewWithFadeAnimation:(UIView *)subview;


@end
