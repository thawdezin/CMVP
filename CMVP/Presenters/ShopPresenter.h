//
//  ShopPresenter.h
//  CMVP
//
//  Created by MAC on 29/02/2024.
//

#ifndef ShopPresenter_h
#define ShopPresenter_h

#import <Foundation/Foundation.h>
#import "Shop.h"

@protocol ShopPresenterDelegate <NSObject>

- (void)shopDataFetchedSuccessfully:(NSArray<Shop *> *)shops;
- (void)shopDataFetchingFailedWithError:(NSError *)error;

@end

@interface ShopPresenter : NSObject

@property (nonatomic, weak) id<ShopPresenterDelegate> delegate;

- (void)fetchShopData;

@end


#endif /* ShopPresenter_h */
