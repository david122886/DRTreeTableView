//
//  ViewController.m
//  DRTreeFolderView
//
//  Created by david on 13-12-18.
//  Copyright (c) 2013年 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DRTreeTableView *tree = [[DRTreeTableView alloc] initWithFrame:(CGRect){10,10,200,500} withTreeNodeArr:[TreeTestModel getTestNodeArr]];
    tree.delegate = self;
    tree.backgroundColor = [UIColor blueColor];
    [self.view addSubview:tree];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark DRTreeTableViewDelegate
-(BOOL)drTreeTableView:(DRTreeTableView *)treeView isExtendChildSelectedTreeNode:(DRTreeNode *)selectedNote{
    return YES;
}

-(void)drTreeTableView:(DRTreeTableView *)treeView didSelectedTreeNode:(DRTreeNode *)selectedNote{
    NSLog(@"selected Level:%d,selected note Name:%@",selectedNote.noteLevel,selectedNote.noteContentName);
}
#pragma mark --
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
