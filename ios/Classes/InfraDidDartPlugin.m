#import "InfraDidDartPlugin.h"
#if __has_include(<infra_did_dart/infra_did_dart-Swift.h>)
#import <infra_did_dart/infra_did_dart-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "infra_did_dart-Swift.h"
#endif

@implementation InfraDidDartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInfraDidDartPlugin registerWithRegistrar:registrar];
}
@end
