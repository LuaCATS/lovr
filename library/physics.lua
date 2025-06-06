---@meta

---The `lovr.physics` module simulates 3D rigid body physics.
---
---@class lovr.physics
lovr.physics = {}

---Creates a new BallJoint.
---
---#### Notes:
---
---A ball joint is like a ball and socket between the two colliders.  It tries to keep the distance between the colliders and the anchor position the same, but does not constrain the angle between them.
---
---If the anchor is nil, the position of the first Collider is the anchor.  If the first collider is nil, then the position of the second Collider is the anchor.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param x number The x position of the joint anchor point, in world coordinates.
---@param y number The y position of the joint anchor point, in world coordinates.
---@param z number The z position of the joint anchor point, in world coordinates.
---@return BallJoint ball The new BallJoint.
function lovr.physics.newBallJoint(colliderA, colliderB, x, y, z) end

---Creates a new BallJoint.
---
---#### Notes:
---
---A ball joint is like a ball and socket between the two colliders.  It tries to keep the distance between the colliders and the anchor position the same, but does not constrain the angle between them.
---
---If the anchor is nil, the position of the first Collider is the anchor.  If the first collider is nil, then the position of the second Collider is the anchor.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param anchor Vec3 The joint anchor point, in world coordinates.
---@return BallJoint ball The new BallJoint.
function lovr.physics.newBallJoint(colliderA, colliderB, anchor) end

---Creates a new BoxShape.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`.
---
---@param width? number The width of the box, in meters.
---@param height? number The height of the box, in meters.
---@param depth? number The depth of the box, in meters.
---@return BoxShape box The new BoxShape.
function lovr.physics.newBoxShape(width, height, depth) end

---Creates a new CapsuleShape.  Capsules are cylinders with hemispheres on each end.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`.
---
---@param radius? number The radius of the capsule, in meters.
---@param length? number The length of the capsule, not including the caps, in meters.
---@return CapsuleShape capsule The new CapsuleShape.
function lovr.physics.newCapsuleShape(radius, length) end

---Creates a new ConeJoint.
---
---#### Notes:
---
---A ConeJoint is similar to a BallJoint, where the relative position between the colliders will be constrained to a single point.  However, the ConeJoint also limits the rotation away from the cone axis.  This can be useful for limb joints, ropes, etc.
---
---If the anchor is nil, the position of the first Collider is the anchor.  If the first Collider is nil, the position of the second collider is the anchor.
---
---If the axis is nil, it defaults to the direction between the anchor and the second Collider.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param x number The x position of the joint anchor point, in world space.
---@param y number The y position of the joint anchor point, in world space.
---@param z number The z position of the joint anchor point, in world space.
---@param ax number The x component of the cone axis, in world space.
---@param ay number The y component of the cone axis, in world space.
---@param az number The z component of the cone axis, in world space.
---@return ConeJoint cone The new ConeJoint.
function lovr.physics.newConeJoint(colliderA, colliderB, x, y, z, ax, ay, az) end

---Creates a new ConeJoint.
---
---#### Notes:
---
---A ConeJoint is similar to a BallJoint, where the relative position between the colliders will be constrained to a single point.  However, the ConeJoint also limits the rotation away from the cone axis.  This can be useful for limb joints, ropes, etc.
---
---If the anchor is nil, the position of the first Collider is the anchor.  If the first Collider is nil, the position of the second collider is the anchor.
---
---If the axis is nil, it defaults to the direction between the anchor and the second Collider.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param anchor Vec3 The joint anchor point, in world space.
---@param axis Vec3 The cone axis, in world space.
---@return ConeJoint cone The new ConeJoint.
function lovr.physics.newConeJoint(colliderA, colliderB, anchor, axis) end

---Creates a new ConvexShape.
---
---@param points table A list of vertices to compute a convex hull from.  Can be a table of tables (each with 3 numbers) or a table of numbers (every 3 numbers form a 3D point).
---@param scale? number A scale to apply to the points.
---@return ConvexShape shape The new ConvexShape.
function lovr.physics.newConvexShape(points, scale) end

---Creates a new ConvexShape.
---
---@param modelData ModelData The ModelData to compute a convex hull from.
---@param scale? number A scale to apply to the points.
---@return ConvexShape shape The new ConvexShape.
function lovr.physics.newConvexShape(modelData, scale) end

---Creates a new ConvexShape.
---
---@param model Model The Model to compute a convex hull from.
---@param scale? number A scale to apply to the points.
---@return ConvexShape shape The new ConvexShape.
function lovr.physics.newConvexShape(model, scale) end

---Creates a new ConvexShape.
---
---@param mesh Mesh The Mesh to compute a convex hull from.  It must use the `cpu` storage mode.
---@param scale? number A scale to apply to the points.
---@return ConvexShape shape The new ConvexShape.
function lovr.physics.newConvexShape(mesh, scale) end

---Creates a new ConvexShape.
---
---@param template ConvexShape An existing ConvexShape to clone.
---@param scale? number A scale to apply to the points.
---@return ConvexShape shape The new ConvexShape.
function lovr.physics.newConvexShape(template, scale) end

---Creates a new CylinderShape.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`.
---
---@param radius? number The radius of the cylinder, in meters.
---@param length? number The length of the cylinder, in meters.
---@return CylinderShape cylinder The new CylinderShape.
function lovr.physics.newCylinderShape(radius, length) end

---Creates a new DistanceJoint.
---
---#### Notes:
---
---A distance joint tries to keep the two colliders a fixed distance apart.  The distance is determined by the initial distance between the anchor points.  The joint allows for rotation on the anchor points.
---
---If no anchors are given, they default to the positions of the Colliders.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param x1 number The x position of the first anchor point, in world coordinates.
---@param y1 number The y position of the first anchor point, in world coordinates.
---@param z1 number The z position of the first anchor point, in world coordinates.
---@param x2 number The x position of the second anchor point, in world coordinates.
---@param y2 number The y position of the second anchor point, in world coordinates.
---@param z2 number The z position of the second anchor point, in world coordinates.
---@return DistanceJoint joint The new DistanceJoint.
function lovr.physics.newDistanceJoint(colliderA, colliderB, x1, y1, z1, x2, y2, z2) end

---Creates a new DistanceJoint.
---
---#### Notes:
---
---A distance joint tries to keep the two colliders a fixed distance apart.  The distance is determined by the initial distance between the anchor points.  The joint allows for rotation on the anchor points.
---
---If no anchors are given, they default to the positions of the Colliders.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param first Vec3 The first anchor point, in world coordinates.
---@param second Vec3 The second anchor point, in world coordinates.
---@return DistanceJoint joint The new DistanceJoint.
function lovr.physics.newDistanceJoint(colliderA, colliderB, first, second) end

---Creates a new HingeJoint.
---
---#### Notes:
---
---A hinge joint constrains two colliders to allow rotation only around the hinge's axis.
---
---If the anchor is nil, the position of the first Collider is the anchor.  If the first Collider is nil, the position of the second collider is the anchor.
---
---If the axis is nil, it defaults to the direction between the anchor and the second Collider.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param x number The x position of the hinge anchor, in world coordinates.
---@param y number The y position of the hinge anchor, in world coordinates.
---@param z number The z position of the hinge anchor, in world coordinates.
---@param ax number The x component of the hinge axis direction.
---@param ay number The y component of the hinge axis direction.
---@param az number The z component of the hinge axis direction.
---@return HingeJoint hinge The new HingeJoint.
function lovr.physics.newHingeJoint(colliderA, colliderB, x, y, z, ax, ay, az) end

---Creates a new HingeJoint.
---
---#### Notes:
---
---A hinge joint constrains two colliders to allow rotation only around the hinge's axis.
---
---If the anchor is nil, the position of the first Collider is the anchor.  If the first Collider is nil, the position of the second collider is the anchor.
---
---If the axis is nil, it defaults to the direction between the anchor and the second Collider.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param anchor Vec3 The anchor point, in world coordinates.
---@param axis Vec3 The hinge axis direction.
---@return HingeJoint hinge The new HingeJoint.
function lovr.physics.newHingeJoint(colliderA, colliderB, anchor, axis) end

---Creates a new MeshShape.
---
---@param vertices table The table of vertices in the mesh.  Each vertex is a table with 3 numbers.
---@param indices table A table of triangle indices representing how the vertices are connected in the Mesh.
---@param scale? number A scale to apply to the mesh vertices.
---@return MeshShape mesh The new MeshShape.
function lovr.physics.newMeshShape(vertices, indices, scale) end

---Creates a new MeshShape.
---
---@param modelData ModelData The ModelData to use the vertices from.
---@param scale? number A scale to apply to the mesh vertices.
---@return MeshShape mesh The new MeshShape.
function lovr.physics.newMeshShape(modelData, scale) end

---Creates a new MeshShape.
---
---@param model Model A Model to use for the mesh data.  Similar to calling `Model:getTriangles` and passing it to this function, but has better performance.
---@param scale? number A scale to apply to the mesh vertices.
---@return MeshShape mesh The new MeshShape.
function lovr.physics.newMeshShape(model, scale) end

---Creates a new MeshShape.
---
---@param mesh Mesh The Mesh to use the vertices from.  It must use the `cpu` storage mode.
---@param scale? number A scale to apply to the mesh vertices.
---@return MeshShape mesh The new MeshShape.
function lovr.physics.newMeshShape(mesh, scale) end

---Creates a new MeshShape.
---
---@param template MeshShape An existing MeshShape to clone.
---@param scale? number A scale to apply to the mesh vertices.
---@return MeshShape mesh The new MeshShape.
function lovr.physics.newMeshShape(template, scale) end

---Creates a new SliderJoint.
---
---#### Notes:
---
---A slider joint constrains two colliders to only allow movement along the slider's axis.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param ax number The x component of the slider axis.
---@param ay number The y component of the slider axis.
---@param az number The z component of the slider axis.
---@return SliderJoint slider The new SliderJoint.
function lovr.physics.newSliderJoint(colliderA, colliderB, ax, ay, az) end

---Creates a new SliderJoint.
---
---#### Notes:
---
---A slider joint constrains two colliders to only allow movement along the slider's axis.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@param axis Vec3 The slider axis direction.
---@return SliderJoint slider The new SliderJoint.
function lovr.physics.newSliderJoint(colliderA, colliderB, axis) end

---Creates a new SphereShape.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`.
---
---@param radius? number The radius of the sphere, in meters.
---@return SphereShape sphere The new SphereShape.
function lovr.physics.newSphereShape(radius) end

---Creates a new TerrainShape.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`. For immobile terrain use the `Collider:setKinematic`.
---
---@param scale number The width and depth of the terrain, in meters.
---@return TerrainShape terrain The new TerrainShape.
function lovr.physics.newTerrainShape(scale) end

---Creates a new TerrainShape.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`. For immobile terrain use the `Collider:setKinematic`.
---
---@param scale number The width and depth of the terrain, in meters.
---@param heightmap Image A heightmap image describing the terrain elevation at different points.  The red channel brightness of each pixel determines the elevation at corresponding coordinates.
---@param stretch? number A vertical multiplier for height values to obtain terrain height.  When the image format has pixel values only in the 0 to 1 range, this can be used to scale the height to meters.
---@return TerrainShape terrain The new TerrainShape.
function lovr.physics.newTerrainShape(scale, heightmap, stretch) end

---Creates a new TerrainShape.
---
---#### Notes:
---
---A Shape can be attached to a Collider using `Collider:addShape`. For immobile terrain use the `Collider:setKinematic`.
---
---@param scale number The width and depth of the terrain, in meters.
---@param callback function A function that computes terrain height from x and z coordinates.  The x and z inputs will range from `-scale / 2` to `scale / 2`.
---@param samples? number The number of samples taken across the x and z dimensions.  More samples will result in higher terrain fidelity, but use more CPU and memory.
---@return TerrainShape terrain The new TerrainShape.
function lovr.physics.newTerrainShape(scale, callback, samples) end

---Creates a new WeldJoint.
---
---#### Notes:
---
---The joint will try to keep the Colliders in the relative pose they were at when the joint was created.
---
---@param colliderA Collider The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position in the World.
---@param colliderB Collider The second collider to attach the Joint to.
---@return WeldJoint joint The new WeldJoint.
function lovr.physics.newWeldJoint(colliderA, colliderB) end

---Creates a new physics World.
---
---@param settings? {tags: table, staticTags: table, maxColliders: number, threadSafe: boolean, allowSleep: boolean, stabilization: number, maxOverlap: number, restitutionThreshold: number, velocitySteps: number, positionSteps: number} An optional table with settings for the physics simulation.
---@return World world A whole new World.
function lovr.physics.newWorld(settings) end

---A BallJoint is a type of `Joint` that acts like a ball and socket between two colliders.  It allows the colliders to rotate freely around an anchor point, but does not allow the colliders' distance from the anchor point to change.
---@class BallJoint
local BallJoint = {}

---A type of `Shape` that can be used for cubes or boxes.
---@class BoxShape
local BoxShape = {}

---Returns the width, height, and depth of the BoxShape.
---
---@return number width The width of the box, in meters.
---@return number height The height of the box, in meters.
---@return number depth The depth of the box, in meters.
function BoxShape:getDimensions() end

---Sets the width, height, and depth of the BoxShape.
---
---#### Notes:
---
---This changes the mass of the shape.  If the shape is attached to a collider with automatic mass enabled, the mass properties of the collider will update as well.
---
---Changing shapes can make the physics engine explode since it can cause objects to overlap in unnatural ways.
---
---@param width number The width of the box, in meters.
---@param height number The height of the box, in meters.
---@param depth number The depth of the box, in meters.
function BoxShape:setDimensions(width, height, depth) end

---A type of `Shape` that can be used for capsule-shaped things.
---@class CapsuleShape
local CapsuleShape = {}

---Returns the length of the CapsuleShape, not including the caps.
---
---@return number length The length of the capsule, in meters.
function CapsuleShape:getLength() end

---Returns the radius of the CapsuleShape.
---
---@return number radius The radius of the capsule, in meters.
function CapsuleShape:getRadius() end

---Sets the length of the CapsuleShape.
---
---#### Notes:
---
---This changes the mass of the shape.  If the shape is attached to a collider with automatic mass enabled, the mass properties of the collider will update as well.
---
---Changing shapes can make the physics engine explode since it can cause objects to overlap in unnatural ways.
---
---@param length number The new length, in meters, not including the caps.
function CapsuleShape:setLength(length) end

---Sets the radius of the CapsuleShape.
---
---#### Notes:
---
---This changes the mass of the shape.  If the shape is attached to a collider with automatic mass enabled, the mass properties of the collider will update as well.
---
---Changing shapes can make the physics engine explode since it can cause objects to overlap in unnatural ways.
---
---@param radius number The new radius, in meters.
function CapsuleShape:setRadius(radius) end

---Colliders represent a single rigid body in the physics simulation.
---@class Collider
local Collider = {}

---Attaches a Shape to the collider.
---
---#### Notes:
---
---By default, LÖVR will recompute mass properties for the Collider as shapes are added and removed.  Use `Collider:setAutomaticMass` to enable or disable this behavior.
---
---Shapes can only be attached to a single Collider.  Attempting to attach a shape to multiple colliders (or to a single collider multiple times) will error.  Use `Collider:removeShape` to remove shapes from their original collider before reattaching them.
---
---Adding a `MeshShape` or a `TerrainShape` will force the Collider to be immobile.  It will immediately become kinematic, and will not move via velocity or forces.  However, it can still be repositioned with methods like `Collider:setPosition`.
---
---@param shape Shape The Shape to attach.
function Collider:addShape(shape) end

---Applies an angular impulse to the Collider.
---
---An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to only be applied once.  Use `Collider:applyTorque` for a time-dependent push that happens over multiple frames.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Impulses are accumulated and processed during `World:update`.
---
---@param x number The x component of the world-space impulse vector, in newton meter seconds.
---@param y number The y component of the world-space impulse vector, in newton meter seconds.
---@param z number The z component of the world-space impulse vector, in newton meter seconds.
function Collider:applyAngularImpulse(x, y, z) end

---Applies an angular impulse to the Collider.
---
---An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to only be applied once.  Use `Collider:applyTorque` for a time-dependent push that happens over multiple frames.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Impulses are accumulated and processed during `World:update`.
---
---@param impulse Vec3 The world-space impulse vector, in newton meter seconds.
function Collider:applyAngularImpulse(impulse) end

---Applies a force to the Collider.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Forces are accumulated and processed during `World:update`.
---
---@param x number The x component of the world-space force vector, in newtons.
---@param y number The y component of the world-space force vector, in newtons.
---@param z number The z component of the world-space force vector, in newtons.
function Collider:applyForce(x, y, z) end

---Applies a force to the Collider.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Forces are accumulated and processed during `World:update`.
---
---@param x number The x component of the world-space force vector, in newtons.
---@param y number The y component of the world-space force vector, in newtons.
---@param z number The z component of the world-space force vector, in newtons.
---@param px number The x position to apply the force at, in world space.
---@param py number The y position to apply the force at, in world space.
---@param pz number The z position to apply the force at, in world space.
function Collider:applyForce(x, y, z, px, py, pz) end

---Applies a force to the Collider.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Forces are accumulated and processed during `World:update`.
---
---@param force Vec3 The world-space force vector, in newtons.
function Collider:applyForce(force) end

---Applies a force to the Collider.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Forces are accumulated and processed during `World:update`.
---
---@param force Vec3 The world-space force vector, in newtons.
---@param position Vec3 The position to apply the force at, in world space.
function Collider:applyForce(force, position) end

