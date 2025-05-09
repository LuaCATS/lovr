---@meta

---The `lovr.data` module provides functions for accessing underlying data representations for several LÖVR objects.
---
---@class lovr.data
lovr.data = {}

---Creates a new Blob.
---
---@param size number The amount of data to allocate for the Blob, in bytes.  All of the bytes will be filled with zeroes.
---@param name? string A name for the Blob (used in error messages)
---@return Blob blob The new Blob.
function lovr.data.newBlob(size, name) end

---Creates a new Blob.
---
---@param contents string A string to use for the Blob's contents.
---@param name? string A name for the Blob (used in error messages)
---@return Blob blob The new Blob.
function lovr.data.newBlob(contents, name) end

---Creates a new Blob.
---
---@param source Blob A Blob to copy the contents from.
---@param name? string A name for the Blob (used in error messages)
---@return Blob blob The new Blob.
function lovr.data.newBlob(source, name) end

---Creates a new Image.  Image data can be loaded and decoded from an image file, or a raw block of pixels with a specified width, height, and format can be created.
---
---#### Notes:
---
---The supported image file formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---DDS and KTX files can contain cubemaps and array textures, in any of the texture formats LÖVR supports.
---
---@param filename string The filename of the image to load.
---@return Image image The new Image.
function lovr.data.newImage(filename) end

---Creates a new Image.  Image data can be loaded and decoded from an image file, or a raw block of pixels with a specified width, height, and format can be created.
---
---#### Notes:
---
---The supported image file formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---DDS and KTX files can contain cubemaps and array textures, in any of the texture formats LÖVR supports.
---
---@param width number The width of the texture.
---@param height number The height of the texture.
---@param format? TextureFormat The format of the texture's pixels.
---@param data? Blob Raw pixel values to use as the contents.  If `nil`, the data will all be zero.
---@return Image image The new Image.
function lovr.data.newImage(width, height, format, data) end

---Creates a new Image.  Image data can be loaded and decoded from an image file, or a raw block of pixels with a specified width, height, and format can be created.
---
---#### Notes:
---
---The supported image file formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---DDS and KTX files can contain cubemaps and array textures, in any of the texture formats LÖVR supports.
---
---@param source Image The Image to clone.
---@return Image image The new Image.
function lovr.data.newImage(source) end

---Creates a new Image.  Image data can be loaded and decoded from an image file, or a raw block of pixels with a specified width, height, and format can be created.
---
---#### Notes:
---
---The supported image file formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---DDS and KTX files can contain cubemaps and array textures, in any of the texture formats LÖVR supports.
---
---@param blob Blob The Blob containing image data to decode.
---@return Image image The new Image.
function lovr.data.newImage(blob) end

---Loads a 3D model from a file.  The supported 3D file formats are OBJ and glTF.
---
---@param filename string The filename of the model to load.
---@return ModelData modelData The new ModelData.
function lovr.data.newModelData(filename) end

---Loads a 3D model from a file.  The supported 3D file formats are OBJ and glTF.
---
---@param blob Blob The Blob containing data for a model to decode.
---@return ModelData modelData The new ModelData.
function lovr.data.newModelData(blob) end

---Creates a new Rasterizer from a TTF or BMFont file.
---
---@param size? number The resolution to render the font at, in pixels (TTF only).  Higher resolutions use more memory and processing power but may provide better quality results for some fonts/situations.
---@return Rasterizer rasterizer The new Rasterizer.
function lovr.data.newRasterizer(size) end

---Creates a new Rasterizer from a TTF or BMFont file.
---
---@param filename string The filename of the font file to load.
---@param size? number The resolution to render the font at, in pixels (TTF only).  Higher resolutions use more memory and processing power but may provide better quality results for some fonts/situations.
---@return Rasterizer rasterizer The new Rasterizer.
function lovr.data.newRasterizer(filename, size) end

---Creates a new Rasterizer from a TTF or BMFont file.
---
---@param blob Blob The Blob containing font data.
---@param size? number The resolution to render the font at, in pixels (TTF only).  Higher resolutions use more memory and processing power but may provide better quality results for some fonts/situations.
---@return Rasterizer rasterizer The new Rasterizer.
function lovr.data.newRasterizer(blob, size) end

---Creates a new Sound.  A sound can be loaded from an audio file, or it can be created empty with capacity for a certain number of audio frames.
---
---When loading audio from a file, use the `decode` option to control whether compressed audio should remain compressed or immediately get decoded to raw samples.
---
---When creating an empty sound, the `contents` parameter can be set to `'stream'` to create an audio stream.  On streams, `Sound:setFrames` will always write to the end of the stream, and `Sound:getFrames` will always read the oldest samples from the beginning.  The number of frames in the sound is the total capacity of the stream's buffer.
---
---#### Notes:
---
---It is highly recommended to use an audio format that matches the format of the audio module: `f32` sample formats at a sample rate of 48000, with 1 channel for spatialized sources or 2 channels for unspatialized sources.  This will avoid the need to convert audio during playback, which boosts performance of the audio thread.
---
---The WAV importer supports 16, 24, and 32 bit integer data and 32 bit floating point data.  The data must be mono, stereo, or 4-channel full-sphere ambisonic.  The `WAVE_FORMAT_EXTENSIBLE` extension is supported.
---
---Ambisonic channel layouts are supported for import (but not yet for playback).  Ambisonic data can be loaded from WAV files.  It must be first-order full-sphere ambisonic data with 4 channels.  If the WAV has a `WAVE_FORMAT_EXTENSIBLE` chunk with an `AMBISONIC_B_FORMAT` format GUID, then the data is understood as using the AMB format with Furse-Malham channel ordering and normalization.  *All other* 4-channel files are assumed to be using the AmbiX format with ACN channel ordering and SN3D normalization.  AMB files will get automatically converted to AmbiX on import, so ambisonic Sounds will always be in a consistent format.
---
---OGG and MP3 files will always have the `f32` format when loaded.
---
---@param frames number The number of frames the Sound can hold.
---@param format? SampleFormat The sample data type.
---@param channels? ChannelLayout The channel layout.
---@param sampleRate? number The sample rate, in Hz.
---@param contents? any A Blob containing raw audio samples to use as the initial contents, 'stream' to create an audio stream, or `nil` to leave the data initialized to zero.
---@return Sound sound Sounds good.
function lovr.data.newSound(frames, format, channels, sampleRate, contents) end

---Creates a new Sound.  A sound can be loaded from an audio file, or it can be created empty with capacity for a certain number of audio frames.
---
---When loading audio from a file, use the `decode` option to control whether compressed audio should remain compressed or immediately get decoded to raw samples.
---
---When creating an empty sound, the `contents` parameter can be set to `'stream'` to create an audio stream.  On streams, `Sound:setFrames` will always write to the end of the stream, and `Sound:getFrames` will always read the oldest samples from the beginning.  The number of frames in the sound is the total capacity of the stream's buffer.
---
---#### Notes:
---
---It is highly recommended to use an audio format that matches the format of the audio module: `f32` sample formats at a sample rate of 48000, with 1 channel for spatialized sources or 2 channels for unspatialized sources.  This will avoid the need to convert audio during playback, which boosts performance of the audio thread.
---
---The WAV importer supports 16, 24, and 32 bit integer data and 32 bit floating point data.  The data must be mono, stereo, or 4-channel full-sphere ambisonic.  The `WAVE_FORMAT_EXTENSIBLE` extension is supported.
---
---Ambisonic channel layouts are supported for import (but not yet for playback).  Ambisonic data can be loaded from WAV files.  It must be first-order full-sphere ambisonic data with 4 channels.  If the WAV has a `WAVE_FORMAT_EXTENSIBLE` chunk with an `AMBISONIC_B_FORMAT` format GUID, then the data is understood as using the AMB format with Furse-Malham channel ordering and normalization.  *All other* 4-channel files are assumed to be using the AmbiX format with ACN channel ordering and SN3D normalization.  AMB files will get automatically converted to AmbiX on import, so ambisonic Sounds will always be in a consistent format.
---
---OGG and MP3 files will always have the `f32` format when loaded.
---
---@param filename string The filename of a sound to load.
---@param decode boolean Whether compressed audio files should be immediately decoded.
---@return Sound sound Sounds good.
function lovr.data.newSound(filename, decode) end

