//
//  SHBCell.h
//  TableView_MVVM
//
//  Created by 沈红榜 on 15/12/18.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHBCell : UITableViewCell

- (void)configModel:(NSString *)title;
+ (CGFloat)height:(NSString *)title;

@end
