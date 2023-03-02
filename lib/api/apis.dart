import 'package:tygithub/net/net_config.dart';
class TYApi {
  // static const String oauthUrl = '${TYNetConfig.baseUrl}'
  //     '${TYNetConfig.oauthPath}'
  //     '?client_id'
  //     '=${TYClientConfig.CLIENT_ID}&state=app&'
  //     'scope=user,repo,gist,notifications,read:org,workflow&'
  //     'redirect_uri=tygithubapp://authed';

  static const String loginUrl = '/login/oauth/access_token';
  
    ///用户收到的事件信息 get
  static getEventReceived(userName) {
    return "${TYNetConfig.apiUrl}/users/$userName/received_events";
  }

  ///用户相关的事件信息 get
  static getEvent(userName) {
    return "${TYNetConfig.apiUrl}/users/$userName/events";
  }
}
