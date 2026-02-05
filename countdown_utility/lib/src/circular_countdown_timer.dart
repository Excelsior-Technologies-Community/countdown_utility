import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

enum TimeFormat {
  hh_mm_ss,
}

class CircularCountdownTimer extends StatefulWidget {
  final int hours;
  final int minutes;
  final int seconds;

  final double size;
  final double strokeWidth;

  final Color normalColor;
  final Color lowTimeColor;
  final int lowTimeInSeconds;

  final TimeFormat timeFormat;
  final VoidCallback? onComplete;

  const CircularCountdownTimer({
    Key? key,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 10,
    this.size = 200,
    this.strokeWidth = 8,
    this.normalColor = Colors.blue,
    this.lowTimeColor = Colors.red,
    this.lowTimeInSeconds = 5,
    this.timeFormat = TimeFormat.hh_mm_ss,
    this.onComplete,
  }) : super(key: key);

  @override
  State<CircularCountdownTimer> createState() =>
      _CircularCountdownTimerState();
}

class _CircularCountdownTimerState extends State<CircularCountdownTimer> {
  Timer? _timer;
  late int _totalSeconds;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _totalSeconds =
        widget.hours * 3600 + widget.minutes * 60 + widget.seconds;
    _remainingSeconds = _totalSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() => _remainingSeconds = 0);
        widget.onComplete?.call();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final h = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final m =
    ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
    _totalSeconds == 0 ? 0.0 : _remainingSeconds / _totalSeconds;

    final color = _remainingSeconds <= widget.lowTimeInSeconds
        ? widget.lowTimeColor
        : widget.normalColor;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _CirclePainter(
              progress: progress,
              color: color,
              strokeWidth: widget.strokeWidth,
            ),
          ),
          Text(
            _formatTime(_remainingSeconds),
            style: TextStyle(
              fontSize: widget.size * 0.15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - strokeWidth / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
