import { TabID, TabItemList } from '../../Model/TabItem';
import { DeviceControlComponent } from '../Component/DeviceControlComponent';
import { EntrustComponent } from '../Component/EntrustComponent';
import HouseStateComponent from '../Component/HouseStateComponent';
import { MineComponent } from '../Component/MineComponent';
@Entry
@Component
struct NewPage {

  @State pageIndex:number = 0;
  private tabController:TabsController = new TabsController();

  build() {

    Tabs({barPosition:BarPosition.End}){

      TabContent(){
        HouseStateComponent()//调用小屋状态组件
      }
      .tabBar(this.MyTabBuilder(TabID.HOURSE))//调用自定义的TabBar

      TabContent(){
        DeviceControlComponent()//调用设备控制组件
      }
      .tabBar(this.MyTabBuilder(TabID.SEARCH_CONTROL))//调用自定义的TabBar


      TabContent(){
        EntrustComponent()//调用委托组件
      }
      .tabBar(this.MyTabBuilder(TabID.ENTRUST))//调用自定义的TabBar

      TabContent(){
        MineComponent()//个人主页
      }
      .tabBar(this.MyTabBuilder(TabID.MINE))//调用自定义的TabBar
    }
    .barWidth('100%')
    .barMode(BarMode.Fixed)
    .barWidth('100%')
    .height('100%')
    .onChange((index)=>{//绑定onChange函数切换页签
      this.pageIndex = index;
    })
  }

  @Builder MyTabBuilder(idx: number){
    Column(){
      Image(idx === this.pageIndex ? TabItemList[idx].icon_selected :
      TabItemList[idx].icon)
        .width(32)
        .height(32)
     /* Text(TabItemList[idx].title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.pageIndex === idx ? '#006eee':'#888')*/
    }
  }
}
