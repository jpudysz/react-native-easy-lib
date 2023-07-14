#import "EasyLibModule.h"
#import "EasyLibPackage-Swift.h"

#if RCT_NEW_ARCH_ENABLED

#import "EasyLibPackage.h"

@interface EasyLibModule () <NativeEasyLibModuleSpec>
@end

#endif

@implementation EasyLibModule {
    EasyLibModuleImpl *moduleImpl;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        moduleImpl = [EasyLibModuleImpl new];
    }
    return self;
}

RCT_EXPORT_MODULE(EasyLibModule)

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(NSNumber *, syncFunction)
{
    BOOL result = [moduleImpl syncFunction];
    
    return [NSNumber numberWithBool:result];
}

RCT_EXPORT_METHOD(asyncFunction:(RCTPromiseResolveBlock)resolve reject: (RCTPromiseRejectBlock)reject)
{
    return [moduleImpl asyncFunction:resolve rejecter:reject];
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

#if RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
    return std::make_shared<facebook::react::NativeEasyLibModuleSpecJSI>(params);
}
#endif

@end

