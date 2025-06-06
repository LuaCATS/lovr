---@meta

---The `lovr.math` module provides math helpers commonly used for 3D applications.
---
---@class lovr.math
lovr.math = {}

---Drains the temporary vector pool, invalidating existing temporary vectors.
---
---This is called automatically at the end of each frame.
---
function lovr.math.drain() end

---Converts a color from gamma space to linear space.
---
---@param gr number The red component of the gamma-space color.
---@param gg number The green component of the gamma-space color.
---@param gb number The blue component of the gamma-space color.
---@return number lr The red component of the resulting linear-space color.
---@return number lg The green component of the resulting linear-space color.
---@return number lb The blue component of the resulting linear-space color.
function lovr.math.gammaToLinear(gr, gg, gb) end

---Converts a color from gamma space to linear space.
---
---@param color table A table containing the components of a gamma-space color.
---@return number lr The red component of the resulting linear-space color.
---@return number lg The green component of the resulting linear-space color.
---@return number lb The blue component of the resulting linear-space color.
function lovr.math.gammaToLinear(color) end

---Converts a color from gamma space to linear space.
---
---@param x number The color channel to convert.
---@return number y The converted color channel.
function lovr.math.gammaToLinear(x) end

---Get the seed used to initialize the random generator.
---
---@return number seed The new seed.
function lovr.math.getRandomSeed() end

---Converts a color from linear space to gamma space.
---
---@param lr number The red component of the linear-space color.
---@param lg number The green component of the linear-space color.
---@param lb number The blue component of the linear-space color.
---@return number gr The red component of the resulting gamma-space color.
---@return number gg The green component of the resulting gamma-space color.
---@return number gb The blue component of the resulting gamma-space color.
function lovr.math.linearToGamma(lr, lg, lb) end

---Converts a color from linear space to gamma space.
---
---@param color table A table containing the components of a linear-space color.
---@return number gr The red component of the resulting gamma-space color.
---@return number gg The green component of the resulting gamma-space color.
---@return number gb The blue component of the resulting gamma-space color.
function lovr.math.linearToGamma(color) end

---Converts a color from linear space to gamma space.
---
---@param x number The color channel to convert.
---@return number y The converted color channel.
function lovr.math.linearToGamma(x) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@return Mat4 m The new matrix.
function lovr.math.mat4() end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param n Mat4 An existing matrix to copy the values from.
---@return Mat4 m The new matrix.
function lovr.math.mat4(n) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? Vec3 The translation of the matrix.
---@param scale? Vec3 The scale of the matrix.
---@param rotation? Quat The rotation of the matrix.
---@return Mat4 m The new matrix.
function lovr.math.mat4(position, scale, rotation) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? Vec3 The translation of the matrix.
---@param rotation? Quat The rotation of the matrix.
---@return Mat4 m The new matrix.
function lovr.math.mat4(position, rotation) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param ... number 16 numbers to use as the raw values of the matrix (column-major).
---@return Mat4 m The new matrix.
function lovr.math.mat4(...) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param d number A number to use for the diagonal elements.
---@return Mat4 m The new matrix.
function lovr.math.mat4(d) end

---Creates a new `Curve` from a list of control points.
---
---@param x number The x coordinate of the first control point.
---@param y number The y coordinate of the first control point.
---@param z number The z coordinate of the first control point.
---@param ... any Additional control points.
---@return Curve curve The new Curve.
function lovr.math.newCurve(x, y, z, ...) end

---Creates a new `Curve` from a list of control points.
---
---@param v Vec3 The first control point.
---@param ... any Additional control points.
---@return Curve curve The new Curve.
function lovr.math.newCurve(v, ...) end

---Creates a new `Curve` from a list of control points.
---
---@param points table A table of control points, formatted as numbers or `Vec3` objects.
---@return Curve curve The new Curve.
function lovr.math.newCurve(points) end

---Creates a new `Curve` from a list of control points.
---
---@param n number The number of points to reserve for the Curve.
---@return Curve curve The new Curve.
function lovr.math.newCurve(n) end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@return Mat4 m The new matrix.
function lovr.math.newMat4() end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param n Mat4 An existing matrix to copy the values from.
---@return Mat4 m The new matrix.
function lovr.math.newMat4(n) end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? Vec3 The translation of the matrix.
---@param scale? Vec3 The scale of the matrix.
---@param rotation? Quat The rotation of the matrix.
---@return Mat4 m The new matrix.
function lovr.math.newMat4(position, scale, rotation) end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? Vec3 The translation of the matrix.
---@param rotation? Quat The rotation of the matrix.
---@return Mat4 m The new matrix.
function lovr.math.newMat4(position, rotation) end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param ... number 16 numbers to use as the raw values of the matrix (column-major).
---@return Mat4 m The new matrix.
function lovr.math.newMat4(...) end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param d number A number to use for the diagonal elements.
---@return Mat4 m The new matrix.
function lovr.math.newMat4(d) end

---Creates a new quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param angle? number An angle to use for the rotation, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param raw? boolean Whether the components should be interpreted as raw `(x, y, z, w)` components.
---@return Quat q The new quaternion.
function lovr.math.newQuat(angle, ax, ay, az, raw) end

---Creates a new quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param r Quat An existing quaternion to copy the values from.
---@return Quat q The new quaternion.
function lovr.math.newQuat(r) end

---Creates a new quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param v Vec3 A normalized direction vector.
---@return Quat q The new quaternion.
function lovr.math.newQuat(v) end

---Creates a new quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param v Vec3 A normalized direction vector.
---@param u Vec3 Another normalized direction vector.
---@return Quat q The new quaternion.
function lovr.math.newQuat(v, u) end

---Creates a new quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param m Mat4 A matrix to use the rotation from.
---@return Quat q The new quaternion.
function lovr.math.newQuat(m) end

---Creates a new quaternion.  This function takes the same arguments as `Quat:set`.
---
---@return Quat q The new quaternion.
function lovr.math.newQuat() end

---Creates a new `RandomGenerator`, which can be used to generate random numbers. If you just want some random numbers, you can use `lovr.math.random`. Individual RandomGenerator objects are useful if you need more control over the random sequence used or need a random generator isolated from other instances.
---
---@return RandomGenerator randomGenerator The new RandomGenerator.
function lovr.math.newRandomGenerator() end

---Creates a new `RandomGenerator`, which can be used to generate random numbers. If you just want some random numbers, you can use `lovr.math.random`. Individual RandomGenerator objects are useful if you need more control over the random sequence used or need a random generator isolated from other instances.
---
---@param seed number The initial seed for the RandomGenerator.
---@return RandomGenerator randomGenerator The new RandomGenerator.
function lovr.math.newRandomGenerator(seed) end

---Creates a new `RandomGenerator`, which can be used to generate random numbers. If you just want some random numbers, you can use `lovr.math.random`. Individual RandomGenerator objects are useful if you need more control over the random sequence used or need a random generator isolated from other instances.
---
---@param low number The lower 32 bits of the seed.
---@param high number The upper 32 bits of the seed.
---@return RandomGenerator randomGenerator The new RandomGenerator.
function lovr.math.newRandomGenerator(low, high) end

