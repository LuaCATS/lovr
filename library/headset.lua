---@meta

---The `lovr.headset` module is where all the magical VR functionality is.  With it, you can access connected VR hardware and get information about the available space the player has.  Note that all units are reported in meters.  Position `(0, 0, 0)` is on the floor in the center of the play area.
---
---@class lovr.headset
lovr.headset = {}

---Animates a model to match its input state.  The buttons and joysticks on a controller will move as they're pressed/moved and hand models will move to match hand tracking joints.
---
---The model must have been created using `lovr.headset.newModel` with the `animated` flag set to `true`.
---
---#### Notes:
---
---It's possible to animate a custom hand model by retargeting joint poses, see the `Interaction/Custom_Hand_Rig` example.
---
---#### Example:
---
---```lua
---function lovr.load()
---  models = {
---    left = lovr.headset.newModel('hand/left'),
---    right = lovr.headset.newModel('hand/right')
---  }
---end
---
---function lovr.draw(pass)
---  for hand, model in pairs(models) do
---    if lovr.headset.isTracked(hand) then
---      lovr.headset.animate(model)
---      pass:draw(model, mat4(lovr.headset.getPose(hand)))
---    end
---  end
---
---  if not next(models) then
---    pass:text('No models loaded', 0, 1.7, -1, .1)
---  end
---end
---```
---
---@param model Model The model to animate.
---@return boolean success Whether the animation was applied successfully to the Model.  If the Model was not compatible or animation data for the device was not available, this will be `false`.
function lovr.headset.animate(model) end

---Animates a model to match its input state.  The buttons and joysticks on a controller will move as they're pressed/moved and hand models will move to match hand tracking joints.
---
---The model must have been created using `lovr.headset.newModel` with the `animated` flag set to `true`.
---
---#### Notes:
---
---It's possible to animate a custom hand model by retargeting joint poses, see the `Interaction/Custom_Hand_Rig` example.
---
---#### Example:
---
---```lua
---function lovr.load()
---  models = {
---    left = lovr.headset.newModel('hand/left'),
---    right = lovr.headset.newModel('hand/right')
---  }
---end
---
---function lovr.draw(pass)
---  for hand, model in pairs(models) do
---    if lovr.headset.isTracked(hand) then
---      lovr.headset.animate(model)
---      pass:draw(model, mat4(lovr.headset.getPose(hand)))
---    end
---  end
---
---  if not next(models) then
---    pass:text('No models loaded', 0, 1.7, -1, .1)
---  end
---end
---```
---
---@param device? Device The device to use for the animation data.
---@param model Model The model to animate.
---@return boolean success Whether the animation was applied successfully to the Model.  If the Model was not compatible or animation data for the device was not available, this will be `false`.
---@deprecated
function lovr.headset.animate(device, model) end

---Tries to connect to headset hardware.  This will initialize OpenXR and query the system for any connected VR hardware.  It must be called before other functions like `lovr.headset.start` can be called.  It may be desirable to avoid calling this function until later, because it will e.g. cause the SteamVR window to pop up, and may delay the rest of LÖVR's startup.
---
---Usually this is called automatically by boot.lua, but you can disable this behavior by setting `t.headset.connect` to false in `lovr.conf`.
---
---@return boolean success Whether the headset was successfully connected.
---@return string | nil error The error message, on failure.
function lovr.headset.connect() end

---Returns the current angular velocity of a device.
---
---#### Notes:
---
---If the device isn't tracked, all zeroes will be returned.
---
---@param device? Device The device to get the velocity of.
---@return number x The x component of the angular velocity.
---@return number y The y component of the angular velocity.
---@return number z The z component of the angular velocity.
function lovr.headset.getAngularVelocity(device) end

---Get the current state of an analog axis on a device.  Some axes are multidimensional, for example a 2D touchpad or thumbstick with x/y axes.  For multidimensional axes, this function will return multiple values, one number for each axis.  In these cases, it can be useful to use the `select` function built in to Lua to select a particular axis component.
---
---#### Notes:
---
---The axis values will be between 0 and 1 for 1D axes, and between -1 and 1 for each component of a multidimensional axis.
---
---When hand tracking is active, pinch strength will be mapped to the `trigger` axis.
---
---@param device Device The device.
---@param axis DeviceAxis The axis.
---@return number | nil ... The current state of the components of the axis, or `nil` if the device does not have any information about the axis.
function lovr.headset.getAxis(device, axis) end

---Returns the battery status of a device.
---
---#### Notes:
---
---This function will return `nil` if the device doesn't have a battery, or if the `battery` feature in `lovr.headset.getFeatures` is not supported.
---
---This function is not currently able to measure the battery of the headset, only controllers and other devices.
---
---The battery info is intended to only be used for display purposes, not to drive logic.
---
---@param device? Device The device to check.
---@return number level The level of the battery, from 0 to 1.
---@return boolean charging Whether the battery is currently charging.
function lovr.headset.getBattery(device) end

---Returns the depth of the play area, in meters.
---
---#### Notes:
---
---If the VR system is not roomscale, this will return zero.
---
---@return number depth The depth of the play area, in meters.
function lovr.headset.getBoundsDepth() end

---Returns the size of the play area, in meters.
---
---#### Notes:
---
---If the VR system is not roomscale, this will return zero.
---
---@return number width The width of the play area, in meters.
---@return number depth The depth of the play area, in meters.
function lovr.headset.getBoundsDimensions() end

---Returns the width of the play area, in meters.
---
---#### Notes:
---
---If the VR system is not roomscale, this will return zero.
---
---@return number width The width of the play area, in meters.
function lovr.headset.getBoundsWidth() end

---Returns the near and far clipping planes used to render to the headset.  Objects closer than the near clipping plane or further than the far clipping plane will be clipped out of view.
---
---#### Notes:
---
---The default near and far clipping planes are 0.01 meters and 0.0 meters.
---
---@return number near The distance to the near clipping plane, in meters.
---@return number far The distance to the far clipping plane, in meters, or 0 for an infinite far clipping plane with a reversed Z range.
function lovr.headset.getClipDistance() end

---Returns the headset delta time, which is the difference between the current and previous predicted display times.  When the headset is active, this will be the `dt` value passed in to `lovr.update`.
---
---@return number dt The delta time.
function lovr.headset.getDeltaTime() end

---Returns the direction a device or model is pointing.  It will always be normalized.
---
---#### Notes:
---
---If the object isn't tracked, this function returns zeroes.
---
---This is the same as `quaternion(lovr.headset.getOrientation(device)):direction()`.
---
---@param device? Device The device to get the direction of.
---@return number x The x component of the direction.
---@return number y The y component of the direction.
---@return number z The z component of the direction.
function lovr.headset.getDirection(device) end

---Returns the direction a device or model is pointing.  It will always be normalized.
---
---#### Notes:
---
---If the object isn't tracked, this function returns zeroes.
---
---This is the same as `quaternion(lovr.headset.getOrientation(device)):direction()`.
---
---@param model Model The model to get the direction of.
---@return number x The x component of the direction.
---@return number y The y component of the direction.
---@return number z The z component of the direction.
function lovr.headset.getDirection(model) end

