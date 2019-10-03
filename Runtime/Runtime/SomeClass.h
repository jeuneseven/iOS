//
//  SomeClass.h
//  Runtime
//
//  Created by kkk on 2019/10/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CustomEnumType) {
    CustomEnumTypeNone = 0,
    CustomEnumTypeOne = 1 << 0,
    CustomEnumTypeTwo = 1 << 1,
    CustomEnumTypeThree = 1 << 2,
    CustomEnumTypeFour = 1 << 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface SomeClass : NSObject

@property (assign, nonatomic) CustomEnumType customType;

//可以通过自己实现set、get方法来实现该属性，BOOL类型变量只占一位，可以使用一个字节中的一位来表示
//@property (nonatomic, assign) BOOL boolValue;

- (BOOL)boolValue;
- (void)setBoolValue:(BOOL)boolValue;

- (BOOL)boolTypeValue;
- (void)setBoolTypeValue:(BOOL)boolTypeValue;

- (BOOL)isTall;
- (void)setIsTall:(BOOL)isTall;

- (BOOL)isRich;
- (void)setIsRich:(BOOL)isRich;

- (BOOL)isHandsome;
- (void)setIsHandsome:(BOOL)isHandsome;

- (void)someMethod;

@end

NS_ASSUME_NONNULL_END
