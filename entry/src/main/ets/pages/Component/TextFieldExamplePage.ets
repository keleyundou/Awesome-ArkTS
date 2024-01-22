import TitleColumn from '../../view/TitleColumn'

@Entry
@Component
struct TextFieldExamplePage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column({space: 20}) {
        TitleColumn({title: '单行文本框'}) {
          TextInput({placeholder: '请输入用户名'}).type(InputType.Normal).width('90%')
          TextInput({placeholder: '请输入密码'}).type(InputType.Password).width('90%')
        }

        TitleColumn({title: '多行文本框'}) {
          TextArea({placeholder: '请输入内容', text: this.message}).width('90%')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}