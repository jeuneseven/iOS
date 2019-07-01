//
//  ViewController.m
//  KVO
//
//  Created by 李占昆 on 2019/7/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"
#import "SomeClass.h"

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
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.someObject1 addObserver:self forKeyPath:@"intValue" options:options context:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //runtime动态创建的类NSKVONotifying_SomeClass是SomeClass类的子类，superclass指针指向SomeClass
    //NSKVONotifying_SomeClass中含有isa、superclass、setIntValue方法、class、dealloc、_isKVOA等
    //NSKVONotifying_SomeClass中的setIntValue会调用Foundation中的_NSSetIntValueAndNotify方法
    /*
     1.调用顺序为：NSKVONotifying_SomeClass调用setIntValue
     2.调用_NSSetIntValueAndNotify
     3.调用willChangeValueForKey:@"intValue"
     4.[super setIntValue:intValue];
     5.调用[didChangeValueForKey:@"intValue"];
     6.didChangeValueForKey方法会调用监听函数observeValueForKeyPath:
     */
    //self.someObject1->isa NSKVONotifying_SomeClass
    self.someObject1.intValue = 11;
    //self.someObject2->isa SomeClass
    self.someObject2.intValue = 21;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"object == %@ keyPath == %@ change == %@ context == %@", object, keyPath, change, context);
}

@end
