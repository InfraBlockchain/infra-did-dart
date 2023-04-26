import Flutter
import UIKit

public class SwiftInfraDidDartPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // We are not using Flutter channels here
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // Noop
    result(nil)
  }

  public func dummyMethodToEnforceBundling() {
    // dummy calls to prevent tree shaking
    resolve("did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW")
  }
}
