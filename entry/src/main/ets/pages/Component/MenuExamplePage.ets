@Entry
@Component
struct MenuExamplePage {
  @State message: string = 'Hello World'
  private menus: string[] = ['菜单1', '菜单2', '菜单3']

  @Builder
  customMenu() {
    Flex({direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center}) {
      ForEach(this.menus, (item, index) => {
        Row({space: 10}) {
          Image($r('app.media.app_icon')).width(35).objectFit(ImageFit.Contain)
          Text(item)
        }
        .height(45)
        .onClick(() => {
          console.log('[Menu]', `click custom menu: ${item}`)
        })

        if (index !== this.menus.length-1) {
          Divider().width('80%').color('#ccc')
        }
      })
    }
    .width('100%')
  }

  @Builder
  subMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  customMultiMenu() {
    Menu() {
      MenuItem({startIcon: $r('app.media.app_icon'), content: '菜单选项'})
      MenuItem({startIcon: $r('app.media.app_icon'), content: '菜单选项'}).enabled(false)
      MenuItem({endIcon: $r('app.media.app_icon'), content: '菜单选项', startIcon: $r('app.media.startIcon')})
      MenuItem({content: '菜单选项', builder: this.subMenu.bind(this)})// 一定要加 bind(this)
    }
  }

  build() {
    Row() {
      Column({space: 100}) {
        Button('Menu')
          .onClick(() => {
            console.log('[Menu]', 'click Menu')
          })
          .bindMenu([
            {
              value: '菜单A',
              action: () => {
                console.log('[Menu]', 'click 菜单A')
              }
            },
            {
              value: '菜单B',
              action: () => {
                console.log('[Menu]', 'click 菜单B')
              }
            }
          ])

        Button('Custom Menu')
          .onClick(() => {
            console.log('[Menu]', 'click Custom Menu')
          })
          .bindMenu(this.customMenu)

        Button('Custom Multi Menu')
          .onClick(() => {
            console.log('[Menu]', 'click Custom Multi Menu')
          })
          .bindMenu(this.customMultiMenu)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({top: 45})
    }
    .height('100%')
  }
}