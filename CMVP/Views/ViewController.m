//
//  ViewController.m
//  CMVP
//
//  Created by MAC on 29/02/2024.
//

#import "ViewController.h"
#import "ShopPresenter.h"
#import "ShopListCVC.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, ShopPresenterDelegate>

@property (nonatomic, strong) ShopPresenter *shopPresenter;
@property (nonatomic, strong) NSArray<Shop *> *shops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Register ShopListCVC as the cell for collection view
    [self.shopListCollectionView registerNib:[UINib nibWithNibName:@"ShopListCVC" bundle:nil] forCellWithReuseIdentifier:@"ShopListCVC"];
    
    // Set data source, delegate, and flow layout delegate
    self.shopListCollectionView.dataSource = self;
    self.shopListCollectionView.delegate = self;
    self.shopListCollectionView.collectionViewLayout = [self collectionViewFlowLayout];
    
    // Initialize shop presenter and set its delegate
    self.shopPresenter = [[ShopPresenter alloc] init];
    self.shopPresenter.delegate = self;
    
    // Fetch shop data
    [self.shopPresenter fetchShopData];
}

- (UICollectionViewFlowLayout *)collectionViewFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(self.shopListCollectionView.frame.size.width, 95);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0;
    return flowLayout;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShopListCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShopListCVC" forIndexPath:indexPath];
    
    // Configure the cell with shop data
    Shop *shop = self.shops[indexPath.item];
    cell.cellName.text = shop.name ;
    cell.cellDesc.text = shop.shopID;
    
    return cell;
}

#pragma mark - ShopPresenterDelegate

- (void)shopDataFetchedSuccessfully:(NSArray<Shop *> *)shops {
    // Update shops array and reload collection view
    self.shops = shops;
    
    // Reload collection view on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.shopListCollectionView reloadData];
    });
    
}

- (void)shopDataFetchingFailedWithError:(NSError *)error {
    // Handle error (e.g., show alert)
    NSLog(@"Shop data fetching failed with error: %@", error);
}

@end
