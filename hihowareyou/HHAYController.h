//
//  HHAYController.h
//  hihowareyou
//
//  Created by Tom MacWright on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHAYController : NSObject {
    // UI
    NSStatusItem *statusItem;
    NSMenu *menu;
    NSMenuItem *quitMI;
    NSMenuItem *aboutMI;
    NSImage *tiny;
    
    // Not UI
    NSString *logPath;
    NSString *dateString;
    
    NSTimeInterval since;
    NSDate *now;
    
    long tickStrokes;
    long lastTick;
    
    NSFileHandle *output;
}
@property (retain) NSDate* then;
@end