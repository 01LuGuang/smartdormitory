import http from '@ohos.net.http';
import DeviceBean from './DeviceBean';

class MainViewModel {
  // Get device data
  public getDeviceData(deviceId: number): DeviceBean {
    // Mocking data for now, will later read from the device
    let deviceBean = new DeviceBean(1,'Jerry设备',22.5,5.12,700,0,0,0);
    deviceBean.temperator += Math.floor(Math.random() * 5); // Simulate data change
    deviceBean.lumination += Math.floor(Math.random() * 5); // Simulate data change
    return deviceBean;
  }

  // Fetch HTTP data asynchronously
  public async getHttpData(): Promise<DeviceBean[]> {
    let dataList: DeviceBean[] = [];

    let httpRequest = http.createHttp();
    let response = httpRequest.request(
      "POST //iotda.cn-north-4.myhuaweicloud.com/v5/iot/80bca2eb4372425bbfa540bbf4dc42db/products",
      {
        method: http.RequestMethod.GET,
        header: {
          'Content-Type': 'application/json',
        },
        expectDataType: http.HttpDataType.STRING,
      }
    );

    // Await for response
    await response.then((data) => {
      console.info('Result:' + data.result);
      console.info('code:' + data.responseCode);
      console.info('header:' + JSON.stringify(data.header));
      console.info('cookies:' + data.cookies);
      console.info('header.Content-Type:' + data.header['Content-Type']);
      console.info('header.Status-Line:' + data.header['Status-Line']);
    }).catch((err) => {
      console.info('error:' + JSON.stringify(err));
    });

    return dataList;
  }
}

export default new MainViewModel();
