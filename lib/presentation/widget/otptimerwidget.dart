import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpTimerWidget extends StatefulWidget {
  @override
  _OtpTimerWidgetState createState() => _OtpTimerWidgetState();
}

class _OtpTimerWidgetState extends State<OtpTimerWidget> {
  int _secondsRemaining = 120;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "00:${_secondsRemaining.toString().padLeft(2, '0')} Sec";

    return Text(
      formattedTime,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black54,
      ),
    );
  }
}
