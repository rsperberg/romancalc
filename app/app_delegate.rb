class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    UIApplication.sharedApplication.setStatusBarHidden(true, false)
    application.setStatusBarHidden(true, withAnimation:UIStatusBarAnimationSlide)
    # taken from https://groups.google.com/forum/#!topic/rubymotion/UUrVJSM5zZM
    controller = RomanNumController.alloc.initWithNibName(nil, bundle:nil)
    @nav_controller = UINavigationController.alloc.initWithRootViewController(controller)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible
    true
  end
end

