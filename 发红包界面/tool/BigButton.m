//
//  BigButton.m
//  ZHhantai
//
//  Created by axnet on 16/10/19.
//  Copyright © 2016年 zlnet. All rights reserved.
//

#import "BigButton.h"

@implementation BigButton
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event

{
    //通过修改bounds 的x,y 值就可以只向X 轴或者Y轴的某一个方向扩展
    
    //当bounds 的X 为负,Y 为0,就只向X的正方向扩展点击区域,反之亦然
    
    //当bounds 的Y 为负,X 为0,就只向Y的正方向扩展点击区域,反之亦然
    
    //当bounds 的Y 为0,X 为0,widthDelta,heightDelta来控制扩大的点击区域 ,这个是同时向X 轴正负方向或者同时向Y轴的正负方向
    
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
