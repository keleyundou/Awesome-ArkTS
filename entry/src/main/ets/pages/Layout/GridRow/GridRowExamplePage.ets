@Entry
@Component
struct GridRowExamplePage {
  @State message: string = 'Hello World'

  build() {
    GridRow() {
      GridCol({span: {sm: 12}}) {
        GridRow() {
          GridCol({span: {sm: 2}}) {
            Row() {
              Text('Left')
            }
            .justifyContent(FlexAlign.Center)
            .backgroundColor(Color.Green)
            .width('100%')
            .height('90%')
          }
          .backgroundColor('#ff41dbaa')


          GridCol({span: {sm: 10}}) {
            Row() {
              Text('Right')
            }
            .backgroundColor(Color.Red)
            .height('90%')
          }
          .backgroundColor('#ff4168db')
        }
        .backgroundColor('#19000000')
        .height('100%')
      }

      GridCol({span: {sm: 12}}) {
        Row() {
          Text('Footer')
        }
        .width('100%')
        .height('10%')
        .backgroundColor(Color.Pink)
        .justifyContent(FlexAlign.Center)
      }
    }
    .width('100%')
    .height(300)
  }
}