---Creates a new 2D vector.  This function takes the same arguments as `Vec2:set`.
---
---@param x? number The x value of the vector.
---@param y? number The y value of the vector.
---@return Vec2 v The new vector.
function lovr.math.newVec2(x, y) end

---Creates a new 2D vector.  This function takes the same arguments as `Vec2:set`.
---
---@param u Vec2 A vector to copy the values from.
---@return Vec2 v The new vector.
function lovr.math.newVec2(u) end

---Creates a new 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param x? number The x value of the vector.
---@param y? number The y value of the vector.
---@param z? number The z value of the vector.
---@return Vec3 v The new vector.
function lovr.math.newVec3(x, y, z) end

---Creates a new 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param u Vec3 A vector to copy the values from.
---@return Vec3 v The new vector.
function lovr.math.newVec3(u) end

---Creates a new 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param m Mat4 A matrix to use the position of.
---@return Vec3 v The new vector.
function lovr.math.newVec3(m) end

---Creates a new 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param q Quat A quat to use the direction of.
---@return Vec3 v The new vector.
function lovr.math.newVec3(q) end

---Creates a new 4D vector.  This function takes the same arguments as `Vec4:set`.
---
---@param x? number The x value of the vector.
---@param y? number The y value of the vector.
---@param z? number The z value of the vector.
---@param w? number The w value of the vector.
---@return Vec4 v The new vector.
function lovr.math.newVec4(x, y, z, w) end

---Creates a new 4D vector.  This function takes the same arguments as `Vec4:set`.
---
---@param u Vec4 A vector to copy the values from.
---@return Vec4 v The new vector.
function lovr.math.newVec4(u) end

---Returns a 1D, 2D, 3D, or 4D simplex noise value.  The number will be between 0 and 1.
---
---@param x number The x coordinate of the input.
---@return number noise The noise value, between 0 and 1.
function lovr.math.noise(x) end

---Returns a 1D, 2D, 3D, or 4D simplex noise value.  The number will be between 0 and 1.
---
---@param x number The x coordinate of the input.
---@param y number The y coordinate of the input.
---@return number noise The noise value, between 0 and 1.
function lovr.math.noise(x, y) end

---Returns a 1D, 2D, 3D, or 4D simplex noise value.  The number will be between 0 and 1.
---
---@param x number The x coordinate of the input.
---@param y number The y coordinate of the input.
---@param z number The z coordinate of the input.
---@return number noise The noise value, between 0 and 1.
function lovr.math.noise(x, y, z) end

---Returns a 1D, 2D, 3D, or 4D simplex noise value.  The number will be between 0 and 1.
---
---@param x number The x coordinate of the input.
---@param y number The y coordinate of the input.
---@param z number The z coordinate of the input.
---@param w number The w coordinate of the input.
---@return number noise The noise value, between 0 and 1.
function lovr.math.noise(x, y, z, w) end

---Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param angle? number An angle to use for the rotation, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param raw? boolean Whether the components should be interpreted as raw `(x, y, z, w)` components.
---@return Quat q The new quaternion.
function lovr.math.quat(angle, ax, ay, az, raw) end

---Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param r Quat An existing quaternion to copy the values from.
---@return Quat q The new quaternion.
function lovr.math.quat(r) end

---Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param v Vec3 A normalized direction vector.
---@return Quat q The new quaternion.
function lovr.math.quat(v) end

---Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param v Vec3 A normalized direction vector.
---@param u Vec3 Another normalized direction vector.
---@return Quat q The new quaternion.
function lovr.math.quat(v, u) end

---Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
---
---@param m Mat4 A matrix to use the rotation from.
---@return Quat q The new quaternion.
function lovr.math.quat(m) end

---Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
---
---@return Quat q The new quaternion.
function lovr.math.quat() end

---Returns a uniformly distributed pseudo-random number.  This function has improved randomness over Lua's `math.random` and also guarantees that the sequence of random numbers will be the same on all platforms (given the same seed).
---
---#### Notes:
---
---You can set the random seed using `lovr.math.setRandomSeed`.
---
---@return number x A pseudo-random number.
function lovr.math.random() end

---Returns a uniformly distributed pseudo-random number.  This function has improved randomness over Lua's `math.random` and also guarantees that the sequence of random numbers will be the same on all platforms (given the same seed).
---
---#### Notes:
---
---You can set the random seed using `lovr.math.setRandomSeed`.
---
---@param high number The maximum number to generate.
---@return number x A pseudo-random number.
function lovr.math.random(high) end

---Returns a uniformly distributed pseudo-random number.  This function has improved randomness over Lua's `math.random` and also guarantees that the sequence of random numbers will be the same on all platforms (given the same seed).
---
---#### Notes:
---
---You can set the random seed using `lovr.math.setRandomSeed`.
---
---@param low number The minimum number to generate.
---@param high number The maximum number to generate.
---@return number x A pseudo-random number.
function lovr.math.random(low, high) end

---Returns a pseudo-random number from a normal distribution (a bell curve).  You can control the center of the bell curve (the mean value) and the overall width (sigma, or standard deviation).
---
---@param sigma? number The standard deviation of the distribution.  This can be thought of how "wide" the range of numbers is or how much variability there is.
---@param mu? number The average value returned.
---@return number x A normally distributed pseudo-random number.
function lovr.math.randomNormal(sigma, mu) end

---Seed the random generator with a new seed.  Each seed will cause `lovr.math.random` and `lovr.math.randomNormal` to produce a unique sequence of random numbers.  This is done once automatically at startup by `lovr.run`.
---
---@param seed number The new seed.
function lovr.math.setRandomSeed(seed) end

---Creates a temporary 2D vector.  This function takes the same arguments as `Vec2:set`.
---
---@param x? number The x value of the vector.
---@param y? number The y value of the vector.
---@return Vec2 v The new vector.
function lovr.math.vec2(x, y) end

---Creates a temporary 2D vector.  This function takes the same arguments as `Vec2:set`.
---
---@param u Vec2 A vector to copy the values from.
---@return Vec2 v The new vector.
function lovr.math.vec2(u) end

---Creates a temporary 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param x? number The x value of the vector.
---@param y? number The y value of the vector.
---@param z? number The z value of the vector.
---@return Vec3 v The new vector.
function lovr.math.vec3(x, y, z) end

---Creates a temporary 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param u Vec3 A vector to copy the values from.
---@return Vec3 v The new vector.
function lovr.math.vec3(u) end

---Creates a temporary 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param m Mat4 A matrix to use the position of.
---@return Vec3 v The new vector.
function lovr.math.vec3(m) end

---Creates a temporary 3D vector.  This function takes the same arguments as `Vec3:set`.
---
---@param q Quat A quat to use the direction of.
---@return Vec3 v The new vector.
function lovr.math.vec3(q) end

---Creates a temporary 4D vector.  This function takes the same arguments as `Vec4:set`.
---
---@param x? number The x value of the vector.
---@param y? number The y value of the vector.
---@param z? number The z value of the vector.
---@param w? number The w value of the vector.
---@return Vec4 v The new vector.
function lovr.math.vec4(x, y, z, w) end

---Creates a temporary 4D vector.  This function takes the same arguments as `Vec4:set`.
---
---@param u Vec4 A vector to copy the values from.
---@return Vec4 v The new vector.
function lovr.math.vec4(u) end

