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
    
    __strong SomeClass *someObject1;
    __weak SomeClass *someObject2;
    __unsafe_unretained SomeClass *someObject3;
    
    {
        SomeClass *someObject = [[SomeClass alloc] init];
        
        
    }
}


@end
