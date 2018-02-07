//
//  ViewController.m
//  发红包界面
//
//  Created by cheBaidu on 2018/2/7.
//  Copyright © 2018年 车佰度. All rights reserved.
//

#import "ViewController.h"
#import "CBHongBaoVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CBHongBaoVC *vc = [[CBHongBaoVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