---Applies a linear impulse to the Collider.
---
---An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to only be applied once.  Use `Collider:applyForce` for a time-dependent push that happens over multiple frames.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Impulses are accumulated and processed during `World:update`.
---
---@param x number The x component of the world-space impulse vector, in newton seconds.
---@param y number The y component of the world-space impulse vector, in newton seconds.
---@param z number The z component of the world-space impulse vector, in newton seconds.
function Collider:applyLinearImpulse(x, y, z) end

---Applies a linear impulse to the Collider.
---
---An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to only be applied once.  Use `Collider:applyForce` for a time-dependent push that happens over multiple frames.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Impulses are accumulated and processed during `World:update`.
---
---@param x number The x component of the world-space impulse vector, in newton seconds.
---@param y number The y component of the world-space impulse vector, in newton seconds.
---@param z number The z component of the world-space impulse vector, in newton seconds.
---@param px number The x position to apply the impulse at, in world space.
---@param py number The y position to apply the impulse at, in world space.
---@param pz number The z position to apply the impulse at, in world space.
function Collider:applyLinearImpulse(x, y, z, px, py, pz) end

---Applies a linear impulse to the Collider.
---
---An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to only be applied once.  Use `Collider:applyForce` for a time-dependent push that happens over multiple frames.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Impulses are accumulated and processed during `World:update`.
---
---@param impulse Vec3 The world-space impulse vector, in newton seconds.
function Collider:applyLinearImpulse(impulse) end

---Applies a linear impulse to the Collider.
---
---An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to only be applied once.  Use `Collider:applyForce` for a time-dependent push that happens over multiple frames.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Impulses are accumulated and processed during `World:update`.
---
---@param impulse Vec3 The world-space impulse vector, in newton seconds.
---@param position Vec3 The position to apply the impulse at, in world space.
function Collider:applyLinearImpulse(impulse, position) end

---Applies torque to the Collider.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Forces are accumulated and processed during `World:update`.
---
---@param x number The x component of the world-space torque vector, in newton meters.
---@param y number The y component of the world-space torque vector, in newton meters.
---@param z number The z component of the world-space torque vector, in newton meters.
function Collider:applyTorque(x, y, z) end

---Applies torque to the Collider.
---
---#### Notes:
---
---Kinematic colliders ignore forces.
---
---If the Collider is asleep, this will wake it up.
---
---Forces are accumulated and processed during `World:update`.
---
---@param torque Vec3 The world-space torque vector, in newton meters.
function Collider:applyTorque(torque) end

---Destroys the Collider, removing it from the World and destroying all Shapes and Joints attached to it.
---
---#### Notes:
---
---After a Collider is destroyed, calling methods on it or passing it to a function will throw an error.
---
function Collider:destroy() end

---Returns the world-space axis-aligned bounding box of the Collider, computed from attached shapes.
---
---@return number minx The minimum x coordinate of the box.
---@return number maxx The maximum x coordinate of the box.
---@return number miny The minimum y coordinate of the box.
---@return number maxy The maximum y coordinate of the box.
---@return number minz The minimum z coordinate of the box.
---@return number maxz The maximum z coordinate of the box.
function Collider:getAABB() end

---Returns the angular damping of the Collider.  Angular damping is similar to drag or air resistance, reducing the Collider's angular velocity over time.
---
---#### Notes:
---
---The default damping is .05, meaning the collider will lose approximately 5% of its angular velocity each second.  A damping value of zero means the Collider will not lose velocity over time.
---
---@return number damping The angular damping.
function Collider:getAngularDamping() end

---Returns the angular velocity of the Collider.
---
---@return number vx The x component of the angular velocity.
---@return number vy The y component of the angular velocity.
---@return number vz The z component of the angular velocity.
function Collider:getAngularVelocity() end

---Returns whether automatic mass is enabled for the Collider.
---
---When enabled, the Collider's mass, inertia, and center of mass will be recomputed when:
---
---- A shape is added to or removed from the Collider.
---- A shape attached to the Collider changes shape (e.g. `SphereShape:setRadius`).
---- A shape attached to the Collider is moved using `Shape:setOffset`.
---- A shape attached to the Collider changes its density using `Shape:setDensity`.
---
---Additionally, changing the center of mass of a Collider will automatically update its inertia when automatic mass is enabled.
---
---Disable this to manage the mass properties manually.  When automatic mass is disabled, `Collider:resetMassData` can still be used to reset the mass from attached shapes if needed.
---
---@return boolean enabled Whether automatic mass is enabled.
function Collider:getAutomaticMass() end

---Returns the Collider's center of mass, in the Collider's local coordinate space.
---
---#### Notes:
---
---By default, the center of mass of the Collider is kept up to date automatically as the Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.
---
---Use `Collider:resetMassData` to reset the center of mass and other mass properties based on the Collider's shapes.
---
---@return number x The x component of the center of mass.
---@return number y The y component of the center of mass.
---@return number z The z component of the center of mass.
function Collider:getCenterOfMass() end

---Get the degrees of freedom of the Collider.
---
---#### Notes:
---
---The default state is `xyz` for both translation and rotation.
---
---The physics engine does not support disabling all degrees of freedom.  At least one translation or rotation axis needs to be enabled.  To disable all movement for a collider, make it kinematic.
---
---@return string translation A string containing the world-space axes the Collider is allowed to move on.  The string will have 'x', 'y', and 'z' letters representing which axes are enabled.  If no axes are enabled then it will be an empty string.
---@return string rotation A string containing the world-space axes the Collider is allowed to rotate around.  The string will have 'x', 'y', and 'z' letters representing which axes are enabled.  If no axes are enabled then it will be an empty string.
function Collider:getDegreesOfFreedom() end

---Returns the friction of the Collider.  Friction determines how easy it is for two colliders to slide against each other.  Low friction makes it easier for a collider to slide, simulating a smooth surface.
---
---#### Notes:
---
---The default friction is .2.
---
---When two colliders collide, their friction is combined using the geometric mean:
---
---    friction = (frictionA * frictionB) ^ .5
---
---@return number friction The friction of the Collider.
function Collider:getFriction() end

---Returns the gravity scale of the Collider.  This is multiplied with the global gravity from the World, so 1.0 is regular gravity, 0.0 will ignore gravity, etc.
---
---@return number scale The gravity scale.
function Collider:getGravityScale() end

---Returns the inertia of the Collider.
---
---Inertia is kind of like "angular mass".  Regular mass determines how resistant the Collider is to linear forces (movement), whereas inertia determines how resistant the Collider is to torque (rotation).  Colliders with less inertia are more spinny.
---
---In 3D, inertia is represented by a 3x3 matrix, called a tensor.  To make calculations easier, the physics engine stores the inertia using eigenvalue decomposition, splitting the matrix into a diagonal matrix and a rotation.  It's complicated!
---
---In a realistic simulation, mass and inertia follow a linear relationship.  If the mass of an object increases, the diagonal part of its inertia should increase proportionally.
---
---#### Notes:
---
---By default, the inertia of the Collider is kept up to date automatically as the Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.
---
---Use `Collider:resetMassData` to reset the inertia and other mass properties based on the Collider's shapes.
---
---If the Collider is kinematic or all rotation axes are disabled, this returns zeroes.
---
---@return number dx The x component of the diagonal matrix.
---@return number dy The y component of the diagonal matrix.
---@return number dz The z component of the diagonal matrix.
---@return number angle The angle of the inertia rotation.
---@return number ax The x component of the inertia rotation axis.
---@return number ay The y component of the inertia rotation axis.
---@return number az The z component of the inertia rotation axis.
function Collider:getInertia() end

---Returns a list of Joints attached to the Collider.
---
---@return table joints A list of `Joint` objects attached to the Collider.
function Collider:getJoints() end

---Returns the linear damping of the Collider.  Linear damping is similar to drag or air resistance, slowing the Collider down over time.
---
---#### Notes:
---
---The default damping is .05, meaning the collider will lose approximately 5% of its velocity each second.  A damping value of zero means the Collider will not lose velocity over time.
---
---@return number damping The linear damping.
function Collider:getLinearDamping() end

---Returns the world-space linear velocity of the center of mass of the Collider, in meters per second.
---
---#### Notes:
---
---Currently, velocity is clamped to 500 meters per second to improve stability of the simulation.
---
---@return number vx The x component of the velocity.
---@return number vy The y component of the velocity.
---@return number vz The z component of the velocity.
function Collider:getLinearVelocity() end

---Returns the linear velocity of a point on the Collider.  This includes the velocity of the center of mass plus the angular velocity at that point.
---
---@param x number The x position in local space.
---@param y number The y position in local space.
---@param z number The z position in local space.
---@return number vx The x velocity of the point.
---@return number vy The y velocity of the point.
---@return number vz The z velocity of the point.
function Collider:getLinearVelocityFromLocalPoint(x, y, z) end

---Returns the linear velocity of a point on the Collider.  This includes the velocity of the center of mass plus the angular velocity at that point.
---
---@param point Vec3 The local-space point.
---@return number vx The x velocity of the point.
---@return number vy The y velocity of the point.
---@return number vz The z velocity of the point.
function Collider:getLinearVelocityFromLocalPoint(point) end

---Returns the linear velocity of a point on the Collider.  This includes the velocity of the center of mass plus the angular velocity at that point.
---
---@param x number The x position in world space.
---@param y number The y position in world space.
---@param z number The z position in world space.
---@return number vx The x velocity of the point.
---@return number vy The y velocity of the point.
---@return number vz The z velocity of the point.
function Collider:getLinearVelocityFromWorldPoint(x, y, z) end

---Returns the linear velocity of a point on the Collider.  This includes the velocity of the center of mass plus the angular velocity at that point.
---
---@param point Vec3 The world-space point.
---@return number vx The x velocity of the point.
---@return number vy The y velocity of the point.
---@return number vz The z velocity of the point.
function Collider:getLinearVelocityFromWorldPoint(point) end

---Transforms a point from world coordinates into local coordinates relative to the Collider.
---
---@param wx number The x component of the world point.
---@param wy number The y component of the world point.
---@param wz number The z component of the world point.
---@return number x The x component of the local point.
---@return number y The y component of the local point.
---@return number z The z component of the local point.
function Collider:getLocalPoint(wx, wy, wz) end

---Transforms a point from world coordinates into local coordinates relative to the Collider.
---
---@param point Vec3 The world point.
---@return number x The x component of the local point.
---@return number y The y component of the local point.
---@return number z The z component of the local point.
function Collider:getLocalPoint(point) end

---Transforms a direction vector from world space to local space.
---
---@param wx number The x component of the world vector.
---@param wy number The y component of the world vector.
---@param wz number The z component of the world vector.
---@return number x The x component of the local vector.
---@return number y The y component of the local vector.
---@return number z The z component of the local vector.
function Collider:getLocalVector(wx, wy, wz) end

---Transforms a direction vector from world space to local space.
---
---@param vector Vec3 The world vector.
---@return number x The x component of the local vector.
---@return number y The y component of the local vector.
---@return number z The z component of the local vector.
function Collider:getLocalVector(vector) end

---Returns the mass of the Collider.
---
---The relative mass of colliders determines how they react when they collide.  A heavier collider has more momentum than a lighter collider moving the same speed, and will impart more force on the lighter collider.
---
---More generally, heavier colliders react less to forces they receive, including forces applied with functions like `Collider:applyForce`.
---
---Colliders with higher mass do not fall faster.  Use `Collider:setLinearDamping` to give a collider drag to make it fall slower or `Collider:setGravityScale` to change the way it reacts to gravity.
---
---#### Notes:
---
---By default, the mass of the Collider will be kept up to date automatically as shapes are added and removed from the Collider (or if the shapes change size or density).  Use `Collider:setAutomaticMass` to customize this.
---
---Mass can be overridden with `Collider:setMass`, or recomputed from the attached shapes with `Collider:resetMassData`.
---
---If the Collider is kinematic or all translation axes are disabled, this returns 0.
---
---@return number mass The mass of the Collider, in kilograms.
function Collider:getMass() end

---Returns the orientation of the Collider in angle/axis representation.
---
---#### Notes:
---
---If `World:interpolate` has been called, this returns an interpolated orientation between the last two physics updates.
---
---@return number angle The number of radians the Collider is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Collider:getOrientation() end

---Returns the position and orientation of the Collider.
---
---#### Notes:
---
---If `World:interpolate` has been called, this returns an interpolated pose between the last two physics updates.
---
---@return number x The x position of the Collider, in meters.
---@return number y The y position of the Collider, in meters.
---@return number z The z position of the Collider, in meters.
---@return number angle The number of radians the Collider is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Collider:getPose() end

---Returns the position of the Collider.
---
---#### Notes:
---
---If `World:interpolate` has been called, this returns an interpolated position between the last two physics updates.
---
---@return number x The x position of the Collider, in meters.
---@return number y The y position of the Collider, in meters.
---@return number z The z position of the Collider, in meters.
function Collider:getPosition() end

---Returns the restitution of the Collider.  Restitution makes a Collider bounce when it collides with other objects.  A restitution value of zero would result in an inelastic collision response, whereas 1.0 would result in an elastic collision that preserves all of the velocity. The restitution can be bigger than 1.0 to make the collision even more bouncy.
---
---#### Notes:
---
---To improve stability of the simulation and allow colliders to come to rest, restitution is only applied if the collider is moving above a certain speed.  This can be configured using the `restitutionThreshold` option in `lovr.physics.newWorld`.
---
---@return number restitution The restitution of the Collider.
function Collider:getRestitution() end

---Returns a Shape attached to the Collider.
---
---For the common case where a Collider only has a single shape, this is more convenient and efficient than extracting it from the table returned by `Collider:getShapes`.  It is always equivalent to `Collider:getShapes()[1]`.
---
---#### Notes:
---
---This may return `nil` if the Collider doesn't have any shapes attached to it.
---
---#### Example:
---
---```lua
---function drawBoxCollider(pass, collider)
---  local position = vec3(collider:getPosition())
---  local size = vec3(collider:getShape():getDimensions())
---  local orientation = quat(collider:getOrientation())
---  pass:box(position, size, orientation)
---end
---```
---
---@return Shape shape One of the `Shape` objects attached to the Collider.
function Collider:getShape() end

---Returns a list of Shapes attached to the Collider.
---
---@return table shapes A list of `Shape` objects attached to the Collider.
function Collider:getShapes() end

---Returns the Collider's tag.
---
---Tags are strings that represent the category of a collider.  Use `World:enableCollisionBetween` and `World:disableCollisionBetween` to control which pairs of tags should collide with each other.  Physics queries like `World:raycast` also use tags to filter their results.
---
---The list of available tags is set in `lovr.physics.newWorld`.
---
---@return string tag The Collider's tag.
function Collider:getTag() end

---Returns the Lua value associated with the Collider.
---
---#### Notes:
---
---The userdata is useful for linking a Collider with custom data:
---
---    local collider = world:raycast(origin, direction, 'enemy')
---
---    if collider then
---      -- Get the enemy object from its Collider
---      local enemy = collider:getUserData()
---      enemy.health = 0
---    end
---
---The user data is not shared between threads.  Each thread has its own user data for the Collider.
---
---@return * data The custom value associated with the Collider.
function Collider:getUserData() end

---Returns the World the Collider is in.
---
---#### Notes:
---
---Colliders can only ever be in the World that created them.
---
---@return World world The World the Collider is in.
function Collider:getWorld() end

---Transforms a local point relative to the collider to a point in world coordinates.
---
---@param x number The x component of the local point.
---@param y number The y component of the local point.
---@param z number The z component of the local point.
---@return number wx The x component of the world point.
---@return number wy The y component of the world point.
---@return number wz The z component of the world point.
function Collider:getWorldPoint(x, y, z) end

---Transforms a local point relative to the collider to a point in world coordinates.
---
---@param point Vec3 The local point.
---@return number wx The x component of the world point.
---@return number wy The y component of the world point.
---@return number wz The z component of the world point.
function Collider:getWorldPoint(point) end

---Transforms a direction vector from local space to world space.
---
---@param x number The x component of the local vector.
---@param y number The y component of the local vector.
---@param z number The z component of the local vector.
---@return number wx The x component of the world vector.
---@return number wy The y component of the world vector.
---@return number wz The z component of the world vector.
function Collider:getWorldVector(x, y, z) end

---Transforms a direction vector from local space to world space.
---
---@param vector Vec3 The local vector.
---@return number wx The x component of the world vector.
---@return number wy The y component of the world vector.
---@return number wz The z component of the world vector.
function Collider:getWorldVector(vector) end

---Returns whether the Collider is awake.
---
---#### Notes:
---
---See `Collider:setSleepingAllowed` for notes about sleeping.
---
---@return boolean awake Whether the Collider is finally awake.
function Collider:isAwake() end

---Returns whether the Collider uses continuous collision detection.
---
---Normally on each timestep a Collider will "teleport" to its new position based on its velocity. Usually this works fine, but if a Collider is going really fast relative to its size, then it might miss collisions with objects or pass through walls.  Enabling continuous collision detection means the Collider will check for obstacles along its path before moving to the new location.  This prevents the Collider from going through walls, but reduces performance.  It's usually used for projectiles, which tend to be small and really fast.
---
---#### Notes:
---
---The physics engine performs an optimization where continuous collision detection is only used if the Collider is moving faster than 75% of its size.  So it is not necessary to enable and disable continuous collision detection based on how fast the Collider is moving.
---
---Colliders that are sensors are not able to use continuous collision detection.
---
---@return boolean continuous Whether the Collider uses continuous collision detection.
function Collider:isContinuous() end

