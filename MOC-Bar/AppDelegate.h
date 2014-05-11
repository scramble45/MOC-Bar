//
//  AppDelegate.h
//  MOC-Bar
//
//  Created by Rowan Hamilton on 5/5/14.
//  Copyright (c) 2014 Rowan Hamilton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Growl/Growl.h>
#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>{
    NSStatusItem *statusItem;
    NSImage *statusImage;
    NSImage *statusHighlightImage;
    IBOutlet NSMenu *statusMenu;
    NSString *mocpswitch;
    NSArray *mocpArgs;
    NSPipe * out;
}

//- (IBAction)SaveChangeToPaths:(id)sender;
//@property (assign) IBOutlet NSWindow *window;


//Options:
//@property (assign) IBOutlet NSMenuItem *Desktop;


//Presets:
//@property (strong, nonatomic) IBOutlet NSTextField *Path001;



@end
