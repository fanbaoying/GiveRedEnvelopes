//
//  CBHongBaoVC.m
//  PersonCar
//
//  Created by cheBaidu on 2018/2/6.
//  Copyright © 2018年 车佰度. All rights reserved.
//

#import "CBHongBaoVC.h"
#define SafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64)
#define NAV_BAR_Item ([UIScreen mainScreen].bounds.size.height == 812.0 ? 54 : 34)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define RGB(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]
#define SYRealValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)//屏幕适配

#import "BigButton.h"//放大big 点击区域
#import "CBHongBaoTableViewCell.h"
#import "UIButton+ImageTitleSpacing.h"
#import "Masonry.h"
@interface CBHongBaoVC ()<UITableViewDelegate,UITableViewDataSource> {
    UIButton *btn;
    UIButton *btnTwo;
    NSArray * _titleBtnArr;
}

//自己创建的导航栏
@property (nonatomic ,strong)UIView *NavBar;
@property (nonatomic ,strong)UIView *navLine;
@property (nonatomic ,strong)BigButton * leftBtn;
@property (nonatomic ,strong)UITableView *table;
@property (nonatomic ,strong)UILabel *moneyLab;
@property (nonatomic ,strong)UIButton *hairBtn;
@end

@implementation CBHongBaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self leftAndRightNavBar];
    [self.view addSubview:self.table];
    [self.table registerNib:[UINib nibWithNibName:@"CBHongBaoTableViewCell" bundle:nil] forCellReuseIdentifier:@"CBHongBaoTableViewCellID"];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

// 自定义导航栏左侧按钮
- (void)leftAndRightNavBar {
    
    self.NavBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SafeAreaTopHeight)];
    self.NavBar.backgroundColor = [UIColor colorWithRed:214/255.0 green:76/255.0 blue:43/255.0 alpha:1];
    [self.view addSubview:self.NavBar];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, NAV_BAR_Item, 100,20)];
    label.text = @"发红包";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.NavBar addSubview:label];
    self.leftBtn = [BigButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(15, 30, 30, 30);
    [self.leftBtn setImage:[UIImage imageNamed:@"white_back"] forState:UIControlStateNormal];
    [self.leftBtn setTintColor:[UIColor whiteColor]];
    [self.leftBtn addTarget:self action:@selector(leftBarAction) forControlEvents:UIControlEventTouchUpInside];
    [self.NavBar addSubview:self.leftBtn];
    self.navLine = [[UIView alloc]initWithFrame:CGRectMake(0,SafeAreaTopHeight-1 , SCREEN_WIDTH, 1)];
    self.navLine.backgroundColor =RGB(235, 235, 241);
    [self.NavBar addSubview:self.navLine];
    

    
}
- (void)leftBarAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaTopHeight) style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = RGB(240, 239, 246);
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.tableFooterView = [self footerView];
    }
    return _table;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CBHongBaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBHongBaoTableViewCellID" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    if (indexPath.row == 0) {
        cell.hbImg.hidden = NO;
        cell.titleLab.hidden = NO;
        cell.numText.hidden = NO;
        cell.numLab.hidden = NO;
        cell.titleLab.text = @"总金额";
        cell.numText.placeholder = @"0.0";
        cell.numText.keyboardType = UIKeyboardTypeDecimalPad;
        cell.numLab.text = @"个";
        cell.leftLab.constant = 22;
    } else if (indexPath.row == 1) {
        cell.titleLab.hidden = NO;
        cell.numText.hidden = NO;
        cell.numLab.hidden = NO;
        cell.titleLab.text = @"连发个数";
        cell.numText.placeholder = @"填写个数";
        cell.numText.keyboardType = UIKeyboardTypeNumberPad;
        cell.numLab.text = @"个";
    } else if (indexPath.row ==2) {
        cell.titleLab.hidden = NO;
        cell.numText.hidden = NO;
        cell.numLab.hidden = NO;
        cell.titleLab.text = @"红包个数";
        cell.numText.placeholder = @"填写个数";
        cell.numText.keyboardType = UIKeyboardTypeNumberPad;
        cell.numLab.text = @"个";
    } else {
        cell.contentText.hidden = NO;
        cell.contentText.placeholder = @"恭喜发财 大吉大利";
        
    }
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row ==3) {
        return SYRealValue(100);
    }
    return SYRealValue(80);
}

- (UIView *)footerView {
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SYRealValue(170))];
    
     _titleBtnArr = @[@"微信支付",[NSString stringWithFormat:@"零钱(余额:%@元)",@"0.00"]];
    for (int i = 0; i < _titleBtnArr.count; i ++) {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
      
        if (i == 0) {
        btn.frame = CGRectMake(20 , 0, 100, 25);
        } else {
          btn.frame = CGRectMake(130 , 0, 150, 25);
        }
        [btn setTitle:_titleBtnArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.showsTouchWhenHighlighted = YES;
        [btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:2];
        //设置tag值
        btn.tag = i + 100;
        btn.selected = NO;
        [btn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"duigou_hb1"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"duigou_hb2"] forState:UIControlStateSelected];

        [footerView addSubview:btn];
    }  
    
    self.moneyLab = [[UILabel alloc]init];
    self.moneyLab.text = [NSString stringWithFormat:@"￥%@",@"0.00"];
    self.moneyLab.font = [UIFont systemFontOfSize:20.0];
    [footerView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn.mas_bottom).offset(15);
        make.centerX.mas_equalTo(footerView);
        make.height.mas_equalTo(20);
    }];
    
    self.hairBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.hairBtn setImage:[UIImage imageNamed:@"hongbaotie"] forState:0];
    [footerView addSubview:self.hairBtn];
    [self.hairBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moneyLab.mas_bottom).offset(20);
        make.centerX.mas_equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 48));
    }];
    self.hairBtn.adjustsImageWhenHighlighted = NO;
    [self.hairBtn addTarget:self action:@selector(hairBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *informationLab = [[UILabel alloc]init];
    informationLab.font = [UIFont systemFontOfSize:15];
    informationLab.text = @"未领取的红包，将于24小时后发起退款";
    [footerView addSubview:informationLab];
    informationLab.textColor = [UIColor lightGrayColor];
    [informationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(footerView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(footerView);
        make.height.mas_equalTo(20);
    }];
    
    return footerView;
}

- (void)hairBtnAction {
    
    NSLog(@"我要发红包了");
}


- (void)choose:(UIButton *)sender{
    for (int i = 0; i < _titleBtnArr.count; i++) {
        UIButton *btn = (UIButton *)[[sender superview]viewWithTag:100 + i];
        [btn setSelected:NO];
    }
    UIButton *button = (UIButton *)sender;
    [button setSelected:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
