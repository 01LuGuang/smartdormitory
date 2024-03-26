import router from '@ohos.router'
@Entry
@Component
struct Index {

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround }) {
      Text('智慧宿舍系统')
        .fontSize(24)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)

      //登录界面组件
      Column({ space: 8 }) {

        Button('登录')
          .width('90%')
          .backgroundColor(Color.Pink)
          .margin({ top: 10 })
            //绑定点击事件!!!进行页面跳转
          .onClick(() => {
            router.pushUrl({
              url: 'pages/LoginPage' //新建的加载页面
            })
          })
        Button('注册')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/RegisterPage'
            })
          })
      }
      .width('90%')

    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.newbackground')) //图片背景
    .backgroundImageSize(ImageSize.Cover) //覆盖背景
  }
}