//
//  KKBadgeView.m
//
//  Created by Kemal Kocabiyik on 11/23/12.
//  Copyright (c) 2012 Kemal Kocabiyik. All rights reserved.
//

#import "KKBadgeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation KKBadgeView

-(void)setText:(NSString *)text{
    
    if(text){
        _text = [[NSString alloc] initWithString:text];
        [self initializeLayout];
    }
}


-(void)setIsShadowHidden:(bool)isShadowHidden{
    
    _isShadowHidden = isShadowHidden;
    [self initializeLayout];
    
}

-(void)setGradientStartColor:(UIColor *)gradientStartColor{
    
    if(gradientStartColor){
        _gradientStartColor = gradientStartColor;
        [self initializeLayout];
    }
}

-(void)setGradientEndColor:(UIColor *)gradientEndColor{
    
    if(gradientEndColor){
        _gradientEndColor = gradientEndColor;
        [self initializeLayout];
    }
}

-(void)setTextColor:(UIColor *)textColor{
    
    if(textColor){
        _textColor = textColor;
        [self initializeLayout];
    }
}

-(void)setTextFont:(UIFont *)textFont{
    
    if(textFont){
        _textFont = textFont;
        [self initializeLayout];
    }
}

- (id)initWithFrame:(CGRect) frame andBadgeValue:(NSString *) str{
    

    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 20, 20)];
    
    if(self){
        self.layer.masksToBounds =NO;
        
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowRadius = 1;
        self.layer.shadowOpacity = 0.7;
        self.layer.shadowOffset =  CGSizeMake(0, 3);
        
        _text = [[NSString alloc] initWithString:str];
        _textFont = [UIFont fontWithName:@"Helvetica-Bold" size:13];
        _gradientStartColor = [UIColor redColor];
        _gradientEndColor = [UIColor blackColor];
        _textColor = [UIColor whiteColor];
        _isShadowHidden = NO;
        
        [self initializeLayout];
    }
    
    return self;
}

-(void) initializeLayout{
    
    for(UIView *v in self.subviews){
        [v removeFromSuperview];
    }
    
    if(!self.isShadowHidden){
         self.layer.shadowColor = [[UIColor blackColor] CGColor];
    }else{
        self.layer.shadowColor = [[UIColor clearColor] CGColor];
    }
    
    CGSize size = [_text sizeWithFont:self.textFont];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width + 15, size.height+6);
    
    //ADD BACKGROUND
    UIView *background= [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [background setBackgroundColor:[UIColor whiteColor]];
    
    background.layer.masksToBounds = YES;
    background.layer.cornerRadius = 10;
    
    [self addSubview:background];
    
    //ADD GRADIENT
    UIView *gradientView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, background.frame.size.width - 2, background.frame.size.height - 2)];
    
    gradientView.layer.masksToBounds = YES;
    gradientView.layer.cornerRadius = 10;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = gradientView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[self.gradientStartColor CGColor], (id)[self.gradientEndColor CGColor], nil];
    [gradientView.layer insertSublayer:gradient atIndex:0];
    
    gradientView.center = CGPointMake(background.frame.size.width / 2,background.frame.size.height/2);
    
    background.layer.masksToBounds = YES;
    background.layer.cornerRadius = 10;
    
    [background addSubview:gradientView];
    
    
    //ADD LABEL
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.text = _text;
    label.font = self.textFont;
    label.textColor = self.textColor;
    label.backgroundColor = [UIColor clearColor];
    label.center = CGPointMake(gradientView.frame.size.width/ 2, gradientView.frame.size.height/2);
    [gradientView addSubview:label];
    
    [background addSubview:gradientView];
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale= [UIScreen mainScreen].scale;
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
