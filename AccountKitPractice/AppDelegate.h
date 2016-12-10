//
//  AppDelegate.h
//  AccountKitPractice
//
//  Created by Hanyu on 2016/10/14.
//  Copyright © 2016年 Hanyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

