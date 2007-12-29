#import "TwitterStatusViewController.h"


@implementation TwitterStatusViewController

- (id) initWithTwitterStatus:(TwitterStatus*)status {
    [super init];

    _status = status;
    [_status retain];
    
    if (![NSBundle loadNibNamed: @"TwitterStatusView" owner: self]) {
        NSLog(@"unable to load Nib TwitterStatusView.nib");
    }
    [textField setStringValue:[status text]];
    [nameField setStringValue:[[[status name] stringByAppendingString:@"/"] stringByAppendingString:[status screenName]]];
    [iconView setImage:[status icon]];
    [timestampField setStringValue:[[status timestamp]      
                                    descriptionWithCalendarFormat:@"%02H:%02M:%02S"
                                    timeZone:[NSTimeZone localTimeZone]
                                    locale:[[NSUserDefaults standardUserDefaults]
                                            dictionaryRepresentation]]];

    [view setTwitterStatus:_status];

    return self;
}

- (TwitterStatus*) status {
    return _status;
}

- (NSView*) view {
    return view;
}

- (void) dealloc {
    [_status release];
    [super dealloc];
}

- (NSTextField*) nameField {
    return nameField;
}

- (BOOL) isEqual:(id)anObject {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
	if (anObject == self)
        return TRUE;
	if (!anObject || ![anObject isKindOfClass:[self class]])
        return FALSE;
    return [[self status] isEqual:[(TwitterStatusViewController*)anObject status]];
}
     
- (void) highlight {
    [view highlight];
    [textField highlight];
    [nameField highlight];
    [timestampField highlight];
    [iconView highlight];
}

- (void) lowlight {
    [view lowlight];
    [textField lowlight];
    [nameField lowlight];
    [timestampField lowlight];
    [iconView lowlight];
}

@end