---Returns whether the collider has been destroyed.
---
---#### Notes:
---
---After a Collider is destroyed, calling methods on it or passing it to a function will throw an error.
---
---@return boolean destroyed Whether the collider has been destroyed.
function Collider:isDestroyed() end

---Returns whether the Collider is enabled.  When a Collider is disabled, it is removed from the World and does not impact the physics simulation in any way.  The Collider keeps all of its state and can be re-enabled to add it back to the World.
---
---#### Notes:
---
---Colliders are enabled when they are created.
---
---@return boolean enabled Whether the Collider is enabled.
function Collider:isEnabled() end

---Returns whether the Collider is currently ignoring gravity.
---
---@return boolean ignored Whether gravity is ignored for this Collider.
function Collider:isGravityIgnored() end

---Returns whether the Collider is kinematic.
---
---Kinematic colliders behave like they have infinite mass.  They ignore forces applied to them from gravity, joints, and collisions, but they can still move if given a velocity.  Kinematic colliders don't collide with other kinematic colliders.  They're useful for static environment objects in a level, or for objects that have their position managed outside of the physics system like tracked hands.
---
---#### Notes:
---
---If a Collider has a `MeshShape` or a `TerrainShape`, it will always be kinematic.
---
---@return boolean kinematic Whether the Collider is kinematic.
function Collider:isKinematic() end

---Returns whether the Collider is a sensor.  Sensors do not collide with other objects, but they can still sense collisions with the collision callbacks set by `World:setCallbacks`.  Use them to trigger gameplay behavior when an object is inside a region of space.
---
---#### Notes:
---
---Sensors are still reported as hits when doing raycasts and other queries.  Use tags to ignore sensors if needed.
---
---When a World is created, a set of collision tags can be marked as "static", for performance. Sensors do not detect collision with colliders that have a static tag.  Also, if a sensor itself has a static tag, it will not be able to detect collisions with sleeping colliders.  If a Collider enters a static sensor and goes to sleep, the `exit` callback is called and the sensor is no longer able to detect that collider.
---
---Sensors can not use continuous collision detection.
---
---Sensors will never go to sleep.
---
---#### Example:
---
---```lua
---danger = world:newBoxCollider(x, y, z, width, height, depth)
---danger:setKinematic(true)
---danger:setSensor(true)
---
---world:setCallbacks({
---  enter = function(a, b)
---    if (a == danger and b == player) or (a == player and b == danger) then
---      damagePlayer()
---    end
---  end
---})
---```
---
---@return boolean sensor Whether the Collider is a sensor.
function Collider:isSensor() end

---Returns whether the Collider is allowed to automatically go to sleep.
---
---When enabled, the Collider will go to sleep if it hasn't moved in a while.  The physics engine does not simulate movement for colliders that are asleep, which saves a lot of CPU for a typical physics world where most objects are at rest at any given time.
---
---#### Notes:
---
---Sleeping is enabled by default.  Sleeping can be disabled globally using the `allowSleep` option in `lovr.physics.newWorld`.
---
---Colliders can still be put to sleep manually with `Collider:setAwake`, even if automatic sleeping is disabled.
---
---Sleeping colliders will wake up when:
---
---- Colliding with a moving collider
---- Awakened explicitly with `Collider:setAwake`
---- Changing position `Collider:setPosition` or `Collider:setOrientation`
---- Changing velocity (to something non-zero)
---- Applying force, torque, or an impulse
---- Enabling a joint connected to the sleeping collider
---
---Notably, the following will not wake up the collider:
---
---- Changing its kinematic state with `Collider:setKinematic`
---- Changing its shape with `Collider:addShape` or `Collider:removeShape`
---- Disabling or destroying a sleeping collider it is resting on
---
---Sensors will never go to sleep.
---
---@return boolean sleepy Whether the Collider can go to sleep.
function Collider:isSleepingAllowed() end

---TODO
---
---#### Notes:
---
---
---
function Collider:moveKinematic() end

---Removes a Shape from the Collider.
---
---#### Notes:
---
---By default, LÖVR will recompute mass properties for the Collider as shapes are added and removed.  Use `Collider:setAutomaticMass` to enable or disable this behavior.
---
---It is valid for a Collider to have zero shapes, but due to a limitation of the physics engine LÖVR substitutes in a 1mm sphere so that the Collider still has mass.  It isn't advisable to keep these tiny spheres around.  Instead, prefer to quickly attach other shapes, or disable the Collider with `Collider:setEnabled`.
---
---@param shape Shape The Shape to remove.
function Collider:removeShape(shape) end

---Resets the mass, inertia, and center of mass of the Collider based on its attached shapes.
---
---If automatic mass is enabled, these properties will be kept up to date automatically.  Use this function when automatic mass is disabled or if mass needs to be reset after being overridden.
---
function Collider:resetMassData() end

---Sets the angular damping of the Collider.  Angular damping is similar to drag or air resistance, reducing the Collider's angular velocity over time.
---
---#### Notes:
---
---The default damping is .05, meaning the collider will lose approximately 5% of its velocity each second.  A damping value of zero means the Collider will not lose velocity over time.
---
---Negative damping is not meaningful and will be clamped to zero.
---
---@param damping number The angular damping.
function Collider:setAngularDamping(damping) end

---Sets the angular velocity of the Collider.
---
---#### Notes:
---
---Although setting the velocity directly is useful sometimes, it can cause problems:
---
---- Velocity ignores mass, so it can lead to unnaturally sharp changes in motion.
---- If the velocity of a Collider is changed multiple times during a frame, only the last one is
---  going to have an effect, nullifying the other velocities that were set.
---- Setting the velocity of a Collider every frame can mess up collisions, since the forces used
---  to resolve a collision will get ignored by changing the velocity.
---
---Using forces and impulses to move Colliders will avoid all of these issues.
---
---If the Collider is asleep, setting the angular velocity to a non-zero value will wake it up.
---
---If the Collider has a tag that was marked as static when the World was created, then the Collider can not move and this function will do nothing.
---
---@param vx number The x component of the angular velocity.
---@param vy number The y component of the angular velocity.
---@param vz number The z component of the angular velocity.
function Collider:setAngularVelocity(vx, vy, vz) end

---Sets the angular velocity of the Collider.
---
---#### Notes:
---
---Although setting the velocity directly is useful sometimes, it can cause problems:
---
---- Velocity ignores mass, so it can lead to unnaturally sharp changes in motion.
---- If the velocity of a Collider is changed multiple times during a frame, only the last one is
---  going to have an effect, nullifying the other velocities that were set.
---- Setting the velocity of a Collider every frame can mess up collisions, since the forces used
---  to resolve a collision will get ignored by changing the velocity.
---
---Using forces and impulses to move Colliders will avoid all of these issues.
---
---If the Collider is asleep, setting the angular velocity to a non-zero value will wake it up.
---
---If the Collider has a tag that was marked as static when the World was created, then the Collider can not move and this function will do nothing.
---
---@param velocity Vec3 The angular velocity of the Collider.
function Collider:setAngularVelocity(velocity) end

---Enables or disables automatic mass for the Collider.
---
---When enabled, the Collider's mass, inertia, and center of mass will be recomputed when:
---
---- A shape is added to or removed from the Collider.
---- A shape attached to the Collider changes shape (e.g. `SphereShape:setRadius`).
---- A shape attached to the Collider is moved using `Shape:setOffset`.
---- A shape attached to the Collider changes its density using `Shape:setDensity`.
---
---Additionally, changing the center of mass of a Collider will automatically update its inertia when automatic mass is enabled.
---
---Disable this to manage the mass properties manually.  When automatic mass is disabled, `Collider:resetMassData` can still be used to reset the mass from attached shapes if needed.
---
---@param enable boolean Whether automatic mass should be enabled.
function Collider:setAutomaticMass(enable) end

---Puts the Collider to sleep or wakes it up manually.
---
---#### Notes:
---
---This function can still be used to put a Collider to sleep even if automatic sleeping has been disabled with `Collider:setSleepingAllowed`.
---
---@param awake boolean Whether the Collider should be awake.
function Collider:setAwake(awake) end

---Sets the Collider's center of mass, in the Collider's local coordinate space.
---
---This does not change the Collider's position.
---
---#### Notes:
---
---By default, the center of mass of the Collider is kept up to date automatically as the Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.
---
---Use `Collider:resetMassData` to reset the center and other mass properties based on the Collider's shapes.
---
---@param x number The x component of the center of mass.
---@param y number The y component of the center of mass.
---@param z number The z component of the center of mass.
function Collider:setCenterOfMass(x, y, z) end

---Sets the Collider's center of mass, in the Collider's local coordinate space.
---
---This does not change the Collider's position.
---
---#### Notes:
---
---By default, the center of mass of the Collider is kept up to date automatically as the Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.
---
---Use `Collider:resetMassData` to reset the center and other mass properties based on the Collider's shapes.
---
---@param center Vec3 The center of mass.
function Collider:setCenterOfMass(center) end

---Sets whether the Collider uses continuous collision detection.
---
---Normally on each timestep a Collider will "teleport" to its new position based on its velocity. Usually this works fine, but if a Collider is going really fast relative to its size, then it might miss collisions with objects or pass through walls.  Enabling continuous collision detection means the Collider will check for obstacles along its path before moving to the new location.  This prevents the Collider from going through walls, but reduces performance.  It's usually used for projectiles, which tend to be small and really fast.
---
---#### Notes:
---
---The physics engine performs an optimization where continuous collision detection is only used if the Collider is moving faster than 75% of its size.  So it is not necessary to enable and disable continuous collision detection based on how fast the Collider is moving.
---
---Colliders that are sensors are not able to use continuous collision detection.
---
---@param continuous boolean Whether the Collider uses continuous collision detection.
function Collider:setContinuous(continuous) end

---Set the degrees of freedom of the Collider.
---
---#### Notes:
---
---The default state is `xyz` for both translation and rotation.
---
---The physics engine does not support disabling all degrees of freedom.  At least one translation or rotation axis needs to be enabled.  To disable all movement for a collider, make it kinematic.
---
---When all translation axes are disabled, `Collider:getMass` will return 0.
---
---When all rotation axes are disabled, `Collider:getInertia` will return zero/identity.
---
---@param translation string A string containing the world-space axes the Collider is allowed to move on.  The string should have 'x', 'y', and 'z' letters representing the axes to enable.  Use nil or an empty string to disable all translation.
---@param rotation string A string containing the world-space axes the Collider is allowed to rotate on.  The string should have 'x', 'y', and 'z' letters representing the axes to enable.  Use nil or an empty string to disable all rotation.
function Collider:setDegreesOfFreedom(translation, rotation) end

---Enables or disables the Collider.  When a Collider is disabled, it is removed from the World and does not impact the physics simulation in any way.  The Collider keeps all of its state and can be re-enabled to add it back to the World.
---
---@param enable boolean Whether the Collider should be enabled.
function Collider:setEnabled(enable) end

---Sets the friction of the Collider.  Friction determines how easy it is for two colliders to slide against each other.  Low friction makes it easier for a collider to slide, simulating a smooth surface.
---
---#### Notes:
---
---The default friction is .2.
---
---When two colliders collide, their friction is combined using the geometric mean:
---
---    friction = (frictionA * frictionB) ^ .5
---
---@param friction number The friction of the Collider.
function Collider:setFriction(friction) end

---Sets whether the Collider should ignore gravity.
---
---@param ignored boolean Whether gravity should be ignored.
function Collider:setGravityIgnored(ignored) end

---Sets the gravity scale of the Collider.  This is multiplied with the global gravity from the World, so 1.0 is regular gravity, 0.0 will ignore gravity, etc.
---
---@param scale number The gravity scale.
function Collider:setGravityScale(scale) end

---Sets the inertia of the Collider.
---
---Inertia is kind of like "angular mass".  Regular mass determines how resistant the Collider is to linear forces (movement), whereas inertia determines how resistant the Collider is to torque (rotation).  Colliders with less inertia are more spinny.
---
---In 3D, inertia is represented by a 3x3 matrix, called a tensor.  To make calculations easier, the physics engine stores the inertia using eigenvalue decomposition, splitting the matrix into a diagonal matrix and a rotation.  It's complicated!
---
---In a realistic simulation, mass and inertia follow a linear relationship.  If the mass of an object increases, the diagonal part of its inertia should increase proportionally.
---
---#### Notes:
---
---By default, the inertia of the Collider is kept up to date automatically as the Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.
---
---Use `Collider:resetMassData` to reset the inertia and other mass properties based on the Collider's shapes.
---
---If the Collider is kinematic or all rotation axes are disabled, the collider behaves as though it has infinite inertia, and this function will do nothing.
---
---@param dx number The x component of the diagonal matrix.
---@param dy number The y component of the diagonal matrix.
---@param dz number The z component of the diagonal matrix.
---@param angle number The angle of the inertia rotation, in radians.
---@param ax number The x component of the rotation axis.
---@param ay number The y component of the rotation axis.
---@param az number The z component of the rotation axis.
function Collider:setInertia(dx, dy, dz, angle, ax, ay, az) end

---Sets the inertia of the Collider.
---
---Inertia is kind of like "angular mass".  Regular mass determines how resistant the Collider is to linear forces (movement), whereas inertia determines how resistant the Collider is to torque (rotation).  Colliders with less inertia are more spinny.
---
---In 3D, inertia is represented by a 3x3 matrix, called a tensor.  To make calculations easier, the physics engine stores the inertia using eigenvalue decomposition, splitting the matrix into a diagonal matrix and a rotation.  It's complicated!
---
---In a realistic simulation, mass and inertia follow a linear relationship.  If the mass of an object increases, the diagonal part of its inertia should increase proportionally.
---
---#### Notes:
---
---By default, the inertia of the Collider is kept up to date automatically as the Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.
---
---Use `Collider:resetMassData` to reset the inertia and other mass properties based on the Collider's shapes.
---
---If the Collider is kinematic or all rotation axes are disabled, the collider behaves as though it has infinite inertia, and this function will do nothing.
---
---@param diagonal Vec3 A vector containing the 3 elements of a diagonal matrix.
---@param rotation Quat The inertia rotation.
function Collider:setInertia(diagonal, rotation) end

---Sets whether the Collider is kinematic.
---
---Kinematic colliders behave like they have infinite mass.  They ignore forces applied to them from gravity, joints, and collisions, but they can still move if given a velocity.  Kinematic colliders don't collide with other kinematic colliders.  They're useful for static environment objects in a level, or for objects that have their position managed outside of the physics system like tracked hands.
---
---#### Notes:
---
---If a Collider has a `MeshShape` or a `TerrainShape`, the collider will always be kinematic and this function will do nothing.
---
---@param kinematic boolean Whether the Collider should be kinematic.
function Collider:setKinematic(kinematic) end

---Sets the linear damping of the Collider.  Linear damping is similar to drag or air resistance, slowing the Collider down over time.
---
---#### Notes:
---
---The default damping is .05, meaning the collider will lose approximately 5% of its velocity each second.  A damping value of zero means the Collider will not lose velocity over time.
---
---Negative damping is not meaningful and will be clamped to zero.
---
---@param damping number The linear damping.
function Collider:setLinearDamping(damping) end

---Sets the world-space linear velocity of the center of mass of the Collider.
---
---#### Notes:
---
---Although setting the velocity directly is useful sometimes, it can cause problems:
---
---- Velocity ignores mass, so it can lead to unnaturally sharp changes in motion.
---- If the velocity of a Collider is changed multiple times during a frame, only the last one is
---  going to have an effect, nullifying the other velocities that were set.
---- Setting the velocity of a Collider every frame can mess up collisions, since the forces used
---  to resolve a collision will get ignored by changing the velocity.
---
---Using forces and impulses to move Colliders will avoid all of these issues.
---
---If the Collider is asleep, setting the velocity to a non-zero value will wake it up.
---
---If the Collider has a tag that was marked as static when the World was created, then the Collider can not move and this function will do nothing.
---
---Currently, velocity is clamped to 500 meters per second to improve stability of the simulation.
---
---@param vx number The x component of the new velocity, in meters per second.
---@param vy number The y component of the new velocity, in meters per second.
---@param vz number The z component of the new velocity, in meters per second.
function Collider:setLinearVelocity(vx, vy, vz) end

---Sets the world-space linear velocity of the center of mass of the Collider.
---
---#### Notes:
---
---Although setting the velocity directly is useful sometimes, it can cause problems:
---
---- Velocity ignores mass, so it can lead to unnaturally sharp changes in motion.
---- If the velocity of a Collider is changed multiple times during a frame, only the last one is
---  going to have an effect, nullifying the other velocities that were set.
---- Setting the velocity of a Collider every frame can mess up collisions, since the forces used
---  to resolve a collision will get ignored by changing the velocity.
---
---Using forces and impulses to move Colliders will avoid all of these issues.
---
---If the Collider is asleep, setting the velocity to a non-zero value will wake it up.
---
---If the Collider has a tag that was marked as static when the World was created, then the Collider can not move and this function will do nothing.
---
---Currently, velocity is clamped to 500 meters per second to improve stability of the simulation.
---
---@param velocity Vec3 The new velocity, in meters per second.
function Collider:setLinearVelocity(velocity) end

