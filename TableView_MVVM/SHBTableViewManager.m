//
//  SHBTableViewManager.m
//  TableView_MVVM
//
//  Created by 沈红榜 on 15/12/18.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "SHBTableViewManager.h"
#import "SHBCell.h"

@interface SHBTableViewManager ()

@property (nonatomic, copy) SHBTableViewIndentifier     indentifier;
@property (nonatomic, copy) SHBTableViewConfigCell      configCell;
@property (nonatomic, copy) SHBTableViewRowHeight       rowHeight;
@property (nonatomic, copy) SHBTableViewDidSelected     didSelected;

@end

@implementation SHBTableViewManager {
    NSArray         *_dataArray;
}


- (id)initWithDataArray:(NSArray *)dataArray
            indentifier:(SHBTableViewIndentifier)indentifier
             configCell:(SHBTableViewConfigCell)configCell
              rowHeight:(SHBTableViewRowHeight)rowHeight
            didSelected:(SHBTableViewDidSelected)didSelected
           forTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _dataArray = dataArray;
        self.indentifier = indentifier;
        self.configCell = configCell;
        self.rowHeight = rowHeight;
        self.didSelected = didSelected;
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = _dataArray[indexPath.row];
    
    NSString *inden = self.indentifier(model, indexPath);
    UITableViewCell *cell = nil;
    
    Class class = [self classInIndexPath:indexPath];
    cell = [tableView dequeueReusableCellWithIdentifier:inden];
    if (!cell) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inden];
    }

    if (_configCell) {
        _configCell(cell, model, indexPath);
    }
    
    ((UITableViewCell *)cell).selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = _dataArray[indexPath.row];
    return self.rowHeight(model, indexPath);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = _dataArray[indexPath.row];
    self.didSelected(model, indexPath);
}

- (Class)classInIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2) {
        return [UITableViewCell class];
    }
    return NSClassFromString(@"SHBCell");
}

@end
