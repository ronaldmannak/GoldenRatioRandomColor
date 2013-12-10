//
//  REMViewController.m
//  GoldenRatioRandomColor
//
//  Created by Ronald Mannak on 12/9/13.
//  Copyright (c) 2013 Ronald Mannak. All rights reserved.
//

#import "REMViewController.h"
#import "UIColor+GoldenRatio.h"

@interface REMViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@end

@implementation REMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)generate:(id)sender
{
    self.view1.backgroundColor = [UIColor ColorWithGoldenRatioValue:drand48()];
    self.view2.backgroundColor = [UIColor ColorWithGoldenRatioValue:drand48()];
    self.view3.backgroundColor = [UIColor ColorWithGoldenRatioValue:drand48()];
}

@end
