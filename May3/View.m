//
//  View.m
//  May3
//
//  Created by admin on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (void) valueChanged
{
	textView.text = [dateFormatter stringFromDate: datePicker.date];
    //datePicker.
}

- (id) initWithFrame: (CGRect) frame controller: (KeViewController *) c 
{
	self = [super initWithFrame: frame];
	if (self) {
        viewController = c;
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		dateFormatter = [[NSDateFormatter alloc] init];
        
        //so we don't have to look up the day of the week of December 31, 2011
		[dateFormatter setDateStyle: NSDateFormatterLongStyle];
        
		//so we don't have to specify a time
		[dateFormatter setTimeStyle: NSDateFormatterNoStyle];
        
		datePicker.date = [dateFormatter dateFromString: @""];
		//[dateFormatter setDateStyle: NSDateFormatterFullStyle];
		//[dateFormatter setTimeStyle: NSDateFormatterFullStyle];
        
		//Let the date picker assume its natural size.
		datePicker = [[UIDatePicker alloc] initWithFrame: CGRectZero];
		datePicker.datePickerMode = UIDatePickerModeDateAndTime;//UIDatePickerModeTime;//UIDatePickerModeCountDownTimer;//UIDatePickerModeDateAndTime;//UIDatePickerModeDate; //vs. UIDatePickerModeTime
        
		//Center the picker in the DatePickerView.
		CGRect b = self.bounds;
        
		datePicker.frame = CGRectMake(
                                      b.origin.x,
                                      b.origin.y,
                                      datePicker.bounds.size.width,
                                      datePicker.bounds.size.height
                                      );
        
		[datePicker addTarget: self
                       action: @selector(valueChanged)
             forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: datePicker];
        
		//TextView occupies all of the View below the picker.
        
		CGRect f = CGRectMake(
                              b.origin.x,
                              b.origin.y + datePicker.bounds.size.height,
                              b.size.width,
                              b.size.height - datePicker.bounds.size.height
                              );
        
		textView = [[UITextView alloc] initWithFrame: f];
		textView.editable = NO;
		textView.font = [UIFont systemFontOfSize: 22];
		[self valueChanged];
		[self addSubview: textView];
	}
	return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */


@end