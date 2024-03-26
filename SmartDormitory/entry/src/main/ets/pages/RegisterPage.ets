import router from '@ohos.router'
import hilog from '@ohos.hilog'
import getHttpData from '../../Model/Tokenget'
@Entry
@Component
struct Index {

  @State account: string = ''//账号
  @State name: string = ''//昵称
  @State password: string = ''//密码
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround }) {

      //登录界面组件
      Column({ space: 8 }) {
        TextInput({ placeholder: '学号或手机号:' })
        TextInput({ placeholder: '昵称:' })
        TextInput({ placeholder: '密码:' }).type(InputType.Password)
        Button('注册')
          .width('90%')
          .backgroundColor(Color.Pink)
          .margin({ top: 10 })
            //绑定点击事件!!!进行页面跳转
          .onClick(async () => {

            hilog.info(0x0000,"test","gettoken")
           await getHttpData();
            let token=AppStorage.Link('token'); //绑定
            hilog.info(0x0000,"test"," token %{public}s",token.get());

          })
        Button('已经有账户？点击登录')
          .width('100%')
          .backgroundColor(typeof Color)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/LoginPage'
            })
          })

      }
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.PracticePage2')) //图片背景
    .backgroundImageSize(ImageSize.Cover) //覆盖背景
  }

}