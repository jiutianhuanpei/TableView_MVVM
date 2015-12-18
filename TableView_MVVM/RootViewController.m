
//
//  RootViewController.m
//  TableView_MVVM
//
//  Created by 沈红榜 on 15/12/18.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "RootViewController.h"
#import "SHBTableViewManager.h"
#import "SHBCell.h"


@interface RootViewController ()

@end

@implementation RootViewController {
    UITableView         *_tableView;
    SHBTableViewManager *_manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 5; i++) {
        [array addObject:[NSString stringWithFormat:@"name_%d", i]];
    }
    
    
    SHBTableViewIndentifier indentifier = ^NSString *(id model, NSIndexPath *indexPath) {
        if (indexPath.row % 2) {
            return NSStringFromClass([UITableViewCell class]); //2.4.6
        }
        return NSStringFromClass([SHBCell class]);  //1.3.5
    };
    
    SHBTableViewConfigCell  configCell = ^(id cell, id model, NSIndexPath *indexPath) {
        if (indexPath.row % 2) {
            ((UITableViewCell *)cell).textLabel.text = (NSString *)model;
        } else {
            [(SHBCell *)cell configModel:model];
        }
    };
    
    SHBTableViewRowHeight rowHeight = ^CGFloat(id model, NSIndexPath *indexPath) {
        if (indexPath.row % 2) {
            return 44;
        }
        return [SHBCell height:model];
    };
    
    SHBTableViewDidSelected didSelected = ^(id model, NSIndexPath *indexPath) {
        NSLog(@"didSelected:%@", model);
    };
    
    
    _manager = [[SHBTableViewManager alloc] initWithDataArray:array
                                                  indentifier:indentifier
                                                   configCell:configCell
                                                    rowHeight:rowHeight
                                                  didSelected:didSelected
                                                 forTableView:_tableView];
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
