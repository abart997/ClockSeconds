#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface TPLCDTextView : UIView { }
-(void)setText:(id)text;
-(void)setTextColor:(id)color;
-(id)grabPrefColor:(NSInteger)colorNumber;
@end



static NSInteger clockColor;

%hook SBAwayDateView
-(void)updateClock{
NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.abart997.clockseconds.plist"];
clockColor = [((NSNumber*)[plist valueForKey:@"clockColor"]) integerValue];


	%orig;
	
		TPLCDTextView *time = MSHookIvar<TPLCDTextView *>(self, "_timeLabel");
		
		
		NSDateFormatter *dt = [[NSDateFormatter alloc] init];
	[dt setDateStyle:NSDateFormatterNoStyle];
	[dt setTimeStyle:NSDateFormatterShortStyle];
	[dt setDateFormat:@"HH:mm:ss"];
	NSString *currentTime = [dt stringFromDate:[NSDate date]];

	[dt release];
	[time setText:currentTime];
	[time setTextColor: [self grabPrefColor:clockColor]];

	
		
}


%new(v@:i)

-(id)grabPrefColor:(NSInteger)colorNumber {
		switch (colorNumber) {
		
			case 0:
				return [UIColor redColor];
			case 1:
				return [UIColor blueColor];
			case 2:
				return [UIColor greenColor];
			case 3:
				return [UIColor blackColor];
			case 4:
				return [UIColor brownColor];
			case 5:
				return [UIColor purpleColor];
			case 6:
				return [UIColor whiteColor];
				case 7:
				return [UIColor orangeColor];
			default:
				return nil;
	}

}

%end
