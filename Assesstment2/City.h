//
//  City.h
//  Assesstment2
//
//  Created by Efrén Reyes Torres on 7/31/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property NSString *name;
@property NSString *state;

-(instancetype)initWithName:(NSString *)name state:(NSString *)state;
@end
