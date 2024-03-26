import { ResponseResult } from './data_analyse';
import http from '@ohos.net.http';
export function httpRequestGet(url: string): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  // 发送数据请求
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: ,
    header: {
      'Content-Type':
    },
    connectTimeout: Const.HTTP_READ_TIMEOUT,
    extraData: {}
  });

  let serverData: ResponseResult = new ResponseResult();

  // Processes the data and returns.
  // 处理数据，并返回
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === 200) {
      // Obtains the returned data.
      // 处理数据，并返回
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.code === Const.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `${'网络错误'}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.msg = '网络错误';
    return serverData;
  })
}




/*
import http from '@ohos.net.http';
import DeviceBean from './DeviceBean';
//A function whose declared type is neither 'void' nor 'any' must return a value. <tsCheck>华为arkTS
//export function httpRequestGet(url: string): Promise<ResponseResult> {
export default async function getHttpData(): Promise<DeviceBean[]> {
  let dataList: DeviceBean[] = [];
  let httpRequest = http.createHttp();
  let response = httpRequest.request(
    // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
    //"Get https://iotda.cn-north-4.myhuaweicloud.com/v5/iot/{project_id}/products/{product_id}",
    //http://cf78c3332d8344268c19d277901f39fd.apig.cn-north-4.huaweicloudapis.com/api/echo
    "POST,http,//iam.cn-north-4.myhuaweicloud.com/v3/auth/tokens",
      "Content-Type", "application/json;charset=utf-8",
      "X-Auth-Token", "MIIQTgYJKoZIhvcNAQcCoIIQPzCCEDsCAQExDTALBglghkgBZQMEAgEwgg5gBgkqhkiG9w0BBwGggg5RBIIOTXsidG9rZW4iOnsiZXhwaXJlc19hdCI6IjIwMjQtMDMtMjBUMDk6MjM6MDcuNDUwMDAwWiIsIm1ldGhvZHMiOlsicGFzc3dvcmQiXSwiY2F0YWxvZyI6W10sInJvbGVzIjpbeyJuYW1lIjoidGVfYWRtaW4iLCJpZCI6IjAifSx7Im5hbWUiOiJ0ZV9hZ2VuY3kiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9jc2JzX3JlcF9hY2NlbGVyYXRpb24iLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3NfZGlza0FjYyIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2Rzc19tb250aCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX29ic19kZWVwX2FyY2hpdmUiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9hX2NuLXNvdXRoLTRjIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfZGVjX21vbnRoX3VzZXIiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9pbnRsX29hIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfY2JyX3NlbGxvdXQiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9mbG93X2NhIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfZWNzX29sZF9yZW91cmNlIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfcGFuZ3UiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF93ZWxpbmticmlkZ2VfZW5kcG9pbnRfYnV5IiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfY2JyX2ZpbGUiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9sYXJnZV9tb2RlbHMiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9kbXMtcm9ja2V0bXE1LWJhc2ljIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfZG1zLWthZmthMyIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2RhdGFhcnRzX21pZ3JhdGlvbl9jbHVzdGVyIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfc250OWJpbmwiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9jb2NfY2EiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lZGdlc2VjX29idCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2tvb2RyaXZlIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfb2JzX2RlY19tb250aCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2NzYnNfcmVzdG9yZSIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2lkbWVfbWJtX2ZvdW5kYXRpb24iLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3NfYzZhIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfRUNfT0JUIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfa29vcGhvbmUiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9tdWx0aV9iaW5kIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfc21uX2NhbGxub3RpZnkiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9hX2FwLXNvdXRoZWFzdC0zZCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX3JnYyIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2NzYnNfcHJvZ3Jlc3NiYXIiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9jZXNfcmVzb3VyY2Vncm91cF90YWciLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3Nfb2ZmbGluZV9hYzciLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9ldnNfcmV0eXBlIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfa29vbWFwIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfZXZzX2Vzc2QyIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfZG1zLWFtcXAtYmFzaWMiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9ldnNfcG9vbF9jYSIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2FfY24tc291dGh3ZXN0LTJiIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfaHdjcGgiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3Nfb2ZmbGluZV9kaXNrXzQiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9od2RldiIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX29wX2dhdGVkX2NiaF92b2x1bWUiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9zbW5fd2VsaW5rcmVkIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfY2NlX2F1dG9waWxvdCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2RhdGFhcnRzaW5zaWdodCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2h2X3ZlbmRvciIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX3Byb19jYSIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2FfY24tbm9ydGgtNGUiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF93YWZfY21jIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfYV9jbi1ub3J0aC00ZCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2Vjc19oZWNzX3giLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3NfYWM3IiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfZXBzIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfY3Nic19yZXN0b3JlX2FsbCIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2FfY24tbm9ydGgtNGYiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9vY3RvcHVzIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfb3BfZ2F0ZWRfcm91bmR0YWJsZSIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2V2c19leHQiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9hX2FwLXNvdXRoZWFzdC0xZSIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2FfcnUtbW9zY293LTFiIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfYV9hcC1zb3V0aGVhc3QtMWQiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9hcHBzdGFnZSIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2FfYXAtc291dGhlYXN0LTFmIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfc21uX2FwcGxpY2F0aW9uIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfYWllZGdlX2FsZ29yaXRobV9wYWNrYWdlIiwiaWQiOiIwIn0seyJuYW1lIjoib3BfZ2F0ZWRfY3NlX2dhdGV3YXkiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9FQy1PQlQiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9yZHNfY2EiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3NfZ3B1X2c1ciIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX29wX2dhdGVkX21lc3NhZ2VvdmVyNWciLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9lY3NfcmkiLCJpZCI6IjAifSx7Im5hbWUiOiJvcF9nYXRlZF9hX3J1LW5vcnRod2VzdC0yYyIsImlkIjoiMCJ9LHsibmFtZSI6Im9wX2dhdGVkX2llZl9wbGF0aW51bSIsImlkIjoiMCJ9XSwicHJvamVjdCI6eyJkb21haW4iOnsibmFtZSI6InNjdWpva2VyIiwiaWQiOiJjMjllNjRjNjgxNDU0YTFjOGNlYmNkZGUxNWZkNGQ2OSJ9LCJuYW1lIjoiY24tbm9ydGgtNCIsImlkIjoiODBiY2EyZWI0MzcyNDI1YmJmYTU0MGJiZjRkYzQyZGIifSwiaXNzdWVkX2F0IjoiMjAyNC0wMy0xOVQwOToyMzowNy40NTAwMDBaIiwidXNlciI6eyJkb21haW4iOnsibmFtZSI6InNjdWpva2VyIiwiaWQiOiJjMjllNjRjNjgxNDU0YTFjOGNlYmNkZGUxNWZkNGQ2OSJ9LCJuYW1lIjoidXNlcjEiLCJwYXNzd29yZF9leHBpcmVzX2F0IjoiIiwiaWQiOiIyMTg1Yjc2YWE3MDI0YjNmODIyN2NiYjdjYTgyMzU1YyJ9fX0xggHBMIIBvQIBATCBlzCBiTELMAkGA1UEBhMCQ04xEjAQBgNVBAgMCUd1YW5nRG9uZzERMA8GA1UEBwwIU2hlblpoZW4xLjAsBgNVBAoMJUh1YXdlaSBTb2Z0d2FyZSBUZWNobm9sb2dpZXMgQ28uLCBMdGQxDjAMBgNVBAsMBUNsb3VkMRMwEQYDVQQDDApjYS5pYW0ucGtpAgkA3LMrXRBhahAwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAGnJ7w4EohCSVt2YHmLwSmc+r8JtilPpmBKCfiYNRxJf2qWksACPSAf-K3Ffq4hcWeWaxs4JGbJjSHu5M3AA-FmhX9WkjVLznYPrrJAQNpxtnB9OSJIive3CZgaaOY8F2GzrhE1V+upAxPalJBohhKPJVuq9dBFoj+df1H28DJp-DgfMc-1OCqon96QYLaebiBhCJDt9xZyUcm9NW5xJZ8dnoMkoUbvIbCtqRiufcRXxAjKmwVXBJCiis+IblKGJp8VBnF+qjaytPfhMJG9zqMwPoJy3tBRGXsAqYvKj7NIrjydLv1nBu0uwzCZI93-Ux08QVSXfroUothq6hP925o=",

    {
      "name" : "Thermometer",
      "device_type" : "Thermometer",
      "protocol_type" : "MQTT",
      "data_format" : "binary",
      "manufacturer_name" : "ABC",
      "industry" : "smartCity",
      "description" : "this is a thermometer produced by Huawei",
      "service_capabilities" : [ {
        "service_type" : "temperature",
        "service_id" : "temperature",
        "description" : "temperature",
        "properties" : [ {
          "unit" : "centigrade",
          "min" : "1",
          "method" : "R",
          "max" : "100",
          "data_type" : "decimal",
          "description" : "force",
          "step" : 0.1,
          "enum_list" : [ "string" ],
          "required" : true,
          "property_name" : "temperature",
          "max_length" : 100
        } ],
        "commands" : [ {
          "command_name" : "reboot",
          "responses" : [ {
            "response_name" : "ACK",
            "paras" : [ {
              "unit" : "km/h",
              "min" : "1",
              "max" : "100",
              "para_name" : "force",
              "data_type" : "string",
              "description" : "force",
              "step" : 0.1,
              "enum_list" : [ "string" ],
              "required" : false,
              "max_length" : 100
            } ]
          } ],
          "paras" : [ {
            "unit" : "km/h",
            "min" : "1",
            "max" : "100",
            "para_name" : "force",
            "data_type" : "string",
            "description" : "force",
            "step" : 0.1,
            "enum_list" : [ "string" ],
            "required" : false,
            "max_length" : 100
          } ]
        } ],
        "option" : "Mandatory"
      } ],
      "app_id" : "jeQDJQZltU8iKgFFoW060F5SGZka"
    })
}

/*
import http from '@ohos.net.http';
import DeviceBean from './DeviceBean';

export default async function getHttpData(): Promise<DeviceBean[]> {
  let dataList: DeviceBean[] = []
  let httpRequest = http.createHttp();
  let response = httpRequest.request(
    // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
    //"Get https://iotda.cn-north-4.myhuaweicloud.com/v5/iot/{project_id}/products/{product_id}",
    //http://cf78c3332d8344268c19d277901f39fd.apig.cn-north-4.huaweicloudapis.com/api/echo
    "POST https://iam.cn-north-4.myhuaweicloud.com/v3/auth/tokens ",
    {
      method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
      // 开发者根据自身业务需要添加header字段
      header: {'Content-Type': 'application/json;charset=utf8'},
      extraData:{
        "auth": {
          "identity": {
            "methods": [
              "password"
            ],
            "password": {
              "user": {
                "name": "hw018648675",
                "password": "wyq2867408613!@",
                "domain": {
                  "name": "hw018648675"
                }
              }
            }
          },
          "scope": {
            "project": {
              "name": "cn-north-4"
            }
          }
        }
      },
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
    }
  );
  // 使用await和async，等待请求完成处理数据后返回
  await response.then((data) => {
    if (data.responseCode == 200) {
      // 处理返回结果
      const response = data.result + "";
      const res = JSON.parse(response).data
      for (let i = 0; i < res.length; i++) {
        let item = res[i];
        dataList.push(new DeviceBean(
          item.deviceId,
          item.name,
          item.temperator,
          item.humidity,
          item.lumination,
          item.isRain,
          item.isSmoke,
          item.isFire,
          item.doorStatus,
          item.garageStatus,
          item.curtainStatus,
          item.lightStatus
        ));

      }
    } else {
      // todo 请求失败，进行失败逻辑处理
    }
  }).catch((err) => {
    // todo 请求失败，进行失败逻辑处理
    console.info('error:' + JSON.stringify(err));
  })
  return dataList;
}
*/