---@meta

---The `lovr.audio` module is responsible for playing sound effects and music.  To play a sound, create a `Source` object and call `Source:play` on it.  Currently ogg, wav, and mp3 audio formats are supported.
---
---@class lovr.audio
lovr.audio = {}

---Returns information about the active playback or capture device.
---
---#### Notes:
---
---If no device has been set yet, this function returns `nil`.
---
---The device doesn't need to be started.
---
---@param type? AudioType The type of device to query.
---@return string | nil name The name of the device, or `nil` if no device is set.
---@return userdata | nil id The opaque id of the device, or `nil` if no device is set.
function lovr.audio.getDevice(type) end

---Returns a list of playback or capture devices.  Each device has an `id`, `name`, and a `default` flag indicating whether it's the default device.
---
---To use a specific device id for playback or capture, pass it to `lovr.audio.setDevice`.
---
---@param type? AudioType The type of devices to query (playback or capture).
---@return table devices The list of devices.
function lovr.audio.getDevices(type) end

---Returns the orientation of the virtual audio listener in angle/axis representation.
---
---@return number angle The number of radians the listener is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function lovr.audio.getOrientation() end

---Returns the position and orientation of the virtual audio listener.
---
---@return number x The x position of the listener, in meters.
---@return number y The y position of the listener, in meters.
---@return number z The z position of the listener, in meters.
---@return number angle The number of radians the listener is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function lovr.audio.getPose() end

---Returns the position of the virtual audio listener, in meters.
---
---@return number x The x position of the listener.
---@return number y The y position of the listener.
---@return number z The z position of the listener.
function lovr.audio.getPosition() end

---Returns the sample rate used by the playback device.  This can be changed using `lovr.conf`.
---
---@return number rate The sample rate of the playback device, in Hz.
function lovr.audio.getSampleRate() end

---Returns an audio stream for an audio device.  The stream needs to be set up when configuring the device using `lovr.audio.setDevice`.
---
---For playback devices, the stream will contain all audio sent to the speakers by LÖVR.  For capture devices, the stream will contain audio captured by the microphone.
---
---#### Example:
---
---```lua
---function lovr.load()
---  -- activate default microphone
---  lovr.audio.setDevice('capture', nil)
---  lovr.audio.start('capture')
---
---  stream = lovr.audio.getStream('capture')
---end
---
---function lovr.update(dt)
---  print('There are ' .. stream:getReadCapacity() .. ' microphone samples available')
---
---  local samples = stream:read()
---
---  -- do something with samples
---end
---```
---
---@return AudioStream stream The audio stream containing audio played/captured by the device.
function lovr.audio.getStream() end

---Returns the master volume.  All audio sent to the playback device has its volume multiplied by this factor.
---
---#### Notes:
---
---The default volume is 1.0 (0 dB).
---
---@param units? VolumeUnit The units to return (linear or db).
---@return number volume The master volume.
function lovr.audio.getVolume(units) end

---Returns whether an audio device is started.
---
---@param type? AudioType The type of device to check.
---@return boolean started Whether the device is active.
function lovr.audio.isStarted(type) end

---Creates a new `AudioMesh`.
---
---#### Notes:
---
---The triangles in an AudioMesh should use counterclockwise winding.
---
---The AudioMesh will start out enabled, and it will be located at the origin.
---
---@param vertices table A table of vertices in the mesh.  Can be a table of tables (each with 3 numbers) or a table of numbers (every 3 numbers form a 3D vertex).
---@param indices table A table of triangle indices representing how the vertices are connected together into triangles.
---@param material? AudioMaterial | {AudioMaterial} The material the audio mesh is made out of.  Can be a single `AudioMaterial` to apply to the whole mesh, or a table of `AudioMaterial` values, one for each triangle.
---@return AudioMesh audioMesh The new AudioMesh.
function lovr.audio.newAudioMesh(vertices, indices, material) end

---Creates a new `AudioMesh`.
---
---#### Notes:
---
---The triangles in an AudioMesh should use counterclockwise winding.
---
---The AudioMesh will start out enabled, and it will be located at the origin.
---
---@param modelData ModelData A ModelData to use for the mesh data.
---@param material? AudioMaterial | {AudioMaterial} The material the audio mesh is made out of.  Can be a single `AudioMaterial` to apply to the whole mesh, or a table of `AudioMaterial` values, one for each triangle.
---@return AudioMesh audioMesh The new AudioMesh.
function lovr.audio.newAudioMesh(modelData, material) end

---Creates a new `AudioMesh`.
---
---#### Notes:
---
---The triangles in an AudioMesh should use counterclockwise winding.
---
---The AudioMesh will start out enabled, and it will be located at the origin.
---
---@param mesh Mesh A Mesh to use for the mesh data.  It must use the `cpu` storage mode.
---@param material? AudioMaterial | {AudioMaterial} The material the audio mesh is made out of.  Can be a single `AudioMaterial` to apply to the whole mesh, or a table of `AudioMaterial` values, one for each triangle.
---@return AudioMesh audioMesh The new AudioMesh.
function lovr.audio.newAudioMesh(mesh, material) end

