@Entry
@Component
struct TabsExamplePage {
  tabsController: TabsController = new TabsController()
  @State message: string = 'Hello World'
  @State currIndex: number = 0
  menus: string[] = ['关注','视频','游戏','数码','科技','体育','影视','人文','艺术','自然','军事']

  @Builder
  tabBarBuilder(title: string, normalImage: Resource, selectedImage: Resource, targetIndex: number) {
    Column({space: 3}) {
      Image(this.currIndex === targetIndex ? selectedImage : normalImage)
        .width(25)
      Text(title)
        .fontColor(this.currIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currIndex = targetIndex
      this.tabsController.changeIndex(this.currIndex)
    })
  }

  build() {
    Tabs({barPosition: BarPosition.End, index: this.currIndex}) {
      TabContent() {
        Tabs({barPosition: BarPosition.Start}) {
          ForEach(this.menus, (item) => {
            TabContent() {
              Text(item)
            }
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Gray)
            .tabBar(item)
          })
        }
        .barMode(BarMode.Scrollable)
        .backgroundColor('#F1F3F5')
      }
      // .tabBar('首页')
      .tabBar(this.tabBarBuilder('首页', $r('app.media.startIcon'), $r('app.media.startIcon'), 0))
      .backgroundColor(Color.Green)

      TabContent() {
        Text('PageB')
      }
      // .tabBar('推荐')
      .tabBar(this.tabBarBuilder('推荐', $r('app.media.startIcon'), $r('app.media.startIcon'), 1))
      .backgroundColor(Color.Red)

    }
    .vertical(false)
    .scrollable(false)
    .barMode(BarMode.Fixed)
    // .onChange((index) => {
    //   this.currIndex = index
    //   this.tabsController.changeIndex(this.currIndex)
    // })
  }
}