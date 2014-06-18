iOS Item Selector
=================

![demo 1](https://raw.githubusercontent.com/maverick2000/ios_item_selector/master/screenshots/demo_1.png)
![demo 2](https://raw.githubusercontent.com/maverick2000/ios_item_selector/master/screenshots/demo_2.png)

Displays a series of items in a horizontal scrollView allowing the user to select an item.

![demo 3](https://raw.githubusercontent.com/maverick2000/ios_item_selector/master/screenshots/demo_3.png)

Rounded image border is created dynamically and the color can be adjusted.  The name can be omitted if desired.

![demo 4](https://raw.githubusercontent.com/maverick2000/ios_item_selector/master/screenshots/demo_4.png)

Can be used to allow for multiple selection.

Prerequisites
-------------

1. Your items are an NSArray of NSDictionary items which expose pictureURL and itemName
2. Since the items array stores the pictures on a remote server caching is handled by [SDWebImage](https://github.com/rs/SDWebImage)
3. A scrollview to display the itemSelector
4. item_placeholder.png to display while the item picture loads
5. Define an itemSelected method that is called when you tap on the name/picture of the item

Options
-------

Based on the method:

    +(void)fillItemSelector:(UIScrollView*)scrollView borderColor:(UIColor*)borderColor viewController:(UIViewController*)viewController radius:(int)pictureSize showName:(BOOL)showName items:(NSArray *)items nameFont:(UIFont *)nameFont nameColor:(UIColor *)nameColor nameSelectedColor:(UIColor *)nameSelectedColor

the available options are:

1. borderColor: any UIColor
2. radius: the size of the item picture in pixels
3. showName: whether or not to display the name of the item below the picture
4. items: NSArray of NSDictionary items
5. nameFont: UIFont to be used for the name that is optionally displayed below the picture
6. nameColor: UIColor to be used for the name that is optionally displayed below the picture
7. nameSelectedColor: UIColor to be used for the name that is optionally displayed below the picture when the name is selected

Installation
------------
Create a scrollview inside your view controller to house the item selector
![installation](https://raw.githubusercontent.com/maverick2000/ios_item_selector/master/screenshots/installation.png)

Link the scrollView to your view controller header file

    @property (weak, nonatomic) IBOutlet UIScrollView *itemSelectionScrollView;

Checkout this code into you project repository:

    git clone git@github.com:maverick2000/ios_item_selector.git

Insert this at the top of your view controller header file:

    #import "ItemSelector.h"

Add the following to your viewWillAppear method:

    [ItemSelector fillItemSelector:_itemSelectionScrollView borderColor:[UIColor blueColor] viewController:self radius:100 showName:YES items:(NSArray *)items nameFont:[UIFont fontWithName:@"Raleway-Bold" size:15.0] nameColor:[UIColor blueColor] nameSelectedColor:[UIColor whiteColor]];

setting borderColor, radius, showName, items, nameFont, nameColor and nameSelectedColor as desired.

Selecting Multiple Items
------------------------
    -(void)selectedItem:(id)sender{
        [self performSelector:@selector(toggleSelection:) withObject:sender afterDelay:0];
    }

    -(void)toggleSelection:(UIButton *)button{
        [self toggleSubviewSelections:![button isSelected] button:button];
    }

    -(void)toggleSubviewSelections:(BOOL)selected button:(UIButton *)button{
        [button setSelected:selected];
        int buttonNumber = 0;
        for (UIButton *subButton in button.superview.subviews){
            if (buttonNumber == 0){
                if (selected){
                    [subButton.layer setBorderColor:[[UIColor pinkColor] CGColor]];
                } else {
                    [subButton.layer setBorderColor:[[UIColor grayColor] CGColor]];
                }
            }
            [subButton setSelected:selected];
            buttonNumber += 1 ;
        }
    }