---A Curve is an object that represents a Bézier curve in three dimensions.  Curves are defined by an arbitrary number of control points (note that the curve only passes through the first and last control point).
---
---Once a Curve is created with `lovr.math.newCurve`, you can use `Curve:evaluate` to get a point on the curve or `Curve:render` to get a list of all of the points on the curve.  These points can be passed directly to `Pass:points` or `Pass:line` to render the curve.
---
---Note that for longer or more complicated curves (like in a drawing application) it can be easier to store the path as several Curve objects.
---@class Curve
local Curve = {}

---Inserts a new control point into the Curve at the specified index.
---
---#### Notes:
---
---An error will be thrown if the index is less than one or more than the number of control points.
---
---@param x number The x coordinate of the control point.
---@param y number The y coordinate of the control point.
---@param z number The z coordinate of the control point.
---@param index? number The index to insert the control point at.  If nil, the control point is added to the end of the list of control points.
function Curve:addPoint(x, y, z, index) end

---Returns a point on the Curve given a parameter `t` from 0 to 1.  0 will return the first control point, 1 will return the last point, .5 will return a point in the "middle" of the Curve, etc.
---
---#### Notes:
---
---An error will be thrown if `t` is not between 0 and 1, or if the Curve has less than two points.
---
---@param t number The parameter to evaluate the Curve at.
---@return number x The x position of the point.
---@return number y The y position of the point.
---@return number z The z position of the point.
function Curve:evaluate(t) end

---Returns a control point of the Curve.
---
---#### Notes:
---
---An error will be thrown if the index is less than one or more than the number of control points.
---
---@param index number The index to retrieve.
---@return number x The x coordinate of the control point.
---@return number y The y coordinate of the control point.
---@return number z The z coordinate of the control point.
function Curve:getPoint(index) end

---Returns the number of control points in the Curve.
---
---@return number count The number of control points.
function Curve:getPointCount() end

---Returns a direction vector for the Curve given a parameter `t` from 0 to 1.  0 will return the direction at the first control point, 1 will return the direction at the last point, .5 will return the direction at the "middle" of the Curve, etc.
---
---#### Notes:
---
---The direction vector returned by this function will have a length of one.
---
---@param t number Where on the Curve to compute the direction.
---@return number x The x position of the point.
---@return number y The y position of the point.
---@return number z The z position of the point.
function Curve:getTangent(t) end

---Removes a control point from the Curve.
---
---#### Notes:
---
---An error will be thrown if the index is less than one or more than the number of control points.
---
---@param index number The index of the control point to remove.
function Curve:removePoint(index) end

---Returns a list of points on the Curve.  The number of points can be specified to get a more or less detailed representation, and it is also possible to render a subsection of the Curve.
---
---#### Notes:
---
---This function will always return 2 points if the Curve is a line with only 2 control points.
---
---@param n? number The number of points to use.
---@param t1? number How far along the curve to start rendering.
---@param t2? number How far along the curve to stop rendering.
---@return table t A (flat) table of 3D points along the curve.
function Curve:render(n, t1, t2) end

---Changes the position of a control point on the Curve.
---
---#### Notes:
---
---An error will be thrown if the index is less than one or more than the number of control points.
---
---@param index number The index to modify.
---@param x number The new x coordinate.
---@param y number The new y coordinate.
---@param z number The new z coordinate.
function Curve:setPoint(index, x, y, z) end

---Returns a new Curve created by slicing the Curve at the specified start and end points.
---
---#### Notes:
---
---The new Curve will have the same number of control points as the existing curve.
---
---An error will be thrown if t1 or t2 are not between 0 and 1, or if the Curve has less than two points.
---
---@param t1 number The starting point to slice at.
---@param t2 number The ending point to slice at.
---@return Curve curve A new Curve.
function Curve:slice(t1, t2) end

---A `mat4` is a math type that holds 16 values in a 4x4 grid.
---@class Mat4
local Mat4 = {}

---Returns whether a matrix is approximately equal to another matrix.
---
---@param n Mat4 The other matrix.
---@return boolean equal Whether the 2 matrices approximately equal each other.
function Mat4:equals(n) end

---Sets a projection matrix using raw projection angles and clipping planes.
---
---This can be used for asymmetric or oblique projections.
---
---@param left number The left half-angle of the projection, in radians.
---@param right number The right half-angle of the projection, in radians.
---@param up number The top half-angle of the projection, in radians.
---@param down number The bottom half-angle of the projection, in radians.
---@param near number The near plane of the projection.
---@param far? number The far plane.  Zero is a special value that will set an infinite far plane with a reversed Z range, which improves depth buffer precision and is the default.
---@return Mat4 self The modified matrix.
function Mat4:fov(left, right, up, down, near, far) end

---Returns the angle/axis rotation of the matrix.
---
---@return number angle The number of radians the matrix rotates around its rotation axis.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Mat4:getOrientation() end

---Returns the position and rotation of the matrix.
---
---@return number x The x translation.
---@return number y The y translation.
---@return number z The z translation.
---@return number angle The number of radians the matrix rotates around its rotation axis.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Mat4:getPose() end

---Returns the translation of the matrix.  This is the last column of the matrix.
---
---@return number x The x translation.
---@return number y The y translation.
---@return number z The z translation.
function Mat4:getPosition() end

---Returns the scale factor of the matrix.
---
---@return number sx The x scale.
---@return number sy The y scale.
---@return number sz The z scale.
function Mat4:getScale() end

---Resets the matrix to the identity, effectively setting its translation to zero, its scale to 1, and clearing any rotation.
---
---@return Mat4 self The modified matrix.
function Mat4:identity() end

---Inverts the matrix, causing it to represent the opposite of its old transform.
---
---@return Mat4 self The inverted matrix.
function Mat4:invert() end

