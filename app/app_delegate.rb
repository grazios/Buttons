class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    true

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible



    root = AppRootController.alloc.initWithNibName(nil, bundle: nil)
    #naviの設定
    nav = UINavigationController.alloc.initWithRootViewController(root)
    #tab
    tab = UITabBarController.alloc.initWithNibName(nil,bundle: nil)
    tab.viewControllers = [nav]

    @window.rootViewController = tab
    true

  end
end
