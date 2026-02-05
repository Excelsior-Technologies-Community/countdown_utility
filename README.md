# countdown_utility

Countdown Utility is a lightweight and reusable Flutter library that provides a beautiful circular countdown timer.

It helps you avoid writing repetitive timer logic and lets you easily display a customizable countdown UI with hours, minutes, and seconds.

-----

## Feature Preview

- Circular countdown timer UI
- Supports Hours : Minutes : Seconds
- User-defined duration
- Custom circle size & stroke width
- Custom colors (normal & low-time)
- Low-time color change (e.g. last 5 seconds)
- Clean Material UI
- Simple and beginner-friendly

--------

## Preview


https://github.com/user-attachments/assets/02010de1-2c7e-46e6-b384-346899e4ba45


--------

## Installation

Add this to your pubspec.yaml:
```
dependencies:
  countdown_utility:
    git:
      url: https://github.com/your-username/countdown_utility.git
```
Then run:
```
flutter pub get

```

-----------

## File Structure
```
countdown_utility/
│
├─ lib/
│   ├─ countdown_utility.dart      # Main library export file
│   │
│   └─ src/
│       └─ circular_countdown_timer.dart   # Circular countdown widget
│
├─ example/
│   └─ main.dart                   # Example usage
│
├─ pubspec.yaml
├─ README.md
└─ LICENSE

```
--------------
## Usage
```
import 'package:flutter/material.dart';
import 'package:countdown_utility/countdown_utility.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircularCountdownTimer(
            hours: 0,
            minutes: 0,
            seconds: 10,
          ),
        ),
      ),
    );
  }
}
```
----------------

## CircularCountdownTimer Properties

| Property           | Type         | Required | Default       | Description                  |
| ------------------ | ------------ | -------- | ------------- | ---------------------------- |
| `hours`            | int          | No       | `0`           | Countdown hours              |
| `minutes`          | int          | No       | `0`           | Countdown minutes            |
| `seconds`          | int          | No       | `10`          | Countdown seconds            |
| `size`             | double       | No       | `200`         | Circle size                  |
| `strokeWidth`      | double       | No       | `8`           | Circle border thickness      |
| `normalColor`      | Color        | No       | `Colors.blue` | Default progress color       |
| `lowTimeColor`     | Color        | No       | `Colors.red`  | Color when time is low       |
| `lowTimeInSeconds` | int          | No       | `5`           | Threshold for low-time color |
| `onComplete`       | VoidCallback | No       | `null`        | Callback when timer finishes |

----------------

## How Countdown Works
```
totalSeconds = hours * 3600 + minutes * 60 + seconds;
```
-------------------------
## MIT License
```
Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this Countdown Utility library and associated documentation files
(the “Software”), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
