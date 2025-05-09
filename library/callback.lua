---@meta

---The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special file that's loaded before the rest of the framework initializes.
---
---#### Notes:
---
---Disabling unused modules can improve startup time.
---
---`t.window` can be set to nil to avoid creating the window.  The window can later be opened manually using `lovr.system.openWindow`.
---
---Enabling the `t.graphics.debug` flag will add additional error checks and will send messages from the GPU driver to the `lovr.log` callback.  This will decrease performance but can help provide information on performance problems or other bugs.  It will also cause `lovr.graphics.newShader` to embed debugging information in shaders which allows inspecting variables and stepping through shaders line-by-line in tools like RenderDoc.
---
---`t.graphics.debug` can also be enabled using the `--graphics-debug` command line option.
---
---#### Example:
---
---A noop conf.lua that sets all configuration settings to their defaults:
---
---```lua
---function lovr.conf(t)
---
---  -- Set the project version and identity
---  t.version = '0.18.0'
---  t.identity = 'default'
---
---  -- Set save directory precedence
---  t.saveprecedence = true
---
---  -- Enable or disable different modules
---  t.modules.audio = true
---  t.modules.data = true
---  t.modules.event = true
---  t.modules.graphics = true
---  t.modules.headset = true
---  t.modules.math = true
---  t.modules.physics = true
---  t.modules.system = true
---  t.modules.thread = true
---  t.modules.timer = true
---
---  -- Audio
---  t.audio.spatializer = nil
---  t.audio.samplerate = 48000
---  t.audio.start = true
---
---  -- Graphics
---  t.graphics.debug = false
---  t.graphics.vsync = true
---  t.graphics.stencil = false
---  t.graphics.antialias = true
---  t.graphics.shadercache = true
---
---  -- Headset settings
---  t.headset.drivers = { 'openxr', 'simulator' }
---  t.headset.supersample = false
---  t.headset.seated = false
---  t.headset.antialias = true
---  t.headset.stencil = false
---  t.headset.submitdepth = true
---  t.headset.overlay = false
---
---  -- Math settings
---  t.math.globals = true
---
---  -- Thread settings
---  t.thread.workers = -1
---
---  -- Configure the desktop window
---  t.window.width = 1080
---  t.window.height = 600
---  t.window.fullscreen = false
---  t.window.resizable = false
---  t.window.title = 'LÖVR'
---  t.window.icon = nil
---end
---```
---
---@type fun(t: {version: string, identity: string, saveprecedence: boolean, modules: {audio: boolean, data: boolean, event: boolean, graphics: boolean, headset: boolean, math: boolean, physics: boolean, system: boolean, thread: boolean, timer: boolean}, audio: {spatializer: string, samplerate: number, start: boolean}, graphics: {debug: boolean, vsync: boolean, stencil: boolean, antialias: boolean, shadercache: boolean}, headset: {drivers: table, supersample: number, seated: boolean, antialias: boolean, stencil: boolean, submitdepth: boolean, overlay: boolean}, math: {globals: boolean}, thread: {workers: number}, window: {width: number, height: number, fullscreen: boolean, resizable: boolean, title: string, icon: string}}): nil
lovr.conf = nil

---This callback is called every frame, and receives a `Pass` object as an argument which can be used to render graphics to the display.  If a VR headset is connected, this function renders to the headset display, otherwise it will render to the desktop window.
---
---#### Notes:
---
---To render to the desktop window when a VR headset is connected, use the `lovr.mirror` callback.
---
---The display is cleared to the global background color before this callback is called, which can be changed using `lovr.graphics.setBackgroundColor`.
---
---Since the `lovr.graphics.submit` function always returns true, the following idiom can be used to submit graphics work manually and override the default submission:
---
---    function lovr.draw(pass)
---      local passes = {}
---
---      -- ... record multiple passes and add to passes table
---
---      return lovr.graphics.submit(passes)
---    end
---
---@type fun(pass: Pass): boolean
lovr.draw = nil