---Creates a new Sound.  A sound can be loaded from an audio file, or it can be created empty with capacity for a certain number of audio frames.
---
---When loading audio from a file, use the `decode` option to control whether compressed audio should remain compressed or immediately get decoded to raw samples.
---
---When creating an empty sound, the `contents` parameter can be set to `'stream'` to create an audio stream.  On streams, `Sound:setFrames` will always write to the end of the stream, and `Sound:getFrames` will always read the oldest samples from the beginning.  The number of frames in the sound is the total capacity of the stream's buffer.
---
---#### Notes:
---
---It is highly recommended to use an audio format that matches the format of the audio module: `f32` sample formats at a sample rate of 48000, with 1 channel for spatialized sources or 2 channels for unspatialized sources.  This will avoid the need to convert audio during playback, which boosts performance of the audio thread.
---
---The WAV importer supports 16, 24, and 32 bit integer data and 32 bit floating point data.  The data must be mono, stereo, or 4-channel full-sphere ambisonic.  The `WAVE_FORMAT_EXTENSIBLE` extension is supported.
---
---Ambisonic channel layouts are supported for import (but not yet for playback).  Ambisonic data can be loaded from WAV files.  It must be first-order full-sphere ambisonic data with 4 channels.  If the WAV has a `WAVE_FORMAT_EXTENSIBLE` chunk with an `AMBISONIC_B_FORMAT` format GUID, then the data is understood as using the AMB format with Furse-Malham channel ordering and normalization.  *All other* 4-channel files are assumed to be using the AmbiX format with ACN channel ordering and SN3D normalization.  AMB files will get automatically converted to AmbiX on import, so ambisonic Sounds will always be in a consistent format.
---
---OGG and MP3 files will always have the `f32` format when loaded.
---
---@param blob Blob The Blob containing audio file data to load.
---@param decode boolean Whether compressed audio files should be immediately decoded.
---@return Sound sound Sounds good.
function lovr.data.newSound(blob, decode) end

---A Blob is an object that holds binary data.  It can be passed to most functions that take filename arguments, like `lovr.graphics.newModel` or `lovr.audio.newSource`.  Blobs aren't usually necessary for simple projects, but they can be really helpful if:
---
---- You need to work with low level binary data, potentially using the LuaJIT FFI for increased
---  performance.
---- You are working with data that isn't stored as a file, such as programmatically generated data
---  or a string from a network request.
---- You want to load data from a file once and then use it to create many different objects.
---
---A Blob's size cannot be changed once it is created.
---@class Blob
local Blob = {}

---Returns the size of the Blob's contents, in bytes.
---
---@return number bytes The size of the Blob, in bytes.
function Blob:getSize() end

---Returns the filename the Blob was loaded from, or the custom name given to it when it was created.  This label is also used in error messages.
---
---@return string name The name of the Blob.
function Blob:getName() end

---Returns a raw pointer to the Blob's data.  This can be used to interface with other C libraries using the LuaJIT FFI.  Use this only if you know what you're doing!
---
---@return userdata pointer A pointer to the data.
function Blob:getPointer() end

---Returns a binary string containing the Blob's data.
---
---#### Notes:
---
---This effectively allocates a new copy of the Blob as a Lua string, so this should be avoided for really big Blobs!
---
---#### Example:
---
---Print each byte of the main.lua file:
---
---```lua
---blob = lovr.filesystem.newBlob('main.lua')
---str = blob:getString()
---
---for i = 1, #str do
---  print(string.byte(str, i))
---end
---```
---
---@param offset? number A byte offset into the Blob where the string will start.
---@param size? number The number of bytes the string will contain.  If nil, the rest of the data in the Blob will be used, based on the `offset` parameter.
---@return string data The Blob's data.
function Blob:getString(offset, size) end

---Returns signed 8-bit integers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of integers to read.
---@return number ... `count` signed 8-bit integers, from -128 to 127.
function Blob:getI8(offset, count) end

---Returns unsigned 8-bit integers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of integers to read.
---@return number ... `count` unsigned 8-bit integers, from 0 to 255.
function Blob:getU8(offset, count) end

---Returns signed 16-bit integers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of integers to read.
---@return number ... `count` signed 16-bit integers, from -32768 to 32767.
function Blob:getI16(offset, count) end

---Returns unsigned 16-bit integers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of integers to read.
---@return number ... `count` unsigned 16-bit integers, from 0 to 65535.
function Blob:getU16(offset, count) end

---Returns signed 32-bit integers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of integers to read.
---@return number ... `count` signed 32-bit integers, from -2147483648 to 2147483647.
function Blob:getI32(offset, count) end

---Returns unsigned 32-bit integers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of integers to read.
---@return number ... `count` unsigned 32-bit integers, from 0 to 4294967296.
function Blob:getU32(offset, count) end

---Returns 32-bit floating point numbers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of floats to read.
---@return number ... `count` 32-bit floats.
function Blob:getF32(offset, count) end

---Returns 64-bit floating point numbers from the data in the Blob.
---
---@param offset? number A non-negative byte offset to read from.
---@param count? number The number of doubles to read.
---@return number ... `count` 64-bit doubles.
function Blob:getF64(offset, count) end

---Writes 8-bit signed integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 8-bit signed integers (each taking up 1 byte, ranging from
----127 to 128).
function Blob:setI8(offset, ...) end

---Writes 8-bit signed integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 8-bit signed integers (each taking up 1 byte, ranging from -127 to 128).
function Blob:setI8(offset, table) end

---Writes 8-bit unsigned integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 8-bit unsigned integers (each taking up 1 byte, ranging from 0 to 255).
function Blob:setU8(offset, ...) end

---Writes 8-bit unsigned integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 8-bit unsigned integers (each taking up 1 byte, ranging from 0 to 255).
function Blob:setU8(offset, table) end

---Writes 16-bit signed integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 16-bit signed integers (each taking up 2 bytes, ranging from
----32768 to 32767).
function Blob:setI16(offset, ...) end

---Writes 16-bit signed integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 16-bit signed integers (each taking up 2 bytes, ranging from -32768 to 32767).
function Blob:setI16(offset, table) end

---Writes 16-bit unsigned integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 16-bit unsigned integers (each taking up 2 bytes, ranging from 0 to 65535).
function Blob:setU16(offset, ...) end

---Writes 16-bit unsigned integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 16-bit unsigned integers (each taking up 2 bytes, ranging from 0 to 65535).
function Blob:setU16(offset, table) end

---Writes 32-bit signed integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 32-bit signed integers (each taking up 4 bytes, ranging from
----2147483648 to 2147483647).
function Blob:setI32(offset, ...) end

---Writes 32-bit signed integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 32-bit signed integers (each taking up 4 bytes, ranging from -2147483648 to 2147483647).
function Blob:setI32(offset, table) end

---Writes 32-bit unsigned integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 32-bit unsigned integers (each taking up 4 bytes, ranging from 0 to 4294967296).
function Blob:setU32(offset, ...) end

---Writes 32-bit unsigned integers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 32-bit unsigned integers (each taking up 4 bytes, ranging from 0 to 4294967296).
function Blob:setU32(offset, table) end

---Writes 32-bit floating point numbers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 32-bit floats (each taking up 4 bytes).
function Blob:setF32(offset, ...) end

---Writes 32-bit floating point numbers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 32-bit floats (each taking up 4 bytes).
function Blob:setF32(offset, table) end

---Writes 64-bit floating point numbers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param ... number Numbers to write to the blob as 64-bit floating point numbers (each taking up 8 bytes).
function Blob:setF64(offset, ...) end

---Writes 64-bit floating point numbers to the Blob.
---
---@param offset number A non-negative byte offset to start writing at.
---@param table number A table of numbers to write to the blob as 64-bit floating point numbers (each taking up 8 bytes).
function Blob:setF64(offset, table) end

---An Image stores raw 2D pixel info for `Texture`s.  It has a width, height, and format.  The Image can be initialized with the contents of an image file or it can be created with uninitialized contents.  The supported image formats are `png`, `jpg`, `hdr`, `dds`, `ktx`, and `astc`.
---
---Usually you can just use Textures, but Image can be useful if you want to manipulate individual pixels, load Textures in a background thread, or use the FFI to efficiently access the raw image data.
---@class Image
local Image = {}

---Encodes the Image to an uncompressed png.  This intended mainly for debugging.
---
---@return Blob blob A new Blob containing the PNG image data.
function Image:encode() end

---Returns a Blob containing the raw bytes of the Image.
---
---@return Blob blob The Blob instance containing the bytes for the `Image`.
function Image:getBlob() end

---Returns the dimensions of the Image, in pixels.
---
---@return number width The width of the Image, in pixels.
---@return number height The height of the Image, in pixels.
function Image:getDimensions() end

