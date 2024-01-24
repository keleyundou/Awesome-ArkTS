import { ListGroupPage } from '../Layout/List/ListGroupPage'

@Entry
@Component
struct NavigationExamplePage {
  @State message: string = 'Hello World'
  arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  @Builder
  navMenus() {
    Row({space: 5}) {
      Image('/pages/Navigation/images/ic_gallery_create.png').width(25)
      Image($r('app.media.app_icon')).width(25)
      Image($r('app.media.app_icon')).width(25)
    }
    .margin({top: 15})
  }

  @Builder
  navToolBar() {
    Row() {
      Column({space: 3}) {
        Image($r('app.media.app_icon')).width(25)
        Text('title1')
      }
      Column({space: 3}) {
        Image($r('app.media.app_icon')).width(25)
        Text('title2')
      }
      Column({space: 3}) {
        Image($r('app.media.app_icon')).width(25)
        Text('title3')
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor(Color.White)
  }

  @Builder
  navTitle(title: string = '标题') {
    Row() {
      Text(title)
        .textAlign(TextAlign.Center)
        .fontSize(22)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        // .backgroundColor(Color.Brown)
        // .width('100%')
        .height('100%')
        .onClick((e) => {
          console.log(`nav title size: (width:${e.target.area.width}, height: ${e.target.area.height})`)
        })
    }
    .width('100%')
    .height('64%')
    .justifyContent(FlexAlign.Center)
    // .backgroundColor(Color.Green)
    .onClick((e) => {
      console.log(`nav row size: (width:${e.target.area.width}, height: ${e.target.area.height})`)
    })
  }

  build() {
    Column() {
      Navigation() {
        NavRouter() {
          Text(this.message).fontColor(Color.Red)
          NavDestination() {
            ListGroupPage()
          }
          .title('标题')
        }
        .margin({bottom: 10})

        List({space: 12}) {
          ForEach(this.arr, item => {
            ListItem() {
              NavRouter() {
                Text(`NavRouter ${item}`)
                  .width('90%')
                  .height(72)
                  .backgroundColor(Color.White)
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text(`详情：${item}`)
                    .backgroundColor('#F1F3F5')
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
                // 在previewer上，自定义标题的宽设置为100%时，系统没有减去返回键的大小
                // NavDestination返回键无法隐藏，也无法自定义，只能在Navigation组件上配置
                .title(this.navTitle(`NavRouter${item}`))
                // .title({main: '主标题', sub: '副标题'})
                .hideTitleBar(false)
              }
            }
            .width('100%')
            .onClick(() => {
              console.log(`click item ${item}`)
            })
          })
        }.layoutWeight(1)
      }
      .mode(NavigationMode.Stack)
      .titleMode(NavigationTitleMode.Free)
      .hideTitleBar(false)
      .hideToolBar(false)
      // .hideNavBar(true)
      // .hideBackButton(true)
      .menus(this.navMenus)
      .toolBar(this.navToolBar)
      // .backButtonIcon($r('app.media.app_icon'))
      // .title('标题')
      // .title({main: '主标题', sub: '副标题'})
      // .title({builder: this.navTitle, height: TitleHeight.MainOnly})
      .title(this.navTitle)
      // 在previewer上，onTitleModeChange不回调
      .onTitleModeChange((titleMode: NavigationTitleMode) => {
        console.info('titleMode' + titleMode)
      })
    }
    .width('100%').height('100%')
    .backgroundColor('#F1F3F5')
  }
}