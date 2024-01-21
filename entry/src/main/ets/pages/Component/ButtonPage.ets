@Entry
@Component
struct ButtonPage {
  @State message: string = 'Hello World'

  build() {
    Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween}) {
      Text('Normal')
      Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween}) {
        Button('Ok', {type: ButtonType.Normal, stateEffect: true})
          .borderRadius(8)
          .backgroundColor('#317aff')
          .width(90)
          .onClick(() => {
            console.log('ButtonType.Normal')
          })

        Button({type: ButtonType.Normal, stateEffect: true}) {
          Row() {
            LoadingProgress().width(20).height(20).margin({left: 12}).color(Color.White)
            Text('loading').fontSize(12).fontColor(Color.White).margin({left: 5, right: 12})
          }
          .alignItems(VerticalAlign.Center)
        }
        .width(90)
        .height(40)
        .backgroundColor('#317aff')
        .borderRadius(8)

        Button('Disable', {type: ButtonType.Normal, stateEffect: false})
          .backgroundColor('#317aff')
          .opacity(0.4)
          .borderRadius(8)
          .width(90)
      }

      Text('Capsule')
      Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween}) {
        Button('Ok', {type: ButtonType.Capsule, stateEffect: true})
          .borderRadius(8)
          .backgroundColor('#317aff')
          .width(90)
          .onClick(() => {
            console.log('ButtonType.Capsule')
          })

        Button({type: ButtonType.Capsule, stateEffect: true}) {
          Row() {
            LoadingProgress().width(20).height(20).margin({left: 12}).color(Color.White)
            Text('loading').fontSize(12).fontColor(Color.White).margin({left: 5, right: 12})
          }
          .alignItems(VerticalAlign.Center)
        }
        .width(90)
        .height(40)
        .backgroundColor('#317aff')
        .borderRadius(8)

        Button('Disable', {type: ButtonType.Capsule, stateEffect: false})
          .backgroundColor('#317aff')
          .opacity(0.4)
          .borderRadius(8)
          .width(90)
      }

      Text('Circle')
      Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}) {
        Button('Ok', {type: ButtonType.Circle, stateEffect: true})
          .backgroundColor('#317aff')
          .width(55)

        Button({type: ButtonType.Circle, stateEffect: true}) {
          LoadingProgress().width(20).height(20).color(Color.White)
        }
        .margin({left: 20})
        .width(55)
        .height(55)
        .backgroundColor('#317aff')

      }
    }
    .height(400)
    .padding({top: 35, left: 35, right: 35})
  }
}