---Returns the texture dimensions of the headset display (for one eye), in pixels.
---
---@return number width The width of the display.
---@return number height The height of the display.
function lovr.headset.getDisplayDimensions() end

---Returns the height of the headset display (for one eye), in pixels.
---
---@return number height The height of the display.
function lovr.headset.getDisplayHeight() end

---Returns the width of the headset display (for one eye), in pixels.
---
---@return number width The width of the display.
function lovr.headset.getDisplayWidth() end

---Returns the `HeadsetDriver` that is currently in use, plus the name of the VR runtime.  The order of headset drivers can be changed using `lovr.conf`.
---
---@return HeadsetDriver driver The current headset backend, e.g. `openxr` or `simulator`.
---@return string runtime The name of the VR runtime, e.g. `SteamVR/OpenXR`.
function lovr.headset.getDriver() end

---Returns a table of features that are supported by the current headset runtime.
---
---@return table features
function lovr.headset.getFeatures() end

---Returns the current foveation settings, previously set by `lovr.headset.setFoveation`.'
---
---#### Notes:
---
---Foveation is disabled by default.
---
---@return FoveationLevel level The foveation level (or the maximum level when dynamic foveation is active).
---@return boolean dynamic Whether dynamic foveation is active, allowing the system to reduce foveation based on GPU load.
function lovr.headset.getFoveation() end

---Returns a table with all of the currently tracked hand devices.
---
---#### Notes:
---
---The hand paths will *always* be either `hand/left` or `hand/right`.
---
---#### Example:
---
---```lua
---function lovr.update(dt)
---  for i, hand in ipairs(lovr.headset.getHands()) do
---    print(hand, lovr.headset.getPose(hand))
---  end
---end
---```
---
---@return {Device} hands The currently tracked hand devices.
function lovr.headset.getHands() end

---Returns the list of active `Layer` objects.  These are the layers that will be rendered in the headset's display.  They are rendered in order.
---
---#### Notes:
---
---Currently some VR systems are able to sort the layers by their Z depth, but on others layers later in the list will render on top of previous layers, regardless of depth.
---
---There is currently a maximum of 10 layers.
---
---@return {Layer} layers The list of layers.
function lovr.headset.getLayers() end

---Returns a list of model keys.  Use model keys to create models with `lovr.headset.newModel`. There is no correspondence between a model key and a particular `Device`.
---
---The `lovr.modelschanged` event will be called when the list of model keys changes, providing the opportunity to create models for any new keys that appear and destroy models for keys that are no longer present.
---
---@return {lightuserdata} keys A list of model keys.
function lovr.headset.getModelKeys() end

---Returns the name of the headset as a string.  The exact string that is returned depends on the hardware and VR SDK that is currently in use.
---
---@return string name The name of the headset as a string.
function lovr.headset.getName() end

---Returns the current orientation of a device or model, in angle/axis form.
---
---#### Notes:
---
---If the object isn't tracked, this function returns zeroes.
---
---@param device? Device The device to get the orientation of.
---@return number angle The amount of rotation around the axis of rotation, in radians.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function lovr.headset.getOrientation(device) end

---Returns the current orientation of a device or model, in angle/axis form.
---
---#### Notes:
---
---If the object isn't tracked, this function returns zeroes.
---
---@param model Model The model to get the orientation of.
---@return number angle The amount of rotation around the axis of rotation, in radians.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function lovr.headset.getOrientation(model) end

---Returns a `Pass` that renders to the headset display.
---
---#### Notes:
---
---The same Pass will be returned until `lovr.headset.submit` is called.
---
---The first time this function is called during a frame, the views of the Pass will be initialized with the headset view poses and view angles.
---
---The pass will be cleared to the background color, which can be changed using `lovr.graphics.setBackgroundColor`.
---
---The pass will have a depth buffer.  If `t.headset.stencil` was set to a truthy value in `lovr.conf`, the depth buffer will use the `d32fs8` format, otherwise `d32f` will be used.
---
---If `t.headset.antialias` was set to a truthy value in `lovr.conf`, the pass will be multisampled.
---
---@return Pass | nil pass The pass.
function lovr.headset.getPass() end

---Returns the current passthrough mode.
---
---@return PassthroughMode mode The current passthrough mode.
function lovr.headset.getPassthrough() end

---Returns the set of supported passthrough modes.
---
---@return table modes The set of supported passthrough modes.  Keys will be `PassthroughMode` strings, and values will be booleans indicating whether the mode is supported.
function lovr.headset.getPassthroughModes() end

---Returns the current position and orientation of a device or model.
---
---#### Notes:
---
---Units are in meters.
---
---If the object isn't tracked, this function returns zeroes.
---
---@param device? Device The device to get the pose of.
---@return number x The x position.
---@return number y The y position.
---@return number z The z position.
---@return number angle The amount of rotation around the axis of rotation, in radians.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function lovr.headset.getPose(device) end

---Returns the current position and orientation of a device or model.
---
---#### Notes:
---
---Units are in meters.
---
---If the object isn't tracked, this function returns zeroes.
---
---@param model Model The device to get the pose of.
---@return number x The x position.
---@return number y The y position.
---@return number z The z position.
---@return number angle The amount of rotation around the axis of rotation, in radians.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function lovr.headset.getPose(model) end

---Returns the current position of a device or model, in meters.
---
---#### Notes:
---
---If the object isn't tracked, this function returns zeroes.
---
---@param device? Device The device to locate.
---@return number x The x position.
---@return number y The y position.
---@return number z The z position.
function lovr.headset.getPosition(device) end

---Returns the current position of a device or model, in meters.
---
---#### Notes:
---
---If the object isn't tracked, this function returns zeroes.
---
---@param model Model The model to locate.
---@return number x The x position.
---@return number y The y position.
---@return number z The z position.
function lovr.headset.getPosition(model) end

---Returns the refresh rate of the headset display, in Hz.
---
---@return number | nil rate The refresh rate of the display, or `nil` if I have no idea what it is.
function lovr.headset.getRefreshRate() end

---Returns a table with all the refresh rates supported by the headset display, in Hz.
---
---@return table | nil rates A flat table of the refresh rates supported by the headset display, or nil if not supported.
function lovr.headset.getRefreshRates() end

