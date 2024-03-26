import router from '@ohos.router'
import getHttpData from '../../Model/Tokenget'
import hilog from '@ohos.hilog';
@Entry
@Component
export struct MineComponent {
  @State name: string = 'Jerry'; // 昵称
  @State signature: string = '最智慧寝室';//签名

  build(){


    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround }) {

      //用户基本信息
      Column({ space: 8 }) {
        Image($r('app.media.user_avtar'))
          .width(68) //头像左右拉伸程度
          .height(68) //头像上下拉伸程度
          .borderRadius(68)
        Text(this.name)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Text(this.signature)
          .fontSize(14)
          .fontColor(Color.Orange)
      }.width('95%')
      .margin(20)

      //登录界面组件
      Column({ space: 8 }) {

        Button('编辑资料')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/NewIndex' //新建的加载页面
            })
          })

        Button('设置')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })
          .onClick(() => {
            // getHttpData();
            // let token=AppStorage.Link('token');
            hilog.info(0x0000,"test","is");
          })
        Button('帮助')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })
            //绑定点击事件!!!进行页面跳转
          .onClick(() => {
            router.pushUrl({
              url: 'pages/NewIndex' //新建的加载页面
            })
          })
        Button('退出登录')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/NewIndex'
            })
          })
      }
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.MyPage'))
    .backgroundImageSize(ImageSize.Cover)


  }
}
