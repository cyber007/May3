//
//  View.h
//  May3
//
//  Created by admin on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeViewController;

@interface View : UIView {
    KeViewController *viewController;
	NSDateFormatter *dateFormatter;
	UIDatePicker *datePicker;
	UITextView *textView;
}

- (id) initWithFrame: (CGRect) frame controller: (KeViewController *) c;
@end
