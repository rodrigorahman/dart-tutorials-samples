// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:async';

DivElement output = querySelector('#output');
PreElement pre = PreElement();

Future printDailyNewsDigest() async {
  String news = await gatherNewsReports();
  pre.appendText(news);
}

void main() {
  output.append(pre);

  printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}

void printWinningLotteryNumbers() {
  pre.appendText('Winning lotto numbers: [23, 63, 87, 26, 2]\n');
}

void printWeatherForecast() {
  pre.appendText('Tomorrow\'s forecast: 70F, sunny.\n');
}

void printBaseballScore() {
  pre.appendText('Baseball score: Red Sox 10, Yankees 0\n');
}

// Imagine that this function is more complex and slow. :)
Future gatherNewsReports() async {
  String path = 'https://dart.dev/f/dailyNewsDigest.txt';
  return (await HttpRequest.getString(path));
}
