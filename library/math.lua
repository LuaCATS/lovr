---@meta

---The `lovr.math` module provides math helpers commonly used for 3D applications.
---
---@class lovr.math
lovr.math = {}

---Drains the temporary vector pool, invalidating existing temporary vectors.
---
---This is called automatically at the end of each frame.
---
---@deprecated
function lovr.math.drain() end

---Converts a color from gamma space to linear space.
---
---@param gr number The red component of the gamma-space color.
---@param gg number The green component of the gamma-space color.
---@param gb number The blue component of the gamma-space color.
---@param a number An optional alpha component (returned unchanged).
---@return number lr The red component of the resulting linear-space color.
---@return number lg The green component of the resulting linear-space color.
---@return number lb The blue component of the resulting linear-space color.
---@return number a An optional alpha component (returned unchanged).
function lovr.math.gammaToLinear(gr, gg, gb, a) end

---Converts a color from gamma space to linear space.
---
---@param color {number} A table containing the components of a gamma-space color.
---@return number lr The red component of the resulting linear-space color.
---@return number lg The green component of the resulting linear-space color.
---@return number lb The blue component of the resulting linear-space color.
---@return number a An optional alpha component (returned unchanged).
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
---@param a number An optional alpha component (returned unchanged).
---@return number gr The red component of the resulting gamma-space color.
---@return number gg The green component of the resulting gamma-space color.
---@return number gb The blue component of the resulting gamma-space color.
---@return number a An optional alpha component (returned unchanged).
function lovr.math.linearToGamma(lr, lg, lb, a) end

---Converts a color from linear space to gamma space.
---
---@param color {number} A table containing the components of a linear-space color.
---@return number gr The red component of the resulting gamma-space color.
---@return number gg The green component of the resulting gamma-space color.
---@return number gb The blue component of the resulting gamma-space color.
---@return number a An optional alpha component (returned unchanged).
function lovr.math.linearToGamma(color) end

---Converts a color from linear space to gamma space.
---
---@param x number The color channel to convert.
---@return number y The converted color channel.
function lovr.math.linearToGamma(x) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@return Mat4 m The new matrix.
---@deprecated
function lovr.math.mat4() end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param n Mat4 An existing matrix to copy the values from.
---@return Mat4 m The new matrix.
---@deprecated
function lovr.math.mat4(n) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? vector The translation of the matrix.
---@param scale? vector The scale of the matrix.
---@param rotation? quaternion The rotation of the matrix.
---@return Mat4 m The new matrix.
---@deprecated
function lovr.math.mat4(position, scale, rotation) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? vector The translation of the matrix.
---@param rotation? quaternion The rotation of the matrix.
---@return Mat4 m The new matrix.
---@deprecated
function lovr.math.mat4(position, rotation) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param ... number 16 numbers to use as the raw values of the matrix (column-major).
---@return Mat4 m The new matrix.
---@deprecated
function lovr.math.mat4(...) end

---Creates a temporary 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param d number A number to use for the diagonal elements.
---@return Mat4 m The new matrix.
---@deprecated
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
---@param v vector The first control point.
---@param ... any Additional control points.
---@return Curve curve The new Curve.
function lovr.math.newCurve(v, ...) end

---Creates a new `Curve` from a list of control points.
---
---@param points table A table of control points (numbers or vectors).
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
---@param position? vector The translation of the matrix.
---@param scale? vector The scale of the matrix.
---@param rotation? quaternion The rotation of the matrix.
---@return Mat4 m The new matrix.
function lovr.math.newMat4(position, scale, rotation) end

---Creates a new 4D matrix.  This function takes the same arguments as `Mat4:set`.
---
---@param position? vector The translation of the matrix.
---@param rotation? quaternion The rotation of the matrix.
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

---This is a deprecated alias for `quaternion.angleaxis`.
---
---@deprecated
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

---Creates a vector.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.newVec2(x, y, z) end

---Creates a vector.
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.newVec2(n) end

---Creates a vector.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.newVec3(x, y, z) end

---Creates a vector.
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.newVec3(n) end

---Creates a vector.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.newVec4(x, y, z) end

---Creates a vector.
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.newVec4(n) end

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

---This is a deprecated alias for `quaternion.angleaxis`.
---
---@deprecated
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

---Seed the random generator with a new seed.  Each seed will cause `lovr.math.random` and `lovr.math.randomNormal` to produce a unique sequence of random numbers.  When `lovr.math` is first loaded, the random generator is seeded with the current time.
---
---@param seed number The new seed.
function lovr.math.setRandomSeed(seed) end

---Creates a vector.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.vec2(x, y, z) end

---Creates a vector.
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.vec2(n) end

---Creates a vector.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.vec3(x, y, z) end

---Creates a vector.
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.vec3(n) end

---Creates a vector.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z? number The z component of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.vec4(x, y, z) end

---Creates a vector.
---
---@param n number A number to assign to the x, y, and z components of the vector.
---@return vector v The new vector.
---@deprecated
function lovr.math.vec4(n) end

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

---Returns the length of the curve, from the beginning of the curve up to the specified `t` parameter. `t` defaults to `1.0`, so by default this returns the length of the entire curve.
---
---@param t? number The t parameter to get the length at.
---@param iterations? number How many iterations to use to compute the length.  More iterations will give a more accurate result, but will take longer to compute.
---@return number length The length of the curve.
function Curve:getLength(t, iterations) end

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
---@param n? number The number of points to use.
---@param t1? number How far along the curve to start rendering.
---@param t2? number How far along the curve to stop rendering.
---@return {number} t A (flat) table of 3D points along the curve.
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