---Returns the format of the Image.
---
---@return TextureFormat format The format of the pixels in the Image.
function Image:getFormat() end

---Returns the height of the Image, in pixels.
---
---@return number height The height of the Image, in pixels.
function Image:getHeight() end

---Returns the value of a pixel of the Image.
---
---#### Notes:
---
---The following texture formats are supported: `r8`, `rg8`, `rgba8`, `r16`, `rg16`, `rgba16`, `r32f`, `rg32f`, `rgba32f`.
---
---@param x number The x coordinate of the pixel to get (0-indexed).
---@param y number The y coordinate of the pixel to get (0-indexed).
---@return number r The red component of the pixel, from 0.0 to 1.0.
---@return number g The green component of the pixel, from 0.0 to 1.0.
---@return number b The blue component of the pixel, from 0.0 to 1.0.
---@return number a The alpha component of the pixel, from 0.0 to 1.0.
function Image:getPixel(x, y) end

---Returns a raw pointer to the Image's pixel data.  This can be used to interface with other C libraries or the LuaJIT FFI.
---
---#### Example:
---
---Simple example of writing to Image pixels with LuaJIT's FFI module.
---
---```lua
---local ffi = require 'ffi'
---
---function lovr.load()
---  image = lovr.data.newImage(2, 2)
---
---  ffi.cdef [[
---    typedef struct { uint8_t r, g, b, a; } Pixel;
---  ]]
---
---  pointer = image:getPointer()
---  pixels = ffi.cast('Pixel*', pointer)
---  pixels[0] = { 255, 0, 0, 255 }
---  pixels[1] = { 0, 255, 0, 255 }
---  pixels[2] = { 0, 0, 255, 255 }
---  pixels[3] = { 255, 255, 255, 255 }
---
---  texture = lovr.graphics.newTexture(image)
---end
---
---function lovr.draw(pass)
---  pass:setSampler('nearest')
---  pass:fill(texture)
---end
---```
---
---@param level? number The mipmap level to get the pointer of (for DDS and KTX images).
---@param layer? number The array layer to get the pointer of (for DDS and KTX images).
---@return userdata pointer A pointer to the raw pixel data.
function Image:getPointer(level, layer) end

---Returns the width of the Image, in pixels.
---
---@return number width The width of the Image, in pixels.
function Image:getWidth() end

---Transforms pixels in the Image using a function.
---
---The callback function passed to this function will be called once for each pixel.  For each pixel, the function will be called with its x and y coordinate and the red, green, blue, and alpha components of its color.  Whatever the function returns will be used as the new color for the pixel.
---
---The callback function will potentially be called thousands of times, so it's best to keep the amount of code in there small and fast.
---
---#### Notes:
---
---The following texture formats are supported: `r8`, `rg8`, `rgba8`, `r16`, `rg16`, `rgba16`, `r32f`, `rg32f`, `rgba32f`.
---
---#### Example:
---
---Convert an Image to grayscale.
---
---```lua
---image:mapPixel(function(x, y, r, g, b, a)
---  local brightness = .21 * r + .72 * g + .07 * b
---  return brightness, brightness, brightness, a
---end)
---```
---
---#### Example:
---
---Efficient Image updates using FFI.  Due to the low-level nature, this will be a lot faster, but it's specialized to the `rgba8` image format and risks crashing if used improperly.
---
---```lua
---local ffi = require 'ffi'
---
---function lovr.load()
---  local w, h = 256, 256
---
---  image = lovr.data.newImage(w, h)
---
---  local pointer = ffi.cast('uint8_t*', image:getPointer())
---
---  for y = 0, h - 1 do
---    for x = 0, w - 1 do
---      pointer[(y * w + x) * 4 + 0] = (x / w) * 255
---      pointer[(y * w + x) * 4 + 1] = (y / h) * 255
---      pointer[(y * w + x) * 4 + 2] = 255
---      pointer[(y * w + x) * 4 + 3] = 255
---    end
---  end
---
---  texture = lovr.graphics.newTexture(image)
---end
---
---function lovr.draw(pass)
---  pass:fill(texture)
---end
---```
---
---@param callback function The function that will be called for each pixel.
---@param x? number The x coordinate of the upper-left corner of the area of the Image to affect.
---@param y? number The y coordinate of the upper-left corner of the area of the Image to affect.
---@param w? number The width of the area to affect.
---@param h? number The height of the area to affect.
function Image:mapPixel(callback, x, y, w, h) end

---Copies a rectangle of pixels from one Image to this one.
---
---#### Notes:
---
---The two Images must have the same pixel format.
---
---Compressed images cannot be copied.
---
---The rectangle cannot go outside the dimensions of the source or destination textures.
---
---@param source Image The Image to copy pixels from.
---@param x? number The x coordinate to paste to (0-indexed).
---@param y? number The y coordinate to paste to (0-indexed).
---@param fromX? number The x coordinate in the source to paste from (0-indexed).
---@param fromY? number The y coordinate in the source to paste from (0-indexed).
---@param width? number The width of the region to copy.
---@param height? number The height of the region to copy.
function Image:paste(source, x, y, fromX, fromY, width, height) end

---Sets the value of a single pixel of the Image.
---
---If you need to change a bunch of pixels, consider using `Image:mapPixel`.
---
---#### Notes:
---
---The following texture formats are supported: `r8`, `rg8`, `rgba8`, `r16`, `rg16`, `rgba16`, `r32f`, `rg32f`, `rgba32f`.
---
---@param x number The x coordinate of the pixel to set (0-indexed).
---@param y number The y coordinate of the pixel to set (0-indexed).
---@param r number The red component of the pixel, from 0.0 to 1.0.
---@param g number The green component of the pixel, from 0.0 to 1.0.
---@param b number The blue component of the pixel, from 0.0 to 1.0.
---@param a? number The alpha component of the pixel, from 0.0 to 1.0.
function Image:setPixel(x, y, r, g, b, a) end

---A ModelData is a container object that loads and holds data contained in 3D model files.  This can include a variety of things like the node structure of the asset, the vertex data it contains, contains, the `Image` and `Material` properties, and any included animations.
---
---The current supported formats are OBJ, glTF, and STL.
---
---Usually you can just load a `Model` directly, but using a `ModelData` can be helpful if you want to load models in a thread or access more low-level information about the Model.
---@class ModelData
local ModelData = {}

---Returns the number of channels in an animation.
---
---A channel is a set of keyframes for a single property of a node.
---
---@param index number The index of an animation.
---@return number count The number of channels in the animation.
function ModelData:getAnimationChannelCount(index) end

---Returns the number of channels in an animation.
---
---A channel is a set of keyframes for a single property of a node.
---
---@param name string The name of an animation.
---@return number count The number of channels in the animation.
function ModelData:getAnimationChannelCount(name) end

---Returns the number of animations in the model.
---
---@return number count The number of animations in the model.
function ModelData:getAnimationCount() end

---Returns the duration of an animation.
---
---#### Notes:
---
---The duration of the animation is calculated as the latest timestamp of all of its channels.
---
---@param index number The index of the animation.
---@return number duration The duration of the animation, in seconds.
function ModelData:getAnimationDuration(index) end

---Returns the duration of an animation.
---
---#### Notes:
---
---The duration of the animation is calculated as the latest timestamp of all of its channels.
---
---@param name string The name of the animation.
---@return number duration The duration of the animation, in seconds.
function ModelData:getAnimationDuration(name) end

---Returns a single keyframe in a channel of an animation.
---
---@param index number The index of an animation.
---@param channel number The index of a channel in the animation.
---@param keyframe number The index of a keyframe in the channel.
---@return number time The timestamp of the keyframe.
---@return number ... The data for the keyframe (either 3 or 4 numbers depending on the property).
function ModelData:getAnimationKeyframe(index, channel, keyframe) end

---Returns a single keyframe in a channel of an animation.
---
---@param name string The name of an animation.
---@param channel number The index of a channel in the animation.
---@param keyframe number The index of a keyframe in the channel.
---@return number time The timestamp of the keyframe.
---@return number ... The data for the keyframe (either 3 or 4 numbers depending on the property).
function ModelData:getAnimationKeyframe(name, channel, keyframe) end

---Returns the number of keyframes in a channel of an animation.
---
---@param index number The index of an animation.
---@param channel number The index of a channel in the animation.
---@return number count The number of keyframes in the channel.
function ModelData:getAnimationKeyframeCount(index, channel) end

