//
//  NetworkViewController.h
//  Network
//
//  Created by Nicole Cattron on 7/17/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NetworkViewController : UIViewController {
    IBOutlet UITextField *txtIP;
	IBOutlet UILabel *statusLabel;
    
    IBOutlet UIButton *connectButton;

	IBOutlet UISlider *slider1;
	IBOutlet UISlider *slider2;
	IBOutlet UISlider *slider3;
	IBOutlet UISlider *slider4;	
	IBOutlet UISlider *slider5;
	IBOutlet UISlider *slider6;	
	IBOutlet UISlider *slider7;
	IBOutlet UISlider *slider8;
	
	IBOutlet UILabel *slider1label;
	IBOutlet UILabel *slider2label;	
	IBOutlet UILabel *slider3label;
	IBOutlet UILabel *slider4label;	
	IBOutlet UILabel *slider5label;
	IBOutlet UILabel *slider6label;
	IBOutlet UILabel *slider7label;
	IBOutlet UILabel *slider8label;		
	
	char data[9];
    
    BOOL connected;
    
    
	
}
//@property (nonatomic, retain) IBOutlet UITextField *txtIP;

-(IBAction) btnConnect: (id) sender;

-(int) connectToServerUsingStream:(NSString *)urlStr portNo: (uint) portNo;
-(int) writeToServer:(char *) buf;

//-(int) check:();

-(BOOL)validateIP:(NSString *)ip;

-(IBAction)slider1Action:(id)sender;
-(IBAction)slider2Action:(id)sender;
-(IBAction)slider3Action:(id)sender;
-(IBAction)slider4Action:(id)sender;
-(IBAction)slider5Action:(id)sender;
-(IBAction)slider6Action:(id)sender;
-(IBAction)slider7Action:(id)sender;
-(IBAction)slider8Action:(id)sender;

-(IBAction)textFieldReturn:(id)sender;


@end