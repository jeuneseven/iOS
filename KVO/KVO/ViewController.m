//
//  ViewController.m
//  KVO
//
//  Created by 李占昆 on 2019/7/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"
#import "SomeClass.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) SomeClass *someObject1;
@property (nonatomic, strong) SomeClass *someObject2;

@end

@implementation ViewController

- (void)dealloc {
    [self.someObject1 removeObserver:self forKeyPath:@"intValue"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.someObject1 = [[SomeClass alloc] init];
    self.someObject1.intValue = 10;
    
    self.someObject2 = [[SomeClass alloc] init];
    self.someObject2.intValue = 20;
    //before KVO == SomeClass == SomeClass
    NSLog(@"before KVO == %@ == %@", object_getClass(self.someObject1), object_getClass(self.someObject2));
    //两个值相等
    NSLog(@"before KVO == %p == %p", [self.someObject1 methodForSelector:@selector(setIntValue:)], [self.someObject2 methodForSelector:@selector(setIntValue:)]);
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.someObject1 addObserver:self forKeyPath:@"intValue" options:options context:nil];
    //after KVO == NSKVONotifying_SomeClass == SomeClass
    NSLog(@"after KVO == %@ == %@", object_getClass(self.someObject1), object_getClass(self.someObject2));
    //两个值不相等
    NSLog(@"after KVO == %p == %p", [self.someObject1 methodForSelector:@selector(setIntValue:)], [self.someObject2 methodForSelector:@selector(setIntValue:)]);
    //class object == NSKVONotifying_SomeClass == SomeClass
    NSLog(@"class object == %@ == %@", object_getClass(self.someObject1), object_getClass(self.someObject2));
    //metaClass object == NSKVONotifying_SomeClass == SomeClass
    NSLog(@"metaClass object == %@ == %@", object_getClass(object_getClass(self.someObject1)), object_getClass(object_getClass(self.someObject2)));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //runtime动态创建的类NSKVONotifying_SomeClass是SomeClass类的子类，superclass指针指向SomeClass
    //如手动创建NSKVONotifying_SomeClass，KVO将失效
    //NSKVONotifying_SomeClass中含有isa、superclass、setIntValue方法、class、dealloc、_isKVOA等
    //NSKVONotifying_SomeClass的isa指向自己的元类对象NSKVONotifying_SomeClass
    //NSKVONotifying_SomeClass中的setIntValue会调用Foundation中的_NSSetIntValueAndNotify方法
    /*
     1.调用顺序为：NSKVONotifying_SomeClass调用setIntValue
     2.调用_NSSetIntValueAndNotify
     3.调用willChangeValueForKey:@"intValue"
     4.[super setIntValue:intValue];//原来的方法实现
     5.调用[didChangeValueForKey:@"intValue"];
     6.didChangeValueForKey方法会调用监听函数observeValueForKeyPath:
     */
    //self.someObject1->isa NSKVONotifying_SomeClass
    //分别打印添加KVO之前和之后 methodForSelector 的地址：
    //po (IMP)0x10171ec80 输出 (KVO`-[SomeClass setIntValue:] at SomeClass.m:13)
    //po (IMP)0x101a78cf2 输出 (Foundation`_NSSetIntValueAndNotify)
    self.someObject1.intValue = 11;
    //self.someObject2->isa SomeClass
    self.someObject2.intValue = 21;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"object == %@ keyPath == %@ change == %@ context == %@", object, keyPath, change, context);
}

@end
