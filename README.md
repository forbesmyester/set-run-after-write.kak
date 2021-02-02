# set-run-after-write.kak

## Usage

This plugin defines three commands:

 * `set-run-after-write` - Takes one parameter which is the command to run, which will be executed, with a new line appended when saved.
 * `unset-run-after-write` - Stops saving executing the command sent to `set-run-after-write`
 * `repl-send-newline` - Just send a new line to the REPL

## Rationale

I like to run tests etc after saving a file.

The Kakoune REPL can send text, but it:

* Is on demand with by running a command
* Does not send a newline character at the end.

These are sensible choices as we can wrap the command, as I have done here and if it appended a new line, it would not be possible to not send the new line.
