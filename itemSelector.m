#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>

@implementation Utilities
+(void)fillItemSelector:(UIScrollView*)scrollView borderColor:(UIColor*)borderColor viewController:(UIViewController*)viewController radius:(int)pictureSize showName:(BOOL)showName items:(NSArray *)items nameFont:(UIFont *)nameFont nameColor:(UIColor *)nameColor nameSelectedColor:(UIColor *)nameSelectedColor{
    for (UIView *subview in scrollView.subviews) {
        [subview removeFromSuperview];
    }
    [scrollView setContentSize:CGSizeMake(items * (pictureSize+10), scrollView.frame.size.height)];
    int itemIndex = 0;
    for (NSDictionary* item in items){
        UIView *buttonView = [[UIView alloc]init];
        buttonView.frame = CGRectMake(itemIndex*(pictureSize+10), 0, pictureSize, pictureSize);
        UIButton *pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [pictureButton addTarget:viewController action:@selector(selectedItem:) forControlEvents:UIControlEventTouchUpInside];
        ;
        pictureButton.frame = CGRectMake(0, 0, pictureSize, pictureSize);
        [pictureButton setTag:itemIndex];

        pictureButton.layer.cornerRadius = pictureButton.frame.size.width/2;
        pictureButton.clipsToBounds = YES;
        [[pictureButton layer] setBorderWidth:4.0];
        [[pictureButton layer] setBorderColor:[borderColor CGColor]];

        if (![[item valueForKey:@"pictureURL"] isEqual:[NSNull null]]){
            [pictureButton setBackgroundImageWithURL:[NSURL URLWithString:[item valueForKey:@"pictureURL"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"item_placeholder.png"]];
        }
        [buttonView addSubview:pictureButton];
        [buttonView setTag:itemIndex];

        if (showName){
            UIButton *nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [nameButton addTarget:viewController action:@selector(selectedItem:) forControlEvents:UIControlEventTouchUpInside];
            ;
            [nameButton setTitle:[dog getUpperCaseName] forState:UIControlStateNormal];
            [nameButton setTitleColor:nameColor forState:UIControlStateNormal];
            [nameButton setTitleColor:nameSelectedColor forState:UIControlStateSelected];
            [nameButton.titleLabel setFont:nameFont];
            nameButton.frame = CGRectMake(0, pictureSize+5, pictureSize, 20);
            [nameButton setTag:itemIndex];
            [buttonView addSubview:nameButton];
        }
        [scrollView addSubview:buttonView];
        itemIndex +=1;
    }

}

@end