---Creates a new Source from an ogg, wav, or mp3 file, a `Sound`, or an `AudioStream`.
---
---#### Example:
---
---```lua
---function lovr.load()
---  sandstorm = lovr.audio.newSource('darude.ogg', { decode = false })
---  sandstorm:play()
---end
---```
---
---@param file string | Blob A filename or Blob containing audio data to load.
---@param options? {decode: boolean, spatial: boolean, pitchable: boolean} Optional options.
---@return Source source The new Source.
function lovr.audio.newSource(file, options) end

---Creates a new Source from an ogg, wav, or mp3 file, a `Sound`, or an `AudioStream`.
---
---#### Example:
---
---```lua
---function lovr.load()
---  sandstorm = lovr.audio.newSource('darude.ogg', { decode = false })
---  sandstorm:play()
---end
---```
---
---@param sound Sound The Sound containing audio to play.
---@param options? {decode: boolean, spatial: boolean, pitchable: boolean} Optional options.
---@return Source source The new Source.
function lovr.audio.newSource(sound, options) end

---Creates a new Source from an ogg, wav, or mp3 file, a `Sound`, or an `AudioStream`.
---
---#### Example:
---
---```lua
---function lovr.load()
---  sandstorm = lovr.audio.newSource('darude.ogg', { decode = false })
---  sandstorm:play()
---end
---```
---
---@param stream Sound The AudioStream containing audio to play.
---@param options? {decode: boolean, spatial: boolean, pitchable: boolean} Optional options.
---@return Source source The new Source.
function lovr.audio.newSource(stream, options) end

---Switches either the playback or capture device to a new one.
---
---If a device for the given type is already active, it will be stopped and destroyed.  The new device will not be started automatically, use `lovr.audio.start` to start it.
---
---A device id (previously retrieved using `lovr.audio.getDevices`) can be given to use a specific audio device, or `nil` can be used for the id to use the default audio device.
---
---A sink can be also be provided when changing the device.  A sink is an audio stream (`Sound` object with a `stream` type) that will receive all audio samples played (for playback) or all audio samples captured (for capture).  When an audio device with a sink is started, be sure to periodically call `Sound:read` on the sink to read audio samples from it, otherwise it will overflow and discard old data.  The sink can have any format, data will be converted as needed. Using a sink for the playback device will reduce performance, but this isn't the case for capture devices.
---
---Audio devices can be started in `shared` or `exclusive` mode.  Exclusive devices may have lower latency than shared devices, but there's a higher chance that requesting exclusive access to an audio device will fail (either because it isn't supported or allowed).  One strategy is to first try the device in exclusive mode, switching to shared if it doesn't work.
---
---@param type? AudioType The device to switch.
---@param id? userdata The id of the device to use, or `nil` to use the default device.
---@param stream? AudioStream | boolean An optional audio stream to use as a "sink" for the device.  For playback devices, any audio sent to the speakers is also copied to the sink.  For capture devices, audio captured by the device is copied to the sink.  Can be a specific AudioStream, or `true` to create a default audio stream matching the native format of the device.  If nil, this will be `true` for capture devices and `false` for playback devices.  Use `lovr.audio.getStream` to get the stream after the device is created.
---@param mode? AudioShareMode The sharing mode for the device.
---@return boolean success Whether creating the audio device succeeded.
function lovr.audio.setDevice(type, id, stream, mode) end

