import { generateGroupAppData } from '../../../viewmodel/AppData'

@Entry
@Component
struct ListGroupPage {
  @State message: string = 'Hello World'
  @State selectedIndex: number = 0;
  private listScroller: Scroller = new Scroller()

  private appGroups = generateGroupAppData()
  private indexTitles: string[]

  aboutToAppear() {
    this.indexTitles = this.appGroups.map((value) => value['title'])
    console.log('group title',JSON.stringify(this.indexTitles))
  }

  @Builder
  groupHeader(title: string) {
    Text(title)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @Builder
  itemEnd() {
    Text('Delete')
  }

  build() {
    Stack({alignContent: Alignment.BottomEnd}) {
      Stack({alignContent: Alignment.End}) {
        List({space: 20, scroller: this.listScroller}) {
          ForEach(this.appGroups, (item) => {
            ListItemGroup({header: this.groupHeader(item.title)}) {
              ForEach(item.apps, (item, index) => {
                ListItem() {
                  Row() {
                    if (index % 2 === 0) {
                      Badge({
                        count: 2,
                        position: BadgePosition.RightTop,
                        style: { badgeSize: 16, badgeColor: '#FA2A2D' }
                      }) {
                        Image(item.icon)
                          .size({width: 40, height: 40})
                      }
                      .margin(10)
                    } else {
                      Image(item.icon)
                        .size({width: 40, height: 40})
                        .margin(10)
                    }

                    Text(item.name)
                      .fontSize(16)
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Start)
                }
                .swipeAction({end: this.itemEnd})
              })
            }
            .divider({strokeWidth: 1, color: '#c0c0c0', startMargin: 15})
            .backgroundColor(Color.White)
          })

          ListItemGroup({header: this.groupHeader('A')}) {
            ListItem() {
              Text('1111')
            }
            ListItem() {
              Text('1111')
            }
          }

          ListItemGroup({header: this.groupHeader('B')}) {
            ListItem() {
              Text('2222')
            }
            ListItem() {
              Text('2222')
            }
          }
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#d1d1d1')
        .sticky(StickyStyle.Header)
        .onScrollIndex((start) => {
          this.selectedIndex = start
        })

        // 索引
        AlphabetIndexer({arrayValue: this.indexTitles, selected: 0})
          .selected(this.selectedIndex)
          .onSelect((index) => {
            this.listScroller.scrollToIndex(index)
          })
          .itemSize(40)
      }

      // 返回顶部按钮
      Button('Top').onClick((event: ClickEvent) => {
        this.listScroller.scrollToIndex(0)
      })
        .type(ButtonType.Circle)
        .width(60)
        .margin(15)
    }
    .backgroundColor(Color.White)
  }
}