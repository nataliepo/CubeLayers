//
//  NPAppDelegate.h
//  CubeLayers
//
//  Created by natalie on 1/6/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NPAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSView * backView;
@property (nonatomic, strong) NSButton * bigButton;


@end