---Sets an HRTF to use for binaural audio spatialization.  The HRTF should be provided as a SOFA file (Spatially Oriented File Format for Acoustics).
---
---Without an HRTF, LÖVR will use simple panning for spatialization, which adjusts the volume level of the left/right audio channels based on the source's location.  Binaural audio spatialization with an HRTF sounds more realistic, at a small performance cost.
---
---This is a slow function, so it should be called during startup or on a thread.
---
---#### Notes:
---
---A default HRTF can be found [here](https://github.com/ValveSoftware/steam-audio/blob/master/core/data/hrtf/cipic_124.sofa).
---
---@param file string | Blob A filename or Blob containing a SOFA file to load.
function lovr.audio.setHRTF(file) end

---Sets an HRTF to use for binaural audio spatialization.  The HRTF should be provided as a SOFA file (Spatially Oriented File Format for Acoustics).
---
---Without an HRTF, LÖVR will use simple panning for spatialization, which adjusts the volume level of the left/right audio channels based on the source's location.  Binaural audio spatialization with an HRTF sounds more realistic, at a small performance cost.
---
---This is a slow function, so it should be called during startup or on a thread.
---
---#### Notes:
---
---A default HRTF can be found [here](https://github.com/ValveSoftware/steam-audio/blob/master/core/data/hrtf/cipic_124.sofa).
---
function lovr.audio.setHRTF() end

---Sets the orientation of the virtual audio listener in angle/axis representation.
---
---@param angle number The number of radians the listener should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function lovr.audio.setOrientation(angle, ax, ay, az) end

---Sets the orientation of the virtual audio listener in angle/axis representation.
---
---@param orientation quaternion The orientation of the listener.
function lovr.audio.setOrientation(orientation) end

---Sets the position and orientation of the virtual audio listener.
---
---#### Notes:
---
---The position of the listener doesn't use any specific units, but usually they can be thought of as meters to match the headset module.
---
---@param x number The x position of the listener.
---@param y number The y position of the listener.
---@param z number The z position of the listener.
---@param angle number The number of radians the listener is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function lovr.audio.setPose(x, y, z, angle, ax, ay, az) end

---Sets the position and orientation of the virtual audio listener.
---
---#### Notes:
---
---The position of the listener doesn't use any specific units, but usually they can be thought of as meters to match the headset module.
---
---@param position vector The position of the listener.
---@param orientation quaternion The orientation of the listener.
function lovr.audio.setPose(position, orientation) end

---Sets the position of the virtual audio listener.  The position doesn't have any specific units, but usually they can be thought of as meters, to match the headset module.
---
---@param x number The x position of the listener.
---@param y number The y position of the listener.
---@param z number The z position of the listener.
function lovr.audio.setPosition(x, y, z) end

---Sets the position of the virtual audio listener.  The position doesn't have any specific units, but usually they can be thought of as meters, to match the headset module.
---
---@param position vector The listener position.
function lovr.audio.setPosition(position) end

---Sets the master volume.  All audio sent to the playback device has its volume multiplied by this factor.
---
---#### Notes:
---
---The volume will be clamped to a 0-1 range (0 dB).
---
---@param volume number The master volume.
---@param units? VolumeUnit The units of the value.
function lovr.audio.setVolume(volume, units) end

---Starts the active playback or capture device.  By default, the playback device is automatically initialized and started the first time a `Source` is played, but this can be controlled using the `t.audio.start` flag in `lovr.conf`.
---
---#### Notes:
---
---Starting an audio device may fail if:
---
---- The device is already started
---- No device was initialized with `lovr.audio.setDevice`
---- Lack of `audiocapture` permission on Android (see `lovr.system.requestPermission`)
---- Some other problem accessing the audio device
---
---@param type? AudioType The type of device to start.
---@return boolean started Whether the device was successfully started.
---@return string | nil error The error message, if any.
function lovr.audio.start(type) end

---Stops the active playback or capture device.  This may fail if:
---
---- The device is not started
---- No device was initialized with `lovr.audio.setDevice`
---
---#### Notes:
---
---Switching devices with `lovr.audio.setDevice` will stop the existing one.
---
---@param type? AudioType The type of device to stop.
---@return boolean stopped Whether the device was successfully stopped.
---@return string | nil error The error message, if any.
function lovr.audio.stop(type) end

---Flushes source changes to the audio engine.  Changes to sources are not reflected right away, but are instead sent to the audio engine all at once in a group.  This avoids issues with "tearing", where a group of sources are played all at once, but the audio thread starts playing some of them slightly earlier than others.
---
---This is an internal function that is called automatically by `lovr.run` after `lovr.update`. It is not normally necessary to call this function manually.
---
---@param dt number The delta time for the current frame.  Can be zero.
function lovr.audio.update(dt) end

---AudioMeshes are triangle meshes that define geometry for audio simulation.  They are used for two types of audio effects:
---
---- **Reverb**, from sound reflecting off of solid objects in the scene.
---- **Occlusion**, where sounds will be quieter when they're behind walls.
---
---Audio mesh triangles can have an `AudioMaterial`, controlling how it absorbs and reflects sound. For example, carpet will absorb more energy than concrete or metal.
---
---Audio meshes can be translated, rotated, and scaled dynamically.
---@class AudioMesh
local AudioMesh = {}

---Creates a lightweight copy of the AudioMesh.  The clone reuses the mesh data from the parent, but it can be transformed independently.
---
---@return AudioMesh clone A copy of the parent AudioMesh.
function AudioMesh:clone() end

---Returns the orientation of the AudioMesh, in angle/axis representation.
---
---@return number angle The number of radians the AudioMesh is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function AudioMesh:getOrientation() end

---Returns the position and orientation of the AudioMesh.
---
---@return number x The x position of the AudioMesh, in meters.
---@return number y The y position of the AudioMesh, in meters.
---@return number z The z position of the AudioMesh, in meters.
---@return number angle The number of radians the AudioMesh is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function AudioMesh:getPose() end

---Returns the position of the AudioMesh, in meters.
---
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
function AudioMesh:getPosition() end

---Returns the scale of the AudioMesh.
---
---@return number x The x scale factor.
---@return number y The y scale factor.
---@return number z The z scale factor.
function AudioMesh:getScale() end

---Returns transform (position, scale, and orientation) of the AudioMesh.
---
---@return number x The x position, in meters.
---@return number y The y position, in meters.
---@return number z The z position, in meters.
---@return number sx The x scale.
---@return number sy The y scale.
---@return number sz The z scale.
---@return number angle The number of radians the AudioMesh is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function AudioMesh:getTransform() end

---Returns whether the AudioMesh is enabled.  Disabled audio meshes do not affect audio processing.
---
---@return boolean enabled Whether the AudioMesh is enabled.
function AudioMesh:isEnabled() end

---Enable or disable the AudioMesh.  Disabled audio meshes do not affect audio processing.
---
---@param enabled boolean Whether the AudioMesh should be enabled.
function AudioMesh:setEnabled(enabled) end

---Sets the orientation of the AudioMesh.
---
---@param angle number The number of radians the AudioMesh should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function AudioMesh:setOrientation(angle, ax, ay, az) end

---Sets the orientation of the AudioMesh.
---
---@param orientation quaternion The new orientation for the AudioMesh.
function AudioMesh:setOrientation(orientation) end

---Sets the position and orientation of the AudioMesh.
---
---@param x number The x position of the AudioMesh.
---@param y number The y position of the AudioMesh.
---@param z number The z position of the AudioMesh.
---@param angle number The number of radians the AudioMesh is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function AudioMesh:setPose(x, y, z, angle, ax, ay, az) end

---Sets the position and orientation of the AudioMesh.
---
---@param position vector The position.
---@param orientation quaternion The orientation.
function AudioMesh:setPose(position, orientation) end

---Sets the position of the AudioMesh, in meters.
---
---@param x number The new x coordinate.
---@param y number The new y coordinate.
---@param z number The new z coordinate.
function AudioMesh:setPosition(x, y, z) end

---Sets the position of the AudioMesh, in meters.
---
---@param position vector The position.
function AudioMesh:setPosition(position) end

---Sets the scale of the AudioMesh.
---
---@param sx number The x scale.
---@param sy number The y scale.
---@param sz number The z scale.
function AudioMesh:setScale(sx, sy, sz) end

---Sets the scale of the AudioMesh.
---
---@param scale vector The new scale.
function AudioMesh:setScale(scale) end

---Sets the transform of the AudioMesh.
---
---@param x number The x component of the position.
---@param y number The y component of the position.
---@param z number The z component of the position.
---@param sx number The x component of the scale.
---@param sy number The y component of the scale.
---@param sz number The z component of the scale.
---@param angle number The number of radians the AudioMesh should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function AudioMesh:setTransform(x, y, z, sx, sy, sz, angle, ax, ay, az) end

---Sets the transform of the AudioMesh.
---
---@param position vector The position.
---@param scale vector The scale.
---@param orientation quaternion The orientation.
function AudioMesh:setTransform(position, scale, orientation) end

---Sets the transform of the AudioMesh.
---
---@param transform Mat4 The transform.
function AudioMesh:setTransform(transform) end

---A Source is an object representing a single sound.  Currently ogg, wav, and mp3 formats are supported.
---
---When a Source is playing, it will send audio to the speakers.  Sources do not play automatically when they are created.  Instead, the `play`, `pause`, and `stop` functions can be used to control when they should play.
---
---`Source:seek` and `Source:tell` can be used to control the playback position of the Source.  A Source can be set to loop when it reaches the end using `Source:setLooping`.
---@class Source
local Source = {}

---Creates a copy of the Source, referencing the same `Sound` object and inheriting all of the settings of this Source.  However, it will be created in the stopped state and will be rewound to the beginning.
---
---#### Notes:
---
---This is a good way to create multiple Sources that play the same sound, since the audio data won't be loaded multiple times and can just be reused.  You can also create multiple `Source` objects and pass in the same `Sound` object for each one, which will have the same effect.
---
---@return Source source A genetically identical copy of the Source.
function Source:clone() end

---Returns the absorption coefficients of the Source.  Absorption allows for simulating the decay of audio as it moves through a medium, with different frequencies decaying at different rates. For example, in air, distant sounds usually sound more muffled because higher frequencies decay faster than lower frequencies.
---
---#### Notes:
---
---When a Source is created, its absorption coefficients are all zero (no absorption).
---
---The formula used for the volume factor of each band is `math.exp(-absorption * distance)`.
---
---The absorption coefficients of air are `.0002`, `.0017`, and `.0182`.
---
---@return number low The absorption coefficient for low frequencies (400 Hz).
---@return number mid The absorption coefficient for midrange frequencies (2.5 kHz).
---@return number high The absorption coefficient for high frequencies (15 kHz).
function Source:getAbsorption() end

---Returns the directional volume cone of the source.  The cone is defined by three values: `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is within `innerAngle` of the source's direction, the volume won't be changed.  Otherwise, the volume will start to decrease, reaching a minimum of `outerVolume` once the listener is at `outerAngle` radians from the direction of the source.
---
---#### Notes:
---
---When a Source is created, its `innerAngle` is `0`, its `outerAngle` is `0`, and its `outerVolume` is `1` (no cone effect).
---
---@return number innerAngle The inner cone angle, in radians.
---@return number outerAngle The outer cone angle, in radians.
---@return number outerVolume The outer volume factor.
function Source:getCone() end

---Returns the duration of the Source.
---
---@param unit? TimeUnit The unit to return.
---@return number duration The duration of the Source.
function Source:getDuration(unit) end

---Returns the volume falloff of the Source, which causes it to get quieter as it gets further away from the listener.
---
---#### Notes:
---
---The formula for falloff is:
---
---    if distance > minDistance then
---      volume = volume * math.max(minVolume, 1 / (1 + distance - minDistance))
---    end
---
---@return number minDistance The distance at which the volume starts to decrease.
---@return number minVolume The minimum volume for the falloff.  For example, .25 clamps the falloff to 25% of the source's volume.  Note that other effects like cone and occlusion can still decrease the volume further.  The falloff volume factor gets combined (multiplied) with other volume factors.
function Source:getFalloff() end

---Returns the occlusion settings for the Source.  Occlusion makes sources quieter when there is an `AudioMesh` blocking the path between the source and the listener.
---
---#### Notes:
---
---Occlusion is disabled by default.
---
---@return number rays The number of rays used to trace the path between the source and the listener.  0 means occlusion is disabled, 1 will result in basic occlusion, and more rays can be used to support partial occlusion for large objects.  Typical values would be between 0 and 16.
---@return number transmissionRays The number of rays used to compute transmission.  Transmission allows *some* audio to pass through walls, based on the `AudioMaterial` of the objects between the source and the listener.  This is usually between 0 and 4.
function Source:getOcclusion() end

---Returns the orientation of the Source, in angle/axis representation.
---
---@return number angle The number of radians the Source is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Source:getOrientation() end

---Returns the pitch of the Source.
---
---#### Notes:
---
---The default pitch is 1.  Every doubling/halving of the pitch will raise/lower the pitch by one octave.  Changing the pitch also changes the playback speed.
---
---@return number pitch The pitch.
function Source:getPitch() end

---Returns the position and orientation of the Source.
---
---@return number x The x position of the Source, in meters.
---@return number y The y position of the Source, in meters.
---@return number z The z position of the Source, in meters.
---@return number angle The number of radians the Source is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Source:getPose() end

---Returns the position of the Source, in meters.  Setting the position will cause the Source to be distorted and attenuated based on its position relative to the listener.
---
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
function Source:getPosition() end

---Returns the radius of the Source, in meters.
---
---This does not control falloff or attenuation.  It is only used for smoothing out occlusion.  If a Source doesn't have a radius, then when it becomes occluded by a wall its volume will instantly drop.  Giving the Source a radius that approximates its emitter's size will result in a smooth transition between audible and occluded, improving realism.
---
---@return number radius The radius of the Source, in meters.
function Source:getRadius() end

---Returns the reverb settings for the Source.
---
---#### Notes:
---
---Reverb is disabled by default.
---
---@return number level The reverb volume.
---@return ReverbMode mode The reverb mode.
function Source:getReverb() end

---Returns the `Sound` object backing the Source.  Multiple Sources can share one Sound, allowing its data to only be loaded once.  An easy way to do this sharing is by using `Source:clone`.
---
---@return Sound sound The Sound object.
function Source:getSound() end

---Returns the spatialization settings for the Source.  Spatialization uses the poses of the source and listener to play the sound as if it is located in 3D space.  LÖVR can do 2 kinds of spatialization:
---
---- Simple panning.  When no HRTF is active, the volume of the left/right speaker channels are
---  adjusted, for a simple spatialization effect.
---- Binaural spatialization.  When an HRTF has been set with `lovr.audio.setHRTF`, sources will be
---  spatialized using binaural spatialization, which is higher quality than panning.
---
---Spatialization is a floating point number, so sources can blend between their raw audio and spatialized audio.  This can be useful for objects that are close to the listener.
---
---#### Notes:
---
---Spatialization is disabled by default.
---
---@return number spatialization The amount of spatialization applied to the source, from 0 to 1.
function Source:getSpatialization() end

---Returns the current volume factor for the Source.
---
---@param units? VolumeUnit The units to return (linear or db).
---@return number volume The volume of the Source.
function Source:getVolume(units) end

---Returns whether or not the Source will loop when it finishes.
---
---@return boolean looping Whether or not the Source is looping.
function Source:isLooping() end

---Returns whether or not the Source is playing.
---
---@return boolean playing Whether the Source is playing.
function Source:isPlaying() end

---Returns whether the Source was created with the `spatial` flag.  Non-spatial sources are routed directly to the speakers without any spatial effects.
---
---@return boolean spatial Whether the source is spatial.
function Source:isSpatial() end

---Pauses the source.  It can be resumed with `Source:resume` or `Source:play`. If a paused source is rewound, it will remain paused.
---
function Source:pause() end

---Plays the Source.  This doesn't do anything if the Source is already playing.
---
---#### Notes:
---
---There is a maximum of 64 Sources that can be playing at once.  If 64 Sources are already playing, this function will return `false`.
---
---@return boolean success Whether the Source successfully started playing.
function Source:play() end

---Seeks the Source to the specified position.
---
---#### Notes:
---
---Seeking a Source backed by a stream `Sound` has no meaningful effect.
---
---@param position number The position to seek to.
---@param unit? TimeUnit The units for the seek position.
function Source:seek(position, unit) end

---Sets the absorption coefficients of the Source.  Absorption allows for simulating the decay of audio as it moves through a medium, with different frequencies decaying at different rates. For example, in air, distant sounds usually sound more muffled because higher frequencies decay faster than lower frequencies.
---
---#### Notes:
---
---When a Source is created, its absorption coefficients are all zero (no absorption).
---
---The formula used for the volume factor of each band is `math.exp(-absorption * distance)`.
---
---The absorption coefficients of air are `.0002`, `.0017`, and `.0182`.
---
---@param low number The absorption coefficient for low frequencies (400 Hz).
---@param mid number The absorption coefficient for midrange frequencies (2.5 kHz).
---@param high number The absorption coefficient for high frequencies (15 kHz).
function Source:setAbsorption(low, mid, high) end

---Sets the absorption coefficients of the Source.  Absorption allows for simulating the decay of audio as it moves through a medium, with different frequencies decaying at different rates. For example, in air, distant sounds usually sound more muffled because higher frequencies decay faster than lower frequencies.
---
---#### Notes:
---
---When a Source is created, its absorption coefficients are all zero (no absorption).
---
---The formula used for the volume factor of each band is `math.exp(-absorption * distance)`.
---
---The absorption coefficients of air are `.0002`, `.0017`, and `.0182`.
---
---@param enable boolean Whether absorption should be enabled.  False will set the coefficients to zero, `true` will use the absorption coefficients of air (see notes).
function Source:setAbsorption(enable) end

---Sets the directional volume cone of the source.  The cone is defined by three values: `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is within `innerAngle` of the source's direction, the volume won't be changed.  Otherwise, the volume will start to decrease, reaching a minimum of `outerVolume` once the listener is at `outerAngle` radians from the direction of the source.
---
---#### Notes:
---
---When a Source is created, its `innerAngle` is `0`, its `outerAngle` is `0`, and its `outerVolume` is `1` (no cone effect).
---
---@param innerAngle number The inner cone angle, in radians.
---@param outerAngle number The outer cone angle, in radians.
---@param outerVolume number The outer volume factor.
function Source:setCone(innerAngle, outerAngle, outerVolume) end

---Sets the directional volume cone of the source.  The cone is defined by three values: `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is within `innerAngle` of the source's direction, the volume won't be changed.  Otherwise, the volume will start to decrease, reaching a minimum of `outerVolume` once the listener is at `outerAngle` radians from the direction of the source.
---
---#### Notes:
---
---When a Source is created, its `innerAngle` is `0`, its `outerAngle` is `0`, and its `outerVolume` is `1` (no cone effect).
---
---@param enable boolean Whether the volume cone should be enabled.  Passing `true` will set a default cone with an `innerAngle` of `0`, an `outerAngle` of `math.pi`, and an `outerVolume` of `0`.  Falsy values disable the cone completely (equivalent to 0, 0, 1).
function Source:setCone(enable) end

---Sets the volume falloff of the Source, causing it to get quieter as it gets further away from the listener.
---
---#### Notes:
---
---The formula for falloff is:
---
---    if distance > minDistance then
---      volume = volume * math.max(minVolume, 1 / (1 + distance - minDistance))
---    end
---
---@param minDistance number The distance at which the volume will start to decrease.
---@param minVolume number The minimum volume for the falloff.  For example, .25 would clamp the falloff to 25% of the source's volume.  Note that other effects like cone and occlusion can still decrease the volume further.  The falloff volume factor gets combined (multiplied) with other volume factors.
function Source:setFalloff(minDistance, minVolume) end

---Sets the volume falloff of the Source, causing it to get quieter as it gets further away from the listener.
---
---#### Notes:
---
---The formula for falloff is:
---
---    if distance > minDistance then
---      volume = volume * math.max(minVolume, 1 / (1 + distance - minDistance))
---    end
---
---@param enable boolean Whether volume falloff should be enabled.  Passing `true` will set a default falloff with a `minDistance` of `0` and a `minVolume` of `0`.  Falsy values disable falloff completely by setting the minVolume to `1`.
function Source:setFalloff(enable) end

---Sets whether or not the Source loops.
---
---#### Notes:
---
---Attempting to loop a Source backed by a stream `Sound` will cause an error.
---
---@param loop boolean Whether or not the Source will loop.
function Source:setLooping(loop) end

---Sets the occlusion settings for the Source.  Occlusion makes sources quieter when there is an `AudioMesh` blocking the path between the source and the listener.
---
---@param rays number The number of rays used to trace the path between the source and the listener.  0 means occlusion is disabled, 1 will result in basic occlusion, and more rays can be used to support partial occlusion for large objects.  Typical values would be between 0 and 64.
---@param transmissionRays number The number of rays used to compute transmission.  Transmission allows *some* audio to pass through walls, based on the `AudioMaterial` of the objects between the source and the listener.  This is usually between 0 and 4.
function Source:setOcclusion(rays, transmissionRays) end

---Sets the occlusion settings for the Source.  Occlusion makes sources quieter when there is an `AudioMesh` blocking the path between the source and the listener.
---
---@param enable boolean Whether occlusion should be enabled.  Passing `true` is shorthand for `64` and `4`, and falsy values will disable occlusion by settings `rays` to `0`.
function Source:setOcclusion(enable) end

---Sets the orientation of the Source in angle/axis representation.
---
---@param angle number The number of radians the Source should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Source:setOrientation(angle, ax, ay, az) end

---Sets the orientation of the Source in angle/axis representation.
---
---@param orientation quaternion The orientation.
function Source:setOrientation(orientation) end

---Sets the pitch of the Source.
---
---#### Notes:
---
---The default pitch is 1.  Every doubling/halving of the pitch will raise/lower the pitch by one octave.  Changing the pitch also changes the playback speed.
---
---@param pitch number The new pitch.
function Source:setPitch(pitch) end

---Sets the position and orientation of the Source.
---
---#### Notes:
---
---The position doesn't have any defined units, but meters are used by convention.
---
---Ambisonic sources ignore their position, because they are omnidirectional.
---
---@param x number The x position of the Source.
---@param y number The y position of the Source.
---@param z number The z position of the Source.
---@param angle number The number of radians the Source is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Source:setPose(x, y, z, angle, ax, ay, az) end

---Sets the position and orientation of the Source.
---
---#### Notes:
---
---The position doesn't have any defined units, but meters are used by convention.
---
---Ambisonic sources ignore their position, because they are omnidirectional.
---
---@param position vector The position.
---@param orientation quaternion The orientation.
function Source:setPose(position, orientation) end

---Sets the position of the Source.  Setting the position will cause the Source to be spatialized based on its position relative to the listener.
---
---#### Notes:
---
---The position doesn't have any defined units, but meters are used by convention.
---
---Ambisonic sources ignore their position, because they are omnidirectional.
---
---@param x number The x coordinate of the position.
---@param y number The y coordinate of the position.
---@param z number The z coordinate of the position.
function Source:setPosition(x, y, z) end

---Sets the position of the Source.  Setting the position will cause the Source to be spatialized based on its position relative to the listener.
---
---#### Notes:
---
---The position doesn't have any defined units, but meters are used by convention.
---
---Ambisonic sources ignore their position, because they are omnidirectional.
---
---@param position vector The position.
function Source:setPosition(position) end

---Sets the radius of the Source, in meters.
---
---This does not control falloff or attenuation.  It is only used for smoothing out occlusion.  If a Source doesn't have a radius, then when it becomes occluded by a wall its volume will instantly drop.  Giving the Source a radius that approximates its emitter's size will result in a smooth transition between audible and occluded, improving realism.
---
---#### Notes:
---
---Ambisonic sources don't use their radius for anything, because they do not simulate occlusion.
---
---@param radius number The new radius of the Source, in meters.
function Source:setRadius(radius) end

---Sets the reverb settings for the Source.
---
---#### Notes:
---
---Reverb is disabled by default.
---
---@param level number The reverb volume.
---@param mode ReverbMode Whether the source should simulate its own reverb or use shared reverb properties simulated at the listener.
function Source:setReverb(level, mode) end

---Sets the reverb settings for the Source.
---
---#### Notes:
---
---Reverb is disabled by default.
---
---@param enable boolean nil
function Source:setReverb(enable) end

---Sets the spatialization settings for the Source.  Spatialization uses the poses of the source and listener to play the sound as if it is located in 3D space.  LÖVR can do 2 kinds of spatialization:
---
---- Simple panning.  When no HRTF is active, the volume of the left/right speaker channels are
---  adjusted, for a simple spatialization effect.
---- Binaural spatialization.  When an HRTF has been set with `lovr.audio.setHRTF`, sources will be
---  spatialized using binaural spatialization, which is higher quality than panning.
---
---Spatialization is a floating point number, so sources can blend between their raw audio and spatialized audio.  This can be useful for objects that are close to the listener.
---
---@param spatialization number The amount of spatialization applied to the source, from 0 to 1.
function Source:setSpatialization(spatialization) end

---Sets the spatialization settings for the Source.  Spatialization uses the poses of the source and listener to play the sound as if it is located in 3D space.  LÖVR can do 2 kinds of spatialization:
---
---- Simple panning.  When no HRTF is active, the volume of the left/right speaker channels are
---  adjusted, for a simple spatialization effect.
---- Binaural spatialization.  When an HRTF has been set with `lovr.audio.setHRTF`, sources will be
---  spatialized using binaural spatialization, which is higher quality than panning.
---
---Spatialization is a floating point number, so sources can blend between their raw audio and spatialized audio.  This can be useful for objects that are close to the listener.
---
---@param enable boolean Whether spatialization should be enabled.  `true` for 1, `false` for 0.
function Source:setSpatialization(enable) end

---Sets the current volume factor for the Source.
---
---#### Notes:
---
---The volume will be clamped to a 0-1 range (0 dB).
---
---@param volume number The new volume.
---@param units? VolumeUnit The units of the value.
function Source:setVolume(volume, units) end

---Stops the source, also rewinding it to the beginning.
---
function Source:stop() end

---Returns the current playback position of the Source.
---
---#### Notes:
---
---The return value for Sources backed by a stream `Sound` has no meaning.
---
---@param unit? TimeUnit The unit to return.
---@return number position The current playback position.
function Source:tell(unit) end

---Different types of audio material presets for `AudioMesh` objects.  These materials determine how sound is absorbed and reflected when it hits the mesh.
---@alias AudioMaterial
---Generic default audio material.
---| "generic"
---Brick.
---| "brick"
---Carpet.
---| "carpet"
---Ceramic.
---| "ceramic"
---Concrete.
---| "concrete"
---Glass.
---| "glass"
---Gravel.
---| "gravel"
---Metal.
---| "metal"
---Plaster.
---| "plaster"
---Rock.
---| "rock"
---Wood.
---| "wood"

---Audio devices can be created in shared mode or exclusive mode.  In exclusive mode, the audio device is the only one active on the system, which gives better performance and lower latency. However, exclusive devices aren't always supported and might not be allowed, so there is a higher chance that creating one will fail.
---@alias AudioShareMode
---Shared mode.
---| "shared"
---Exclusive mode.
---| "exclusive"

---When referencing audio devices, this indicates whether it's the playback or capture device.
---@alias AudioType
---The playback device (speakers, headphones).
---| "playback"
---The capture device (microphone).
---| "capture"

---Different types of effects that can be applied with `Source:setEffectEnabled`.
---@alias Effect
---Models absorption as sound travels through the air, water, etc.
---| "absorption"
---Decreases audio volume with distance (1 / max(distance, 1)).
---| "attenuation"
---Causes audio to drop off when the Source is occluded by geometry.
---| "occlusion"
---Models reverb caused by audio bouncing off of geometry.
---| "reverb"
---Spatializes the Source using either simple panning or an HRTF.
---| "spatialization"
---Causes audio to be heard through walls when occluded, based on audio materials.
---| "transmission"

---This controls the method used to simulate reverb on a `Source`.
---
---Note that there is also `ReverbType` set in `lovr.conf`, which can be changed independently of the reverb mode used by a source.
---@alias ReverbMode
---The listener will cast rays outwards to compute the reverb characteristics of the room, and use this to apply reverb to all sources using the `listener` reverb mode.  This is less expensive than per-source reverb because the reverb only needs to be simulated once, but it can be lower quality.
---| "listener"
---When a Source has this reverb mode, it will compute its own reverb independently.  This will give higher quality results, but it can quickly become very expensive to compute reverb for large numbers of sources.  Consider enabling this only for a small number of important sounds.
---| "source"

---Reverb can be modeled in two different ways.  This is a global setting set in `lovr.conf`.
---
---In addition to the global reverb type, there is `ReverbMode`, which controls whether reverb is simulated once from the listener, or from individual sources.  This can be set on a per-source basis using `Source:setReverb`.
---@alias ReverbType
---Convolution reverb.  This sounds more realistic than parametric reverb, especially for outdoor spaces, but is more expensive to simulate.
---| "convolution"
---Parametric reverb.  Cheaper than convolution reverb, but lower quality.
---| "parametric"

---When figuring out how long a Source is or seeking to a specific position in the sound file, units can be expressed in terms of seconds or in terms of frames.  A frame is one set of samples for each channel (one sample for mono, two samples for stereo).
---@alias TimeUnit
---Seconds.
---| "seconds"
---Frames.
---| "frames"

---When accessing the volume of Sources or the audio listener, this can be done in linear units with a 0 to 1 range, or in decibels with a range of -∞ to 0.
---@alias VolumeUnit
---Linear volume range.
---| "linear"
---Decibels.
---| "db"
