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

  // 获取repo的branches
  static getBranches(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/branches";
  }

  // 获取repo的tags
  static getTags(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/tags";
  }

  // 获取repo的commits
  static getCommits(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/commits";
  }

  // 获取repo的events
  static getRepoEvents(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/events";
  }

  // 获取repo的contributors
  static getContributors(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/contributors";
  }

  // 获取repo的readme
  static getReadme(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/readme";
  }

  // 获取repo的releases
  static getReleases(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/releases";
  }

  // 获取repo的issues
  static getIssues(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/issues";
  }

  // 获取repo的pulls
  static getPulls(userName, repoName) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/pulls";
  }

  // 获取repo的pulls
  static getPullsCommits(userName, repoName, number) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/pulls/$number/commits";
  }

  // 获取repo的pulls
  static getPullsFiles(userName, repoName, number) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/pulls/$number/files";
  }

  // 获取repo在master分支的文件内容
  static getFileContent(userName, repoName, path) {
    return "${TYNetConfig.apiUrl}/repos/$userName/$repoName/contents/$path";
  }

}
