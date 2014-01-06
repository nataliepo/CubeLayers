//
//  CubeLayer.h
//  CubeLayers
//
//  Created by natalie on 1/6/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CubeLayer : NSView {
}


-(id)initWithOrigin:(CGPoint)newOrigin
        labelString:(NSString*)labelString
  useRoundedCorners:(BOOL)useRoundedCorners;

@property (nonatomic, copy) NSString * label;
@property (nonatomic) CGPoint origin;
#define CUBE_SIZE 100

@end
