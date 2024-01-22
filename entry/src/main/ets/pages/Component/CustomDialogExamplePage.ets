@Entry
@Component
struct CustomDialogExamplePage {
  @State message: string = 'Hello World'

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogView({
      cancel: this.onCancel,
      confirm: this.onAccept
    }),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    customStyle: false,
    offset: {dx: 0, dy: -20}
  })

  onCancel() {
    console.log('onCancel')
  }

  onAccept() {
    console.log('onAccept')
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20).fontWeight(FontWeight.Bold).margin({bottom: 10})
        Button('Show Dialog').onClick(() => {
          this.dialogController.open()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@CustomDialog
struct CustomDialogView {
  ctrl: CustomDialogController
  cancel: () => void
  confirm: () => void
  build() {
    Column() {
      Text('内容')
        .margin({ top: 10, bottom: 10 })
        .onClick(() => {
          this.ctrl.close()
        })
        .backgroundColor(Color.Red)
      Flex({direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround}) {
        Button('Cancel').onClick(() => {
          this.ctrl.close()
          this.cancel()
        })

        Button('Ok').onClick(() => {
          this.ctrl.close()
          this.confirm()
        })
      }
    }
    .width('100%')
    .backgroundColor(Color.Green)
    .alignItems(HorizontalAlign.Center)
  }
}