---The `lovr.errhand` callback is run whenever an error occurs.  It receives a parameter containing the error message.  It should return a handler function that will run in a loop to render the error screen.
---
---This handler function is of the same type as the one returned by `lovr.run` and has the same requirements (such as pumping events).  If an error occurs while this handler is running, the program will terminate immediately -- `lovr.errhand` will not be given a second chance.  Errors which occur in the error handler or in the handler it returns may not be cleanly reported, so be careful.
---
---A default error handler is supplied that renders the error message as text to the headset and to the window.
---
---#### Example:
---
---The default error handler.
---
---```lua
---function lovr.errhand(message)
---  local function formatTraceback(s)
---    return s:gsub('\n[^\n]+$', ''):gsub('\t', ''):gsub('stack traceback:', '\nStack:\n')
---  end
---
---  message = 'Error:\n\n' .. tostring(message) .. formatTraceback(debug.traceback('', 4))
---
---  print(message)
---
---  if not lovr.graphics or not lovr.graphics.isInitialized() then
---    return function() return 1 end
---  end
---
---  if lovr.audio then lovr.audio.stop() end
---
---  if not lovr.headset or lovr.headset.getPassthrough() == 'opaque' then
---    lovr.graphics.setBackgroundColor(.11, .10, .14)
---  else
---    lovr.graphics.setBackgroundColor(0, 0, 0, 0)
---  end
---
---  local font = lovr.graphics.getDefaultFont()
---
---  return function()
---    lovr.system.pollEvents()
---
---    for name, a in lovr.event.poll() do
---      if name == 'quit' then return a or 1
---      elseif name == 'restart' then return 'restart', lovr.restart and lovr.restart()
---      elseif name == 'keypressed' and a == 'f5' then lovr.event.restart()
---      elseif name == 'keypressed' and a == 'escape' then lovr.event.quit() end
---    end
---
---    if lovr.headset and lovr.headset.getDriver() ~= 'simulator' then
---      lovr.headset.update()
---      local pass = lovr.headset.getPass()
---      if pass then
---        font:setPixelDensity()
---
---        local scale = .35
---        local font = lovr.graphics.getDefaultFont()
---        local wrap = .7 * font:getPixelDensity()
---        local lines = font:getLines(message, wrap)
---        local width = math.min(font:getWidth(message), wrap) * scale
---        local height = .8 + #lines * font:getHeight() * scale
---        local x = -width / 2
---        local y = math.min(height / 2, 10)
---        local z = -10
---
---        pass:setColor(.95, .95, .95)
---        pass:text(message, x, y, z, scale, 0, 0, 0, 0, wrap, 'left', 'top')
---
---        lovr.graphics.submit(pass)
---        lovr.headset.submit()
---      end
---    end
---
---    if lovr.system.isWindowOpen() then
---      local pass = lovr.graphics.getWindowPass()
---      if pass then
---        local w, h = lovr.system.getWindowDimensions()
---        pass:setProjection(1, lovr.math.mat4():orthographic(0, w, 0, h, -1, 1))
---        font:setPixelDensity(1)
---
---        local scale = .6
---        local wrap = w * .8 / scale
---        local width = math.min(font:getWidth(message), wrap) * scale
---        local x = w / 2 - width / 2
---
---        pass:setColor(.95, .95, .95)
---        pass:text(message, x, h / 2, 0, scale, 0, 0, 0, 0, wrap, 'left', 'middle')
---
---        lovr.graphics.submit(pass)
---        lovr.graphics.present()
---      end
---    end
---
---    lovr.math.drain()
---  end
---end
---```
---
---@type fun(message: string): function
lovr.errhand = nil

---The `lovr.filechanged` callback is called when a file is changed.  File watching must be enabled, either by passing `--watch` when starting LÖVR or by calling `lovr.filesystem.watch`.
---
---Currently, only files in the source directory are watched.  On Android, files in the sdcard directory are watched.
---
---#### Notes:
---
---LÖVR provides a default implementation for `lovr.filechanged` that restarts the project if a non-hidden file was changed:
---
---    function lovr.filechanged(path)
---      if not path:match('^%.') then
---        lovr.event.restart()
---      end
---    end
---
---@type fun(path: string, action: FileAction, oldpath: string): nil
lovr.filechanged = nil

---The `lovr.focus` callback is called whenever the application acquires or loses focus (for example, when opening or closing the system VR menu).  The callback receives a `focused` argument, indicating whether or not the application is now focused.  Additionally, both the headset and desktop window have separate focus states, so a `display` argument indicates which display gained or lost input focus.  It may make sense to pause the game, reduce visual fidelity, or mute audio when the application loses focus.
---
---@type fun(focused: boolean, display: DisplayType): nil
lovr.focus = nil

---This callback is called when a key is pressed.
---
---@type fun(key: KeyCode, scancode: number, repeat: boolean): nil
lovr.keypressed = nil

---This callback is called when a key is released.
---
---@type fun(key: KeyCode, scancode: number): nil
lovr.keyreleased = nil

