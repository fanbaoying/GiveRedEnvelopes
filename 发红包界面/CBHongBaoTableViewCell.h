//
//  CBHongBaoTableViewCell.h
//  PersonCar
//
//  Created by cheBaidu on 2018/2/6.
//  Copyright © 2018年 车佰度. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBHongBaoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hbImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *contentText;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UITextField *numText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLab;
@property (weak, nonatomic) IBOutlet UIView *baseView;

@end
