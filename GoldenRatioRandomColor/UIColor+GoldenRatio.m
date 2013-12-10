//
//  UIColor+GoldenRatio.m
//  GoldenRatioRandomColor
//
//  Created by Ronald Mannak on 12/9/13.
//  Copyright (c) 2013 Ronald Mannak. All rights reserved.
//

#import "UIColor+GoldenRatio.h"

static const double goldenRatioConjugate = 0.618033988749895;

@implementation UIColor (GoldenRatio)

// Adapted from PHP code below
+ (UIColor *)ColorWithGoldenRatioValue:(double)startValue
{
    startValue += goldenRatioConjugate;
    startValue = startValue - (floor(startValue / 1) * 1); // equals (%=1)
    
    return [UIColor colorWithHue:startValue saturation:.5 brightness:.95 alpha:1.f];
}

/*
 golden_ratio_conjugate = 0.618033988749895
 h = rand # use random start value
 gen_html {
 h += golden_ratio_conjugate
 h %= 1
 hsv_to_rgb(h, 0.5, 0.95)
 */


/*
 
 http://devmag.org.za/2012/07/29/how-to-choose-colours-procedurally-algorithms/
 
 offset = Random.NextFloat();
 
 for (int i = 0; i < n; i++)
 color[i] = gradient.GetColor(offset + (0.618033988749895f * i) % 1);
 
 */


 // http://craigcoded.com/2010/11/30/getting-hsv-from-uicolor/
/*
 +(struct hsv_color)HSVfromRGB:(struct rgb_color)rgb
 {
 struct hsv_color hsv;
 
 CGFloat rgb_min, rgb_max;
 rgb_min = MIN3(rgb.r, rgb.g, rgb.b);
 rgb_max = MAX3(rgb.r, rgb.g, rgb.b);
 
 if (rgb_max == rgb_min) {
 hsv.hue = 0;
 } else if (rgb_max == rgb.r) {
 hsv.hue = 60.0f * ((rgb.g - rgb.b) / (rgb_max - rgb_min));
 hsv.hue = fmodf(hsv.hue, 360.0f);
 } else if (rgb_max == rgb.g) {
 hsv.hue = 60.0f * ((rgb.b - rgb.r) / (rgb_max - rgb_min)) + 120.0f;
 } else if (rgb_max == rgb.b) {
 hsv.hue = 60.0f * ((rgb.r - rgb.g) / (rgb_max - rgb_min)) + 240.0f;
 }
 hsv.val = rgb_max;
 if (rgb_max == 0) {
 hsv.sat = 0;
 } else {
 hsv.sat = 1.0 - (rgb_min / rgb_max);
 }
 
 return hsv;
 }
 */

@end
