//
//  Shop.h
//  CMVP
//
//  Created by Thaw De Zin on 29/02/2024.
//

#ifndef Shop_h
#define Shop_h

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *cluster;
@property (nonatomic, strong) NSString *shopDescription;
@property (nonatomic, strong) NSDate *expireOn;
@property (nonatomic, strong) NSString *foodCategory;
@property (nonatomic, strong) NSString *shopID;
@property (nonatomic, strong) NSString *img1;
@property (nonatomic, strong) NSString *img2;
@property (nonatomic, strong) NSString *img3;
@property (nonatomic, assign) BOOL isHalalCertified;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *preserved1;
@property (nonatomic, strong) NSString *preserved2;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *shopType;
@property (nonatomic, strong) NSString *socialMediaLink;

@end

#endif /* Shop_h */

