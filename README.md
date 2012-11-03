A keycounter, made to record one-dimensional data of computer usage for the purpose of visualization and analysis.

## Use it with

![](http://macwright.org/graphics/minute_new.png)

[minute](https://github.com/tmcw/minute) is the original - it uses
[d3js](http://d3js.org/) to render minute output in-browser with some interactivity.

![](http://farm9.staticflickr.com/8045/8122970298_240635ef10_c.jpg)

[Sleep Chart](https://gist.github.com/3955066) calculates hours of sleep
based on keystroke gaps. Depressing, right?

![](http://farm9.staticflickr.com/8467/8123037480_a3c6af9f04_z.jpg)

[basically.js](https://gist.github.com/3955198) is a non-interactive but
faster minute visualization based on [node-canvas](https://github.com/LearnBoost/node-canvas).

## How to Use it

Download the binary (see below), and run it. It'll record keystrokes at `~/Documents/minute/keystrokes.log` in a
CSV document. In order for this to work, you need to enable access for assistive devices:

![](http://farm9.staticflickr.com/8184/8141535663_8c690914d1_z.jpg)

## Developers

You can compile from source here, but you probably want to just [download a pre-built binary](https://github.com/tmcw/minute-agent/downloads)
to get this working.

## What it Does, Technically

It fills in a log at `~/Documents/minute/keystrokes.log` with
the number of keystrokes you make every minute.

All it does is count keystrokes. Unlike a keylogger,
it doesn't steal your money, or do anything amusing that gains
national attention. If you don't trust me,
read the horribly constructed Objective-C yourself, or
don't use it.

It requires the Accessibility API to enabled,
or for you to trust the application.
