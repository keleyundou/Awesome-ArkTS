@Entry
@Component
struct GridRowPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]

  build() {
    GridRow({
      columns: 8,// 默认12列
      breakpoints: {
        value: ['200vp', '300vp', '400vp', '500vp', '600vp'],
        reference: BreakpointsReference.WindowSize
      },
      direction: GridRowDirection.RowReverse
    }) {
      ForEach(this.bgColors, (color, index) => {
        GridCol({
          span: {
            xs: 2,
            sm: 3,
            md: 4,
            lg: 6,
            xl: 8,
            xxl: 12
          }
        }) {
          Row() {
            Text(`${index}`)
              .fontColor('#ff33dd11')
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height(50)
        }
        .backgroundColor(color)
      })
    }
  }
}