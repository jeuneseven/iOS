//
//  SomeClass.m
//  Runtime
//
//  Created by kkk on 2019/10/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"
//掩码0x00000010，假设使用第二位作为表示BOOL值的位
#define MASK (1 << 1)

#define TALL_MASK (1 << 0)
#define RICH_MASK (1 << 1)
#define HANDSOME_MASK (1 << 2)

@interface SomeClass () {
    //假设使用char类型，占一个字节，用其中一位来表示BOOL值
    char charValue;
    struct {//使用结构体的位域也可以实现，如果有多位，写在前部的在内存地址的低位，冒号后代表所占位数
        char charTypeValue : 1;
    } structValue;
    
    union {//OC的isa指针最终是使用共用体来实现内部结构，这样做可以存储更多的信息
        char bits;
        struct {//用于提高代码可读性，并无实际用处
            char tall : 1;
            char rich : 1;
            char handsome : 1;
        };
    } tallRichHandsome;
}

@end

@implementation SomeClass
//按位与运算即可知道是否包含设定类型
- (void)setCustomType:(CustomEnumType)customType {
    _customType = customType;
    
    if (customType & CustomEnumTypeOne) {
        NSLog(@"Contain CustomEnumTypeOne");
    }
    
    if (customType & CustomEnumTypeTwo) {
        NSLog(@"Contain CustomEnumTypeTwo");
    }
    
    if (customType & CustomEnumTypeThree) {
        NSLog(@"Contain CustomEnumTypeThree");
    }
    
    if (customType & CustomEnumTypeFour) {
        NSLog(@"Contain CustomEnumTypeFour");
    }
    
    if (customType & CustomEnumTypeNone) {
        NSLog(@"Contain None");
    }
}

- (BOOL)boolValue {
    //两次取反可以得到符合要求的BOOL值，按位与操作可以得到想要得到的位上的值
    return !!(charValue & MASK);
}

- (void)setBoolValue:(BOOL)boolValue {
    if (boolValue) {//如果为true时，需要按位或掩码，得到对应位
        charValue |= MASK;
    } else {//如果为false，需要按位与掩码的取反，得到对应位
        charValue &= ~MASK;
    }
}

- (BOOL)boolTypeValue {
    return !!structValue.charTypeValue;
}

- (void)setBoolTypeValue:(BOOL)boolTypeValue {
    structValue.charTypeValue = boolTypeValue;
}

- (BOOL)isTall {
    return !!(tallRichHandsome.bits & TALL_MASK);
}

- (void)setIsTall:(BOOL)isTall {
    if (isTall) {
        tallRichHandsome.bits |= TALL_MASK;
    } else {
        tallRichHandsome.bits &= ~TALL_MASK;
    }
}

- (BOOL)isRich {
    return !!(tallRichHandsome.bits & RICH_MASK);
}

- (void)setIsRich:(BOOL)isRich {
    if (isRich) {
        tallRichHandsome.bits |= RICH_MASK;
    } else {
        tallRichHandsome.bits &= ~RICH_MASK;
    }
}

- (BOOL)isHandsome {
    return !!(tallRichHandsome.bits & HANDSOME_MASK);
}

- (void)setIsHandsome:(BOOL)isHandsome {
    if (isHandsome) {
        tallRichHandsome.bits |= HANDSOME_MASK;
    } else {
        tallRichHandsome.bits &= ~HANDSOME_MASK;
    }
}

- (void)someMethod {
    NSLog(@"%s", __func__);
}

- (void)instanceMethod {
    NSLog(@"%s", __func__);
}

- (void)classMethod {
    NSLog(@"%s", __func__);
}

@end
