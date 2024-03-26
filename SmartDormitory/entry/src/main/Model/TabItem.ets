export interface TabItem {
  icon:Resource;
  icon_selected: Resource;
//  title:string;
  id:number;
}
export enum TabID {
  HOURSE,
  SEARCH_CONTROL,
  ENTRUST,
  MINE
}
export const TabItemList: TabItem[] = [
  {
    icon:$r('app.media.house0'),
    icon_selected: $r('app.media.house1'),
//    title: '小屋状态',
    id:TabID.HOURSE
  },
  {
    icon:$r('app.media.control0'),
    icon_selected: $r('app.media.control1'),
//    title: '设备控制',
    id:TabID.SEARCH_CONTROL
  },
  {
    icon:$r('app.media.entrust0'),
    icon_selected: $r('app.media.entrust0'),
    //    title: '委托',
    id:TabID.ENTRUST
  },
  {
    icon:$r('app.media.mine0'),
    icon_selected: $r('app.media.mine1'),
//    title: '个人主页',
    id:TabID.MINE
  }
]

