//
//  ViewController.h
//  CMVP
//
//  Created by MAC on 29/02/2024.
//

#import <UIKit/UIKit.h>
#import "ShopListCVC.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *shopListCollectionView;


@end



