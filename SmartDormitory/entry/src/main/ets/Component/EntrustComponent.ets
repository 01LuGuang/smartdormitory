@Entry
@Component
export struct EntrustComponent {
  @State name: string = '头像'; // 昵称
  @State reputation: string = '信誉值：5000';
  @State credit: string = '信用点：1000';

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
        Text(this.reputation)
          .fontSize(14)
          .fontColor(Color.Orange)
        Text(this.credit)
          .fontSize(14)
          .fontColor(Color.Orange)
      }.width('95%')
      .margin(20)

      //登录界面组件
      Column({ space: 8 }) {

        Button('发布委托')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })


        Button('接受委托')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })

        Button('订单记录')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })

        Button('亲密关系')
          .width('90%')
          .backgroundColor(Color.Gray)
          .margin({ top: 10 })

      }
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.PracticePage2'))
    .backgroundImageSize(ImageSize.Cover)
  }
}
