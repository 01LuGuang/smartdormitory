import DeviceBean from '../../Model/DeviceBean';
import MainViewModel from '../../Model/MainViewModel';
//@Entry
@Component
export default struct HouseStateComponent {
  @State deviceBean: DeviceBean = null;
  private timerId: number = 0;//计时器id，每5秒读取一次数据

  build(){
    /*Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround }) {*/
    Column({space:8}){
      Text('Hi！欢迎来到201A')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Orange)
        .margin({top:10})
      Divider().width('95%')

      //设备ID
      Row(){
        Text('设备ID:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('dev01')
        //从变量读取数据************************************************
        Text(`${this.deviceBean.deviceId}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)//使用两端对齐
      //设备名
      Row(){
        Text('设备名:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('jerry的设备')
        //从变量读取数据
        Text(`${this.deviceBean.name}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)
      //室内温度

      Row(){
        Text('室内温度:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('22.5°C')
        Text(`${this.deviceBean.temperator}°C`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //室内湿度
      Row(){
        Text('室内湿度:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('5.14RH')
        Text(`${this.deviceBean.humidity}RH`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //光照强度
      Row(){
        Text('光照强度:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('777Lux')
        Text(`${this.deviceBean.lumination}Lux`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //下雨预警
      Row(){
        Text('下雨预警:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('无')
        Text(`${this.deviceBean.isRain===0?'无':'有雨'}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //烟雾报警
      Row(){
        Text('空气质量:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('正常')
        Text(`${this.deviceBean.isAir===0?'优':'报警中...'}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)
      //火灾报警
      Row(){
        Text('火灾报警:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        //Text('正常')
        Text(`${this.deviceBean.isFire===0?'无':'报警中...'}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)
      Divider().width('95%')//分割线
      Text('厕所使用状态')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .margin({top:10})
      Divider().width('95%')//分割线

      //房门开关
      Row(){
        Text('101:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Toggle({type:ToggleType.Switch,isOn:false})

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //车库门开关
      Row(){
        Text('102:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Toggle({type:ToggleType.Switch,isOn:false})

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //窗帘开关
      Row(){
        Text('201:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Toggle({type:ToggleType.Switch,isOn:true})

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //开关灯
      Row(){
        Text('202:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Toggle({type:ToggleType.Switch,isOn:false})

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.MyPage')) //图片背景
    .backgroundImageSize(ImageSize.Cover) //覆盖背景
  }
  //当页面出现前加载设备数据
  loadDeviceData(){
    this.deviceBean = MainViewModel.getDeviceData(1);
  }
//页面出现时更新数据
  // aboutToAppear函数在创建自定义组件的新实例后，在执行其build()函数之前执行。
  // 允许在aboutToAppear函数中改变状态变量，更改将在后续执行build()函数中生效。
  aboutToAppear(){
    //当页面出现时获取设备数据
    this.loadDeviceData()

    //每隔5秒加载一次数据
    //setInterval重复调用一个函数，在每次调用之间具有固定的时间延迟
    this.timerId = setInterval(()=>{
      this.loadDeviceData();
    },1000)

  }

}