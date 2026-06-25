import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';

class ResendOtpButton extends StatefulWidget {
  final VoidCallback onResend;

  const ResendOtpButton({super.key, required this.onResend});

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  int secondsRemaining = 40;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      secondsRemaining = 40;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining <= 1) {
        timer.cancel();

        setState(() {
          secondsRemaining = 0;
        });
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TextButton(
      onPressed: secondsRemaining == 0
          ? () {
              widget.onResend();
              startTimer();
            }
          : null,
      child: Text(
        secondsRemaining == 0
            ? l10n.resend
            : l10n.resendCountdownText(secondsRemaining),
      ),
    );
  }
}
