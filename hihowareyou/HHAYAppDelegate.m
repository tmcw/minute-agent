//
//  HHAYAppDelegate.m
//  hihowareyou
//
//  Created by Tom MacWright on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HHAYAppDelegate.h"
#import <AppKit/NSAccessibility.h>
@implementation HHAYAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    if (_systemWideElement) CFRelease(_systemWideElement);
    [super dealloc];
}

extern NSInteger tick;
extern NSInteger tickStrokes;

	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    tickStrokes = 0;
    
    now = [NSDate date];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit) fromDate:now];
    
    tick = [components minute] + ([components hour] * 60);
    
    
    void (^keyLog)(NSEvent*) = ^(NSEvent *event) {
        now = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [calendar components:(NSHourCalendarUnit
            | NSMinuteCalendarUnit) fromDate:now];
        
        nextTick = [components minute] + ([components hour] * 60);
        
        if (tick != nextTick) {
            logPath = [@"~/log/keystrokes.log" stringByExpandingTildeInPath];
            output = [NSFileHandle fileHandleForWritingAtPath:logPath];
            [output seekToEndOfFile];

            [output writeData:[[NSString stringWithFormat:@"%d, %d\n", tick, tickStrokes] dataUsingEncoding:NSUTF8StringEncoding]];
            tickStrokes = 0;
        }
        tick = nextTick;
        tickStrokes++;
        
    };
    
    // Love you: http://ds.io/vLYCtd
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:keyLog];
}

@end
