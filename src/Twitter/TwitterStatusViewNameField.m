#import "TwitterStatusViewNameField.h"
#import "NTLNColors.h"
#import "TwitterUtils.h"
#import "UIUtils.h"

@implementation TwitterStatusViewNameField

- (void) awakeFromNib {
    [super awakeFromNib];
}

- (void) setStatus:(TwitterStatus*)status {
    _status = status;
    [status retain];
    
    [self setStringValue:[[[status screenName] stringByAppendingString:@"/"] stringByAppendingString:[status name]]];
}

- (void) dealloc {
    [_status release];
    [super dealloc];
}

- (void) mouseDown:(NSEvent *)theEvent {
//    if (![self mouse:[self convertPoint:[theEvent locationInWindow] fromView:[self superview]] inRect:[self rectForText]]) {
//        return;
//    }
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:[[TwitterUtils utils] userPageURLString:[_status screenName]]]];
    [[self superview] mouseDown:theEvent];
}

@end