---Returns the number of keyframes in a channel of an animation.
---
---@param name string The name of an animation.
---@param channel number The index of a channel in the animation.
---@return number count The number of keyframes in the channel.
function ModelData:getAnimationKeyframeCount(name, channel) end

---Returns the name of an animation.
---
---#### Notes:
---
---If the animation does not have a name, this function returns `nil`.
---
---@param index number The index of the animation.
---@return string name The name of the animation.
function ModelData:getAnimationName(index) end

---Returns the index of a node targeted by an animation's channel.
---
---@param index number The index of an animation.
---@param channel number The index of a channel in the animation.
---@return number node The index of the node targeted by the channel.
function ModelData:getAnimationNode(index, channel) end

---Returns the index of a node targeted by an animation's channel.
---
---@param name string The name of an animation.
---@param channel number The index of a channel in the animation.
---@return number node The index of the node targeted by the channel.
function ModelData:getAnimationNode(name, channel) end

---Returns the property targeted by an animation's channel.
---
---@param index number The index of an animation.
---@param channel number The index of a channel in the animation.
---@return AnimationProperty property The property (translation, rotation, scale, weights) affected by the keyframes.
function ModelData:getAnimationProperty(index, channel) end

---Returns the property targeted by an animation's channel.
---
---@param name string The name of an animation.
---@param channel number The index of a channel in the animation.
---@return AnimationProperty property The property (translation, rotation, scale, weights) affected by the keyframes.
function ModelData:getAnimationProperty(name, channel) end

---Returns the smooth mode of a channel in an animation.
---
---@param index number The index of an animation.
---@param channel number The index of a channel in the animation.
---@return SmoothMode smooth The smooth mode of the keyframes.
function ModelData:getAnimationSmoothMode(index, channel) end

---Returns the smooth mode of a channel in an animation.
---
---@param name string The name of an animation.
---@param channel number The index of a channel in the animation.
---@return SmoothMode smooth The smooth mode of the keyframes.
function ModelData:getAnimationSmoothMode(name, channel) end

---Returns the number of blend shapes in the model.
---
---@return number count The number of blend shapes in the model.
function ModelData:getBlendShapeCount() end

---Returns the name of a blend shape in the model.
---
---#### Notes:
---
---This function will throw an error if the blend shape index is invalid.
---
---@param index number The index of a blend shape.
---@return string name The name of the blend shape.
function ModelData:getBlendShapeName(index) end

---Returns one of the Blobs in the model, by index.
---
---@param index number The index of the Blob to get.
---@return Blob blob The Blob object.
function ModelData:getBlob(index) end

---Returns the number of Blobs in the model.
---
---@return number count The number of Blobs in the model.
function ModelData:getBlobCount() end

---Returns the 6 values of the model's axis-aligned bounding box.
---
---@return number minx The minimum x coordinate of the vertices in the model.
---@return number maxx The maximum x coordinate of the vertices in the model.
---@return number miny The minimum y coordinate of the vertices in the model.
---@return number maxy The maximum y coordinate of the vertices in the model.
---@return number minz The minimum z coordinate of the vertices in the model.
---@return number maxz The maximum z coordinate of the vertices in the model.
function ModelData:getBoundingBox() end

---Returns a sphere approximately enclosing the vertices in the model.
---
---@return number x The x coordinate of the position of the sphere.
---@return number y The y coordinate of the position of the sphere.
---@return number z The z coordinate of the position of the sphere.
---@return number radius The radius of the bounding sphere.
function ModelData:getBoundingSphere() end

---Returns the center of the model's axis-aligned bounding box, relative to the model's origin.
---
---@return number x The x offset of the center of the bounding box.
---@return number y The y offset of the center of the bounding box.
---@return number z The z offset of the center of the bounding box.
function ModelData:getCenter() end

---Returns the depth of the model, computed from its axis-aligned bounding box.
---
---@return number depth The depth of the model.
function ModelData:getDepth() end

---Returns the width, height, and depth of the model, computed from its axis-aligned bounding box.
---
---@return number width The width of the model.
---@return number height The height of the model.
---@return number depth The depth of the model.
function ModelData:getDimensions() end

---Returns the height of the model, computed from its axis-aligned bounding box.
---
---@return number height The height of the model.
function ModelData:getHeight() end

---Returns one of the Images in the model, by index.
---
---@param index number The index of the Image to get.
---@return Image image The Image object.
function ModelData:getImage(index) end

---Returns the number of Images in the model.
---
---@return number count The number of Images in the model.
function ModelData:getImageCount() end

---Returns a table with all of the properties of a material.
---
---#### Notes:
---
---All images are optional and may be `nil`.
---
---@param index number The index of a material.
---@return table properties The material properties.
function ModelData:getMaterial(index) end

---Returns a table with all of the properties of a material.
---
---#### Notes:
---
---All images are optional and may be `nil`.
---
---@param name string The name of a material.
---@return table properties The material properties.
function ModelData:getMaterial(name) end

---Returns the number of materials in the model.
---
---@return number count The number of materials in the model.
function ModelData:getMaterialCount() end

---Returns the name of a material in the model.
---
---@param index number The index of a material.
---@return string name The name of the material, or nil if the material does not have a name.
function ModelData:getMaterialName(index) end

---Returns the number of meshes in the model.
---
---@return number count The number of meshes in the model.
function ModelData:getMeshCount() end

---Returns the draw mode of a mesh.  This controls how its vertices are connected together (points, lines, or triangles).
---
---@param mesh number The index of a mesh.
---@return ModelDrawMode mode The draw mode of the mesh.
function ModelData:getMeshDrawMode(mesh) end

---Returns one of the vertex indices in a mesh.  If a mesh has vertex indices, they define the order and connectivity of the vertices in the mesh, allowing a vertex to be reused multiple times without duplicating its data.
---
---@param mesh number The index of a mesh to get the vertex from.
---@param index number The index of a vertex index in the mesh to retrieve.
---@return number vertexindex The vertex index.  Like all indices in Lua, this is 1-indexed.
function ModelData:getMeshIndex(mesh, index) end

---Returns the number of vertex indices in a mesh.  Vertex indices allow for vertices to be reused when defining triangles.
---
---#### Notes:
---
---This may return zero if the mesh does not use indices.
---
---@param mesh number The index of a mesh.
---@return number count The number of vertex indices in the mesh.
function ModelData:getMeshIndexCount(mesh) end

---Returns the data format of vertex indices in a mesh.  If a mesh doesn't use vertex indices, this function returns nil.
---
---@param mesh number The index of a mesh.
---@return AttributeType type The data type of each vertex index (always u16 or u32).
---@return number blob The index of a Blob in the mesh where the binary data is stored.
---@return number offset A byte offset into the Blob's data where the index data starts.
---@return number stride The number of bytes between subsequent vertex indices.  Indices are always tightly packed, so this will always be 2 or 4 depending on the data type.
function ModelData:getMeshIndexFormat(mesh) end

---Returns the index of the material applied to a mesh.
---
---@param mesh number The index of a mesh.
---@return number material The index of the material applied to the mesh, or nil if the mesh does not have a material.
function ModelData:getMeshMaterial(mesh) end

---Returns the data for a single vertex in a mesh.  The data returned depends on the vertex format of a mesh, which is given by `ModelData:getMeshVertexFormat`.
---
---@param mesh number The index of a mesh to get the vertex from.
---@param vertex number The index of a vertex in the mesh to retrieve.
---@return number ... The data for all of the attributes of the vertex.
function ModelData:getMeshVertex(mesh, vertex) end

---Returns the number of vertices in a mesh.
---
---@param mesh number The index of a mesh.
---@return number count The number of vertices in the mesh.
function ModelData:getMeshVertexCount(mesh) end

---Returns the vertex format of a mesh.  The vertex format defines the properties associated with each vertex (position, color, etc.), including their types and binary data layout.
---
---#### Notes:
---
---The format is given as a table of vertex attributes.  Each attribute is a table containing the following:
---
---    { name, type, components, blob, offset, stride }
---
---- The `name` will be a `DefaultAttribute`.
---- The `type` will be an `AttributeType`.
---- The `component` count will be 1-4.
---- The `blob` is an index of one of the Blobs in the model (see `ModelData:getBlob`).
---- The `offset` is a byte offset from the start of the Blob where the attribute's data starts.
---- The `stride` is the number of bytes between consecutive values.
---
---@param mesh number The index of a mesh.
---@return table format The vertex format of the mesh.
function ModelData:getMeshVertexFormat(mesh) end

