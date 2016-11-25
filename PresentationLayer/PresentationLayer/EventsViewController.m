//
//  EventsViewController.m
//  PresentationLayer
//
//  Created by Kardel on 16/11/25.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController () {
    //一行中的列数
    NSUInteger COL_COUNT;
    
}

@property (strong, nonatomic) NSArray *events;

@end

@implementation EventsViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[EventsCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //如果是iPhone设备，列数为2
        COL_COUNT = 2;
    } else {
        //如果是iPad设备，列数为5
        COL_COUNT = 5;
    }
    
    if (self.events == nil || [self.events count] == 0 ) {
        
        EventsBL *bl = [[EventsBL alloc] init];
        
        NSMutableArray *array = [bl readData];
        
        self.events = array;
        
        [self.collectionView reloadData];
        NSLog(@"reload");
    }
    
    // Do any additional setup after loading the view.
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

#pragma mark -- 过渡到EventsDetailViewController的预处理

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        
        NSIndexPath *indexPath = indexPaths[0];
        
        Events *event = self.events[indexPath.section * COL_COUNT + indexPath.row];
        
        EventsDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.event = event;
        
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    if ([self.events count] % COL_COUNT == 0) {
        return [self.events count] / COL_COUNT;
    } else {
        return [self.events count] / COL_COUNT + 1;
    }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return COL_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    EventsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    
    Events *event = [self.events objectAtIndex:(indexPath.section * COL_COUNT + indexPath.row)];
    NSLog(@"EventName = %@, EventIcon = %@", event.EventName, event.EventIcon);
    cell.imageView.image = [UIImage imageNamed:@"archery.gif"];
    
    cell.label.text = event.EventName;
    
    NSLog(@"cell");
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