---Sets the mass of the Collider.
---
---The relative mass of colliders determines how they react when they collide.  A heavier collider has more momentum than a lighter collider moving the same speed, and will impart more force on the lighter collider.
---
---More generally, heavier colliders react less to forces they receive, including forces applied with functions like `Collider:applyForce`.
---
---Colliders with higher mass do not fall faster.  Use `Collider:setLinearDamping` to give a collider drag to make it fall slower or `Collider:setGravityScale` to change the way it reacts to gravity.
---
---#### Notes:
---
---The mass must be positive.  Attempting to set a zero or negative mass will error.
---
---By default, the mass of the Collider is kept up to date automatically as the Collider's shapes change.  Use `Collider:setAutomaticMass` to disable this.
---
---Use `Collider:resetMassData` to reset the mass based on the Collider's shapes.
---
---If the Collider is kinematic or all translation axes are disabled, this function will do nothing.
---
---@param mass number The new mass for the Collider, in kilograms.
function Collider:setMass(mass) end

---Sets the orientation of the Collider in angle/axis representation.
---
---@param angle number The number of radians the Collider is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Collider:setOrientation(angle, ax, ay, az) end

---Sets the orientation of the Collider in angle/axis representation.
---
---@param orientation Quat The orientation of the Collider.
function Collider:setOrientation(orientation) end

---Sets the position and orientation of the Collider.
---
---@param x number The x position of the Collider, in meters.
---@param y number The y position of the Collider, in meters.
---@param z number The z position of the Collider, in meters.
---@param angle number The number of radians the Collider is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Collider:setPose(x, y, z, angle, ax, ay, az) end

---Sets the position and orientation of the Collider.
---
---@param position Vec3 The position of the Collider, in meters.
---@param orientation Quat The orientation of the Collider.
function Collider:setPose(position, orientation) end

---Sets the position of the Collider.
---
---@param x number The x position of the Collider, in meters.
---@param y number The y position of the Collider, in meters.
---@param z number The z position of the Collider, in meters.
function Collider:setPosition(x, y, z) end

---Sets the position of the Collider.
---
---@param position Vec3 The position of the Collider, in meters.
function Collider:setPosition(position) end

---Sets the restitution of the Collider.  Restitution makes a Collider bounce when it collides with other objects.  A restitution value of zero would result in an inelastic collision response, whereas 1.0 would result in an elastic collision that preserves all of the velocity.
---
---#### Notes:
---
---To improve stability of the simulation and allow colliders to come to rest, restitution is only applied if the collider is moving above a certain speed.  This can be configured using the `restitutionThreshold` option in `lovr.physics.newWorld`.
---
---Negative restitution is not meaningful and is clamped to zero.
---
---@param restitution number The restitution of the Collider.
function Collider:setRestitution(restitution) end

---Sets whether the Collider should be a sensor.  Sensors do not collide with other objects, but they can still sense collisions with the collision callbacks set by `World:setCallbacks`.  Use them to trigger gameplay behavior when an object is inside a region of space.
---
---#### Notes:
---
---Sensors are still reported as hits when doing raycasts and other queries.  Use tags to ignore sensors if needed.
---
---When a World is created, a set of collision tags can be marked as "static", for performance. Sensors do not detect collision with colliders that have a static tag.  Also, if a sensor itself has a static tag, it will not be able to detect collisions with sleeping colliders.  If a Collider enters a static sensor and goes to sleep, the `exit` callback is called and the sensor is no longer able to detect that collider.
---
---Sensors can not use continuous collision detection.
---
---Sensors will never go to sleep.
---
---@param sensor boolean Whether the Collider should be a sensor.
function Collider:setSensor(sensor) end

---Sets whether the Collider is allowed to automatically go to sleep.
---
---When enabled, the Collider will go to sleep if it hasn't moved in a while.  The physics engine does not simulate movement for colliders that are asleep, which saves a lot of CPU for a typical physics world where most objects are at rest at any given time.
---
---#### Notes:
---
---Sleeping is enabled by default.  Sleeping can be disabled globally using the `allowSleep` option in `lovr.physics.newWorld`.
---
---Colliders can still be put to sleep manually with `Collider:setAwake`, even if automatic sleeping is disabled.
---
---Sleeping colliders will wake up when:
---
---- Colliding with a moving collider
---- Awakened explicitly with `Collider:setAwake`
---- Changing position `Collider:setPosition` or `Collider:setOrientation`
---- Changing velocity (to something non-zero)
---- Applying force, torque, or an impulse
---- Enabling a joint connected to the sleeping collider
---
---Notably, the following will not wake up the collider:
---
---- Changing its kinematic state with `Collider:setKinematic`
---- Changing its shape with `Collider:addShape` or `Collider:removeShape`
---- Disabling or destroying a sleeping collider it is resting on
---
---Sensors will never go to sleep.
---
---@param sleepy boolean Whether the Collider can go to sleep.
function Collider:setSleepingAllowed(sleepy) end

---Sets the Collider's tag.
---
---Tags are strings that represent the category of a collider.  Use `World:enableCollisionBetween` and `World:disableCollisionBetween` to control which pairs of tags should collide with each other.  Physics queries like `World:raycast` also use tags to filter their results.
---
---The list of available tags is set in `lovr.physics.newWorld`.
---
---@param tag string The Collider's tag.
function Collider:setTag(tag) end

---Sets the Collider's tag.
---
---Tags are strings that represent the category of a collider.  Use `World:enableCollisionBetween` and `World:disableCollisionBetween` to control which pairs of tags should collide with each other.  Physics queries like `World:raycast` also use tags to filter their results.
---
---The list of available tags is set in `lovr.physics.newWorld`.
---
function Collider:setTag() end

---Associates a Lua value with the Collider.
---
---#### Notes:
---
---Set the user data to `nil` to clear any existing reference.
---
---The userdata is useful for linking a Collider with custom data:
---
---    local collider = world:raycast(origin, direction, 'enemy')
---
---    if collider then
---      -- Get the enemy object from its Collider
---      local enemy = collider:getUserData()
---      enemy.health = 0
---    end
---
---The user data is not shared between threads.  Each thread has its own user data for the Collider.
---
---@param data any The custom value to associate with the Collider.
function Collider:setUserData(data) end

---TODO
---@class ConeJoint
local ConeJoint = {}

---Returns the axis of the ConeJoint, in world space.  The axis is relative to the first Collider connected to the Joint, so it will rotate as the collider does.  The relative angle between the axis and the second collider will be constrained based on the ConeJoint's angle limit.
---
---@return number ax The x component of the axis.
---@return number ay The y component of the axis.
---@return number az The z component of the axis.
function ConeJoint:getAxis() end

---Returns the angle limit of the ConeJoint.  The relative angle between the ConeJoint's axis and the second Collider will be constrained to this limit.
---
---#### Notes:
---
---The default limit is zero, preventing any rotation away from the axis.
---
---@return number limit The angle limit, in radians.
function ConeJoint:getLimit() end

---Sets the angle limit of the ConeJoint.  The relative angle between the ConeJoint's axis and the second Collider will be constrained to this limit.
---
---#### Notes:
---
---The default limit is zero, preventing any rotation away from the axis.
---
---@param limit number The new limit in radians, between 0 and pi.
function ConeJoint:setLimit(limit) end

---TODO
---@class Contact
local Contact = {}

---Returns the two Colliders that are in contact.
---
---@return Collider first The first collider.
---@return Collider second The second collider.
function Contact:getColliders() end

---Returns the friction of the Contact.  Lower friction makes it easier for the colliders to slide against each other.
---
---@return number friction The contact friction.
function Contact:getFriction() end

---Returns the normal vector of the Contact.  This is a direction vector that represents which direction the second collider should move to resolve the collision.
---
---@return number x The x component of the normal vector.
---@return number y The y component of the normal vector.
---@return number z The z component of the normal vector.
function Contact:getNormal() end

---Returns the amount of overlap between the colliders.
---
---@return number overlap The amount of overlap, in meters.
function Contact:getOverlap() end

---Returns the contact points of the Contact.  These are the points where the colliders are intersecting.
---
---@return number ...points Triplets of x/y/z numbers, one for each contact point.
function Contact:getPoints() end

---Returns the restitution of the Contact.  Restitution makes the Colliders bounce off of each other.  A restitution value of zero results in an inelastic collision response, whereas 1.0 results in an elastic collision that preserves all of the velocity.  Restitution can be bigger than 1.0 to make the collision even more bouncy.
---
---#### Notes:
---
---The default restitution is the maximum restitution of either of the colliders.
---
---@return number restitution The contact restitution.
function Contact:getRestitution() end

---Returns the two Shapes that are in contact.
---
---@return Shape first The first shape.
---@return Shape second The second shape.
function Contact:getShapes() end

---Returns the world space surface velocity of the Contact.  This can be used to achieve a conveyor belt effect.
---
---@return number x The x component of the surface velocity.
---@return number y The y component of the surface velocity.
---@return number z The z component of the surface velocity.
function Contact:getSurfaceVelocity() end

---Returns whether the Contact is enabled.  Disabled contacts do not generate any collision response.  Use `Contact:setEnabled` to disable a contact to selectively ignore certain collisions.
---
---@return boolean enabled Whether the Contact is enabled.
function Contact:isEnabled() end

---Enables or disables the Contact.  Disabled contacts do not generate any collision response.
---
---#### Notes:
---
---Note that this is the slowest way to ignore a collision.  Faster ways to disable collisions (in increasing order of speed) are:
---
---- The `filter` callback in `World:setCallbacks`
---- Disabling collision between tags with `World:disableCollisionBetween`
---- Removing the collider from the World completely with `Collider:setEnabled`
---
---@param enable boolean Whether the Contact should be enabled.
function Contact:setEnabled(enable) end

---Sets the friction of the Contact.  Lower friction makes it easier for the colliders to slide against each other.  This overrides the default friction computed by the friction of the two Colliders.
---
---#### Notes:
---
---The default friction is computed from the geometric mean of the Colliders' friction:
---
---    friction = (frictionA * frictionB) ^ .5
---
---Negative frictions will be clamped to zero.
---
---@param friction number The contact friction.
function Contact:setFriction(friction) end

---Sets the restitution of the Contact.  Restitution makes the Colliders bounce off of each other. A restitution value of zero results in an inelastic collision response, whereas 1.0 results in an elastic collision that preserves all of the velocity.  Restitution can be bigger than 1.0 to make the collision even more bouncy.
---
---#### Notes:
---
---The default restitution is the maximum restitution of either of the colliders.
---
---Negative restitution values will be clamped to zero.
---
---@param restitution number The contact restitution.
function Contact:setRestitution(restitution) end

---Sets the world space surface velocity of the Contact.  This can be used to achieve a conveyor belt effect.
---
---@param x number The x component of the surface velocity.
---@param y number The y component of the surface velocity.
---@param z number The z component of the surface velocity.
function Contact:setSurfaceVelocity(x, y, z) end

---Sets the world space surface velocity of the Contact.  This can be used to achieve a conveyor belt effect.
---
---@param velocity Vec3 The surface velocity.
function Contact:setSurfaceVelocity(velocity) end

---A type of `Shape` that is a convex hull of a collection of points, allowing for custom collision shapes.  It is similar to a `MeshShape`, but it is not required to be kinematic, and it will use the convex hull of the mesh instead of using the exact triangles of the object.
---
---Convex shapes can be created from a `Model`, `ModelData`, `Mesh`, or a table of point positions, similar to `MeshShape`.
---
---Convex shapes can be cloned by passing in an existing ConvexShape to clone:
---
---    model = lovr.data.newModelData('rock.glb')
---    parent = lovr.physics.newConvexShape(model)
---    clone = lovr.physics.newConvexShape(parent, scale)
---
---The clone will reuse all of the data from the parent, which speeds things up a lot.
---
---Convex shapes can have a custom scale applied to their points, and clones can have their own scale.
---@class ConvexShape
local ConvexShape = {}

---Returns the indices of points that make up one of the faces of the convex hull.
---
---@param index number The index of the face.
---@return table points A table with point indices.  Use `ConvexShape:getPoint` to get the coordinates.  The points are given in counterclockwise order.
function ConvexShape:getFace(index) end

---Returns the number of faces in the convex hull.
---
---@return number count The number of faces.
function ConvexShape:getFaceCount() end

---Returns one of the points in the convex hull, in local space.
---
---#### Notes:
---
---The point positions will be scaled by the ConvexShape's scale, see `ConvexShape:getScale`.
---
---@param index number The index of the point.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
function ConvexShape:getPoint(index) end

---Returns the number of points in the convex hull.
---
---#### Notes:
---
---This isn't necessarily the same as the number of points or vertices that were used to create the shape, since points inside the hull will be discarded.
---
---@return number count The number of points.
function ConvexShape:getPointCount() end

---Returns the scale the ConvexShape was created with.
---
---@return number scale The scale.
function ConvexShape:getScale() end

---A type of `Shape` that can be used for cylinder-shaped things.
---@class CylinderShape
local CylinderShape = {}

---Returns the length of the CylinderShape.
---
---@return number length The length of the cylinder, in meters.
function CylinderShape:getLength() end

---Returns the radius of the CylinderShape.
---
---@return number radius The radius of the cylinder, in meters.
function CylinderShape:getRadius() end

---Sets the length of the CylinderShape.
---
---#### Notes:
---
---This changes the mass of the shape.  If the shape is attached to a collider with automatic mass enabled, the mass properties of the collider will update as well.
---
---Changing shapes can make the physics engine explode since it can cause objects to overlap in unnatural ways.
---
---@param length number The new length, in meters.
function CylinderShape:setLength(length) end

---Sets the radius of the CylinderShape.
---
---#### Notes:
---
---This changes the mass of the shape.  If the shape is attached to a collider with automatic mass enabled, the mass properties of the collider will update as well.
---
---Changing shapes can make the physics engine explode since it can cause objects to overlap in unnatural ways.
---
---@param radius number The new radius, in meters.
function CylinderShape:setRadius(radius) end

---A DistanceJoint is a type of `Joint` that tries to keep two colliders within a certain distance. The distance is determined by the initial distance between the anchor points.  The joint allows for rotation on the anchor points.
---@class DistanceJoint
local DistanceJoint = {}

---Returns the minimum and maximum distance allowed between the Colliders.
---
---#### Notes:
---
---The limits default to the distance between the Colliders when the Joint was created.
---
---@return number min The minimum distance, in meters.  The Colliders won't be able to get closer than this.
---@return number max The maximum distance, in meters.  The Colliders won't be able to get further than this.
function DistanceJoint:getLimits() end

---Returns the DistanceJoint's spring parameters.  Use this to control how fast the joint pulls the colliders back together at the distance limits.
---
---#### Notes:
---
---Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled and the limits will be as stiff as possible.
---
---The damping ratio controls how quickly the oscillation slows down:
---
---- Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
---  still lose a small amount of energy over time).
---- Underdamped: Damping less than one results in a system that is underdamped.  The spring will
---  oscillate around the target, but the oscillations will decay over time, eventually stabilizing
---  at the target.
---- Overdamped: Damping greater than one will not have any oscillation, and the spring will take
---  extra time to reach the target.
---- Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
---  takes the minimum amount of time to reach the target (based on the frequency).
---
---The default damping ratio is 1.
---
---@return number frequency The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@return number damping The damping ratio of the spring.
function DistanceJoint:getSpring() end

---Sets the minimum and maximum distance allowed between the Colliders.
---
---#### Notes:
---
---The limits default to the distance between the Colliders when the Joint was created.
---
---@param min? number The minimum distance, in meters.  The Colliders won't be able to get closer than this.
---@param max? number The maximum distance, in meters.  The Colliders won't be able to get further than this.
function DistanceJoint:setLimits(min, max) end

---Sets the minimum and maximum distance allowed between the Colliders.
---
---#### Notes:
---
---The limits default to the distance between the Colliders when the Joint was created.
---
function DistanceJoint:setLimits() end

---Sets the DistanceJoint's spring parameters.  Use this to control how fast the joint pulls the colliders back together at the distance limits.
---
---#### Notes:
---
---Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled and the limits will be as stiff as possible.
---
---The damping ratio controls how quickly the oscillation slows down:
---
---- Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
---  still lose a small amount of energy over time).
---- Underdamped: Damping less than one results in a system that is underdamped.  The spring will
---  oscillate around the target, but the oscillations will decay over time, eventually stabilizing
---  at the target.
---- Overdamped: Damping greater than one will not have any oscillation, and the spring will take
---  extra time to reach the target.
---- Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
---  takes the minimum amount of time to reach the target (based on the frequency).
---
---@param frequency? number The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@param damping? number The damping ratio of the spring.
function DistanceJoint:setSpring(frequency, damping) end

---A HingeJoint is a type of `Joint` that only allows colliders to rotate on a single axis.
---@class HingeJoint
local HingeJoint = {}

---Returns the current angle of the HingeJoint, relative to the rest position.
---
---@return number angle The hinge angle, in radians.
function HingeJoint:getAngle() end

---Returns the axis of the hinge, in world space.
---
---@return number x The x component of the axis.
---@return number y The y component of the axis.
---@return number z The z component of the axis.
function HingeJoint:getAxis() end

---Returns the friction of the HingeJoint.  This is a maximum torque force that will be applied, in newton meters.
---
---#### Notes:
---
---Friction is only applied when the motor is disabled.
---
---@return number friction The friction, in newton meters.
function HingeJoint:getFriction() end

