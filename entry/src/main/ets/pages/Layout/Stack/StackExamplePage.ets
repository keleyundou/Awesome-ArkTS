import router from '@ohos.router'

@Entry
@Component
struct StackExamplePage {
  private apps: string[] = ['APP1', 'APP2', 'APP3', 'APP4', 'APP5', 'APP6', 'APP7', 'APP8']

  @Builder
  example() {
    Stack({alignContent: Alignment.Bottom}) {
      Flex({wrap: FlexWrap.Wrap}) {
        ForEach(this.apps, (item) => {
          Text(item)
            .width(100).height(100)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin(10)
            .borderRadius(10)
            .backgroundColor(Color.White)
        }, item => item)
      }
      .width('100%')
      .height('100%')

      Button('Back').onClick(() => {
        router.back()
      })
        .margin({bottom: '50%'})

      Flex({justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center, direction: FlexDirection.Row}) {
        Text('联系人').fontSize(16)
        Text('设置').fontSize(16)
        Text('短信').fontSize(16)
      }
      .width('50%')
      .height(50)
      .backgroundColor(0x16302e2e)
      .margin({bottom: 15})
      .borderRadius(15)
    }
    .height('100%')
    .backgroundColor('#c1c2c3')
  }

  build() {
    Row() {
      Column() {
        this.example()
      }
      .width('100%')
    }
    .height('100%')
  }
}