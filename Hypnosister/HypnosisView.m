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
  // [[UIColor lightGrayColor] setStroke];

    //draw concentric circles from the outside in
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        [[self getRandomColor] setStroke];
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    //create a string
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    // this really sucks
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0; 
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    ///shadow
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color= [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    //draw it
    [text drawInRect:textRect 
            withFont:font];
    
}

- (UIColor *) getRandomColor {
    return [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
}
@end