---Returns the angle limits of the HingeJoint.  The "zero" angle is determined by the relative position of the colliders at the time the joint was created.
---
---#### Notes:
---
---The default limits are -π and π.
---
---@return number min The minimum angle, in radians.  Always between -π and 0.
---@return number max The maximum angle, in radians.  Always between 0 and π.
function HingeJoint:getLimits() end

---Returns the maximum amount of torque the motor can use to reach its target, in newton meters.
---
---There are separate limits for each direction the hinge can move.  They're usually kept the same, but one of them can be set to zero to make a motor that can only push in one direction.  Note that both limits are positive.
---
---@return number positive The maximum amount of torque the motor can use to push the hinge in the "positive" direction, in newton meters.
---@return number negative The maximum amount of torque the motor can use to push the hinge in the "negative" direction, in newton meters.
function HingeJoint:getMaxMotorTorque() end

---Returns the motor mode of the HingeJoint.  When enabled, the motor will drive the hinge to a target angle (for the `position` mode) or a target speed (for the `velocity` mode), set by `HingeJoint:setMotorTarget`.
---
---@return MotorMode mode The mode of the motor, or `nil` if the motor is disabled.
function HingeJoint:getMotorMode() end

---Returns the spring parameters of the motor target.  These are similar to the spring parameters set by `HingeJoint:setSpring`, but they apply to the motor when it reaches its target instead of the angle limits of the hinge joint.  Note that these only take effect when the motor mode is `position`.
---
---#### Notes:
---
---See `HingeJoint:setSpring` for more detailed info on how the spring parameters work.
---
---@return number frequency The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@return number damping The damping ratio of the spring.
function HingeJoint:getMotorSpring() end

---Returns the target value for the HingeJoint's motor.  This is either a target angle or a target velocity, based on the mode set by `HingeJoint:setMotorMode`.
---
---@return number target The target value, in radians or radians per second, depending on the mode.
function HingeJoint:getMotorTarget() end

---Returns the current torque the motor is using to reach its target, in newton meters.
---
---@return number torque The current torque, in newton meters.
function HingeJoint:getMotorTorque() end

---Returns the spring parameters of the HingeJoint.  Use this to make the angle limits of the hinge "soft".  When the motor is active, a separate set of spring parameters can be set on the motor, see `HingeJoint:setMotorSpring`.
---
---#### Notes:
---
---Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled and the limits will be as stiff as possible.
---
---The damping ratio controls how quickly the oscillation slows down:
---
---- Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
---  still lose a small amount of energy over time).
---- Underdamped: Damping less than one results in a system that is underdamped.  The spring will
---  oscillate around the target, but the oscillations will decay over time, eventually stabilizing
---  at the target.
---- Overdamped: Damping greater than one will not have any oscillation, and the spring will take
---  extra time to reach the target.
---- Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
---  takes the minimum amount of time to reach the target (based on the frequency).
---
---The default damping ratio is 1.
---
---@return number frequency The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@return number damping The damping ratio of the spring.
function HingeJoint:getSpring() end

---Sets the friction of the HingeJoint.  This is a maximum torque force that will be applied, in newton meters.
---
---#### Notes:
---
---Friction is only applied when the motor is disabled.
---
---@param friction number The friction, in newton meters.
function HingeJoint:setFriction(friction) end

---Sets the angle limits of the HingeJoint.  The "zero" angle is determined by the relative position of the colliders at the time the joint was created.
---
---#### Notes:
---
---The default limits are -π and π.
---
---@param min number The minimum angle, in radians.  Should be between -π and 0.
---@param max number The maximum angle, in radians.  Should be between 0 and π.
function HingeJoint:setLimits(min, max) end

---Sets the angle limits of the HingeJoint.  The "zero" angle is determined by the relative position of the colliders at the time the joint was created.
---
---#### Notes:
---
---The default limits are -π and π.
---
function HingeJoint:setLimits() end

---Sets the maximum amount of torque the motor can use to reach its target, in newton meters.
---
---There are separate limits for each direction the hinge can move.  They're usually kept the same, but one of them can be set to zero to make a motor that can only push in one direction.  Note that both limits are positive.
---
---@param positive? number The maximum amount of torque the motor can use to push the hinge in the "positive" direction, in newton meters.
---@param negative? number The maximum amount of torque the motor can use to push the hinge in the "negative" direction, in newton meters.
function HingeJoint:setMaxMotorTorque(positive, negative) end

---Sets the motor mode of the HingeJoint.  When enabled, the motor will drive the hinge to a target angle (for the `position` mode) or a target speed (for the `velocity` mode), set by `HingeJoint:setMotorTarget`.
---
---@param mode MotorMode The mode of the motor.
function HingeJoint:setMotorMode(mode) end

---Sets the motor mode of the HingeJoint.  When enabled, the motor will drive the hinge to a target angle (for the `position` mode) or a target speed (for the `velocity` mode), set by `HingeJoint:setMotorTarget`.
---
function HingeJoint:setMotorMode() end

---Sets the spring parameters of the motor target.  These are similar to the spring parameters set by `HingeJoint:setSpring`, but they apply to the motor when it reaches its target instead of the angle limits of the hinge joint.  Note that these only take effect when the motor mode is `position`.
---
---#### Notes:
---
---See `HingeJoint:setSpring` for more detailed info on how the spring parameters work.
---
---@param frequency? number The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@param damping? number The damping ratio of the spring.
function HingeJoint:setMotorSpring(frequency, damping) end

---Sets the target value for the HingeJoint's motor.  This is either a target angle or a target velocity, based on the mode set by `HingeJoint:setMotorMode`.
---
---@param target number The target value, in radians or radians per second, depending on the mode.
function HingeJoint:setMotorTarget(target) end

---Sets the spring parameters of the HingeJoint.  Use this to make the angle limits of the hinge "soft".  When the motor is active, a separate set of spring parameters can be set on the motor, see `HingeJoint:setMotorSpring`.
---
---#### Notes:
---
---Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled and the limits will be as stiff as possible.
---
---The damping ratio controls how quickly the oscillation slows down:
---
---- Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
---  still lose a small amount of energy over time).
---- Underdamped: Damping less than one results in a system that is underdamped.  The spring will
---  oscillate around the target, but the oscillations will decay over time, eventually stabilizing
---  at the target.
---- Overdamped: Damping greater than one will not have any oscillation, and the spring will take
---  extra time to reach the target.
---- Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
---  takes the minimum amount of time to reach the target (based on the frequency).
---
---@param frequency? number The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@param damping? number The damping ratio of the spring.
function HingeJoint:setSpring(frequency, damping) end

---A Joint is a physics object that constrains the movement of two Colliders.
---@class Joint
local Joint = {}

---Destroys the Joint, removing it from the World and breaking the connection between its Colliders.  There is no way to get the Joint back after destroying it, and attempting to use it will throw an error.  To temporarily disable a Joint, use `Joint:setEnabled`.
---
---#### Notes:
---
---Joints are automatically destroyed if either of their Colliders are destroyed or if the World is destroyed or garbage collected.
---
function Joint:destroy() end

---Returns the world space anchor points of the Joint.  Joints are attached to each collider at a single point, which is defined when the Joint is created.
---
---@return number x1 The x coordinate of the anchor point on the first Collider, in world space.
---@return number y1 The y coordinate of the anchor point on the first Collider, in world space.
---@return number z1 The z coordinate of the anchor point on the first Collider, in world space.
---@return number x2 The x coordinate of the anchor point on the second Collider, in world space.
---@return number y2 The y coordinate of the anchor point on the second Collider, in world space.
---@return number z2 The z coordinate of the anchor point on the second Collider, in world space.
function Joint:getAnchors() end

---Returns the Colliders the Joint is attached to.
---
---@return Collider colliderA The first Collider.
---@return Collider colliderB The second Collider.
function Joint:getColliders() end

---Returns the magnitude of the force used to satisfy the Joint's constraint during the last physics update, in newtons.
---
---This is useful for breakable joints.  Use `Joint:destroy` to break the joint if its force goes above a threshold.
---
---#### Notes:
---
---This does not include the motor force of a `SliderJoint`, see `SliderJoint:getMotorForce`. that.
---
---@return number force The magnitude of the force used to satisfy the Joint's constraint.
function Joint:getForce() end

---Returns the priority of the Joint.  Joints with a higher priority are more likely to be solved correctly.  Priority values are non-negative integers.
---
---#### Notes:
---
---The default priority is zero.
---
---@return number priority The integer priority value.
function Joint:getPriority() end

---Returns the magnitude of the torque used to satisfy the Joint's constraint during the last physics update, in newton meters.
---
---This is useful for breakable joints.  Use `Joint:destroy` to break the joint if its torque goes above a threshold.
---
---#### Notes:
---
---This does not include the motor force of a `HingeJoint`, see `HingeJoint:getMotorForce`.
---
---@return number torque The magnitude of the torque used to satisfy the Joint's constraint.
function Joint:getTorque() end

---Returns the type of the Joint.
---
---@return JointType type The type of the Joint.
function Joint:getType() end

---Returns the Lua value associated with the Joint.
---
---#### Notes:
---
---The user data is not shared between threads.  Each thread has its own user data for the Joint.
---
---@return * data The custom value associated with the Joint.
function Joint:getUserData() end

---Returns whether a Joint has been destroyed.  This the only method that can be called on a destroyed Joint, using the Joint in any other way will error.
---
---@return boolean destroyed Whether the Joint has been destroyed.
function Joint:isDestroyed() end

---Returns whether the Joint is enabled.  Disabled joints do not affect the simulation in any way. Use `Joint:setEnabled` to reactivate the Joint later.  If the Joint is no longer needed, `Joint:destroy` is a better option that completely removes the Joint from the simulation.
---
---@return boolean enabled Whether the Joint is enabled.
function Joint:isEnabled() end

---Enable or disable the Joint.  Disabled joints do not affect the simulation in any way.  If the Joint is no longer needed, `Joint:destroy` is a better option that completely removes the Joint from the simulation.
---
---@param enabled boolean Whether the Joint should be enabled.
function Joint:setEnabled(enabled) end

---Sets the priority of the Joint.  Joints with a higher priority are more likely to be solved correctly.  Priority values are non-negative integers.
---
---#### Notes:
---
---The default priority is zero.
---
---@param priority number The integer priority value.
function Joint:setPriority(priority) end

---Associates a Lua value with the Joint.
---
---#### Notes:
---
---Set the user data to `nil` to clear any existing reference.
---
---The user data is not shared between threads.  Each thread has its own user data for the Joint.
---
---@param data any The custom value to associate with the Joint.
function Joint:setUserData(data) end

---A type of `Shape` that can be used for triangle meshes.
---@class MeshShape
local MeshShape = {}

---Returns the scale the MeshShape was created with.
---
---@return number scale The scale.
function MeshShape:getScale() end

---A Shape is a physics object that can be attached to colliders to define their shape.
---@class Shape
local Shape = {}

---Returns whether a point is inside the Shape.
---
---This takes into account the pose of the Shape's collider (if any), as well as its local offset set with `Shape:setOffset`.
---
---@param x number The x coordinate of the point.
---@param y number The y coordinate of the point.
---@param z number The z coordinate of the point.
---@return boolean hit Whether the point is inside the Shape.
function Shape:containsPoint(x, y, z) end

---Returns whether a point is inside the Shape.
---
---This takes into account the pose of the Shape's collider (if any), as well as its local offset set with `Shape:setOffset`.
---
---@param point Vec3 The point, as a vector.
---@return boolean hit Whether the point is inside the Shape.
function Shape:containsPoint(point) end

---Destroys the Shape, removing it from the Collider it's attached to.
---
---#### Notes:
---
---Calling methods on the Shape after destroying it will error (except for `Shape:isDestroyed`).
---
---If the Shape is attached to a Collider with automatic mass enabled, the collider's mass properties will update.
---
function Shape:destroy() end

---Returns the axis aligned bounding box of the Shape.
---
---@return number minx The minimum x coordinate of the box.
---@return number maxx The maximum x coordinate of the box.
---@return number miny The minimum y coordinate of the box.
---@return number maxy The maximum y coordinate of the box.
---@return number minz The minimum z coordinate of the box.
---@return number maxz The maximum z coordinate of the box.
function Shape:getAABB() end

---Returns the center of mass of the Shape.  Currently the only shape that can have a non-zero center of mass is `ConvexShape`.
---
---#### Notes:
---
---`MeshShape` and `TerrainShape` do not have a well-defined mass, this function returns zero for those shapes.
---
---@return number x The x position of the center of mass.
---@return number y The y position of the center of mass.
---@return number z The z position of the center of mass.
function Shape:getCenterOfMass() end

---Returns the Collider the Shape is attached to.
---
---This function will return `nil` if the Shape is not attached to a Collider.  When a Shape isn't attached to a Collider, the Shape can still be used for queries with `World:overlapShape` and `World:shapecast`.
---
---#### Notes:
---
---A Shape can only be attached to one Collider at a time.
---
---@return Collider collider The Collider the Shape is attached to, or nil if the Shape isn't attached to a Collider.
function Shape:getCollider() end

---Returns the density of the Shape, in kilograms per cubic meter.  The density, combined with the volume of the Shape, determines the Shape's overall mass.
---
---#### Notes:
---
---The default density is 1,000, which is the density of water.
---
---`MeshShape` and `TerrainShape` do not have volume, and return 0.
---
---@return number density The density of the Shape, in kilograms per cubic meter.
function Shape:getDensity() end

---Returns the inertia of the Shape.
---
---Inertia is kind of like "angular mass".  Regular mass determines how resistant a Collider is to linear forces (movement), whereas inertia determines how resistant the Collider is to torque (rotation).  Colliders with less inertia are more spinny.
---
---In 3D, inertia is represented by a 3x3 matrix, called a tensor.  To make calculations easier, the physics engine stores the inertia using eigenvalue decomposition, splitting the matrix into a diagonal matrix and a rotation.  It's complicated!
---
---In a realistic simulation, mass and inertia follow a linear relationship.  If the mass of an object increases, the diagonal part of its inertia should increase proportionally.
---
---#### Notes:
---
---`MeshShape` and `TerrainShape` do not have mass or volue, and for those shapes this function returns zeroes.
---
---@return number dx The x component of the diagonal matrix.
---@return number dy The y component of the diagonal matrix.
---@return number dz The z component of the diagonal matrix.
---@return number angle The angle of the inertia rotation.
---@return number ax The x component of the inertia rotation axis.
---@return number ay The y component of the inertia rotation axis.
---@return number az The z component of the inertia rotation axis.
function Shape:getInertia() end

---Returns the mass of the Shape, in kilograms.  The mass is the volume multiplied by the density.
---
---#### Notes:
---
---The mass of a Collider is the sum of the mass of all of its Shapes.  The center of a mass of a Collider is the average of all of its Shapes, weighted by their mass.
---
---`MeshShape` and `TerrainShape` do not have mass, and will return 0.
---
---@return number mass The mass of the Shape, in kilograms.
function Shape:getMass() end

---Returns the local offset of the Shape.  When the Shape is attached to a Collider, it will have this offset relative to the Collider.
---
---@return number x The local x offset of the Shape, in meters.
---@return number y The local y offset of the Shape, in meters.
---@return number z The local z offset of the Shape, in meters.
---@return number angle The number of radians the Shape is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Shape:getOffset() end

---Get the orientation of the Shape in world space, taking into account the position and orientation of the Collider it's attached to, if any.  Shapes that aren't attached to a Collider will return their local offset.
---
---@return number angle The number of radians the Shape is rotated.
---@return number ax The x component of the rotation axis.
---@return number ay The y component of the rotation axis.
---@return number az The z component of the rotation axis.
function Shape:getOrientation() end

---Returns the position and orientation of the Shape in world space, taking into the account the position and orientation of the Collider it's attached to, if any.  Shapes that aren't attached to a Collider will return their local offset.
---
---@return number x The x position of the Shape, in meters.
---@return number y The y position of the Shape, in meters.
---@return number z The z position of the Shape, in meters.
---@return number angle The number of radians the Shape is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Shape:getPose() end

---Returns the position of the Shape in world space, taking into the account the position and orientation of the Collider it's attached to, if any.  Shapes that aren't attached to a Collider will return their local offset.
---
---@return number x The x position, in world space.
---@return number y The y position, in world space.
---@return number z The z position, in world space.
function Shape:getPosition() end

---Returns the type of the Shape.
---
---@return ShapeType type The type of the Shape.
function Shape:getType() end

---Returns the Lua value associated with the Shape.
---
---#### Notes:
---
---The user data is not shared between threads.  Each thread has its own user data for the Shape.
---
---@return * data The custom value associated with the Shape.
function Shape:getUserData() end

---Returns the volume of the Shape, in cubic meters.
---
---#### Notes:
---
---`MeshShape` and `TerrainShape` do not have volume, and will return 0.
---
---@return number volume The volume of the shape, in cubic meters.
function Shape:getVolume() end

---Returns whether the Shape has been destroyed.  Destroyed shapes can not be used for anything.
---
---@return boolean destroyed Whether the Shape has been destroyed.
function Shape:isDestroyed() end

---Casts a ray against the Shape and returns the first intersection.
---
---This takes into account the pose of the Shape's collider (if any), as well as its local offset set with `Shape:setOffset`.
---
---@param x1 number The x coordinate of the origin of the ray.
---@param y1 number The y coordinate of the origin of the ray.
---@param z1 number The z coordinate of the origin of the ray.
---@param x2 number The x coordinate of the endpoint of the ray.
---@param y2 number The y coordinate of the endpoint of the ray.
---@param z2 number The z coordinate of the endpoint of the ray.
---@return number x The x coordinate of the impact point.
---@return number y The y coordinate of the impact point.
---@return number z The z coordinate of the impact point.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
---@return number nz The z component of the normal vector.
---@return number triangle The index of the triangle that was hit, or `nil` if this is not a MeshShape.
function Shape:raycast(x1, y1, z1, x2, y2, z2) end

