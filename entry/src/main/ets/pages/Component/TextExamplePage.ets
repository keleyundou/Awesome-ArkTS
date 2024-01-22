import TitleColumn from '../../view/TitleColumn'

@Extend(Text)
function commonStyle() {
  .fontSize(26)
  .border({
    width: 1
  })
}

@Entry
@Component
struct TextExamplePage {
  @State message: string = 'Hello World'
  private text = 'This is the text'
  private longText = 'This is the setting of textOverflow to Clip text content This is the setting of textOverflow to Clip text content'

  build() {
    Scroll() {
      Column({space: 10}) {
        TitleColumn({title: '创建Text'}) {
          Text(this.message)
            .width('90%')
            .textCase(TextCase.LowerCase)
            .commonStyle()
        }
        Divider()
        TitleColumn({title: '添加子组件'}) {
          Text(this.message) {
            Span('span')
              .textCase(TextCase.UpperCase)
          }
          .commonStyle()
        }
        Divider()
        TitleColumn({title: '自定义文本样式'}) {
          TitleColumn({title: '文本对齐', fontSize: 13}) {
            Text('左对齐').width('90%').commonStyle().textAlign(TextAlign.Start)
            Text('居中').width('90%').commonStyle().textAlign(TextAlign.Center)
            Text('右对齐').width('90%').commonStyle().textAlign(TextAlign.End)
          }
          Divider()
          TitleColumn({title: '长文本: textOverflow + maxLines', fontSize: 13}) {
            Text('超出部分裁剪掉' + this.longText)
              .width('90%')
              .textOverflow({ overflow: TextOverflow.Clip })
              .maxLines(1)
              .fontSize(12)
              .border({ width: 1 }).padding(10)
            Text('超出部分显示省略号 ' + this.longText)
              .width('90%')
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(1)
              .fontSize(12)
              .border({ width: 1 }).padding(10)
          }
          Divider()
          TitleColumn({title: '行高', fontSize: 13}) {
            Text(this.longText).commonStyle().fontSize(16)
            Text(this.longText).commonStyle().fontSize(16).lineHeight(25)
          }
          Divider()
          TitleColumn({title: '装饰线样式', fontSize: 13}) {
            Text(this.text).decoration({type: TextDecorationType.Underline, color: Color.Red})
            Text(this.text).decoration({type: TextDecorationType.Overline, color: Color.Red})
            Text(this.text).decoration({type: TextDecorationType.LineThrough, color: Color.Red})
          }
          Divider()
          TitleColumn({title: '文本字符间隔', fontSize: 13}) {
            Text(this.text).letterSpacing(0)
            Text(this.text).letterSpacing(3)
            Text(this.text).letterSpacing(-1)
          }
          Divider()
          TitleColumn({title: '字体大小自适应', fontSize: 13}) {
            Text('我的最大字号为30，最小字号为5，宽度为250，maxLines为1')
              .maxFontSize(30)
              .minFontSize(5)
              .width(250)
              .maxLines(1)
              .border({ width: 1 })
              .padding(10)
              .margin(5)

            Text('我的最大字号为30，最小字号为5，宽度为250，maxLines为2')
              .maxFontSize(30)
              .minFontSize(5)
              .width(250)
              .maxLines(2)
              .border({ width: 1 })
              .padding(10)
              .margin(5)

            Text('我的最大字号为30，最小字号为15，宽度为250,高度为50')
              .width(250)
              .height(50)
              .maxFontSize(30)
              .minFontSize(15)
              .border({ width: 1 })
              .padding(10)
              .margin(5)

            Text('我的最大字号为30，最小字号为15，宽度为250,高度为100')
              .width(250)
              .height(100)
              .maxFontSize(30)
              .minFontSize(15)
              .border({ width: 1 })
              .padding(10)
              .margin(5)
          }
          Divider()
          TitleColumn({title: '文本是否可复制', fontSize: 13}) {
            Text(this.text).copyOption(CopyOptions.InApp)
          }
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding({top: 25, bottom: 25})
    .backgroundColor('#c1c1c1')
  }
}