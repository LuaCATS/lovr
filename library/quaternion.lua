---@meta

---The quaternion module contains...quaternions, which are a useful way of storing 3D rotations.
---
---This module does not need to be required, it is in the global scope as `quaternion`.
---
---@class quaternion
---@field x number
---@field y number
---@field z number
---@field w number
quaternion = {}

---Returns a quaternion that rotates `angle` radians around an axis.
---
---#### Notes:
---
---The `quaternion` library can be called, which is shorthand for `quaternion.angleaxis`:
---
---    quaternion(angle, ax, ay, az) -- same as quaternion.angleaxis(angle, ax, ay, az)
---
---#### Example:
---
---```lua
---local q = quaternion(lovr.headset.getOrientation())`
---```
---
---@param angle number The number of radians the quaternion will rotate around the axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@return quaternion q The new quaternion.  It will be normalized.
function quaternion.angleaxis(angle, ax, ay, az) end

---Returns a quaternion that rotates between two direction vectors.
---
---For correct results, the direction vectors should be normalized.
---
---@param a vector The first direction.
---@param b vector The second direction.
---@return quaternion q A quaternion that rotates from `a` to `b`.
function quaternion.between(a, b) end

---Returns the conjugate, or inverse, of a quaternion.  This is a quaternion that does the opposite rotation of the original.
---
---#### Notes:
---
---This is shorthand for `quaternion(-q.x, -q.y, -q.z, q.w)`.
---
---@param q quaternion The quaternion to invert.
---@return quaternion r The conjugate of the quaternion.
function quaternion.conjugate(q) end

---Returns the direction of a quaternion.  It can also be thought of as rotating the forward vector by this quaternion.
---
---#### Example:
---
---```lua
---local dir = quaternion(collider:getOrientation()):direction()
---```
---
---@param q quaternion The quaternion to get the direction of.
---@return vector direction The direction this quaternion "faces".  It will be normalized.
function quaternion.direction(q) end

---Creates a quaternion from euler angles.  The rotation order is YXZ.
---
---@param pitch number The pitch (x axis rotation), in radians.
---@param yaw number The yaw (y axis rotation), in radians.
---@param roll number The roll (z axis rotation), in radians.
---@return quaternion q The new quaternion.  It will be normalized.
function quaternion.euler(pitch, yaw, roll) end

---Returns a quaternion that looks in a direction.  More accurately, it returns a quaternion that rotates from the forward vector (0, 0, -1) to a given direction.
---
---The `up` vector is used to control the "roll" of the orientation, since there are an infinite number of orientations that look in a given direction.
---
---#### Example:
---
---This is very useful for rotating an object to face a target.
---
---```lua
---local origin = vector(x, y, z) -- the position of the object
---local target = vector(tx, ty, tz) -- what it should look at
---
---local rotation = quaternion.lookdir(target - origin)
---
---pass:draw(model, origin, 1, rotation)
---```
---
---@param direction vector The direction to look towards.  It does not need to be normalized.
---@param up? number The up vector.  It does not need to be normalized.
---@return quaternion q A quaternion that rotates from the forward vector to `direction`.
function quaternion.lookdir(direction, up) end

---Packs numbers into a quaternion.  Note that these are raw quaternion components, not angle/axis.
---
---@param x number The x component of the quaternion.
---@param y number The y component of the quaternion.
---@param z number The z component of the quaternion.
---@param w number The w component of the quaternion.
---@return quaternion q The new quaternion.
function quaternion.pack(x, y, z, w) end

---Packs numbers into a quaternion.  Note that these are raw quaternion components, not angle/axis.
---
---@return quaternion q The new quaternion.
function quaternion.pack() end

---Performs spherical linear interpolation between two quaternions, returning a mix between the two.
---
---@param a quaternion The first quaternion.
---@param b vector The second quaternion.
---@param t number The interpolation parameter.  `0.0` returns `a`, `1.0` returns `b`, `0.5` returns a vector halfway between `a` and `b`, etc.
---@return quaternion q The interpolated quaternion.
function quaternion.slerp(a, b, t) end

---Returns the angle/axis representation of the quaternion, as 4 numbers.
---
---@param q quaternion The quaternion.
---@return number angle The number of radians the quaternion rotates around the axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function quaternion.toangleaxis(q) end

---Returns the euler angles of the quaternion, in YXZ order.
---
---@param q quaternion The quaternion.
---@return number pitch The pitch (x axis rotation), in radians.
---@return number yaw The yaw (y axis rotation), in radians.
---@return number roll The roll (z axis rotation), in radians.
function quaternion.toeuler(q) end

---Returns the components of the quaternion as numbers.  Note that these are the raw components, not angle/axis.
---
---#### Example:
---
---```lua
---local x, y, z, w = quaternion.pack(1, 2, 3, 4):unpack()
---```
---
---@param q quaternion The quaternion to unpack.
---@return number x The x component of the quaternion.
---@return number y The y component of the quaternion.
---@return number z The z component of the quaternion.
---@return number w The w component of the quaternion.
function quaternion.unpack(q) end
