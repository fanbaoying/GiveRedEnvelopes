//
//  CBHongBaoTableViewCell.m
//  PersonCar
//
//  Created by cheBaidu on 2018/2/6.
//  Copyright © 2018年 车佰度. All rights reserved.
//

#import "CBHongBaoTableViewCell.h"
#define RGB(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]

@implementation CBHongBaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.hbImg.hidden = YES;
    self.titleLab.hidden = YES;
    self.contentText.hidden = YES;
    self.numLab.hidden = YES;
    self.numText.hidden = YES;
    self.baseView.layer.masksToBounds = YES;
    self.baseView.layer.cornerRadius = 5;
    self.contentView.backgroundColor = RGB(240, 239, 246);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