---Casts a ray against the Shape and returns the first intersection.
---
---This takes into account the pose of the Shape's collider (if any), as well as its local offset set with `Shape:setOffset`.
---
---@param origin Vec3 The origin of the ray.
---@param endpoint Vec3 The endpoint of the ray.
---@return number x The x coordinate of the impact point.
---@return number y The y coordinate of the impact point.
---@return number z The z coordinate of the impact point.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
---@return number nz The z component of the normal vector.
---@return number triangle The index of the triangle that was hit, or `nil` if this is not a MeshShape.
function Shape:raycast(origin, endpoint) end

---Sets the density of the Shape, in kilograms per cubic meter.  The density, combined with the volume of the Shape, determines the Shape's overall mass.
---
---#### Notes:
---
---This changes the mass of the Shape.  If the Shape is attached to a Collider with automatic mass enabled, the Collider's mass properties will change as well.
---
---The default density is 1,000, which is the density of water.
---
---`MeshShape` and `TerrainShape` do not have mass.
---
---@param density number The density of the Shape, in kilograms per cubic meter.
function Shape:setDensity(density) end

---Sets the local offset of the Shape.  When the Shape is attached to a Collider, it will have this offset relative to the Collider.
---
---@param x number The local x offset of the Shape, in meters.
---@param y number The local y offset of the Shape, in meters.
---@param z number The local z offset of the Shape, in meters.
---@param angle number The number of radians the Shape is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Shape:setOffset(x, y, z, angle, ax, ay, az) end

---Sets the local offset of the Shape.  When the Shape is attached to a Collider, it will have this offset relative to the Collider.
---
---@param position Vec3 The local offset of the Shape, in meters.
---@param rotation Quat The local rotation of the Shape, in meters.
function Shape:setOffset(position, rotation) end

---Associates a Lua value with the Shape.
---
---#### Notes:
---
---Set the user data to `nil` to clear any existing reference.
---
---The user data is not shared between threads.  Each thread has its own user data for the Shape.
---
---@param data any The custom value to associate with the Shape.
function Shape:setUserData(data) end

---A SliderJoint is a type of `Joint` that only allows colliders to move on a single axis.
---@class SliderJoint
local SliderJoint = {}

---Returns the axis of the slider, in world space.
---
---@return number x The x component of the axis.
---@return number y The y component of the axis.
---@return number z The z component of the axis.
function SliderJoint:getAxis() end

---Returns the friction of the SliderJoint.  This is a maximum friction force that will be applied, in newtons, opposing movement along the slider axis.
---
---#### Notes:
---
---Friction is only applied when the motor is disabled.
---
---@return number friction The maximum friction force, in newtons.
function SliderJoint:getFriction() end

---Returns the position limits of the SliderJoint.  The "zero" position is determined by the relative position of the colliders at the time the joint was created, and positive positions are further apart along the slider axis.
---
---#### Notes:
---
---The default limits are -math.huge and math.huge (no limits).
---
---@return number min The minimum position, in meters.  Must be less than or equal to zero.
---@return number max The maximum position, in meters.  Must be greater than or equal to zero.
function SliderJoint:getLimits() end

---Returns the maximum amount of force the motor can use to reach its target, in newtons.
---
---There are separate limits for each direction the slider can move.  They're usually kept the same, but one of them can be set to zero to make a motor that can only push in one direction. Note that both limits are positive.
---
---@return number positive The maximum amount of force the motor can use to push the slider in the "positive" direction, in newtons.
---@return number negative The maximum amount of force the motor can use to push the slider in the "negative" direction, in newtons.
function SliderJoint:getMaxMotorForce() end

---Returns the current force the motor is using to reach its target, in newtons.
---
---@return number force The current force, in newtons.
function SliderJoint:getMotorForce() end

---Returns the motor mode of the SliderJoint.  When enabled, the motor will drive the slider to a target position (for the `position` mode) or a target speed (for the `velocity` mode), set by `SliderJoint:setMotorTarget`.
---
---@return MotorMode mode The mode of the motor, or `nil` if the motor is disabled.
function SliderJoint:getMotorMode() end

---Returns the spring parameters of the motor target.  These are similar to the spring parameters set by `SliderJoint:setSpring`, but they apply to the motor when it reaches its target instead of the position limits of the slider joint.  Note that these only take effect when the motor mode is `position`.
---
---#### Notes:
---
---See `SliderJoint:setSpring` for more detailed info on how the spring parameters work.
---
---@return number frequency The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@return number damping The damping ratio of the spring.
function SliderJoint:getMotorSpring() end

---Returns the target value for the SliderJoint's motor.  This is either a target position or a target velocity, based on the mode set by `SliderJoint:setMotorMode`.
---
---@return number target The target value, in meters or meters per second, depending on the mode.
function SliderJoint:getMotorTarget() end

---Returns the position of the slider joint.  The "zero" position is the relative distance the colliders were at when the joint is created, and positive positions are further apart along the slider's axis.
---
---@return number position The position of the slider joint, in meters.
function SliderJoint:getPosition() end

---Returns the spring parameters of the SliderJoint.  Use this to make the position limits of the slider "soft".  When the motor is active, a separate set of spring parameters can be set on the motor, see `SliderJoint:setMotorSpring`.
---
---#### Notes:
---
---Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled and the limits will be as stiff as possible.
---
---The damping ratio controls how quickly the oscillation slows down:
---
---- Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
---  still lose a small amount of energy over time).
---- Underdamped: Damping less than one results in a system that is underdamped.  The spring will
---  oscillate around the target, but the oscillations will decay over time, eventually stabilizing
---  at the target.
---- Overdamped: Damping greater than one will not have any oscillation, and the spring will take
---  extra time to reach the target.
---- Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
---  takes the minimum amount of time to reach the target (based on the frequency).
---
---The default damping ratio is 1.
---
---@return number frequency The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@return number damping The damping ratio of the spring.
function SliderJoint:getSpring() end

---Sets the friction of the SliderJoint.  This is a maximum friction force that will be applied, in newtons, opposing movement along the slider axis.
---
---#### Notes:
---
---Friction is only applied when the motor is disabled.
---
---@param friction number The maximum friction force, in newtons.
function SliderJoint:setFriction(friction) end

---Sets the position limits of the SliderJoint.  The "zero" position is determined by the relative position of the colliders at the time the joint was created, and positive distances are further apart on the slider axis.
---
---#### Notes:
---
---The default limits are -math.huge and math.huge.
---
---@param min number The minimum position, in meters.  Must be less than or equal to zero.
---@param max number The maximum position, in meters.  Must be greater than or equal to zero.
function SliderJoint:setLimits(min, max) end

---Sets the position limits of the SliderJoint.  The "zero" position is determined by the relative position of the colliders at the time the joint was created, and positive distances are further apart on the slider axis.
---
---#### Notes:
---
---The default limits are -math.huge and math.huge.
---
function SliderJoint:setLimits() end

---Sets the maximum amount of force the motor can use to reach its target, in newtons.
---
---There are separate limits for each direction the slider can move.  They're usually kept the same, but one of them can be set to zero to make a motor that can only push in one direction. Note that both limits are positive.
---
---@param positive? number The maximum amount of force the motor can use to push the slider in the "positive" direction, in newtons.
---@param negative? number The maximum amount of force the motor can use to push the slider in the "negative" direction, in newtons.
function SliderJoint:setMaxMotorForce(positive, negative) end

---Sets the motor mode of the SliderJoint.  When enabled, the motor will drive the slider to a target position (for the `position` mode) or a target speed (for the `velocity` mode), set by `SliderJoint:setMotorTarget`.
---
---@param mode MotorMode The mode of the motor.
function SliderJoint:setMotorMode(mode) end

---Sets the motor mode of the SliderJoint.  When enabled, the motor will drive the slider to a target position (for the `position` mode) or a target speed (for the `velocity` mode), set by `SliderJoint:setMotorTarget`.
---
function SliderJoint:setMotorMode() end

---Sets the spring parameters of the motor target.  These are similar to the spring parameters set by `SldierJoint:setSpring`, but they apply to the motor when it reaches its target instead of the position limits of the slider joint.  Note that these only take effect when the motor mode is `position`.
---
---#### Notes:
---
---See `SldierJoint:setSpring` for more detailed info on how the spring parameters work.
---
---@param frequency? number The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@param damping? number The damping ratio of the spring.
function SliderJoint:setMotorSpring(frequency, damping) end

---Sets the target value for the SliderJoint's motor.  This is either a target position or a target velocity, based on the mode set by `SliderJoint:setMotorMode`.
---
---@param target number The target value, in meters or meters per second, depending on the mode.
function SliderJoint:setMotorTarget(target) end

---Sets the spring parameters of the SliderJoint.  Use this to make the position limits of the slider "soft".  When the motor is active, a separate set of spring parameters can be set on the motor, see `SliderJoint:setMotorSpring`.
---
---#### Notes:
---
---Higher frequencies make the spring more stiff.  When zero (the default), the spring is disabled and the limits will be as stiff as possible.
---
---The damping ratio controls how quickly the oscillation slows down:
---
---- Undamped: Zero damping will cause the spring to oscillate forever.  (Note that the spring may
---  still lose a small amount of energy over time).
---- Underdamped: Damping less than one results in a system that is underdamped.  The spring will
---  oscillate around the target, but the oscillations will decay over time, eventually stabilizing
---  at the target.
---- Overdamped: Damping greater than one will not have any oscillation, and the spring will take
---  extra time to reach the target.
---- Critical Damping: When the damping is exactly 1.0, there is no oscillation and the spring
---  takes the minimum amount of time to reach the target (based on the frequency).
---
---@param frequency? number The frequency of the spring, in hertz.  Higher frequencies make the spring more stiff.  When zero, the spring is disabled.
---@param damping? number The damping ratio of the spring.
function SliderJoint:setSpring(frequency, damping) end

---A type of `Shape` that can be used for spheres.
---@class SphereShape
local SphereShape = {}

---Returns the radius of the SphereShape.
---
---@return number radius The radius of the sphere, in meters.
function SphereShape:getRadius() end

---Sets the radius of the SphereShape.
---
---#### Notes:
---
---This changes the mass of the shape.  If the shape is attached to a collider with automatic mass enabled, the mass properties of the collider will update as well.
---
---Changing shapes can make the physics engine explode since it can cause objects to overlap in unnatural ways.
---
---@param radius number The radius of the sphere, in meters.
function SphereShape:setRadius(radius) end

---A type of `Shape` that can be used for terrains and irregular surfaces.
---@class TerrainShape
local TerrainShape = {}

---A WeldJoint is a `Joint` that restricts all relative motion between two colliders, as though they were welded together into a single object.  All six degrees of freedom are constrained.
---
---WeldJoints are useful for making breakable objects.  Several colliders can be welded together with joints, and if `Joint:getForce` reports a large enough value, the joints can be disabled or destroyed, allowing the pieces to move freely.
---@class WeldJoint
local WeldJoint = {}

---A World is an object that holds all of the colliders and joints in a physics simulation.
---
---Be sure to call `World:update` on the World every frame to advance the simulation.
---@class World
local World = {}

---Destroys the World.  This will destroy all colliders, shapes, and joints in the world.  After calling this function, the world can no longer be used.  Attempting to call a method on the World after destroying it will error, with the exception of `World:isDestroyed`.
---
---#### Notes:
---
---If a World gets garbage collected, it will be destroyed and, consequently, all of the colliders, shapes, and joints in the World will be destroyed as well, even if they can still be reached by Lua.  This is an exception to the way objects in LÖVR normally work, and is done to avoid issues with cycles in reference counting.
---
function World:destroy() end

---Disables collision between two tags.  Use `Collider:setTag` to set a Collider's tag.
---
---#### Notes:
---
---By default, collision is enabled between all tags.
---
---Another way of disabling collisions is by using the `filter` callback in `World:setCallbacks`. However, using tags is much faster than using the callback, because the physics engine calls the callback later in the collision detection process.  With tags, the colliders are ignored much earlier and precise collision detection is never performed.
---
---Tags can be marked as "static" when the world is created, as an optimization hint.  Static tags will never collide with other static tags, regardless of whether collision is enabled between them.
---
---@param tag1 string The first tag.
---@param tag2 string The second tag.
function World:disableCollisionBetween(tag1, tag2) end

---Enables collision between two tags.  Use `Collider:setTag` to set a Collider's tag.
---
---#### Notes:
---
---By default, collision is enabled between all tags.
---
---Tags can be marked as "static" when the world is created, as an optimization hint.  Static tags will never collide with other static tags, regardless of whether collision is enabled between them.
---
---@param tag1 string The first tag.
---@param tag2 string The second tag.
function World:enableCollisionBetween(tag1, tag2) end

---Returns the angular damping parameters of the World.  Angular damping makes things less "spinny", making them slow down their angular velocity over time.
---
---#### Notes:
---
---This sets the default damping for newly-created colliders.  Damping can also be set on a per-collider basis using `Collider:setAngularDamping`.
---
---@return number damping The angular damping.
---@return number threshold Velocity limit below which the damping is not applied.
function World:getAngularDamping() end

---- Returns the callbacks assigned to the World.
---- The callbacks are described in more detail on `World:setCallbacks`.
---
---@return table callbacks The World collision callbacks.
function World:getCallbacks() end

---Returns the number of colliders in the world.  This includes sleeping and disabled colliders.
---
---#### Notes:
---
---The world has a maximum number of colliders, configured when creating the world.  The default is 8192.  Trying to create more than this will error.
---
---@return number count The number of colliders in the World.
function World:getColliderCount() end

---Returns a list of colliders in the world.  This includes sleeping and disabled colliders.
---
---@return table colliders The list of `Collider` objects in the World.
function World:getColliders() end

---Returns the World's gravity.  Gravity is a constant acceleration applied to all colliders.  The default is `(0, -9.81, 0)` meters per second squared, causing colliders to fall downward.
---
---Use `Collider:setGravityScale` to change gravity strength for a single collider.
---
---#### Notes:
---
---Kinematic colliders ignore gravity, since they are not moved by forces.  Colliders with higher mass do not fall faster.
---
---@return number gx The x component of the gravity force, in meters per second squared.
---@return number gy The y component of the gravity force, in meters per second squared.
---@return number gz The z component of the gravity force, in meters per second squared.
function World:getGravity() end

---Returns the number of joints in the world.  This includes disabled joints.
---
---@return number count The number of joints in the World.
function World:getJointCount() end

---Returns a table with all the joints in the World.  This includes disabled joints.
---
---@return table joints The list of `Joint` objects in the World.
function World:getJoints() end

---Returns the linear damping parameters of the World.  Linear damping is similar to drag or air resistance, slowing down colliders over time as they move.
---
---#### Notes:
---
---A linear damping of 0 means colliders won't slow down over time.  This is the default.
---
---This sets the default damping for newly-created colliders.  Damping can also be set on a per-collider basis using `Collider:setLinearDamping`.
---
---@return number damping The linear damping.
---@return number threshold Velocity limit below which the damping is not applied.
function World:getLinearDamping() end

---Returns the response time factor of the World.
---
---The response time controls how relaxed collisions and joints are in the physics simulation, and functions similar to inertia.  A low response time means collisions are resolved quickly, and higher values make objects more spongy and soft.
---
---The value can be any positive number.  It can be changed on a per-joint basis for `DistanceJoint` and `BallJoint` objects.
---
---@return number responseTime The response time setting for the World.
function World:getResponseTime() end

---Returns the step count of the World.  The step count influences how many steps are taken during a call to `World:update`.  A higher number of steps will be slower, but more accurate.  The default step count is 20.
---
---@return number steps The step count.
function World:getStepCount() end

---Returns the list of collision tags that were specified when the World was created.  Tags are assigned to colliders using `Collider:setTag`, and collision can be enabled/disabled for pairs of tags with `World:enableCollisionBetween` and `World:disableCollisionBetween`.
---
---@return table tags A table of collision tags (strings).
function World:getTags() end

---Returns the tightness of joints in the World.
---
---The tightness controls how much force is applied to colliders connected by joints.  With a value of 0, no force will be applied and joints won't have any effect.  With a tightness of 1, a strong force will be used to try to keep the Colliders constrained.  A tightness larger than 1 will overcorrect the joints, which can sometimes be desirable.  Negative tightness values are not supported.
---
---@return number tightness The tightness of the World.
function World:getTightness() end

---Interpolates collider poses between their previous pose and their current pose.  Methods like `Collider:getPosition` and `Collider:getOrientation` will return the smoothed values.
---
---After `World:update` is called, any interpolation is reset and `World:interpolate` will need to be called again to recompute the interpolated poses.
---
---This can be used to decouple the physics tick rate from the rendering rate.  For example, the physics simulation can be run at a fixed rate of 30Hz, and collider poses can be interpolated before rendering.  This leads to a more stable simulation, and allows the physics rate to be increased or decreased as desired, independent of the current display refresh rate.
---
---#### Example:
---
---An example of a fixed timestep physics update.
---
---```lua
---function lovr.load()
---  world = lovr.physics.newWorld()
---  time = 0
---  timestep = 1 / 30 -- 30Hz
---end
---
---function lovr.update(dt)
---  time = time + dt
---
---  -- Update as many times as needed, if any
---  while time >= timestep do
---    world:update(timestep)
---    time = time - timestep
---
---    -- Potentially do per-tick gameplay logic here
---    -- like check for collisions or apply impulses
---  end
---
---  -- Interpolate the colliders
---  local alpha = time / timestep
---  world:interpolate(alpha)
---end
---
---function lovr.draw(pass)
---  -- Draw colliders as usual, using `Collider:getPose` etc.
---end
---```
---
---@param alpha number The interpolation parameter.  An alpha of zero will use the previous collider pose, an alpha of 1.0 will use the latest collider pose, etc.  Can be less than zero or greater than one.
function World:interpolate(alpha) end

