//
//  ViewController.h
//  KVO
//
//  Created by kkk on 2019/7/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 总结：
 当一个对象使用了KVO时，OC会修改该对象的isa指针，指向一个全新的通过runtime动态创建的子类，该子类拥有自己的set方法实现，set方法中会依次调用willChangeValueForKey:、原类的set方法、didChangeValueForKey:（该方法中又会调用监听方法observeValueForKeyPath:）
 */
@interface ViewController : UIViewController

@end

