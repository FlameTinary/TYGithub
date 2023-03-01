import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TYAuthPage extends StatefulWidget {
  final String authUrl;

  TYAuthPage({required this.authUrl});

  @override
  _TYAuthPageState createState() => _TYAuthPageState();
}

class _TYAuthPageState extends State<TYAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Auth'),
      ),
      body: WebView(
        initialUrl: widget.authUrl,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (navigation) async {
          if (navigation.url.startsWith('tygithubapp://authed')) {
            final code = navigation.url.split('code=')[1];
            print('code = $code');
            Navigator.pop(context, {'code': code});
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onWebResourceError: (error) {
          debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
          ''');
        },
      ),
    );
  }
}
