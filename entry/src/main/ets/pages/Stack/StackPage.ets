import router from '@ohos.router'

@Entry
@Component
struct StackPage {

  @Styles
  stackCommonStyles() {
    .backgroundColor('#c1c2c3')
    .width('100%')
    .height(200)
  }

  @Builder
  useStack() {
    Stack() {
      Column().width('90%').height('80%').backgroundColor(0xff58b87c)
      Text('txt').width('60%').height('40%').backgroundColor(0xffc3f6aa)
      Button('button').width('30%').height('20%').backgroundColor(0xff8ff3eb).fontColor(Color.Black)
    }
    .stackCommonStyles()
    .alignContent(Alignment.Center)
    .margin({top: 50})
  }

  @Builder
  useZIndex() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Column() {
        Text('子元素1').fontSize(20).textAlign(TextAlign.End)
          .width(100).height(100).backgroundColor(0xffd306)
      }
      .zIndex(3)

      Column() {
        Text('子元素2').fontSize(20).textAlign(TextAlign.End)
          .width(150).height(150).backgroundColor(Color.Pink)
      }
      .zIndex(2)

      Column() {
        Text('子元素3').fontSize(20).textAlign(TextAlign.End)
          .width(200).height(200).backgroundColor(0xff58b87c)
      }
      .zIndex(1)
    }
    .stackCommonStyles()
  }



  build() {
    Column({space: 20}) {
      this.useStack()
      this.useZIndex()

      Button('Next').onClick((event: ClickEvent) => {
        router.pushUrl({url: 'pages/Stack/StackExamplePage'})
      })
    }
    .width('100%')
  }
}