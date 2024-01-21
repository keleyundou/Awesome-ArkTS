
@Entry
@Component
struct ToggleExamplePage {
  @State message: string = 'Hello World'

  build() {
    Column({space: 8}) {
      Row() {
        Text('Checkbox')
          .fontSize(18)
        Blank()
        Toggle({type: ToggleType.Checkbox})
          .margin(10)
      }
      .width('100%')
      .backgroundColor(Color.White)
      .padding(15)
      .borderRadius(15)

      Row() {
        Text('Switch')
          .fontSize(18)
        Blank()
        Toggle({type: ToggleType.Switch})
          .switchPointColor(Color.Red)
          .margin(10)
      }
      .width('100%')
      .backgroundColor(Color.White)
      .padding(15)
      .borderRadius(15)

      Row() {
        Text('Button')
          .fontSize(18)
        Blank()
        Toggle({type: ToggleType.Button}) {
          Row() { // TODO 直接使用Text组件，fontColor不生效，需要用容器组件包一层
            Text('status button')
              .fontColor('#ffe00a0a')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
          }
        }
        .selectedColor(Color.Pink)
        .height(45)
        .width(200)
        .padding(10)
        .margin({right: 10})
      }
      .width('100%')
      .backgroundColor(Color.White)
      .padding(15)
      .borderRadius(15)

    }
    .backgroundColor('#dcdcdc')
    .width('100%')
    .height('100%')
    .padding(15)
  }
}