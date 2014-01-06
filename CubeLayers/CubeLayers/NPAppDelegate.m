//
//  NPAppDelegate.m
//  CubeLayers
//
//  Created by natalie on 1/6/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

#import "NPAppDelegate.h"
#import "CubeLayer.h"

#define USE_ROUNDED_CORNERS NO
@implementation NPAppDelegate
@synthesize backView;
@synthesize bigButton;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    CGSize windowSize = [[self.window contentView] frame].size;

    BOOL useRoundedCorners = USE_ROUNDED_CORNERS;
    
    backView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0,
                                                        windowSize.width,
                                                        windowSize.height)];
    
    // Hide to avoid flash on draw.
    [backView setAlphaValue:0.0];
    
    [[self.window contentView] addSubview:backView];
    
    [self addCubeSubviews:useRoundedCorners];
    
    // [self addTextView];
    
    [self addChangeColorButton];
    
    // Hide the cubes.
    [self hideCubes];
    
    if (useRoundedCorners) {
        [[self.window contentView] setWantsLayer:YES];
    }
    
    
    
}

-(void)addCubeSubviews:(BOOL)useRoundedCorners {
    
    CGSize windowSize = [[self.window contentView] frame].size;
    float x = 0, y = 0;
    float spacer = CUBE_SIZE + 5;
    int i = 0;
    while (y <= windowSize.height) {
        
        CubeLayer * cubeLayer = [[CubeLayer alloc] initWithOrigin:CGPointMake(x, y)
                                                      labelString:[NSString stringWithFormat:@"[%d]", i]
                                                useRoundedCorners:useRoundedCorners];
        
        // [[self.window contentView] addSubview:cubeLayer];
        [backView addSubview:cubeLayer];

        x += spacer;
        
        if (x >= windowSize.width) {
            x = 0;
            y += spacer;
        }
        i++;
        
        cubeLayer = nil;
    }
}

-(void)addTextView {
    CGSize windowSize = [[self.window contentView] frame].size;
    CGSize targetSize = CGSizeMake(200, 100);

    NSTextView * bigTextBox = [[NSTextView alloc] initWithFrame:CGRectMake((windowSize.width - targetSize.width) / 2.0,
                                                                           (windowSize.height - targetSize.height) / 2.0,
                                                                           targetSize.width,
                                                                           targetSize.height)];
    
    
    [bigTextBox setString:@"This is where the JSON goes."];
    
    [[self.window contentView] addSubview:bigTextBox];
    
    bigTextBox = nil;
}

-(void)addChangeColorButton {
    CGSize windowSize = [[self.window contentView] frame].size;
    CGSize targetSize = CGSizeMake(150, 50);
    
    
    bigButton = [[NSButton alloc] initWithFrame:CGRectMake((windowSize.width - targetSize.width) / 2.0,
                                                                      (windowSize.height - targetSize.height) / 2.0,
                                                                      targetSize.width,
                                                                      targetSize.height)];
    
    
    [bigButton setTarget:self];
    
    [[self.window contentView] addSubview:bigButton];
    


}

-(void)showCubes {

    [backView setAlphaValue:1.0];
    [bigButton setTitle:@"Hide Cubes"];
    [bigButton setAction:@selector(hideCubes)];

}
-(void)hideCubes {
    [backView setAlphaValue:0.0];
    [bigButton setTitle:@"Show Cubes"];
    [bigButton setAction:@selector(showCubes)];
}

@end
