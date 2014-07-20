static BOOL enabled = YES;
static BOOL lsSame = YES;
static UIColor *foregroundColor;
static UIColor *backgroundColor;
static int fc = 0;
static int bc = 13;

/* Old...

//String hex to UIColor adapted from http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string/12397366#12397366
static UIColor *colorFromHexString(NSString *hexString) {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if ([hexString hasPrefix:@"#"]) {
        [scanner setScanLocation:1]; // bypass '#' character
    } else {
        [scanner setScanLocation:0];
    }
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

//My own function
static UIColor *colorFromRGB(int colorR, int colorG, int colorB) {
    return [UIColor colorWithRed: colorR/255.0 green: colorG/255.0 blue: colorB/255.0 alpha:1.0];
} 

*/

//Statusbar color
%hook UIStatusBarNewUIStyleAttributes

-(id)initWithRequest:(id)arg1 backgroundColor:(id)arg2 foregroundColor:(id)arg3 {
    NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ninjaprawn.colorbar.plist"];
    if (settings) {
        enabled = ([settings objectForKey:@"enabled"] ? [[settings objectForKey:@"enabled"] boolValue] : enabled);
        fc = ([settings objectForKey:@"fc"] ? [[settings objectForKey:@"fc"] intValue] : fc);
        bc = ([settings objectForKey:@"bc"] ? [[settings objectForKey:@"bc"] intValue] : bc);
    }   

	switch (fc) {
		case 1:
			foregroundColor = [UIColor blackColor];
			break;
		case 2:
			foregroundColor = [UIColor blueColor];
			break;
		case 3:
			foregroundColor = [UIColor brownColor];
			break;
		case 4:
			foregroundColor = [UIColor clearColor];
			break;
		case 5:
			foregroundColor = [UIColor cyanColor];
			break;
		case 6:
			foregroundColor = [UIColor darkGrayColor];
			break;
		case 7:
			foregroundColor = [UIColor grayColor];
			break;
		case 8:
			foregroundColor = [UIColor greenColor];
			break;
		case 9:
			foregroundColor = [UIColor lightGrayColor];
			break;
		case 10:
			foregroundColor = [UIColor magentaColor];
			break;
		case 11:
			foregroundColor = [UIColor orangeColor];
			break;
		case 12:
			foregroundColor = [UIColor purpleColor];
			break;
		case 13:
			foregroundColor = [UIColor redColor];
			break;
		case 14:
			foregroundColor = [UIColor whiteColor];
			break;
		case 15:
			foregroundColor = [UIColor yellowColor];
			break;
		default:
			break;
	}

	switch (bc) {
		case 1:
			backgroundColor = [UIColor blackColor];
			break;
		case 2:
			foregroundColor = [UIColor blueColor];
			break;
		case 3:
			backgroundColor = [UIColor brownColor];
			break;
		case 4:
			backgroundColor = [UIColor clearColor];
			break;
		case 5:
			backgroundColor = [UIColor cyanColor];
			break;
		case 6:
			backgroundColor = [UIColor darkGrayColor];
			break;
		case 7:
			backgroundColor = [UIColor grayColor];
			break;
		case 8:
			backgroundColor = [UIColor greenColor];
			break;
		case 9:
			backgroundColor = [UIColor lightGrayColor];
			break;
		case 10:
			backgroundColor = [UIColor magentaColor];
			break;
		case 11:
			backgroundColor = [UIColor orangeColor];
			break;
		case 12:
			backgroundColor = [UIColor purpleColor];
			break;
		case 13:
			backgroundColor = [UIColor redColor];
			break;
		case 14:
			backgroundColor = [UIColor whiteColor];
			break;
		case 15:
			backgroundColor = [UIColor yellowColor];
			break;
		default:
			break;
	}

    if (enabled) {
        arg1 = nil;
        arg2 = backgroundColor;
        arg3 = foregroundColor;
        return %orig(arg1,arg2,arg3);
    }
    return %orig;
}

%end

//Lockscreen statusbar fix
%hook SBLockScreenViewController

-(int)statusBarStyle {
    NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ninjaprawn.colorbar.plist"];
    if (settings) {
        lsSame = ([settings objectForKey:@"lssame"] ? [[settings objectForKey:@"lssame"] boolValue] : lsSame);
    }
    if (lsSame) {
        return 0;
    }
    return %orig;
}

%end