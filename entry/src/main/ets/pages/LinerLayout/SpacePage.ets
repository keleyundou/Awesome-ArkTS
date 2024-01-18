@Extend(Text)
function titleStyles() {
  .fontSize(25)
  .fontWeight(FontWeight.Bold)
}

@Extend(Text)
function subtitleStyles() {
  .fontSize(15)
  .fontColor(Color.Gray)
}

@Entry
@Component
struct LinerLayoutPage {
  @Styles
  hBarStyles() {
    .width('90%')
    .height(50)
  }

  @Styles
  vBarStyle() {
    .width('10%')
    .height(150)
  }

  @Builder
  onColumnSpace() {
    Column({ space: 20 }) {
      Text('space: 20').subtitleStyles().width('90%')
      Row().hBarStyles().backgroundColor(0xF5DEB3)
      Row().hBarStyles().backgroundColor(0xD2B48C)
      Row().hBarStyles().backgroundColor(0xF5DEB3)
    }
  }

  @Builder
  onRowSpace() {
    Row({ space: 35 }) {
      Text('space: 35').subtitleStyles()
      Row().vBarStyle().backgroundColor(0xF5DEB3)
      Row().vBarStyle().backgroundColor(0xD2B48C)
      Row().vBarStyle().backgroundColor(0xF5DEB3)
    }
  }

  build() {
    Row() {
      Column({ space: 28 }) {
        Text('Column容器间距')
          .titleStyles()
        this.onColumnSpace()
        Text('Row容器间距')
          .titleStyles()
        this.onRowSpace()
      }
      .width('100%')
    }
    .height('100%')
  }
}