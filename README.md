# TableView_MVVM
MVVM 模式的一个Demo

```object
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 5; i++) {
        [array addObject:[NSString stringWithFormat:@"name_%d", i]];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
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

```
