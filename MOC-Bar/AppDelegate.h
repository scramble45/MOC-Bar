//
//  AppDelegate.h
//  MOC-Bar
//
//  Created by Rowan Hamilton on 5/5/14.
<<<<<<< HEAD
//  Copyright (c) 2014 Rowan Hamilton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Growl/Growl.h>
=======
//  Copyright (c) 2014 r0r0. All rights reserved.
//

#import <Cocoa/Cocoa.h>
>>>>>>> 4a5a65160483199c5e6d51ddcb9f364b13db17ff
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
<<<<<<< HEAD
//- (IBAction)SaveChangeToPaths:(id)sender;
//@property (assign) IBOutlet NSWindow *window;


//Options:
//@property (assign) IBOutlet NSMenuItem *Desktop;
=======
- (IBAction)SaveChangeToPaths:(id)sender;
@property (assign) IBOutlet NSWindow *window;


//Options:
@property (assign) IBOutlet NSMenuItem *Desktop;
>>>>>>> 4a5a65160483199c5e6d51ddcb9f364b13db17ff



//Presets:
<<<<<<< HEAD
//@property (strong, nonatomic) IBOutlet NSTextField *Path001;
=======
@property (strong, nonatomic) IBOutlet NSTextField *Path001;
>>>>>>> 4a5a65160483199c5e6d51ddcb9f364b13db17ff





@end
