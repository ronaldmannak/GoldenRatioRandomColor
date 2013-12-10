//
//  REMHomeViewController.m
//  GoldenRatioRandomColor
//
//  Created by Ronald Mannak on 12/9/13.
//  Copyright (c) 2013 Ronald Mannak. All rights reserved.
//

#import "REMHomeViewController.h"
#import "UIColor+GoldenRatio.h"

static const NSInteger kNumberOfColors = 50;

@interface REMHomeViewController ()

@property (nonatomic, strong) NSMutableArray *colors;

@end

@implementation REMHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(createRandomColors:) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:refreshControl];
    
    [self createRandomColors:nil];
}

- (void)createRandomColors:(UIRefreshControl *)refreshControl
{
    self.colors = [NSMutableArray arrayWithCapacity:kNumberOfColors];
    
    for (int i = 0; i < kNumberOfColors; i++) {
        double randomNumber = drand48();
        NSLog(@"Random number: %f", randomNumber);
        [self.colors addObject:[UIColor ColorWithGoldenRatioValue:randomNumber]];
    }
    [refreshControl endRefreshing];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.colors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.backgroundColor = self.colors[indexPath.row];
    
    return cell;
}

@end
