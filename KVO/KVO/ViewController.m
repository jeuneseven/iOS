//
//  ViewController.m
//  KVO
//
//  Created by kkk on 2019/7/1.
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
//打印类的方法列表
- (void)printMethodListOfClass:(Class)cls {
    unsigned int count;
    Method *method_list = class_copyMethodList(cls, &count);
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        Method method = method_list[i];
        //获取方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        [tempArray addObject:methodName];
    }
    NSLog(@"class == %@ class method list == %@", cls, tempArray);
    
    free(method_list);
}

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
    //两个值不相等，添加KVO调用的是Foundation框架中的NSSet*ValueAndNotify方法
    /*
     (lldb) p (IMP)0x1054bc164
     (IMP) $0 = 0x00000001054bc164 (Foundation`_NSSetLongLongValueAndNotify)
     (lldb) p (IMP)0x105161520
     (IMP) $1 = 0x0000000105161520 (KVO`-[SomeClass setIntValue:] at SomeClass.h:21)
     */
    NSLog(@"after KVO == %p == %p", [self.someObject1 methodForSelector:@selector(setIntValue:)], [self.someObject2 methodForSelector:@selector(setIntValue:)]);
    //class object == NSKVONotifying_SomeClass == SomeClass
    NSLog(@"runtime class object == %@ == %@", object_getClass(self.someObject1), object_getClass(self.someObject2));
    NSLog(@"class object == %@ == %@", [self.someObject1 class], [self.someObject2 class]);
    //metaClass object == NSKVONotifying_SomeClass == SomeClass
    NSLog(@"metaClass object == %@ == %@", object_getClass(object_getClass(self.someObject1)), object_getClass(object_getClass(self.someObject2)));
    //对比使用class和runtime获取class，证明动态生成的类确实重写了class方法
    //如果动态生成的类没有重写class方法的话，class将最终指向NSObject类的class方法，该方法实现为object_getClass(self)，会直接输出NSKVONotifying_SomeClass，Apple重写该方法的目的是为了屏蔽该类的存在
    [self printMethodListOfClass:[self.someObject1 class]];
    [self printMethodListOfClass:[self.someObject2 class]];
    /*
     class == NSKVONotifying_SomeClass class method list == (
     "setIntValue:",
     class,
     dealloc,
     "_isKVOA"
     )
     */
    [self printMethodListOfClass:object_getClass(self.someObject1)];
    [self printMethodListOfClass:object_getClass(self.someObject2)];
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
    
    //手动触发KVO
    NSLog(@"manual KVO");
    [self.someObject1 willChangeValueForKey:@"intValue"];
    //didChangeValueForKey内部会判断之前是否执行了willChangeValueForKey
    [self.someObject1 didChangeValueForKey:@"intValue"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"object == %@ keyPath == %@ change == %@ context == %@", object, keyPath, change, context);
}

@end
