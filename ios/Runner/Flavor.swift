func initFlavor(_ appDelegate: AppDelegate) {
  let controller = appDelegate.window?.rootViewController as! FlutterViewController

  let flavorChannel = FlutterMethodChannel(
    name: "flavor",
    binaryMessenger: controller.binaryMessenger
  )

  flavorChannel.setMethodCallHandler({
    (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      let flavor = Bundle.main.infoDictionary!["AppFlavor"] as! String

      result(flavor)
  })
}