---Returns a list of joint transforms tracked by a device.  Currently, only hand devices are able to track joints.
---
---#### Notes:
---
---If the Device does not support tracking joints or the transforms are unavailable, this function returns `nil`.
---
---The joint orientation is similar to the graphics coordinate system: -Z is the forwards direction, pointing towards the fingertips.  The +Y direction is "up", pointing out of the back of the hand.  The +X direction is to the right, perpendicular to X and Z.
---
---Here's a picture, courtesy of Khronos Group:
---
---![Hand Skeleton Joints](https://lovr.org/img/hand-skeleton.png)
---
---Hand joints are returned in the following order:
---
---<table>
---  <thead>
---    <tr>
---      <td colspan="2">Joint</td>
---      <td>Index</td>
---    </tr>
---  </thead>
---  <tbody>
---    <tr>
---      <td colspan="2">Palm</td>
---      <td>1</td>
---    </tr>
---    <tr>
---      <td colspan="2">Wrist</td>
---      <td>2</td>
---    </tr>
---    <tr>
---      <td rowspan="4">Thumb</td>
---      <td>Metacarpal</td>
---      <td>3</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>4</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>5</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>6</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Index</td>
---      <td>Metacarpal</td>
---      <td>7</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>8</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>9</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>10</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>11</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Middle</td>
---      <td>Metacarpal</td>
---      <td>12</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>13</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>14</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>15</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>16</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Ring</td>
---      <td>Metacarpal</td>
---      <td>17</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>18</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>19</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>20</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>21</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Pinky</td>
---      <td>Metacarpal</td>
---      <td>22</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>23</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>24</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>25</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>26</td>
---    </tr>
---  </tbody> </table>
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for _, hand in ipairs({ 'left', 'right' }) do
---    for _, joint in ipairs(lovr.headset.getSkeleton(hand) or {}) do
---      pass:points(unpack(joint, 1, 3))
---    end
---  end
---end
---```
---
---@param device Device The hand device to query (`left` or `right`).
---@return {{number}} | nil transforms A list of joint transforms for the device.  Each transform is a table with 3 numbers for the position of the joint, 1 number for the joint radius (in meters), and 4 numbers for the angle/axis orientation of the joint.  There is also a `radius` key with the radius of the joint as well.
function lovr.headset.getSkeleton(device) end

---Returns a list of joint transforms tracked by a device.  Currently, only hand devices are able to track joints.
---
---#### Notes:
---
---If the Device does not support tracking joints or the transforms are unavailable, this function returns `nil`.
---
---The joint orientation is similar to the graphics coordinate system: -Z is the forwards direction, pointing towards the fingertips.  The +Y direction is "up", pointing out of the back of the hand.  The +X direction is to the right, perpendicular to X and Z.
---
---Here's a picture, courtesy of Khronos Group:
---
---![Hand Skeleton Joints](https://lovr.org/img/hand-skeleton.png)
---
---Hand joints are returned in the following order:
---
---<table>
---  <thead>
---    <tr>
---      <td colspan="2">Joint</td>
---      <td>Index</td>
---    </tr>
---  </thead>
---  <tbody>
---    <tr>
---      <td colspan="2">Palm</td>
---      <td>1</td>
---    </tr>
---    <tr>
---      <td colspan="2">Wrist</td>
---      <td>2</td>
---    </tr>
---    <tr>
---      <td rowspan="4">Thumb</td>
---      <td>Metacarpal</td>
---      <td>3</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>4</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>5</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>6</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Index</td>
---      <td>Metacarpal</td>
---      <td>7</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>8</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>9</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>10</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>11</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Middle</td>
---      <td>Metacarpal</td>
---      <td>12</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>13</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>14</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>15</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>16</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Ring</td>
---      <td>Metacarpal</td>
---      <td>17</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>18</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>19</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>20</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>21</td>
---    </tr>
---    <tr>
---      <td rowspan="5">Pinky</td>
---      <td>Metacarpal</td>
---      <td>22</td>
---    </tr>
---    <tr>
---      <td>Proximal</td>
---      <td>23</td>
---    </tr>
---    <tr>
---      <td>Intermediate</td>
---      <td>24</td>
---    </tr>
---    <tr>
---      <td>Distal</td>
---      <td>25</td>
---    </tr>
---    <tr>
---      <td>Tip</td>
---      <td>26</td>
---    </tr>
---  </tbody> </table>
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for _, hand in ipairs({ 'left', 'right' }) do
---    for _, joint in ipairs(lovr.headset.getSkeleton(hand) or {}) do
---      pass:points(unpack(joint, 1, 3))
---    end
---  end
---end
---```
---
---@param device Device The hand device to query (`left` or `right`).
---@param t table A table to fill with the joint transforms, instead of allocating a new one.
---@return {{number}} | nil transforms A list of joint transforms for the device.  Each transform is a table with 3 numbers for the position of the joint, 1 number for the joint radius (in meters), and 4 numbers for the angle/axis orientation of the joint.  There is also a `radius` key with the radius of the joint as well.
function lovr.headset.getSkeleton(device, t) end

---Returns a Texture that will be submitted to the headset display.  This will be the render target used in the headset's render pass.  The texture is not guaranteed to be the same every frame, and must be called every frame to get the current texture.
---
---#### Notes:
---
---This function may return `nil` if the headset is not being rendered to this frame.
---
---@return Texture | nil texture The headset texture.
function lovr.headset.getTexture() end

---Returns the estimated time in the future at which the light from the pixels of the current frame will hit the eyes of the user.
---
---This can be used as a replacement for `lovr.timer.getTime` for timestamps that are used for rendering to get a smoother result that is synchronized with the display of the headset.
---
---#### Notes:
---
---This has a different epoch than `lovr.timer.getTime`, so it is not guaranteed to be close to that value.
---
---@return number time The predicted display time, in seconds.
function lovr.headset.getTime() end

---Returns the current linear velocity of a device, in meters per second.
---
---#### Notes:
---
---If the device isn't tracked, all zeroes will be returned.
---
---@param device? Device The device to get the velocity of.
---@return number vx The x component of the linear velocity.
---@return number vy The y component of the linear velocity.
---@return number vz The z component of the linear velocity.
function lovr.headset.getVelocity(device) end

---Returns the view angles of one of the headset views.
---
---These can be used with `Mat4:fov` to create a projection matrix.
---
---If tracking data is unavailable for the view or the index is invalid, `nil` is returned.
---
---@param view number The view index.
---@return number | nil left The left view angle, in radians.
---@return number | nil right The right view angle, in radians.
---@return number | nil top The top view angle, in radians.
---@return number | nil bottom The bottom view angle, in radians.
function lovr.headset.getViewAngles(view) end

---Returns the number of views used for rendering.  Each view consists of a pose in space and a set of angle values that determine the field of view.
---
---This is usually 2 for stereo rendering configurations, but it can also return 1 or 4.  For example, one way of doing foveated rendering uses 2 views for each eye -- one low quality view with a wider field of view, and a high quality view with a narrower field of view.  On those systems, this function will return 4.
---
---@return number count The number of views.
function lovr.headset.getViewCount() end

---Returns the pose of one of the headset views.  This info can be used to create view matrices or do other eye-dependent calculations.
---
---If tracking data is unavailable for the view or the index is invalid, `nil` is returned.
---
---@param view number The view index.
---@return number | nil x The x coordinate of the view position, in meters.
---@return number | nil y The y coordinate of the view position, in meters.
---@return number | nil z The z coordinate of the view position, in meters.
---@return number | nil angle The amount of rotation around the rotation axis, in radians.
---@return number | nil ax The x component of the axis of rotation.
---@return number | nil ay The y component of the axis of rotation.
---@return number | nil az The z component of the axis of rotation.
function lovr.headset.getViewPose(view) end

---Returns whether a headset session is active.  When true, there is an active connection to the VR hardware.  When false, most headset methods will not work properly until `lovr.headset.start` is used to start a session.
---
---@return boolean active Whether the headset session is active.
function lovr.headset.isActive() end

---Returns whether a button on a device is pressed.
---
---#### Notes:
---
---When hand tracking is active, pinching will be mapped to the `trigger` button.
---
---@param device Device The device.
---@param button DeviceButton The button.
---@return boolean | nil down Whether the button on the device is currently pressed, or `nil` if the device does not have the specified button.
function lovr.headset.isDown(device, button) end

---Returns whether LÖVR has VR input focus.  Focus is lost when the VR system menu is shown.  The `lovr.focus` callback can be used to detect when this changes.
---
---@return boolean focused Whether the application is focused.
function lovr.headset.isFocused() end

---Returns whether the headset is mounted.  Usually this uses a proximity sensor on the headset to detect whether someone is wearing the headset.
---
---@return boolean mounted Whether the headset is mounted.
function lovr.headset.isMounted() end

---Returns whether the headset coordinate space is in seated mode.
---
---Seated mode is enabled by setting `t.headset.seated` to true in `lovr.conf`.  In seated mode, `y=0` will be at eye level, instead of on the floor like in standing-scale experiences.
---
---The seated coordinate space can be more convenient for applications that are rendering a simple interface in front of the user (like a video player) instead of a roomscale 3D scene.  y=0 will also be at the correct height at startup, whether the user is sitting or standing.
---
---@return boolean seated Whether the experience is seated.
function lovr.headset.isSeated() end

---Returns whether a button on a device is currently touched.
---
---@param device Device The device.
---@param button DeviceButton The button.
---@return boolean | nil touched Whether the button on the device is currently touched, or `nil` if the device does not have the button or it isn't touch-sensitive.
function lovr.headset.isTouched(device, button) end

---Returns whether a `Device` or `Model` has an actively tracked pose.
---
---#### Notes:
---
---If a device is tracked, it is guaranteed to return a valid pose until the next call to `lovr.headset.update`.
---
---@param device? Device The device to check.
---@return boolean tracked Whether the device or model is currently tracked.
function lovr.headset.isTracked(device) end

---Returns whether a `Device` or `Model` has an actively tracked pose.
---
---#### Notes:
---
---If a device is tracked, it is guaranteed to return a valid pose until the next call to `lovr.headset.update`.
---
---@param model Model The model to check.  Should have been created with `lovr.headset.newModel`.
---@return boolean tracked Whether the device or model is currently tracked.
function lovr.headset.isTracked(model) end

---Returns whether LÖVR's content is being presented to the headset display.  Normally this will be true, but some VR runtimes allow applications to be hidden or "minimized", similar to desktop windows.
---
---#### Notes:
---
---`lovr.draw` may still be called even when the application is invisible, and apps should continue to render the scene normally because the VR system may use this for timing info.  If the VR system decides that the application no longer needs to render, LÖVR will stop calling `lovr.draw`.
---
---@return boolean visible Whether the application is visible.
function lovr.headset.isVisible() end

---Creates a new `Layer`.
---
---#### Notes:
---
---Currently, images and textures used to create Layers must have the `rgba8` format.
---
---Layer textures are `rgba8` and are sRGB.
---
---@param width number The width of the Layer texture, in pixels.
---@param height number The height of the Layer texture, in pixels.
---@param options? {stereo: boolean, static: boolean, transparent: boolean, filter: boolean} Optional options for the Layer.
---@return Layer layer The new Layer.
function lovr.headset.newLayer(width, height, options) end

---Creates a new `Layer`.
---
---#### Notes:
---
---Currently, images and textures used to create Layers must have the `rgba8` format.
---
---Layer textures are `rgba8` and are sRGB.
---
---@param texture Texture A Texture to copy to the Layer.
---@param options? {stereo: boolean, static: boolean, transparent: boolean, filter: boolean} Optional options for the Layer.
---@return Layer layer The new Layer.
function lovr.headset.newLayer(texture, options) end

---Creates a new `Layer`.
---
---#### Notes:
---
---Currently, images and textures used to create Layers must have the `rgba8` format.
---
---Layer textures are `rgba8` and are sRGB.
---
---@param image Image An Image to upload to the Layer.
---@param options? {stereo: boolean, static: boolean, transparent: boolean, filter: boolean} Optional options for the Layer.
---@return Layer layer The new Layer.
function lovr.headset.newLayer(image, options) end

---Creates a new `Layer`.
---
---#### Notes:
---
---Currently, images and textures used to create Layers must have the `rgba8` format.
---
---Layer textures are `rgba8` and are sRGB.
---
---@param images table A table of Images to upload to the Layer.
---@param options? {stereo: boolean, static: boolean, transparent: boolean, filter: boolean} Optional options for the Layer.
---@return Layer layer The new Layer.
function lovr.headset.newLayer(images, options) end

---Loads a new Model object for the specified model key.
---
---Model keys are lightuserdata values that act as an ID for a specific model.  Use `lovr.headset.getModelKeys` to retrieve a list of model keys for the currently connected hardware.
---
---It is recommended to refresh the list of model keys in the `lovr.modelschanged` event, which gets fired whenever the list of keys changes.  `lovr.modelschanged` is also fired once at startup when the models are ready to load.  In the callback, you can get the new list of model keys and load models for any keys that haven't been loaded yet.
---
---There isn't any correspondence between a model key and a `Device`, because there could be multiple models for a device, or some models that do not correspond to a device at all.  For example, the hand device could have a model for a controller, a wrist tracker, or a hand mesh.
---
---Once a model is loaded, call `lovr.headset.isTracked` with the model to check if it should be visible, and `lovr.headset.getPose` to get the position and orientation to draw the model at.
---
---To reposition the nodes in the model to match the current state of the buttons, joysticks, etc., call `lovr.headset.animate` with the model.
---
---#### Example:
---
---```lua
---local models = {}
---
---function lovr.draw(pass)
---  for _, model in pairs(models) do
---    if lovr.headset.isTracked(model) then
---      lovr.headset.animate(model)
---
---      local x, y, z, angle, ax, ay, az = lovr.headset.getPose(model)
---      pass:draw(model, x, y, z, 1, angle, ax, ay, az)
---    end
---  end
---end
---
---function lovr.modelschanged()
---  local newModels = {}
---
---  for i, key in ipairs(lovr.headset.getModelKeys()) do
---    newModels[key] = models[key] or lovr.headset.newModel(key)
---  end
---
---  models = newModels
---end
---```
---
---@param key lightuserdata A model key to load, previously obtained with `lovr.headset.getModelKeys`.
---@return Model model The new Model, or `nil` if a model could not be loaded.
function lovr.headset.newModel(key) end

---Loads a new Model object for the specified model key.
---
---Model keys are lightuserdata values that act as an ID for a specific model.  Use `lovr.headset.getModelKeys` to retrieve a list of model keys for the currently connected hardware.
---
---It is recommended to refresh the list of model keys in the `lovr.modelschanged` event, which gets fired whenever the list of keys changes.  `lovr.modelschanged` is also fired once at startup when the models are ready to load.  In the callback, you can get the new list of model keys and load models for any keys that haven't been loaded yet.
---
---There isn't any correspondence between a model key and a `Device`, because there could be multiple models for a device, or some models that do not correspond to a device at all.  For example, the hand device could have a model for a controller, a wrist tracker, or a hand mesh.
---
---Once a model is loaded, call `lovr.headset.isTracked` with the model to check if it should be visible, and `lovr.headset.getPose` to get the position and orientation to draw the model at.
---
---To reposition the nodes in the model to match the current state of the buttons, joysticks, etc., call `lovr.headset.animate` with the model.
---
---#### Example:
---
---```lua
---local models = {}
---
---function lovr.draw(pass)
---  for _, model in pairs(models) do
---    if lovr.headset.isTracked(model) then
---      lovr.headset.animate(model)
---
---      local x, y, z, angle, ax, ay, az = lovr.headset.getPose(model)
---      pass:draw(model, x, y, z, 1, angle, ax, ay, az)
---    end
---  end
---end
---
---function lovr.modelschanged()
---  local newModels = {}
---
---  for i, key in ipairs(lovr.headset.getModelKeys()) do
---    newModels[key] = models[key] or lovr.headset.newModel(key)
---  end
---
---  models = newModels
---end
---```
---
---@param device? Device The device to load a model for.
---@return Model model The new Model, or `nil` if a model could not be loaded.
---@deprecated
function lovr.headset.newModel(device) end

---Polls for new headset events, adding them to the event queue.  This is called automatically by `lovr.run`.
---
function lovr.headset.pollEvents() end

---Sets a background layer.  This will render behind any transparent pixels in the main 3D content. It works similarly to other `Layer` objects, but using a cubemap or equirectangular texture.
---
---The background texture is sent to the VR runtime once, and the runtime is responsible for compositing it behind the rest of the scene.  This can improve performance greatly, since the background doesn't need to be re-rendered every frame.  It also ensures the background remains tracked smoothly even if LÖVR is struggling to render at a high frame rate.
---
---#### Notes:
---
---There is no `lovr.headset.getBackground` because LÖVR does not store the Image or Texture after setting it as a background, to save memory.
---
---@param background Image | {Image} | Texture The image(s) or texture to use for the background.  Backgrounds can either be cubemaps (6 images) or equirectangular (a single panoramic 2D image).
---
---Textures can have any color format, but it will be converted to `rgba8` before getting copied to the VR runtime.  Images currently have to be `rgba8`.
function lovr.headset.setBackground(background) end

---Sets a background layer.  This will render behind any transparent pixels in the main 3D content. It works similarly to other `Layer` objects, but using a cubemap or equirectangular texture.
---
---The background texture is sent to the VR runtime once, and the runtime is responsible for compositing it behind the rest of the scene.  This can improve performance greatly, since the background doesn't need to be re-rendered every frame.  It also ensures the background remains tracked smoothly even if LÖVR is struggling to render at a high frame rate.
---
---#### Notes:
---
---There is no `lovr.headset.getBackground` because LÖVR does not store the Image or Texture after setting it as a background, to save memory.
---
function lovr.headset.setBackground() end

---Sets the virtual button state of a device.  When no headset sesssion is active, querying the button state will return this value.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param button DeviceButton The button to change.
---@param down boolean Whether the button is pressed.
function lovr.headset.setButton(device, button, down) end

---Sets the near and far clipping planes used to render to the headset.  Objects closer than the near clipping plane or further than the far clipping plane will be clipped out of view.
---
---#### Notes:
---
---The default clip distances are 0.01 and 0.0.
---
---@param near number The distance to the near clipping plane, in meters.
---@param far number The distance to the far clipping plane, in meters, or 0 for an infinite far clipping plane with a reversed Z range.
function lovr.headset.setClipDistance(near, far) end

---Sets foveated rendering settings.  Currently only fixed foveated rendering is supported.  This renders the edges of the screen at a lower resolution to improve GPU performance.  Higher foveation levels will save more GPU time, but make the edges of the screen more blocky.
---
---#### Notes:
---
---Foveation is disabled by default.
---
---@param level FoveationLevel The foveation level (or the maximum level when dynamic foveation is active).
---@param dynamic? boolean Whether the system is allowed to dynamically adjust the foveation level based on GPU load.
---@return boolean success Whether foveation was enabled successfully.
function lovr.headset.setFoveation(level, dynamic) end

---Sets foveated rendering settings.  Currently only fixed foveated rendering is supported.  This renders the edges of the screen at a lower resolution to improve GPU performance.  Higher foveation levels will save more GPU time, but make the edges of the screen more blocky.
---
---#### Notes:
---
---Foveation is disabled by default.
---
---@return boolean success Whether foveation was enabled successfully.
function lovr.headset.setFoveation() end

---Sets the list of active `Layer` objects.  These are the layers that will be rendered in the headset's display.  They are rendered in order.
---
---#### Notes:
---
---Currently some VR systems are able to sort the layers by their Z depth, but on others layers later in the list will render on top of previous layers, regardless of depth.
---
---There is currently a maximum of 10 layers.
---
---@param ... Layer Zero or more layers to render in the headset.
function lovr.headset.setLayers(...) end

---Sets the list of active `Layer` objects.  These are the layers that will be rendered in the headset's display.  They are rendered in order.
---
---#### Notes:
---
---Currently some VR systems are able to sort the layers by their Z depth, but on others layers later in the list will render on top of previous layers, regardless of depth.
---
---There is currently a maximum of 10 layers.
---
---@param t table A table with zero or more layers starting at index 1.
function lovr.headset.setLayers(t) end

---Sets the virtual orientation of a device.  When no headset sesssion is active, getting the orientation of the device will return this orientation.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param angle number The number of radians the device is rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function lovr.headset.setOrientation(device, angle, ax, ay, az) end

---Sets the virtual orientation of a device.  When no headset sesssion is active, getting the orientation of the device will return this orientation.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param orientation quaternion The orientation of the device.
function lovr.headset.setOrientation(device, orientation) end

---Sets a new passthrough mode.  Not all headsets support all passthrough modes.  Use `lovr.headset.getPassthroughModes` to see which modes are supported.
---
---#### Notes:
---
---When using one of the transparent passthrough modes, be sure to set the alpha of the background color to zero using `lovr.graphics.setBackgroundColor`, so the background shows through.
---
---Quest Link currently requires some extra steps to enable passthrough, see [this article](https://developers.meta.com/horizon/documentation/native/android/mobile-passthrough-over-link) for details.
---
---@param mode PassthroughMode The passthrough mode to request.
---@return boolean success Whether the passthrough mode was supported and successfully enabled.
function lovr.headset.setPassthrough(mode) end

---Sets a new passthrough mode.  Not all headsets support all passthrough modes.  Use `lovr.headset.getPassthroughModes` to see which modes are supported.
---
---#### Notes:
---
---When using one of the transparent passthrough modes, be sure to set the alpha of the background color to zero using `lovr.graphics.setBackgroundColor`, so the background shows through.
---
---Quest Link currently requires some extra steps to enable passthrough, see [this article](https://developers.meta.com/horizon/documentation/native/android/mobile-passthrough-over-link) for details.
---
---@param transparent boolean Whether the headset should use a transparent passthrough mode.  When false, this will request the `opaque` mode.  When true, either `blend` or `add` will be requested, based on what the VR runtime supports.
---@return boolean success Whether the passthrough mode was supported and successfully enabled.
function lovr.headset.setPassthrough(transparent) end

---Sets a new passthrough mode.  Not all headsets support all passthrough modes.  Use `lovr.headset.getPassthroughModes` to see which modes are supported.
---
---#### Notes:
---
---When using one of the transparent passthrough modes, be sure to set the alpha of the background color to zero using `lovr.graphics.setBackgroundColor`, so the background shows through.
---
---Quest Link currently requires some extra steps to enable passthrough, see [this article](https://developers.meta.com/horizon/documentation/native/android/mobile-passthrough-over-link) for details.
---
---@return boolean success Whether the passthrough mode was supported and successfully enabled.
function lovr.headset.setPassthrough() end

---Sets the virtual pose of a device.  When no headset sesssion is active, getting the pose of the device will return this pose.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param x number The x position of the device.
---@param y number The y position of the device.
---@param z number The z position of the device.
---@param angle number The number of radians the device is rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function lovr.headset.setPose(device, x, y, z, angle, ax, ay, az) end

---Sets the virtual pose of a device.  When no headset sesssion is active, getting the pose of the device will return this pose.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param position vector The position of the device.
---@param orientation quaternion The orientation of the device.
function lovr.headset.setPose(device, position, orientation) end

---Sets the virtual position of a device.  When no headset sesssion is active, getting the position of the device will return this position.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param x number The x position of the device.
---@param y number The y position of the device.
---@param z number The z position of the device.
function lovr.headset.setPosition(device, x, y, z) end

---Sets the virtual position of a device.  When no headset sesssion is active, getting the position of the device will return this position.  This is used to implement the keyboard/mouse headset simulator in the `lovr.simulate` callback.
---
---@param device Device The device to assign the position to.
---@param position vector The position of the device.
function lovr.headset.setPosition(device, position) end

---Sets the display refresh rate, in Hz.
---
---#### Notes:
---
---Changing the display refresh-rate usually also changes the frequency of lovr.update() and lovr.draw() as they depend on the refresh rate.  However, it's ultimately up to the VR runtime to decide how often the application gets to render, based on available resources.
---
---@param rate number The new refresh rate, in Hz.
---@return boolean success Whether the display refresh rate was successfully set.
function lovr.headset.setRefreshRate(rate) end

---Starts the headset session.  This must be called after the graphics module is initialized. Normally it is called automatically by `boot.lua`, but this can be disabled by setting `t.headset.start` to false in `lovr.conf`.
---
function lovr.headset.start() end

---Stops the headset session.  This tears down the connection to the VR runtime and hardware. `lovr.draw` will instead start rendering to the desktop window, as though the headset module was disabled.  However, certain information about the headset can still be queried, such as its name, supported passthrough modes, display size, etc.  A headset session can be started later using `lovr.headset.start`.
---
---#### Notes:
---
---The headset module behaves in the following manner when there is no headset session:
---
---- `lovr.headset.isActive` returns `false`.
---- `lovr.headset.getPass` returns `nil`.
---- All devices will be untracked.
---
function lovr.headset.stop() end

---Causes the device to stop any active haptics vibration.
---
---@param device? Device The device to stop the vibration on.
function lovr.headset.stopVibration(device) end

---Submits the current headset texture to the VR display.  This should be called after calling `lovr.graphics.submit` with the headset render pass.  Normally this is taken care of by `lovr.run`.
---
function lovr.headset.submit() end

---Updates the headset module, blocking until it is time to start a new frame and polling new input states.  This should only be called once at the beginning of a frame, and is normally taken care of by the default `lovr.run` implementation.
---
---@return number dt The delta time since the last frame.  This is the same value returned by `lovr.headset.getDeltaTime`, and is used by boot.lua.
function lovr.headset.update() end

---Causes the device to vibrate with a custom strength, duration, and frequency, if possible.
---
---@param device? Device The device to vibrate.
---@param strength? number The strength of the vibration (amplitude), between 0 and 1.
---@param duration? number The duration of the vibration, in seconds.
---@param frequency? number The frequency of the vibration, in hertz.  0 will use a default frequency.
---@return boolean vibrated Whether the vibration was successfully triggered by an active headset driver.
function lovr.headset.vibrate(device, strength, duration, frequency) end

---Returns whether a button on a device was pressed this frame.
---
---#### Notes:
---
---The internal `lovr.headset.update` function updates pressed/released status.
---
---@param device Device The device.
---@param button DeviceButton The button to check.
---@return boolean pressed Whether the button on the device was pressed this frame.
function lovr.headset.wasPressed(device, button) end

---Returns whether a button on a device was released this frame.
---
---#### Notes:
---
---Some headset backends are not able to return pressed/released information.  These drivers will always return false for `lovr.headset.wasPressed` and `lovr.headset.wasReleased`.
---
---Typically the internal `lovr.headset.update` function will update pressed/released status.
---
---@param device Device The device.
---@param button DeviceButton The button to check.
---@return boolean released Whether the button on the device was released this frame.
function lovr.headset.wasReleased(device, button) end

---A Layer is a textured plane placed in 3D space.  Layers are sent directly to the VR runtime and composited along with the rest of the 3D content.  This has several advantages compared to rendering the texture into the 3D scene with `Pass:draw`:
---
---- Better tracking.  The VR runtime composites the texture later in the rendering process, using a more accurate head pose.
---- Better resolution, less shimmery.  Regular 3D content must have lens distortion correction
---  applied to it, whereas layers are composited after distortion correction, meaning they have a
---  higher pixel density.  The layer can also use a higher resolution than the main headset
---  texture, allowing for extra resolution on the 2D content without having to supersample all of
---  the 3D rendering.
---- Supersampling and sharpening effects.  Some headset runtimes (currently just Quest) can also
---  supersample and sharpen layers.
---
---Combined, all of this makes a massive difference in quality when rendering 2D content on a Layer, especially improving text readability.
---
---Note that currently the VR simulator does not support layers.
---@class Layer
local Layer = {}

---Returns the color of the layer.  This will tint the contents of its texture.  It can be used to fade the layer without re-rendering its texture, which is especially useful for layers created with the `static` option.
---
---#### Notes:
---
---The default color is white (all 1s).
---
---Not every headset system supports layer colors.  See the `layerColor` property of `lovr.headset.getFeatures` to check for support.
---
---@return number r The red component of the color.
---@return number g The green component of the color.
---@return number b The blue component of the color.
---@return number a The alpha component of the color.
function Layer:getColor() end

---Returns the curve of the layer.  Curving a layer renders it on a piece of a cylinder instead of a plane. The radius of the cylinder is `1 / curve` meters, so increasing the curve decreases the radius of the cylinder.
---
---#### Notes:
---
---When a layer is created, its curve is zero.
---
---Not every headset system supports curved layers.  See the `layerCurve` property of `lovr.headset.getFeatures` to check for support.
---
---No matter what the curve is, the center of the layer texture will always get rendered at the layer's pose.
---
---The largest possible curve is `2 * math.pi / width`, where `width` is the width of the layer in meters.  This would cause the cylinder to fully wrap around.
---
---@return number curve The curve of the layer.
function Layer:getCurve() end

---Returns the width and height of the layer.  This is the size of the Layer's plane in meters, not the resolution of the layer's texture in pixels.
---
---#### Notes:
---
---When a layer is created, its width and height are 1 meter.
---
---@return number width The width of the layer, in meters.
---@return number height The height of the layer, in meters.
function Layer:getDimensions() end

---Returns the orientation of the layer.
---
---@return number angle The amount of rotation around the axis of rotation, in radians.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Layer:getOrientation() end

---Returns the Device the layer is attached to.
---
---Normally, layer poses are in "world space", relative to the default coordinate space origin. When a layer is attached to a device, its pose is relative to the device instead.  This is useful for creating layers that are attached to a controller, or HUD elements that track the head, without having to reposition them every frame.
---
---#### Notes:
---
---Since layers are rendered by the system instead of by LÖVR, using a device for the layer will ensure it tracks the device smoothly even if LÖVR is rendering at a low frame rate, or if LÖVR pauses rendering temporarily.  Head-locked layers can be useful for displaying a loading icon early, while other assets are loading.
---
---@return Device device The device the layer is attached to, or `nil` if it isn't attached to a device.
function Layer:getOrigin() end

---Returns the render pass for the layer.  This can be used to render to the layer.
---
---#### Notes:
---
---This function will reset the Layer's render pass when it is called, as though `Pass:reset` was called.
---
---The Pass will have its background color cleared to the background color, set using `lovr.graphics.setBackgroundColor`.
---
---The Pass will have its view matrix set to the origin, and its projection will be set to an orthographic matrix where the top left of the texture is at the origin and the bottom right of the texture will be at `(width, height)` in pixels.
---
---@return Pass pass The layer's render pass.
---@deprecated
function Layer:getPass() end

---Returns the position and orientation of the layer.
---
---#### Notes:
---
---Units are in meters.
---
---@return number x The x position.
---@return number y The y position.
---@return number z The z position.
---@return number angle The amount of rotation around the axis of rotation, in radians.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Layer:getPose() end

---Returns the position of the layer, in meters.
---
---@return number x The x position of the layer.
---@return number y The y position of the layer.
---@return number z The z position of the layer.
function Layer:getPosition() end

---Returns the texture for the layer.  This is the texture that will be pasted onto the layer.
---
---#### Notes:
---
---This function may return a different `Texture` object each frame.  The return value should not be cached.
---
---The texture will have the `rgba8` format, with `sample` and `render` usage flags.
---
---@return Texture texture The layer's texture.
function Layer:getTexture() end

---Returns the viewport of the layer.  The viewport is a 2D region of pixels that the layer will display within its plane.
---
---@return number x The x coordinate of the upper-left corner of the viewport.
---@return number y The y coordinate of the upper-left corner of the viewport.
---@return number w The width of the viewport, in pixels.
---@return number h The height of the viewport, in pixels.
function Layer:getViewport() end

---Sets the color of the layer.  This will tint the contents of its texture.  It can be used to fade the layer without re-rendering its texture, which is especially useful for layers created with the `static` option.
---
---#### Notes:
---
---The default color is white (all 1s).
---
---Not every headset system supports layer colors.  See the `layerColor` property of `lovr.headset.getFeatures` to check for support.
---
---@param r number The red component of the color.
---@param g number The green component of the color.
---@param b number The blue component of the color.
---@param a? number The alpha component of the color.
function Layer:setColor(r, g, b, a) end

---Sets the color of the layer.  This will tint the contents of its texture.  It can be used to fade the layer without re-rendering its texture, which is especially useful for layers created with the `static` option.
---
---#### Notes:
---
---The default color is white (all 1s).
---
---Not every headset system supports layer colors.  See the `layerColor` property of `lovr.headset.getFeatures` to check for support.
---
---@param t {number} A table of 3 or 4 color components.
function Layer:setColor(t) end

---Sets the color of the layer.  This will tint the contents of its texture.  It can be used to fade the layer without re-rendering its texture, which is especially useful for layers created with the `static` option.
---
---#### Notes:
---
---The default color is white (all 1s).
---
---Not every headset system supports layer colors.  See the `layerColor` property of `lovr.headset.getFeatures` to check for support.
---
---@param hex number A hexcode.
---@param a? number The alpha component of the color.
function Layer:setColor(hex, a) end

---Sets the curve of the layer.  Curving a layer renders it on a piece of a cylinder instead of a plane. The radius of the cylinder is `1 / curve` meters, so increasing the curve decreases the radius of the cylinder.
---
---#### Notes:
---
---When a layer is created, its curve is zero.
---
---Not every headset system supports curved layers.  See the `layerCurve` property of `lovr.headset.getFeatures` to check for support.  If curved layers are not supported, this function will do nothing.
---
---No matter what the curve is, the center of the layer texture will always get rendered at the layer's pose.
---
---The largest possible curve is `2 * math.pi / width`, where `width` is the width of the layer in meters.  This would cause the cylinder to fully wrap around.
---
---@param curve? number The curve of the layer.  Negative values or zero means no curve.
function Layer:setCurve(curve) end

---Sets the width and height of the layer.  This is the size of the Layer's plane in meters, not not the resolution of the layer's texture in pixels.
---
---#### Notes:
---
---When a layer is created, its width and height are 1 meter.
---
---@param width number The width of the layer, in meters.
---@param height number The height of the layer, in meters.
function Layer:setDimensions(width, height) end

---Sets the orientation of the layer.
---
---@param angle number The amount of rotation around the axis of rotation, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Layer:setOrientation(angle, ax, ay, az) end

---Sets the orientation of the layer.
---
---@param orientation quaternion The orientation of the layer.
function Layer:setOrientation(orientation) end

---Sets the Device the layer is attached to.
---
---Normally, layer poses are in "world space", relative to the default coordinate space origin. When a layer is attached to a device, its pose is relative to the device instead.  This is useful for creating layers that are attached to a controller, or HUD elements that track the head, without having to reposition them every frame.
---
---#### Notes:
---
---Since layers are rendered by the system instead of by LÖVR, using a device for the layer will ensure it tracks the device smoothly even if LÖVR is rendering at a low frame rate, or if LÖVR pauses rendering temporarily.  Head-locked layers can be useful for displaying a loading icon early, while other assets are loading.
---
---@param device? Device The device the layer is attached to, or `nil` to make the layer world space.
function Layer:setOrigin(device) end

---Sets the position and orientation of the layer.
---
---#### Notes:
---
---Units are in meters.
---
---@param x number The x position.
---@param y number The y position.
---@param z number The z position.
---@param angle number The amount of rotation around the axis of rotation, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Layer:setPose(x, y, z, angle, ax, ay, az) end

---Sets the position and orientation of the layer.
---
---#### Notes:
---
---Units are in meters.
---
---@param position vector The position of the layer.
---@param orientation quaternion The orientation of the layer.
function Layer:setPose(position, orientation) end

---Sets the position of the layer, in meters.
---
---@param x number The x position of the layer.
---@param y number The y position of the layer.
---@param z number The z position of the layer.
function Layer:setPosition(x, y, z) end

---Sets the viewport of the layer.  The viewport is a 2D region of pixels that the layer will display within its plane.
---
---@param x number The x coordinate of the upper-left corner of the viewport.
---@param y number The y coordinate of the upper-left corner of the viewport.
---@param w number The width of the viewport, in pixels.
---@param h number The height of the viewport, in pixels.
function Layer:setViewport(x, y, w, h) end

---Different types of input devices supported by the `lovr.headset` module.
---@alias Device
---The headset.
---| "head"
---A device representing the floor, at the center of the play area.  The pose of this device in physical space will remain constant, even after recentering.
---| "floor"
---A shorthand for hand/left.
---| "left"
---A shorthand for hand/right.
---| "right"
---The left hand.
---| "hand/left"
---The right hand.
---| "hand/right"
---The left hand grip pose, used for held objects.
---| "hand/left/grip"
---The right hand grip pose, used for held objects.
---| "hand/right/grip"
---The left hand pointer pose, used for pointing or aiming.
---| "hand/left/point"
---The right hand pointer pose, used for pointing or aiming.
---| "hand/right/point"
---The left hand pinch pose between the thumb and index fingers, used for precise, close-range interactions.
---| "hand/left/pinch"
---The right hand pinch pose between the thumb and index fingers, used for precise, close-range interactions.
---| "hand/right/pinch"
---The left hand poke pose, on the tip of the index finger or in front of a controller.
---| "hand/left/poke"
---The right hand poke pose, on the tip of the index finger or in front of a controller.
---| "hand/right/poke"
---A device tracking the left elbow.
---| "elbow/left"
---A device tracking the right elbow.
---| "elbow/right"
---A device tracking the left shoulder.
---| "shoulder/left"
---A device tracking the right shoulder.
---| "shoulder/right"
---A device tracking the chest.
---| "chest"
---A device tracking the waist.
---| "waist"
---A device tracking the left knee.
---| "knee/left"
---A device tracking the right knee.
---| "knee/right"
---A device tracking the left foot or ankle.
---| "foot/left"
---A device tracking the right foot or ankle.
---| "foot/right"
---A camera device, often used for recording "mixed reality" footage.
---| "camera"
---A tracked keyboard.
---| "keyboard"
---A tracked pen or pointer.
---| "stylus"
---The left eye.
---| "eye/left"
---The right eye.
---| "eye/right"
---The combined eye gaze pose.  The position is between the eyes.  The orientation aligns the
----Z axis in the direction the user is looking and the +Y axis to the head's "up" vector. This provides more accurate eye tracking information compared to using the individual eye devices.
---| "eye/gaze"
---The `body` device used for full-body tracking with `lovr.headset.getSkeleton`.
---| "body"

---Axes on an input device.
---@alias DeviceAxis
---A trigger (1D).
---| "trigger"
---A thumbstick (2D).
---| "thumbstick"
---A rest (1D, pressure sensitivity, also available as a `DeviceButton`).
---| "thumbrest"
---A touchpad (2D).
---| "touchpad"
---A grip button or grab gesture (1D).
---| "grip"
---The pressure sensitivity of the nib (tip) of a `stylus` device.  Also available on the `hand/left` and `hand/right` devices for the stylus nibs on touch pro controllers.
---| "nib"

---Buttons on an input device.
---@alias DeviceButton
---The trigger button.
---| "trigger"
---The thumbstick.
---| "thumbstick"
---The thumbrest.
---| "thumbrest"
---The thumbtap button (hand tracking gesture).
---| "thumbtap"
---The touchpad.
---| "touchpad"
---The grip button.
---| "grip"
---The menu button.
---| "menu"
---The A button.
---| "a"
---The B button.
---| "b"
---The X button.
---| "x"
---The Y button.
---| "y"
---The up button on a dpad, or a hand tracking thumb swipe gesture.
---| "dpup"
---The down button on a dpad, or a hand tracking thumb swipe gesture.
---| "dpdown"
---The left button on a dpad, or a hand tracking thumb swipe gesture.
---| "dpleft"
---The right button on a dpad, or a hand tracking thumb swipe gesture.
---| "dpright"
---The bumper or shoulder button (usually located above a trigger).
---| "bumper"
---The nib (tip) of the `stylus` device.  Also available on `hand/left` and `hand/right` devices for the stylus tips on touch pro controllers.
---| "nib"

---The different levels of foveation supported by `lovr.headset.setFoveation`.
---@alias FoveationLevel
---Low foveation.
---| "low"
---Medium foveation.
---| "medium"
---High foveation.
---| "high"

---These are all of the supported VR APIs that LÖVR can use to power the lovr.headset module.  You can change the order of headset drivers using `lovr.conf` to prefer or exclude specific VR APIs.
---
---At startup, LÖVR searches through the list of drivers in order.
---@alias HeadsetDriver
---A VR simulator using keyboard/mouse.
---| "simulator"
---OpenXR.
---| "openxr"

---Represents the different types of origins for coordinate spaces.  An origin of "floor" means that the origin is on the floor in the middle of a room-scale play area.  An origin of "head" means that no positional tracking is available, and consequently the origin is always at the position of the headset.
---@alias HeadsetOrigin
---The origin is at the head.
---| "head"
---The origin is on the floor.
---| "floor"

---Different passthrough modes, set using `lovr.headset.setPassthrough`.
---
---For best results, the `blend` and `add` modes should use a transparent background color, which can be changed with `lovr.graphics.setBackgroundColor`.
---@alias PassthroughMode
---The headset display will not blend with anything behind it.  Most VR headsets use this mode.
---| "opaque"
---The real world will blend with the headset display using the alpha channel.  This is supported on VR headsets with camera passthrough, as well as some AR displays.
---| "blend"
---Color values from virtual content will be added to the real world.  This is the most common mode used for AR.  Notably, black pixels will not show up at all.
---| "add"
