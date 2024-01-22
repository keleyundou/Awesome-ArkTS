@Entry
@Component
struct ProgressExamplePage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column({space: 20}) {
        Text('Linear').width('90%')
        Column() {
          Progress({value: 10,  type: ProgressType.Linear})
            .width('90%')
          Progress({value: 10, total: 100, type: ProgressType.Linear})
            .value(50)
            .color(Color.Red)
            .width('90%')
        }

        Text('Ring').width('90%')
        Row({space: 10}) {
          Progress({value: 10, type: ProgressType.Ring})
          Progress({value: 10, total: 100, type: ProgressType.Ring})
            .color(Color.Red)
            .backgroundColor(Color.Green)
            .style({
              strokeWidth: 10
            })
            .width(100)
        }

        Text('Eclipse').width('90%')
        Row({space: 10}) {
          Progress({value: 10, total: 100, type: ProgressType.Eclipse})
            .width(100)
          Progress({value: 50, type: ProgressType.Eclipse})
            .width(100)
        }

        Text('ScaleRing').width('90%')
        Row({space: 10}) {
          Progress({value: 10, type: ProgressType.ScaleRing})
            .style({
              scaleCount: 50
            })
            .width(100)
          Progress({value: 10, type: ProgressType.ScaleRing})
            .style({
              strokeWidth: 15,
              scaleCount: 20,
              scaleWidth: 3
            })
            .width(100)
          Progress({value: 10, total: 100, type: ProgressType.ScaleRing})
            .style({
              strokeWidth: 10,
              scaleCount: 20,
              scaleWidth: 5
            })
            .width(100)
        }

        Text('Capsule').width('90%')
        Row({space: 10}) {
          Progress({value: 10, total: 100, type: ProgressType.Capsule})
            .width(100)
            .height(40)
          Progress({value: 15, total: 100, type: ProgressType.Capsule})
            .width(100)
            .height(40)
          Progress({value: 20, total: 100, type: ProgressType.Capsule})
            .width(100)
            .height(40)
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}