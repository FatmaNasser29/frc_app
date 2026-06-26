import 'package:localization/localization.dart';

class FailureLocalizer {
  const FailureLocalizer._();

  static String localize(AppLocalizations l10n, String? message) {
    if (message == null || message.isEmpty) {
      return l10n.somethingWentWrong;
    }

    return switch (message) {
      'Connection timeout' => l10n.connectionTimeout,
      'Send timeout' => l10n.sendTimeout,
      'Receive timeout' => l10n.receiveTimeout,
      'Bad certificate' => l10n.badCertificate,
      'Request cancelled' => l10n.requestCancelled,
      'No internet connection' => l10n.noInternetConnection,
      'Unexpected error occurred' => l10n.unexpectedError,
      'Something went wrong' => l10n.somethingWentWrong,
      'Too many requests. Please try again later.' => l10n.tooManyRequests,
      'Internal server error' => l10n.internalServerError,
      _ => message,
    };
  }
}
