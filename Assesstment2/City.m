//
//  City.m
//  Assesstment2
//
//  Created by Efrén Reyes Torres on 7/31/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import "City.h"

@implementation City
-(instancetype)initWithName:(NSString *)name state:(NSString *)state {
    self = [super init];
    self.name = name;
    self.state = state;
    return self;
}
@end
