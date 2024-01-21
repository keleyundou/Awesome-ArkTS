@Entry
@Component
struct RadioPage {
  @State message: string = 'Hello World'
  @State isSelected: boolean = true

  build() {
    Row() {
      Column() {
        Text('r1')
        Radio({ value: 'r1', group: 'groupA' })
      }
      Column() {
        Text('r2')
        Radio({ value: 'r2', group: 'groupA' })
          .checked(this.isSelected)
          .onChange((isChecked) => {
            console.log('r2', isChecked === true ? '1' : '2')
          })
      }

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}