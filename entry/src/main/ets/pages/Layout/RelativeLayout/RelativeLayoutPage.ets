@Entry
@Component
struct RelativeLayoutPage {
  @State message: string = 'Hello World'

  @Builder
  useRelativeContainer() {
    RelativeContainer() {
      Rect({ width: 100, height: 100 })
        .fill(Color.Red)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .id('row1')
        .margin({ bottom: 8 })

      Rect({ width: 100, height: 100 })
        .fill(Color.Green)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .id('row2')

      Rect({ width: 100, height: 100 })
        .fill(Color.Pink)
        .alignRules({
          top: { anchor: 'row1', align: VerticalAlign.Bottom },
          left: { anchor: 'row1', align: HorizontalAlign.Start }
        })
        .id('row3')
    }
    .width('100%')
    .height('40%')
    .backgroundColor('#33aa6f')
  }

  @Builder
  example() {
    Row() {
      RelativeContainer() {
        Rect({ width: 100, height: 100 })
          .fill('#FF3333')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .id('red')
        Row() {
          Image($r('app.media.icon'))
        }
        .width(100)
        .height(100)
        .id('icon')
        .alignRules({
          top: { anchor: 'red', align: VerticalAlign.Bottom },
          middle: { anchor: 'red', align: HorizontalAlign.Center }
        })

        Rect({ width: 100, height: 100 })
          .fill('#FFCC00')
          .id('yellow')
          .alignRules({
            top: { anchor: 'icon', align: VerticalAlign.Top },
            right: { anchor: 'icon', align: HorizontalAlign.Start }
          })

        Rect({ width: 100, height: 100 })
          .fill('#FF9966')
          .id('orange')
          .alignRules({
            top: { anchor: 'icon', align: VerticalAlign.Top },
            left: { anchor: 'icon', align: HorizontalAlign.End }
          })
        Rect({ width: 100, height: 100 })
          .fill('#FF66FF')
          .id('purple')
          .alignRules({
            top: { anchor: 'icon', align: VerticalAlign.Bottom },
            middle: { anchor: 'icon', align: HorizontalAlign.Center }
          })
      }
      .width(300)
      .height(300)
      .border({ width: 2, color: '#6699FF' })
      .backgroundColor('#33aa6f')
    }
  }

  build() {
    Column({ space: 20 }) {
      this.useRelativeContainer()
      this.example()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#c1c1c1')
  }
}