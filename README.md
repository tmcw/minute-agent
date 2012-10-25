A keycounter, made to record one-dimensional data of computer usage for the purpose of visualization and analysis.

## Use it with

* [minute](https://github.com/tmcw/minute)
* [Sleep Chart](https://gist.github.com/3955066)

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