---Returns extra information stored in the model file.  Currently this is only implemented for glTF models and returns the JSON string from the glTF or glb file.  The metadata can be used to get application-specific data or add support for glTF extensions not supported by LÖVR.
---
---@return string metadata The metadata from the model file.
function ModelData:getMetadata() end

---Given a parent node, this function returns a table with the indices of its children.
---
---#### Notes:
---
---If the node does not have any children, this function returns an empty table.
---
---@param index number The index of the parent node.
---@return table children A table containing a node index for each child of the node.
function ModelData:getNodeChildren(index) end

---Given a parent node, this function returns a table with the indices of its children.
---
---#### Notes:
---
---If the node does not have any children, this function returns an empty table.
---
---@param name string The name of the parent node.
---@return table children A table containing a node index for each child of the node.
function ModelData:getNodeChildren(name) end

---Returns the number of nodes in the model.
---
---@return number count The number of nodes in the model.
function ModelData:getNodeCount() end

---Returns a table of mesh indices attached to a node.  Meshes define the geometry and materials of a model, as opposed to the nodes which define the transforms and hierarchy.  A node can have multiple meshes, and meshes can be reused in multiple nodes.
---
---@param index number The index of the node.
---@return table meshes A table with the node's mesh indices.
function ModelData:getNodeMeshes(index) end

---Returns a table of mesh indices attached to a node.  Meshes define the geometry and materials of a model, as opposed to the nodes which define the transforms and hierarchy.  A node can have multiple meshes, and meshes can be reused in multiple nodes.
---
---@param name string The name of the node.
---@return table meshes A table with the node's mesh indices.
function ModelData:getNodeMeshes(name) end

---Returns the name of a node.
---
---#### Notes:
---
---If the node does not have a name, this function returns `nil`.
---
---@param index number The index of the node.
---@return string name The name of the node.
function ModelData:getNodeName(index) end

---Returns local orientation of a node, relative to its parent.
---
---@param index number The index of the node.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function ModelData:getNodeOrientation(index) end

---Returns local orientation of a node, relative to its parent.
---
---@param name string The name of the node.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function ModelData:getNodeOrientation(name) end

---Given a child node, this function returns the index of its parent.
---
---@param index number The index of the child node.
---@return number parent The index of the parent.
function ModelData:getNodeParent(index) end

---Given a child node, this function returns the index of its parent.
---
---@param name string The name of the child node.
---@return number parent The index of the parent.
function ModelData:getNodeParent(name) end

---Returns local pose (position and orientation) of a node, relative to its parent.
---
---@param index number The index of the node.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function ModelData:getNodePose(index) end

---Returns local pose (position and orientation) of a node, relative to its parent.
---
---@param name string The name of the node.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function ModelData:getNodePose(name) end

---Returns local position of a node, relative to its parent.
---
---@param index number The index of the node.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
function ModelData:getNodePosition(index) end

---Returns local position of a node, relative to its parent.
---
---@param name string The name of the node.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
function ModelData:getNodePosition(name) end

---Returns local scale of a node, relative to its parent.
---
---@param index number The index of the node.
---@return number sx The x scale.
---@return number sy The y scale.
---@return number sz The z scale.
function ModelData:getNodeScale(index) end

---Returns local scale of a node, relative to its parent.
---
---@param name string The name of the node.
---@return number sx The x scale.
---@return number sy The y scale.
---@return number sz The z scale.
function ModelData:getNodeScale(name) end

---Returns the index of the skin used by a node.  Skins are collections of joints used for skeletal animation.  A model can have multiple skins, and each node can use at most one skin to drive the animation of its meshes.
---
---@param index number The index of the node.
---@return number skin The index of the node's skin, or nil if the node isn't skeletally animated.
function ModelData:getNodeSkin(index) end

---Returns the index of the skin used by a node.  Skins are collections of joints used for skeletal animation.  A model can have multiple skins, and each node can use at most one skin to drive the animation of its meshes.
---
---@param name string The name of the node.
---@return number skin The index of the node's skin, or nil if the node isn't skeletally animated.
function ModelData:getNodeSkin(name) end

---Returns local transform (position, orientation, and scale) of a node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 components of the scale the same.
---
---@param index number The index of the node.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
---@return number sx The x scale.
---@return number sy The y scale.
---@return number sz The z scale.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function ModelData:getNodeTransform(index) end

---Returns local transform (position, orientation, and scale) of a node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 components of the scale the same.
---
---@param name string The name of the node.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
---@return number sx The x scale.
---@return number sy The y scale.
---@return number sz The z scale.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function ModelData:getNodeTransform(name) end

---Returns the index of the model's root node.
---
---@return number root The index of the root node.
function ModelData:getRootNode() end

---Returns the number of skins in the model.  A skin is a collection of joints targeted by an animation.
---
---#### Notes:
---
---There is currently a maximum of 256 skins.
---
---@return number count The number of skins in the model.
function ModelData:getSkinCount() end

---Returns the inverse bind matrix for a joint in the skin.
---
---@param skin number The index of a skin.
---@param joint number The index of a joint in the skin.
---@return number ... The 16 components of the 4x4 inverse bind matrix, in column-major order.
function ModelData:getSkinInverseBindMatrix(skin, joint) end

---Returns a table with the node indices of the joints in a skin.
---
---@param skin number The index of a skin.
---@return table joints The joints in the skin.
function ModelData:getSkinJoints(skin) end

---Returns the total number of triangles in the model.  This count includes meshes that are attached to multiple nodes, and the count corresponds to the triangles returned by `ModelData:getTriangles`.
---
---@return number count The total number of triangles in the model.
function ModelData:getTriangleCount() end

---Returns the data for all triangles in the model.  There are a few differences between this and the mesh-specific functions like `ModelData:getMeshVertex` and `ModelData:getMeshIndex`:
---
---- Only vertex positions are returned, not other vertex attributes.
---- Positions are relative to the origin of the whole model, instead of local to a node.
---- If a mesh is attached to more than one node, its vertices will be in the table multiple times.
---- Vertex indices will be relative to the whole triangle list instead of a mesh.
---
---#### Notes:
---
---After this function is called on a ModelData once, the result is cached.
---
---@return table vertices The triangle vertex positions, returned as a flat (non-nested) table of numbers.  The position of each vertex is given as an x, y, and z coordinate.
---@return table indices A list of numbers representing how to connect the vertices into triangles.  Each number is a 1-based index into the `vertices` table, and every 3 indices form a triangle.
function ModelData:getTriangles() end

---Returns the total vertex count of a model.  This count includes meshes that are attached to multiple nodes, and the count corresponds to the vertices returned by `ModelData:getTriangles`.
---
---@return number count The total number of vertices in the model.
function ModelData:getVertexCount() end

---Returns the width of the model, computed from its axis-aligned bounding box.
---
---@return number width The width of the model.
function ModelData:getWidth() end

---A Rasterizer is an object that parses a TTF file, decoding and rendering glyphs from it.
---
---Usually you can just use `Font` objects.
---@class Rasterizer
local Rasterizer = {}

---Returns the advance metric for a glyph, in pixels.  The advance is the horizontal distance to advance the cursor after rendering the glyph.
---
---@param character string A character.
---@return number advance The advance of the glyph, in pixels.
function Rasterizer:getAdvance(character) end

---Returns the advance metric for a glyph, in pixels.  The advance is the horizontal distance to advance the cursor after rendering the glyph.
---
---@param codepoint number A codepoint.
---@return number advance The advance of the glyph, in pixels.
function Rasterizer:getAdvance(codepoint) end

---Returns the ascent metric of the font, in pixels.  The ascent represents how far any glyph of the font ascends above the baseline.
---
---@return number ascent The ascent of the font, in pixels.
function Rasterizer:getAscent() end

---Returns the bearing metric for a glyph, in pixels.  The bearing is the horizontal distance from the cursor to the edge of the glyph.
---
---@param character string A character.
---@return number bearing The bearing of the glyph, in pixels.
function Rasterizer:getBearing(character) end

---Returns the bearing metric for a glyph, in pixels.  The bearing is the horizontal distance from the cursor to the edge of the glyph.
---
---@param codepoint number A codepoint.
---@return number bearing The bearing of the glyph, in pixels.
function Rasterizer:getBearing(codepoint) end

---Returns the bounding box of a glyph, or the bounding box surrounding all glyphs.  Note that font coordinates use a cartesian "y up" coordinate system.
---
---@param character string A character.
---@return number x1 The left edge of the bounding box, in pixels.
---@return number y1 The bottom edge of the bounding box, in pixels.
---@return number x2 The right edge of the bounding box, in pixels.
---@return number y2 The top edge of the bounding box, in pixels.
function Rasterizer:getBoundingBox(character) end

