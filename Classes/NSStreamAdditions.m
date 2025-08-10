//
//  NSStreamAdditions.m
//  Network
//
//  Created by Nicole Cattron on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

/*
#import "NSStreamAdditions.h"


@implementation NSStreamAdditions

@end
*/


#import "NSStreamAdditions.h"
@implementation NSStream (MyAdditions)
+ (void)getStreamsToHostNamed:(NSString *)hostName
						 port:(NSInteger)port
				  inputStream:(NSInputStream **)inputStreamPtr
				 outputStream:(NSOutputStream **)outputStreamPtr
{
	CFReadStreamRef readStream;
	CFWriteStreamRef writeStream;
	assert(hostName != nil);
	assert( (port > 0) && (port < 65536) );
	assert( (inputStreamPtr != NULL) || (outputStreamPtr != NULL) );
	readStream = NULL;
	writeStream = NULL;
	CFStreamCreatePairWithSocketToHost(
									   NULL,
									   (CFStringRef) hostName,
									   port,
									   ((inputStreamPtr != nil) ? &readStream : NULL),
									   ((outputStreamPtr != nil) ? &writeStream : NULL)
	);
	if (inputStreamPtr != NULL) {
		*inputStreamPtr = [NSMakeCollectable(readStream) autorelease];
	}
	if (outputStreamPtr != NULL) {
		*outputStreamPtr = [NSMakeCollectable(writeStream) autorelease];
	}
}
@end