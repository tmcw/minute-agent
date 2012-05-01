# minute-agent

You can compile from source here, but you probably want to just [download a pre-built binary](https://github.com/tmcw/minute-agent/downloads)
to get this working.

This is intended to work in conjunction with [minute](https://github.com/tmcw/minute),
an example visualization that I built, or with a visualization of your
choice that reads its simple CSV file format.

It's a keycounter that you install on your OSX
computer. It fills in a log at `~/Documents/minute/keystrokes.log` with
the number of keystrokes you make every minute.

All it does is count keystrokes. Unlike a keylogger,
it doesn't steal your money, or do anything amusing that gains
national attention. If you don't trust me,
read the horribly constructed Objective-C yourself, or
don't use it.

It requires the Accessibility API to enabled,
or for you to trust the application.
