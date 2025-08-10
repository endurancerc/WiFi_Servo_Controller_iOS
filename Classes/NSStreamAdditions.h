//
//  NSStreamAdditions.h
//  Network
//
//  Created by Nicole Cattron on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

/*
#import <Foundation/Foundation.h>


@interface NSStreamAdditions : NSObject {

}

@end
*/



#import  <Foundation/Foundation.h>
@interface NSStream (MyAdditions)
+ (void)getStreamsToHostNamed:(NSString *)hostName
						 port:(NSInteger)port
				  inputStream:(NSInputStream **)inputStreamPtr
				 outputStream:(NSOutputStream **)outputStreamPtr;
@end