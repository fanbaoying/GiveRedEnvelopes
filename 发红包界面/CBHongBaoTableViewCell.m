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
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"恭喜发财 大吉大利";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [ self.contentText addSubview:placeHolderLabel];
    // same font
    self.contentText.font = [UIFont systemFontOfSize:17.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:17.f];
    
    [ self.contentText setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到view上
    [self addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.contentText resignFirstResponder];
    [self.numText resignFirstResponder];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
