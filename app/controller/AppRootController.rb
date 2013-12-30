class AppRootController < UIViewController
  def viewDidLoad
    super
    #ツールバーを作るよ
    #ツールバーは画面最下部推奨らしい…。
    @toolbar = UIToolbar.alloc.initWithFrame(CGRectMake(0,self.view.bounds.size.height - self.tabBarController.rotatingFooterView.frame.size.height - 44,320,44))

    add_btn = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'add_action')
    camera_button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCamera, target:self, action:'camera_action')
    compose_button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCompose, target:self, action:'compose_action')
    toggle_button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSearch, target:self, action:'toggle_action')
    
    @toolbar.items = [add_btn, camera_button, compose_button, toggle_button]

    @label = UILabel.alloc.init
    @label.text = "ばーん！"
    @label.hidden = TRUE
    @label.textColor = UIColor.whiteColor
    @label.frame = [[100,200],[100,44]]

    self.view.addSubview(@label)
    self.view.addSubview(@toolbar)


  end




  #このコントローラを初期化するときに呼ばれる？
  def initWithNibName(name, bundle: bundle)
    super
    self.title = "いろいろなボタン"

    #画像イメージ
    @image = UIImage.imageNamed("button_logo.png")
    #これを入れないと二色表示？になる。imageWithRenderingModeは原色の画像を戻り値にするので代入する必要がある
    @image = @image.imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)

    #naviの部分
    right_button = UIBarButtonItem.alloc.initWithTitle("ボタンだよ",style:UIBarButtonItemStyleBordered,target:self,action:'nav_button_push')
    back_button = UIBarButtonItem.alloc.initWithImage(@image,style:UIBarButtonItemStyleBordered,target:self,action:nil)
    self.navigationItem.backBarButtonItem = back_button
    self.navigationItem.rightBarButtonItem = right_button

    #tab
    self.tabBarItem.initWithTitle("ボタン",image: @image,tag: 0)
    self
  end


  def nav_button_push
    #遷移先をnewする
    new_controller = AppRootController.alloc.initWithNibName(nil, bundle: nil)
    new_controller.title ="いろいろなボタン(#{self.navigationController.viewControllers.count})"

    #ナビゲーションコントローラが持つ要素にpushしてるのかね？
    self.navigationController.pushViewController(new_controller, animated: true)
  end

  def add_action
    frame = @toolbar.frame
    UIView.animateWithDuration(0.5,
        animations: lambda {
          @toolbar.frame = [[0,frame.origin.y-10],[frame.size.width,frame.size.height]]
        }
      )
  end

  def camera_action
    alert = UIAlertView.alloc.init
    alert.message = "カメラは起動しません！"
    alert.addButtonWithTitle("OK")
    alert.show
  end

  def compose_action
    #facebookへの投稿を2行で実装できるけど…
    #iOSからの投稿になっちゃうので実際にはAPI経由で実装する必要がありそう
    @facebook = SLComposeViewController.composeViewControllerForServiceType(SLServiceTypeFacebook)
    @facebook.setInitialText("sample")
    @facebook.addURL(NSURL.URLWithString("http://takeshun.net"))
    self.presentViewController(@facebook, animated:TRUE, completion:nil)
  end

  def toggle_action
    @label.hidden = !@label.isHidden
  end



  #タッチイベント
  def touchesBegan(touches, withEvent:event)
    puts "touched"
  end

end