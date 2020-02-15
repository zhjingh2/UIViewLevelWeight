//
//  UIView+LevelWeight.m
//
//  Created by zhangjinghao on 2019/9/26.
//  Copyright © 2019 netease. All rights reserved.
//

#import "UIView+LevelWeight.h"
#import <objc/runtime.h>

static const void *UIViewLevelWeightKey = &UIViewLevelWeightKey;

@interface UIView ()

@property (nonatomic, strong) NSNumber *levelWeight;

@end

@implementation UIView (LevelWeight)

#pragma mark - Public Methods

- (void)addSubview:(UIView *)view levelWeight:(NSInteger)levelWeight {
    
    if ([self.subviews containsObject:view]) {
        [view removeFromSuperview];
    }
    view.levelWeight = @(levelWeight);
    UIView *aboveSubview = nil;
    UIView *belowSubview = nil;
    for (UIView *tmpView in self.subviews) {
        if (!tmpView.levelWeight) {
            continue;
        }
        if ([tmpView.levelWeight integerValue] <= levelWeight) {
            aboveSubview = tmpView;
        }
        else {
            belowSubview = tmpView;
            break;
        }
    }
    if (aboveSubview) {
        [self insertSubview:view aboveSubview:aboveSubview];
    }
    else if (belowSubview) {
        [self insertSubview:view belowSubview:belowSubview];
    }
    else {
        [self addSubview:view];
    }
}

#pragma mark - Getters & Setters

- (void)setLevelWeight:(NSNumber *)levelWeight {
    objc_setAssociatedObject(self, &UIViewLevelWeightKey, levelWeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)levelWeight {
    return objc_getAssociatedObject(self, &UIViewLevelWeightKey);
}

@end