---Returns the bounding box of a glyph, or the bounding box surrounding all glyphs.  Note that font coordinates use a cartesian "y up" coordinate system.
---
---@param codepoint number A codepoint.
---@return number x1 The left edge of the bounding box, in pixels.
---@return number y1 The bottom edge of the bounding box, in pixels.
---@return number x2 The right edge of the bounding box, in pixels.
---@return number y2 The top edge of the bounding box, in pixels.
function Rasterizer:getBoundingBox(codepoint) end

---Returns the bounding box of a glyph, or the bounding box surrounding all glyphs.  Note that font coordinates use a cartesian "y up" coordinate system.
---
---@return number x1 The left edge of the bounding box, in pixels.
---@return number y1 The bottom edge of the bounding box, in pixels.
---@return number x2 The right edge of the bounding box, in pixels.
---@return number y2 The top edge of the bounding box, in pixels.
function Rasterizer:getBoundingBox() end

---Returns the bezier curve control points defining the shape of a glyph.
---
---@param character string A character.
---@param three boolean Whether the control points should be 3D or 2D.
---@return table curves A table of curves.  Each curve is a table of numbers representing the control points (2 for a line, 3 for a quadratic curve, etc.).
function Rasterizer:getCurves(character, three) end

---Returns the bezier curve control points defining the shape of a glyph.
---
---@param codepoint number A codepoint.
---@param three boolean Whether the control points should be 3D or 2D.
---@return table curves A table of curves.  Each curve is a table of numbers representing the control points (2 for a line, 3 for a quadratic curve, etc.).
function Rasterizer:getCurves(codepoint, three) end

---Returns the descent metric of the font, in pixels.  The descent represents how far any glyph of the font descends below the baseline.
---
---@return number descent The descent of the font, in pixels.
function Rasterizer:getDescent() end

---Returns the dimensions of a glyph, or the dimensions of any glyph.
---
---@param character string A character.
---@return number width The width, in pixels.
---@return number height The height, in pixels.
function Rasterizer:getDimensions(character) end

---Returns the dimensions of a glyph, or the dimensions of any glyph.
---
---@param codepoint number A codepoint.
---@return number width The width, in pixels.
---@return number height The height, in pixels.
function Rasterizer:getDimensions(codepoint) end

---Returns the dimensions of a glyph, or the dimensions of any glyph.
---
---@return number width The width, in pixels.
---@return number height The height, in pixels.
function Rasterizer:getDimensions() end

---Returns the size of the font, in pixels.  This is the size the rasterizer was created with, and defines the size of images it rasterizes.
---
---@return number size The font size, in pixels.
function Rasterizer:getFontSize() end

---Returns the number of glyphs stored in the font file.
---
---@return number count The number of glyphs stored in the font file.
function Rasterizer:getGlyphCount() end

---Returns the height of a glyph, or the maximum height of any glyph.
---
---@param character string A character.
---@return number height The height, in pixels.
function Rasterizer:getHeight(character) end

---Returns the height of a glyph, or the maximum height of any glyph.
---
---@param codepoint number A codepoint.
---@return number height The height, in pixels.
function Rasterizer:getHeight(codepoint) end

---Returns the height of a glyph, or the maximum height of any glyph.
---
---@return number height The height, in pixels.
function Rasterizer:getHeight() end

---Returns the kerning between 2 glyphs, in pixels.  Kerning is a slight horizontal adjustment between 2 glyphs to improve the visual appearance.  It will often be negative.
---
---@param first string The first character.
---@param second string The second character.
---@return number keming The kerning between the two glyphs.
function Rasterizer:getKerning(first, second) end

---Returns the kerning between 2 glyphs, in pixels.  Kerning is a slight horizontal adjustment between 2 glyphs to improve the visual appearance.  It will often be negative.
---
---@param firstCodepoint number The first codepoint.
---@param second string The second character.
---@return number keming The kerning between the two glyphs.
function Rasterizer:getKerning(firstCodepoint, second) end

---Returns the kerning between 2 glyphs, in pixels.  Kerning is a slight horizontal adjustment between 2 glyphs to improve the visual appearance.  It will often be negative.
---
---@param first string The first character.
---@param secondCodepoint number The second codepoint.
---@return number keming The kerning between the two glyphs.
function Rasterizer:getKerning(first, secondCodepoint) end

---Returns the kerning between 2 glyphs, in pixels.  Kerning is a slight horizontal adjustment between 2 glyphs to improve the visual appearance.  It will often be negative.
---
---@param firstCodepoint number The first codepoint.
---@param secondCodepoint number The second codepoint.
---@return number keming The kerning between the two glyphs.
function Rasterizer:getKerning(firstCodepoint, secondCodepoint) end

---Returns the leading metric of the font, in pixels.  This is the full amount of space between lines.
---
---@return number leading The font leading, in pixels.
function Rasterizer:getLeading() end

---Returns the width of a glyph, or the maximum width of any glyph.
---
---@param character string A character.
---@return number width The width, in pixels.
function Rasterizer:getWidth(character) end

---Returns the width of a glyph, or the maximum width of any glyph.
---
---@param codepoint number A codepoint.
---@return number width The width, in pixels.
function Rasterizer:getWidth(codepoint) end

---Returns the width of a glyph, or the maximum width of any glyph.
---
---@return number width The width, in pixels.
function Rasterizer:getWidth() end

---Returns whether the Rasterizer can rasterize a set of glyphs.
---
---@param ... any Strings (sets of characters) or numbers (character codes) to check for.
---@return boolean hasGlyphs true if the Rasterizer can rasterize all of the supplied characters, false otherwise.
function Rasterizer:hasGlyphs(...) end

---Returns an `Image` containing a rasterized glyph.
---
---@param character string A character.
---@param spread? number The width of the distance field, for signed distance field rasterization.
---@param padding? number The number of pixels of padding to add at the edges of the image.
---@return Image image The glyph image.  It will be in the `rgba32f` format.
function Rasterizer:newImage(character, spread, padding) end

---Returns an `Image` containing a rasterized glyph.
---
---@param codepoint number A codepoint.
---@param spread? number The width of the distance field, for signed distance field rasterization.
---@param padding? number The number of pixels of padding to add at the edges of the image.
---@return Image image The glyph image.  It will be in the `rgba32f` format.
function Rasterizer:newImage(codepoint, spread, padding) end

---A Sound stores the data for a sound.  The supported sound formats are OGG, WAV, and MP3.  Sounds cannot be played directly.  Instead, there are `Source` objects in `lovr.audio` that are used for audio playback.  All Source objects are backed by one of these Sounds, and multiple Sources can share a single Sound to reduce memory usage.
---
---Metadata
------
---
---Sounds hold a fixed number of frames.  Each frame contains one audio sample for each channel. The `SampleFormat` of the Sound is the data type used for each sample (floating point, integer, etc.).  The Sound has a `ChannelLayout`, representing the number of audio channels and how they map to speakers (mono, stereo, etc.).  The sample rate of the Sound indicates how many frames should be played per second.  The duration of the sound (in seconds) is the number of frames divided by the sample rate.
---
---Compression
------
---
---Sounds can be compressed.  Compressed sounds are stored compressed in memory and are decoded as they are played.  This uses a lot less memory but increases CPU usage during playback.  OGG and MP3 are compressed audio formats.  When creating a sound from a compressed format, there is an option to immediately decode it, storing it uncompressed in memory.  It can be a good idea to decode short sound effects, since they won't use very much memory even when uncompressed and it will improve CPU usage.  Compressed sounds can not be written to using `Sound:setFrames`.
---
---Streams
------
---
---Sounds can be created as a stream by passing `'stream'` as their contents when creating them. Audio frames can be written to the end of the stream, and read from the beginning.  This works well for situations where data is being generated in real time or streamed in from some other data source.
---
---Sources can be backed by a stream and they'll just play whatever audio is pushed to the stream. The audio module also lets you use a stream as a "sink" for an audio device.  For playback devices, this works like loopback, so the mixed audio from all playing Sources will get written to the stream.  For capture devices, all the microphone input will get written to the stream. Conversion between sample formats, channel layouts, and sample rates will happen automatically.
---
---Keep in mind that streams can still only hold a fixed number of frames.  If too much data is written before it is read, older frames will start to get overwritten.  Similary, it's possible to read too much data without writing fast enough.
---
---Ambisonics
------
---
---Ambisonic sounds can be imported from WAVs, but can not yet be played.  Sounds with a `ChannelLayout` of `ambisonic` are stored as first-order full-sphere ambisonics using the AmbiX format (ACN channel ordering and SN3D channel normalization).  The AMB format is supported for import and will automatically get converted to AmbiX.  See `lovr.data.newSound` for more info.
---@class Sound
local Sound = {}

