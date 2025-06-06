---@meta

---The `lovr.thread` module provides functions for creating threads and communicating between them.
---
---These are operating system level threads, which are different from Lua coroutines.
---
---Threads are useful for performing expensive background computation without affecting the framerate or performance of the main thread.  Some examples of this include asset loading, networking and network requests, and physics simulation.
---
---Threads come with some caveats:
---
---- Threads run in a bare Lua environment.  The `lovr` module (and any of lovr's modules) need to
---  be required before they can be used.
---  - To get `require` to work properly, add `require 'lovr.filesystem'` to the thread code.
---- Threads are completely isolated from other threads.  They do not have access to the variables
---  or functions of other threads, and communication between threads must be coordinated through
---  `Channel` objects.
---- The graphics module (or any functions that perform rendering) cannot be used in a thread.
---  Note that this includes creating graphics objects like Models and Textures.  There are "data"
---  equivalent `ModelData` and `Image` objects that can be used in threads though.
---- `lovr.system.pollEvents` cannot be called from a thread.
---- Crashes or problems can happen if two threads access the same object at the same time, so
---  special care must be taken to coordinate access to objects from multiple threads.
---
---@class lovr.thread
lovr.thread = {}

---Returns a named Channel for communicating between threads.
---
---@param name string The name of the Channel to get.
---@return Channel channel The Channel with the specified name.
function lovr.thread.getChannel(name) end

---Creates a new unnamed `Channel` object.  Usually it's more convenient to use `lovr.thread.getChannel`, since other threads can use that function to query the channel by name.  Unnamed channels don't require a unique name, but they need to be sent to other threads somehow (e.g. on a different Channel or as an argument to `Thread:start`).
---
---@return Channel channel The new Channel.
function lovr.thread.newChannel() end

---Creates a new Thread from Lua code.
---
---#### Notes:
---
---The Thread won\'t start running immediately.  Use `Thread:start` to start it.
---
---The string argument is assumed to be a filename if there isn't a newline in the first 1024 characters.  For really short thread code, an extra newline can be added to trick LÖVR into loading it properly.
---
---@param code string The code to run in the Thread.
---@return Thread thread The new Thread.
function lovr.thread.newThread(code) end

---Creates a new Thread from Lua code.
---
---#### Notes:
---
---The Thread won\'t start running immediately.  Use `Thread:start` to start it.
---
---The string argument is assumed to be a filename if there isn't a newline in the first 1024 characters.  For really short thread code, an extra newline can be added to trick LÖVR into loading it properly.
---
---@param filename string A file containing code to run in the Thread.
---@return Thread thread The new Thread.
function lovr.thread.newThread(filename) end

---Creates a new Thread from Lua code.
---
---#### Notes:
---
---The Thread won\'t start running immediately.  Use `Thread:start` to start it.
---
---The string argument is assumed to be a filename if there isn't a newline in the first 1024 characters.  For really short thread code, an extra newline can be added to trick LÖVR into loading it properly.
---
---@param blob Blob The code to run in the Thread.
---@return Thread thread The new Thread.
function lovr.thread.newThread(blob) end

---A Channel is an object used to communicate between `Thread` objects.  Different threads can send messages on the same Channel to communicate with each other.  Messages can be sent and received on a Channel using `Channel:push` and `Channel:pop`, and are received in a first-in-first-out fashion. The following types of data can be passed through Channels: nil, boolean, number, string, lightuserdata, table, vector, and any LÖVR object.
---@class Channel
local Channel = {}

---Removes all pending messages from the Channel.
---
function Channel:clear() end

---Returns the number of messages in the Channel.
---
---@return number count The number of messages in the Channel.
function Channel:getCount() end

---Returns whether or not the message with the given ID has been read.  Every call to `Channel:push` returns a message ID.
---
---@param id number The ID of the message to check.
---@return boolean read Whether the message has been read.
function Channel:hasRead(id) end

---Returns a message from the Channel without popping it from the queue.  If the Channel is empty, `nil` is returned.  This can be useful to determine if the Channel is empty.
---
---#### Notes:
---
---The second return value can be used to detect if a `nil` message is in the queue.
---
---@return * message The message, or `nil` if there is no message.
---@return boolean present Whether a message was returned (use to detect nil).
function Channel:peek() end

---Pops a message from the Channel.  If the Channel is empty, an optional timeout argument can be used to wait for a message, otherwise `nil` is returned.
---
---#### Notes:
---
---Threads can get stuck forever waiting on Channel messages, so be careful.
---
---@param wait? number How long to wait for a message to be popped, in seconds.  `true` can be used to wait forever and `false` can be used to avoid waiting.
---@return * message The received message, or `nil` if nothing was received.
function Channel:pop(wait) end

---Pushes a message onto the Channel.  The following types of data can be pushed: nil, boolean, number, string, table, lightuserdata, vectors, and userdata (LÖVR objects).
---
---#### Notes:
---
---Threads can get stuck forever waiting on Channel messages, so be careful.
---
---@param message any The message to push.
---@param wait? number How long to wait for the message to be popped, in seconds.  `true` can be used to wait forever and `false` can be used to avoid waiting.
---@return number id The ID of the pushed message.
---@return boolean read Whether the message was read by another thread before the wait timeout.
function Channel:push(message, wait) end

---A Thread is an object that runs a chunk of Lua code in the background.  Threads are completely isolated from other threads, meaning they have their own Lua context and can't access the variables and functions of other threads.  Communication between threads is limited and is accomplished by using `Channel` objects.
---
---To get `require` to work properly, add `require 'lovr.filesystem'` to the thread code.
---@class Thread
local Thread = {}

---Returns the message for the error that occurred on the Thread, or nil if no error has occurred.
---
---@return string error The error message, or `nil` if no error has occurred on the Thread.
function Thread:getError() end

---Returns whether or not the Thread is currently running.
---
---@return boolean running Whether or not the Thread is running.
function Thread:isRunning() end

---Starts the Thread.
---
---#### Notes:
---
---The arguments can be nil, booleans, numbers, strings, or LÖVR objects.
---
---#### Example:
---
---```lua
---function lovr.load()
---  lovr.thread.newThread([[
---    print(...)
---  ]]):start(lovr.getVersion())
---end
---```
---
---@param ... any Up to 4 arguments to pass to the Thread's function.
function Thread:start(...) end

---Waits for the Thread to complete, then returns.
---
function Thread:wait() end
