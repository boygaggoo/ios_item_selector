@interface ItemSelector : NSObject
+(void)fillItemSelector:(UIScrollView*)scrollView borderColor:(UIColor*)borderColor viewController:(UIViewController*)viewController radius:(int)pictureSize showName:(BOOL)showName items:(NSArray *)items nameFont:(UIFont *)nameFont nameColor:(UIColor *)nameColor nameSelectedColor:(UIColor *)nameSelectedColor;
@end
