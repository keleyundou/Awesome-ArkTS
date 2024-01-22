import TitleColumn from '../../../view/TitleColumn'
@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World'

  private scroller = new Scroller()

  @Styles
  flexCommonStyles() {
    .width('90%')
    .padding(10)
    .backgroundColor(0xAFEEEE)
  }

  @Builder
  flexDirectionRow() {
    TitleColumn({title: '布局方向：Row'}) {
      Flex({direction: FlexDirection.Row}) {
        Text('1').width('33%').height(50).backgroundColor(0xF5DEB3)
        Text('2').width('33%').height(50).backgroundColor(0xD2B48C)
        Text('3').width('33%').height(50).backgroundColor(0xF5DEB3)
      }
      .height(70)
      .flexCommonStyles()
    }
  }

  @Builder
  flexDirectionColumn() {
    TitleColumn({title: '布局方向：Column' + '  ' + '高度压缩了'}) {
      Flex({direction: FlexDirection.Column}) {
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3)
        Text('2').width('100%').height(50).backgroundColor(0xD2B48C)
        Text('3').width('100%').height(50).backgroundColor(0xF5DEB3)
      }
      .height(70)
      .flexCommonStyles()
    }
  }

  @Builder
  flexWrap() {
    TitleColumn({title: '布局换行'}) {
      Flex({wrap: FlexWrap.Wrap}) {
        Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
        Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
        Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
      }
      .flexCommonStyles()
    }
  }

  @Builder
  flexAlign() {
    TitleColumn({title: '主轴对齐'}) {
      Flex({justifyContent: FlexAlign.SpaceEvenly}) {
        Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        Text('2').width('20%').height(50).backgroundColor(0xD2B48C)
        Text('3').width('20%').height(50).backgroundColor(0xF5DEB3)
      }
      .flexCommonStyles()
      .padding({ top: 10, bottom: 10 })
    }
  }

  @Builder
  flexAlignItems() {
    TitleColumn({title: '交叉轴对齐'}) {
      TitleColumn({title: '容器组件对齐: alignItems', fontWeight: FontWeight.Regular}) {
        Flex({alignItems: ItemAlign.Stretch}) { // ItemAlign.Stretch 沿着交叉轴方向拉伸填充到容器尺寸
          Text('1').width('50%').height(30).backgroundColor(0xF5DEB3)
          Text('2').width('25%').height(40).backgroundColor(0xD2B48C)
          Text('3').width('25%').height(50).backgroundColor(0xF5DEB3)
        }
        .flexCommonStyles()
        .height(80)
      }

      TitleColumn({title: '子组件对齐: alignSelf', fontWeight: FontWeight.Regular}) {
        Flex({alignItems: ItemAlign.Center}) {
          Text('alignSelf Start').width('25%').height(80)
            .alignSelf(ItemAlign.Start)
            .backgroundColor(0xF5DEB3)
          Text('alignSelf Baseline')
            .alignSelf(ItemAlign.Baseline)
            .width('25%')
            .height(80)
            .backgroundColor(0xD2B48C)
          Text('alignSelf Baseline').width('25%').height(100)
            .backgroundColor(0xF5DEB3)
            .alignSelf(ItemAlign.Baseline)
          Text('no alignSelf').width('25%').height(100)
            .backgroundColor(0xD2B48C)
          Text('no alignSelf').width('25%').height(100)
            .backgroundColor(0xF5DEB3)
        }
        .flexCommonStyles()
        .height(220)
      }

      TitleColumn({title: '内容对齐: ', fontWeight: FontWeight.Regular}) {
        Flex({wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.SpaceAround}) {
          Text('1').width('30%').height(20).backgroundColor(0xF5DEB3)
          Text('2').width('60%').height(20).backgroundColor(0xD2B48C)
          Text('3').width('40%').height(20).backgroundColor(0xD2B48C)
          Text('4').width('30%').height(20).backgroundColor(0xF5DEB3)
          Text('5').width('20%').height(20).backgroundColor(0xD2B48C)
        }
        .flexCommonStyles()
        .height(100)
      }
    }
  }

  build() {
    Scroll(this.scroller) {
      Column({space: 20}) {
        this.flexDirectionRow()
        this.flexDirectionColumn()
        this.flexWrap()
        this.flexAlign()
        this.flexAlignItems()
      }
      .width('100%')
      // .backgroundColor('#c1c1c1')
    }
    // .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .edgeEffect(EdgeEffect.Spring)
    .padding({ top: 10, bottom: 10 })
  }
}
