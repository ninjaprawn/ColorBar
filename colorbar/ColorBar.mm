#import "PSListController.h"
#import "PSSpecifier.h"
#import "PSViewController.h"
#import "PSTableCell.h"

@interface ColorBarListController: PSListController {
}
@end

@implementation ColorBarListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ColorBar" target:self] retain];
	}
	return _specifiers;
}

-(void)save {
    system("killall -9 backboardd");
}

@end

// vim:ft=objc
