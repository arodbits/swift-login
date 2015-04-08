//
//  User.h
//  login
//
//  Created by Anthony Rodriguez on 4/7/15.
//  Copyright (c) 2015 capitalofcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * access_token;
@property (nonatomic, retain) NSString * name;

@end