---Returns a Blob containing the raw bytes of the Sound.
---
---#### Notes:
---
---Samples for each channel are stored interleaved.  The data type of each sample is given by `Sound:getFormat`.
---
---@return Blob blob The Blob instance containing the bytes for the `Sound`.
function Sound:getBlob() end

---Returns the byte stride of the Sound.  This is the size of each frame, in bytes.  For example, a stereo sound with a 32-bit floating point format would have a stride of 8 (4 bytes per sample, and 2 samples per frame).
---
---@return number stride The size of a frame, in bytes.
function Sound:getByteStride() end

---Returns the number of frames that can be written to the Sound.  For stream sounds, this is the number of frames that can be written without overwriting existing data.  For normal sounds, this returns the same value as `Sound:getFrameCount`.
---
---@return number capacity The number of frames that can be written to the Sound.
function Sound:getCapacity() end

---Returns the number of channels in the Sound.  Mono sounds have 1 channel, stereo sounds have 2 channels, and ambisonic sounds have 4 channels.
---
---@return number channels The number of channels in the sound.
function Sound:getChannelCount() end

---Returns the channel layout of the Sound.
---
---@return ChannelLayout channels The channel layout.
function Sound:getChannelLayout() end

---Returns the duration of the Sound, in seconds.
---
---#### Notes:
---
---This can be computed as `(frameCount / sampleRate)`.
---
---@return number duration The duration of the Sound, in seconds.
function Sound:getDuration() end

---Returns the sample format of the Sound.
---
---@return SampleFormat format The data type of each sample.
function Sound:getFormat() end

---Returns the number of frames in the Sound.  A frame stores one sample for each channel.
---
---#### Notes:
---
---For streams, this returns the number of frames in the stream's buffer.
---
---@return number frames The number of frames in the Sound.
function Sound:getFrameCount() end

---Reads frames from the Sound into a table, Blob, or another Sound.
---
---@param count? number The number of frames to read.  If nil, reads as many frames as possible.
---
---Compressed sounds will automatically be decoded.
---
---Reading from a stream will ignore the source offset and read the oldest frames.
---@param srcOffset? number A frame offset to apply to the sound when reading frames.
---@return table t A table containing audio frames.
---@return number count The number of frames read.
function Sound:getFrames(count, srcOffset) end

---Reads frames from the Sound into a table, Blob, or another Sound.
---
---@param t table An existing table to read frames into.
---@param count? number The number of frames to read.  If nil, reads as many frames as possible.
---
---Compressed sounds will automatically be decoded.
---
---Reading from a stream will ignore the source offset and read the oldest frames.
---@param srcOffset? number A frame offset to apply to the sound when reading frames.
---@param dstOffset? number An offset to apply to the destination when writing frames (indices for tables, bytes for Blobs, frames for Sounds).
---@return table t A table containing audio frames.
---@return number count The number of frames read.
function Sound:getFrames(t, count, srcOffset, dstOffset) end

---Reads frames from the Sound into a table, Blob, or another Sound.
---
---@param blob Blob A Blob to read frames into.
---@param count? number The number of frames to read.  If nil, reads as many frames as possible.
---
---Compressed sounds will automatically be decoded.
---
---Reading from a stream will ignore the source offset and read the oldest frames.
---@param srcOffset? number A frame offset to apply to the sound when reading frames.
---@param dstOffset? number An offset to apply to the destination when writing frames (indices for tables, bytes for Blobs, frames for Sounds).
---@return number count The number of frames read.
function Sound:getFrames(blob, count, srcOffset, dstOffset) end

---Reads frames from the Sound into a table, Blob, or another Sound.
---
---@param sound Sound Another Sound to copy frames into.
---@param count? number The number of frames to read.  If nil, reads as many frames as possible.
---
---Compressed sounds will automatically be decoded.
---
---Reading from a stream will ignore the source offset and read the oldest frames.
---@param srcOffset? number A frame offset to apply to the sound when reading frames.
---@param dstOffset? number An offset to apply to the destination when writing frames (indices for tables, bytes for Blobs, frames for Sounds).
---@return number count The number of frames read.
function Sound:getFrames(sound, count, srcOffset, dstOffset) end

---Returns the total number of samples in the Sound.
---
---#### Notes:
---
---For streams, this returns the number of samples in the stream's buffer.
---
---@return number samples The total number of samples in the Sound.
function Sound:getSampleCount() end

---Returns the sample rate of the Sound, in Hz.  This is the number of frames that are played every second.  It's usually a high number like 48000.
---
---@return number frequency The number of frames per second in the Sound.
function Sound:getSampleRate() end

---Returns whether the Sound is compressed.  Compressed sounds are loaded from compressed audio formats like MP3 and OGG.  They use a lot less memory but require some extra CPU work during playback.  Compressed sounds can not be modified using `Sound:setFrames`.
---
---@return boolean compressed Whether the Sound is compressed.
function Sound:isCompressed() end

---Returns whether the Sound is a stream.
---
---@return boolean stream Whether the Sound is a stream.
function Sound:isStream() end

---Writes frames to the Sound.
---
---#### Example:
---
---Generate a sine wave.
---
---```lua
---function lovr.load()
---  local length = 1
---  local rate = 48000
---  local frames = length * rate
---  local frequency = 440
---  local volume = 1.0
---
---  sound = lovr.data.newSound(frames, 'f32', 'stereo', rate)
---
---  local data = {}
---  for i = 1, frames do
---    local amplitude = math.sin((i - 1) * frequency / rate * (2 * math.pi)) * volume
---    data[2 * i - 1] = amplitude
---    data[2 * i - 0] = amplitude
---  end
---
---  sound:setFrames(data)
---
---  source = lovr.audio.newSource(sound)
---  source:setLooping(true)
---  source:play()
---end
---```
---
---@param t table A table containing frames to write.
---@param count? number How many frames to write.  If nil, writes as many as possible.
---@param dstOffset? number A frame offset to apply when writing the frames.
---@param srcOffset? number A frame, byte, or index offset to apply when reading frames from the source.
---@return number count The number of frames written.
function Sound:setFrames(t, count, dstOffset, srcOffset) end

---Writes frames to the Sound.
---
---#### Example:
---
---Generate a sine wave.
---
---```lua
---function lovr.load()
---  local length = 1
---  local rate = 48000
---  local frames = length * rate
---  local frequency = 440
---  local volume = 1.0
---
---  sound = lovr.data.newSound(frames, 'f32', 'stereo', rate)
---
---  local data = {}
---  for i = 1, frames do
---    local amplitude = math.sin((i - 1) * frequency / rate * (2 * math.pi)) * volume
---    data[2 * i - 1] = amplitude
---    data[2 * i - 0] = amplitude
---  end
---
---  sound:setFrames(data)
---
---  source = lovr.audio.newSource(sound)
---  source:setLooping(true)
---  source:play()
---end
---```
---
---@param blob Blob A Blob containing frames to write.
---@param count? number How many frames to write.  If nil, writes as many as possible.
---@param dstOffset? number A frame offset to apply when writing the frames.
---@param srcOffset? number A frame, byte, or index offset to apply when reading frames from the source.
---@return number count The number of frames written.
function Sound:setFrames(blob, count, dstOffset, srcOffset) end

---Writes frames to the Sound.
---
---#### Example:
---
---Generate a sine wave.
---
---```lua
---function lovr.load()
---  local length = 1
---  local rate = 48000
---  local frames = length * rate
---  local frequency = 440
---  local volume = 1.0
---
---  sound = lovr.data.newSound(frames, 'f32', 'stereo', rate)
---
---  local data = {}
---  for i = 1, frames do
---    local amplitude = math.sin((i - 1) * frequency / rate * (2 * math.pi)) * volume
---    data[2 * i - 1] = amplitude
---    data[2 * i - 0] = amplitude
---  end
---
---  sound:setFrames(data)
---
---  source = lovr.audio.newSource(sound)
---  source:setLooping(true)
---  source:play()
---end
---```
---
---@param sound Sound Another Sound to copy frames from.
---@param count? number How many frames to write.  If nil, writes as many as possible.
---@param dstOffset? number A frame offset to apply when writing the frames.
---@param srcOffset? number A frame, byte, or index offset to apply when reading frames from the source.
---@return number count The number of frames written.
function Sound:setFrames(sound, count, dstOffset, srcOffset) end

