#import <Cocoa/Cocoa.h>
#include <stdio.h>

void action(NSString *str) {


}

int main(int argc, char *argv[])
{
    int entry =1;
    char line[200];

    FILE* output = popen("/usr/bin/ls", "-r");
    while (fgets(line,199,output)) {
        printf("%5d: %s", entry++, line);
    }
}

int main2(int argc, char *argv[])
{
	
    NSTask *task = [[NSTask alloc] init];
    NSPipe *_output; 
    _output = [NSPipe pipe];
    NSFileHandle* outputF  = [_output fileHandleForReading];

    [task setLaunchPath: @"./gpad-daemon"];
    // [task setLaunchPath: @"/bin/ls"];
    // NSArray *arguments = [NSArray arrayWithObjects: @" toto" ,nil];
    // [task setArguments: arguments];
    //pipe = [NSPipe pipe];
    [task setStandardOutput: _output];


    void (^outputter)(NSFileHandle*) = ^(NSFileHandle *file){
        NSData *data = [file availableData];
        NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Output: %@",str);
        action(str);
        //fullOutput = [fullOutput stringByAppendingString:str];
    };

    [outputF setReadabilityHandler:outputter];

    [task setTerminationHandler:^(NSTask* task){
        NSLog(@"Terminated");
        //[task.standardOutput fileHandleForReading].readabilityHandler = nil;
        //[task.standardError fileHandleForReading].readabilityHandler = nil;
        //[task.standardInput fileHandleForWriting].writeabilityHandler = nil;
        //[task terminate];
        //task = nil;
    }];

    printf("launch\n");
    [task launch];
    
    while(task.running) {
      //NSLog(@"...");
      [outputF waitForDataInBackgroundAndNotify];
    }
    // [outputF waitForDataInBackgroundAndNotify];

    // NSData *data = [outputF readDataToEndOfFile];
    // NSString *string;
    // string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    // NSLog (@"script returned:\n%@", string);
    
    //[file closeFile];

    // NSData *data;
    // data = [file availableData];
    // output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];

    //printf("%s", [output UTF8String]);

    return 0;
}