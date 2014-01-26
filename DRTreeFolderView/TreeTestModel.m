//
//  TreeTestModel.m
//  DRTreeFolderView
//
//  Created by david on 13-12-18.
//  Copyright (c) 2013年 david. All rights reserved.
//

#import "TreeTestModel.h"

@implementation TreeTestModel
+(NSMutableArray*)getTestNodeArr{
    NSMutableArray *notes = [NSMutableArray array];
    for (int index = 0; index < 5; index++) {
        [notes addObject:[TreeTestModel createOneNoteWithLevel:0 withNoteId:100*index withMaxLevelCount:index+1>3?1:(index+1)]];
    }
    return notes;
}

+(DRTreeNode*)createOneNoteWithLevel:(int)level withNoteId:(int)noteID withMaxLevelCount:(int)levelCount{
    DRTreeNode *note = [[DRTreeNode alloc] init];
    note.noteId = noteID;
    if (level < 2) {
        note.noteIsExtend = YES;
    }else
        note.noteIsExtend = NO;
    
    note.noteContentName = [NSString stringWithFormat:@"note%d",level];
    note.noteLevel = level;
    NSMutableArray *childNoteArr = [NSMutableArray array];
    if (level < levelCount) {
        for (int i = noteID+1; i < noteID+5; i++) {
            [childNoteArr addObject:[TreeTestModel createOneNoteWithLevel:level+1 withNoteId:i withMaxLevelCount:levelCount]];
        }
    }
    note.childnotes = childNoteArr;
    return note;
}

+(DRTreeNode*)getTestNode{
    return [TreeTestModel createOneNoteWithLevel:0 withNoteId:0 withMaxLevelCount:3];
}
@end
