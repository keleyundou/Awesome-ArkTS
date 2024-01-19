import { AppData, generateAppData } from '../../../viewmodel/AppData'

@Entry
@Component
struct ListPage {
  @State message: string = 'Hello World'
  private Apps: AppData[] = generateAppData()

  build() {
    List({space: 10}) {
      ForEach(this.Apps, (item: AppData) => {
        ListItem() {
          Row() {
            Image(item.icon)
              .size({width: 40, height: 40})
              .margin(10)
            Text(item.name)
              .fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .backgroundColor(Color.Orange)
        }
      }, item => item.id)
    }
    .width('100%')
    .lanes(1)
    .divider({
      strokeWidth: 1,
      color: Color.Red,
      startMargin: 15,
      endMargin: 0
    })
    .scrollBar(BarState.Auto)
  }
}
