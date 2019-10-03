//
//  SubSubSomeClass.h
//  Runtime
//
//  Created by kkk on 2019/10/3.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSomeClass.h"

@interface SubSubSomeClass : SubSomeClass

- (void)subSubSomeMethod;

- (void)instanceMethod;
+ (void)classMethod;

- (void)noImpInstanceMethod;
+ (void)noImpClassMethod;

@end
