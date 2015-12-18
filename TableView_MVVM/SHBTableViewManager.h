//
//  SHBTableViewManager.h
//  TableView_MVVM
//
//  Created by 沈红榜 on 15/12/18.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSString *(^SHBTableViewIndentifier)(id model, NSIndexPath *indexPath);
typedef void(^SHBTableViewConfigCell)(UITableViewCell *cell, id model, NSIndexPath *indexPath);
typedef CGFloat(^SHBTableViewRowHeight)(id model, NSIndexPath *indexPath);
typedef void(^SHBTableViewDidSelected)(id model, NSIndexPath *indexPath);

@interface SHBTableViewManager : NSObject<UITableViewDelegate, UITableViewDataSource>

- (id)initWithDataArray:(NSArray *)dataArray
            indentifier:(SHBTableViewIndentifier)indentifier
             configCell:(SHBTableViewConfigCell)configCell
              rowHeight:(SHBTableViewRowHeight)rowHeight
            didSelected:(SHBTableViewDidSelected)didSelected
           forTableView:(UITableView *)tableView;


/**
 *   在工程中，根据实际重写此方法
 */
//- (Class)classInIndexPath:(NSIndexPath *)indexPath;

@end
