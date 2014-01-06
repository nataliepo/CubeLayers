//
//  CubeLayer.m
//  CubeLayers
//
//  Created by natalie on 1/6/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

#import "CubeLayer.h"

@implementation CubeLayer

@synthesize origin, label;

-(id)initWithOrigin:(CGPoint)newOrigin
        labelString:(NSString*)labelString
  useRoundedCorners:(BOOL)useRoundedCorners {
    self = [super initWithFrame:NSMakeRect(newOrigin.x,
                                           newOrigin.y,
                                           CUBE_SIZE,
                                           CUBE_SIZE)];
    
    if (self) {
        origin = newOrigin;
        label = labelString;
        
        [self addVisualEffects];
        [self setAlphaValue:[CubeLayer randomTransparency]];
        // Makes rounded corners.
        if (useRoundedCorners) {
            self.wantsLayer = YES;
        }


    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {

    
    if (self.wantsLayer) {
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
    }
    // set any NSColor for filling, say white:
    [[CubeLayer randomColor] setFill];
    NSRectFill(dirtyRect);

    

    
    [super drawRect:dirtyRect];
    

}


-(void)addVisualEffects {
    
   /*
    NSLog(@"'%@'origin = (%.2f, %.2f)", label, origin.x, origin.y);
    
    NSTextField * labelField = [[NSTextField alloc] initWithFrame:NSMakeRect((CUBE_SIZE / 2) + origin.x,
                                                                             (CUBE_SIZE / 2) + origin.y,
                                                                             CUBE_SIZE / 4,
                                                                             CUBE_SIZE / 4)];
    
    [labelField setStringValue:label];
    [labelField setBackgroundColor:[NSColor clearColor]];
    
    [self addSubview:labelField];
    
    labelField = nil;
    */
    
    
}

+(float)randomTransparency {
    NSArray * transparencies = @[
                         [NSNumber numberWithFloat:0.55],
                         [NSNumber numberWithFloat:0.6],
                         [NSNumber numberWithFloat:0.65],
                         [NSNumber numberWithFloat:0.7],
                         [NSNumber numberWithFloat:0.8],
                         [NSNumber numberWithFloat:0.9],
                         ];
    
    return [[transparencies objectAtIndex:(rand() % [transparencies count])] floatValue];

}
+(NSColor*)randomColor {
    NSArray * colors = @[
                         [NSColor blackColor],
                         [NSColor purpleColor],
                         [NSColor blueColor],
                         [NSColor greenColor],
                         [NSColor yellowColor],
                         [NSColor orangeColor],
                         [NSColor redColor],
                         ];
    
    
    int randomNumber = rand() % [colors count];
    
    return [colors objectAtIndex:randomNumber];
}
@end
