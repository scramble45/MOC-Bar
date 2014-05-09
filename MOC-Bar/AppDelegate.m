//
//  AppDelegate.m
//  MOC-Bar
//
//  Created by Rowan Hamilton on 5/5/14.
//  Copyright (c) 2014 r0r0. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;
@synthesize Path001a;


- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}


- (void)awakeFromNib {
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    NSBundle *bundle = [NSBundle mainBundle];
    statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Icon1" ofType:@"png" inDirectory:@".appicons"]];
    statusHighlightImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Icon2" ofType:@"png" inDirectory:@".appicons"]];
    [statusItem setImage:statusImage];
    [statusItem setAlternateImage:statusHighlightImage];
    [statusItem setMenu:statusMenu];
    [statusItem setToolTip:@"MOC-Bar"];
    [statusItem setHighlightMode:YES];
    
    // Delete any existing MOC-Bar data from (ApplicationSupportDirectory).
    NSArray *upaths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory,
                                                          NSUserDomainMask, YES);
    NSString *NSApplicationSupportDirectory = [upaths objectAtIndex:0];
    NSString *apppath = [NSApplicationSupportDirectory stringByAppendingPathComponent:@"MOC-Bar"];
    NSError *error;
    if(![[NSFileManager defaultManager] removeItemAtPath:apppath error:&error]) nil;
    // End of directory delete code.
    
    NSLog(@"MOC-Bar has started.");
    

    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"MOC-Bar"];
    [menu addItemWithTitle:@"Now Playing..." action:@selector(TrackInfo:) keyEquivalent:@""];
    [menu addItemWithTitle:@"Play/Pause" action:@selector(PlayPause:) keyEquivalent:@""];
    [menu addItemWithTitle:@"Next Track" action:@selector(NextTrack:) keyEquivalent:@""];
    [menu addItemWithTitle:@"Previous Track" action:@selector(PreviousTrack:) keyEquivalent:@""];
    //[menu addItemWithTitle:@"Options" action:@selector(Options:) keyEquivalent:@""];
    [menu addItem:[NSMenuItem separatorItem]]; // A thin grey line
    [menu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@""];
    statusItem.menu = menu;
    
}







- (void)NSTaskMonkey {
    NSTask *mocp = [[NSTask alloc] init];
    NSPipe * out = [NSPipe pipe];
    [mocp setStandardOutput:out];
    [mocp setLaunchPath:@"/usr/local/bin/mocp"];
    NSArray *mocpArgs = [NSArray arrayWithObjects:mocpswitch, nil];
    [mocp setArguments:mocpArgs];
    [mocp launch];
    [mocp waitUntilExit];
    mocp = nil;
}



- (void)TrackInfo2 {
     [NSArray arrayWithObjects:mocpswitch = @"-i", nil];
    [self NSTaskMonkey];
    NSLog(@"Value = %@", mocpswitch);
}


// Play Pause Action
- (void) PlayPause: (id)sender{
//- (IBAction)PlayPause:(id)sender{
    [NSArray arrayWithObjects:mocpswitch = @"-G", nil];
    [self NSTaskMonkey];
    
}

// Move to Next Track
- (IBAction)NextTrack:(id)sender{
[NSArray arrayWithObjects:mocpswitch = @"-f", nil];
    [self NSTaskMonkey];
    
}

// Move to Previous Track
- (IBAction)PreviousTrack:(id)sender{
[NSArray arrayWithObjects:mocpswitch = @"-r", nil];
    [self NSTaskMonkey];
}


- (IBAction)TrackInfo:(id)sender{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/local/bin/mocp"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-i", nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"MOC File Loaded:\n%@", string);
    
    [string release];
    [task release];
    

    
    // Add growl here.
    
    
    //menu system update

    
    //end of menu system update
    
    //Loop for updating
    
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //end of loop for udpating.
    
}



- (void)dealloc {
    [statusImage release];
    [statusMenu release]; // added today
    [statusHighlightImage release];
    [super dealloc];
}

// Add Growl Support in Future
// Display build information.
//- (NSString *)bundleVersionNumber {
//    return [[[NSBundle bundleWithIdentifier:\
//              FF_PREFPANE_BUNDLE_IDENTIFIER] infoDictionary]\
//            valueForKey:@"CFBundleVersion"];
//}


@end
