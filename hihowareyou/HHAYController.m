//
//  HHAYController.m
//  hihowareyou
//
//  Created by Tom MacWright on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HHAYController.h"
#import <AppKit/NSAccessibility.h>

@implementation HHAYController

@synthesize then;

- (void)alertDidEnd:(NSAlert *)alert
    returnCode:(NSInteger)returnCode
    contextInfo:(void *)contextInfo {
    if (returnCode == NSAlertFirstButtonReturn) {
        logPath = [@"~/log/keystrokes.log"
                   stringByExpandingTildeInPath];
        [[NSFileManager defaultManager]
            createFileAtPath:logPath
            contents:[@"minute,strokes\n"
                dataUsingEncoding:NSUTF8StringEncoding]
            attributes:nil];
    }
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSString* tinyName = [[NSBundle mainBundle]
            pathForResource:@"hhaytiny"
            ofType:@"png"];
        
        tiny = [[NSImage alloc] initWithContentsOfFile:tinyName];
        menu = [[NSMenu alloc] init];
        
        // Set up my status item
        statusItem = [[[NSStatusBar systemStatusBar]
            statusItemWithLength:NSVariableStatusItemLength]
            retain];

        [statusItem setMenu:menu];
        [statusItem retain];
        [statusItem setToolTip:@"minute-agent"];
        [statusItem setImage:tiny];
        [statusItem setHighlightMode:YES];
        // Set up the menu
        quitMI = [[[NSMenuItem alloc]
            initWithTitle:NSLocalizedString(@"Quit",@"") 
            action:@selector(terminate:) 
            keyEquivalent:@""]
        autorelease];

        [menu addItem:quitMI];
    }
    
    // Declare my block variables
    __block long tickStrokes = 0;
    __block long lastTick = 0;
    
    logPath = [@"~/log/keystrokes.log"
        stringByExpandingTildeInPath];
    
    NSString *logDirPath = [@"~/log/"
               stringByExpandingTildeInPath];

    output = [NSFileHandle
        fileHandleForWritingAtPath:logPath];
    
    if (output == nil) {
        NSAlert *alert = [[[NSAlert alloc] init] autorelease];
        [alert addButtonWithTitle:@"OK"];
        [alert addButtonWithTitle:@"Quit"];
        [alert setMessageText:@"It looks like this is the first time you're\
            using minute-agent."];
        [alert setInformativeText:[NSString stringWithFormat:@"Click OK to create %@.", logPath]];
        [alert setAlertStyle:NSWarningAlertStyle];
        NSInteger result = [alert runModal];
        if (result == 1000) {
            // create directory
            NSFileManager *filemgr;
            
            filemgr = [NSFileManager defaultManager];
            [filemgr createDirectoryAtPath:logDirPath withIntermediateDirectories:YES attributes:nil error:nil];
            BOOL success = [filemgr createFileAtPath:logPath contents:[@"minute,strokes\n" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];

            if (success == YES) {
                output = [NSFileHandle
                          fileHandleForWritingAtPath:logPath];
            } else {
                NSAlert *alert = [[[NSAlert alloc] init] autorelease];
                [alert setMessageText:@"Could not create file."];
                [alert setAlertStyle:NSWarningAlertStyle];
                [alert addButtonWithTitle:@"Quit"];
                [alert runModal];
                [NSApp terminate:self];
            }
        } else {
            [NSApp terminate:self];
        }
    }

    [output seekToEndOfFile];
    
    NSFileHandle *pOutput = output;
    
    [NSEvent
     addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
     handler:^ (NSEvent *event) {
        int nextTick = floor([[NSDate date] timeIntervalSince1970] / 60) * 60;
        if (nextTick - lastTick > 60) {
            lastTick = nextTick;

            [pOutput seekToEndOfFile];

            [pOutput writeData:[[NSString
                stringWithFormat:@"%d, %d\n",
                lastTick,
                tickStrokes]
                dataUsingEncoding:NSUTF8StringEncoding]];

            tickStrokes = 0;
        }
        tickStrokes++;
     }];
    
    return self;
}
@end