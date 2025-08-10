//
//  NetworkViewController.m
//  Network
//
//  Created by Nicole Cattron on 7/17/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
/*
#import "NetworkViewController.h"

@implementation NetworkViewController
*/



#import "NetworkViewController.h"
#import "NSStreamAdditions.h"
@implementation NetworkViewController
NSMutableData *data;
NSInputStream *iStream;
NSOutputStream *oStream;
//@synthesize textField;



-(IBAction)slider1Action:(id)sender {
	slider1label.text = [NSString stringWithFormat:@"%1.0f", slider1.value];

	data[1] = slider1.value;
	
	int ret = [self writeToServer:data];
}

-(IBAction)slider2Action:(id)sender {
	slider2label.text = [NSString stringWithFormat:@"%1.0f", slider2.value];
	
	data[2] = slider2.value;
	
	[self writeToServer:data];		
}

-(IBAction)slider3Action:(id)sender {
	slider3label.text = [NSString stringWithFormat:@"%1.0f", slider3.value];
	
	data[3] = slider3.value;
	
	[self writeToServer:data];		
}

-(IBAction)slider4Action:(id)sender {
	slider4label.text = [NSString stringWithFormat:@"%1.0f", slider4.value];
	
	data[4] = slider4.value;
	
	[self writeToServer:data];		
}

-(IBAction)slider5Action:(id)sender {
	slider5label.text = [NSString stringWithFormat:@"%1.0f", slider5.value];
	
	data[5] = slider5.value;
	
	[self writeToServer:data];		
}

-(IBAction)slider6Action:(id)sender {
	slider6label.text = [NSString stringWithFormat:@"%1.0f", slider6.value];
	
	data[6] = slider6.value;
	
	[self writeToServer:data];		
}

-(IBAction)slider7Action:(id)sender {
	slider7label.text = [NSString stringWithFormat:@"%1.0f", slider7.value];
	
	data[7] = slider7.value;
	
	[self writeToServer:data];		
}

-(IBAction)slider8Action:(id)sender {
	slider8label.text = [NSString stringWithFormat:@"%1.0f", slider8.value];
	
	data[8] = slider8.value;
	
	[self writeToServer:data];		
}

-(IBAction)textFieldReturn:(id)sender {
	[sender resignFirstResponder];
}



-(IBAction) btnConnect: (id) sender {
    
    
    if([self validateIP:txtIP.text]){
        
        NSString *title =[(UIButton *)sender currentTitle];
        
        if([title isEqualToString:@"Connect"]) {
            NSString *str = txtIP.text;
            
            if([self connectToServerUsingStream:str portNo:10001] == 1) {
                statusLabel.text = @"Connected";
                [connectButton setTitle:@"Disconnect" forState:UIControlStateNormal];
            }
            else {
                statusLabel.text = @"Connection Failed";
            }
        }
        else {
            [self disconnect];
            [connectButton setTitle:@"Connect" forState:UIControlStateNormal];
            statusLabel.text = @"Not Connected";
        }
    }
    else {
        statusLabel.text = @"Invalid Address";
    }
}




-(BOOL)validateIP:(NSString *)ip {
    int ipQuads[4];
    ipQuads[0] = -1;
    ipQuads[1] = -1;
    ipQuads[2] = -1;
    ipQuads[3] = -1;
    const char *ipAddress = [ip cStringUsingEncoding:NSUTF8StringEncoding];
    
    sscanf(ipAddress, "%d.%d.%d.%d", &ipQuads[0], &ipQuads[1], &ipQuads[2], &ipQuads[3]);
    
    @try {
        for (int quad = 0; quad < 4; quad++) {
            if ((ipQuads[quad] < 0) || (ipQuads[quad] > 255)) {
                NSException *ipException = [NSException exceptionWithName:@"IPNotFormattedCorrectly" reason:@"IP range is invalid" userInfo:nil];
                @throw ipException;
            }
        }
    }
    @catch (NSException *exc) {
        //NSLog(@"ERROR: %@", [exc reason]);
        return NO;
    }
    return YES;
}





-(int) connectToServerUsingStream:(NSString *)urlStr portNo: (uint) portNo {
	if (![urlStr isEqualToString:@""]) { 
		NSURL *website = [NSURL URLWithString:urlStr];
		if (!website) {
			//NSLog(@"%@ is not a valid URL");
			return 0;
		} else {
			[NSStream getStreamsToHostNamed:urlStr port:portNo inputStream:&iStream outputStream:&oStream];
			[iStream retain];
			[oStream retain];
			[iStream setDelegate:self];
			[oStream setDelegate:self];
			[iStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
			[oStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
			[oStream open];
			[iStream open];

			return 1;
		}
	}
	else {
		return 0;
	}

}




//-(int) writeToServer:(const uint8_t *) buf {
-(int) writeToServer:(char*) buf {
	return [oStream write:buf maxLength:9];
}



-(void) disconnect {
	[iStream close];
	[oStream close];
}
 




//-(void)appWillResignActive:(NSNotification *)note {
//    statusLabel.text = @"App was locked";
//}

- (void) applicationWillResign {
    //NSLog(@"About to lose focus");
    [self disconnect];
    [connectButton setTitle:@"Connect" forState:UIControlStateNormal];
    statusLabel.text = @"Not Connected";
}






/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/




- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResign) name:UIApplicationWillResignActiveNotification object:NULL];
    
    data[0] = 0;
    data[1] = 128;
    data[2] = 128;
    data[3] = 128;
    data[4] = 128;
    data[5] = 128;
    data[6] = 128;
    data[7] = 128;
    data[8] = 128;
    
	[super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

/*
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    //statusLabel.text = @"Not Connected";
}
*/


- (void)dealloc {
	//[txtMessage release];
	[self disconnect];
	[iStream release];
	[oStream release];
	[super dealloc];
}

@end