---Steps along the curve a given distance and returns the curve parameter at that point.  This is the inverse of `Curve:getLength`.
---
---@param distance number The distance to step along the curve.
---@param iterations? number How many iterations to use to compute the result.  More iterations will give a more accurate result, but will take longer to compute.
---@return number t The parameter of the curve at the given distance along the curve.
function Curve:step(distance, iterations) end

---A `Mat4` is a math type that holds 16 values in a 4x4 grid.
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
---@param from vector The position of the viewer.
---@param to vector The position of the target.
---@param up? vector The up vector of the viewer.
---@return Mat4 self The modified matrix.
function Mat4:lookAt(from, to, up) end

---Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns a new transformed vector.
---
---#### Notes:
---
---When multiplying with a table, the returned table will try to match the input: it will have the same metatable as the input, and it will either use numeric keys for the components or x/y/z keys, based on the table length of the input.
---
---There are some differences between this function and the `*` operator.  `*` always assumes that the `w` component of the input vector is 1, and performs a w divide at the end.  This function allows specifying the `w` as the last argument, and does not perform a w divide at the end.
---
---@param n Mat4 The matrix.
---@return Mat4 self The modified matrix.
function Mat4:mul(n) end

---Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns a new transformed vector.
---
---#### Notes:
---
---When multiplying with a table, the returned table will try to match the input: it will have the same metatable as the input, and it will either use numeric keys for the components or x/y/z keys, based on the table length of the input.
---
---There are some differences between this function and the `*` operator.  `*` always assumes that the `w` component of the input vector is 1, and performs a w divide at the end.  This function allows specifying the `w` as the last argument, and does not perform a w divide at the end.
---
---@param x number The x component of the vector.
---@param y number The y component of the vector.
---@param z number The z component of the vector.
---@param w? number The w component of the vector.
---@return number x The x component of the transformed vector.
---@return number y The y component of the transformed vector.
---@return number z The z component of the transformed vector.
---@return number w The w component of the transformed vector.
function Mat4:mul(x, y, z, w) end

---Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms together.  Multiplying by a vector applies the transformation from the matrix to the vector and returns a new transformed vector.
---
---#### Notes:
---
---When multiplying with a table, the returned table will try to match the input: it will have the same metatable as the input, and it will either use numeric keys for the components or x/y/z keys, based on the table length of the input.
---
---There are some differences between this function and the `*` operator.  `*` always assumes that the `w` component of the input vector is 1, and performs a w divide at the end.  This function allows specifying the `w` as the last argument, and does not perform a w divide at the end.
---
---@param v vector A vector.
---@return vector v The transformed vector.
function Mat4:mul(v) end

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
---@param position vector The position of the plane.
---@param normal vector The normal vector of the plane.
---@return Mat4 self The reflected matrix.
function Mat4:reflect(position, normal) end

---Rotates the matrix using a quaternion or an angle/axis rotation.
---
---@param q quaternion The rotation to apply to the matrix.
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
---@param scale vector The 3D scale to apply.
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
---@param position vector The translation of the matrix.
---@param scale vector The scale of the matrix.
---@param rotation quaternion The rotation of the matrix.
---@return Mat4 m The input matrix.
function Mat4:set(position, scale, rotation) end

---Sets the components of the matrix from separate position, rotation, and scale arguments or an existing matrix.
---
---@param position vector The translation of the matrix.
---@param rotation quaternion The rotation of the matrix.
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

---Sets the orientation of the matrix, without changing its position or scale.
---
---@param angle number The number of radians the matrix should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@return Mat4 self The modified input matrix.
function Mat4:setOrientation(angle, ax, ay, az) end

---Sets the orientation of the matrix, without changing its position or scale.
---
---@param orientation quaternion The new orientation.
---@return Mat4 self The modified input matrix.
function Mat4:setOrientation(orientation) end

---Sets the position and rotation of the matrix, without changing its scale.
---
---@param x number The x translation.
---@param y number The y translation.
---@param z number The z translation.
---@param angle number The number of radians the matrix should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@return Mat4 self The modified input matrix.
function Mat4:setPose(x, y, z, angle, ax, ay, az) end

---Sets the position and rotation of the matrix, without changing its scale.
---
---@param position vector The new position.
---@param orientation quaternion The new orientation.
---@return Mat4 self The modified input matrix.
function Mat4:setPose(position, orientation) end

---Sets the translation of the matrix, without changing its rotation or scale.
---
---@param x number The x translation.
---@param y number The y translation.
---@param z number The z translation.
---@return Mat4 self The modified input matrix.
function Mat4:setPosition(x, y, z) end

---Sets the translation of the matrix, without changing its rotation or scale.
---
---@param position vector The new position.
---@return Mat4 self The modified input matrix.
function Mat4:setPosition(position) end

---Sets the scale of the matrix, without changing its position or rotation.
---
---@param sx? number The new x scale.
---@param sy? number The new y scale.
---@param sz? number The new z scale.
---@return Mat4 self The modified input matrix.
function Mat4:setScale(sx, sy, sz) end

---Sets the scale of the matrix, without changing its position or rotation.
---
---@param scale vector The new scale.
---@return Mat4 self The modified input matrix.
function Mat4:setScale(scale) end

---Sets a model transform matrix that moves to `from` and orients model towards `to` point.
---
---This is used when rendered model should always point towards a point of interest. The resulting Mat4 object can be used as model pose.
---
---The target() function produces same result as lookAt() after matrix inversion.
---
---@param from vector The position of the viewer.
---@param to vector The position of the target.
---@param up? vector The up vector of the viewer.
---@return Mat4 self The modified matrix.
function Mat4:target(from, to, up) end

---Translates the matrix.
---
---@param v vector The translation vector.
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