---Returns whether collisions are enabled between a pair of tags.
---
---#### Notes:
---
---If either tag is nil, this function returns true, for convenience.  For example, the following function will still work if either of the colliders don't have a tag:
---
---    function willCollide(c1, c2)
---      return world:isCollisionEnabledBetween(c1:getTag(), c2:getTag())
---    end
---
---By default, collision is enabled between all tags.
---
---Tags can be marked as "static" when the world is created, as an optimization hint.  Static tags will never collide with other static tags, regardless of whether collision is enabled between them.
---
---@param tag1 string The first tag.
---@param tag2 string The second tag.
---@return boolean enabled Whether or not two colliders with the specified tags will collide.
function World:isCollisionEnabledBetween(tag1, tag2) end

---Returns whether the World has been destroyed.  Destroyed worlds can not be used for anything.
---
---@return boolean destroyed Whether the World has been destroyed.
function World:isDestroyed() end

---Returns whether colliders can go to sleep in the World.
---
---#### Notes:
---
---If sleeping is enabled, the World will try to detect colliders that haven't moved for a while and put them to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.
---
---This can be set on individual colliders.
---
---Colliders can be manually put to sleep or woken up using `Collider:setAwake`.
---
---@return boolean allowed Whether colliders can sleep.
function World:isSleepingAllowed() end

---Adds a Collider to the world and attaches a `BoxShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the center of the box, in meters.
---@param y? number The y coordinate of the center of the box, in meters.
---@param z? number The z coordinate of the center of the box, in meters.
---@param width? number The width of the box, in meters.
---@param height? number The height of the box, in meters.
---@param depth? number The depth of the box, in meters.
---@return Collider collider The new Collider.
function World:newBoxCollider(x, y, z, width, height, depth) end

---Adds a Collider to the world and attaches a `BoxShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the box, in meters.
---@param size Vec3 The size of the box, in meters.
---@return Collider collider The new Collider.
function World:newBoxCollider(position, size) end

---Adds a Collider to the world and attaches a `CapsuleShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---The length of the capsule goes along its local Z axis.
---
---@param x? number The x coordinate of the center of the capsule, in meters.
---@param y? number The y coordinate of the center of the capsule, in meters.
---@param z? number The z coordinate of the center of the capsule, in meters.
---@param radius? number The radius of the capsule, in meters.
---@param length? number The length of the capsule, not including the caps, in meters.
---@return Collider collider The new Collider.
function World:newCapsuleCollider(x, y, z, radius, length) end

---Adds a Collider to the world and attaches a `CapsuleShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---The length of the capsule goes along its local Z axis.
---
---@param position Vec3 The position of the center of the capsule, in meters.
---@param radius? number The radius of the capsule, in meters.
---@param length? number The length of the capsule, not including the caps, in meters.
---@return Collider collider The new Collider.
function World:newCapsuleCollider(position, radius, length) end

---Adds a new Collider to the World, without attaching any Shapes to it.  Use `Collider:addShape` to add shapes.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---#### Example:
---
---```lua
---function lovr.load()
---  world = lovr.physics.newWorld()
---  collider = world:newCollider(0, 0, 0)
---  shape = lovr.physics.newSphereShape(.5)
---  collider:addShape(shape)
---end
---```
---
---@param x number The x position of the Collider.
---@param y number The y position of the Collider.
---@param z number The z position of the Collider.
---@return Collider collider The new Collider.
function World:newCollider(x, y, z) end

