//
//  UIView+Animation.m
//  FGBase
//
//  Created by Ken Feng on 15/11/30.
//  Copyright © 2015年 vdaoyun. All rights reserved.
//

#import "UIView+Animation.h"

float radiansForDegrees(int degrees){
    return degrees * M_PI / 180;
}	

@implementation UIView (Animation)

#pragma mark --- 旋转
- (void)spinClockwise:(CGFloat)secs{
    [UIView animateWithDuration:secs/4
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, radiansForDegrees(90));
                     } completion:nil];
}

- (void)spinCounterClockwise:(CGFloat)secs{
    [UIView animateWithDuration:secs / 4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, radiansForDegrees(270));
                     } completion:^(BOOL finished) {
                         [self spinCounterClockwise:secs];
                     }];
}

#pragma mark --- Transitions
- (void)curlDown:(CGFloat)secs{
    [UIView transitionWithView:self
                      duration:secs
                       options:UIViewAnimationOptionTransitionCurlDown
                    animations:^{
                        [self setAlpha:0];
                    } completion:nil];
}

- (void)curlUpAndAway:(CGFloat)secs{
    [UIView transitionWithView:self
                      duration:secs
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        [self setAlpha:0];
                    } completion:nil];
}

- (void)drainAway:(CGFloat)secs{
    self.tag = 20;
    [NSTimer scheduledTimerWithTimeInterval:secs/50
                                     target:self
                                   selector:@selector(drainTimer:)
                                   userInfo:nil repeats:YES];
}

- (void)drainTimer:(NSTimer *)timer{
    CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformScale(self.transform, 0.9, 0.9),0.314);
    self.transform = trans;
    self.alpha = self.alpha * 0.98;
    self.tag = self.tag - 1;
    if (self.tag <= 0) {
        [timer invalidate];
        [self removeFromSuperview];
    }
}

#pragma mark --- 改变透明度
- (void)changeAlpha:(CGFloat)newAlpha secs:(CGFloat)secs{
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = newAlpha;
                     } completion:nil];
}

- (void)pulse:(CGFloat)secs continuously:(BOOL)continuously{
    [UIView animateWithDuration:secs/2
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                        animations:^{
                          self.alpha = 0.3;
                        } completion:^(BOOL finished) {
                            [UIView animateWithDuration:secs/2
                                                  delay:0.0
                                                options:UIViewAnimationOptionCurveLinear
                                             animations:^{
                                                 self.alpha = 1.0;
                                             } completion:^(BOOL finished) {
                                                 if (continuously) {
                                                     [self pulse:secs continuously:continuously];
                                                 }
                                             }];
                        }];
}

#pragma mark --- 渐变添加子视图
- (void)addSubviewWithFadeAnimation:(UIView *)subview{
    CGFloat finalAlpha = subview.alpha;
    subview.alpha = 0.0;
    [self addSubview:subview];
    [UIView animateWithDuration:0.2 animations:^{
        subview.alpha = finalAlpha;
    }];
}

@end