---This indicates the different node properties that can be animated.
---@alias AnimationProperty
---Node translation.
---| "translation"
---Node rotation.
---| "rotation"
---Node scale.
---| "scale"
---Node blend shape weights.
---| "weights"

---These are the data types that can be used by vertex data in meshes.
---@alias AttributeType
---Signed 8 bit integers (-128 to 127).
---| "i8"
---Unsigned 8 bit integers (0 to 255).
---| "u8"
---Signed 16 bit integers (-32768 to 32767).
---| "i16"
---Unsigned 16 bit integers (0 to 65535).
---| "u16"
---Signed 32 bit integers (-2147483648 to 2147483647).
---| "i32"
---Unsigned 32 bit integers (0 to 429467295).
---| "u32"
---Floating point numbers.
---| "f32"

---Sounds can have different numbers of channels, and those channels can map to various speaker layouts.
---@alias ChannelLayout
---1 channel.
---| "mono"
---2 channels.  The first channel is for the left speaker and the second is for the right.
---| "stereo"
---4 channels.  Ambisonic channels don't map directly to speakers but instead represent directions in 3D space, sort of like the images of a skybox.  Currently, ambisonic sounds can only be loaded, not played.
---| "ambisonic"

---These are the different types of attributes that may be present in meshes loaded from models.
---@alias DefaultAttribute
---Vertex positions.
---| "position"
---Vertex normal vectors.
---| "normal"
---Vertex texture coordinates.
---| "uv"
---Vertex colors.
---| "color"
---Vertex tangent vectors.
---| "tangent"
---Vertex joint indices.
---| "joints"
---Vertex joint weights.
---| "weights"

---The DrawMode of a mesh determines how its vertices are connected together.
---@alias ModelDrawMode
---Each vertex is draw as a single point.
---| "points"
---Every pair of vertices is drawn as a line.
---| "lines"
---Draws a single line through all of the vertices.
---| "linestrip"
---Draws a single line through all of the vertices, then connects back to the first vertex.
---| "lineloop"
---Vertices are rendered as triangles.  After the first 3 vertices, each subsequent vertex connects to the previous two.
---| "strip"
---Every 3 vertices forms a triangle.
---| "triangles"
---Vertices are rendered as triangles.  After the first 3 vertices, each subsequent vertex is connected to the previous vertex and the first vertex.
---| "fan"

---Sounds can store audio samples as 16 bit integers or 32 bit floats.
---@alias SampleFormat
---32 bit floating point samples (between -1.0 and 1.0).
---| "f32"
---16 bit integer samples (between -32768 and 32767).
---| "i16"

---Different ways to interpolate between animation keyframes.
---@alias SmoothMode
---The animated property will snap to the nearest keyframe.
---| "step"
---The animated property will linearly interpolate between keyframes.
---| "linear"
---The animated property will follow a smooth curve between nearby keyframes.
---| "cubic"

---Different data layouts for pixels in `Image` and `Texture` objects.
---
---Formats starting with `d` are depth formats, used for depth/stencil render targets.
---
---Formats starting with `bc` and `astc` are compressed formats.  Compressed formats have better performance since they stay compressed on the CPU and GPU, reducing the amount of memory bandwidth required to look up all the pixels needed for shading.
---
---Formats without the `f` suffix are unsigned normalized formats, which store values in the range `[0,1]`.  The `f` suffix indicates a floating point format which can store values outside this range, and is used for HDR rendering or storing data in a texture.
---@alias TextureFormat
---One 8-bit channel.  1 byte per pixel.
---| "r8"
---Two 8-bit channels.  2 bytes per pixel.
---| "rg8"
---Four 8-bit channels.  4 bytes per pixel.
---| "rgba8"
---Four 8-bit channels.  4 bytes per pixel.
---| "bgra8"
---One 16-bit channel.  2 bytes per pixel.
---| "r16"
---Two 16-bit channels.  4 bytes per pixel.
---| "rg16"
---Four 16-bit channels.  8 bytes per pixel.
---| "rgba16"
---One 16-bit floating point channel.  2 bytes per pixel.
---| "r16f"
---Two 16-bit floating point channels.  4 bytes per pixel.
---| "rg16f"
---Four 16-bit floating point channels.  8 bytes per pixel.
---| "rgba16f"
---One 32-bit floating point channel.  4 bytes per pixel.
---| "r32f"
---Two 32-bit floating point channels.  8 bytes per pixel.
---| "rg32f"
---Four 32-bit floating point channels.  16 bytes per pixel.
---| "rgba32f"
---Packs three channels into 16 bits.  2 bytes per pixel.
---| "rgb565"
---Packs four channels into 16 bits, with "cutout" alpha.  2 bytes per pixel.
---| "rgb5a1"
---Packs four channels into 32 bits.  4 bytes per pixel.
---| "rgb10a2"
---Packs three unsigned floating point channels into 32 bits.  4 bytes per pixel.
---| "rg11b10f"
---One 16-bit depth channel.  2 bytes per pixel.
---| "d16"
---One 24-bit depth channel.  4 bytes per pixel.
---| "d24"
---One 24-bit depth channel and one 8-bit stencil channel.  4 bytes per pixel.
---| "d24s8"
---One 32-bit floating point depth channel.  4 bytes per pixel.
---| "d32f"
---One 32-bit floating point depth channel and one 8-bit stencil channel.  5 bytes per pixel.
---| "d32fs8"
---3 channels.  8 bytes per 4x4 block, or 0.5 bytes per pixel.  Good for opaque images.
---| "bc1"
---Four channels.  16 bytes per 4x4 block or 1 byte per pixel.  Not good for anything, because it only has 16 distinct levels of alpha.
---| "bc2"
---Four channels.  16 bytes per 4x4 block or 1 byte per pixel.  Good for color images with transparency.
---| "bc3"
---One unsigned normalized channel.  8 bytes per 4x4 block or 0.5 bytes per pixel.  Good for grayscale images, like heightmaps.
---| "bc4u"
---One signed normalized channel.  8 bytes per 4x4 block or 0.5 bytes per pixel.  Similar to bc4u but has a range of -1 to 1.
---| "bc4s"
---Two unsigned normalized channels.  16 bytes per 4x4 block, or 1 byte per pixel.  Good for normal maps.
---| "bc5u"
---Two signed normalized channels.  16 bytes per 4x4 block or 1 byte per pixel.  Good for normal maps.
---| "bc5s"
---Three unsigned floating point channels.  16 bytes per 4x4 block or 1 byte per pixel.  Good for HDR images.
---| "bc6uf"
---Three floating point channels.  16 bytes per 4x4 block or 1 byte per pixel.  Good for HDR images.
---| "bc6sf"
---Four channels.  16 bytes per 4x4 block or 1 byte per pixel.  High quality.  Good for most color images, including transparency.
---| "bc7"
---Four channels, 16 bytes per 4x4 block or 1 byte per pixel.
---| "astc4x4"
---Four channels, 16 bytes per 5x4 block or 0.80 bytes per pixel.
---| "astc5x4"
---Four channels, 16 bytes per 5x5 block or 0.64 bytes per pixel.
---| "astc5x5"
---Four channels, 16 bytes per 6x5 block or 0.53 bytes per pixel.
---| "astc6x5"
---Four channels, 16 bytes per 6x6 block or 0.44 bytes per pixel.
---| "astc6x6"
---Four channels, 16 bytes per 8x5 block or 0.40 bytes per pixel.
---| "astc8x5"
---Four channels, 16 bytes per 8x6 block or 0.33 bytes per pixel.
---| "astc8x6"
---Four channels, 16 bytes per 8x8 block or 0.25 bytes per pixel.
---| "astc8x8"
---Four channels, 16 bytes per 10x5 block or 0.32 bytes per pixel.
---| "astc10x5"
---Four channels, 16 bytes per 10x6 block or 0.27 bytes per pixel.
---| "astc10x6"
---Four channels, 16 bytes per 10x8 block or 0.20 bytes per pixel.
---| "astc10x8"
---Four channels, 16 bytes per 10x10 block or 0.16 bytes per pixel.
---| "astc10x10"
---Four channels, 16 bytes per 12x10 block or 0.13 bytes per pixel.
---| "astc12x10"
---Four channels, 16 bytes per 12x12 block or 0.11 bytes per pixel.
---| "astc12x12"
