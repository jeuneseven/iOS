//
//  ViewController.m
//  Weak
//
//  Created by kkk on 2019/12/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"
#import "SomeClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __strong SomeClass *strongObject;
    __weak SomeClass *weakObject;
    __unsafe_unretained SomeClass *unsafeUnretainedObject;
    
    NSLog(@"__LINE__ == %d", __LINE__);
    
    {
        SomeClass *someObject = [[SomeClass alloc] init];
        //大括号结束后不销毁，viewdidload之后才销毁
//        strongObject = someObject;
        //大括号结束后就销毁
//        weakObject = someObject;
        //大括号结束后就销毁，但要注意不要在外部进行使用，会存在野指针
//        unsafeUnretainedObject = someObject;
    }
    
    NSLog(@"__LINE__ == %d", __LINE__);
//    NSLog(@"unsafeUnretainedObject == %@", unsafeUnretainedObject);
    
    /*
     weak指针释放：clearDeallocating
     */
}


@end
