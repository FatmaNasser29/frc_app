import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_local_data_source.dart';
import 'package:frc_app/core/di/injection.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SocialAuthWebViewPage extends StatefulWidget {
  final String authUrl;
  final String title;

  const SocialAuthWebViewPage({
    super.key,
    required this.authUrl,
    required this.title,
  });

  @override
  State<SocialAuthWebViewPage> createState() => _SocialAuthWebViewPageState();
}

class _SocialAuthWebViewPageState extends State<SocialAuthWebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() {
                _progress = progress / 100.0;
              });
            }
          },
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
            _checkAndExtractCookies(url);
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
            _checkAndExtractCookies(url);
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.authUrl));
  }

  Future<void> _checkAndExtractCookies(String url) async {
    if (url.startsWith('https://fashionretailclub.com')) {
      try {
        final rawCookies = await _controller.runJavaScriptReturningResult('document.cookie') as String;
        final cleanCookies = rawCookies.replaceAll('"', '').trim();
        final cookieList = cleanCookies.split(';');
        
        String? accessToken;
        String? refreshToken;

        for (final cookie in cookieList) {
          final parts = cookie.split('=');
          if (parts.length >= 2) {
            final key = parts[0].trim();
            final value = parts.sublist(1).join('=').trim();
            if (key == 'access_token') {
              accessToken = value;
            } else if (key == 'refresh_token') {
              refreshToken = value;
            }
          }
        }

        if (accessToken != null && refreshToken != null) {
          final localDS = getIt<SigninLocalDataSource>();
          await localDS.saveAccessToken(accessToken);
          await localDS.saveRefreshToken(refreshToken);

          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.home,
              (route) => false,
            );
          }
        }
      } catch (e) {
        debugPrint('Error extracting cookies: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: context.textStyle.textStyle16.copyWith(
            color: context.colors.assentsBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: context.colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: context.colors.assentsPurple,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            LinearProgressIndicator(
              value: _progress > 0 ? _progress : null,
              backgroundColor: context.colors.backgroundSecondary.withValues(alpha: .2),
              valueColor: AlwaysStoppedAnimation<Color>(context.colors.assentsPurple),
            ),
        ],
      ),
    );
  }
}
