class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    controller = RomanNumController.alloc.initWithNibName(nil, bundle:nil)
    @nav_controller = UINavigationController.alloc.initWithRootViewController(controller)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible
    true
  end
end

