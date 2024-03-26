@Entry
@Component
export struct DeviceControlComponent {
  @State stats1: boolean = false
  @State stats2: boolean = false
  @State stats3: boolean = false
  @State stats4: boolean = false
  @State stats5: boolean = false

  build() {

    Column() {
      Image(this.stats1 ? $r("app.media.c0") : $r("app.media.c1"))
        .width("40%")
        .height("140vp")
        .offset({ x: "-26%", y: "8.9999999%" })
        .onClick(() => {
          this.stats1 = !this.stats1
        })
      Image(this.stats2 ? $r("app.media.ml0") : $r("app.media.ml1"))
        .width("40%")
        .height("140vp")
        .offset({ x: "26%", y: "-8.5%" })
        .onClick(() => {
          this.stats2 = !this.stats2
        })
      Image(this.stats3 ? $r("app.media.a0") : $r("app.media.a1"))
        .width("40%")
        .height("140vp")
        .offset({ x: "0", y: "-2.5%" })
        .onClick(() => {
          this.stats3 = !this.stats3
        })
      Image(this.stats4 ? $r("app.media.a0") : $r("app.media.a1"))
        .width("40%")
        .height("140vp")
        .offset({ x: "-26%", y: "4.5%" })
        .onClick(() => {
          this.stats4 = !this.stats4
        })
      Image(this.stats5 ? $r("app.media.a0") : $r("app.media.a1"))
        .width("40%")
        .height("140vp")
        .offset({ x: "25%", y: "-13.6%" })
        .onClick(() => {
          this.stats5 = !this.stats5
        })
      Image("app.media.renew")
        .width("20%")
        .height("70vp")
        .offset({ x: "25%", y: "-13.6%" })
        .onClick(() => {
        })
      Image("app.media.controlrenew")
        .width("20%")
        .height("70vp")
        .offset({ x: "25%", y: "-13.6%" })
        .onClick(() => {
        })
      Image("app.media.renew")
        .width("20%")
        .height("70vp")
        .offset({ x: "0%", y: "0%" })
        .onClick(() => {
        })
      Image("app.media.controlrenew")
        .width("20%")
        .height("70vp")
        .offset({ x: "0%", y: "0%" })
        .onClick(() => {
        })
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.control'))
    .backgroundImageSize(ImageSize.Cover)
    .offset({ x: "0%", y: "0%" })
  }
}