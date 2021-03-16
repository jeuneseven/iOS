//
//  SubSomeClass.h
//  Runtime
//
//  Created by kkk on 2019/10/3.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

@interface SubSomeClass : SomeClass

- (void)subSomeMethod;

- (void)notImpInstanceMethod;
+ (void)notImpClassMethod;

- (void)otherNotImpInstanceMethod;
+ (void)otherNotImpClassMethod;

- (NSInteger)otherNotImpInstanceMethod:(NSInteger)parameter;

@end
