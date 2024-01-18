
const columnAlignItems: string[] = ['Start', 'Center', 'End']
const rowAlignItems: string[] = ['Top', 'Center', 'Bottom']

const flexAligns: string[][] = [
  ['Start', 'Center', 'End'],
  ['Between', 'Around', 'Evenly']
]

const flexAlignMap = {
  'Start': FlexAlign.Start,
  'Center': FlexAlign.Center,
  'End': FlexAlign.End,
  'Between': FlexAlign.SpaceBetween,
  'Around': FlexAlign.SpaceAround,
  'Evenly': FlexAlign.SpaceEvenly
}

enum LinerLayoutType {
  Column = 'Column',
  Row = 'Row'
}

const person: Record<string, FlexAlign> = {
  Start: FlexAlign.Start
}

@Entry
@Component
struct AlignPage {
  @State message: string = 'Hello World'
  @State layoutType: LinerLayoutType = LinerLayoutType.Column
  linerLayoutTypes: string[] = Object.values(LinerLayoutType)

  @State columnAlign: HorizontalAlign = HorizontalAlign.Start
  @State columnFlexAlign: FlexAlign = FlexAlign.Start

  @State rowAlign: VerticalAlign = VerticalAlign.Top
  @State rowFlexAlign: FlexAlign = FlexAlign.Start
  scrollView = new Scroller()

  @Builder
  onColumnAlign() {
    Column() {
      Column().width('80%').height(50).backgroundColor(0xF5DEB3)
      Column().width('80%').height(50).backgroundColor(0xD2B48C)
      Column().width('80%').height(50).backgroundColor(0xF5DEB3)
    }
    .width('100%')
    .height(250)
    .alignItems(this.columnAlign)
    .justifyContent(this.columnFlexAlign)
    .backgroundColor('rgb(242,242,242)')
    .border(this.layoutType === LinerLayoutType.Column ? {width: 2, color: Color.Red, radius: 5} : {width: 0})
  }

  @Builder
  onRowAlign() {
    Row() {
      Row().width('20%').height(30).backgroundColor(0xF5DEB3)
      Row().width('20%').height(30).backgroundColor(0xD2B48C)
      Row().width('20%').height(30).backgroundColor(0xF5DEB3)
    }
    .width('100%')
    .height(100)
    .alignItems(this.rowAlign)
    .justifyContent(this.rowFlexAlign)
    .backgroundColor('rgb(242,242,242)')
    .border(this.layoutType === LinerLayoutType.Row ? {width: 2, color: Color.Red, radius: 5} : {width: 0})
  }

  @Builder
  segmentView() {
    Row({space: 30}) {
      ForEach(this.linerLayoutTypes, (item) => {
        Button(item).onClick(() => {
          console.log(item)
          this.layoutType = item
          console.log(FlexAlign.Start.toFixed())
        })
      }, (item, index) => {
        return item + index
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

  columnHorizontalAlign(align: string) {
    switch (align) {
      case 'Start':
        this.columnAlign = HorizontalAlign.Start
        break
      case 'Center':
        this.columnAlign = HorizontalAlign.Center
        break
      case 'End':
        this.columnAlign = HorizontalAlign.End
        break
    }
  }

  rowVerticalAlign(align: string) {
    switch (align) {
      case 'Top':
        this.rowAlign = VerticalAlign.Top
        break
      case 'Center':
        this.rowAlign = VerticalAlign.Center
        break
      case 'Bottom':
        this.rowAlign = VerticalAlign.Bottom
        break
    }
  }


  @Builder
  alignItemsMenuView() {
    Column({space: 8}) {
      Text('alignItems：' + '交叉轴对齐').fontColor(Color.Gray).fontWeight(FontWeight.Medium)
      Row() {
        ForEach(this.layoutType === LinerLayoutType.Column ? columnAlignItems : rowAlignItems, (item) => {
          Button(item).onClick(() => {
            if (this.layoutType === LinerLayoutType.Column) {
              this.columnHorizontalAlign(item)
            } else {
              this.rowVerticalAlign(item)
            }
          })
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
  }



  @Builder
  justifyContentMenuView() {
    Column({space: 8}) {
      Text('justifyContent：' + '主轴对齐').fontColor(Color.Gray).fontWeight(FontWeight.Medium)
      ForEach(flexAligns, (items: string[]) => {
        Row() {
          ForEach(items, (item: string) => {
            Button(item).onClick(() => {
              if (this.layoutType === LinerLayoutType.Column) {
                this.columnFlexAlign = flexAlignMap[item]
              } else {
                this.rowFlexAlign = flexAlignMap[item]
              }
            })
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      })
    }
  }

  @Builder
  panelView() {
    Column({ space: 28 }) {

      // 容器切换
      this.segmentView()

      // Column容器对齐
      this.alignItemsMenuView()

      // Row容器对齐
      this.justifyContentMenuView()
    }
  }

  scroller: Scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Column({ space: 20 }) {
        ForEach([1, 2, 3, 4, 5], (item) => {
          Row().width('90%').height('5%').backgroundColor(Color.Red)
        })
        this.onColumnAlign()
        this.onRowAlign()
        this.panelView()
      }
      .width('100%')
      .margin({top: 64})
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Gray)
    .scrollBarWidth(10)
    .edgeEffect(EdgeEffect.Spring)// 边界效果：弹簧效果
    .padding({bottom: 15})
  }
}