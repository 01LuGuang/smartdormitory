import router from '@ohos.router'


@Entry
@Component
struct Index {

  @State account: string = ''//账号
  @State password: string = ''//密码

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround }) {

      //登录界面组件
      Column({ space: 8 }) {

       TextInput({text: this.account, placeholder: '学号或手机号:' })
         .onChange((value)=>{
           this.account = value;

         })
        //Text(this.account)
        //***************************************
        TextInput({ text: this.password,placeholder: '密码:' }).type(InputType.Password)//输入数据保密
          .onChange((value)=>{
            this.password = value;
          })
        //Text(this.password)
        //！！！！！忘记密码的跳转界面，具体居中还是靠右下角还没做！！！！！
        Button('忘记密码？')
          .width('90%')
          .backgroundColor(typeof Color)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
        Button('登录')
          .width('90%')
          .backgroundColor(Color.Pink)
          .margin({ top: 10 })
            //绑定点击事件!!!进行页面跳转
          .onClick(() => {
            router.pushUrl({
              url: 'pages/MainPage',
              //传参到Tokenget***********************************
              params:{
                myaccount : this.account,
                mypassword : this.password
              }
            })
          })
        //和上一个button的上下位置怎么调？？？？？？？？
        Button('没有账户？立即创建')
          .width('100%')
          .backgroundColor(typeof Color)
          .fontColor(Color.Gray)
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
    //图片怎么覆盖不了全屏幕？？？？？？？height50%为一半屏幕
    .height('100%')
    .backgroundImage($r('app.media.PracticePage2'))
    .backgroundImageSize(ImageSize.Cover)
  }

}
