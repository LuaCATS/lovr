---@meta

---The `lovr.event` module handles events from the operating system.
---
---Due to its low-level nature, it's rare to use `lovr.event` in simple projects.
---
---@class lovr.event
lovr.event = {}

---Clears the event queue, removing any unprocessed events.
---
function lovr.event.clear() end

---This function returns a Lua iterator for all of the unprocessed items in the event queue.  Each event consists of a name as a string, followed by event-specific arguments.  This function is called in the default implementation of `lovr.run`, so it is normally not necessary to poll for events yourself.
---
---@return function iterator The iterator function, usable in a for loop.
function lovr.event.poll() end

---Pushes an event onto the event queue.  It will be processed the next time `lovr.event.poll` is called.  For an event to be processed properly, there needs to be a function in the `lovr.handlers` table with a key that's the same as the event name.
---
---#### Notes:
---
---Only nil, booleans, numbers, strings, and LÖVR objects are supported types for event data.
---
---@param name string The name of the event.
---@param ... any The arguments for the event.  Currently, up to 4 are supported.
function lovr.event.push(name, ...) end

---Pushes an event to quit.  An optional number can be passed to set the exit code for the application.  An exit code of zero indicates normal termination, whereas a nonzero exit code indicates that an error occurred.
---
---#### Notes:
---
---This function is equivalent to calling `lovr.event.push('quit', <args>)`.
---
---The event won't be processed until the next time `lovr.event.poll` is called.
---
---The `lovr.quit` callback will be called when the event is processed, which can be used to do any cleanup work.  The callback can also return `false` to abort the quitting process.
---
---@param code? number The exit code of the program.
function lovr.event.quit(code) end

---Pushes an event to restart the framework.
---
---#### Notes:
---
---The event won't be processed until the next time `lovr.event.poll` is called.
---
---The `lovr.restart` callback can be used to persist a value between restarts.
---
function lovr.event.restart() end

---This enum is used to distinguish whether a display is the headset display or the desktop window.
---@alias DisplayType
---The headset.
---| "headset"
---The desktop window.
---| "window"

---Keys that can be pressed on a keyboard.  Notably, numpad keys are missing right now.
---@alias KeyCode
---The A key.
---| "a"
---The B key.
---| "b"
---The C key.
---| "c"
---The D key.
---| "d"
---The E key.
---| "e"
---The F key.
---| "f"
---The G key.
---| "g"
---The H key.
---| "h"
---The I key.
---| "i"
---The J key.
---| "j"
---The K key.
---| "k"
---The L key.
---| "l"
---The M key.
---| "m"
---The N key.
---| "n"
---The O key.
---| "o"
---The P key.
---| "p"
---The Q key.
---| "q"
---The R key.
---| "r"
---The S key.
---| "s"
---The T key.
---| "t"
---The U key.
---| "u"
---The V key.
---| "v"
---The W key.
---| "w"
---The X key.
---| "x"
---The Y key.
---| "y"
---The Z key.
---| "z"
---The 0 key.
---| "0"
---The 1 key.
---| "1"
---The 2 key.
---| "2"
---The 3 key.
---| "3"
---The 4 key.
---| "4"
---The 5 key.
---| "5"
---The 6 key.
---| "6"
---The 7 key.
---| "7"
---The 8 key.
---| "8"
---The 9 key.
---| "9"
---The space bar.
---| "space"
---The enter key.
---| "return"
---The tab key.
---| "tab"
---The escape key.
---| "escape"
---The backspace key.
---| "backspace"
---The up arrow key.
---| "up"
---The down arrow key.
---| "down"
---The left arrow key.
---| "left"
---The right arrow key.
---| "right"
---The home key.
---| "home"
---The end key.
---| "end"
---The page up key.
---| "pageup"
---The page down key.
---| "pagedown"
---The insert key.
---| "insert"
---The delete key.
---| "delete"
---The F1 key.
---| "f1"
---The F2 key.
---| "f2"
---The F3 key.
---| "f3"
---The F4 key.
---| "f4"
---The F5 key.
---| "f5"
---The F6 key.
---| "f6"
---The F7 key.
---| "f7"
---The F8 key.
---| "f8"
---The F9 key.
---| "f9"
---The F10 key.
---| "f10"
---The F11 key.
---| "f11"
---The F12 key.
---| "f12"
---The backtick/backquote/grave accent key.
---| "`"
---The dash/hyphen/minus key.
---| "-"
---The equal sign key.
---| "="
---The left bracket key.
---| "["
---The right bracket key.
---| "]"
---The backslash key.
---| "\"
---The semicolon key.
---| ";"
---The single quote key.
---| "'"
---The comma key.
---| ","
---The period key.
---| "."
---The slash key.
---| "/"
---The 0 numpad key.
---| "kp0"
---The 1 numpad key.
---| "kp1"
---The 2 numpad key.
---| "kp2"
---The 3 numpad key.
---| "kp3"
---The 4 numpad key.
---| "kp4"
---The 5 numpad key.
---| "kp5"
---The 6 numpad key.
---| "kp6"
---The 7 numpad key.
---| "kp7"
---The 8 numpad key.
---| "kp8"
---The 9 numpad key.
---| "kp9"
---The . numpad key.
---| "kp."
---The / numpad key.
---| "kp/"
---The * numpad key.
---| "kp*"
---The - numpad key.
---| "kp-"
---The + numpad key.
---| "kp+"
---The enter numpad key.
---| "kpenter"
---The equals numpad key.
---| "kp="
---The left control key.
---| "lctrl"
---The left shift key.
---| "lshift"
---The left alt key.
---| "lalt"
---The left OS key (windows, command, super).
---| "lgui"
---The right control key.
---| "rctrl"
---The right shift key.
---| "rshift"
---The right alt key.
---| "ralt"
---The right OS key (windows, command, super).
---| "rgui"
---The caps lock key.
---| "capslock"
---The scroll lock key.
---| "scrolllock"
---The numlock key.
---| "numlock"
