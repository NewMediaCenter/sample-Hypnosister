//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Jerrad Thramer on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) drawRect: (CGRect)rect
{
    //what rect am i filling?
    CGRect bounds = [self bounds];
    
    //Where is center
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //from the center, how far out to a corner?
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Get the context being drawn upon
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //all lines are 10pt wide
    CGContextSetLineWidth(context, 10);
    
    //set stroke color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    //draw concentric circles from the outside in
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
}
@end
