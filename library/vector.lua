---@meta

---The vector module implements a 3D vector type.  Vectors are useful for holding multiple numbers using just a single value, and for doing 3D math.
---
---This module does not need to be required, it is in the global scope as `vector`.
---
---@class vector
---@field x number
---@field y number
---@field z number
vector = {}

---Returns the angle between two vectors.
---
---@param a vector The first vector.
---@param b vector The second vector.
---@param axis vector An axis used to determine the sign of the angle.
---@return number angle The angle between the two vectors.
function vector.angle(a, b, axis) end

---Returns the cross product of two vectors.  This is a vector that is perpendicular to both vectors.
---
---#### Notes:
---
---If the two input vectors are normalized, the cross product will be normalized as well.
---
---#### Example:
---
---```lua
---vector.cross(vector(1, 0, 0), vector(0, 1, 0)) --> vector(0, 0, 1)
---```
---
---@param a vector The first vector.
---@param b vector The second vector.
---@return vector cross A vector perpendicular to both `a` and `b`.
function vector.cross(a, b) end

---Returns the distance between two vectors.
---
---#### Notes:
---
---This is short for `vector.length(v1 - v2)`.
---
---#### Example:
---
---```lua
---vector.distance(vector(0, 0, 0), vector(10, 0, 0)) --> 10
---```
---
---@param a vector The first vector.
---@param b vector The second vector.
---@return number distance The distance between the two vectors.
function vector.distance(a, b) end

---Returns the dot product of two vectors.
---
---#### Notes:
---
---This is computed as `a.x * b.x + a.y * b.y + a.z * b.z`.
---
---#### Example:
---
---```lua
---vector.dot(vector(1, 2, 3), vector(3, 2, 1)) --> 10
---```
---
---@param a vector The first vector.
---@param b vector The second vector.
---@return number dot The dot product of the two vectors.
function vector.dot(a, b) end

---Returns the length of the vector.
---
---#### Notes:
---
---The length of a vector is computed as:
---
---    math.sqrt(x ^ 2 + y ^ 2 + z ^ 2)
---
---#### Example:
---
---```lua
---vector(0, 5, 0):length() --> 5
---vector(3, 4):length() --> 5
---```
---
---@return number length The length of the vector.
function vector.length() end

---Returns an interpolated vector between two vectors.
---
---@param a vector The first vector.
---@param b vector The second vector.
---@param t number The interpolation parameter.  `0.0` returns `a`, `1.0` returns `b`, `0.5` returns a vector halfway between `a` and `b`, etc.
---@return vector v The interpolated vector.
function vector.lerp(a, b, t) end

---Returns a normalized version of the input vector.  This is a vector that points in the same direction as the original, but has a length of 1.
---
---#### Notes:
---
---When given a zero-length vector, the input vector is returned unchanged.
---
---@param v vector The vector to normalize.
---@return vector normalized The normalized vector.
function vector.normalize(v) end

---Packs numbers into a vector.
---
---#### Notes:
---
---The `vector` library can be called, which is shorthand for `vector.pack`:
---
---    vector(x, y, z) -- same as vector.pack(x, y, z)
---
---#### Example:
---
---```lua
---local a = vector.pack(1, 2, 3)
---local b = vector.pack(5)
---print(a + b) --> 6, 7, 8
---
----- put the 3 numbers from lovr.headset.getPosition into a vector!
---local position = vector(lovr.headset.getPosition())
---```
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
function vector.pack(x, y, z) end

---Packs numbers into a vector.
---
---#### Notes:
---
---The `vector` library can be called, which is shorthand for `vector.pack`:
---
---    vector(x, y, z) -- same as vector.pack(x, y, z)
---
---#### Example:
---
---```lua
---local a = vector.pack(1, 2, 3)
---local b = vector.pack(5)
---print(a + b) --> 6, 7, 8
---
----- put the 3 numbers from lovr.headset.getPosition into a vector!
---local position = vector(lovr.headset.getPosition())
---```
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
function vector.pack(n) end

---Rotates the vector by a quaternion, returning a new rotated vector.
---
---@param v vector The vector to rotate.
---@param q quaternion The rotation.
---@return number v The rotated vector.
---@deprecated
function vector.rotate(v, q) end

---Returns the components of the vector as numbers.
---
---#### Example:
---
---```lua
---local x, y, z = vector(1, 2, 3):unpack()
---```
---
---@param v vector The vector to unpack.
---@return number x The x component of the vector.
---@return number y The y component of the vector.
---@return number z The z component of the vector.
function vector.unpack(v) end
