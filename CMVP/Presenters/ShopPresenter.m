//
//  ShopPresenter.m
//  CMVP
//
//  Created by ThawDeZin on 29/02/2024.
//

#import <Foundation/Foundation.h>
#import "ShopPresenter.h"

@implementation ShopPresenter

- (void)fetchShopData {
    NSLog(@"Fetching shop data...");
    
    // Define the API endpoint URL
    NSString *apiURLString = @"http://10.100.11.98:5000/getAllShops";
    
    // Create a URL object from the API URL string
    NSURL *url = [NSURL URLWithString:apiURLString];
    
    // Create a URL session configuration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Add custom headers to the configuration
    [configuration setHTTPAdditionalHeaders:@{@"User-Agent": @"My User Agent"}];
    
    // Create a URL session with the configuration
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    // Create a data task with the URL session for making a GET request
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Check if there's an error
        if (error) {
            NSLog(@"Error fetching shop data: %@", error);
            // Notify delegate of failure with error
            [self.delegate shopDataFetchingFailedWithError:error];
            return;
        }
        
        // Check if response is valid JSON
        NSError *jsonError;
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"Error parsing JSON: %@", jsonError);
            // Notify delegate of failure with error
            [self.delegate shopDataFetchingFailedWithError:jsonError];
            return;
        }
        
        NSLog(@"Received response: %@", responseObject);
        
        // Parse JSON response
        NSArray *shopsJSON = responseObject[@"shops"];
        NSMutableArray *shops = [NSMutableArray array];
        for (NSDictionary *shopDict in shopsJSON) {
            Shop *shop = [[Shop alloc] init];
            // Populate Shop model properties from dictionary
            shop.address = shopDict[@"address"];
            shop.cluster = shopDict[@"cluster"];
            shop.shopDescription = shopDict[@"description"];
            //shop.expireOn = [self dateFromString:shopDict[@"expireOn"]];
            shop.foodCategory = shopDict[@"foodCategory"];
            shop.shopID = shopDict[@"id"];
            shop.img1 = shopDict[@"img1"];
            shop.img2 = shopDict[@"img2"];
            shop.img3 = shopDict[@"img3"];
            shop.isHalalCertified = [shopDict[@"isHalalCertified"] boolValue];
            shop.latitude = shopDict[@"latitude"];
            shop.longitude = shopDict[@"longitude"];
            shop.name = shopDict[@"name"];
            shop.phone = shopDict[@"phone"];
            shop.preserved1 = shopDict[@"preserved1"];
            shop.preserved2 = shopDict[@"preserved2"];
            shop.remark = shopDict[@"remark"];
            shop.shopType = shopDict[@"shopType"];
            shop.socialMediaLink = shopDict[@"socialMediaLink"];
            [shops addObject:shop];

        }
        
        NSLog(@"Parsed %lu shops", (unsigned long)shops.count);
        
        // Notify delegate of successful data fetch
        [self.delegate shopDataFetchedSuccessfully:shops];
    }];
    
    // Resume the data task to start the request
    [dataTask resume];
}



@end

