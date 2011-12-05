//
//  HHAYAppDelegate.h
//  hihowareyou
//
//  Created by Tom MacWright on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface HHAYAppDelegate : NSObject <NSApplicationDelegate> {
    AXUIElementRef			    _systemWideElement;
    NSString *logPath;
    NSDate *now;
    long tickStrokes;
    long tick;
    long nextTick;
    NSCalendar *calendar;
    NSFileHandle *output;
}

@property (assign) IBOutlet NSWindow *window;

@end
