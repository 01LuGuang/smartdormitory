import http from '@ohos.net.http';
import DeviceBean from './DeviceBean';
import hilog from '@ohos.hilog';
import router from '@ohos.router';
AppStorage

export default async function getHttpData(): Promise<DeviceBean[]> {
  //获取同户名参数*******************
  //let myaccount = router.getParams()['myaccount']as string;
  //let mypassword = router.getParams()['mypassword']as string;
  AppStorage.SetOrCreate('token',"1");
  AppStorage.SetOrCreate('myaccount','0');
  AppStorage.SetOrCreate('mypassword','0');

  let token = AppStorage.Link('token');
  let myaccount = AppStorage.Link('myaccount');
  let mypassword = AppStorage.Link('mypassword');

  let dataList: DeviceBean[] = []
  let httpRequest = http.createHttp();
  let response = httpRequest.request(
    // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
    //"Get https://iotda.cn-north-4.myhuaweicloud.com/v5/iot/{project_id}/products/{product_id}",
    //http://cf78c3332d8344268c19d277901f39fd.apig.cn-north-4.huaweicloudapis.com/api/echo
    "https://iam.cn-north-4.myhuaweicloud.com/v3/auth/tokens",
    {
      method: http.RequestMethod.POST,

      header: {'Content-Type': 'application/json;charset=utf8'},
      extraData:{
        "username":myaccount.get(),
        "userpassword":mypassword.get()

        /*
        "auth": {
          "identity": {
            "methods": [
              "password"
            ],
            "password": {
              "user": {
                "name": "user1",
                "password": "wyq2867408613!@",
                "domain": {
                  "name": "scujoker"
                }
              }
            }
          },
          "scope": {
            "project": {
              "name": "cn-north-4"
            }
          }
        }*/
      },
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
    }
  );
  // 使用await和async，等待请求完成处理数据后返回
  await response.then((data) => {
    if (data.responseCode == 201) {
      // 处理返回结果
      try {
            //解析header typescript
            let headers = JSON.stringify(data.header);
            let headersJson = JSON.parse(headers);
            token.set(headersJson['token']);
            // token = headersJson['x-subject-token'];//获取token,绑定到AppStorage的token
            hilog.info(0x0000,'test',token.get());

      }
      catch (e) {
        hilog.error(0x0000,'test',e);
      }
    } else {
      // todo 请求失败，进行失败逻辑处理
      // hilog.error(0x0000,'test',data.result:string);
      hilog.error(0x0000,'test',String(data.result));
    }
  }).catch((err) => {
    // todo 请求失败，进行失败逻辑处理
    console.info('error:' + JSON.stringify(err));
  })
  return dataList;
}