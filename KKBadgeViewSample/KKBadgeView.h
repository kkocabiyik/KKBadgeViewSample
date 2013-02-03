//
//  KKBadgeView.h
//
//  Created by Kemal Kocabiyik on 11/23/12.
//  Copyright (c) 2012 Kemal Kocabiyik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKBadgeView : UIView

@property (strong , nonatomic) NSString *text;
@property (strong , nonatomic) UIFont *textFont;
@property (strong , nonatomic) UIColor *textColor;
@property (strong , nonatomic) UIColor *gradientStartColor;
@property (strong , nonatomic) UIColor *gradientEndColor;
@property (nonatomic) bool isShadowHidden;

- (id)initWithFrame:(CGRect) frame andBadgeValue:(NSString *) str;

@end
