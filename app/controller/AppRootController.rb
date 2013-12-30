class AppRootController < UIViewController
  def viewDidLoad
    super


  end

  def initWithNibName(name, bundle: bundle)
    super

    @image = UIImage.imageNamed("button_logo.png")
    #これを入れないと二色表示？になる。imageWithRenderingModeは原色の画像を戻り値にするので代入する必要がある
    @image = @image.imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    self.tabBarItem.initWithTitle("ボタン",image: @image,tag: 0)
    self
  end

end