---This callback is called once when the app starts.  It should be used to perform initial setup work, like loading resources and initializing classes and variables.
---
---#### Notes:
---
---If the project was loaded from a restart using `lovr.event.restart`, the return value from the previously-run `lovr.restart` callback will be made available to this callback as the `restart` key in the `arg` table.
---
---The `arg` table follows the [Lua standard](https://en.wikibooks.org/wiki/Lua_Programming/command_line_parameter).  The arguments passed in from the shell are put into a global table named `arg` and passed to `lovr.load`, but with indices offset such that the "script" (the project path) is at index 0.  So all arguments (if any) intended for the project are at successive indices starting with 1, and the executable and its "internal" arguments are in normal order but stored in negative indices.
---
---#### Example:
---
---```lua
---function lovr.load(arg)
---  model = lovr.graphics.newModel('sponza.gltf')
---  texture = lovr.graphics.newTexture('cena.png')
---  effects = lovr.graphics.newShader('vert.glsl', 'frag.glsl')
---  loadLevel(1)
---end
---```
---
---@type fun(arg: table): nil
lovr.load = nil

---This callback is called when a message is logged.  The default implementation of this callback prints the message to the console using `print`, but it's possible to override this callback to render messages in VR, write them to a file, filter messages, and more.
---
---The message can have a "tag" that is a short string representing the sender, and a "level" indicating how severe the message is.
---
---The `t.graphics.debug` flag in `lovr.conf` can be used to get log messages from the GPU driver, tagged as `GPU`.  The `t.headset.debug` will enable OpenXR messages from the VR runtime, tagged as `XR`.
---
---It is also possible to emit custom log messages using `lovr.event.push`, or by calling the callback.
---
---@type fun(message: string, level: string, tag: string): nil
lovr.log = nil

---This callback is called every frame after rendering to the headset and is usually used to render a mirror of the headset display onto the desktop window.  It can be overridden for custom mirroring behavior.  For example, a stereo view could be drawn instead of a single eye or a 2D HUD could be rendered.
---
---#### Example:
---
---The default `lovr.mirror` implementation draws the headset mirror texture to the window if the headset is active, or just calls `lovr.draw` if there isn't a headset.
---
---```lua
---function lovr.mirror(pass)
---  if lovr.headset then
---    local texture = lovr.headset.getTexture()
---    if texture then
---      pass:fill(texture)
---    else
---      return true
---    end
---  else
---    return lovr.draw and lovr.draw(pass)
---  end
---end
---```
---
---@type fun(pass: Pass): boolean
lovr.mirror = nil

---The `lovr.mount` callback is called when the headset is put on or taken off.
---
---@type fun(mounted: boolean): nil
lovr.mount = nil

---This callback is called when the mouse is moved.
---
---@type fun(x: number, y: number, dx: number, dy: number): nil
lovr.mousemoved = nil

---This callback is called when a mouse button is pressed.
---
---@type fun(x: number, y: number, button: number): nil
lovr.mousepressed = nil

---This callback is called when a mouse button is released.
---
---@type fun(x: number, y: number, button: number): nil
lovr.mousereleased = nil

---This callback contains a permission response previously requested with `lovr.system.requestPermission`.  The callback contains information on whether permission was granted or denied.
---
---@type fun(permission: Permission, granted: boolean): nil
lovr.permission = nil

---This callback is called right before the application is about to quit.  Use it to perform any necessary cleanup work.  A truthy value can be returned from this callback to abort quitting.
---
---#### Example:
---
---```lua
---function lovr.quit()
---  if shouldQuit() then
---    return false
---  else
---    return true
---  end
---end
---```
---
---@type fun(): boolean
lovr.quit = nil

---The `lovr.recenter` callback is called whenever the user performs a "recenter" gesture to realign the virtual coordinate space.  On most VR systems this will move the origin to the user's current position and rotate its yaw to match the view direction.  The y=0 position will always be on the floor or at eye level, depending on whether `t.headset.seated` was set in `lovr.conf`.
---
---#### Notes:
---
---Note that the pose of the `floor` device will not always be at the origin of the coordinate space.  It uses a fixed position on the floor in the real world, usually the center of the configured play area.  This allows virtual objects to be positioned in a room without having them jump around after a recenter.
---
---@type fun(): nil
lovr.recenter = nil

---This callback is called when the desktop window is resized.
---
---@type fun(width: number, height: number): nil
lovr.resize = nil

---This callback is called when a restart from `lovr.event.restart` is happening.  A value can be returned to send it to the next LÖVR instance, available as the `restart` key in the argument table passed to `lovr.load`.  Object instances can not be used as the restart value, since they are destroyed as part of the cleanup process.
---
---#### Notes:
---
---Only nil, booleans, numbers, and strings are supported types for the return value.
---
---#### Example:
---
---```lua
---function lovr.restart()
---  return currentLevel:getName()
---end
---```
---
---@type fun(): *
lovr.restart = nil

---This callback is the main entry point for a LÖVR program.  It calls `lovr.load` and returns a function that will be called every frame.
---
---#### Notes:
---
---The main loop function can return one of the following values:
---
---- Returning `nil` will keep the main loop running.
---- Returning the string 'restart' plus an optional value will restart LÖVR.  The value can be
---  accessed in the `restart` key of the `arg` global.
---- Returning a number will exit LÖVR using the number as the exit code (0 means success).
---
---Care should be taken when overriding this callback.  For example, if the main loop does not call `lovr.system.pollEvents` then the OS will think LÖVR is unresponsive, or if the quit event is not handled then closing the window won't work.
---
---#### Example:
---
---The default `lovr.run`:
---
---```lua
---function lovr.run()
---  if lovr.timer then lovr.timer.step() end
---  if lovr.load then lovr.load(arg) end
---  return function()
---    if lovr.system then lovr.system.pollEvents() end
---    if lovr.event then
---      for name, a, b, c, d in lovr.event.poll() do
---        if name == 'restart' then return 'restart', lovr.restart and lovr.restart()
---        elseif name == 'quit' and (not lovr.quit or not lovr.quit(a)) then return a or 0
---        elseif name ~= 'quit' and lovr.handlers[name] then lovr.handlers[name](a, b, c, d) end
---      end
---    end
---    local dt = 0
---    if lovr.timer then dt = lovr.timer.step() end
---    if lovr.headset and lovr.headset.isActive() then dt = lovr.headset.update() end
---    if lovr.update then lovr.update(dt) end
---    if lovr.graphics then
---      local headset = lovr.headset and lovr.headset.getPass()
---      if headset and (not lovr.draw or lovr.draw(headset)) then headset = nil end
---      local window = lovr.graphics.getWindowPass()
---      if window and (not lovr.mirror or lovr.mirror(window)) then window = nil end
---      lovr.graphics.submit(headset, window)
---      lovr.graphics.present()
---    end
---    if lovr.headset then lovr.headset.submit() end
---    if lovr.math then lovr.math.drain() end
---  end
---end
---```
---
---@type fun(): function
lovr.run = nil

---This callback is called when text has been entered.
---
---For example, when `shift + 1` is pressed on an American keyboard, `lovr.textinput` will be called with `!`.
---
---#### Notes:
---
---Some characters in UTF-8 unicode take multiple bytes to encode.  Due to the way Lua works, the length of these strings will be bigger than 1 even though they are just a single character.  The `utf8` library included with LÖVR can be used to manipulate UTF-8 strings.  `Pass:text` will also correctly handle UTF-8.
---
---@type fun(text: string, code: number): nil
lovr.textinput = nil

---The `lovr.threaderror` callback is called whenever an error occurs in a Thread.  It receives the Thread object where the error occurred and an error message.
---
---The default implementation of this callback will call `lovr.errhand` with the error.
---
---@type fun(thread: Thread, message: string): nil
lovr.threaderror = nil

---The `lovr.update` callback should be used to update your game's logic.  It receives a single parameter, `dt`, which represents the amount of elapsed time between frames.  You can use this value to scale timers, physics, and animations in your game so they play at a smooth, consistent speed.
---
---#### Example:
---
---```lua
---function lovr.update(dt)
---  ball.vy = ball.vy + ball.gravity * dt
---  ball.y = ball.y + ball.vy * dt
---end
---```
---
---@type fun(dt: number): nil
lovr.update = nil

---The `lovr.visible` callback is called whenever the application becomes visible or invisible. `lovr.draw` may still be called even while invisible to give the VR runtime timing info.  If the VR runtime decides the application doesn't need to render anymore, LÖVR will detect this and stop calling `lovr.draw`.
---
---This event is also fired when the desktop window is minimized or restored.  It's possible to distinguish between the headset and window using the `display` parameter.
---
---@type fun(visible: boolean, display: DisplayType): nil
lovr.visible = nil

---This callback is called on scroll action, from a mouse wheel or a touchpad
---
---@type fun(dx: number, dy: number): nil
lovr.wheelmoved = nil
