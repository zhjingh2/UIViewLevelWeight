//
//  UIView+LevelWeight.h
//
//  Created by zhangjinghao on 2019/9/26.
//  Copyright © 2019 netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LevelWeight)

// 添加子视图时，可以指定子视图的层级权重（权重越大，相对层级越高）
- (void)addSubview:(UIView *)view levelWeight:(NSInteger)levelWeight;

@end

NS_ASSUME_NONNULL_END
