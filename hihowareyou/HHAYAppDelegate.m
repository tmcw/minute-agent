//
//  AppDelegate.m
//  xtw
//
//  Created by Tom MacWright on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HHAYAppDelegate.h"
#import "HHAYController.h"

@implementation HHAYAppDelegate

- (void)dealloc
{
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    HHAYController *hhay = [HHAYController alloc];
    [[hhay init] autorelease];
}

@end
