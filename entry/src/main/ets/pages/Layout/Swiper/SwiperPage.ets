
@Extend(Text)
function swiperTextStyles(bgColor: ResourceColor) {
  .width('90%')
  .height('100%')
  .textAlign(TextAlign.Center)
  .backgroundColor(bgColor)
}

@Entry
@Component
struct SwiperPage {
  private swiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource()

  aboutToAppear() {
    let list = []
    for (let i = 1; i <= 10; i++) {
      list.push(i.toString())
    }
    this.data = new MyDataSource(list)
  }
  
  build() {
    Row() {
      Column() {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item) => {
            Text(`${item}`)
              .swiperTextStyles(Color.Gray)
          }, item => item)
        }
        .height('40%')
        .loop(true)
        .autoPlay(true)
        .interval(3000)
        .indicator(true)
        .indicatorStyle({
          left: 0,
          bottom: 0,
          size: 50,
          color: Color.Brown,
          selectedColor: Color.Pink
        })
        .vertical(false)
        .displayCount(2)
        .itemSpace(8)
        .duration(250) // 切换子组件的动画时长
        .onChange((index) => {
          console.log('swiper onChange', index.toString())
        })
        
        Row({space: 10}) {
          Button('prev').onClick(() => {
            this.swiperController.showPrevious()
          })

          Button('next').onClick(() => {
            this.swiperController.showNext()
          })
        }
        
        Blank().height('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}

class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list?: number[]) {
    this.list = list
  }

  totalCount() {
    return this.list.length
  }

  getData(index: number) {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener) {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}