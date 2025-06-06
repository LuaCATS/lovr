---@meta

---The `lovr.system` provides information about the current platform and hardware.
---
---It also interfaces with the desktop window and window input.
---
---@class lovr.system
lovr.system = {}

---Returns the clipboard text.
---
---@return string text The clipboard text (may be nil).
function lovr.system.getClipboardText() end

---Returns the number of logical cores on the system.
---
---@return number cores The number of logical cores on the system.
function lovr.system.getCoreCount() end

---Returns the position of the mouse.
---
---@return number x The x position of the mouse, relative to the top-left of the window.
---@return number y The y position of the mouse, relative to the top-left of the window.
function lovr.system.getMousePosition() end

---Returns the x position of the mouse.
---
---@return number x The x position of the mouse, relative to the top-left of the window.
function lovr.system.getMouseX() end

---Returns the y position of the mouse.
---
---@return number y The y position of the mouse, relative to the top-left of the window.
function lovr.system.getMouseY() end

---Returns the current operating system.
---
---@return string os Either "Windows", "macOS", "Linux", "Android" or "Web".
function lovr.system.getOS() end

---Returns the window pixel density.  High DPI windows will usually return 2.0 to indicate that there are 2 pixels for every window coordinate in each axis.  On a normal display, 1.0 is returned, indicating that window coordinates match up with pixels 1:1.
---
---@return number density The pixel density of the window.
function lovr.system.getWindowDensity() end

---Returns the dimensions of the desktop window.
---
---#### Notes:
---
---If the window is not open, this will return zeros.
---
---@return number width The width of the desktop window.
---@return number height The height of the desktop window.
function lovr.system.getWindowDimensions() end

---Returns the height of the desktop window.
---
---#### Notes:
---
---If the window is not open, this will return zero.
---
---@return number width The height of the desktop window.
function lovr.system.getWindowHeight() end

---Returns the width of the desktop window.
---
---#### Notes:
---
---If the window is not open, this will return zero.
---
---@return number width The width of the desktop window.
function lovr.system.getWindowWidth() end

---Returns whether key repeat is enabled.
---
---#### Notes:
---
---Key repeat is disabled by default.
---
---@return boolean enabled Whether key repeat is enabled.
function lovr.system.hasKeyRepeat() end

---Returns whether a key on the keyboard is pressed.
---
---@param ... KeyCode The set of keys to check.
---@return boolean down Whether any of the keys are currently pressed.
function lovr.system.isKeyDown(...) end

---Returns whether a mouse button is currently pressed.
---
---@param button number The index of a button to check.  Use 1 for the primary mouse button, 2 for the secondary button, and 3 for the middle button.  Other indices can be used, but are hardware-specific.
---@return boolean down Whether the mouse button is currently down.
function lovr.system.isMouseDown(button) end

---Returns whether the desktop window is focused.
---
---@return boolean focused Whether the desktop window is focused.
function lovr.system.isWindowFocused() end

---Returns whether the desktop window is open.  `t.window` can be set to `nil` in `lovr.conf` to disable automatic opening of the window.  In this case, the window can be opened manually using `lovr.system.openWindow`.
---
---@return boolean open Whether the desktop window is open.
function lovr.system.isWindowOpen() end

---Returns whether the desktop window is visible (open and not minimized).
---
---@return boolean visible Whether the desktop window is visible.
function lovr.system.isWindowVisible() end

---Opens the desktop window.  If the window is already open, this function does nothing.
---
---#### Notes:
---
---By default, the window is opened automatically, but this can be disabled by setting `t.window` to `nil` in `conf.lua`.
---
---@param options {width: number, height: number, fullscreen: boolean, resizable: boolean, title: string, icon: string} Window options.
function lovr.system.openWindow(options) end

---Fills the event queue with unprocessed events from the operating system.  This function should be called often, otherwise the operating system will consider the application unresponsive. This function is called in the default implementation of `lovr.run`, and the events are later processed by `lovr.event.poll`.
---
function lovr.system.pollEvents() end

---Requests permission to use a feature.  Usually this will pop up a dialog box that the user needs to confirm.  Once the permission request has been acknowledged, the `lovr.permission` callback will be called with the result.  Currently, this is only used for requesting microphone access on Android devices.
---
---@param permission Permission The permission to request.
function lovr.system.requestPermission(permission) end

---Sets the clipboard text.
---
---@param text string The string to set as the clipboard text.
function lovr.system.setClipboardText(text) end

---Enables or disables key repeat.  Key repeat affects whether `lovr.keypressed` will be fired multiple times while a key is held down.  The `repeat` parameter of the callback can be used to detect whether a key press comes from a "repeat" or not.
---
---#### Notes:
---
---Key repeat is disabled by default.  `lovr.textinput` is not affected by key repeat.
---
---@param enable boolean Whether key repeat should be enabled.
function lovr.system.setKeyRepeat(enable) end

---Returns whether a key on the keyboard was pressed this frame.
---
---#### Notes:
---
---Technically this returns whether the key was pressed between the last 2 calls to `lovr.system.pollEvents`, but that function is called automatically at the beginning of each frame in `lovr.run`, so it all works out!
---
---@param ... KeyCode The set of keys to check.
---@return boolean pressed Whether any of the specified keys were pressed this frame.
function lovr.system.wasKeyPressed(...) end

---Returns whether a key on the keyboard was released this frame.
---
---#### Notes:
---
---Technically this returns whether the key was released between the last 2 calls to `lovr.system.pollEvents`, but that function is called automatically at the beginning of each frame in `lovr.run`, so it all works out!
---
---@param ... KeyCode The set of keys to check.
---@return boolean released Whether any of the specified keys were released this frame.
function lovr.system.wasKeyReleased(...) end

---Returns whether a button on the mouse was pressed this frame.
---
---#### Notes:
---
---Technically this returns whether the button was pressed between the last 2 calls to `lovr.system.pollEvents`, but that function is called automatically at the beginning of each frame in `lovr.run`, so it all works out!
---
---@param button number The index of a button to check.  Use 1 for the primary mouse button, 2 for the secondary button, and 3 for the middle button.  Other indices can be used, but are hardware-specific.
---@return boolean pressed Whether the mouse button was pressed this frame.
function lovr.system.wasMousePressed(button) end

---Returns whether a button on the mouse was released this frame.
---
---#### Notes:
---
---Technically this returns whether the button was released between the last 2 calls to `lovr.system.pollEvents`, but that function is called automatically at the beginning of each frame in `lovr.run`, so it all works out!
---
---@param button number The index of a button to check.  Use 1 for the primary mouse button, 2 for the secondary button, and 3 for the middle button.  Other indices can be used, but are hardware-specific.
---@return boolean released Whether the mouse button was released this frame.
function lovr.system.wasMouseReleased(button) end

---These are the different permissions that need to be requested using `lovr.system.requestPermission` on some platforms.
---@alias Permission
---Requests microphone access.
---| "audiocapture"
