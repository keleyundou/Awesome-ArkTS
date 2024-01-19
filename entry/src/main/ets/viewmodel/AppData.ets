class AppData {
  static AppID: number = 1
  id: number = AppData.AppID++
  name: string
  icon: ResourceStr

  constructor(name: string, icon: ResourceStr) {
    this.name = name
    this.icon = icon
  }
}

function generateAppData(count: number = 10): AppData[] {
  let maxCount = count
  let currIdx = 0
  let arr = new Array<AppData>()
  while (currIdx < maxCount) {
    arr.push(new AppData('AppName' + `${currIdx + 1}`,$r('app.media.app_icon')))
    currIdx++
  }
  return arr
}

function generateGroupAppData(): object[] {
  return [
    {
      title: '游戏',
      apps: generateAppData(5)
    },
    {
      title: '新闻',
      apps: generateAppData(3)
    },
    {
      title: '娱乐',
      apps: generateAppData(8)
    },
    {
      title: '旅游',
      apps: generateAppData(4)
    }
  ]
}

export { AppData, generateAppData, generateGroupAppData }


