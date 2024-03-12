#import "TapcardsModule.h"
#import "Callback.h"
#import "StreamingCallback.h"
#import "Lndmobile.xcframework/ios-arm64/Lndmobile.framework/Headers/Lndmobile.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNLncRnSpec.h"
#endif

@implementation TapcardsModule

RCT_EXPORT_METHOD(statusRequest:(NSString *)aString
                   resolver:(RCTPromiseResolveBlock)resolve
                   rejecter:(RCTPromiseRejectBlock)reject)
{
  
  NSError *error;
  NSData* status = LndmobileSatscardStatus(&error);
  if (status) {
      resolve(status);
  } else if (error) {
      reject(@"expiry_error", @"error thrown", error);
  }
}
 

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeLncRnSpecJSI>(params);
}
#endif

@end