---Sets a view transform matrix that moves and orients camera to look at a target point.
---
---This is useful for changing camera position and orientation.
---
---The lookAt() function produces same result as target() after matrix inversion.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  pass:setViewPose(1, mat4():lookAt(cameraPos, playerPos), true)
---
---  -- draw scene
---end
---```
---
---@param from Vec3 The position of the viewer.
---@param to Vec3 The position of the target.
---@param up? Vec3 The up vector of the viewer.
---@return Mat4 self The modified matrix.
function Mat4:lookAt(from, to, up) end

---Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns the vector.
---
---#### Notes:
---
---When multiplying by a vec4, the vector is treated as either a point if its w component is 1, or a direction vector if the w is 0 (the matrix translation won't be applied).
---
---@param n Mat4 The matrix.
---@return Mat4 self The modified matrix.
function Mat4:mul(n) end

---Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns the vector.
---
---#### Notes:
---
---When multiplying by a vec4, the vector is treated as either a point if its w component is 1, or a direction vector if the w is 0 (the matrix translation won't be applied).
---
---@param v3 Vec3 A 3D vector, treated as a point.
---@return Vec3 v3 The transformed vector.
function Mat4:mul(v3) end

---Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns the vector.
---
---#### Notes:
---
---When multiplying by a vec4, the vector is treated as either a point if its w component is 1, or a direction vector if the w is 0 (the matrix translation won't be applied).
---
---@param v4 Vec4 A 4D vector.
---@return Vec4 v4 The transformed vector.
function Mat4:mul(v4) end

---Sets this matrix to represent an orthographic projection, useful for 2D/isometric rendering.
---
---This can be used with `Pass:setProjection`, or it can be sent to a `Shader` for use in GLSL.
---
---@param left number The left edge of the projection.
---@param right number The right edge of the projection.
---@param bottom number The bottom edge of the projection.
---@param top number The top edge of the projection.
---@param near number The position of the near clipping plane.
---@param far number The position of the far clipping plane.
---@return Mat4 self The modified matrix.
function Mat4:orthographic(left, right, bottom, top, near, far) end

---Sets this matrix to represent an orthographic projection, useful for 2D/isometric rendering.
---
---This can be used with `Pass:setProjection`, or it can be sent to a `Shader` for use in GLSL.
---
---@param width number The width of the projection.
---@param height number The height of the projection.
---@param near number The position of the near clipping plane.
---@param far number The position of the far clipping plane.
---@return Mat4 self The modified matrix.
function Mat4:orthographic(width, height, near, far) end

---Sets this matrix to represent a perspective projection.
---
---This can be used with `Pass:setProjection`, or it can be sent to a `Shader` for use in GLSL.
---
---@param fov number The vertical field of view (in radians).
---@param aspect number The horizontal aspect ratio of the projection (width / height).
---@param near number The near plane.
---@param far? number The far plane.  Zero is a special value that will set an infinite far plane with a reversed Z range, which improves depth buffer precision and is the default.
---@return Mat4 self The modified matrix.
function Mat4:perspective(fov, aspect, near, far) end

---Turns the matrix into a reflection matrix that transforms values as though they were reflected across a plane.
---
---@param position Vec3 The position of the plane.
---@param normal Vec3 The normal vector of the plane.
---@return Mat4 self The reflected matrix.
function Mat4:reflect(position, normal) end

---Rotates the matrix using a quaternion or an angle/axis rotation.
---
---@param q Quat The rotation to apply to the matrix.
---@return Mat4 self The rotated matrix.
function Mat4:rotate(q) end

---Rotates the matrix using a quaternion or an angle/axis rotation.
---
---@param angle number The angle component of the angle/axis rotation (radians).
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@return Mat4 self The rotated matrix.
function Mat4:rotate(angle, ax, ay, az) end

---Scales the matrix.
---
---@param scale Vec3 The 3D scale to apply.
---@return Mat4 self The modified matrix.
function Mat4:scale(scale) end

---Scales the matrix.
---
---@param sx number The x component of the scale to apply.
---@param sy? number The y component of the scale to apply.
---@param sz? number The z component of the scale to apply.
---@return Mat4 self The modified matrix.
function Mat4:scale(sx, sy, sz) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@return Mat4 m The input matrix.
function Mat4:set() end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param n Mat4 An existing matrix to copy the values from.
---@return Mat4 m The input matrix.
function Mat4:set(n) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param x number The x component of the translation.
---@param y number The y component of the translation.
---@param z number The z component of the translation.
---@param sx number The x component of the scale.
---@param sy number The y component of the scale.
---@param sz number The z component of the scale.
---@param angle number The angle of the rotation, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@return Mat4 m The input matrix.
function Mat4:set(x, y, z, sx, sy, sz, angle, ax, ay, az) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param x number The x component of the translation.
---@param y number The y component of the translation.
---@param z number The z component of the translation.
---@param angle number The angle of the rotation, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@return Mat4 m The input matrix.
function Mat4:set(x, y, z, angle, ax, ay, az) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param position Vec3 The translation of the matrix.
---@param scale Vec3 The scale of the matrix.
---@param rotation Quat The rotation of the matrix.
---@return Mat4 m The input matrix.
function Mat4:set(position, scale, rotation) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param position Vec3 The translation of the matrix.
---@param rotation Quat The rotation of the matrix.
---@return Mat4 m The input matrix.
function Mat4:set(position, rotation) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param ... number The raw values of the matrix, in column-major order.
---@return Mat4 m The input matrix.
function Mat4:set(...) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param d number A number to use for the diagonal elements.
---@return Mat4 m The input matrix.
function Mat4:set(d) end

---Sets a model transform matrix that moves to `from` and orients model towards `to` point.
---
---This is used when rendered model should always point towards a point of interest. The resulting Mat4 object can be used as model pose.
---
---The target() function produces same result as lookAt() after matrix inversion.
---
---@param from Vec3 The position of the viewer.
---@param to Vec3 The position of the target.
---@param up? Vec3 The up vector of the viewer.
---@return Mat4 self The modified matrix.
function Mat4:target(from, to, up) end

---Translates the matrix.
---
---@param v Vec3 The translation vector.
---@return Mat4 self The translated matrix.
function Mat4:translate(v) end

---Translates the matrix.
---
---@param x number The x component of the translation.
---@param y number The y component of the translation.
---@param z number The z component of the translation.
---@return Mat4 self The translated matrix.
function Mat4:translate(x, y, z) end

---Transposes the matrix, mirroring its values along the diagonal.
---
---@return Mat4 self The transposed matrix.
function Mat4:transpose() end

---Returns the components of matrix, either as 10 separated numbers representing the position, scale, and rotation, or as 16 raw numbers representing the individual components of the matrix in column-major order.
---
---@param raw? boolean Whether to return the 16 raw components.
---@return number ... The requested components of the matrix.
function Mat4:unpack(raw) end

---A `quat` is a math type that represents a 3D rotation, stored as four numbers.
---@class Quat
local Quat = {}

---Conjugates the input quaternion in place, returning the input.  If the quaternion is normalized, this is the same as inverting it.  It negates the (x, y, z) components of the quaternion.
---
---@return Quat self The inverted quaternion.
function Quat:conjugate() end

---Creates a new temporary vec3 facing the forward direction, rotates it by this quaternion, and returns the vector.
---
---@return Vec3 v The direction vector.
function Quat:direction() end

---Returns whether a quaternion is approximately equal to another quaternion.
---
---@param r Quat The other quaternion.
---@return boolean equal Whether the 2 quaternions approximately equal each other.
function Quat:equals(r) end

---Returns the euler angles of the quaternion, in YXZ order.
---
---@return number pitch The pitch (x axis rotation).
---@return number yaw The yaw (y axis rotation).
---@return number roll The roll (z axis rotation).
function Quat:getEuler() end

---Returns the length of the quaternion.
---
---@return number length The length of the quaternion.
function Quat:length() end

---Multiplies this quaternion by another value.  If the value is a quaternion, the rotations in the two quaternions are applied sequentially and the result is stored in the first quaternion.  If the value is a vector, then the input vector is rotated by the quaternion and returned.
---
---@param r Quat A quaternion to combine with the original.
---@return Quat self The modified quaternion.
function Quat:mul(r) end

---Multiplies this quaternion by another value.  If the value is a quaternion, the rotations in the two quaternions are applied sequentially and the result is stored in the first quaternion.  If the value is a vector, then the input vector is rotated by the quaternion and returned.
---
---@param v3 Vec3 A vector to rotate.
---@return Vec3 v3 The rotated vector.
function Quat:mul(v3) end

---Adjusts the values in the quaternion so that its length becomes 1.
---
---#### Notes:
---
---A common source of bugs with quaternions is to forget to normalize them after performing a series of operations on them.  Try normalizing a quaternion if some of the calculations aren't working quite right!
---
---@return Quat self The normalized quaternion.
function Quat:normalize() end

---Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:
---
---- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.
---- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.
---- An existing quaternion can be passed in to copy its values.
---- A single direction vector can be specified to turn its direction (relative to the default
---  forward direction of "negative z") into a rotation.
---- Two direction vectors can be specified to set the quaternion equal to the rotation between the
---  two vectors.
---- A matrix can be passed in to extract the rotation of the matrix into a quaternion.
---
---@param angle? number The angle to use for the rotation, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param raw? boolean Whether the components should be interpreted as raw `(x, y, z, w)` components.
---@return Quat self The modified quaternion.
function Quat:set(angle, ax, ay, az, raw) end

---Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:
---
---- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.
---- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.
---- An existing quaternion can be passed in to copy its values.
---- A single direction vector can be specified to turn its direction (relative to the default
---  forward direction of "negative z") into a rotation.
---- Two direction vectors can be specified to set the quaternion equal to the rotation between the
---  two vectors.
---- A matrix can be passed in to extract the rotation of the matrix into a quaternion.
---
---@param r Quat An existing quaternion to copy the values from.
---@return Quat self The modified quaternion.
function Quat:set(r) end

---Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:
---
---- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.
---- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.
---- An existing quaternion can be passed in to copy its values.
---- A single direction vector can be specified to turn its direction (relative to the default
---  forward direction of "negative z") into a rotation.
---- Two direction vectors can be specified to set the quaternion equal to the rotation between the
---  two vectors.
---- A matrix can be passed in to extract the rotation of the matrix into a quaternion.
---
---@param v Vec3 A normalized direction vector.
---@return Quat self The modified quaternion.
function Quat:set(v) end

---Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:
---
---- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.
---- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.
---- An existing quaternion can be passed in to copy its values.
---- A single direction vector can be specified to turn its direction (relative to the default
---  forward direction of "negative z") into a rotation.
---- Two direction vectors can be specified to set the quaternion equal to the rotation between the
---  two vectors.
---- A matrix can be passed in to extract the rotation of the matrix into a quaternion.
---
---@param v Vec3 A normalized direction vector.
---@param u Vec3 Another normalized direction vector.
---@return Quat self The modified quaternion.
function Quat:set(v, u) end

---Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:
---
---- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.
---- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.
---- An existing quaternion can be passed in to copy its values.
---- A single direction vector can be specified to turn its direction (relative to the default
---  forward direction of "negative z") into a rotation.
---- Two direction vectors can be specified to set the quaternion equal to the rotation between the
---  two vectors.
---- A matrix can be passed in to extract the rotation of the matrix into a quaternion.
---
---@param m Mat4 A matrix to use the rotation from.
---@return Quat self The modified quaternion.
function Quat:set(m) end

---Sets the components of the quaternion.  There are lots of different ways to specify the new components, the summary is:
---
---- Four numbers can be used to specify an angle/axis rotation, similar to other LÖVR functions.
---- Four numbers plus the fifth `raw` flag can be used to set the raw values of the quaternion.
---- An existing quaternion can be passed in to copy its values.
---- A single direction vector can be specified to turn its direction (relative to the default
---  forward direction of "negative z") into a rotation.
---- Two direction vectors can be specified to set the quaternion equal to the rotation between the
---  two vectors.
---- A matrix can be passed in to extract the rotation of the matrix into a quaternion.
---
---@return Quat self The modified quaternion.
function Quat:set() end

---Sets the value of the quaternion using euler angles.  The rotation order is YXZ.
---
---@param pitch number The pitch (x axis rotation).
---@param yaw number The yaw (y axis rotation).
---@param roll number The roll (z axis rotation).
---@return Quat self The modified quaternion.
function Quat:setEuler(pitch, yaw, roll) end

---Performs a spherical linear interpolation between this quaternion and another one, which can be used for smoothly animating between two rotations.
---
---The amount of interpolation is controlled by a parameter `t`.  A `t` value of zero leaves the original quaternion unchanged, whereas a `t` of one sets the original quaternion exactly equal to the target.  A value between `0` and `1` returns a rotation between the two based on the value.
---
---@param r Quat The quaternion to slerp towards.
---@param t number The lerping parameter.
---@return Quat self The modified quaternion, containing the new lerped values.
function Quat:slerp(r, t) end

---Returns the components of the quaternion as numbers, either in an angle/axis representation or as raw quaternion values.
---
---@param raw? boolean Whether the values should be returned as raw values instead of angle/axis.
---@return number a The angle in radians, or the x value.
---@return number b The x component of the rotation axis or the y value.
---@return number c The y component of the rotation axis or the z value.
---@return number d The z component of the rotation axis or the w value.
function Quat:unpack(raw) end

---A RandomGenerator is a standalone object that can be used to independently generate pseudo-random numbers. If you just need basic randomness, you can use `lovr.math.random` without needing to create a random generator.
---@class RandomGenerator
local RandomGenerator = {}

---Returns the seed used to initialize the RandomGenerator.
---
---#### Notes:
---
---Since the seed is a 64 bit integer, each 32 bits of the seed are returned separately to avoid precision issues.
---
---@return number low The lower 32 bits of the seed.
---@return number high The upper 32 bits of the seed.
function RandomGenerator:getSeed() end

---Returns the current state of the RandomGenerator.  This can be used with `RandomGenerator:setState` to reliably restore a previous state of the generator.
---
---#### Notes:
---
---The seed represents the starting state of the RandomGenerator, whereas the state represents the current state of the generator.
---
---@return string state The serialized state.
function RandomGenerator:getState() end

---Returns the next uniformly distributed pseudo-random number from the RandomGenerator's sequence.
---
---@return number x A pseudo-random number.
function RandomGenerator:random() end

---Returns the next uniformly distributed pseudo-random number from the RandomGenerator's sequence.
---
---@param high number The maximum number to generate.
---@return number x A pseudo-random number.
function RandomGenerator:random(high) end

---Returns the next uniformly distributed pseudo-random number from the RandomGenerator's sequence.
---
---@param low number The minimum number to generate.
---@param high number The maximum number to generate.
---@return number x A pseudo-random number.
function RandomGenerator:random(low, high) end

---Returns a pseudo-random number from a normal distribution (a bell curve).  You can control the center of the bell curve (the mean value) and the overall width (sigma, or standard deviation).
---
---@param sigma? number The standard deviation of the distribution.  This can be thought of how "wide" the range of numbers is or how much variability there is.
---@param mu? number The average value returned.
---@return number x A normally distributed pseudo-random number.
function RandomGenerator:randomNormal(sigma, mu) end

---Seed the RandomGenerator with a new seed.  Each seed will cause the RandomGenerator to produce a unique sequence of random numbers.
---
---#### Notes:
---
---For precise 64 bit seeds, you should specify the lower and upper 32 bits of the seed separately. Otherwise, seeds larger than 2^53 will start to lose precision.
---
---@param seed number The random seed.
function RandomGenerator:setSeed(seed) end

---Seed the RandomGenerator with a new seed.  Each seed will cause the RandomGenerator to produce a unique sequence of random numbers.
---
---#### Notes:
---
---For precise 64 bit seeds, you should specify the lower and upper 32 bits of the seed separately. Otherwise, seeds larger than 2^53 will start to lose precision.
---
---@param low number The lower 32 bits of the seed.
---@param high number The upper 32 bits of the seed.
function RandomGenerator:setSeed(low, high) end

---Sets the state of the RandomGenerator, as previously obtained using `RandomGenerator:getState`. This can be used to reliably restore a previous state of the generator.
---
---#### Notes:
---
---The seed represents the starting state of the RandomGenerator, whereas the state represents the current state of the generator.
---
---@param state string The serialized state.
function RandomGenerator:setState(state) end

---A vector object that holds two numbers.
---@class Vec2
local Vec2 = {}

---Adds a vector or a number to the vector.
---
---@param u Vec2 The other vector.
---@return Vec2 self The modified vector.
function Vec2:add(u) end

---Adds a vector or a number to the vector.
---
---@param x number A value to add to x component.
---@param y? number A value to add to y component.
---@return Vec2 self The modified vector.
function Vec2:add(x, y) end

---Returns the angle between vectors.
---
---#### Notes:
---
---If any of the two vectors have a length of zero, the angle between them is not well defined.  In this case the function returns `math.pi / 2`.
---
---@param u Vec2 The other vector.
---@return number angle The angle to the other vector, in radians.
function Vec2:angle(u) end

---Returns the angle between vectors.
---
---#### Notes:
---
---If any of the two vectors have a length of zero, the angle between them is not well defined.  In this case the function returns `math.pi / 2`.
---
---@param x number The x component of the other vector.
---@param y number The y component of the other vector.
---@return number angle The angle to the other vector, in radians.
function Vec2:angle(x, y) end

---Returns the distance to another vector.
---
---@param u Vec2 The vector to measure the distance to.
---@return number distance The distance to `u`.
function Vec2:distance(u) end

---Returns the distance to another vector.
---
---@param x number A value of x component to measure distance to.
---@param y number A value of y component to measure distance to.
---@return number distance The distance to `u`.
function Vec2:distance(x, y) end

---Divides the vector by a vector or a number.
---
---@param u Vec2 The other vector to divide the components by.
---@return Vec2 self The modified vector.
function Vec2:div(u) end

---Divides the vector by a vector or a number.
---
---@param x number A value to divide x component by.
---@param y? number A value to divide y component by.
---@return Vec2 self The modified vector.
function Vec2:div(x, y) end

---Returns the dot product between this vector and another one.
---
---#### Notes:
---
---This is computed as:
---
---    dot = v.x * u.x + v.y * u.y
---
---The vectors are not normalized before computing the dot product.
---
---@param u Vec2 The vector to compute the dot product with.
---@return number dot The dot product between `v` and `u`.
function Vec2:dot(u) end

---Returns the dot product between this vector and another one.
---
---#### Notes:
---
---This is computed as:
---
---    dot = v.x * u.x + v.y * u.y
---
---The vectors are not normalized before computing the dot product.
---
---@param x number A value of x component to compute the dot product with.
---@param y number A value of y component to compute the dot product with.
---@return number dot The dot product between `v` and `u`.
function Vec2:dot(x, y) end

---Returns whether a vector is approximately equal to another vector.
---
---#### Notes:
---
---To handle floating point precision issues, this function returns true as long as the squared distance between the vectors is below `1e-10`.
---
---@param u Vec2 The other vector.
---@return boolean equal Whether the 2 vectors approximately equal each other.
function Vec2:equals(u) end

---Returns whether a vector is approximately equal to another vector.
---
---#### Notes:
---
---To handle floating point precision issues, this function returns true as long as the squared distance between the vectors is below `1e-10`.
---
---@param x number The x component of the other vector.
---@param y number The y component of the other vector.
---@return boolean equal Whether the 2 vectors approximately equal each other.
function Vec2:equals(x, y) end

---Returns the length of the vector.
---
---#### Notes:
---
---The length is equivalent to this:
---
---    math.sqrt(v.x * v.x + v.y * v.y)
---
---@return number length The length of the vector.
function Vec2:length() end

---Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.
---
---@param u Vec2 The vector to lerp towards.
---@param t number The lerping parameter.
---@return Vec2 self The interpolated vector.
function Vec2:lerp(u, t) end

---Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.
---
---@param x number A value of x component to lerp towards.
---@param y number A value of y component to lerp towards.
---@param t number The lerping parameter.
---@return Vec2 self The interpolated vector.
function Vec2:lerp(x, y, t) end

---Multiplies the vector by a vector or a number.
---
---@param u Vec2 The other vector to multiply the components by.
---@return Vec2 self The modified vector.
function Vec2:mul(u) end

---Multiplies the vector by a vector or a number.
---
---@param x number A value to multiply x component by.
---@param y? number A value to multiply y component by.
---@return Vec2 self The modified vector.
function Vec2:mul(x, y) end

---Adjusts the values in the vector so that its direction stays the same but its length becomes 1.
---
---@return Vec2 self The normalized vector.
function Vec2:normalize() end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param x? number The new x value of the vector.
---@param y? number The new y value of the vector.
---@return Vec2 v The input vector.
function Vec2:set(x, y) end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param u Vec2 The vector to copy the values from.
---@return Vec2 v The input vector.
function Vec2:set(u) end

---Subtracts a vector or a number from the vector.
---
---@param u Vec2 The other vector.
---@return Vec2 self The modified vector.
function Vec2:sub(u) end

---Subtracts a vector or a number from the vector.
---
---@param x number A value to subtract from x component.
---@param y? number A value to subtract from y component.
---@return Vec2 self The modified vector.
function Vec2:sub(x, y) end

---Returns the 2 components of the vector as numbers.
---
---@return number x The x value.
---@return number y The y value.
function Vec2:unpack() end

---A vector object that holds three numbers.
---@class Vec3
local Vec3 = {}

---Adds a vector or a number to the vector.
---
---@param u Vec3 The other vector.
---@return Vec3 self The modified vector.
function Vec3:add(u) end

---Adds a vector or a number to the vector.
---
---@param x number A value to add to x component.
---@param y? number A value to add to y component.
---@param z? number A value to add to z component.
---@return Vec3 self The modified vector.
function Vec3:add(x, y, z) end

---Returns the angle between vectors.
---
---#### Notes:
---
---If any of the two vectors have a length of zero, the angle between them is not well defined.  In this case the function returns `math.pi / 2`.
---
---@param u Vec3 The other vector.
---@return number angle The angle to the other vector, in radians.
function Vec3:angle(u) end

---Returns the angle between vectors.
---
---#### Notes:
---
---If any of the two vectors have a length of zero, the angle between them is not well defined.  In this case the function returns `math.pi / 2`.
---
---@param x number The x component of the other vector.
---@param y number The y component of the other vector.
---@param z number The z component of the other vector.
---@return number angle The angle to the other vector, in radians.
function Vec3:angle(x, y, z) end

---Sets this vector to be equal to the cross product between this vector and another one.  The new `v` will be perpendicular to both the old `v` and `u`.
---
---#### Notes:
---
---The vectors are not normalized before or after computing the cross product.
---
---@param u Vec3 The vector to compute the cross product with.
---@return Vec3 self The modified vector.
function Vec3:cross(u) end

---Sets this vector to be equal to the cross product between this vector and another one.  The new `v` will be perpendicular to both the old `v` and `u`.
---
---#### Notes:
---
---The vectors are not normalized before or after computing the cross product.
---
---@param x number A value of x component to compute cross product with.
---@param y number A value of y component to compute cross product with.
---@param z number A value of z component to compute cross product with.
---@return Vec3 self The modified vector.
function Vec3:cross(x, y, z) end

---Returns the distance to another vector.
---
---@param u Vec3 The vector to measure the distance to.
---@return number distance The distance to `u`.
function Vec3:distance(u) end

---Returns the distance to another vector.
---
---@param x number A value of x component to measure distance to.
---@param y number A value of y component to measure distance to.
---@param z number A value of z component to measure distance to.
---@return number distance The distance to `u`.
function Vec3:distance(x, y, z) end

---Divides the vector by a vector or a number.
---
---@param u Vec3 The other vector to divide the components by.
---@return Vec3 self The modified vector.
function Vec3:div(u) end

---Divides the vector by a vector or a number.
---
---@param x number A value to divide x component by.
---@param y? number A value to divide y component by.
---@param z? number A value to divide z component by.
---@return Vec3 self The modified vector.
function Vec3:div(x, y, z) end

---Returns the dot product between this vector and another one.
---
---#### Notes:
---
---This is computed as:
---
---    dot = v.x * u.x + v.y * u.y + v.z * u.z
---
---The vectors are not normalized before computing the dot product.
---
---@param u Vec3 The vector to compute the dot product with.
---@return number dot The dot product between `v` and `u`.
function Vec3:dot(u) end

---Returns the dot product between this vector and another one.
---
---#### Notes:
---
---This is computed as:
---
---    dot = v.x * u.x + v.y * u.y + v.z * u.z
---
---The vectors are not normalized before computing the dot product.
---
---@param x number A value of x component to compute the dot product with.
---@param y number A value of y component to compute the dot product with.
---@param z number A value of z component to compute the dot product with.
---@return number dot The dot product between `v` and `u`.
function Vec3:dot(x, y, z) end

---Returns whether a vector is approximately equal to another vector.
---
---#### Notes:
---
---To handle floating point precision issues, this function returns true as long as the squared distance between the vectors is below `1e-10`.
---
---@param u Vec3 The other vector.
---@return boolean equal Whether the 2 vectors approximately equal each other.
function Vec3:equals(u) end

---Returns whether a vector is approximately equal to another vector.
---
---#### Notes:
---
---To handle floating point precision issues, this function returns true as long as the squared distance between the vectors is below `1e-10`.
---
---@param x number The x component of the other vector.
---@param y number The y component of the other vector.
---@param z number The z component of the other vector.
---@return boolean equal Whether the 2 vectors approximately equal each other.
function Vec3:equals(x, y, z) end

---Returns the length of the vector.
---
---#### Notes:
---
---The length is equivalent to this:
---
---    math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)
---
---@return number length The length of the vector.
function Vec3:length() end

---Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.
---
---@param u Vec3 The vector to lerp towards.
---@param t number The lerping parameter.
---@return Vec3 self The interpolated vector.
function Vec3:lerp(u, t) end

---Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.
---
---@param x number A value of x component to lerp towards.
---@param y number A value of y component to lerp towards.
---@param z number A value of z component to lerp towards.
---@param t number The lerping parameter.
---@return Vec3 self The interpolated vector.
function Vec3:lerp(x, y, z, t) end

---Multiplies the vector by a vector or a number.
---
---@param u Vec3 The other vector to multiply the components by.
---@return Vec3 self The modified vector.
function Vec3:mul(u) end

---Multiplies the vector by a vector or a number.
---
---@param x number A value to multiply x component by.
---@param y? number A value to multiply y component by.
---@param z? number A value to multiply z component by.
---@return Vec3 self The modified vector.
function Vec3:mul(x, y, z) end

---Adjusts the values in the vector so that its direction stays the same but its length becomes 1.
---
---@return Vec3 self The normalized vector.
function Vec3:normalize() end

---Applies a rotation to the vector, using a `Quat` or an angle/axis rotation.
---
---@param q Quat The quaternion to apply.
---@return Vec3 self The modified vector.
function Vec3:rotate(q) end

---Applies a rotation to the vector, using a `Quat` or an angle/axis rotation.
---
---@param angle number The number of radians to rotate.
---@param ax number The x component of the axis to rotate around.
---@param ay number The y component of the axis to rotate around.
---@param az number The z component of the axis to rotate around.
---@return Vec3 self The modified vector.
function Vec3:rotate(angle, ax, ay, az) end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param x? number The new x value of the vector.
---@param y? number The new y value of the vector.
---@param z? number The new z value of the vector.
---@return Vec3 v The input vector.
function Vec3:set(x, y, z) end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param u Vec3 The vector to copy the values from.
---@return Vec3 v The input vector.
function Vec3:set(u) end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param q Quat A quat to use the direction of.
---@return Vec3 v The input vector.
function Vec3:set(q) end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param m Mat4 The matrix to use the position of.
---@return Vec3 v The input vector.
function Vec3:set(m) end

---Subtracts a vector or a number from the vector.
---
---@param u Vec3 The other vector.
---@return Vec3 self The modified vector.
function Vec3:sub(u) end

---Subtracts a vector or a number from the vector.
---
---@param x number A value to subtract from x component.
---@param y? number A value to subtract from y component.
---@param z? number A value to subtract from z component.
---@return Vec3 self The modified vector.
function Vec3:sub(x, y, z) end

---Applies a transform (translation, rotation, scale) to the vector using a `Mat4` or numbers. This is the same as multiplying the vector by a matrix.  This treats the vector as a point.
---
---@param m Mat4 The matrix to apply.
---@return Vec3 self The original vector, with transformed components.
function Vec3:transform(m) end

---Applies a transform (translation, rotation, scale) to the vector using a `Mat4` or numbers. This is the same as multiplying the vector by a matrix.  This treats the vector as a point.
---
---@param x? number The x component of the translation.
---@param y? number The y component of the translation.
---@param z? number The z component of the translation.
---@param scale? number The scale factor.
---@param angle? number The number of radians to rotate around the rotation axis.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@return Vec3 self The original vector, with transformed components.
function Vec3:transform(x, y, z, scale, angle, ax, ay, az) end

---Applies a transform (translation, rotation, scale) to the vector using a `Mat4` or numbers. This is the same as multiplying the vector by a matrix.  This treats the vector as a point.
---
---@param translation Vec3 The translation to apply.
---@param scale? number The scale factor.
---@param rotation Quat The rotation to apply.
---@return Vec3 self The original vector, with transformed components.
function Vec3:transform(translation, scale, rotation) end

---Returns the 3 components of the vector as numbers.
---
---@return number x The x value.
---@return number y The y value.
---@return number z The z value.
function Vec3:unpack() end

---A vector object that holds four numbers.
---@class Vec4
local Vec4 = {}

---Adds a vector or a number to the vector.
---
---@param u Vec4 The other vector.
---@return Vec4 self The modified vector.
function Vec4:add(u) end

---Adds a vector or a number to the vector.
---
---@param x number A value to add to x component.
---@param y? number A value to add to y component.
---@param z? number A value to add to z component.
---@param w? number A value to add to w component.
---@return Vec4 self The modified vector.
function Vec4:add(x, y, z, w) end

---Returns the angle between vectors.
---
---#### Notes:
---
---If any of the two vectors have a length of zero, the angle between them is not well defined.  In this case the function returns `math.pi / 2`.
---
---@param u Vec4 The other vector.
---@return number angle The angle to other vector, in radians.
function Vec4:angle(u) end

---Returns the angle between vectors.
---
---#### Notes:
---
---If any of the two vectors have a length of zero, the angle between them is not well defined.  In this case the function returns `math.pi / 2`.
---
---@param x number The x component of the other vector.
---@param y number The y component of the other vector.
---@param z number The z component of the other vector.
---@param w number The w component of the other vector.
---@return number angle The angle to other vector, in radians.
function Vec4:angle(x, y, z, w) end

---Returns the distance to another vector.
---
---@param u Vec4 The vector to measure the distance to.
---@return number distance The distance to `u`.
function Vec4:distance(u) end

---Returns the distance to another vector.
---
---@param x number A value of x component to measure distance to.
---@param y number A value of y component to measure distance to.
---@param z number A value of z component to measure distance to.
---@param w number A value of w component to measure distance to.
---@return number distance The distance to `u`.
function Vec4:distance(x, y, z, w) end

---Divides the vector by a vector or a number.
---
---@param u Vec4 The other vector to divide the components by.
---@return Vec4 self The modified vector.
function Vec4:div(u) end

---Divides the vector by a vector or a number.
---
---@param x number A value to divide x component by.
---@param y? number A value to divide y component by.
---@param z? number A value to divide z component by.
---@param w? number A value to divide w component by.
---@return Vec4 self The modified vector.
function Vec4:div(x, y, z, w) end

---Returns the dot product between this vector and another one.
---
---#### Notes:
---
---This is computed as:
---
---    dot = v.x * u.x + v.y * u.y + v.z * u.z + v.w * u.w
---
---The vectors are not normalized before computing the dot product.
---
---@param u Vec4 The vector to compute the dot product with.
---@return number dot The dot product between `v` and `u`.
function Vec4:dot(u) end

---Returns the dot product between this vector and another one.
---
---#### Notes:
---
---This is computed as:
---
---    dot = v.x * u.x + v.y * u.y + v.z * u.z + v.w * u.w
---
---The vectors are not normalized before computing the dot product.
---
---@param x number A value of x component to compute the dot product with.
---@param y number A value of y component to compute the dot product with.
---@param z number A value of z component to compute the dot product with.
---@param w number A value of w component to compute the dot product with.
---@return number dot The dot product between `v` and `u`.
function Vec4:dot(x, y, z, w) end

---Returns whether a vector is approximately equal to another vector.
---
---#### Notes:
---
---To handle floating point precision issues, this function returns true as long as the squared distance between the vectors is below `1e-10`.
---
---@param u Vec4 The other vector.
---@return boolean equal Whether the 2 vectors approximately equal each other.
function Vec4:equals(u) end

---Returns whether a vector is approximately equal to another vector.
---
---#### Notes:
---
---To handle floating point precision issues, this function returns true as long as the squared distance between the vectors is below `1e-10`.
---
---@param x number The x component of the other vector.
---@param y number The y component of the other vector.
---@param z number The z component of the other vector.
---@param w number The w component of the other vector.
---@return boolean equal Whether the 2 vectors approximately equal each other.
function Vec4:equals(x, y, z, w) end

---Returns the length of the vector.
---
---#### Notes:
---
---The length is equivalent to this:
---
---    math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z + v.w * v.w)
---
---@return number length The length of the vector.
function Vec4:length() end

---Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.
---
---@param u Vec4 The vector to lerp towards.
---@param t number The lerping parameter.
---@return Vec4 self The interpolated vector.
function Vec4:lerp(u, t) end

---Performs a linear interpolation between this vector and another one, which can be used to smoothly animate between two vectors, based on a parameter value.  A parameter value of `0` will leave the vector unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a value of `.5` will set the components to be halfway between the two vectors.
---
---@param x number A value of x component to lerp towards.
---@param y number A value of y component to lerp towards.
---@param z number A value of z component to lerp towards.
---@param w number A value of w component to lerp towards.
---@param t number The lerping parameter.
---@return Vec4 self The interpolated vector.
function Vec4:lerp(x, y, z, w, t) end

---Multiplies the vector by a vector or a number.
---
---@param u Vec4 The other vector to multiply the components by.
---@return Vec4 self The modified vector.
function Vec4:mul(u) end

---Multiplies the vector by a vector or a number.
---
---@param x number A value to multiply x component by.
---@param y? number A value to multiply y component by.
---@param z? number A value to multiply z component by.
---@param w? number A value to multiply w component by.
---@return Vec4 self The modified vector.
function Vec4:mul(x, y, z, w) end

---Adjusts the values in the vector so that its direction stays the same but its length becomes 1.
---
---@return Vec4 self The normalized vector.
function Vec4:normalize() end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param x? number The new x value of the vector.
---@param y? number The new y value of the vector.
---@param z? number The new z value of the vector.
---@param w? number The new w value of the vector.
---@return Vec4 v The input vector.
function Vec4:set(x, y, z, w) end

---Sets the components of the vector, either from numbers or an existing vector.
---
---@param u Vec4 The vector to copy the values from.
---@return Vec4 v The input vector.
function Vec4:set(u) end

---Subtracts a vector or a number from the vector.
---
---@param u Vec4 The other vector.
---@return Vec4 self The modified vector.
function Vec4:sub(u) end

---Subtracts a vector or a number from the vector.
---
---@param x number A value to subtract from x component.
---@param y? number A value to subtract from y component.
---@param z? number A value to subtract from z component.
---@param w? number A value to subtract from w component.
---@return Vec4 self The modified vector.
function Vec4:sub(x, y, z, w) end

---Applies a transform (translation, rotation, scale) to the vector using a `Mat4` or numbers. This is the same as multiplying the vector by a matrix.
---
---@param m Mat4 The matrix to apply.
---@return Vec4 self The original vector, with transformed components.
function Vec4:transform(m) end

---Applies a transform (translation, rotation, scale) to the vector using a `Mat4` or numbers. This is the same as multiplying the vector by a matrix.
---
---@param x? number The x component of the translation.
---@param y? number The y component of the translation.
---@param z? number The z component of the translation.
---@param scale? number The scale factor.
---@param angle? number The number of radians to rotate around the rotation axis.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@return Vec4 self The original vector, with transformed components.
function Vec4:transform(x, y, z, scale, angle, ax, ay, az) end

---Applies a transform (translation, rotation, scale) to the vector using a `Mat4` or numbers. This is the same as multiplying the vector by a matrix.
---
---@param translation Vec3 The translation to apply.
---@param scale? number The scale factor.
---@param rotation Quat The rotation to apply.
---@return Vec4 self The original vector, with transformed components.
function Vec4:transform(translation, scale, rotation) end

---Returns the 4 components of the vector as numbers.
---
---@return number x The x value.
---@return number y The y value.
---@return number z The z value.
---@return number w The w value.
function Vec4:unpack() end

---LÖVR has math objects for vectors, matrices, and quaternions, collectively called "vector objects".  Vectors are useful because they can represent a multidimensional quantity (like a 3D position) using just a single value.
---@class Vectors
local Vectors = {}
