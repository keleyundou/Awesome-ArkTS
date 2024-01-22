@Component
export default struct TitleColumn {
  title?: string
  fontSize: string | number | Resource = 16
  fontWeight: FontWeight = FontWeight.Bold
  // 构建自定义组件尾随闭包, 且只能有一个 @BuilderParam 标注
  @BuilderParam callback: () => void

  build() {
    Column({space: 8}) {
      Text(this.title)
        .fontSize(this.fontSize)
        .fontColor(Color.Grey)
        .fontWeight(this.fontWeight)
        .textAlign(TextAlign.Center)
      // .padding(10)
      this.callback()
    }
  }
}