---Adds a new Collider to the World, without attaching any Shapes to it.  Use `Collider:addShape` to add shapes.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---#### Example:
---
---```lua
---function lovr.load()
---  world = lovr.physics.newWorld()
---  collider = world:newCollider(0, 0, 0)
---  shape = lovr.physics.newSphereShape(.5)
---  collider:addShape(shape)
---end
---```
---
---@param position Vec3 The position of the Collider.
---@return Collider collider The new Collider.
function World:newCollider(position) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the collider, in meters.
---@param y? number The y coordinate of the collider, in meters.
---@param z? number The z coordinate of the collider, in meters.
---@param points table A list of vertices to compute a convex hull from.  Can be a table of tables (each with 3 numbers) or a table of numbers (every 3 numbers form a 3D point).
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(x, y, z, points, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the capsule, in meters.
---@param points table A list of vertices to compute a convex hull from.  Can be a table of tables (each with 3 numbers) or a table of numbers (every 3 numbers form a 3D point).
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(position, points, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the collider, in meters.
---@param y? number The y coordinate of the collider, in meters.
---@param z? number The z coordinate of the collider, in meters.
---@param modelData ModelData The ModelData to compute a convex hull from.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(x, y, z, modelData, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the capsule, in meters.
---@param modelData ModelData The ModelData to compute a convex hull from.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(position, modelData, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the collider, in meters.
---@param y? number The y coordinate of the collider, in meters.
---@param z? number The z coordinate of the collider, in meters.
---@param model Model The Model to compute a convex hull from.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(x, y, z, model, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the capsule, in meters.
---@param model Model The Model to compute a convex hull from.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(position, model, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the collider, in meters.
---@param y? number The y coordinate of the collider, in meters.
---@param z? number The z coordinate of the collider, in meters.
---@param mesh Mesh The Mesh to compute a convex hull from.  It must use the `cpu` storage mode.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(x, y, z, mesh, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the capsule, in meters.
---@param mesh Mesh The Mesh to compute a convex hull from.  It must use the `cpu` storage mode.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(position, mesh, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the collider, in meters.
---@param y? number The y coordinate of the collider, in meters.
---@param z? number The z coordinate of the collider, in meters.
---@param template ConvexShape An existing ConvexShape to clone.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(x, y, z, template, scale) end

---Adds a Collider to the world and attaches a `ConvexShape`.  A `ConvexShape` is a convex hull of a set of points, kinda like if you wrapped them in wrapping paper.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the capsule, in meters.
---@param template ConvexShape An existing ConvexShape to clone.
---@param scale? number A scale to apply to the points.
---@return Collider collider The new Collider.
function World:newConvexCollider(position, template, scale) end

---Adds a Collider to the world and attaches a `CylinderShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---The length of the cylinder goes along its local Z axis.
---
---@param x? number The x coordinate of the center of the cylinder, in meters.
---@param y? number The y coordinate of the center of the cylinder, in meters.
---@param z? number The z coordinate of the center of the cylinder, in meters.
---@param radius? number The radius of the cylinder, in meters.
---@param length? number The length of the cylinder, in meters.
---@return Collider collider The new Collider.
function World:newCylinderCollider(x, y, z, radius, length) end

---Adds a Collider to the world and attaches a `CylinderShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---The length of the cylinder goes along its local Z axis.
---
---@param position Vec3 The position of the center of the cylinder, in meters.
---@param radius? number The radius of the cylinder, in meters.
---@param length? number The length of the cylinder, in meters.
---@return Collider collider The new Collider.
function World:newCylinderCollider(position, radius, length) end

---Adds a Collider to the world and attaches a `MeshShape`.
---
---Colliders with mesh shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---MeshShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" a mesh.  `ConvexShape` is a good alternative for solid objects with an arbitrary shape.
---
---#### Notes:
---
---The triangles in a MeshShape should use counterclockwise winding.
---
---@param vertices table A table of vertices in the mesh.  Can be a table of tables (each with 3 numbers) or a table of numbers (every 3 numbers form a 3D vertex).
---@param indices table A table of triangle indices representing how the vertices are connected together into triangles.
---@return Collider collider The new Collider.
function World:newMeshCollider(vertices, indices) end

---Adds a Collider to the world and attaches a `MeshShape`.
---
---Colliders with mesh shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---MeshShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" a mesh.  `ConvexShape` is a good alternative for solid objects with an arbitrary shape.
---
---#### Notes:
---
---The triangles in a MeshShape should use counterclockwise winding.
---
---@param modelData ModelData A ModelData to use for the mesh data.
---@return Collider collider The new Collider.
function World:newMeshCollider(modelData) end

---Adds a Collider to the world and attaches a `MeshShape`.
---
---Colliders with mesh shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---MeshShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" a mesh.  `ConvexShape` is a good alternative for solid objects with an arbitrary shape.
---
---#### Notes:
---
---The triangles in a MeshShape should use counterclockwise winding.
---
---@param model Model A Model to use for the mesh data.  Similar to calling `Model:getTriangles` and passing it to this function, but has better performance.
---@return Collider collider The new Collider.
function World:newMeshCollider(model) end

---Adds a Collider to the world and attaches a `MeshShape`.
---
---Colliders with mesh shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---MeshShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" a mesh.  `ConvexShape` is a good alternative for solid objects with an arbitrary shape.
---
---#### Notes:
---
---The triangles in a MeshShape should use counterclockwise winding.
---
---@param mesh Mesh A Mesh to use for the mesh data.  It must use the `cpu` storage mode.
---@return Collider collider The new Collider.
function World:newMeshCollider(mesh) end

---Adds a Collider to the world and attaches a `MeshShape`.
---
---Colliders with mesh shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---MeshShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" a mesh.  `ConvexShape` is a good alternative for solid objects with an arbitrary shape.
---
---#### Notes:
---
---The triangles in a MeshShape should use counterclockwise winding.
---
---@param template MeshShape An existing MeshShape to reuse.
---@return Collider collider The new Collider.
function World:newMeshCollider(template) end

---Adds a Collider to the world and attaches a `SphereShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param x? number The x coordinate of the center of the sphere, in meters.
---@param y? number The y coordinate of the center of the sphere, in meters.
---@param z? number The z coordinate of the center of the sphere, in meters.
---@param radius? number The radius of the sphere, in meters.
---@return Collider collider The new Collider.
function World:newSphereCollider(x, y, z, radius) end

---Adds a Collider to the world and attaches a `SphereShape`.
---
---#### Notes:
---
---This will throw an error if there are too many colliders in the world.  The limit defaults to 16384 and can be changed in `lovr.physics.newWorld`.
---
---@param position Vec3 The position of the center of the sphere, in meters.
---@param radius? number The radius of the sphere, in meters.
---@return Collider collider The new Collider.
function World:newSphereCollider(position, radius) end

---Adds a Collider to the world and attaches a `TerrainShape`.
---
---Colliders with terrain shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---TerrainShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" the terrain.
---
---@param scale number The width and depth of the terrain, in meters.
---@return Collider collider The new Collider.
function World:newTerrainCollider(scale) end

---Adds a Collider to the world and attaches a `TerrainShape`.
---
---Colliders with terrain shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---TerrainShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" the terrain.
---
---@param scale number The width and depth of the terrain, in meters.
---@param heightmap Image A heightmap image describing the terrain elevation at different points.  The red channel brightness of each pixel determines the elevation at corresponding coordinates.  The image must be square and must have one of the formats supported by `Image:getPixel`.
---@param stretch? number A vertical multiplier for height values to obtain terrain height.  When the image format has pixel values only in the 0 to 1 range, this can be used to scale the height to meters.
---@return Collider collider The new Collider.
function World:newTerrainCollider(scale, heightmap, stretch) end

---Adds a Collider to the world and attaches a `TerrainShape`.
---
---Colliders with terrain shapes are immobile and can only be used for static environment objects. The collider will be kinematic and forces/velocities will not move it.  Also, these colliders will not detect collisions with other kinematic objects.
---
---TerrainShapes are not treated as solid objects, but instead a collection of triangles.  They do not have mass or volume, and there is no concept of being "inside" the terrain.
---
---@param scale number The width and depth of the terrain, in meters.
---@param callback function A function that returns terrain height from x and z coordinates.  The x and z inputs will range from `-scale / 2` to `scale / 2`.
---@param samples? number The number of samples taken across the x and z dimensions.  More samples will result in higher terrain fidelity, but use more CPU and memory.
---@return Collider collider The new Collider.
function World:newTerrainCollider(scale, callback, samples) end

---Places a shape in the World, returning any shapes it intersects.
---
---A tag filter can be given to filter out shapes by their collider's tag:
---
---- Use nil to skip filtering.
---- Pass a tag name to only return shapes whose collider has that tag.
---- Pass a tag name with a ~ in front of it to exclude colliders with that tag.
---- Pass multiple tags separated by spaces to include multiple tags (works with ~ too).
---
---Provide an optional callback to call for each shape detected.  If the callbacks nil, this function returns the first shape detected.  In either case this function returns the shape, the hit position, and a penetration vector.  The penetration vector represents the direction and distance the shape would need to move so that it is no longer colliding with the input shape.
---
---@param shape Shape The Shape to test.
---@param x number The x position to place the shape at, in meters.
---@param y number The y position to place the shape at, in meters.
---@param z number The z position to place the shape at, in meters.
---@param angle number The angle the shape is rotated around its rotation axis, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@param maxDistance? number The maximum distance at which a shape can be detected, in meters.  Zero will detect shapes touching the input shape, 1.0 will detect shapes within 1 meter of the input shape, etc.
---@param filter? string Tags to filter by, or nil for no filter.
---@param callback function The callback to call for each intersection detected.
function World:overlapShape(shape, x, y, z, angle, ax, ay, az, maxDistance, filter, callback) end

---Places a shape in the World, returning any shapes it intersects.
---
---A tag filter can be given to filter out shapes by their collider's tag:
---
---- Use nil to skip filtering.
---- Pass a tag name to only return shapes whose collider has that tag.
---- Pass a tag name with a ~ in front of it to exclude colliders with that tag.
---- Pass multiple tags separated by spaces to include multiple tags (works with ~ too).
---
---Provide an optional callback to call for each shape detected.  If the callbacks nil, this function returns the first shape detected.  In either case this function returns the shape, the hit position, and a penetration vector.  The penetration vector represents the direction and distance the shape would need to move so that it is no longer colliding with the input shape.
---
---@param shape Shape The Shape to test.
---@param position Vec3 The position to place the shape at, in meters.
---@param orientation Quat The orientation of the shape.
---@param maxDistance? number The maximum distance at which a shape can be detected, in meters.  Zero will detect shapes touching the input shape, 1.0 will detect shapes within 1 meter of the input shape, etc.
---@param filter? string Tags to filter by, or nil for no filter.
---@param callback function The callback to call for each intersection detected.
function World:overlapShape(shape, position, orientation, maxDistance, filter, callback) end

---Places a shape in the World, returning any shapes it intersects.
---
---A tag filter can be given to filter out shapes by their collider's tag:
---
---- Use nil to skip filtering.
---- Pass a tag name to only return shapes whose collider has that tag.
---- Pass a tag name with a ~ in front of it to exclude colliders with that tag.
---- Pass multiple tags separated by spaces to include multiple tags (works with ~ too).
---
---Provide an optional callback to call for each shape detected.  If the callbacks nil, this function returns the first shape detected.  In either case this function returns the shape, the hit position, and a penetration vector.  The penetration vector represents the direction and distance the shape would need to move so that it is no longer colliding with the input shape.
---
---@param shape Shape The Shape to test.
---@param x number The x position to place the shape at, in meters.
---@param y number The y position to place the shape at, in meters.
---@param z number The z position to place the shape at, in meters.
---@param angle number The angle the shape is rotated around its rotation axis, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@param maxDistance? number The maximum distance at which a shape can be detected, in meters.  Zero will detect shapes touching the input shape, 1.0 will detect shapes within 1 meter of the input shape, etc.
---@param filter? string Tags to filter by, or nil for no filter.
---@return Collider collider The collider that was hit.
---@return Shape shape The shape that was hit.
---@return number x The x position of a world space contact point on the surface of the shape.
---@return number y The y position of a world space contact point on the surface of the shape.
---@return number z The z position of a world space contact point on the surface of the shape.
---@return number nx The x component of the penetration vector.
---@return number ny The y component of the penetration vector.
---@return number nz The z component of the penetration vector.
function World:overlapShape(shape, x, y, z, angle, ax, ay, az, maxDistance, filter) end

---Places a shape in the World, returning any shapes it intersects.
---
---A tag filter can be given to filter out shapes by their collider's tag:
---
---- Use nil to skip filtering.
---- Pass a tag name to only return shapes whose collider has that tag.
---- Pass a tag name with a ~ in front of it to exclude colliders with that tag.
---- Pass multiple tags separated by spaces to include multiple tags (works with ~ too).
---
---Provide an optional callback to call for each shape detected.  If the callbacks nil, this function returns the first shape detected.  In either case this function returns the shape, the hit position, and a penetration vector.  The penetration vector represents the direction and distance the shape would need to move so that it is no longer colliding with the input shape.
---
---@param shape Shape The Shape to test.
---@param position Vec3 The position to place the shape at, in meters.
---@param orientation Quat The orientation of the shape.
---@param maxDistance? number The maximum distance at which a shape can be detected, in meters.  Zero will detect shapes touching the input shape, 1.0 will detect shapes within 1 meter of the input shape, etc.
---@param filter? string Tags to filter by, or nil for no filter.
---@return Collider collider The collider that was hit.
---@return Shape shape The shape that was hit.
---@return number x The x position of a world space contact point on the surface of the shape.
---@return number y The y position of a world space contact point on the surface of the shape.
---@return number z The z position of a world space contact point on the surface of the shape.
---@return number nx The x component of the penetration vector.
---@return number ny The y component of the penetration vector.
---@return number nz The z component of the penetration vector.
function World:overlapShape(shape, position, orientation, maxDistance, filter) end

---Find colliders within an axis-aligned bounding box.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---#### Notes:
---
---This will return sleeping colliders and sensors, but it will ignore disabled colliders.
---
---@param x number The x coordinate of the center of the box, in meters.
---@param y number The y coordinate of the center of the box, in meters.
---@param z number The z coordinate of the center of the box, in meters.
---@param width number The width of the box, in meters
---@param height number The height of the box, in meters
---@param depth number The depth of the box, in meters.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@param callback function A function to call when a collider is detected.  The function will be called with a single `Collider` argument.
function World:queryBox(x, y, z, width, height, depth, filter, callback) end

---Find colliders within an axis-aligned bounding box.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---#### Notes:
---
---This will return sleeping colliders and sensors, but it will ignore disabled colliders.
---
---@param position Vec3 The position of the center of the box, in meters.
---@param size Vec3 The size of the box, in meters.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@param callback function A function to call when a collider is detected.  The function will be called with a single `Collider` argument.
function World:queryBox(position, size, filter, callback) end

---Find colliders within an axis-aligned bounding box.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---#### Notes:
---
---This will return sleeping colliders and sensors, but it will ignore disabled colliders.
---
---@param x number The x coordinate of the center of the box, in meters.
---@param y number The y coordinate of the center of the box, in meters.
---@param z number The z coordinate of the center of the box, in meters.
---@param width number The width of the box, in meters
---@param height number The height of the box, in meters
---@param depth number The depth of the box, in meters.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@return Collider collider A Collider that intersected the box.
function World:queryBox(x, y, z, width, height, depth, filter) end

---Find colliders within an axis-aligned bounding box.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---#### Notes:
---
---This will return sleeping colliders and sensors, but it will ignore disabled colliders.
---
---@param position Vec3 The position of the center of the box, in meters.
---@param size Vec3 The size of the box, in meters.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@return Collider collider A Collider that intersected the box.
function World:queryBox(position, size, filter) end

---Find colliders within a sphere.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---@param x number The x coordinate of the center of the sphere.
---@param y number The y coordinate of the center of the sphere.
---@param z number The z coordinate of the center of the sphere.
---@param radius number The radius of the sphere, in meters
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@param callback function A function to call when an intersection is detected.  The function will be called with a single `Collider` argument.
function World:querySphere(x, y, z, radius, filter, callback) end

---Find colliders within a sphere.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---@param position Vec3 The position of the center of the sphere.
---@param radius number The radius of the sphere, in meters
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@param callback function A function to call when an intersection is detected.  The function will be called with a single `Collider` argument.
function World:querySphere(position, radius, filter, callback) end

---Find colliders within a sphere.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---@param x number The x coordinate of the center of the sphere.
---@param y number The y coordinate of the center of the sphere.
---@param z number The z coordinate of the center of the sphere.
---@param radius number The radius of the sphere, in meters
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@return Collider collider A Collider that intersected the sphere.
function World:querySphere(x, y, z, radius, filter) end

---Find colliders within a sphere.  This is a fast but imprecise query that only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.
---
---Rough queries like this are useful for doing a quick check before doing lots of more expensive collision testing.
---
---Pass a callback function to call for each collider detected, or leave the callback off and this function will return the first collider found.
---
---@param position Vec3 The position of the center of the sphere.
---@param radius number The radius of the sphere, in meters
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
---@return Collider collider A Collider that intersected the sphere.
function World:querySphere(position, radius, filter) end

---Traces a ray through the world and calls a function for each collider that was hit.
---
---The callback can be left off, in which case the closest hit will be returned.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the raycast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Raycasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param x1 number The x coordinate of the origin of the ray.
---@param y1 number The y coordinate of the origin of the ray.
---@param z1 number The z coordinate of the origin of the ray.
---@param x2 number The x coordinate of the endpoint of the ray.
---@param y2 number The y coordinate of the endpoint of the ray.
---@param z2 number The z coordinate of the endpoint of the ray.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@param callback function The function to call when an intersection is detected (see notes).
function World:raycast(x1, y1, z1, x2, y2, z2, filter, callback) end

---Traces a ray through the world and calls a function for each collider that was hit.
---
---The callback can be left off, in which case the closest hit will be returned.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the raycast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Raycasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param origin Vec3 The origin of the ray.
---@param endpoint Vec3 The endpoint of the ray.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@param callback function The function to call when an intersection is detected (see notes).
function World:raycast(origin, endpoint, filter, callback) end

---Traces a ray through the world and calls a function for each collider that was hit.
---
---The callback can be left off, in which case the closest hit will be returned.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the raycast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Raycasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param x1 number The x coordinate of the origin of the ray.
---@param y1 number The y coordinate of the origin of the ray.
---@param z1 number The z coordinate of the origin of the ray.
---@param x2 number The x coordinate of the endpoint of the ray.
---@param y2 number The y coordinate of the endpoint of the ray.
---@param z2 number The z coordinate of the endpoint of the ray.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@return Collider collider The Collider that was hit.
---@return Shape shape The Shape that was hit.
---@return number x The x coordinate of the impact point, in world space.
---@return number y The y coordinate of the impact point, in world space.
---@return number z The z coordinate of the impact point, in world space.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
---@return number nz The z component of the normal vector.
---@return number triangle The index of the triangle that was hit, or nil if a MeshShape was not hit.
function World:raycast(x1, y1, z1, x2, y2, z2, filter) end

---Traces a ray through the world and calls a function for each collider that was hit.
---
---The callback can be left off, in which case the closest hit will be returned.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the raycast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Raycasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param origin Vec3 The origin of the ray.
---@param endpoint Vec3 The endpoint of the ray.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@return Collider collider The Collider that was hit.
---@return Shape shape The Shape that was hit.
---@return number x The x coordinate of the impact point, in world space.
---@return number y The y coordinate of the impact point, in world space.
---@return number z The z coordinate of the impact point, in world space.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
---@return number nz The z component of the normal vector.
---@return number triangle The index of the triangle that was hit, or nil if a MeshShape was not hit.
function World:raycast(origin, endpoint, filter) end

---Sets the angular damping of the World.  Angular damping makes things less "spinny", making them slow down their angular velocity over time. Damping is only applied when angular velocity is over the threshold value.
---
---#### Notes:
---
---This sets the default damping for newly-created colliders.  Damping can also be set on a per-collider basis using `Collider:setAngularDamping`.
---
---@param damping number The angular damping.
---@param threshold? number Velocity limit below which the damping is not applied.
function World:setAngularDamping(damping, threshold) end

---Assigns collision callbacks to the world.  These callbacks are used to filter collisions or get notifications when colliders start or stop touching.  Callbacks are called during `World:update`.
---
---### Filter
---
---Filters collisions.  Receives two colliders and returns a boolean indicating if they should collide.  Note that it is much faster to use tags and `World:enableCollisionBetween` to control collision.  This should only be used when the logic for filtering the collision is highly dynamic.
---
---### Enter
---
---Called when two colliders begin touching.  Receives two colliders and a `Contact` object with more information about the collision.  The `contact` callback will also be called for this collision.
---
---### Exit
---
---Called when two colliders stop touching.  Receives two colliders.
---
---### Contact
---
---Called continuously while two colliders are touching.  Receives two colliders and a `Contact` object with more information about the collision.  The contact can also be disabled to disable the collision response, and its friction/resitution/velocity can be changed.  There can be multiple active contact areas (called "manifolds") between a pair of colliders; this callback will be called for each one.
---
---#### Notes:
---
---The `Thread` that last set these callbacks must also be the thread to call `World:update`.
---
---Note that when a collider goes to sleep, its active contacts will be removed and the `exit` callback will be called.
---
---#### Example:
---
---```lua
---world:setCallbacks({
---  filter = function(a, b)
---    return true
---  end,
---  enter = function(a, b, contact)
---    -- play sounds, spawn particles, etc.
---    -- the collision has not been resolved yet, so the velocity of a and b
---    -- is the velocity before the collision, and can be used to estimate the
---    -- collision force
---  end,
---  exit = function(a, b)
---    -- a and b have stopped touching!
---  end,
---  contact = function(a, b, contact)
---    -- a and b are touching this frame
---    -- use sparingly, as this may be called many times per frame
---    -- use Contact:setFriction and Contact:setResitution to update
---    -- the contact behavior, or Contact:setSurfaceVelocity, for a
---    -- conveyor belt effect, or Contact:setEnabled to disable the
---    -- collision completely.
---  end
---})
---```
---
---@param callbacks {filter: function, enter: function, exit: function, contact: function} The World collision callbacks.
function World:setCallbacks(callbacks) end

---Sets the World's gravity.  Gravity is a constant acceleration applied to all colliders.  The default is `(0, -9.81, 0)` meters per second squared, causing colliders to fall downward.
---
---Use `Collider:setGravityScale` to change gravity strength for a single collider.
---
---#### Notes:
---
---Kinematic colliders ignore gravity, since they are not moved by forces.  Colliders with higher mass do not fall faster.
---
---@param xg number The x component of the gravity force.
---@param yg number The y component of the gravity force.
---@param zg number The z component of the gravity force.
function World:setGravity(xg, yg, zg) end

---Sets the World's gravity.  Gravity is a constant acceleration applied to all colliders.  The default is `(0, -9.81, 0)` meters per second squared, causing colliders to fall downward.
---
---Use `Collider:setGravityScale` to change gravity strength for a single collider.
---
---#### Notes:
---
---Kinematic colliders ignore gravity, since they are not moved by forces.  Colliders with higher mass do not fall faster.
---
---@param gravity Vec3 The gravity force.
function World:setGravity(gravity) end

---Sets the linear damping of the World.  Linear damping is similar to drag or air resistance, slowing down colliders over time as they move. Damping is only applied when linear velocity is over the threshold value.
---
---#### Notes:
---
---A linear damping of 0 means colliders won't slow down over time.  This is the default.
---
---This sets the default damping for newly-created colliders.  Damping can also be set on a per-collider basis using `Collider:setLinearDamping`.
---
---@param damping number The linear damping.
---@param threshold? number Velocity limit below which the damping is not applied.
function World:setLinearDamping(damping, threshold) end

---Sets the response time factor of the World.
---
---The response time controls how relaxed collisions and joints are in the physics simulation, and functions similar to inertia.  A low response time means collisions are resolved quickly, and higher values make objects more spongy and soft.
---
---The value can be any positive number.  It can be changed on a per-joint basis for `DistanceJoint` and `BallJoint` objects.
---
---@param responseTime number The new response time setting for the World.
function World:setResponseTime(responseTime) end

---Sets whether colliders can go to sleep in the World.
---
---#### Notes:
---
---If sleeping is enabled, the World will try to detect colliders that haven't moved for a while and put them to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more efficient and improves physics performance.  However, the physics engine isn't perfect at waking up sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions properly.
---
---This can be set on individual colliders.
---
---Colliders can be manually put to sleep or woken up using `Collider:setAwake`.
---
---@param allowed boolean Whether colliders can sleep.
function World:setSleepingAllowed(allowed) end

---Sets the step count of the World.  The step count influences how many steps are taken during a call to `World:update`.  A higher number of steps will be slower, but more accurate.  The default step count is 20.
---
---@param steps number The new step count.
function World:setStepCount(steps) end

---Sets the tightness of joints in the World.
---
---The tightness controls how much force is applied to colliders connected by joints.  With a value of 0, no force will be applied and joints won't have any effect.  With a tightness of 1, a strong force will be used to try to keep the Colliders constrained.  A tightness larger than 1 will overcorrect the joints, which can sometimes be desirable.  Negative tightness values are not supported.
---
---@param tightness number The new tightness for the World.
function World:setTightness(tightness) end

---Moves a shape from a starting point to an endpoint and returns any colliders it touches along its path.
---
---This is similar to a raycast, but with a `Shape` instead of a point.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the shapecast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Shapecasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param shape Shape The Shape to cast.
---@param x1 number The x position to start at.
---@param y1 number The y position to start at.
---@param z1 number The z position to start at.
---@param x2 number The x position to move the shape to.
---@param y2 number The y position to move the shape to.
---@param z2 number The z position to move the shape to.
---@param angle number The rotation of the shape around its rotation axis, in radians.
---@param ax number The x component of the rotation axis.
---@param ay number The y component of the rotation axis.
---@param az number The z component of the rotation axis.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@param callback function The function to call when an intersection is detected (see notes).
function World:shapecast(shape, x1, y1, z1, x2, y2, z2, angle, ax, ay, az, filter, callback) end

---Moves a shape from a starting point to an endpoint and returns any colliders it touches along its path.
---
---This is similar to a raycast, but with a `Shape` instead of a point.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the shapecast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Shapecasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param shape Shape The Shape to cast.
---@param position Vec3 The position to start at.
---@param destination Vec3 The position to move the shape to.
---@param orientation Quat The orientation of the shape.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@param callback function The function to call when an intersection is detected (see notes).
function World:shapecast(shape, position, destination, orientation, filter, callback) end

---Moves a shape from a starting point to an endpoint and returns any colliders it touches along its path.
---
---This is similar to a raycast, but with a `Shape` instead of a point.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the shapecast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Shapecasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param shape Shape The Shape to cast.
---@param x1 number The x position to start at.
---@param y1 number The y position to start at.
---@param z1 number The z position to start at.
---@param x2 number The x position to move the shape to.
---@param y2 number The y position to move the shape to.
---@param z2 number The z position to move the shape to.
---@param angle number The rotation of the shape around its rotation axis, in radians.
---@param ax number The x component of the rotation axis.
---@param ay number The y component of the rotation axis.
---@param az number The z component of the rotation axis.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@return Collider collider The Collider that was hit.
---@return Shape shape The Shape that was hit.
---@return number x The x coordinate of the impact point.
---@return number y The y coordinate of the impact point.
---@return number z The z coordinate of the impact point.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
---@return number nz The z component of the normal vector.
function World:shapecast(shape, x1, y1, z1, x2, y2, z2, angle, ax, ay, az, filter) end

---Moves a shape from a starting point to an endpoint and returns any colliders it touches along its path.
---
---This is similar to a raycast, but with a `Shape` instead of a point.
---
---#### Notes:
---
---The callback function is passed a collider, a shape, a world-space point, a world-space normal, and a fraction:
---
---    function(collider, shape, x, y, z, nx, ny, nz, fraction)
---      return fraction
---    end
---
---The callback can return a fraction value used to limit the range of further hits.  For example:
---
---- Returning 0.0 will abort the shapecast and ignore all other hits.
---- Returning 1.0 will call the callback for all hits.
---- Returning `fraction` will return successively closer hits.
---
---Shapecasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
---
---@param shape Shape The Shape to cast.
---@param position Vec3 The position to start at.
---@param destination Vec3 The position to move the shape to.
---@param orientation Quat The orientation of the shape.
---@param filter? string An optional tag filter.  Pass one or more tags separated by spaces to only return colliders with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
---@return Collider collider The Collider that was hit.
---@return Shape shape The Shape that was hit.
---@return number x The x coordinate of the impact point.
---@return number y The y coordinate of the impact point.
---@return number z The z coordinate of the impact point.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
---@return number nz The z component of the normal vector.
function World:shapecast(shape, position, destination, orientation, filter) end

---Updates the World, advancing the physics simulation forward in time and moving all the colliders.
---
---#### Notes:
---
---By default, the World updates at a fixed timestep.  This means that the physics simulation will always update with a constant rate, for example 60 "ticks" per second.  This improves stability of the simulation and decouples physics from rendering.  Collider poses are automatically interpolated between the two most recent ticks, ensuring smooth movement even if the tick rate is lower than the rendering rate.
---
---Fixed timestep can be disabled by setting the `tickRate` option to 0 in `lovr.physics.newWorld`. This will use a variable timestep where the `dt` value passed to this function will be applied directly to the physics simulation.
---
---This function must be called from the last thread that called `World:setCallbacks`.  If no callbacks are set, then this can be called from any thread.
---
---#### Example:
---
---```lua
---function lovr.update(dt)
---  world:update(dt)
---end
---```
---
---@param dt number The amount of time to advance the simulation forward.
function World:update(dt) end

---Represents the different types of physics Joints available.
---@alias JointType
---A BallJoint.
---| "ball"
---A DistanceJoint.
---| "distance"
---A HingeJoint.
---| "hinge"
---A SliderJoint.
---| "slider"

---The different ways the motor on a joint can be used.
---@alias MotorMode
---The motor drives to a particular value.
---| "position"
---The motor drives to a particular speed.
---| "velocity"

---Represents the different types of physics Shapes available.
---@alias ShapeType
---A box.
---| "box"
---A sphere.
---| "sphere"
---A capsule (cylinder with rounded ends).
---| "capsule"
---A cylinder.
---| "cylinder"
---A convex hull.
---| "convex"
---A triangle mesh.  Colliders with this shape can not move.
---| "mesh"
---A heightfield.  Colliders with this shape can not move.
---| "terrain"
