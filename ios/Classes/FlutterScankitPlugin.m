#import "FlutterScankitPlugin.h"



@interface FlutterScankitPlugin ()<FlutterStreamHandler>{
    FlutterMethodChannel *_channel;
    FlutterEventChannel *_eventChannel;
    id<FlutterPluginRegistrar> _registrar;
}
@end

@implementation FlutterScankitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"xyz.bczl.flutter_scankit/scan"
            binaryMessenger:[registrar messenger]];
  FlutterScankitPlugin* instance = [[FlutterScankitPlugin alloc] initWithRegistrar:registrar];
  [registrar addMethodCallDelegate:instance channel:channel];
}

-(instancetype)initWithRegistrar:(id<FlutterPluginRegistrar>)registrar{
    self = [super init];
    if (self) {
        
        _eventChannel = [FlutterEventChannel eventChannelWithName:@"xyz.bczl.flutter_scankit/result" binaryMessenger:[registrar messenger]];
        [_eventChannel setStreamHandler:self];
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
 
}







@end
