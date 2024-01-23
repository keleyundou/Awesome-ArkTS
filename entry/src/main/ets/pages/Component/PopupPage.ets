@Entry
@Component
struct PopupPage {
  message: string = 'This is a popup with PopupOptions'
  @State showPopup: boolean = false
  @State showCustomPopup: boolean = false

  handlePopup() {
    this.showPopup = !this.showPopup
  }

  @Builder
  customPopup() {
    Row({space: 10}) {
      Image($r('app.media.app_icon')).width('35').height('35').objectFit(ImageFit.Contain)
      Text('This is a Custom Popup').fontColor(Color.White).textOverflow({overflow: TextOverflow.Ellipsis}).maxLines(2)
        .width('40%')
    }
    // .height(80)
    .padding({left: 15, right: 15, top: 8, bottom: 8})
  }

  build() {
    Row() {
      Column({space: 150}) {
        // 系统气泡提示
        Button('PopupOptions')
          .onClick(() => {
            this.handlePopup()
          })
          .bindPopup(this.showPopup, {
            message: this.message,
            placementOnTop: false,
            arrowOffset: 100,
            showInSubWindow: false,
            primaryButton: {
              value: 'Cancel',
              action: () => {
                console.log('click Cancel')
                this.handlePopup()
              }
            },
            secondaryButton: {
              value: 'Confirm',
              action: () => {
                console.log('click Confirm')
                this.handlePopup()
              }
            },
            onStateChange: (e) => { // 气泡状态变化的回调事件
              if (!e.isVisible) {
                this.showPopup = false
              }
            }
          })

        // 自定义气泡提示
        Button('CustomPopup')
          // .position({x: 100, y: 200})
          .onClick(() => {
            this.showCustomPopup = !this.showCustomPopup
          })
          .bindPopup(this.showCustomPopup, {
            builder: this.customPopup,
            placement: Placement.TopLeft,
            maskColor: Color.Green,// 未生效
            popupColor: Color.Red,
            enableArrow: true,
            autoCancel: true,
            onStateChange: (e) => {
              console.log(`The CustomPopup Show State: ${e.isVisible}`)
            },
            arrowOffset: '50%'
          })
      }
      .width('100%')
      .padding(5)
    }
    .height('100%')
  }
}