import prompt from '@ohos.prompt';
import { CommonConstant as Const } from '../common/constant/CommonConstant';
import { httpRequestGet } from '../common/utils/HttpUtil';
import Logger from '../common/utils/Logger';

export class NewsViewModel {
  ....

  // 获取服务端新闻数据列表
  getNewsList(currentPage: number, pageSize: number, path: string): Promise<NewsData[]> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Const.SERVER}/${path}`;
      url += '?currentPage=' + currentPage + '&pageSize=' + pageSize;
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getNewsList failed', JSON.stringify(data));
          reject(Const.TabBars_DEFAULT_NEWS_TYPES)
        }
      })
        .catch((err: Error) => {
          Logger.error('getNewsList failed', JSON.stringify(err));
          reject(Const.TabBars_DEFAULT_NEWS_TYPES)
        });
    });
  }
}

...

export class ResponseResult {
  code: string
  msg: ResourceStr
  data: string | Object | ArrayBuffer

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}

export class NewsData {
  title: string = ''
  content: string = ''
  imagesUrl: Array<NewsFile> = [];
  source: string = ''
}

export class NewsFile {
  id: number = 0
  url: string = ''
  type: number = 0
  newId: number = 0
}
