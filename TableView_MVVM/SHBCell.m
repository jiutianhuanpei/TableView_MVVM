//
//  SHBCell.m
//  TableView_MVVM
//
//  Created by 沈红榜 on 15/12/18.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "SHBCell.h"

@implementation SHBCell {
    UILabel     *_label;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 200, 40)];
        _label.textColor = [UIColor redColor];
        [self addSubview:_label];
    }
    return self;
}

- (void)configModel:(NSString *)title {
    _label.text = title;
}

+ (CGFloat)height:(NSString *)title {
    return 60;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
