import Foundation

@objc(EasyLibModuleImpl)
public class EasyLibModuleImpl : NSObject {
    @objc public func syncFunction() -> Bool {
        return true
    }

    @objc public func asyncFunction(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
        resolve(NSNumber(value: true))
    }
}
