@Entry
@Component
struct GridPage {
  @State message: string = 'Hello World'

  data: Array<string>
  numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  scroller = new Scroller()

  aboutToAppear() {
    let maxCount = 20
    let currIndex = 0
    let arr = new Array<string>()
    while (currIndex < maxCount) {
      arr.push(`item${currIndex+1}`)
      currIndex++
    }
    this.data = arr
  }

  build() {
    Column({space: 20}) {
      Grid(this.scroller) {
        ForEach(this.data, (item) => {
          GridItem() {
            Text(item)
          }
          .backgroundColor(Color.Red)
          .width('25%')
        })
      }
      .backgroundColor('#c0c0c0')
      .margin({top: 20})
      // .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height('25%')

      Row({space: 15}) {
        Button('prev').onClick(() => {
          this.scroller.scrollPage({next: false})
        })

        Button('next').onClick(() => {
          this.scroller.scrollPage({next: true})
        })
      }

      Grid() {
        ForEach(this.numbers, (item, index) => {
          if (index === 0) {
            GridItem() {
              Text(`${item}`)
            }
            .backgroundColor('#23f3f3')
            .rowStart(1)
            .rowEnd(2)
          } else if (index === 6) {
            GridItem() {
              Text(`${item}`)
            }
            .backgroundColor('#23f3f3')
            .columnStart(1)
            .columnEnd(2)
          } else {
            GridItem() {
              Text(`${item}`)
            }
            .backgroundColor('#23f3f3')
          }
        }, item => item)
      }
      .backgroundColor('#c0c0c0')
      .width('100%')
      .height('40%')
      .rowsTemplate('1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap('2.5%')
      .columnsGap('2.5%')
    }
  }
}