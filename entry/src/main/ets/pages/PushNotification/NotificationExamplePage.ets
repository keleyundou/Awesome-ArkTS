import notificationManager from '@ohos.notificationManager';
import image from '@ohos.multimedia.image';
import wantAgent from '@ohos.app.ability.wantAgent';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct NotificationExamplePage {
  @State message: string = 'Notification';
  msgId: number = 100;
  downloadId: number = 10000
  downloadCurrValue: number = 30

  aboutToAppear() {
    let context = getContext(this) as common.UIAbilityContext
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
        Blank().layoutWeight(1)
        Column({space: 10}) {
          Text('基础通知').fontSize(22)
          Button('普通文本通知').onClick(() => {
            this.publishBasicTextNotification(this.msgId++)
          })

          Button('长文本通知').onClick(() => {
            this.publishLongTextNotification(this.msgId++)
          })

          Button('多行文本通知').onClick(() => {
            this.publishMultiLineNotification(this.msgId++)
          })

          Button('图片通知').onClick(() => {
            this.publishPictureNotification(this.msgId++)
          })

          Button('进度条通知').onClick(() => {
            this.startDownloadFile()
          })

          Button('带有意图的通知').onClick(() => {
            this.publishWantAgentNotification(this.msgId++)
          })
        }
        Blank().layoutWeight(1)
      }
      .width('100%')
    }
    .height('100%')
  }

  publishBasicTextNotification(msgId: number) {
    let request: notificationManager.NotificationRequest = {
      id: msgId,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '标题' + msgId,
          text: '内容',
          additionalText: '附加内容'
        }
      }
    }
    this.publish(request)
  }

  publishLongTextNotification(msgId: number) {
    let request: notificationManager.NotificationRequest = {
      id: msgId,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
        longText: {
          title: '标题',
          text: '内容',
          additionalText: '附加内容',
          longText: '长内容长内容长内容长内容长内容长内容',
          briefText: '简介',
          expandedTitle: '展开后的标题'
        }
      }
    }
    this.publish(request)
  }

  publishMultiLineNotification(msgId: number) {
    let request: notificationManager.NotificationRequest = {
      id: msgId,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
        multiLine: {
          title: '标题',
          text: '内容',
          briefText: '概要',
          longTitle: '展开后的标题',
          lines: ['第一行', '第二行', '第三行行行行行行行行行行行行行行']
        }
      }
    }
    this.publish(request)
  }

  async publishPictureNotification(msgId: number) {
    let image = await this.getImage()
    let request: notificationManager.NotificationRequest = {
      id: msgId,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: '标题',
          text: '内容',
          additionalText: '附加的内容',
          briefText: '概要内容',
          expandedTitle: '展开后的标题',
          picture: image
        }
      }
    }
    this.publish(request)
  }

  async publishProgressNotification(msgId: number) {
    let isSupport = await notificationManager.isSupportTemplate('downloadTemplate')
    console.log('[Notification', isSupport ? '支持' : '不支持')
    if (isSupport === false) {
      return
    }

    let template: notificationManager.NotificationTemplate = {
      name: 'downloadTemplate',
      data: {
        'title2': '标题',
        'fileName': 'music.mp4',
        'progressValue': this.downloadCurrValue,
        'progressMaxValue': 100,
      }
    }

    let request: notificationManager.NotificationRequest = {
      id: msgId,
      slotType:notificationManager.SlotType.OTHER_TYPES,
      template: template,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: `${template.data.title2}${template.data.fileName}`,
          text: 'sendTemplate',
          additionalText: '30%'
        }
      }
    }
    this.publish(request)
  }

  async publishWantAgentNotification(msgId: number) {
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          deviceId: '',
          bundleName: 'com.example.myapplication',
          abilityName: '',
          action: '',
          entities: [],
          uri: '',
          parameters: {}
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITY,
      requestCode: 1,
      wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG],
      extraInfo: {
        'k1': 'v1',
        'k2': [1,2,3]
      }
    }
    let wantAgentObject = await wantAgent.getWantAgent(wantAgentInfo)

    let request: notificationManager.NotificationRequest = {
      id: msgId,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '标题' + msgId,
          text: '内容',
          additionalText: '附加内容'
        }
      },
      wantAgent: wantAgentObject
    }
    this.publish(request)
  }

  publish(request: notificationManager.NotificationRequest) {
    // notificationManager.publish(request, (e) => {
    //   if (e) {
    //     console.error(`[ANS] failed to publish, error[${e}]`);
    //     return
    //   }
    //   console.info(`[ANS] publish success`);
    // })

    notificationManager.publish(request)
      .then(() => {
        console.info(`[ANS] publish success`);
      })
      .catch((e) => {
        console.error(`[ANS] failed to publish, error[${e}]`);
      })
  }

  getImage(): Promise<PixelMap> {
    return new Promise(async (resolve, reject) => {
      let rm = getContext(this).resourceManager
      let file = await rm.getMediaContent($r('app.media.startIcon'))
      image.createImageSource(file.buffer).createPixelMap()
        .then((value:PixelMap) => {
          if (value === null || value === undefined) {
            console.log('null')
          }
          resolve(value)
        })
        .catch((e) => {
          console.log('图片加载异常', JSON.stringify(e))
          reject('图片加载异常')
        })
    })
  }

  startDownloadFile() {
    console.log('[Notification]', 'start')
    let tid = setInterval(() => {
      console.info(String(this.downloadCurrValue))
      this.downloadCurrValue += 5
      if (this.downloadCurrValue > 100) {
        clearInterval(tid)
        console.log('[Notification]', 'download finish')
        return
      }
      this.publishProgressNotification(this.downloadId)
    }, 1000)
  }
}