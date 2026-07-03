---@meta

---The graphics module renders graphics and performs computation using the GPU.
---
---Most of the graphics functions are on the `Pass` object.
---
---@class lovr.graphics
lovr.graphics = {}

---Compiles shader code to SPIR-V bytecode.  The bytecode can be passed to `lovr.graphics.newShader` to create shaders, which will be faster than creating it from GLSL. The bytecode is portable, so bytecode compiled on one platform will work on other platforms. This allows shaders to be precompiled in a build step.
---
---#### Notes:
---
---The input can be GLSL or SPIR-V.  If it's SPIR-V, it will be returned unchanged as a Blob.
---
---If the shader fails to compile, an error will be thrown with the error message.
---
---@param stage ShaderStage The type of shader to compile.
---@param source string | Blob A string, filename, or Blob with shader code.
---@return Blob bytecode A Blob containing compiled SPIR-V code.
function lovr.graphics.compileShader(stage, source) end

---Returns the global background color.  The textures in a render pass will be cleared to this color at the beginning of the pass if no other clear option is specified.  Additionally, the headset and window will be cleared to this color before rendering.
---
---#### Notes:
---
---Setting the background color in `lovr.draw` will apply on the following frame, since the default pass is cleared before `lovr.draw` is called.
---
---Internally, this color is applied to the default pass objects when retrieving one of them using `lovr.headset.getPass` or `lovr.graphics.getWindowPass`.  Both are called automatically by the default `lovr.run` implementation.
---
---Using the background color to clear the display is expected to be more efficient than manually clearing after a render pass begins, especially on mobile GPUs.
---
---@return number r The red component of the background color.
---@return number g The green component of the background color.
---@return number b The blue component of the background color.
---@return number a The alpha component of the background color.
function lovr.graphics.getBackgroundColor() end

---Returns the default Font.  The default font is Varela Round, created at 32px with a spread value of `4.0`.  It's used by `Pass:text` if no Font is provided.
---
---@return Font font The default Font object.
function lovr.graphics.getDefaultFont() end

---Returns information about the graphics device and driver.
---
---#### Notes:
---
---The device and vendor ID numbers will usually be PCI IDs, which are standardized numbers consisting of 4 hex digits.  Various online databases and system utilities can be used to look up these numbers.  Here are some example vendor IDs for a few popular GPU manufacturers:
---
---<table>
---  <thead>
---    <tr>
---      <td>ID</td>
---      <td>Vendor</td>
---    </tr>
---  </thead>
---  <tbody>
---    <tr>
---      <td><code>0x1002</code></td>
---      <td>Advanced Micro Devices, Inc.</td>
---    </tr>
---    <tr>
---      <td><code>0x8086</code></td>
---      <td>Intel Corporation</td>
---    </tr>
---    <tr>
---      <td><code>0x10de</code></td>
---      <td>NVIDIA Corporation</td>
---    </tr>
---  </tbody> </table>
---
---It is not currently possible to get the version of the driver, although this could be added.
---
---Regarding multiple GPUs: If OpenXR is enabled, the OpenXR runtime has control over which GPU is used, which ensures best compatibility with the VR headset.  Otherwise, the "first" GPU returned by the renderer will be used.  There is currently no other way to pick a GPU to use.
---
---@return table device nil
function lovr.graphics.getDevice() end

---Returns a table indicating which features are supported by the GPU.
---
---@return table features
function lovr.graphics.getFeatures() end

---Returns limits of the current GPU.
---
---#### Notes:
---
---The limit ranges are as follows:
---
---<table>
---  <thead>
---    <tr>
---      <td>Limit</td>
---      <td>Minimum</td>
---      <td>Maximum</td>
---    </tr>
---  </thead>
---  <tbody>
---    <tr>
---      <td><code>textureSize2D</code></td>
---      <td>4096</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>textureSize3D</code></td>
---      <td>256</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>textureSizeCube</code></td>
---      <td>4096</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>textureLayers</code></td>
---      <td>256</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>renderSize</code></td>
---      <td>{ 4096, 4096, 6 }</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>uniformBuffersPerStage</code></td>
---      <td>9</td>
---      <td>32*</td>
---    </tr>
---    <tr>
---      <td><code>storageBuffersPerStage</code></td>
---      <td>4</td>
---      <td>32*</td>
---    </tr>
---    <tr>
---      <td><code>sampledTexturesPerStage</code></td>
---      <td>32</td>
---      <td>32*</td>
---    </tr>
---    <tr>
---      <td><code>storageTexturesPerStage</code></td>
---      <td>4</td>
---      <td>32*</td>
---    </tr>
---    <tr>
---      <td><code>samplersPerStage</code></td>
---      <td>15</td>
---      <td>32*</td>
---    </tr>
---    <tr>
---      <td><code>resourcesPerShader</code></td>
---      <td>32</td>
---      <td>32*</td>
---    </tr>
---    <tr>
---      <td><code>uniformBufferRange</code></td>
---      <td>65536</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>storageBufferRange</code></td>
---      <td>134217728 (128MB)</td>
---      <td>1073741824 (1GB)*</td>
---    </tr>
---    <tr>
---      <td><code>uniformBufferAlign</code></td>
---      <td></td>
---      <td>256</td>
---    </tr>
---    <tr>
---      <td><code>storageBufferAlign</code></td>
---      <td></td>
---      <td>64</td>
---    </tr>
---    <tr>
---      <td><code>vertexAttributes</code></td>
---      <td>16</td>
---      <td>16*</td>
---    </tr>
---    <tr>
---      <td><code>vertexBufferStride</code></td>
---      <td>2048</td>
---      <td>65535*</td>
---    </tr>
---    <tr>
---      <td><code>vertexShaderOutputs</code></td>
---      <td>64</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>clipDistances</code></td>
---      <td>0</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>cullDistances</code></td>
---      <td>0</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>clipAndCullDistances</code></td>
---      <td>0</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>computeDispatchCount</code></td>
---      <td>{ 65536, 65536, 65536 }</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>computeWorkgroupSize</code></td>
---      <td>{ 128, 128, 64 }</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>computeWorkgroupVolume</code></td>
---      <td>128</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>computeSharedMemory</code></td>
---      <td>16384 (16KB)</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>pushConstantSize</code></td>
---      <td>128</td>
---      <td>256*</td>
---    </tr>
---    <tr>
---      <td><code>indirectDrawCount</code></td>
---      <td>1</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>instances</code></td>
---      <td>134217727</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>anisotropy</code></td>
---      <td>0.0</td>
---      <td></td>
---    </tr>
---    <tr>
---      <td><code>pointSize</code></td>
---      <td>1.0</td>
---      <td></td>
---    </tr>
---  </tbody> </table>
---
---Note: in the table above, `*` means that LÖVR itself is imposing a cap on the limit, instead of the GPU.
---
---@return table limits
function lovr.graphics.getLimits() end

---Returns various statistics about GPU usage.
---
---@return table stats A table with statistics.
function lovr.graphics.getStats() end

---Returns the window pass.  This is a builtin render `Pass` object that renders to the desktop window texture.  If the desktop window was not open when the graphics module was initialized, this function will return `nil`.
---
---#### Notes:
---
---Each time this function is called, the window pass is reset, as though `Pass:setCanvas` or `Pass:reset` was called on it.
---
---`lovr.conf` may be used to change the settings for the pass:  `t.graphics.antialias` enables antialiasing, and `t.graphics.stencil` enables the stencil buffer.
---
---This pass clears the window texture to the background color, which can be changed using `lovr.graphics.setBackgroundColor`.
---
---@return Pass | nil pass The window pass, or `nil` if there is no window.
function lovr.graphics.getWindowPass() end

---Returns the type of operations the GPU supports for a texture format, if any.
---
---@param format TextureFormat The texture format to query.
---@param ... TextureFeature Zero or more features to check.  If no features are given, this function will return whether the GPU supports *any* feature for this format.  Otherwise, this function will only return true if *all* of the input features are supported.
---@return boolean linear Whether the GPU supports these operations for textures with this format, when created with the `linear` flag set to `true`.
---@return boolean srgb Whether the GPU supports these operations for textures with this format, when created with the `linear` flag set to `false`.
function lovr.graphics.isFormatSupported(format, ...) end

---Returns whether the **super experimental** HDR mode is active.
---
---To enable HDR, add `t.graphics.hdr` to `lovr.conf`.  When enabled, LÖVR will try to create an HDR10 window.  If the GPU supports it, then this function will return true and the window texture will be HDR:
---
---- Its format will be `rgb10a2` instead of `rgba8`.
---- The display will assume its colors are in the Rec.2020 color space, instead of sRGB.
---- The display will assume its colors are encoded with the PQ transfer function, instead of sRGB.
---
---For now, it's up to you to write PQ-encoded Rec.2020 color data from your shader when rendering to the window.
---
---#### Notes:
---
---The following shader helper functions make it easier to convert between sRGB colors and HDR10:
---
---    vec3 pqToLinear(vec3 color);
---    vec3 linearToPQ(vec3 color);
---    vec3 sRGBToRec2020(vec3 color);
---    vec3 rec2020ToSRGB(vec3 color);
---
---@return boolean hdr Whether HDR is enabled.
function lovr.graphics.isHDR() end

---Returns whether timing stats are enabled.  When enabled, `Pass:getStats` will return `submitTime` and `gpuTime` durations.  Timing is enabled by default when `t.graphics.debug` is set in `lovr.conf`.  Timing has a small amount of overhead, so it should only be enabled when needed.
---
---@return boolean enabled Whether timing is enabled.
function lovr.graphics.isTimingEnabled() end

---Creates a Buffer.
---
---#### Notes:
---
---The format table can contain a list of `DataType`s or a list of tables to provide extra information about each field.  Each inner table has the following keys:
---
---- `type` is the `DataType` of the field and is required.
---- `name` is the name of the field.  The field name is used to match table keys up to buffer
---  fields when writing table data to the Buffer, and is also used to match up buffer fields with
---  vertex attribute names declared in a `Shader`.  LÖVR has a set of <a
---  href="Shaders#vertex-attributes">default vertex attributes</a> that shaders will automatically
---  use, allowing you to create a custom mesh without having to write shader code or add custom
---  vertex attributes in a shader.
---- `offset` is the byte offset of the field.  Any fields with a `nil` offset will be placed next
---  to each other sequentially in memory, subject to any padding required by the Buffer's layout.
---  In practice this means that you probably want to provide an `offset` for either all of the
---  fields or none of them.
---- `length` is the array size of the field (optional, leave as `nil` for non-arrays).
---- `stride` is the number of bytes between each item in an array (optional).
---
---As a shorthand, the name, type, and optionally the length of a field can be provided as a list instead of using keys.
---
---If no table or Blob is used to define the initial Buffer contents, its data will be undefined.
---
---#### Example:
---
---Examples of different buffer formats.
---
---```lua
----- 2 matrices
---lovr.graphics.newBuffer('mat4', 2)
---
----- 3 integers, with initial data
---lovr.graphics.newBuffer('int', { 1, 2, 3 })
---
----- a simple mesh:
---lovr.graphics.newBuffer({
---  { name = 'VertexPosition', type = 'vec3' },
---  { name = 'VertexColor', type = 'color' }
---}, 4)
---
----- a uniform buffer with vec3's, using the std140 packing
---lovr.graphics.newBuffer({ 'vec3', layout = 'std140' }, data)
---
----- a uniform buffer with key-value fields
---lovr.graphics.newBuffer({
---  { 'AmbientColor', 'vec3' },
---  { 'LightPosition', 'vec3' },
---  { 'LightType', 'u32' },
---  { 'LightColor', 'vec4' },
---  layout = 'std140'
---})
---
----- a buffer with nested structure and array types
---lovr.graphics.newBuffer({
---  { 'globals', {
---    { 'ObjectCount', 'int' },
---    { 'WorldSize', 'vec2' },
---    { 'Scale', 'float' }
---  }},
---  { 'materials', {
---    { 'Color', 'vec4' },
---    { 'Glow', 'vec3' },
---    { 'Roughness', 'float' }
---  }, length = 32 },
---  layout = 'std430'
---})
---
----- a buffer using a variable from a shader:
---lovr.graphics.newBuffer(shader:getBufferFormat('transforms'))
---```
---
---@param size number The size of the Buffer, in bytes.
---@return Buffer buffer The new Buffer.
function lovr.graphics.newBuffer(size) end

---Creates a Buffer.
---
---#### Notes:
---
---The format table can contain a list of `DataType`s or a list of tables to provide extra information about each field.  Each inner table has the following keys:
---
---- `type` is the `DataType` of the field and is required.
---- `name` is the name of the field.  The field name is used to match table keys up to buffer
---  fields when writing table data to the Buffer, and is also used to match up buffer fields with
---  vertex attribute names declared in a `Shader`.  LÖVR has a set of <a
---  href="Shaders#vertex-attributes">default vertex attributes</a> that shaders will automatically
---  use, allowing you to create a custom mesh without having to write shader code or add custom
---  vertex attributes in a shader.
---- `offset` is the byte offset of the field.  Any fields with a `nil` offset will be placed next
---  to each other sequentially in memory, subject to any padding required by the Buffer's layout.
---  In practice this means that you probably want to provide an `offset` for either all of the
---  fields or none of them.
---- `length` is the array size of the field (optional, leave as `nil` for non-arrays).
---- `stride` is the number of bytes between each item in an array (optional).
---
---As a shorthand, the name, type, and optionally the length of a field can be provided as a list instead of using keys.
---
---If no table or Blob is used to define the initial Buffer contents, its data will be undefined.
---
---#### Example:
---
---Examples of different buffer formats.
---
---```lua
----- 2 matrices
---lovr.graphics.newBuffer('mat4', 2)
---
----- 3 integers, with initial data
---lovr.graphics.newBuffer('int', { 1, 2, 3 })
---
----- a simple mesh:
---lovr.graphics.newBuffer({
---  { name = 'VertexPosition', type = 'vec3' },
---  { name = 'VertexColor', type = 'color' }
---}, 4)
---
----- a uniform buffer with vec3's, using the std140 packing
---lovr.graphics.newBuffer({ 'vec3', layout = 'std140' }, data)
---
----- a uniform buffer with key-value fields
---lovr.graphics.newBuffer({
---  { 'AmbientColor', 'vec3' },
---  { 'LightPosition', 'vec3' },
---  { 'LightType', 'u32' },
---  { 'LightColor', 'vec4' },
---  layout = 'std140'
---})
---
----- a buffer with nested structure and array types
---lovr.graphics.newBuffer({
---  { 'globals', {
---    { 'ObjectCount', 'int' },
---    { 'WorldSize', 'vec2' },
---    { 'Scale', 'float' }
---  }},
---  { 'materials', {
---    { 'Color', 'vec4' },
---    { 'Glow', 'vec3' },
---    { 'Roughness', 'float' }
---  }, length = 32 },
---  layout = 'std430'
---})
---
----- a buffer using a variable from a shader:
---lovr.graphics.newBuffer(shader:getBufferFormat('transforms'))
---```
---
---@param blob Blob A Blob with the initial contents of the Buffer.
---@return Buffer buffer The new Buffer.
function lovr.graphics.newBuffer(blob) end

---Creates a Buffer.
---
---#### Notes:
---
---The format table can contain a list of `DataType`s or a list of tables to provide extra information about each field.  Each inner table has the following keys:
---
---- `type` is the `DataType` of the field and is required.
---- `name` is the name of the field.  The field name is used to match table keys up to buffer
---  fields when writing table data to the Buffer, and is also used to match up buffer fields with
---  vertex attribute names declared in a `Shader`.  LÖVR has a set of <a
---  href="Shaders#vertex-attributes">default vertex attributes</a> that shaders will automatically
---  use, allowing you to create a custom mesh without having to write shader code or add custom
---  vertex attributes in a shader.
---- `offset` is the byte offset of the field.  Any fields with a `nil` offset will be placed next
---  to each other sequentially in memory, subject to any padding required by the Buffer's layout.
---  In practice this means that you probably want to provide an `offset` for either all of the
---  fields or none of them.
---- `length` is the array size of the field (optional, leave as `nil` for non-arrays).
---- `stride` is the number of bytes between each item in an array (optional).
---
---As a shorthand, the name, type, and optionally the length of a field can be provided as a list instead of using keys.
---
---If no table or Blob is used to define the initial Buffer contents, its data will be undefined.
---
---#### Example:
---
---Examples of different buffer formats.
---
---```lua
----- 2 matrices
---lovr.graphics.newBuffer('mat4', 2)
---
----- 3 integers, with initial data
---lovr.graphics.newBuffer('int', { 1, 2, 3 })
---
----- a simple mesh:
---lovr.graphics.newBuffer({
---  { name = 'VertexPosition', type = 'vec3' },
---  { name = 'VertexColor', type = 'color' }
---}, 4)
---
----- a uniform buffer with vec3's, using the std140 packing
---lovr.graphics.newBuffer({ 'vec3', layout = 'std140' }, data)
---
----- a uniform buffer with key-value fields
---lovr.graphics.newBuffer({
---  { 'AmbientColor', 'vec3' },
---  { 'LightPosition', 'vec3' },
---  { 'LightType', 'u32' },
---  { 'LightColor', 'vec4' },
---  layout = 'std140'
---})
---
----- a buffer with nested structure and array types
---lovr.graphics.newBuffer({
---  { 'globals', {
---    { 'ObjectCount', 'int' },
---    { 'WorldSize', 'vec2' },
---    { 'Scale', 'float' }
---  }},
---  { 'materials', {
---    { 'Color', 'vec4' },
---    { 'Glow', 'vec3' },
---    { 'Roughness', 'float' }
---  }, length = 32 },
---  layout = 'std430'
---})
---
----- a buffer using a variable from a shader:
---lovr.graphics.newBuffer(shader:getBufferFormat('transforms'))
---```
---
---@param format table | DataType A list of fields in the Buffer.  A `DataType` can also be used for buffers that are simple arrays.
---@param length? number The length of the Buffer.
---@return Buffer buffer The new Buffer.
function lovr.graphics.newBuffer(format, length) end

---Creates a Buffer.
---
---#### Notes:
---
---The format table can contain a list of `DataType`s or a list of tables to provide extra information about each field.  Each inner table has the following keys:
---
---- `type` is the `DataType` of the field and is required.
---- `name` is the name of the field.  The field name is used to match table keys up to buffer
---  fields when writing table data to the Buffer, and is also used to match up buffer fields with
---  vertex attribute names declared in a `Shader`.  LÖVR has a set of <a
---  href="Shaders#vertex-attributes">default vertex attributes</a> that shaders will automatically
---  use, allowing you to create a custom mesh without having to write shader code or add custom
---  vertex attributes in a shader.
---- `offset` is the byte offset of the field.  Any fields with a `nil` offset will be placed next
---  to each other sequentially in memory, subject to any padding required by the Buffer's layout.
---  In practice this means that you probably want to provide an `offset` for either all of the
---  fields or none of them.
---- `length` is the array size of the field (optional, leave as `nil` for non-arrays).
---- `stride` is the number of bytes between each item in an array (optional).
---
---As a shorthand, the name, type, and optionally the length of a field can be provided as a list instead of using keys.
---
---If no table or Blob is used to define the initial Buffer contents, its data will be undefined.
---
---#### Example:
---
---Examples of different buffer formats.
---
---```lua
----- 2 matrices
---lovr.graphics.newBuffer('mat4', 2)
---
----- 3 integers, with initial data
---lovr.graphics.newBuffer('int', { 1, 2, 3 })
---
----- a simple mesh:
---lovr.graphics.newBuffer({
---  { name = 'VertexPosition', type = 'vec3' },
---  { name = 'VertexColor', type = 'color' }
---}, 4)
---
----- a uniform buffer with vec3's, using the std140 packing
---lovr.graphics.newBuffer({ 'vec3', layout = 'std140' }, data)
---
----- a uniform buffer with key-value fields
---lovr.graphics.newBuffer({
---  { 'AmbientColor', 'vec3' },
---  { 'LightPosition', 'vec3' },
---  { 'LightType', 'u32' },
---  { 'LightColor', 'vec4' },
---  layout = 'std140'
---})
---
----- a buffer with nested structure and array types
---lovr.graphics.newBuffer({
---  { 'globals', {
---    { 'ObjectCount', 'int' },
---    { 'WorldSize', 'vec2' },
---    { 'Scale', 'float' }
---  }},
---  { 'materials', {
---    { 'Color', 'vec4' },
---    { 'Glow', 'vec3' },
---    { 'Roughness', 'float' }
---  }, length = 32 },
---  layout = 'std430'
---})
---
----- a buffer using a variable from a shader:
---lovr.graphics.newBuffer(shader:getBufferFormat('transforms'))
---```
---
---@param format table | DataType A list of fields in the Buffer.  A `DataType` can also be used for buffers that are simple arrays.
---@param data table | Blob The initial data to put into the Buffer.  The length of the Buffer will be determined by the length of the table or the size of the Blob, combined with the format information.
---@return Buffer buffer The new Buffer.
function lovr.graphics.newBuffer(format, data) end

---Creates a new Font.
---
---@param file string | Blob A filename or Blob containing a TTF or BMFont file.
---@param size? number The size of the Font in pixels (TTF only).  Larger sizes are slower to initialize and use more memory, but have better quality.
---@param spread? number For signed distance field fonts (currently all fonts), the width of the SDF, in pixels.  The greater the distance the font is viewed from, the larger this value needs to be for the font to remain properly antialiased.  Increasing this will have a performance penalty similar to increasing the size of the font.
---@return Font font The new Font.
function lovr.graphics.newFont(file, size, spread) end

---Creates a new Font.
---
---@param file string | Blob A filename or Blob containing a TTF or BMFont file.
---@param atlas? Image An Image to use for the BMFont atlas, instead of the one in the BMFont file.
---@param spread? number For signed distance field fonts (currently all fonts), the width of the SDF, in pixels.  The greater the distance the font is viewed from, the larger this value needs to be for the font to remain properly antialiased.  Increasing this will have a performance penalty similar to increasing the size of the font.
---@return Font font The new Font.
function lovr.graphics.newFont(file, atlas, spread) end

---Creates a new Font.
---
---@param size? number The size of the Font in pixels (TTF only).  Larger sizes are slower to initialize and use more memory, but have better quality.
---@param spread? number For signed distance field fonts (currently all fonts), the width of the SDF, in pixels.  The greater the distance the font is viewed from, the larger this value needs to be for the font to remain properly antialiased.  Increasing this will have a performance penalty similar to increasing the size of the font.
---@return Font font The new Font.
function lovr.graphics.newFont(size, spread) end

---Creates a new Font.
---
---@param rasterizer Rasterizer An existing Rasterizer to use to load glyph images.
---@param spread? number For signed distance field fonts (currently all fonts), the width of the SDF, in pixels.  The greater the distance the font is viewed from, the larger this value needs to be for the font to remain properly antialiased.  Increasing this will have a performance penalty similar to increasing the size of the font.
---@return Font font The new Font.
function lovr.graphics.newFont(rasterizer, spread) end

---Creates a new Material from a table of properties and textures.  All fields are optional.  Once a Material is created, its properties can not be changed.  Instead, a new Material should be created with the updated properties.
---
---#### Notes:
---
---The non-texture material properties can be accessed in shaders using `Material.<property>`, where the property is the same as the Lua table key.  The textures use capitalized names in shader code, e.g. `ColorTexture`.
---
---@param properties {color: {number}, glow: {number}, uvShift: {number}, uvScale: {number}, metalness: number, roughness: number, clearcoat: number, clearcoatRoughness: number, occlusionStrength: number, normalScale: number, alphaCutoff: number, texture: Texture, glowTexture: Texture, metalnessTexture: Texture, roughnessTexture: Texture, clearcoatTexture: Texture, occlusionTexture: Texture, normalTexture: Texture} Material properties.
---@return Material material The new material.
function lovr.graphics.newMaterial(properties) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param count number The number of vertices in the Mesh.
---@param options {storage: MeshStorage, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} Optional options.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(count, options) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param vertices table A table of vertices, formatted according to the vertex format.  The length of the table will be used to set the vertex count of the Mesh.
---@param options {storage: MeshStorage, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} Optional options.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(vertices, options) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param blob Blob A Blob containing vertex data, formatted according to the vertex format.  The size of the Blob will be used to set the vertex count of the Mesh, and must be a multiple of the vertex size.
---@param options {storage: MeshStorage, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} Optional options.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(blob, options) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param format table A table of attributes describing the format of each vertex.  Each attribute is a table that must have `name` and `type` keys, where the name is a string and the type is a `DataType`. Attributes can also have an `offset` key, which is a byte offset relative to the start of the vertex.  As a shorthand, the name and type can be given as a pair without keys. Additionally, the format can have a `stride` key to set the number of bytes between subsequent vertices.
---@param count number The number of vertices in the Mesh.
---@param options {storage: MeshStorage, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} Optional options.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(format, count, options) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param format table A table of attributes describing the format of each vertex.  Each attribute is a table that must have `name` and `type` keys, where the name is a string and the type is a `DataType`. Attributes can also have an `offset` key, which is a byte offset relative to the start of the vertex.  As a shorthand, the name and type can be given as a pair without keys. Additionally, the format can have a `stride` key to set the number of bytes between subsequent vertices.
---@param vertices table A table of vertices, formatted according to the vertex format.  The length of the table will be used to set the vertex count of the Mesh.
---@param options {storage: MeshStorage, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} Optional options.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(format, vertices, options) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param format table A table of attributes describing the format of each vertex.  Each attribute is a table that must have `name` and `type` keys, where the name is a string and the type is a `DataType`. Attributes can also have an `offset` key, which is a byte offset relative to the start of the vertex.  As a shorthand, the name and type can be given as a pair without keys. Additionally, the format can have a `stride` key to set the number of bytes between subsequent vertices.
---@param blob Blob A Blob containing vertex data, formatted according to the vertex format.  The size of the Blob will be used to set the vertex count of the Mesh, and must be a multiple of the vertex size.
---@param options {storage: MeshStorage, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} Optional options.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(format, blob, options) end

---Creates a Mesh.  The capacity of the Mesh must be provided upfront, using either a vertex count or the vertex data itself.  A custom vertex format can be given to specify the set of attributes in each vertex, which get sent to the vertex shader.  If the format isn't given, the default vertex format will be used:
---
---    {
---      { 'VertexPosition', 'vec3' },
---      { 'VertexNormal', 'vec3' },
---      { 'VertexUV', 'vec2' }
---    }
---
---#### Notes:
---
---The Mesh will always use the `gpu` storage mode if it's created from a vertex buffer.
---
---#### Example:
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { 'VertexPosition', 'vec3' },
---    { 'VertexColor', 'vec4' }
---  }, {
---    {   0,  .4, 0 , 1, 0, 0, 1 },
---    { -.5, -.4, 0 , 0, 1, 0, 1 },
---    {  .5, -.4, 0 , 0, 0, 1, 1 }
---  })
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -1)
---end
---```
---
---@param buffer Buffer A Buffer containing vertex data.  Its length will be used as the vertex count, and its format will be used as the vertex format.
---@return Mesh mesh The new Mesh.
function lovr.graphics.newMesh(buffer) end

---Loads a 3D model from a file.  Currently, OBJ, glTF, and binary STL files are supported.
---
---#### Notes:
---
---Currently, the following features are not supported by the model importer:
---
---- glTF: Only the default scene is loaded.
---- glTF: Currently, each skin in a Model can have up to 256 joints.
---- glTF: Meshes can't appear multiple times in the node hierarchy with different skins, they need
---  to use 1 skin consistently.
---- glTF: `KHR_texture_transform` is supported, but all textures in a material will use the same
---  transform.
---- STL: ASCII STL files are not supported.
---
---Diffuse and emissive textures will be loaded using sRGB encoding, all other textures will be loaded as linear.
---
---Loading a model file will fail if the asset references textures or other files using absolute paths.  Relative paths should be used instead, and will be relative to the model file within the virtual filesystem.
---
---@param file string | Blob A filename or Blob containing 3D model data to import.
---@param options {mipmaps: boolean, materials: boolean, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} An optional table of Model options.
---@return Model model The new Model.
function lovr.graphics.newModel(file, options) end

---Loads a 3D model from a file.  Currently, OBJ, glTF, and binary STL files are supported.
---
---#### Notes:
---
---Currently, the following features are not supported by the model importer:
---
---- glTF: Only the default scene is loaded.
---- glTF: Currently, each skin in a Model can have up to 256 joints.
---- glTF: Meshes can't appear multiple times in the node hierarchy with different skins, they need
---  to use 1 skin consistently.
---- glTF: `KHR_texture_transform` is supported, but all textures in a material will use the same
---  transform.
---- STL: ASCII STL files are not supported.
---
---Diffuse and emissive textures will be loaded using sRGB encoding, all other textures will be loaded as linear.
---
---Loading a model file will fail if the asset references textures or other files using absolute paths.  Relative paths should be used instead, and will be relative to the model file within the virtual filesystem.
---
---@param modelData ModelData An existing ModelData object to use for the Model.
---@param options {mipmaps: boolean, materials: boolean, raytracer: {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean}} An optional table of Model options.
---@return Model model The new Model.
function lovr.graphics.newModel(modelData, options) end

---Creates and returns a new Pass object.  The canvas (the set of textures the Pass renders to) can be specified when creating the Pass, or later using `Pass:setCanvas`.
---
---#### Notes:
---
---Fun facts about render passes:
---
---- Textures must have been created with the `render` `TextureUsage`.
---- Textures must have the same dimensions, layer counts, and sample counts.
---- When rendering to textures with multiple layers, each draw will be broadcast to all layers.
---  Render passes have multiple "views" (cameras), and each layer uses a corresponding view,
---  allowing each layer to be rendered from a different viewpoint.  This enables fast stereo
---  rendering, but can also be used to efficiently render to cubemaps.  The `ViewIndex` variable
---  can also be used in shaders to set up any desired per-view behavior.
---- Mipmaps will automatically be generated for textures at the end of the render pass.
---- It's okay to have zero color textures, but in this case there must be a depth texture.
---- It's possible to render to a specific mipmap level of a Texture, or a subset of its layers, by
---  rendering to texture views, see `lovr.graphics.newTextureView`.
---
---@param ... Texture One or more textures the pass will render to.  This can be changed later using `Pass:setCanvas`.
---@return Pass pass The new Pass.
function lovr.graphics.newPass(...) end

---Creates and returns a new Pass object.  The canvas (the set of textures the Pass renders to) can be specified when creating the Pass, or later using `Pass:setCanvas`.
---
---#### Notes:
---
---Fun facts about render passes:
---
---- Textures must have been created with the `render` `TextureUsage`.
---- Textures must have the same dimensions, layer counts, and sample counts.
---- When rendering to textures with multiple layers, each draw will be broadcast to all layers.
---  Render passes have multiple "views" (cameras), and each layer uses a corresponding view,
---  allowing each layer to be rendered from a different viewpoint.  This enables fast stereo
---  rendering, but can also be used to efficiently render to cubemaps.  The `ViewIndex` variable
---  can also be used in shaders to set up any desired per-view behavior.
---- Mipmaps will automatically be generated for textures at the end of the render pass.
---- It's okay to have zero color textures, but in this case there must be a depth texture.
---- It's possible to render to a specific mipmap level of a Texture, or a subset of its layers, by
---  rendering to texture views, see `lovr.graphics.newTextureView`.
---
---@param canvas {depth: {format: TextureFormat, texture: Texture}, samples: number} Render target configuration.  Up to 4 textures can be provided in table keys 1 through 4, as well as the following keys:
---@return Pass pass The new Pass.
function lovr.graphics.newPass(canvas) end

---Creates and returns a new Pass object.  The canvas (the set of textures the Pass renders to) can be specified when creating the Pass, or later using `Pass:setCanvas`.
---
---#### Notes:
---
---Fun facts about render passes:
---
---- Textures must have been created with the `render` `TextureUsage`.
---- Textures must have the same dimensions, layer counts, and sample counts.
---- When rendering to textures with multiple layers, each draw will be broadcast to all layers.
---  Render passes have multiple "views" (cameras), and each layer uses a corresponding view,
---  allowing each layer to be rendered from a different viewpoint.  This enables fast stereo
---  rendering, but can also be used to efficiently render to cubemaps.  The `ViewIndex` variable
---  can also be used in shaders to set up any desired per-view behavior.
---- Mipmaps will automatically be generated for textures at the end of the render pass.
---- It's okay to have zero color textures, but in this case there must be a depth texture.
---- It's possible to render to a specific mipmap level of a Texture, or a subset of its layers, by
---  rendering to texture views, see `lovr.graphics.newTextureView`.
---
---@return Pass pass The new Pass.
function lovr.graphics.newPass() end

---Creates a new Raytracer, which holds objects for raytracing in shaders.  The capacity of the raytracer, the number of objects it can hold, must be declared upfront and can not be changed afterwards.
---
---@param capacity number The capacity of the Raytracer.
---@param options? {dynamic: boolean, fasttrace: boolean, fastbuild: boolean, compress: boolean} Optional options.
---@return Raytracer raytracer The new Raytracer.
function lovr.graphics.newRaytracer(capacity, options) end

---Creates a new Sampler.  Samplers are immutable, meaning their parameters can not be changed after the sampler is created.  Instead, a new sampler should be created with the updated properties.
---
---@param parameters {filter: {[1]: FilterMode, [2]: FilterMode, [3]: FilterMode}, wrap: {[1]: WrapMode, [2]: WrapMode, [3]: WrapMode}, compare: CompareMode, anisotropy: number, mipmaprange: table} Parameters for the sampler.
---@return Sampler sampler The new sampler.
function lovr.graphics.newSampler(parameters) end

---Creates a Shader, which is a small program that runs on the GPU.
---
---Shader code is usually written in GLSL and compiled to SPIR-V bytecode.  SPIR-V is faster to load but requires a build step.  Either form can be used to create a shader.
---
---By default, the provided shader code is expected to implement a `vec4 lovrmain() { ... }` function that is called for each vertex or fragment.  If the `raw` option is set to `true`, the code is treated as a raw shader and the `lovrmain` function is not required. In this case, the shader code is expected to implement its own `main` function.
---
---@param vertex string | DefaultShader | Blob A string, path to a file, or Blob containing GLSL or SPIR-V code for the vertex stage.  Can also be a `DefaultShader` to use that shader's vertex code.
---@param fragment string | DefaultShader | Blob A string, path to a file, or Blob containing GLSL or SPIR-V code for the fragment stage. Can also be a `DefaultShader` to use that shader's fragment code.
---@param options {flags: table, label: string, raw: boolean} An optional table of Shader options.
---@return Shader shader The new shader.
function lovr.graphics.newShader(vertex, fragment, options) end

---Creates a Shader, which is a small program that runs on the GPU.
---
---Shader code is usually written in GLSL and compiled to SPIR-V bytecode.  SPIR-V is faster to load but requires a build step.  Either form can be used to create a shader.
---
---By default, the provided shader code is expected to implement a `vec4 lovrmain() { ... }` function that is called for each vertex or fragment.  If the `raw` option is set to `true`, the code is treated as a raw shader and the `lovrmain` function is not required. In this case, the shader code is expected to implement its own `main` function.
---
---@param compute string | Blob A string, path to a file, or Blob containing GLSL or SPIR-V code for the compute stage.
---@param options {flags: table, label: string, raw: boolean} An optional table of Shader options.
---@return Shader shader The new shader.
function lovr.graphics.newShader(compute, options) end

---Creates a Shader, which is a small program that runs on the GPU.
---
---Shader code is usually written in GLSL and compiled to SPIR-V bytecode.  SPIR-V is faster to load but requires a build step.  Either form can be used to create a shader.
---
---By default, the provided shader code is expected to implement a `vec4 lovrmain() { ... }` function that is called for each vertex or fragment.  If the `raw` option is set to `true`, the code is treated as a raw shader and the `lovrmain` function is not required. In this case, the shader code is expected to implement its own `main` function.
---
---@param defaultshader DefaultShader One of the default shaders to use.
---@param options {flags: table, label: string, raw: boolean} An optional table of Shader options.
---@return Shader shader The new shader.
function lovr.graphics.newShader(defaultshader, options) end

---Creates a new Texture.  Image filenames or `Image` objects can be used to provide the initial pixel data and the dimensions, format, and type.  Alternatively, dimensions can be provided, which will create an empty texture.
---
---#### Notes:
---
---If no `type` is provided in the options table, LÖVR will guess the `TextureType` of the Texture based on the number of layers:
---
---- If there's only 1 layer, the type will be `2d`.
---- If there are 6 images provided, the type will be `cube`.
---- Otherwise, the type will be `array`.
---
---Note that an Image can contain multiple layers and mipmaps.  When a single Image is provided, its layer count will be used as the Texture's layer count.
---
---If multiple Images are used to initialize the Texture, they must all have a single layer, and their dimensions, format, and mipmap counts must match.
---
---When providing cubemap images in a table, they can be in one of the following forms:
---
---    { 'px.png', 'nx.png', 'py.png', 'ny.png', 'pz.png', 'nz.png' }
---    { right = 'px.png', left = 'nx.png', top = 'py.png', bottom = 'ny.png', back = 'pz.png', front = 'nz.png' }
---    { px = 'px.png', nx = 'nx.png', py = 'py.png', ny = 'ny.png', pz = 'pz.png', nz = 'nz.png' }
---
---(Where 'p' stands for positive and 'n' stands for negative).
---
---If no `usage` is provided in the options table, LÖVR will guess the `TextureUsage` of the Texture.  The `sample` usage is always included, but if the texture was created without any images then the texture will have the `render` usage as well.
---
---The supported image formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---If image data is provided, mipmaps will be generated for any missing mipmap levels.
---
---@param file string | Blob A filename or Blob containing an image file to load.
---@param options {type: TextureType, format: TextureFormat, linear: boolean, samples: number, mipmaps: boolean | number, usage: {TextureUsage}, label: string} Texture options.
---@return Texture texture The new Texture.
function lovr.graphics.newTexture(file, options) end

---Creates a new Texture.  Image filenames or `Image` objects can be used to provide the initial pixel data and the dimensions, format, and type.  Alternatively, dimensions can be provided, which will create an empty texture.
---
---#### Notes:
---
---If no `type` is provided in the options table, LÖVR will guess the `TextureType` of the Texture based on the number of layers:
---
---- If there's only 1 layer, the type will be `2d`.
---- If there are 6 images provided, the type will be `cube`.
---- Otherwise, the type will be `array`.
---
---Note that an Image can contain multiple layers and mipmaps.  When a single Image is provided, its layer count will be used as the Texture's layer count.
---
---If multiple Images are used to initialize the Texture, they must all have a single layer, and their dimensions, format, and mipmap counts must match.
---
---When providing cubemap images in a table, they can be in one of the following forms:
---
---    { 'px.png', 'nx.png', 'py.png', 'ny.png', 'pz.png', 'nz.png' }
---    { right = 'px.png', left = 'nx.png', top = 'py.png', bottom = 'ny.png', back = 'pz.png', front = 'nz.png' }
---    { px = 'px.png', nx = 'nx.png', py = 'py.png', ny = 'ny.png', pz = 'pz.png', nz = 'nz.png' }
---
---(Where 'p' stands for positive and 'n' stands for negative).
---
---If no `usage` is provided in the options table, LÖVR will guess the `TextureUsage` of the Texture.  The `sample` usage is always included, but if the texture was created without any images then the texture will have the `render` usage as well.
---
---The supported image formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---If image data is provided, mipmaps will be generated for any missing mipmap levels.
---
---@param width number The width of the Texture, in pixels.
---@param height number The height of the Texture, in pixels.
---@param options {type: TextureType, format: TextureFormat, linear: boolean, samples: number, mipmaps: boolean | number, usage: {TextureUsage}, label: string} Texture options.
---@return Texture texture The new Texture.
function lovr.graphics.newTexture(width, height, options) end

---Creates a new Texture.  Image filenames or `Image` objects can be used to provide the initial pixel data and the dimensions, format, and type.  Alternatively, dimensions can be provided, which will create an empty texture.
---
---#### Notes:
---
---If no `type` is provided in the options table, LÖVR will guess the `TextureType` of the Texture based on the number of layers:
---
---- If there's only 1 layer, the type will be `2d`.
---- If there are 6 images provided, the type will be `cube`.
---- Otherwise, the type will be `array`.
---
---Note that an Image can contain multiple layers and mipmaps.  When a single Image is provided, its layer count will be used as the Texture's layer count.
---
---If multiple Images are used to initialize the Texture, they must all have a single layer, and their dimensions, format, and mipmap counts must match.
---
---When providing cubemap images in a table, they can be in one of the following forms:
---
---    { 'px.png', 'nx.png', 'py.png', 'ny.png', 'pz.png', 'nz.png' }
---    { right = 'px.png', left = 'nx.png', top = 'py.png', bottom = 'ny.png', back = 'pz.png', front = 'nz.png' }
---    { px = 'px.png', nx = 'nx.png', py = 'py.png', ny = 'ny.png', pz = 'pz.png', nz = 'nz.png' }
---
---(Where 'p' stands for positive and 'n' stands for negative).
---
---If no `usage` is provided in the options table, LÖVR will guess the `TextureUsage` of the Texture.  The `sample` usage is always included, but if the texture was created without any images then the texture will have the `render` usage as well.
---
---The supported image formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---If image data is provided, mipmaps will be generated for any missing mipmap levels.
---
---@param width number The width of the Texture, in pixels.
---@param height number The height of the Texture, in pixels.
---@param layers number The number of layers in the Texture.
---@param options {type: TextureType, format: TextureFormat, linear: boolean, samples: number, mipmaps: boolean | number, usage: {TextureUsage}, label: string} Texture options.
---@return Texture texture The new Texture.
function lovr.graphics.newTexture(width, height, layers, options) end

---Creates a new Texture.  Image filenames or `Image` objects can be used to provide the initial pixel data and the dimensions, format, and type.  Alternatively, dimensions can be provided, which will create an empty texture.
---
---#### Notes:
---
---If no `type` is provided in the options table, LÖVR will guess the `TextureType` of the Texture based on the number of layers:
---
---- If there's only 1 layer, the type will be `2d`.
---- If there are 6 images provided, the type will be `cube`.
---- Otherwise, the type will be `array`.
---
---Note that an Image can contain multiple layers and mipmaps.  When a single Image is provided, its layer count will be used as the Texture's layer count.
---
---If multiple Images are used to initialize the Texture, they must all have a single layer, and their dimensions, format, and mipmap counts must match.
---
---When providing cubemap images in a table, they can be in one of the following forms:
---
---    { 'px.png', 'nx.png', 'py.png', 'ny.png', 'pz.png', 'nz.png' }
---    { right = 'px.png', left = 'nx.png', top = 'py.png', bottom = 'ny.png', back = 'pz.png', front = 'nz.png' }
---    { px = 'px.png', nx = 'nx.png', py = 'py.png', ny = 'ny.png', pz = 'pz.png', nz = 'nz.png' }
---
---(Where 'p' stands for positive and 'n' stands for negative).
---
---If no `usage` is provided in the options table, LÖVR will guess the `TextureUsage` of the Texture.  The `sample` usage is always included, but if the texture was created without any images then the texture will have the `render` usage as well.
---
---The supported image formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---If image data is provided, mipmaps will be generated for any missing mipmap levels.
---
---@param image string An Image object holding pixel data to load into the Texture.
---@param options {type: TextureType, format: TextureFormat, linear: boolean, samples: number, mipmaps: boolean | number, usage: {TextureUsage}, label: string} Texture options.
---@return Texture texture The new Texture.
function lovr.graphics.newTexture(image, options) end

---Creates a new Texture.  Image filenames or `Image` objects can be used to provide the initial pixel data and the dimensions, format, and type.  Alternatively, dimensions can be provided, which will create an empty texture.
---
---#### Notes:
---
---If no `type` is provided in the options table, LÖVR will guess the `TextureType` of the Texture based on the number of layers:
---
---- If there's only 1 layer, the type will be `2d`.
---- If there are 6 images provided, the type will be `cube`.
---- Otherwise, the type will be `array`.
---
---Note that an Image can contain multiple layers and mipmaps.  When a single Image is provided, its layer count will be used as the Texture's layer count.
---
---If multiple Images are used to initialize the Texture, they must all have a single layer, and their dimensions, format, and mipmap counts must match.
---
---When providing cubemap images in a table, they can be in one of the following forms:
---
---    { 'px.png', 'nx.png', 'py.png', 'ny.png', 'pz.png', 'nz.png' }
---    { right = 'px.png', left = 'nx.png', top = 'py.png', bottom = 'ny.png', back = 'pz.png', front = 'nz.png' }
---    { px = 'px.png', nx = 'nx.png', py = 'py.png', ny = 'ny.png', pz = 'pz.png', nz = 'nz.png' }
---
---(Where 'p' stands for positive and 'n' stands for negative).
---
---If no `usage` is provided in the options table, LÖVR will guess the `TextureUsage` of the Texture.  The `sample` usage is always included, but if the texture was created without any images then the texture will have the `render` usage as well.
---
---The supported image formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.
---
---If image data is provided, mipmaps will be generated for any missing mipmap levels.
---
---@param images {string | Blob | Image} A table of filenames or Images to load into the Texture.
---@param options {type: TextureType, format: TextureFormat, linear: boolean, samples: number, mipmaps: boolean | number, usage: {TextureUsage}, label: string} Texture options.
---@return Texture texture The new Texture.
function lovr.graphics.newTexture(images, options) end

---Creates a new Texture view.  A texture view does not store any pixels on its own, but instead uses the pixel data of a "parent" Texture object.  The width, height, format, sample count, and usage flags all match the parent.  The view may have a different `TextureType`, and it may reference a subset of the parent texture's layers and mipmap levels.
---
---Texture views are used for:
---
---- Reinterpretation of texture contents.  For example, a cubemap can be treated as an array
---  texture.
---- Rendering to a particular array layer or mipmap level of a texture.
---- Binding a particular range of layers or mipmap levels to a shader.
---
---@param parent Texture The parent Texture to create a view of.
---@param options {type: TextureType, layer: number, layercount: number, mipmap: number, mipmapcount: number, label: string} Options for the texture view.
---@return Texture view The new texture view.
function lovr.graphics.newTextureView(parent, options) end

---Presents the window texture to the desktop window.  This function is called automatically by the default implementation of `lovr.run`, so it normally does not need to be called.
---
---#### Notes:
---
---This should be called after submitting the window pass (`lovr.graphics.getWindowPass`).  If the window texture has not been rendered to since the last present, this function does nothing.
---
function lovr.graphics.present() end

---Changes the global background color.  The textures in a render pass will be cleared to this color at the beginning of the pass if no other clear option is specified.  Additionally, the headset and window will be cleared to this color before rendering.
---
---#### Notes:
---
---Setting the background color in `lovr.draw` will apply on the following frame, since the default pass is cleared before `lovr.draw` is called.
---
---Internally, this color is applied to the default pass objects when retrieving one of them using `lovr.headset.getPass` or `lovr.graphics.getWindowPass`.  Both are called automatically by the default `lovr.run` implementation.
---
---Using the background color to clear the display is expected to be more efficient than manually clearing after a render pass begins, especially on mobile GPUs.
---
---@param r number The red component of the background color.
---@param g number The green component of the background color.
---@param b number The blue component of the background color.
---@param a? number The alpha component of the background color.
function lovr.graphics.setBackgroundColor(r, g, b, a) end

---Changes the global background color.  The textures in a render pass will be cleared to this color at the beginning of the pass if no other clear option is specified.  Additionally, the headset and window will be cleared to this color before rendering.
---
---#### Notes:
---
---Setting the background color in `lovr.draw` will apply on the following frame, since the default pass is cleared before `lovr.draw` is called.
---
---Internally, this color is applied to the default pass objects when retrieving one of them using `lovr.headset.getPass` or `lovr.graphics.getWindowPass`.  Both are called automatically by the default `lovr.run` implementation.
---
---Using the background color to clear the display is expected to be more efficient than manually clearing after a render pass begins, especially on mobile GPUs.
---
---@param hex number A hexcode (like `0xffffff`) to use for the background color (does not support alpha).
---@param a? number The alpha component of the background color.
function lovr.graphics.setBackgroundColor(hex, a) end

---Changes the global background color.  The textures in a render pass will be cleared to this color at the beginning of the pass if no other clear option is specified.  Additionally, the headset and window will be cleared to this color before rendering.
---
---#### Notes:
---
---Setting the background color in `lovr.draw` will apply on the following frame, since the default pass is cleared before `lovr.draw` is called.
---
---Internally, this color is applied to the default pass objects when retrieving one of them using `lovr.headset.getPass` or `lovr.graphics.getWindowPass`.  Both are called automatically by the default `lovr.run` implementation.
---
---Using the background color to clear the display is expected to be more efficient than manually clearing after a render pass begins, especially on mobile GPUs.
---
---@param table {number} A table containing 3 or 4 color components.
function lovr.graphics.setBackgroundColor(table) end

---Enables or disables timing stats.  When enabled, `Pass:getStats` will return `submitTime` and `gpuTime` durations.  Timing is enabled by default when `t.graphics.debug` is set in `lovr.conf`.  Timing has a small amount of overhead, so it should only be enabled when needed.
---
---@param enable boolean Whether timing should be enabled.
function lovr.graphics.setTimingEnabled(enable) end

---Submits work to the GPU.
---
---#### Notes:
---
---The submitted `Pass` objects will run in the order specified.  Commands within a single Pass do not have any ordering guarantees.
---
---Submitting work to the GPU is not thread safe.  No other `lovr.graphics` or `Pass` functions may run at the same time as `lovr.graphics.submit`.
---
---Calling this function will invalidate any temporary buffers or passes that were created during the frame.
---
---Submitting work to the GPU is a relatively expensive operation.  It's a good idea to batch all `Pass` objects into 1 submission if possible, unless there's a good reason not to.  One such reason would be that the frame has so much work that some of it needs to be submitted early to prevent the GPU from running out of things to do.  Another would be for `Readback` objects.
---
---By default, this function is called with the default pass at the end of `lovr.draw` and `lovr.mirror`.
---
---It is valid to submit zero passes.  This will send an empty batch of work to the GPU.
---
---@param ... Pass | boolean | nil The pass objects to submit.  Falsy values will be skipped.
---@return boolean true Always returns true, for convenience when returning from `lovr.draw`.
function lovr.graphics.submit(...) end

---Submits work to the GPU.
---
---#### Notes:
---
---The submitted `Pass` objects will run in the order specified.  Commands within a single Pass do not have any ordering guarantees.
---
---Submitting work to the GPU is not thread safe.  No other `lovr.graphics` or `Pass` functions may run at the same time as `lovr.graphics.submit`.
---
---Calling this function will invalidate any temporary buffers or passes that were created during the frame.
---
---Submitting work to the GPU is a relatively expensive operation.  It's a good idea to batch all `Pass` objects into 1 submission if possible, unless there's a good reason not to.  One such reason would be that the frame has so much work that some of it needs to be submitted early to prevent the GPU from running out of things to do.  Another would be for `Readback` objects.
---
---By default, this function is called with the default pass at the end of `lovr.draw` and `lovr.mirror`.
---
---It is valid to submit zero passes.  This will send an empty batch of work to the GPU.
---
---@param t {Pass | boolean} A table of passes to submit.  Falsy values will be skipped.
---@return boolean true Always returns true, for convenience when returning from `lovr.draw`.
function lovr.graphics.submit(t) end

---Waits for all submitted GPU work to finish.  A normal application that is trying to render graphics at a high framerate should never use this function, since waiting like this prevents the CPU from doing other useful work.  Otherwise, reasons to use this function might be for debugging or to force a `Readback` to finish immediately.
---
function lovr.graphics.wait() end

---A Buffer is a block of memory on the GPU.  It's like a GPU version of a `Blob`.  Lua code can write data to the buffer which uploads to VRAM, and shaders read buffer data during rendering. Compute shaders can also write to buffers.
---
---The **size** of a Buffer is the number of bytes of VRAM it occupies.  It's set when the Buffer is created and can't be changed afterwards.
---
---Buffers can optionally have a **format**, which defines the type of data stored in the buffer. The format determines how Lua values are converted into binary.  Like the size, it can't change after the buffer is created.  `Shader:getBufferFormat` returns the format of a variable in a `Shader`.
---
---When a Buffer has a format, it also has a **length**, which is the number of items it holds, and a **stride**, which is the number of bytes between each item.
---
---`Buffer:setData` is used to upload data to the Buffer.  `Buffer:clear` can also be used to efficiently zero out a Buffer.
---
---`Buffer:getData` can be used to download data from the Buffer, but be aware that it stalls the GPU until the download is complete, which is very slow!  `Buffer:newReadback` will instead download the data in the background, which avoids costly stalls.
---
---Buffers are often used for mesh data.  Vertices stored in buffers can be drawn using `Pass:mesh`.  `Mesh` objects can also be used, which wrap Buffers along with some extra metadata.
---
---Buffers can be "bound" to a variable in a Shader using `Pass:send`.  That means that the next time the shader runs, the data from the Buffer will be used for the stuff in the variable.
---
---It's important to understand that data from a Buffer will only be used at the point when graphics commands are actually submitted.  This example records 2 draws, changing the buffer data between each one:
---
---    buffer:setData(data1)
---    pass:mesh(buffer)
---    buffer:setData(data2)
---    pass:mesh(buffer)
---    lovr.graphics.submit(pass)
---
---**Both** draws will use `data2` here!  That's because `lovr.graphics.submit` is where the draws actually get processed, so they both see the "final" state of the buffer.  The data in a Buffer can't be 2 things at once!  If you need multiple versions of data, it's best to use a bigger buffer with offsets (or multiple buffers).
---@class Buffer
local Buffer = {}

---Clears a range of data in the Buffer to a value.
---
---@param offset? number The offset of the range of the Buffer to clear, in bytes.  Must be a multiple of 4.
---@param extent? number The number of bytes to clear.  If `nil`, clears to the end of the Buffer.  Must be a multiple of 4.
---@param value? number The value to clear to.  This will be interpreted as a 32 bit number, which will be repeated across the clear range.
function Buffer:clear(offset, extent, value) end

---Downloads the Buffer's data from VRAM and returns it as a table.
---
---#### Notes:
---
---This function is very slow, because it stalls the CPU until the data has finished downloading from the GPU.  The stall can be avoided be calling this function in a task, which will put the task to sleep until the data is ready.  See `lovr.task` for more details.
---
---The length of the table will equal the number of items read.  Here are some examples of how the table is formatted:
---
---    buffer = lovr.graphics.newBuffer('int', { 7 })
---    buffer:getData() --> returns { 7 }
---
---    buffer = lovr.graphics.newBuffer('vec3', { 7, 8, 9 })
---    buffer:getData() --> returns {{ 7, 8, 9 }}
---
---    buffer = lovr.graphics.newBuffer('int', { 1, 2, 3 })
---    buffer:getData() --> returns { 1, 2, 3 }
---
---    buffer = lovr.graphics.newBuffer({ 'vec2', 'vec2' }, {
---      vec2(1,2), vec2(3,4),
---      vec2(5,6), vec2(7,8)
---    })
---    buffer:getData() --> returns { { 1, 2, 3, 4 }, { 5, 6, 7, 8 } }
---
---    buffer = lovr.graphics.newBuffer({
---      { 'a', 'float' },
---      { 'b', 'float' }
---    }, { a = 1, b = 2 })
---    buffer:getData() --> returns { { 1, 2 } }
---
---    buffer = lovr.graphics.newBuffer({
---      { 'x', 'int', 3 }
---    }, { x = { 1, 2, 3 } })
---    buffer:getData() --> returns { { x = { 1, 2, 3 } } }
---
---    buffer = lovr.graphics.newBuffer({
---      { 'lights', {
---        { 'pos', 'vec3' },
---        { 'size', 'float' },
---      }, 10}
---    }, data)
---    buffer:getData() --> returns { { lights = { { pos = ..., size = ... }, ... } } }
---
---In summary, each individual item is wrapped in a table, except if the format is a single number. If the format has nested types or arrays then the tables will be key-value, otherwise they will use numeric keys.
---
---@param index? number The index of the first item to read.
---@param count? number The number of items to read.  If nil, reads the remainder of the buffer.
---@return table t The table with the Buffer's data.
function Buffer:getData(index, count) end

---Returns the format the Buffer was created with.
---
---#### Example:
---
---```lua
---function lovr.load()
---  buffer = lovr.graphics.newBuffer({
---    { 'a', 'float' },
---    { 'b', 'un16x2' }
---  })
---
---  for i, field in ipairs(buffer:getFormat()) do
---    print(('%s: %s'):format(field.name, field.type))
---  end
---
---  -- prints the following:
---  -- a: f32
---  -- b: un16x2
---end
---```
---
---@return table format A list of fields comprising the format.
function Buffer:getFormat() end

---Returns the length of the Buffer, or `nil` if the Buffer was not created with a format.
---
---@return number length The length of the Buffer.
function Buffer:getLength() end

---Returns the size of the Buffer in VRAM, in bytes.  This is the same as `length * stride`.
---
---The size of the Buffer can't change after it's created.
---
---@return number size The size of the Buffer, in bytes.
function Buffer:getSize() end

---Returns the distance between each item in the Buffer, in bytes, or `nil` if the Buffer was not created with a format.
---
---#### Notes:
---
---When a Buffer is created, the stride can be set explicitly, otherwise it will be automatically computed based on the fields in the Buffer.
---
---Strides can not be zero, and can not be smaller than the size of a single item.
---
---@return number stride The stride of the Buffer, in bytes.
function Buffer:getStride() end

---Downloads the Buffer's data from VRAM and returns it as a `Blob`.  This is similar to `Buffer:getData`, but returns a `Blob` instead of a table.
---
---#### Notes:
---
---This function is very slow, because it stalls the CPU until the data has finished downloading from the GPU.  The stall can be avoided be calling this function in a task, which will put the task to sleep until the data is ready.  See `lovr.task` for more details.
---
---@param offset? number An offset in the Buffer to read from, in bytes.
---@param extent? number The number of bytes to read.  If nil, reads the remainder of the buffer.
---@return Blob blob A new Blob with the Buffer's data.
function Buffer:newBlob(offset, extent) end

---Creates and returns a new `Readback` that will download the data in the Buffer from VRAM. Once the readback is complete, `Readback:getData` returns the data as a table, or `Readback:getBlob` returns the data as a `Blob`.
---
---#### Notes:
---
---The offset and extent arguments must be a multiple of the Buffer's stride (unless it was created without a format).
---
---@param offset? number A byte offset to read from.
---@param extent? number The number of bytes to read.  If nil, reads the rest of the buffer.
---@return Readback readback A new Readback object.
function Buffer:newReadback(offset, extent) end

---Copies data to the Buffer from either a table, `Blob`, or `Buffer`.
---
---#### Notes:
---
---One gotcha is that unspecified fields will be set to zero.  Here's an example:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }})
---    buffer:setData({ x = 1, y = 1 }) -- set the data
---    buffer:setData({ x = 1 }) -- set the data, partially
---    -- buffer data is now {x=1, y=0}!
---
---This doesn't apply to separate items in the buffer.  For example, if the Buffer's length is 2 and only the 1st item is set, the second item will remain undisturbed:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }}, 2)
---    buffer:setData({{ x = 1, y = 1 }, { x = 2, y = 2 }}) -- set the data
---    buffer:setData({{ x = 1 }}) -- set one item, partially
---    -- buffer data is now {{x=1, y=0}, {x=2, y=2}}
---
---#### Example:
---
---Various examples of copying different formats.
---
---```lua
---function lovr.load()
---  buffer = lovr.graphics.newBuffer('int', 3)
---  buffer:setData({ 1, 2, 3 })
---
---  buffer = lovr.graphics.newBuffer('vec3', 2)
---  buffer:setData({ 1,2,3, 4,5,6 })
---  buffer:setData({ { 1, 2, 3 }, { 4, 5, 6 } })
---  buffer:setData({ vec3(1, 2, 3), vec3(4, 5, 6) })
---
---  -- When the Buffer's length is 1, wrapping in table is optional:
---  buffer = lovr.graphics.newBuffer('vec3')
---  buffer:setData(1, 2, 3)
---  buffer:setData(vec3(1, 2, 3))
---
---  -- Same for key-value structs
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  })
---  buffer:setData({ x = 1, y = 2 })
---
---  -- Key/value formats
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  }, 3)
---  buffer:setData({
---    { x = 1, y = 2 },
---    { x = 3, y = 4 },
---    { x = 5, y = 6 }
---  })
---  buffer:setData({ 1, 2, 3, 4, 5, 6 })
---  buffer:setData({ { 1, 2 }, { 3, 4 }, { 5, 6 } })
---
---  -- Nested formats
---  buffer = lovr.graphics.newBuffer({
---    { 'a', {
---      {'b', {
---        'c', 'float'
---      }}
---    }}
---  })
---  buffer:setData({ a = { b = { c = 42 } } })
---
---  -- Inner arrays
---  buffer = lovr.graphics.newBuffer({
---    { 'positions', 'vec3', 10 },
---    { 'sizes', 'float', 10 },
---    layout = 'std140'
---  })
---  local data = { positions = {}, sizes = {} }
---  for i = 1, buffer:getLength() do
---    data.positions[i] = vec3(i, i, i)
---    data.sizes[i] = i
---  end
---  buffer:setData(data)
---end
---```
---
---@param table table A flat or nested table of items to copy to the Buffer (see notes for format).
---@param destinationIndex? number The index of the first value in the Buffer to update.
---@param sourceIndex? number The index in the table to copy from.
---@param count? number The number of items to copy.  `nil` will copy as many items as possible, based on the lengths of the source and destination.
function Buffer:setData(table, destinationIndex, sourceIndex, count) end

---Copies data to the Buffer from either a table, `Blob`, or `Buffer`.
---
---#### Notes:
---
---One gotcha is that unspecified fields will be set to zero.  Here's an example:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }})
---    buffer:setData({ x = 1, y = 1 }) -- set the data
---    buffer:setData({ x = 1 }) -- set the data, partially
---    -- buffer data is now {x=1, y=0}!
---
---This doesn't apply to separate items in the buffer.  For example, if the Buffer's length is 2 and only the 1st item is set, the second item will remain undisturbed:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }}, 2)
---    buffer:setData({{ x = 1, y = 1 }, { x = 2, y = 2 }}) -- set the data
---    buffer:setData({{ x = 1 }}) -- set one item, partially
---    -- buffer data is now {{x=1, y=0}, {x=2, y=2}}
---
---#### Example:
---
---Various examples of copying different formats.
---
---```lua
---function lovr.load()
---  buffer = lovr.graphics.newBuffer('int', 3)
---  buffer:setData({ 1, 2, 3 })
---
---  buffer = lovr.graphics.newBuffer('vec3', 2)
---  buffer:setData({ 1,2,3, 4,5,6 })
---  buffer:setData({ { 1, 2, 3 }, { 4, 5, 6 } })
---  buffer:setData({ vec3(1, 2, 3), vec3(4, 5, 6) })
---
---  -- When the Buffer's length is 1, wrapping in table is optional:
---  buffer = lovr.graphics.newBuffer('vec3')
---  buffer:setData(1, 2, 3)
---  buffer:setData(vec3(1, 2, 3))
---
---  -- Same for key-value structs
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  })
---  buffer:setData({ x = 1, y = 2 })
---
---  -- Key/value formats
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  }, 3)
---  buffer:setData({
---    { x = 1, y = 2 },
---    { x = 3, y = 4 },
---    { x = 5, y = 6 }
---  })
---  buffer:setData({ 1, 2, 3, 4, 5, 6 })
---  buffer:setData({ { 1, 2 }, { 3, 4 }, { 5, 6 } })
---
---  -- Nested formats
---  buffer = lovr.graphics.newBuffer({
---    { 'a', {
---      {'b', {
---        'c', 'float'
---      }}
---    }}
---  })
---  buffer:setData({ a = { b = { c = 42 } } })
---
---  -- Inner arrays
---  buffer = lovr.graphics.newBuffer({
---    { 'positions', 'vec3', 10 },
---    { 'sizes', 'float', 10 },
---    layout = 'std140'
---  })
---  local data = { positions = {}, sizes = {} }
---  for i = 1, buffer:getLength() do
---    data.positions[i] = vec3(i, i, i)
---    data.sizes[i] = i
---  end
---  buffer:setData(data)
---end
---```
---
---@param ... number Numerical components to copy to the buffer.
function Buffer:setData(...) end

---Copies data to the Buffer from either a table, `Blob`, or `Buffer`.
---
---#### Notes:
---
---One gotcha is that unspecified fields will be set to zero.  Here's an example:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }})
---    buffer:setData({ x = 1, y = 1 }) -- set the data
---    buffer:setData({ x = 1 }) -- set the data, partially
---    -- buffer data is now {x=1, y=0}!
---
---This doesn't apply to separate items in the buffer.  For example, if the Buffer's length is 2 and only the 1st item is set, the second item will remain undisturbed:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }}, 2)
---    buffer:setData({{ x = 1, y = 1 }, { x = 2, y = 2 }}) -- set the data
---    buffer:setData({{ x = 1 }}) -- set one item, partially
---    -- buffer data is now {{x=1, y=0}, {x=2, y=2}}
---
---#### Example:
---
---Various examples of copying different formats.
---
---```lua
---function lovr.load()
---  buffer = lovr.graphics.newBuffer('int', 3)
---  buffer:setData({ 1, 2, 3 })
---
---  buffer = lovr.graphics.newBuffer('vec3', 2)
---  buffer:setData({ 1,2,3, 4,5,6 })
---  buffer:setData({ { 1, 2, 3 }, { 4, 5, 6 } })
---  buffer:setData({ vec3(1, 2, 3), vec3(4, 5, 6) })
---
---  -- When the Buffer's length is 1, wrapping in table is optional:
---  buffer = lovr.graphics.newBuffer('vec3')
---  buffer:setData(1, 2, 3)
---  buffer:setData(vec3(1, 2, 3))
---
---  -- Same for key-value structs
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  })
---  buffer:setData({ x = 1, y = 2 })
---
---  -- Key/value formats
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  }, 3)
---  buffer:setData({
---    { x = 1, y = 2 },
---    { x = 3, y = 4 },
---    { x = 5, y = 6 }
---  })
---  buffer:setData({ 1, 2, 3, 4, 5, 6 })
---  buffer:setData({ { 1, 2 }, { 3, 4 }, { 5, 6 } })
---
---  -- Nested formats
---  buffer = lovr.graphics.newBuffer({
---    { 'a', {
---      {'b', {
---        'c', 'float'
---      }}
---    }}
---  })
---  buffer:setData({ a = { b = { c = 42 } } })
---
---  -- Inner arrays
---  buffer = lovr.graphics.newBuffer({
---    { 'positions', 'vec3', 10 },
---    { 'sizes', 'float', 10 },
---    layout = 'std140'
---  })
---  local data = { positions = {}, sizes = {} }
---  for i = 1, buffer:getLength() do
---    data.positions[i] = vec3(i, i, i)
---    data.sizes[i] = i
---  end
---  buffer:setData(data)
---end
---```
---
---@param vector any Vector objects to copy to the buffer.
function Buffer:setData(vector) end

---Copies data to the Buffer from either a table, `Blob`, or `Buffer`.
---
---#### Notes:
---
---One gotcha is that unspecified fields will be set to zero.  Here's an example:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }})
---    buffer:setData({ x = 1, y = 1 }) -- set the data
---    buffer:setData({ x = 1 }) -- set the data, partially
---    -- buffer data is now {x=1, y=0}!
---
---This doesn't apply to separate items in the buffer.  For example, if the Buffer's length is 2 and only the 1st item is set, the second item will remain undisturbed:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }}, 2)
---    buffer:setData({{ x = 1, y = 1 }, { x = 2, y = 2 }}) -- set the data
---    buffer:setData({{ x = 1 }}) -- set one item, partially
---    -- buffer data is now {{x=1, y=0}, {x=2, y=2}}
---
---#### Example:
---
---Various examples of copying different formats.
---
---```lua
---function lovr.load()
---  buffer = lovr.graphics.newBuffer('int', 3)
---  buffer:setData({ 1, 2, 3 })
---
---  buffer = lovr.graphics.newBuffer('vec3', 2)
---  buffer:setData({ 1,2,3, 4,5,6 })
---  buffer:setData({ { 1, 2, 3 }, { 4, 5, 6 } })
---  buffer:setData({ vec3(1, 2, 3), vec3(4, 5, 6) })
---
---  -- When the Buffer's length is 1, wrapping in table is optional:
---  buffer = lovr.graphics.newBuffer('vec3')
---  buffer:setData(1, 2, 3)
---  buffer:setData(vec3(1, 2, 3))
---
---  -- Same for key-value structs
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  })
---  buffer:setData({ x = 1, y = 2 })
---
---  -- Key/value formats
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  }, 3)
---  buffer:setData({
---    { x = 1, y = 2 },
---    { x = 3, y = 4 },
---    { x = 5, y = 6 }
---  })
---  buffer:setData({ 1, 2, 3, 4, 5, 6 })
---  buffer:setData({ { 1, 2 }, { 3, 4 }, { 5, 6 } })
---
---  -- Nested formats
---  buffer = lovr.graphics.newBuffer({
---    { 'a', {
---      {'b', {
---        'c', 'float'
---      }}
---    }}
---  })
---  buffer:setData({ a = { b = { c = 42 } } })
---
---  -- Inner arrays
---  buffer = lovr.graphics.newBuffer({
---    { 'positions', 'vec3', 10 },
---    { 'sizes', 'float', 10 },
---    layout = 'std140'
---  })
---  local data = { positions = {}, sizes = {} }
---  for i = 1, buffer:getLength() do
---    data.positions[i] = vec3(i, i, i)
---    data.sizes[i] = i
---  end
---  buffer:setData(data)
---end
---```
---
---@param blob Blob The Blob to copy data from.
---@param destinationOffset? number The byte offset to copy to.
---@param sourceOffset? number The byte offset to copy from.
---@param size? number The number of bytes to copy.  If nil, copies as many bytes as possible.
function Buffer:setData(blob, destinationOffset, sourceOffset, size) end

---Copies data to the Buffer from either a table, `Blob`, or `Buffer`.
---
---#### Notes:
---
---One gotcha is that unspecified fields will be set to zero.  Here's an example:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }})
---    buffer:setData({ x = 1, y = 1 }) -- set the data
---    buffer:setData({ x = 1 }) -- set the data, partially
---    -- buffer data is now {x=1, y=0}!
---
---This doesn't apply to separate items in the buffer.  For example, if the Buffer's length is 2 and only the 1st item is set, the second item will remain undisturbed:
---
---    buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'int' }}, 2)
---    buffer:setData({{ x = 1, y = 1 }, { x = 2, y = 2 }}) -- set the data
---    buffer:setData({{ x = 1 }}) -- set one item, partially
---    -- buffer data is now {{x=1, y=0}, {x=2, y=2}}
---
---#### Example:
---
---Various examples of copying different formats.
---
---```lua
---function lovr.load()
---  buffer = lovr.graphics.newBuffer('int', 3)
---  buffer:setData({ 1, 2, 3 })
---
---  buffer = lovr.graphics.newBuffer('vec3', 2)
---  buffer:setData({ 1,2,3, 4,5,6 })
---  buffer:setData({ { 1, 2, 3 }, { 4, 5, 6 } })
---  buffer:setData({ vec3(1, 2, 3), vec3(4, 5, 6) })
---
---  -- When the Buffer's length is 1, wrapping in table is optional:
---  buffer = lovr.graphics.newBuffer('vec3')
---  buffer:setData(1, 2, 3)
---  buffer:setData(vec3(1, 2, 3))
---
---  -- Same for key-value structs
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  })
---  buffer:setData({ x = 1, y = 2 })
---
---  -- Key/value formats
---  buffer = lovr.graphics.newBuffer({
---    { 'x', 'float' },
---    { 'y', 'float' }
---  }, 3)
---  buffer:setData({
---    { x = 1, y = 2 },
---    { x = 3, y = 4 },
---    { x = 5, y = 6 }
---  })
---  buffer:setData({ 1, 2, 3, 4, 5, 6 })
---  buffer:setData({ { 1, 2 }, { 3, 4 }, { 5, 6 } })
---
---  -- Nested formats
---  buffer = lovr.graphics.newBuffer({
---    { 'a', {
---      {'b', {
---        'c', 'float'
---      }}
---    }}
---  })
---  buffer:setData({ a = { b = { c = 42 } } })
---
---  -- Inner arrays
---  buffer = lovr.graphics.newBuffer({
---    { 'positions', 'vec3', 10 },
---    { 'sizes', 'float', 10 },
---    layout = 'std140'
---  })
---  local data = { positions = {}, sizes = {} }
---  for i = 1, buffer:getLength() do
---    data.positions[i] = vec3(i, i, i)
---    data.sizes[i] = i
---  end
---  buffer:setData(data)
---end
---```
---
---@param buffer Buffer The Buffer to copy data from.
---@param destinationOffset? number The byte offset to copy to.
---@param sourceOffset? number The byte offset to copy from.
---@param size? number The number of bytes to copy.  If nil, copies as many bytes as possible.
function Buffer:setData(buffer, destinationOffset, sourceOffset, size) end

---Font objects are used to render text with `Pass:text`.  The active font can be changed using `Pass:setFont`.  The default font is Varela Round, which is used when no font is active, and can be retrieved using `lovr.graphics.getDefaultFont`.  Custom fonts can be loaded from TTF and BMFont files using `lovr.graphics.newFont`.
---
---Each Font uses a `Rasterizer` to load the font and create images for each glyph. As text is drawn, the Font uploads images from the Rasterizer to a GPU texture atlas as needed.  The Font also performs text layout and mesh generation for strings of text.
---
---For TTF fonts, LÖVR uses a text rendering technique called "multichannel signed distance fields" (MSDF), which makes the font rendering remain crisp when text is viewed up close.
---@class Font
local Font = {}

---Returns the ascent of the font.  The ascent is the maximum amount glyphs ascend above the baseline.  The units depend on the font's pixel density.  With the default density, the units correspond to meters.
---
---@return number ascent The ascent of the font.
function Font:getAscent() end

---Returns the descent of the font.  The descent is the maximum amount glyphs descend below the baseline.  The units depend on the font's pixel density.  With the default density, the units correspond to meters.
---
---@return number descent The descent of the font.
function Font:getDescent() end

---Returns the height of the font, sometimes also called the leading.  This is the full height of a line of text, including the space between lines.  Each line of a multiline string is separated on the y axis by this height, multiplied by the font's line spacing.  The units depend on the font's pixel density.  With the default density, the units correspond to meters.
---
---@return number height The height of the font.
function Font:getHeight() end

---Returns the kerning between 2 glyphs.  Kerning is a slight horizontal adjustment between 2 glyphs to improve the visual appearance.  It will often be negative.  The units depend on the font's pixel density.  With the default density, the units correspond to meters.
---
---@param first string | number The first character or codepoint.
---@param second string | number The second character or codepoint.
---@return number keming The kerning between the two glyphs.
function Font:getKerning(first, second) end

---Returns the line spacing of the Font.  When spacing out lines, the height of the font is multiplied the line spacing to get the final spacing value.  The default is 1.0.
---
---@return number spacing The line spacing of the font.
function Font:getLineSpacing() end

---Returns a table of wrapped lines for a piece of text, given a line length limit.
---
---By default the units for `limit` are in meters.  If text is being drawn with scale applied, make sure the scale is also applied to the `limit`.
---
---#### Notes:
---
---The font's pixel density is incorporated into the limit.  So if the font's pixel density is changed to 1 (changing the font's units to pixels), the `limit` will be in pixels as well.
---
---@param string string The text to wrap.
---@param wrap number The line length to wrap at.
---@return {string} lines A table of strings, one for each wrapped line.
function Font:getLines(string, wrap) end

---Returns a table of wrapped lines for a piece of text, given a line length limit.
---
---By default the units for `limit` are in meters.  If text is being drawn with scale applied, make sure the scale is also applied to the `limit`.
---
---#### Notes:
---
---The font's pixel density is incorporated into the limit.  So if the font's pixel density is changed to 1 (changing the font's units to pixels), the `limit` will be in pixels as well.
---
---@param strings table A table of multicolor strings to wrap.  The colors aren't used for anything, this just exists to match `Pass:text`.
---@param wrap number The line length to wrap at.
---@return {string} lines A table of strings, one for each wrapped line.
function Font:getLines(strings, wrap) end

---Returns the pixel density of the font.  The density is a "pixels per world unit" factor that controls how the pixels in the font's texture are mapped to units in the coordinate space.
---
---The default pixel density is set to the height of the font.  This means that lines of text rendered with a scale of 1.0 come out to 1 unit (meter) tall.  However, if this font was drawn to a 2D texture where the units are in pixels, the font would still be drawn 1 unit (pixel) tall!  Scaling the coordinate space or the size of the text by the height of the font would fix this.  However, a more convenient option is to set the pixel density of the font to 1.0 when doing 2D rendering to make the font's size match up with the pixels of the canvas.
---
---@return number density The pixel density of the font.
function Font:getPixelDensity() end

---Returns the Rasterizer object backing the Font.
---
---@return Rasterizer rasterizer The Rasterizer.
function Font:getRasterizer() end

---Returns a table of vertices for a piece of text, along with a Material to use when rendering it. The Material returned by this function may not be the same if the Font's texture atlas needs to be recreated with a bigger size to make room for more glyphs.
---
---#### Notes:
---
---Each vertex is a table of 4 floating point numbers with the following data:
---
---    { x, y, u, v }
---
---These could be placed in a vertex buffer using the following buffer format:
---
---    {
---      { 'VertexPosition', 'vec2' },
---      { 'VertexUV', 'vec2' }
---    }
---
---@param string string The text to render.
---@param wrap? number The maximum line length.  The units depend on the pixel density of the font, but are in meters by default.
---@param halign HorizontalAlign The horizontal align.
---@param valign VerticalAlign The vertical align.
---@return {number} vertices The table of vertices.  See below for the format of each vertex.
---@return Material material A Material to use when rendering the vertices.
function Font:getVertices(string, wrap, halign, valign) end

---Returns a table of vertices for a piece of text, along with a Material to use when rendering it. The Material returned by this function may not be the same if the Font's texture atlas needs to be recreated with a bigger size to make room for more glyphs.
---
---#### Notes:
---
---Each vertex is a table of 4 floating point numbers with the following data:
---
---    { x, y, u, v }
---
---These could be placed in a vertex buffer using the following buffer format:
---
---    {
---      { 'VertexPosition', 'vec2' },
---      { 'VertexUV', 'vec2' }
---    }
---
---@param strings table A table of multicolor strings.  The colors aren't used for anything, this just exists to match `Pass:text`.
---@param wrap? number The maximum line length.  The units depend on the pixel density of the font, but are in meters by default.
---@param halign HorizontalAlign The horizontal align.
---@param valign VerticalAlign The vertical align.
---@return {number} vertices The table of vertices.  See below for the format of each vertex.
---@return Material material A Material to use when rendering the vertices.
function Font:getVertices(strings, wrap, halign, valign) end

---Returns the maximum width of a piece of text.  This function does not perform wrapping but does respect newlines in the text.
---
---@param string string The text to measure.
---@return number width The maximum width of the text.
function Font:getWidth(string) end

---Returns the maximum width of a piece of text.  This function does not perform wrapping but does respect newlines in the text.
---
---@param strings table A table of multicolor strings to measure.  The colors aren't used for anything, this just exists to match `Pass:text`.
---@return number width The maximum width of the text.
function Font:getWidth(strings) end

---Sets the line spacing of the Font.  When spacing out lines, the height of the font is multiplied by the line spacing to get the final spacing value.  The default is 1.0.
---
---@param spacing number The new line spacing.
function Font:setLineSpacing(spacing) end

---Sets the pixel density of the font.  The density is a "pixels per world unit" factor that controls how the pixels in the font's texture are mapped to units in the coordinate space.
---
---The default pixel density is set to the height of the font.  This means that lines of text rendered with a scale of 1.0 come out to 1 unit (meter) tall.  However, if this font was drawn to a 2D texture where the units are in pixels, the font would still be drawn 1 unit (pixel) tall!  Scaling the coordinate space or the size of the text by the height of the font would fix this.  However, a more convenient option is to set the pixel density of the font to 1.0 when doing 2D rendering to make the font's size match up with the pixels of the canvas.
---
---@param density number The new pixel density of the font.
function Font:setPixelDensity(density) end

---Sets the pixel density of the font.  The density is a "pixels per world unit" factor that controls how the pixels in the font's texture are mapped to units in the coordinate space.
---
---The default pixel density is set to the height of the font.  This means that lines of text rendered with a scale of 1.0 come out to 1 unit (meter) tall.  However, if this font was drawn to a 2D texture where the units are in pixels, the font would still be drawn 1 unit (pixel) tall!  Scaling the coordinate space or the size of the text by the height of the font would fix this.  However, a more convenient option is to set the pixel density of the font to 1.0 when doing 2D rendering to make the font's size match up with the pixels of the canvas.
---
function Font:setPixelDensity() end

---Materials are a set of properties and textures that define the properties of a surface, like what color it is, how bumpy or shiny it is, etc. `Shader` code can use the data from a material to compute lighting.
---
---Materials are immutable, and can't be changed after they are created.  Instead, a new Material should be created with the updated properties.
---
---`Pass:setMaterial` changes the active material, causing it to affect rendering until the active material is changed again.
---
---Using material objects is optional.  `Pass:setMaterial` can take a `Texture`, and `Pass:setColor` can change the color of objects, so basic tinting and texturing of surfaces does not require a full material to be created.  Also, a custom material system could be developed by sending textures and other data to shaders manually.
---
---`Model` objects will create materials for all of the materials defined in the model file.
---
---In shader code, non-texture material properties can be accessed as `Material.<property>`, and material textures can be accessed as `<Type>Texture`, e.g. `RoughnessTexture`.
---@class Material
local Material = {}

---Returns the properties of the Material in a table.
---
---@return table properties The Material properties.
function Material:getProperties() end

---Meshes store arbitrary geometry data, and can be drawn with `Pass:draw`.
---
---Meshes hold a list of **vertices**.  The number of vertices is declared upfront when the Mesh is created, and it can not be resized afterwards.
---
---The Mesh has a **vertex format**, which is a set of **attributes** comprising each vertex, like a `position`, `color`, etc.
---
---The **vertex indices** in the Mesh describe the order that the vertices are rendered in.  This is an optimization that allows vertices to be reused if they are used for multiple triangles, without duplicating all of their data.
---
---The Mesh has a **draw mode**, which controls how the vertices are connected together to create pixels.  It can either be `points`, `lines`, or `triangles`.
---
---The Mesh can have a `Material` applied, which defines colors, textures, and other properties of its surface.
---
---The **draw range** of the Mesh defines a subset of the vertices to render when the Mesh is drawn.
---
---The **bounding box** of the Mesh allows LÖVR to skip rendering it when it's out of view.
---@class Mesh
local Mesh = {}

---Rebuilds raytracing data for the Mesh.
---
---The first time a Mesh is added to a Raytracer with `Raytracer:add`, it computes raytracing data for its vertices automatically.  However, if the Mesh vertices change later, this raytracing data will be out of date.  This function is used to rebuild the raytracing data.  Afterwards, `Raytracer:build` also needs to be called on any `Raytracer` objects holding the Mesh.
---
function Mesh:buildRaytracer() end

---Computes the axis-aligned bounding box of the Mesh from its vertices.
---
---If the Mesh was created with the `gpu` storage mode, this function will do nothing and return `false`.
---
---If the Mesh does not have an attribute named `VertexPosition` with the `f32x3` (aka `vec3`) type, this function will do nothing and return `false`.
---
---Otherwise, the bounding box will be set and the return value will be `true`.
---
---The bounding box can also be assigned manually using `Mesh:setBoundingBox`, which can be used to set the bounding box on a `gpu` mesh or for cases where the bounding box is already known.
---
---Passes will use the bounding box of a Mesh to cull it against the cameras when `Pass:setViewCull` is enabled, which avoids rendering it when it's out of view.
---
---@return boolean updated Whether the bounding box was updated.
function Mesh:computeBoundingBox() end

---Returns the base vertex of the Mesh.  This is an offset added to index buffer values before reading the vertex from the vertex buffer.
---
---Adjusting the base vertex is useful for storing multiple indexed meshes in a single Mesh object. Rather than manually offsetting all of the index buffer values to account for the offset where each sub-mesh is stored, the base vertex can be changed instead.
---
---@return number offset The offset applied to values in the index buffer during drawing.
function Mesh:getBaseVertex() end

---Returns the axis-aligned bounding box of the Mesh, or `nil` if the Mesh doesn't have a bounding box.
---
---Meshes with the `cpu` storage mode can compute their bounding box automatically using `Mesh:computeBoundingBox`.  The bounding box can also be set manually using `Mesh:setBoundingBox`.
---
---Passes will use the bounding box of a Mesh to cull it against the cameras when `Pass:setViewCull` is enabled, which avoids rendering it when it's out of view.
---
---@return number minx The minimum x coordinate of the bounding box.
---@return number maxx The maximum x coordinate of the bounding box.
---@return number miny The minimum y coordinate of the bounding box.
---@return number maxy The maximum y coordinate of the bounding box.
---@return number minz The minimum z coordinate of the bounding box.
---@return number maxz The maximum z coordinate of the bounding box.
function Mesh:getBoundingBox() end

---Returns the `DrawMode` of the mesh, which controls how the vertices in the Mesh are connected together to create pixels.  The default is `triangles`.
---
---@return DrawMode mode The current draw mode.
function Mesh:getDrawMode() end

---Returns the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a single Mesh object, the draw range can be used to select different sets of vertices to render.
---
---@return number start The index of the first vertex that will be drawn (or the first index, if the Mesh has vertex indices).
---@return number count The number of vertices that will be drawn (or indices, if the Mesh has vertex indices).
---@return number offset When the Mesh has vertex indices, an offset that will be added to the index values before fetching the corresponding vertex.  This is ignored if the Mesh does not have vertex indices.
function Mesh:getDrawRange() end

---Returns the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a single Mesh object, the draw range can be used to select different sets of vertices to render.
---
function Mesh:getDrawRange() end

---Returns the `Buffer` object that holds the data for the vertex indices in the Mesh.
---
---This can be `nil` if the Mesh doesn't have any indices.
---
---If a Mesh uses the `cpu` storage mode, the index buffer is internal to the `Mesh` and this function will return `nil`.  This ensures that the CPU data for the Mesh does not get out of sync with the GPU data in the Buffer.
---
---@return Buffer buffer The index buffer.
function Mesh:getIndexBuffer() end

---Returns a table with the Mesh's vertex indices.
---
---#### Notes:
---
---This function returns `nil` if the mesh was created with `gpu` storage.
---
---@return {number} t A table of numbers with the 1-based vertex indices.
function Mesh:getIndices() end

---Returns the `Material` applied to the Mesh.
---
---@return Material material The material.
function Mesh:getMaterial() end

---Returns the `Buffer` object that holds the data for the vertices in the Mesh.
---
---If a Mesh uses the `cpu` storage mode, the vertex buffer is internal to the `Mesh` and this function will return `nil`.  This ensures that the CPU data for the Mesh does not get out of sync with the GPU data in the Buffer.
---
---@return Buffer buffer The vertex buffer.
function Mesh:getVertexBuffer() end

---Returns the number of vertices in the Mesh.  The vertex count is set when the Mesh is created and can't change afterwards.
---
---@return number count The number of vertices in the Mesh.
function Mesh:getVertexCount() end

---Returns the vertex format of the Mesh, which is a list of "attributes" that make up the data for each vertex (position, color, UV, etc.).
---
---#### Notes:
---
---If no vertex format is given when the Mesh is created, it will use a default format:
---
---    {
---      { 'VertexPosition', 'vec3', 0 },
---      { 'VertexNormal', 'vec3', 12 },
---      { 'VertexUV', 'vec2', 24 }
---    }
---
---The name of the vertex attribute corresponds to an `in` input variable in a vertex shader.
---
---There are a few built-in attributes that all shaders will understand and use by default:
---
---<table>
---  <thead>
---    <tr>
---      <td>Name</td>
---      <td>Description</td>
---    </tr>
---  </thead>
---  <tbody>
---    <tr>
---      <td><code>VertexPosition</code></td>
---      <td>The position of the vertex.</td>
---    </tr>
---    <tr>
---      <td><code>VertexNormal</code></td>
---      <td>The normal vector of the vertex.</td>
---    </tr>
---    <tr>
---      <td><code>VertexUV</code></td>
---      <td>The texture coordinate of the vertex.</td>
---    </tr>
---    <tr>
---      <td><code>VertexUV2</code></td>
---      <td>The second texture coordinate of the vertex (often used for lightmapping).</td>
---    </tr>
---    <tr>
---      <td><code>VertexColor</code></td>
---      <td>The color of the vertex (linear color space).</td>
---    </tr>
---    <tr>
---      <td><code>VertexTangent</code></td>
---      <td>The tangent vector of the vertex.</td>
---    </tr>
---  </tbody> </table>
---
---See the `Shaders` and `Meshes` guides for more info.
---
---@return table format The vertex format.
function Mesh:getVertexFormat() end

---Returns the stride of the Mesh, which is the number of bytes used by each vertex.
---
---@return number stride The stride of the Mesh, in bytes.
function Mesh:getVertexStride() end

---Returns the vertices in the Mesh.
---
---#### Notes:
---
---This function returns `nil` if the mesh was created with `gpu` storage.
---
---@param index? number The index of the first vertex to return.
---@param count? number The number of vertices to return.  If nil, returns the "rest" of the vertices, based on the `index` argument.
---@return {{number}} vertices A table of vertices.  Each vertex is a table of numbers for each vertex attribute, given by the vertex format of the Mesh.
function Mesh:getVertices(index, count) end

---Sets the base vertex of the Mesh.  This is an offset added to index buffer values before reading the vertex from the vertex buffer.
---
---Adjusting the base vertex is useful for storing multiple indexed meshes in a single Mesh object. Rather than manually offsetting all of the index buffer values to account for the offset where each sub-mesh is stored, the base vertex can be changed instead.
---
---@param offset? number An offset applied to values in the index buffer during drawing.
function Mesh:setBaseVertex(offset) end

---Sets or removes the axis-aligned bounding box of the Mesh.
---
---Meshes with the `cpu` storage mode can compute their bounding box automatically using `Mesh:computeBoundingBox`.
---
---Passes will use the bounding box of a Mesh to cull it against the cameras when `Pass:setViewCull` is enabled, which avoids rendering it when it's out of view.
---
---@param minx number The minimum x coordinate of the bounding box.
---@param maxx number The maximum x coordinate of the bounding box.
---@param miny number The minimum y coordinate of the bounding box.
---@param maxy number The maximum y coordinate of the bounding box.
---@param minz number The minimum z coordinate of the bounding box.
---@param maxz number The maximum z coordinate of the bounding box.
function Mesh:setBoundingBox(minx, maxx, miny, maxy, minz, maxz) end

---Sets or removes the axis-aligned bounding box of the Mesh.
---
---Meshes with the `cpu` storage mode can compute their bounding box automatically using `Mesh:computeBoundingBox`.
---
---Passes will use the bounding box of a Mesh to cull it against the cameras when `Pass:setViewCull` is enabled, which avoids rendering it when it's out of view.
---
function Mesh:setBoundingBox() end

---Changes the `DrawMode` of the mesh, which controls how the vertices in the Mesh are connected together to create pixels.  The default is `triangles`.
---
---@param mode DrawMode The current draw mode.
function Mesh:setDrawMode(mode) end

---Sets the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a single Mesh object, the draw range can be used to select different sets of vertices to render.
---
---#### Notes:
---
---When using an index buffer, the draw range defines a range of indices to render instead of a range of vertices.  Additionally, a vertex offset can be set, which is added to the values in the index buffer before fetching the vertices.  This makes it easier to pack multiple sets of indexed mesh data in a single Mesh object, without having to manually offset the data in each index buffer.
---
---@param start number The index of the first vertex that will be drawn (or the first index, if the Mesh has vertex indices).
---@param count number The number of vertices that will be drawn (or indices, if the Mesh has vertex indices).
function Mesh:setDrawRange(start, count) end

---Sets the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a single Mesh object, the draw range can be used to select different sets of vertices to render.
---
---#### Notes:
---
---When using an index buffer, the draw range defines a range of indices to render instead of a range of vertices.  Additionally, a vertex offset can be set, which is added to the values in the index buffer before fetching the vertices.  This makes it easier to pack multiple sets of indexed mesh data in a single Mesh object, without having to manually offset the data in each index buffer.
---
---@param start number The index of the first vertex that will be drawn (or the first index, if the Mesh has vertex indices).
---@param count number The number of vertices that will be drawn (or indices, if the Mesh has vertex indices).
---@param offset number When the Mesh has vertex indices, an offset that will be added to the index values before fetching the corresponding vertex.  This is ignored if the Mesh does not have vertex indices.
---@deprecated
function Mesh:setDrawRange(start, count, offset) end

---Sets the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a single Mesh object, the draw range can be used to select different sets of vertices to render.
---
---#### Notes:
---
---When using an index buffer, the draw range defines a range of indices to render instead of a range of vertices.  Additionally, a vertex offset can be set, which is added to the values in the index buffer before fetching the vertices.  This makes it easier to pack multiple sets of indexed mesh data in a single Mesh object, without having to manually offset the data in each index buffer.
---
function Mesh:setDrawRange() end

---Sets a `Buffer` object the Mesh will use for vertex indices.
---
---This can only be used if the Mesh uses the `gpu` storage mode.
---
---The Buffer must have a single field with the `u16`, `u32`, `index16`, or `index32` type.
---
---#### Notes:
---
---The index buffer stores a list of numbers where each number is the index of a vertex in the Mesh.  When drawing the Mesh, the data from the vertex corresponding to the index is used.  This can be used to reorder or reuse vertices, which uses less data than repeating a vertex multiple times in the Mesh.
---
---#### Example:
---
---Use an index buffer to draw a plane.
---
---```lua
---function lovr.load()
---  mesh = lovr.graphics.newMesh({
---    { -1,  1, 0 }, -- upper left
---    {  1,  1, 0 }, -- upper right
---    { -1, -1, 0 }, -- lower left
---    {  1, -1, 0 }, -- lower right
---  }, 'gpu')
---
---  -- 2 triangles
---  local indices = { 1,3,2, 2,3,4 }
---
---  local indexBuffer = lovr.graphics.newBuffer('index16', indices)
---  mesh:setIndexBuffer(indexBuffer)
---end
---
---function lovr.draw(pass)
---  pass:draw(mesh, 0, 1.7, -2)
---end
---```
---
---@param buffer Buffer The index buffer.
function Mesh:setIndexBuffer(buffer) end

---Sets or clears the vertex indices of the Mesh.  Vertex indices define the list of triangles in the mesh.  They allow vertices to be reused multiple times without duplicating all their data, which can save a lot of memory and processing time if a vertex is used for multiple triangles.
---
---If a Mesh doesn't have vertex indices, then the vertices are rendered in order.
---
---@param t {number} A list of numbers (1-based).
function Mesh:setIndices(t) end

---Sets or clears the vertex indices of the Mesh.  Vertex indices define the list of triangles in the mesh.  They allow vertices to be reused multiple times without duplicating all their data, which can save a lot of memory and processing time if a vertex is used for multiple triangles.
---
---If a Mesh doesn't have vertex indices, then the vertices are rendered in order.
---
---@param blob Blob The Blob with index data.
---@param type DataType The type of index data in the Blob.  Must be `u16` or `u32`.
function Mesh:setIndices(blob, type) end

---Sets or clears the vertex indices of the Mesh.  Vertex indices define the list of triangles in the mesh.  They allow vertices to be reused multiple times without duplicating all their data, which can save a lot of memory and processing time if a vertex is used for multiple triangles.
---
---If a Mesh doesn't have vertex indices, then the vertices are rendered in order.
---
function Mesh:setIndices() end

---Sets a `Material` to use when drawing the Mesh.
---
---@param material Material The material to use.
function Mesh:setMaterial(material) end

---Sets a `Material` to use when drawing the Mesh.
---
---@param texture Texture The texture to use as the material.
function Mesh:setMaterial(texture) end

---Sets the data for vertices in the Mesh.
---
---#### Notes:
---
---Note that a `Pass` that draws a Mesh will only "see" the vertices as they exist when the pass is submitted.  So, if this function is used to change vertices multiple times before submitting the Pass, only the final value of each vertex will be used.  Example:
---
---    function lovr.draw(pass)
---      -- Due to the second :setVertices call below, the Mesh
---      -- contains a sphere when this pass is submitted!  So
---      -- this code will actually draw 2 spheres!
---      mesh:setVertices(cube)
---      pass:draw(mesh, x1, y1, z1)
---
---      mesh:setVertices(sphere)
---      pass:draw(mesh, x2, y2, z2)
---    end
---
---If you want multiple meshes, then use multiple Mesh objects!  Or, *append* vertices to the Mesh instead of replacing them, and use `Mesh:setDrawRange` to control which vertices are drawn for a particular draw call.
---
---CPU meshes will write the data to CPU memory and upload any changes to the GPU before the Mesh is drawn.  GPU meshes don't store this CPU copy of the data, and will immediately upload the new vertex data to VRAM.  This means that multiple calls to this function might be slower on a `gpu` mesh.
---
---@param vertices {{number}} A table of vertices, where each vertex is a table of numbers matching the vertex format of the Mesh.
---@param index? number The index of the first vertex to set.
---@param count? number The number of vertices to set.
function Mesh:setVertices(vertices, index, count) end

---Sets the data for vertices in the Mesh.
---
---#### Notes:
---
---Note that a `Pass` that draws a Mesh will only "see" the vertices as they exist when the pass is submitted.  So, if this function is used to change vertices multiple times before submitting the Pass, only the final value of each vertex will be used.  Example:
---
---    function lovr.draw(pass)
---      -- Due to the second :setVertices call below, the Mesh
---      -- contains a sphere when this pass is submitted!  So
---      -- this code will actually draw 2 spheres!
---      mesh:setVertices(cube)
---      pass:draw(mesh, x1, y1, z1)
---
---      mesh:setVertices(sphere)
---      pass:draw(mesh, x2, y2, z2)
---    end
---
---If you want multiple meshes, then use multiple Mesh objects!  Or, *append* vertices to the Mesh instead of replacing them, and use `Mesh:setDrawRange` to control which vertices are drawn for a particular draw call.
---
---CPU meshes will write the data to CPU memory and upload any changes to the GPU before the Mesh is drawn.  GPU meshes don't store this CPU copy of the data, and will immediately upload the new vertex data to VRAM.  This means that multiple calls to this function might be slower on a `gpu` mesh.
---
---@param blob Blob A Blob containing binary vertex data.
---@param index? number The index of the first vertex to set.
---@param count? number The number of vertices to set.
function Mesh:setVertices(blob, index, count) end

---Models are 3D model assets loaded from files.  Currently, OBJ, glTF, and binary STL files are supported.
---
---A model can be drawn using `Pass:draw`.  A specific mesh or part of a mesh can be drawn using `Pass:drawPart`.
---
---The raw CPU data for a model is held in a `ModelData` object.
---
---Models have a hierarchy of nodes which can have their transforms modified.  Meshes are attached to these nodes.  The same mesh can be attached to multiple nodes, allowing it to be drawn multiple times while only storing a single copy of its data.
---
---Models can have animations.  Animations have keyframes which affect the transforms of nodes. Right now each model can only be drawn with a single animated pose per frame.
---
---Models can have materials, which are collections of properties and textures that define how its surface is affected by lighting.  Meshes are split up into multiple parts, and each part can have its own material.
---@class Model
local Model = {}

---Animates a Model by setting or blending the transforms of nodes using data stored in the keyframes of an animation.
---
---The animation from the model file is evaluated at the timestamp, resulting in a set of node properties.  These properties are then applied to the nodes in the model, using an optional blend factor.  If the animation doesn't have keyframes that target a given node, the node will remain unchanged.
---
---#### Notes:
---
---If the timestamp is larger than the duration of the animation, it will wrap back around to zero, so looping an animation doesn't require using the modulo operator.
---
---To change the speed of the animation, multiply the timestamp by a speed factor.
---
---For each animated property in the animation, if the timestamp used for the animation is less than the timestamp of the first keyframe, the data of the first keyframe will be used.
---
---This function can be called multiple times to layer and blend animations.  The model joints will be drawn in the final resulting pose.
---
---`Model:resetNodeTransforms` can be used to reset the model nodes to their initial transforms, which is helpful to ensure animating starts from a clean slate.
---
---@param animation string The name or index of an animation in the model file.
---@param time number The timestamp to evaluate the keyframes at, in seconds.
---@param blend? number How much of the animation's pose to blend into the nodes, from 0 to 1.
function Model:animate(animation, time, blend) end

---Rebuilds raytracing data for the Model.
---
---The first time a Model is added to a Raytracer with `Raytracer:add`, it computes raytracing data for its meshes automatically.  However, if the Model is animated or its node transforms change later, this raytracing data will be out of date.  This function is used to rebuild the raytracing data.  Afterwards, `Raytracer:build` also needs to be called on any `Raytracer` objects holding the Model.
---
function Model:buildRaytracer() end

---Returns a lightweight copy of a Model.  Most of the data will be shared between the two copies of the model, like the materials, textures, and metadata.  However, the clone has its own set of node transforms, allowing it to be animated separately from its parent.  This allows a single model to be rendered in multiple different animation poses in a frame.
---
---#### Notes:
---
---The node transforms of the clone will be reset to their initial setup poses.
---
---@return Model model A genetically identical copy of the Model.
function Model:clone() end

---Returns the number of animations in the Model.
---
---@return number count The number of animations in the Model.
function Model:getAnimationCount() end

---Returns the duration of an animation in the Model, in seconds.
---
---#### Notes:
---
---The duration of an animation is calculated as the largest timestamp of all of its keyframes.
---
---@param animation string | number The name or index of an animation.
---@return number duration The duration of the animation, in seconds.
function Model:getAnimationDuration(animation) end

---Returns the name of an animation in the Model.
---
---@param index number The index of an animation.
---@return string | nil name The name of the animation, or `nil` if the animation doesn't have a name.
function Model:getAnimationName(index) end

---Returns the total number of blend shapes in the Model.
---
---This is a combined list from all the meshes.  It is also possible to query the blend shapes for a single mesh, using `Model:getMeshBlendShapeCount`.
---
---@return number count The total number of blend shapes in the Model.
function Model:getBlendShapeCount() end

---Returns the name of a blend shape.
---
---@param index number The index of a blend shape.
---@return string name The name of the blend shape.
function Model:getBlendShapeName(index) end

---Returns the weight of a blend shape.  A blend shape contains offset values for the vertices of one of the meshes in a Model.  Whenever the Model is drawn, the offsets are multiplied by the weight of the blend shape, allowing for smooth blending between different meshes.  A weight of zero won't apply any displacement and will skip processing of the blend shape.
---
---#### Notes:
---
---The initial weights are declared in the model file.
---
---Weights can be any number, but usually they're kept between 0 and 1.
---
---This function will throw an error if the blend shape name or index doesn't exist.
---
---@param blendshape string | number The name or index of a blend shape.
---@return number weight The weight of the blend shape.
function Model:getBlendShapeWeight(blendshape) end

---Returns the 6 values of the Model's axis-aligned bounding box.
---
---@return number minx The minimum x coordinate of the vertices in the Model.
---@return number maxx The maximum x coordinate of the vertices in the Model.
---@return number miny The minimum y coordinate of the vertices in the Model.
---@return number maxy The maximum y coordinate of the vertices in the Model.
---@return number minz The minimum z coordinate of the vertices in the Model.
---@return number maxz The maximum z coordinate of the vertices in the Model.
function Model:getBoundingBox() end

---Returns the 6 values of the Model's axis-aligned bounding box.
---
---@param mesh number The mesh to get the bounding box of.
---@return number minx The minimum x coordinate of the vertices in the Model.
---@return number maxx The maximum x coordinate of the vertices in the Model.
---@return number miny The minimum y coordinate of the vertices in the Model.
---@return number maxy The maximum y coordinate of the vertices in the Model.
---@return number minz The minimum z coordinate of the vertices in the Model.
---@return number maxz The maximum z coordinate of the vertices in the Model.
function Model:getBoundingBox(mesh) end

---Returns the 6 values of the Model's axis-aligned bounding box.
---
---@param mesh number The mesh to get the bounding box of.
---@param part number The part to get the bounding box of.
---@return number minx The minimum x coordinate of the vertices in the Model.
---@return number maxx The maximum x coordinate of the vertices in the Model.
---@return number miny The minimum y coordinate of the vertices in the Model.
---@return number maxy The maximum y coordinate of the vertices in the Model.
---@return number minz The minimum z coordinate of the vertices in the Model.
---@return number maxz The maximum z coordinate of the vertices in the Model.
function Model:getBoundingBox(mesh, part) end

---Returns the center of the Model's axis-aligned bounding box, relative to the Model's origin.
---
---@return number x The x coordinate of the center of the bounding box.
---@return number y The y coordinate of the center of the bounding box.
---@return number z The z coordinate of the center of the bounding box.
function Model:getCenter() end

---Returns the center of the Model's axis-aligned bounding box, relative to the Model's origin.
---
---@param mesh number The mesh to get the dimensions of.
---@return number x The x coordinate of the center of the bounding box.
---@return number y The y coordinate of the center of the bounding box.
---@return number z The z coordinate of the center of the bounding box.
function Model:getCenter(mesh) end

---Returns the center of the Model's axis-aligned bounding box, relative to the Model's origin.
---
---@param mesh number The mesh to get the dimensions of.
---@param part number The part to get the dimensions of.
---@return number x The x coordinate of the center of the bounding box.
---@return number y The y coordinate of the center of the bounding box.
---@return number z The z coordinate of the center of the bounding box.
function Model:getCenter(mesh, part) end

---Returns the depth of the Model, computed from its axis-aligned bounding box.
---
---@return number depth The depth.
function Model:getDepth() end

---Returns the depth of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the depth of.
---@return number depth The depth.
function Model:getDepth(mesh) end

---Returns the depth of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the depth of.
---@param part number The part to get the depth of.
---@return number depth The depth.
function Model:getDepth(mesh, part) end

---Returns the width, height, and depth of the Model, computed from its axis-aligned bounding box.
---
---@return number width The width.
---@return number height The height.
---@return number depth The depth.
function Model:getDimensions() end

---Returns the width, height, and depth of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the dimensions of.
---@return number width The width.
---@return number height The height.
---@return number depth The depth.
function Model:getDimensions(mesh) end

---Returns the width, height, and depth of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the dimensions of.
---@param part number The part to get the dimensions of.
---@return number width The width.
---@return number height The height.
---@return number depth The depth.
function Model:getDimensions(mesh, part) end

---Returns the height of the Model, computed from its axis-aligned bounding box.
---
---@return number height The height.
function Model:getHeight() end

---Returns the height of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the height of.
---@return number height The height.
function Model:getHeight(mesh) end

---Returns the height of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the height of.
---@param part number The part to get the height of.
---@return number height The height.
function Model:getHeight(mesh, part) end

---Returns the index buffer used by the Model.  The index buffer describes the order used to draw the vertices in each mesh.
---
---@return Buffer buffer The index buffer.
---@deprecated
function Model:getIndexBuffer() end

---Returns a `Material` loaded from the Model.
---
---@param which string | number The name or index of the Material to return.
---@return Material material The material.
function Model:getMaterial(which) end

---Returns the number of materials in the Model.
---
---@return number count The number of materials in the Model.
function Model:getMaterialCount() end

---Returns the name of a material in the Model.
---
---@param index number The index of a material.
---@return string name The name of the material, or nil if the material does not have a name.
function Model:getMaterialName(index) end

---Returns a `Mesh` from the Model.
---
---@param index number The index of the Mesh to return.
---@return Mesh mesh The mesh object.
---@deprecated
function Model:getMesh(index) end

---Returns the number of blend shapes in one of the Model's meshes.
---
---@param mesh number The index of the mesh.
---@return number count The number of blend shapes the mesh has.
function Model:getMeshBlendShapeCount(mesh) end

---Returns the name of a blend shape.
---
---@param mesh number The index of a mesh.
---@param blendshape number The index of a blend shape in the mesh.
---@return string name The name of the blend shape.
function Model:getMeshBlendShapeName(mesh, blendshape) end

---Returns the number of meshes in the Model.
---
---@return number count The number of meshes in the Model.
function Model:getMeshCount() end

---Returns the draw mode of a mesh part.  The draw mode controls how mesh vertices are connected together. Meshes can be split into multiple parts, and each part can have its own draw mode.
---
---@param mesh number The index of a mesh.
---@return ModelDrawMode mode The draw mode of the part.
function Model:getMeshDrawMode(mesh) end

---Returns the vertex range of a part of a mesh.  Meshes can be split into multiple "parts", and each part can have its own draw mode and material.
---
---#### Notes:
---
---Parts will always use the full set of vertices/indices in the mesh, in order.
---
---If the mesh has indices, then the draw range will be in terms of indices, otherwise it will be vertices.  This matches the way `Mesh:setDrawRange` works.
---
---@param mesh number The index of a mesh.
---@return number start The index of the first vertex or index in the part.
---@return number count The number of vertices or indices in the part.
function Model:getMeshDrawRange(mesh) end

---Returns the number of vertex indices in a mesh.  Vertex indices allow for vertices to be reused when defining triangles.
---
---#### Notes:
---
---This may return zero if the mesh does not use indices.
---
---@param mesh number The index of a mesh.
---@return number count The number of vertex indices in the mesh.
function Model:getMeshIndexCount(mesh) end

---Returns the index of the material used by a mesh part.  Meshes can be split into multiple parts, and each part can have its own material.
---
---@param mesh number The index of a mesh.
---@param part? number The index of a part.
---@return number | nil material The index of the material applied to the part, or nil if the part does not have a material.
function Model:getMeshMaterial(mesh, part) end

---Returns the number of parts in a mesh.  Meshes can be split into multiple "parts".  Each part refers to a subset of the mesh's vertices, and parts can have their own draw mode and material.
---
---@param mesh number The index of the mesh.
---@return number parts The number of parts in the mesh.
function Model:getMeshPartCount(mesh) end

---Returns the number of vertices in a mesh.
---
---@param mesh number The index of a mesh.
---@return number count The number of vertices in the mesh.
function Model:getMeshVertexCount(mesh) end

---Returns extra information stored in the model file.  Currently this is only implemented for glTF models and returns the JSON string from the glTF or glb file.  The metadata can be used to get application-specific data or add support for glTF extensions not supported by LÖVR.
---
---@return string metadata The metadata from the model file.
function Model:getMetadata() end

---Given a parent node, this function returns the index of its first child, or `nil` if it doesn't have any children.
---
---This, together with `Model:getNodeSibling`, can be used to iterate the tree of nodes in a model.
---
---@param node string | number The name or index of the parent node.
---@return number | nil child The index of the node's first child, or `nil` if the node doesn't have any children.
function Model:getNodeChild(node) end

---Given a parent node, this function returns a table with the indices of its children.
---
---#### Notes:
---
---If the node does not have any children, this function returns an empty table.
---
---@param node string | number The name or index of the parent node.
---@return {number} children A table containing the node index of each child of the parent node.
---@deprecated
function Model:getNodeChildren(node) end

---Returns the number of nodes in the Model.
---
---@return number count The number of nodes in the Model.
function Model:getNodeCount() end

---Returns the index of the mesh attached to a node.  Meshes contain the geometry and material information, whereas the nodes define the hierarchy and transforms.  A single mesh can be attached to multiple nodes.  Not every node has a mesh.
---
---@param node string | number The name or index of a node.
---@return number | nil mesh The index of the node's mesh, or `nil` if the node does not have a mesh.
function Model:getNodeMesh(node) end

---Returns the name of a node in the Model.
---
---#### Notes:
---
---If the node does not have a name, this function returns `nil`.
---
---@param index number The index of the node.
---@return string name The name of the node.
function Model:getNodeName(index) end

---Returns the orientation of a node.
---
---@param node string | number The name or index of a node.
---@param origin? OriginType Whether the orientation should be returned relative to the root node or the node's parent.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Model:getNodeOrientation(node, origin) end

---Given a child node, this function returns the index of its parent.
---
---@param node string | number The name or index of the child node.
---@return number parent The index of the parent node.
function Model:getNodeParent(node) end

---Returns the pose (position and orientation) of a node.
---
---@param node string | number The name or index of a node.
---@param origin? OriginType Whether the pose should be returned relative to the root node or the node's parent.
---@return number x The x position of the node.
---@return number y The y position of the node.
---@return number z The z position of the node.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Model:getNodePose(node, origin) end

---Returns the position of a node.
---
---@param node string | number The name or index of a node.
---@param space? OriginType Whether the position should be returned relative to the root node or the node's parent.
---@return number x The x coordinate.
---@return number y The y coordinate.
---@return number z The z coordinate.
function Model:getNodePosition(node, space) end

---Returns the scale of a node.
---
---@param node string | number The name or index of a node.
---@param origin? OriginType Whether the scale should be returned relative to the root node or the node's parent.
---@return number x The x scale.
---@return number y The y scale.
---@return number z The z scale.
function Model:getNodeScale(node, origin) end

---Returns the next sibling of a node (a node with the same parent), or `nil` if the node doesn't have a sibling.
---
---This, together with `Model:getNodeChild`, can be used to iterate the tree of nodes in a Model.
---
---@param node string | number The name or index of a node.
---@return number | nil sibling The index of the node's next sibling, or `nil` if the node doesn't have a sibling.
function Model:getNodeSibling(node) end

---Returns the transform (position, scale, and rotation) of a node.
---
---@param node string | number The name or index of a node.
---@param origin? OriginType Whether the transform should be returned relative to the root node or the node's parent.
---@return number x The x position of the node.
---@return number y The y position of the node.
---@return number z The z position of the node.
---@return number sx The x scale of the node.
---@return number sy The y scale of the node.
---@return number sz The z scale of the node.
---@return number angle The number of radians the node is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Model:getNodeTransform(node, origin) end

---Returns the index of the Model's root node.
---
---@return number root The index of the root node.
function Model:getRootNode() end

---Returns one of the textures in the Model.
---
---@param index number The index of the texture to get.
---@return Texture texture The texture.
function Model:getTexture(index) end

---Returns the number of textures in the Model.
---
---@return number count The number of textures in the Model.
function Model:getTextureCount() end

---Returns a `Buffer` that holds the vertices of all of the meshes in the Model.
---
---@return Buffer buffer The vertex buffer.
---@deprecated
function Model:getVertexBuffer() end

---Returns the width of the Model, computed from its axis-aligned bounding box.
---
---@return number width The width.
function Model:getWidth() end

---Returns the width of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the width of.
---@return number width The width.
function Model:getWidth(mesh) end

---Returns the width of the Model, computed from its axis-aligned bounding box.
---
---@param mesh number The mesh to get the width of.
---@param part number The part to get the width of.
---@return number width The width.
function Model:getWidth(mesh, part) end

---Returns whether the Model has any skeletal animations.
---
---#### Notes:
---
---This will return when there's at least one skin in the model, as returned by `ModelData:getSkinCount`.
---
---Even if this function returns true, the model could still have non-skeletal animations.
---
---Right now a model can only be drawn with one skeletal pose per frame.
---
---@return boolean jointed Whether the animation uses joint nodes for skeletal animation.
function Model:hasJoints() end

---Returns whether a node is visible.  Invisible nodes don't render their mesh, or any of their children.
---
---@param node string | number The name or index of a node.
---@return boolean visible Whether the node is visible.
function Model:isNodeVisible(node) end

---Returns an iterator that iterates over the nodes with meshes in the Model.
---
---This is convenient when drawing individual meshes in the Model using `Pass:drawPart`.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    pass:push()
---    pass:transform(model:getNodeTransform(node))
---    -- Instead of drawing the whole mesh like this,
---    -- you could also draw individual parts of the mesh
---    pass:drawPart(model, mesh)
---    pass:pop()
---  end
---end
---```
---
---@return function iterator The iterator function.  The iterator function returns the index of the next node, and the index of its mesh.
---@return Model state The Model.
---@return nil initial The initial value.
function Model:meshes() end

---Resets blend shape weights to the original ones defined in the model file.
---
function Model:resetBlendShapes() end

---Resets node transforms to the original ones defined in the model file.
---
function Model:resetNodeTransforms() end

---Sets the weight of a blend shape.  A blend shape contains offset values for the vertices of one of the meshes in a Model.  Whenever the Model is drawn, the offsets are multiplied by the weight of the blend shape, allowing for smooth blending between different meshes.  A weight of zero won't apply any displacement and will skip processing of the blend shape.
---
---#### Notes:
---
---The initial weights are declared in the model file.
---
---Weights can be any number, but usually they're kept between 0 and 1.
---
---This function will throw an error if the blend shape name or index doesn't exist.
---
---@param blendshape string | number The name or index of a blend shape.
---@param weight number The new weight for the blend shape.
function Model:setBlendShapeWeight(blendshape, weight) end

---Sets or blends the orientation of a node to a new orientation.  This sets the local orientation of the node, relative to its parent.
---
---@param node string | number The name or index of a node.
---@param angle number The number of radians the node should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@param blend? number A number from 0 to 1 indicating how much of the target orientation to blend in.  A value of 0 will not change the node's orientation at all, whereas 1 will fully blend to the target orientation.
function Model:setNodeOrientation(node, angle, ax, ay, az, blend) end

---Sets or blends the orientation of a node to a new orientation.  This sets the local orientation of the node, relative to its parent.
---
---@param node string | number The name or index of a node.
---@param orientation quaternion The orientation.
---@param blend? number A number from 0 to 1 indicating how much of the target orientation to blend in.  A value of 0 will not change the node's orientation at all, whereas 1 will fully blend to the target orientation.
function Model:setNodeOrientation(node, orientation, blend) end

---Sets or blends the pose (position and orientation) of a node to a new pose.  This sets the local pose of the node, relative to its parent.  The scale will remain unchanged.
---
---@param node string | number The name or index of a node.
---@param x number The x component of the position.
---@param y number The y component of the position.
---@param z number The z component of the position.
---@param angle number The number of radians the node should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@param blend? number A number from 0 to 1 indicating how much of the target pose to blend in.  A value of 0 will not change the node's pose at all, whereas 1 will fully blend to the target pose.
function Model:setNodePose(node, x, y, z, angle, ax, ay, az, blend) end

---Sets or blends the pose (position and orientation) of a node to a new pose.  This sets the local pose of the node, relative to its parent.  The scale will remain unchanged.
---
---@param node string | number The name or index of a node.
---@param position vector The target position.  Can also be provided as 3 numbers.
---@param orientation quaternion The target orientation.  Can also be provided as 4 numbers in angle-axis form.
---@param blend? number A number from 0 to 1 indicating how much of the target pose to blend in.  A value of 0 will not change the node's pose at all, whereas 1 will fully blend to the target pose.
function Model:setNodePose(node, position, orientation, blend) end

---Sets or blends the position of a node.  This sets the local position of the node, relative to its parent.
---
---@param node string | number The name or index of a node.
---@param x number The x coordinate of the new position.
---@param y number The y coordinate of the new position.
---@param z number The z coordinate of the new position.
---@param blend? number A number from 0 to 1 indicating how much of the new position to blend in.  A value of 0 will not change the node's position at all, whereas 1 will fully blend to the target position.
function Model:setNodePosition(node, x, y, z, blend) end

---Sets or blends the position of a node.  This sets the local position of the node, relative to its parent.
---
---@param node string | number The name or index of a node.
---@param position vector The new position.
---@param blend? number A number from 0 to 1 indicating how much of the new position to blend in.  A value of 0 will not change the node's position at all, whereas 1 will fully blend to the target position.
function Model:setNodePosition(node, position, blend) end

---Sets or blends the scale of a node to a new scale.  This sets the local scale of the node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 scale components the same.
---
---@param node string | number The name or index of a node.
---@param sx number The x scale.
---@param sy number The y scale.
---@param sz number The z scale.
---@param blend? number A number from 0 to 1 indicating how much of the new scale to blend in.  A value of 0 will not change the node's scale at all, whereas 1 will fully blend to the target scale.
function Model:setNodeScale(node, sx, sy, sz, blend) end

---Sets or blends the scale of a node to a new scale.  This sets the local scale of the node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 scale components the same.
---
---@param node string | number The name or index of a node.
---@param scale vector The new scale.
---@param blend? number A number from 0 to 1 indicating how much of the new scale to blend in.  A value of 0 will not change the node's scale at all, whereas 1 will fully blend to the target scale.
function Model:setNodeScale(node, scale, blend) end

---Sets or blends the transform of a node to a new transform.  This sets the local transform of the node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 components of the scale the same.
---
---Even though the translation, scale, and rotation parameters are given in TSR order, they are applied in the normal TRS order.
---
---@param node string | number The name or index of a node.
---@param x number The x component of the position.
---@param y number The y component of the position.
---@param z number The z component of the position.
---@param sx number The x component of the scale.
---@param sy number The y component of the scale.
---@param sz number The z component of the scale.
---@param angle number The number of radians the node should be rotated around its rotation axis.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
---@param blend? number A number from 0 to 1 indicating how much of the target transform to blend in.  A value of 0 will not change the node's transform at all, whereas 1 will fully blend to the target transform.
function Model:setNodeTransform(node, x, y, z, sx, sy, sz, angle, ax, ay, az, blend) end

---Sets or blends the transform of a node to a new transform.  This sets the local transform of the node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 components of the scale the same.
---
---Even though the translation, scale, and rotation parameters are given in TSR order, they are applied in the normal TRS order.
---
---@param node string | number The name or index of a node.
---@param position vector The position.
---@param scale vector The scale.
---@param orientation quaternion The orientation.
---@param blend? number A number from 0 to 1 indicating how much of the target transform to blend in.  A value of 0 will not change the node's transform at all, whereas 1 will fully blend to the target transform.
function Model:setNodeTransform(node, position, scale, orientation, blend) end

---Sets or blends the transform of a node to a new transform.  This sets the local transform of the node, relative to its parent.
---
---#### Notes:
---
---For best results when animating, it's recommended to keep the 3 components of the scale the same.
---
---Even though the translation, scale, and rotation parameters are given in TSR order, they are applied in the normal TRS order.
---
---@param node string | number The name or index of a node.
---@param transform Mat4 The transform.
---@param blend? number A number from 0 to 1 indicating how much of the target transform to blend in.  A value of 0 will not change the node's transform at all, whereas 1 will fully blend to the target transform.
function Model:setNodeTransform(node, transform, blend) end

---Set the visibility of a node.  Invisible nodes don't render their mesh, or any of their children.
---
---@param node string | number The name or index of a node.
---@param visible boolean Whether the node should be visible.
function Model:setNodeVisible(node, visible) end

---Pass objects record work for the GPU.  They contain a list of things to draw and a list of compute shaders to run.
---
---Methods like `Pass:sphere` will "record" a draw on the Pass, which adds it to the list.  Other methods like `Pass:setBlendMode` or `Pass:setShader` will change the way the next draws are processed.
---
---Once all of the work has been recorded to a Pass, it can be sent to the GPU using `lovr.graphics.submit`, which will start processing all of the compute work and draws (in that order).
---
---A Pass can have a canvas, which is a set of textures that the draws will render to.
---
---`Pass:reset` is used to clear all of the computes and draws, putting the Pass in a fresh state.
---
---`lovr.draw` is called every frame with a `Pass` that is configured to render to either the headset or the window.  The Pass will automatically get submitted afterwards.
---@class Pass
local Pass = {}

---Synchronizes compute work.
---
---By default, within a single Pass, multiple calls to `Pass:compute` can run on the GPU in any order, or all at the same time.  This is great because it lets the GPU process the work as efficiently as possible, but sometimes multiple compute dispatches need to be sequenced.
---
---Calling this function will insert a barrier.  All compute operations on the Pass after the barrier will only start once all of the previous compute operations on the Pass are finished.
---
---#### Notes:
---
---It's only necessary to use a barrier if a compute shader is reading/writing the same bytes of memory that a previous compute operation in the same Pass read/wrote.
---
---Barriers will slow things down because they reduce parallelism by causing the GPU to wait. Strategic reordering of non-dependent :compute calls around the barrier can help.
---
---Calling this function before recording any :computes will do nothing, and calling it after the last :compute will do nothing.
---
---#### Example:
---
---```lua
---pass = lovr.graphics.newPass()
---pass:setShader(computeShader)
---
---pass:compute(x, y, z)
---pass:compute(x, y, z)
---pass:barrier()
---pass:compute(x, y, z) --> waits for the previous 2 :computes to complete
---```
---
function Pass:barrier() end

---Begins a new tally.  The tally will count the number of pixels touched by any draws that occur while the tally is active.  If a pixel fails the depth test or stencil test then it won't be counted, so the tally is a way to detect if objects are visible.
---
---The results for all the tallies in the pass can be copied to a `Buffer` when the Pass finishes by setting a buffer with `Pass:setTallyBuffer`.
---
---#### Notes:
---
---There is currently a maximum of 256 tallies per pass.
---
---If a tally is already active, this function will error.
---
---@return number index The index of the tally that was started.
function Pass:beginTally() end

---Draw a box.  This is like `Pass:cube`, except it takes 3 separate values for the scale.
---
---@param x? number The x coordinate of the center of the box.
---@param y? number The y coordinate of the center of the box.
---@param z? number The z coordinate of the center of the box.
---@param width? number The width of the box.
---@param height? number The height of the box.
---@param depth? number The depth of the box.
---@param angle? number The rotation of the box around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param style? DrawStyle Whether the box should be drawn filled or outlined.
function Pass:box(x, y, z, width, height, depth, angle, ax, ay, az, style) end

---Draw a box.  This is like `Pass:cube`, except it takes 3 separate values for the scale.
---
---@param position vector The position of the box.
---@param size vector The size of the box.
---@param orientation quaternion The orientation of the box.
---@param style? DrawStyle Whether the box should be drawn filled or outlined.
function Pass:box(position, size, orientation, style) end

---Draw a box.  This is like `Pass:cube`, except it takes 3 separate values for the scale.
---
---@param transform Mat4 The transform of the box.
---@param style? DrawStyle Whether the box should be drawn filled or outlined.
function Pass:box(transform, style) end

---Draws a capsule.  A capsule is shaped like a cylinder with a hemisphere on each end.
---
---#### Notes:
---
---The length of the capsule does not include the end caps.  The local origin of the capsule is in the center, and the local z axis points towards the end caps.
---
---@param x? number The x coordinate of the center of the capsule.
---@param y? number The y coordinate of the center of the capsule.
---@param z? number The z coordinate of the center of the capsule.
---@param radius? number The radius of the capsule.
---@param length? number The length of the capsule.
---@param angle? number The rotation of the capsule around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param segments? number The number of circular segments to render.
function Pass:capsule(x, y, z, radius, length, angle, ax, ay, az, segments) end

---Draws a capsule.  A capsule is shaped like a cylinder with a hemisphere on each end.
---
---#### Notes:
---
---The length of the capsule does not include the end caps.  The local origin of the capsule is in the center, and the local z axis points towards the end caps.
---
---@param position vector The position of the center of the capsule.
---@param radius? number The radius of the capsule.
---@param length? number The length of the capsule.
---@param orientation quaternion The orientation of the capsule.
---@param segments? number The number of circular segments to render.
function Pass:capsule(position, radius, length, orientation, segments) end

---Draws a capsule.  A capsule is shaped like a cylinder with a hemisphere on each end.
---
---#### Notes:
---
---The length of the capsule does not include the end caps.  The local origin of the capsule is in the center, and the local z axis points towards the end caps.
---
---@param transform Mat4 The transform of the capsule.
---@param segments? number The number of circular segments to render.
function Pass:capsule(transform, segments) end

---Draws a capsule.  A capsule is shaped like a cylinder with a hemisphere on each end.
---
---#### Notes:
---
---The length of the capsule does not include the end caps.  The local origin of the capsule is in the center, and the local z axis points towards the end caps.
---
---@param p1 vector The starting point of the capsule.
---@param p2 vector The ending point of the capsule.
---@param radius? number The radius of the capsule.
---@param segments? number The number of circular segments to render.
function Pass:capsule(p1, p2, radius, segments) end

---Draws a circle.
---
---#### Notes:
---
---The local origin of the circle is in its center.  The local z axis is perpendicular to the circle.
---
---@param x? number The x coordinate of the center of the circle.
---@param y? number The y coordinate of the center of the circle.
---@param z? number The z coordinate of the center of the circle.
---@param radius? number The radius of the circle.
---@param angle? number The rotation of the circle around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param style? DrawStyle Whether the circle should be filled or outlined.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of segments to render.
function Pass:circle(x, y, z, radius, angle, ax, ay, az, style, angle1, angle2, segments) end

---Draws a circle.
---
---#### Notes:
---
---The local origin of the circle is in its center.  The local z axis is perpendicular to the circle.
---
---@param position vector The position of the circle.
---@param radius? number The radius of the circle.
---@param orientation quaternion The orientation of the circle.
---@param style? DrawStyle Whether the circle should be filled or outlined.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of segments to render.
function Pass:circle(position, radius, orientation, style, angle1, angle2, segments) end

---Draws a circle.
---
---#### Notes:
---
---The local origin of the circle is in its center.  The local z axis is perpendicular to the circle.
---
---@param transform Mat4 The transform of the circle.
---@param style? DrawStyle Whether the circle should be filled or outlined.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of segments to render.
function Pass:circle(transform, style, angle1, angle2, segments) end

---Runs a compute shader.  There must be an active compute shader set using `Pass:setShader`.
---
---All of the compute shader dispatches in a Pass will run **before** all of the draws in the Pass (if any).  They will also run at the same time in parallel, unless `Pass:barrier` is used to control the order.
---
---#### Notes:
---
---Compute shaders are usually run once for each pixel in an image, once per particle, once per object, etc.  The 3 arguments represent how many times to run, or "dispatch", the compute shader, in up to 3 dimensions.  Each element of this grid is called a **workgroup**.
---
---To make things even more complicated, each workgroup itself is made up of a set of "mini GPU threads", which are called **local workgroups**.  Like workgroups, the local workgroup size can also be 3D.  It's declared in the shader code, like this:
---
---    layout(local_size_x = w, local_size_y = h, local_size_z = d) in;
---
---All these 3D grids can get confusing, but the basic idea is to make the local workgroup size a small block of e.g. 32 particles or 8x8 pixels or 4x4x4 voxels, and then dispatch however many workgroups are needed to cover a list of particles, image, voxel field, etc.
---
---The reason to do it this way is that the GPU runs its threads in little fixed-size bundles called subgroups.  Subgroups are usually 32 or 64 threads (the exact size is given by the `subgroupSize` property of `lovr.graphics.getDevice`) and all run together.  If the local workgroup size was `1x1x1`, then the GPU would only run 1 thread per subgroup and waste the other 31 or 63.  So for the best performance, be sure to set a local workgroup size bigger than 1!
---
---Inside the compute shader, a few builtin variables can be used to figure out which workgroup is running:
---
---- `uvec3 WorkgroupCount` is the workgroup count per axis (the `Pass:compute` arguments).
---- `uvec3 WorkgroupSize` is the local workgroup size (declared in the shader).
---- `uvec3 WorkgroupID` is the index of the current (global) workgroup.
---- `uvec3 LocalThreadID` is the index of the local workgroup inside its workgroup.
---- `uint LocalThreadIndex` is a 1D version of `LocalThreadID`.
---- `uvec3 GlobalThreadID` is the unique identifier for a thread within all workgroups in a
---  dispatch. It's equivalent to `WorkgroupID * WorkgroupSize + LocalThreadID` (usually what you
---  want!)
---
---There are limits to the number of workgroups that can be dispatched, see the `workgroupCount` limit in `lovr.graphics.getLimits`.  The local workgroup size is also limited by the `workgroupSize` and `totalWorkgroupSize` limits.
---
---Indirect compute dispatches are useful to "chain" compute shaders together, while keeping all of the data on the GPU.  The first dispatch can do some computation and write some results to buffers, then the second indirect dispatch can use the data in those buffers to know how many times it should run.  An example would be a compute shader that does some sort of object culling, writing the number of visible objects to a buffer along with the IDs of each one. Subsequent compute shaders can be indirectly dispatched to perform extra processing on the visible objects.  Finally, an indirect draw can be used to render them.
---
---#### Example:
---
---A compute shader that makes a texture grayscale.
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    layout(local_size_x = 8, local_size_y = 8) in;
---    layout(rgba8) uniform image2D image;
---
---    void lovrmain() {
---      ivec2 size = imageSize(image);
---      ivec2 pixel = ivec2(GlobalThreadID.xy);
---
---      if (pixel.x >= size.x || pixel.y >= size.y) {
---        return;
---      }
---
---      vec4 color = imageLoad(image, pixel);
---      color.rgb = vec3(color.r * .2126 + color.g * .7512 + color.b * .0722);
---      imageStore(image, pixel, color);
---    }
---  ]])
---
---  texture = lovr.graphics.newTexture('image.png', {
---    usage = { 'storage', 'sample', 'transfer' },
---    linear = true -- srgb textures don't always support storage usage
---  })
---
---  local tw, th = texture:getDimensions()
---  local sx, sy = shader:getWorkgroupSize()
---  local gx, gy = math.ceil(tw / sx), math.ceil(th / sy)
---
---  local computer = lovr.graphics.newPass()
---
---  computer:setShader(shader)
---  computer:send('image', texture)
---  computer:compute(gx, gy)
---  lovr.graphics.submit(computer)
---
---  texture:generateMipmaps()
---end
---
---function lovr.draw(pass)
---  pass:draw(texture, 0, 1.7, -1)
---end
---```
---
---@param x? number The number of workgroups to dispatch in the x dimension.
---@param y? number The number of workgroups to dispatch in the y dimension.
---@param z? number The number of workgroups to dispatch in the z dimension.
function Pass:compute(x, y, z) end

---Runs a compute shader.  There must be an active compute shader set using `Pass:setShader`.
---
---All of the compute shader dispatches in a Pass will run **before** all of the draws in the Pass (if any).  They will also run at the same time in parallel, unless `Pass:barrier` is used to control the order.
---
---#### Notes:
---
---Compute shaders are usually run once for each pixel in an image, once per particle, once per object, etc.  The 3 arguments represent how many times to run, or "dispatch", the compute shader, in up to 3 dimensions.  Each element of this grid is called a **workgroup**.
---
---To make things even more complicated, each workgroup itself is made up of a set of "mini GPU threads", which are called **local workgroups**.  Like workgroups, the local workgroup size can also be 3D.  It's declared in the shader code, like this:
---
---    layout(local_size_x = w, local_size_y = h, local_size_z = d) in;
---
---All these 3D grids can get confusing, but the basic idea is to make the local workgroup size a small block of e.g. 32 particles or 8x8 pixels or 4x4x4 voxels, and then dispatch however many workgroups are needed to cover a list of particles, image, voxel field, etc.
---
---The reason to do it this way is that the GPU runs its threads in little fixed-size bundles called subgroups.  Subgroups are usually 32 or 64 threads (the exact size is given by the `subgroupSize` property of `lovr.graphics.getDevice`) and all run together.  If the local workgroup size was `1x1x1`, then the GPU would only run 1 thread per subgroup and waste the other 31 or 63.  So for the best performance, be sure to set a local workgroup size bigger than 1!
---
---Inside the compute shader, a few builtin variables can be used to figure out which workgroup is running:
---
---- `uvec3 WorkgroupCount` is the workgroup count per axis (the `Pass:compute` arguments).
---- `uvec3 WorkgroupSize` is the local workgroup size (declared in the shader).
---- `uvec3 WorkgroupID` is the index of the current (global) workgroup.
---- `uvec3 LocalThreadID` is the index of the local workgroup inside its workgroup.
---- `uint LocalThreadIndex` is a 1D version of `LocalThreadID`.
---- `uvec3 GlobalThreadID` is the unique identifier for a thread within all workgroups in a
---  dispatch. It's equivalent to `WorkgroupID * WorkgroupSize + LocalThreadID` (usually what you
---  want!)
---
---There are limits to the number of workgroups that can be dispatched, see the `workgroupCount` limit in `lovr.graphics.getLimits`.  The local workgroup size is also limited by the `workgroupSize` and `totalWorkgroupSize` limits.
---
---Indirect compute dispatches are useful to "chain" compute shaders together, while keeping all of the data on the GPU.  The first dispatch can do some computation and write some results to buffers, then the second indirect dispatch can use the data in those buffers to know how many times it should run.  An example would be a compute shader that does some sort of object culling, writing the number of visible objects to a buffer along with the IDs of each one. Subsequent compute shaders can be indirectly dispatched to perform extra processing on the visible objects.  Finally, an indirect draw can be used to render them.
---
---#### Example:
---
---A compute shader that makes a texture grayscale.
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    layout(local_size_x = 8, local_size_y = 8) in;
---    layout(rgba8) uniform image2D image;
---
---    void lovrmain() {
---      ivec2 size = imageSize(image);
---      ivec2 pixel = ivec2(GlobalThreadID.xy);
---
---      if (pixel.x >= size.x || pixel.y >= size.y) {
---        return;
---      }
---
---      vec4 color = imageLoad(image, pixel);
---      color.rgb = vec3(color.r * .2126 + color.g * .7512 + color.b * .0722);
---      imageStore(image, pixel, color);
---    }
---  ]])
---
---  texture = lovr.graphics.newTexture('image.png', {
---    usage = { 'storage', 'sample', 'transfer' },
---    linear = true -- srgb textures don't always support storage usage
---  })
---
---  local tw, th = texture:getDimensions()
---  local sx, sy = shader:getWorkgroupSize()
---  local gx, gy = math.ceil(tw / sx), math.ceil(th / sy)
---
---  local computer = lovr.graphics.newPass()
---
---  computer:setShader(shader)
---  computer:send('image', texture)
---  computer:compute(gx, gy)
---  lovr.graphics.submit(computer)
---
---  texture:generateMipmaps()
---end
---
---function lovr.draw(pass)
---  pass:draw(texture, 0, 1.7, -1)
---end
---```
---
---@param buffer Buffer A Buffer object containing the x, y, and z workgroup counts, stored as 4 byte unsigned integers.
---@param offset? number The byte offset to read the workgroup counts from in the Buffer.
function Pass:compute(buffer, offset) end

---Draws a cone.
---
---#### Notes:
---
---The local origin is at the center of the base of the cone, and the negative z axis points towards the tip.
---
---@param x? number The x coordinate of the center of the base of the cone.
---@param y? number The y coordinate of the center of the base of the cone.
---@param z? number The z coordinate of the center of the base of the cone.
---@param radius? number The radius of the cone.
---@param length? number The length of the cone.
---@param angle? number The rotation of the cone around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param segments? number The number of segments in the cone.
function Pass:cone(x, y, z, radius, length, angle, ax, ay, az, segments) end

---Draws a cone.
---
---#### Notes:
---
---The local origin is at the center of the base of the cone, and the negative z axis points towards the tip.
---
---@param position vector The position of the center of the base of the cone.
---@param radius? number The radius of the cone.
---@param length? number The length of the cone.
---@param orientation quaternion The orientation of the cone.
---@param segments? number The number of segments in the cone.
function Pass:cone(position, radius, length, orientation, segments) end

---Draws a cone.
---
---#### Notes:
---
---The local origin is at the center of the base of the cone, and the negative z axis points towards the tip.
---
---@param transform Mat4 The transform of the cone.
---@param segments? number The number of segments in the cone.
function Pass:cone(transform, segments) end

---Draws a cone.
---
---#### Notes:
---
---The local origin is at the center of the base of the cone, and the negative z axis points towards the tip.
---
---@param p1 vector The position of the base of the cone.
---@param p2 vector The position of the tip of the cone.
---@param radius? number The radius of the cone.
---@param segments? number The number of segments in the cone.
function Pass:cone(p1, p2, radius, segments) end

---Draws a cube.
---
---#### Notes:
---
---The local origin is in the center of the cube.
---
---@param x? number The x coordinate of the center of the cube.
---@param y? number The y coordinate of the center of the cube.
---@param z? number The z coordinate of the center of the cube.
---@param size? number The size of the cube.
---@param angle? number The rotation of the cube around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param style? DrawStyle Whether the cube should be drawn filled or outlined.
function Pass:cube(x, y, z, size, angle, ax, ay, az, style) end

---Draws a cube.
---
---#### Notes:
---
---The local origin is in the center of the cube.
---
---@param position vector The position of the cube.
---@param size? number The size of the cube.
---@param orientation quaternion The orientation of the cube.
---@param style? DrawStyle Whether the cube should be drawn filled or outlined.
function Pass:cube(position, size, orientation, style) end

---Draws a cube.
---
---#### Notes:
---
---The local origin is in the center of the cube.
---
---@param transform Mat4 The transform of the cube.
---@param style? DrawStyle Whether the cube should be drawn filled or outlined.
function Pass:cube(transform, style) end

---Draws a cylinder.
---
---#### Notes:
---
---The local origin is in the center of the cylinder, and the length of the cylinder is along the z axis.
---
---@param x? number The x coordinate of the center of the cylinder.
---@param y? number The y coordinate of the center of the cylinder.
---@param z? number The z coordinate of the center of the cylinder.
---@param radius? number The radius of the cylinder.
---@param length? number The length of the cylinder.
---@param angle? number The rotation of the cylinder around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param capped? boolean Whether the tops and bottoms of the cylinder should be rendered.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of circular segments to render.
function Pass:cylinder(x, y, z, radius, length, angle, ax, ay, az, capped, angle1, angle2, segments) end

---Draws a cylinder.
---
---#### Notes:
---
---The local origin is in the center of the cylinder, and the length of the cylinder is along the z axis.
---
---@param position vector The position of the center of the cylinder.
---@param radius? number The radius of the cylinder.
---@param length? number The length of the cylinder.
---@param orientation quaternion The orientation of the cylinder.
---@param capped? boolean Whether the tops and bottoms of the cylinder should be rendered.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of circular segments to render.
function Pass:cylinder(position, radius, length, orientation, capped, angle1, angle2, segments) end

---Draws a cylinder.
---
---#### Notes:
---
---The local origin is in the center of the cylinder, and the length of the cylinder is along the z axis.
---
---@param transform Mat4 The transform of the cylinder.
---@param capped? boolean Whether the tops and bottoms of the cylinder should be rendered.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of circular segments to render.
function Pass:cylinder(transform, capped, angle1, angle2, segments) end

---Draws a cylinder.
---
---#### Notes:
---
---The local origin is in the center of the cylinder, and the length of the cylinder is along the z axis.
---
---@param p1 vector The starting point of the cylinder.
---@param p2 vector The ending point of the cylinder.
---@param radius? number The radius of the cylinder.
---@param capped? boolean Whether the tops and bottoms of the cylinder should be rendered.
---@param angle1? number The angle of the beginning of the arc.
---@param angle2? number angle of the end of the arc.
---@param segments? number The number of circular segments to render.
function Pass:cylinder(p1, p2, radius, capped, angle1, angle2, segments) end

---Draws a `Model`, `Mesh`, or `Texture`.
---
---#### Notes:
---
---`Model:getMesh` can be used to draw individual meshes of a model.
---
---Textures ignore the `instances` parameter.
---
---When drawing a Texture, the plane will be 1 meter wide at 1.0 scale and the height will be adjusted based on the Texture's aspect ratio.
---
---@param object Model | Mesh | Texture The object to draw.
---@param x? number The x coordinate to draw the object at.
---@param y? number The y coordinate to draw the object at.
---@param z? number The z coordinate to draw the object at.
---@param scale? number The scale of the object.
---@param angle? number The rotation of the object around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param instances? number The number of instances to draw.
function Pass:draw(object, x, y, z, scale, angle, ax, ay, az, instances) end

---Draws a `Model`, `Mesh`, or `Texture`.
---
---#### Notes:
---
---`Model:getMesh` can be used to draw individual meshes of a model.
---
---Textures ignore the `instances` parameter.
---
---When drawing a Texture, the plane will be 1 meter wide at 1.0 scale and the height will be adjusted based on the Texture's aspect ratio.
---
---@param object Model | Mesh | Texture The object to draw.
---@param position vector The position to draw the object at.
---@param scale3 vector The scale of the object, as a vector.
---@param orientation quaternion The orientation of the object.
---@param instances? number The number of instances to draw.
function Pass:draw(object, position, scale3, orientation, instances) end

---Draws a `Model`, `Mesh`, or `Texture`.
---
---#### Notes:
---
---`Model:getMesh` can be used to draw individual meshes of a model.
---
---Textures ignore the `instances` parameter.
---
---When drawing a Texture, the plane will be 1 meter wide at 1.0 scale and the height will be adjusted based on the Texture's aspect ratio.
---
---@param object Model | Mesh | Texture The object to draw.
---@param transform Mat4 The transform of the object.
---@param instances? number The number of instances to draw.
function Pass:draw(object, transform, instances) end

---Draws a single mesh or part of a mesh in a Model.
---
---Meshes in models can be split into multiple "parts", where each part has its own draw mode and material.  This function can draw a single one of these parts, or all of the parts in a single mesh.
---
---Drawing individual meshes or parts is useful because it allows for materials, graphics states, and shader uniforms to be changed in between each draw.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)
---
---    for part = 1, model:getMeshPartCount(mesh) do
---      pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
---    end
---  end
---end
---```
---
---@param model Model The Model to draw.
---@param mesh number The index of the mesh to draw.
---@param x? number The x coordinate to draw at.
---@param y? number The y coordinate to draw at.
---@param z? number The z coordinate to draw at.
---@param scale? number The scale.
---@param angle? number The rotation around the rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param instances? number The number of instances to draw.
function Pass:drawPart(model, mesh, x, y, z, scale, angle, ax, ay, az, instances) end

---Draws a single mesh or part of a mesh in a Model.
---
---Meshes in models can be split into multiple "parts", where each part has its own draw mode and material.  This function can draw a single one of these parts, or all of the parts in a single mesh.
---
---Drawing individual meshes or parts is useful because it allows for materials, graphics states, and shader uniforms to be changed in between each draw.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)
---
---    for part = 1, model:getMeshPartCount(mesh) do
---      pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
---    end
---  end
---end
---```
---
---@param model Model The Model to draw.
---@param mesh number The index of the mesh to draw.
---@param position vector The position to draw at.
---@param scale3 vector The scale, as a vector.
---@param orientation quaternion The orientation.
---@param instances? number The number of instances to draw.
function Pass:drawPart(model, mesh, position, scale3, orientation, instances) end

---Draws a single mesh or part of a mesh in a Model.
---
---Meshes in models can be split into multiple "parts", where each part has its own draw mode and material.  This function can draw a single one of these parts, or all of the parts in a single mesh.
---
---Drawing individual meshes or parts is useful because it allows for materials, graphics states, and shader uniforms to be changed in between each draw.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)
---
---    for part = 1, model:getMeshPartCount(mesh) do
---      pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
---    end
---  end
---end
---```
---
---@param model Model The Model to draw.
---@param mesh number The index of the mesh to draw.
---@param transform Mat4 The transform.
---@param instances? number The number of instances to draw.
function Pass:drawPart(model, mesh, transform, instances) end

---Draws a single mesh or part of a mesh in a Model.
---
---Meshes in models can be split into multiple "parts", where each part has its own draw mode and material.  This function can draw a single one of these parts, or all of the parts in a single mesh.
---
---Drawing individual meshes or parts is useful because it allows for materials, graphics states, and shader uniforms to be changed in between each draw.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)
---
---    for part = 1, model:getMeshPartCount(mesh) do
---      pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
---    end
---  end
---end
---```
---
---@param model Model The Model to draw.
---@param mesh number The index of the mesh to draw.
---@param part number The index of one of the parts in the mesh to draw.
---@param x? number The x coordinate to draw at.
---@param y? number The y coordinate to draw at.
---@param z? number The z coordinate to draw at.
---@param scale? number The scale.
---@param angle? number The rotation around the rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param instances? number The number of instances to draw.
function Pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az, instances) end

---Draws a single mesh or part of a mesh in a Model.
---
---Meshes in models can be split into multiple "parts", where each part has its own draw mode and material.  This function can draw a single one of these parts, or all of the parts in a single mesh.
---
---Drawing individual meshes or parts is useful because it allows for materials, graphics states, and shader uniforms to be changed in between each draw.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)
---
---    for part = 1, model:getMeshPartCount(mesh) do
---      pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
---    end
---  end
---end
---```
---
---@param model Model The Model to draw.
---@param mesh number The index of the mesh to draw.
---@param part number The index of one of the parts in the mesh to draw.
---@param position vector The position to draw at.
---@param scale3 vector The scale, as a vector.
---@param orientation quaternion The orientation.
---@param instances? number The number of instances to draw.
function Pass:drawPart(model, mesh, part, position, scale3, orientation, instances) end

---Draws a single mesh or part of a mesh in a Model.
---
---Meshes in models can be split into multiple "parts", where each part has its own draw mode and material.  This function can draw a single one of these parts, or all of the parts in a single mesh.
---
---Drawing individual meshes or parts is useful because it allows for materials, graphics states, and shader uniforms to be changed in between each draw.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  for node, mesh in model:meshes() do
---    local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)
---
---    for part = 1, model:getMeshPartCount(mesh) do
---      pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
---    end
---  end
---end
---```
---
---@param model Model The Model to draw.
---@param mesh number The index of the mesh to draw.
---@param part number The index of one of the parts in the mesh to draw.
---@param transform Mat4 The transform.
---@param instances? number The number of instances to draw.
function Pass:drawPart(model, mesh, part, transform, instances) end

---Draws a fullscreen triangle.  The `fill` shader is used, which stretches the triangle across the screen.
---
---#### Notes:
---
---This function has some special behavior for array textures:
---
---- Filling a single-layer texture to a multi-layer canvas will mirror the texture to all layers,
---  just like regular drawing.
---- Filling a 2-layer texture to a mono canvas will render the 2 layers side-by-side.
---- Filling a multi-layer texture to a multi-layer canvas will do a layer-by-layer fill (the layer
---  counts must match).
---
---@param texture Texture The texture to fill.  If nil, the texture from the active material is used.
function Pass:fill(texture) end

---Draws a fullscreen triangle.  The `fill` shader is used, which stretches the triangle across the screen.
---
---#### Notes:
---
---This function has some special behavior for array textures:
---
---- Filling a single-layer texture to a multi-layer canvas will mirror the texture to all layers,
---  just like regular drawing.
---- Filling a 2-layer texture to a mono canvas will render the 2 layers side-by-side.
---- Filling a multi-layer texture to a multi-layer canvas will do a layer-by-layer fill (the layer
---  counts must match).
---
function Pass:fill() end

---Finishes a tally that was previously started with `Pass:beginTally`.  This will stop counting the number of pixels affected by draws.
---
---The results for all the tallies in the pass can be copied to a `Buffer` when the Pass finishes by setting a buffer with `Pass:setTallyBuffer`.
---
---#### Notes:
---
---There is currently a maximum of 256 tallies per pass.
---
---If no tally is active, this function will error.
---
---@return number index The index of the tally that was finished.
function Pass:finishTally() end

---Returns the Pass's canvas, or `nil` if the Pass doesn't have a canvas.  The canvas is a set of textures that the Pass will draw to when it's submitted.
---
---#### Notes:
---
---If the Pass has multiple color textures, a fragment shader should be used to write a different color to each texture.  Here's an example that writes red to the first texture and blue to the second texture:
---
---    // Declare an output variable for the second texture
---    layout(location = 1) out vec4 secondColor;
---
---    vec4 lovrmain() {
---      secondColor = vec4(0, 0, 1, 1);
---      return vec4(1, 0, 0, 1);
---    }
---
---@return table canvas The canvas.  Numeric keys will contain the color Textures, along with the following keys:
function Pass:getCanvas() end

---Returns the Pass's canvas, or `nil` if the Pass doesn't have a canvas.  The canvas is a set of textures that the Pass will draw to when it's submitted.
---
---#### Notes:
---
---If the Pass has multiple color textures, a fragment shader should be used to write a different color to each texture.  Here's an example that writes red to the first texture and blue to the second texture:
---
---    // Declare an output variable for the second texture
---    layout(location = 1) out vec4 secondColor;
---
---    vec4 lovrmain() {
---      secondColor = vec4(0, 0, 1, 1);
---      return vec4(1, 0, 0, 1);
---    }
---
function Pass:getCanvas() end

---Returns the clear values of the pass.
---
---#### Notes:
---
---The default clear color is transparent black.
---
---@return table clears The clear values for the pass.  Each color texture's clear value is stored at its index, as either a 4-number rgba table or a boolean.  If the pass has a depth texture, there will also be a `depth` key with its clear value as a number or boolean.
function Pass:getClear() end

---Returns the dimensions of the textures of the Pass's canvas, in pixels.
---
---#### Notes:
---
---If the pass doesn't have a canvas, this function returns zeros.
---
---@return number width The texture width.
---@return number height The texture height.
function Pass:getDimensions() end

---Returns the height of the textures of the Pass's canvas, in pixels.
---
---#### Notes:
---
---If the pass doesn't have a canvas, this function returns zero.
---
---@return number height The texture height.
function Pass:getHeight() end

---Returns the debug label of the Pass, which will show up when the Pass is printed and in some graphics debugging tools.  This is set when the Pass is created, and can't be changed afterwards.
---
---@return string label The label, or nil if none was set.
function Pass:getLabel() end

---Returns the projection for a single view.
---
---@param view number The view index.
---@return number left The left field of view angle, in radians.
---@return number right The right field of view angle, in radians.
---@return number up The top field of view angle, in radians.
---@return number down The bottom field of view angle, in radians.
function Pass:getProjection(view) end

---Returns the projection for a single view.
---
---@param view number The view index.
---@param matrix Mat4 The matrix to fill with the projection.
---@return Mat4 matrix The matrix containing the projection.
function Pass:getProjection(view, matrix) end

---Returns statistics for the Pass.
---
---#### Example:
---
---See how long it takes the GPU to render a cube.
---
---```lua
---lovr.graphics.setTimingEnabled(true)
---
---function lovr.draw(pass)
---  pass:cube(0, 1.7, -1, .5, lovr.timer.getTime() * .2, 0, 1, 0)
---
---  local stats = pass:getStats()
---  print(('Rendering a cube takes %f microseconds'):format(stats.gpuTime * 1e6))
---end
---```
---
---@return table stats A table with statistics.
function Pass:getStats() end

---Returns the Buffer that tally results will be written to.  Each time the render pass finishes, the results of all the tallies will be copied to the Buffer at the specified offset.  The buffer can be used in a later pass in a compute shader, or the data in the buffer can be read back using e.g. `Buffer:newReadback`.
---
---If no buffer has been set, this function will return `nil`.
---
---@return Buffer buffer The buffer.
---@return number offset An offset in the buffer where results will be written.
function Pass:getTallyBuffer() end

---Returns the view count of a render pass.  This is the layer count of the textures it is rendering to.
---
---#### Notes:
---
---A render pass has one "camera" for each view.  Whenever something is drawn, it is broadcast to each view (layer) of each texture, using the corresponding camera.
---
---@return number views The view count.
function Pass:getViewCount() end

---Get the pose of a single view.
---
---@param view number The view index.
---@return number x The x position of the viewer, in meters.
---@return number y The y position of the viewer, in meters.
---@return number z The z position of the viewer, in meters.
---@return number angle The number of radians the viewer is rotated around its axis of rotation.
---@return number ax The x component of the axis of rotation.
---@return number ay The y component of the axis of rotation.
---@return number az The z component of the axis of rotation.
function Pass:getViewPose(view) end

---Get the pose of a single view.
---
---@param view number The view index.
---@param matrix Mat4 The matrix to fill with the view pose.
---@param invert boolean Whether the matrix should be inverted.
---@return Mat4 matrix The matrix containing the view pose.
function Pass:getViewPose(view, matrix, invert) end

---Returns a world space ray for a pixel in the Pass's canvas.  This is useful for interacting with objects with the mouse.  This uses the current pose and projection of the camera, previously set using `Pass:setViewPose` and `Pass:setProjection`.
---
---#### Notes:
---
---The upper-left of the canvas is located at `(0,0)`.
---
---@param x number The x coordinate of the pixel.
---@param y number The y coordinate of the pixel.
---@param view? number The view (camera) to get the ray for.
---@return number x The x coordinate of the origin of the ray (on the near plane of the camera).
---@return number y The y coordinate of the origin of the ray (on the near plane of the camera).
---@return number z The z coordinate of the origin of the ray (on the near plane of the camera).
---@return number dx The x component of the ray's direction (normalized).
---@return number dy The y component of the ray's direction (normalized).
---@return number dz The z component of the ray's direction (normalized).
function Pass:getViewRay(x, y, view) end

---Returns the width of the textures of the Pass's canvas, in pixels.
---
---#### Notes:
---
---If the pass doesn't have a canvas, this function returns zero.
---
---@return number width The texture width.
function Pass:getWidth() end

---Draws a line between points.  `Pass:mesh` can also be used to draw line segments using the `line` `DrawMode`.
---
---#### Notes:
---
---There is currently no way to increase line thickness.
---
---@param x1 number The x coordinate of the first point.
---@param y1 number The y coordinate of the first point.
---@param z1 number The z coordinate of the first point.
---@param x2 number The x coordinate of the next point.
---@param y2 number The y coordinate of the next point.
---@param z2 number The z coordinate of the next point.
---@param ... number More points to add to the line.
function Pass:line(x1, y1, z1, x2, y2, z2, ...) end

---Draws a line between points.  `Pass:mesh` can also be used to draw line segments using the `line` `DrawMode`.
---
---#### Notes:
---
---There is currently no way to increase line thickness.
---
---@param t {number | vector} A table of numbers or vectors (not a mix) representing points of the line.
function Pass:line(t) end

---Draws a line between points.  `Pass:mesh` can also be used to draw line segments using the `line` `DrawMode`.
---
---#### Notes:
---
---There is currently no way to increase line thickness.
---
---@param v1 vector A vector containing the position of the first point of the line.
---@param v2 vector A vector containing the position of the next point on the line.
---@param ... vector More points to add to the line.
function Pass:line(v1, v2, ...) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param x? number The x coordinate of the position to draw the mesh at.
---@param y? number The y coordinate of the position to draw the mesh at.
---@param z? number The z coordinate of the position to draw the mesh at.
---@param scale? number The scale of the mesh.
---@param angle? number The number of radians the mesh is rotated around its rotational axis.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param start? number The 1-based index of the first vertex to render from the vertex buffer (or the first index, when using an index buffer).
---@param count? number The number of vertices to render (or the number of indices, when using an index buffer). When `nil`, as many vertices or indices as possible will be drawn (based on the length of the Buffers and `start`).
---@param instances? number The number of copies of the mesh to render.
function Pass:mesh(vertices, x, y, z, scale, angle, ax, ay, az, start, count, instances) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param position vector The position to draw the mesh at.
---@param scales vector The scale of the mesh.
---@param orientation quaternion The orientation of the mesh.
---@param start? number The 1-based index of the first vertex to render from the vertex buffer (or the first index, when using an index buffer).
---@param count? number The number of vertices to render (or the number of indices, when using an index buffer). When `nil`, as many vertices or indices as possible will be drawn (based on the length of the Buffers and `start`).
---@param instances? number The number of copies of the mesh to render.
function Pass:mesh(vertices, position, scales, orientation, start, count, instances) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param transform Mat4 The transform to apply to the mesh.
---@param start? number The 1-based index of the first vertex to render from the vertex buffer (or the first index, when using an index buffer).
---@param count? number The number of vertices to render (or the number of indices, when using an index buffer). When `nil`, as many vertices or indices as possible will be drawn (based on the length of the Buffers and `start`).
---@param instances? number The number of copies of the mesh to render.
function Pass:mesh(vertices, transform, start, count, instances) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param indices Buffer The buffer containing the vertex indices to draw.
---@param x? number The x coordinate of the position to draw the mesh at.
---@param y? number The y coordinate of the position to draw the mesh at.
---@param z? number The z coordinate of the position to draw the mesh at.
---@param scale? number The scale of the mesh.
---@param angle? number The number of radians the mesh is rotated around its rotational axis.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param start? number The 1-based index of the first vertex to render from the vertex buffer (or the first index, when using an index buffer).
---@param count? number The number of vertices to render (or the number of indices, when using an index buffer). When `nil`, as many vertices or indices as possible will be drawn (based on the length of the Buffers and `start`).
---@param instances? number The number of copies of the mesh to render.
---@param base? number A base offset to apply to vertex indices.
function Pass:mesh(vertices, indices, x, y, z, scale, angle, ax, ay, az, start, count, instances, base) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param indices Buffer The buffer containing the vertex indices to draw.
---@param position vector The position to draw the mesh at.
---@param scales vector The scale of the mesh.
---@param orientation quaternion The orientation of the mesh.
---@param start? number The 1-based index of the first vertex to render from the vertex buffer (or the first index, when using an index buffer).
---@param count? number The number of vertices to render (or the number of indices, when using an index buffer). When `nil`, as many vertices or indices as possible will be drawn (based on the length of the Buffers and `start`).
---@param instances? number The number of copies of the mesh to render.
---@param base? number A base offset to apply to vertex indices.
function Pass:mesh(vertices, indices, position, scales, orientation, start, count, instances, base) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param indices Buffer The buffer containing the vertex indices to draw.
---@param transform Mat4 The transform to apply to the mesh.
---@param start? number The 1-based index of the first vertex to render from the vertex buffer (or the first index, when using an index buffer).
---@param count? number The number of vertices to render (or the number of indices, when using an index buffer). When `nil`, as many vertices or indices as possible will be drawn (based on the length of the Buffers and `start`).
---@param instances? number The number of copies of the mesh to render.
---@param base? number A base offset to apply to vertex indices.
function Pass:mesh(vertices, indices, transform, start, count, instances, base) end

---Draws a mesh.
---
---#### Notes:
---
---The index buffer defines the order the vertices are drawn in.  It can be used to reorder, reuse, or omit vertices from the mesh.
---
---When drawing without a vertex buffer, the `VertexIndex` variable can be used in shaders to compute the position of each vertex, possibly by reading data from other `Buffer` or `Texture` resources.
---
---The active `DrawMode` controls whether the vertices are drawn as points, lines, or triangles.
---
---The active `Material` is applied to the mesh.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local vertices = {
---    { vec3(  0,  .4, 0), vec4(1, 0, 0, 1) },
---    { vec3(-.5, -.4, 0), vec4(0, 1, 0, 1) },
---    { vec3( .5, -.4, 0), vec4(0, 0, 1, 1) }
---  }
---
---  local format = {
---    { name = 'VertexPosition', type = 'vec3' },
---    { name = 'VertexColor', type = 'vec4' }
---  }
---
---  triangle = lovr.graphics.newBuffer(format, vertices)
---end
---
---function lovr.draw(pass)
---  pass:mesh(triangle, 0, 1.7, -1)
---end
---```
---
---@param vertices? Buffer The buffer containing the vertices to draw.
---@param indices Buffer The buffer containing the vertex indices to draw.
---@param draws Buffer The buffer containing indirect draw commands.
---@param drawcount? number The number of indirect draws to draw.
---@param offset? number A byte offset into the draw buffer.
---@param stride? number The number of bytes between consecutive elements in the draw buffer.  When zero or nil, the stride is autodetected, and will be 20 bytes when an index buffer is provided and 16 bytes otherwise.
function Pass:mesh(vertices, indices, draws, drawcount, offset, stride) end

---Resets the transform back to the origin.
---
function Pass:origin() end

---Draws a plane.
---
---@param x? number The x coordinate of the center of the plane.
---@param y? number The y coordinate of the center of the plane.
---@param z? number The z coordinate of the center of the plane.
---@param width? number The width of the plane.
---@param height? number The height of the plane.
---@param angle? number The rotation of the plane around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param style? DrawStyle Whether the plane should be drawn filled or outlined.
---@param columns? number The number of horizontal segments in the plane.
---@param rows? number The number of vertical segments in the plane.
function Pass:plane(x, y, z, width, height, angle, ax, ay, az, style, columns, rows) end

---Draws a plane.
---
---@param position vector The position of the plane.
---@param size vector The size of the plane.
---@param orientation quaternion The orientation of the plane.
---@param style? DrawStyle Whether the plane should be drawn filled or outlined.
---@param columns? number The number of horizontal segments in the plane.
---@param rows? number The number of vertical segments in the plane.
function Pass:plane(position, size, orientation, style, columns, rows) end

---Draws a plane.
---
---@param transform Mat4 The transform of the plane.
---@param style? DrawStyle Whether the plane should be drawn filled or outlined.
---@param columns? number The number of horizontal segments in the plane.
---@param rows? number The number of vertical segments in the plane.
function Pass:plane(transform, style, columns, rows) end

---Draws points.  `Pass:mesh` can also be used to draw points using a `Buffer`.
---
---#### Notes:
---
---To change the size of points, set the `pointSize` shader flag in `lovr.graphics.newShader` or write to the `PointSize` variable in the vertex shader.  Points are always the same size on the screen, regardless of distance, and the units are in pixels.
---
---@param x number The x coordinate of the first point.
---@param y number The y coordinate of the first point.
---@param z number The z coordinate of the first point.
---@param ... any More points.
function Pass:points(x, y, z, ...) end

---Draws points.  `Pass:mesh` can also be used to draw points using a `Buffer`.
---
---#### Notes:
---
---To change the size of points, set the `pointSize` shader flag in `lovr.graphics.newShader` or write to the `PointSize` variable in the vertex shader.  Points are always the same size on the screen, regardless of distance, and the units are in pixels.
---
---@param t {number | vector} A table of numbers or vectors (not both) representing point positions.
function Pass:points(t) end

---Draws points.  `Pass:mesh` can also be used to draw points using a `Buffer`.
---
---#### Notes:
---
---To change the size of points, set the `pointSize` shader flag in `lovr.graphics.newShader` or write to the `PointSize` variable in the vertex shader.  Points are always the same size on the screen, regardless of distance, and the units are in pixels.
---
---@param v vector A vector containing the position of the first point to draw.
---@param ... any More points.
function Pass:points(v, ...) end

---Draws a polygon.  The 3D vertices must be coplanar (all lie on the same plane), and the polygon must be convex (does not intersect itself or have any angles between vertices greater than 180 degrees), otherwise rendering artifacts may occur.
---
---#### Notes:
---
---Currently, the polygon will not have normal vectors.
---
---`Mesh` objects can also be used to draw arbitrary triangle meshes.
---
---@param x1 number The x coordinate of the first vertex.
---@param y1 number The y coordinate of the first vertex.
---@param z1 number The z coordinate of the first vertex.
---@param x2 number The x coordinate of the next vertex.
---@param y2 number The y coordinate of the next vertex.
---@param z2 number The z coordinate of the next vertex.
---@param ... any More vertices to add to the polygon.
function Pass:polygon(x1, y1, z1, x2, y2, z2, ...) end

---Draws a polygon.  The 3D vertices must be coplanar (all lie on the same plane), and the polygon must be convex (does not intersect itself or have any angles between vertices greater than 180 degrees), otherwise rendering artifacts may occur.
---
---#### Notes:
---
---Currently, the polygon will not have normal vectors.
---
---`Mesh` objects can also be used to draw arbitrary triangle meshes.
---
---@param t {number | vector} A table of numbers or vectors (not a mix) representing vertices of the polygon.
function Pass:polygon(t) end

---Draws a polygon.  The 3D vertices must be coplanar (all lie on the same plane), and the polygon must be convex (does not intersect itself or have any angles between vertices greater than 180 degrees), otherwise rendering artifacts may occur.
---
---#### Notes:
---
---Currently, the polygon will not have normal vectors.
---
---`Mesh` objects can also be used to draw arbitrary triangle meshes.
---
---@param v1 vector A vector containing the position of the first vertex of the polygon.
---@param v2 vector A vector containing the position of the next vertex on the polygon.
---@param ... any More vertices to add to the polygon.
function Pass:polygon(v1, v2, ...) end

---Pops the transform or render state stack, restoring it to the state it was in when it was last pushed.
---
---#### Notes:
---
---If a stack is popped without a corresponding push, the stack "underflows" which causes an error.
---
---@param stack? StackType The type of stack to pop.
function Pass:pop(stack) end

---Saves a copy of the transform or render states.  Further changes can be made to the transform or render states, and afterwards `Pass:pop` can be used to restore the original state.  Pushes and pops can be nested, but it's an error to pop without a corresponding push.
---
---#### Notes:
---
---Each stack has a limit of the number of copies it can store.  There can be 16 transforms and 4 render states saved.
---
---The `state` stack does not save the camera info or shader variables changed with `Pass:send`.
---
---@param stack? StackType The type of stack to push.
function Pass:push(stack) end

---Resets the Pass, clearing all of its draws and computes and resetting all of its state to the default values.
---
---#### Notes:
---
---The following things won't be reset:
---
---- Pass canvas, set with `Pass:setCanvas`.
---- Pass clears, set with `Pass:setClear`.
---- The tally buffer, set with `Pass:setTallyBuffer`.
---
function Pass:reset() end

---Rotates the coordinate system.
---
---@param angle number The amount to rotate the coordinate system by, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Pass:rotate(angle, ax, ay, az) end

---Rotates the coordinate system.
---
---@param rotation quaternion A quaternion containing the rotation to apply.
function Pass:rotate(rotation) end

---Draws a rounded rectangle.
---
---@param x? number The x coordinate of the center of the rectangle.
---@param y? number The y coordinate of the center of the rectangle.
---@param z? number The z coordinate of the center of the rectangle.
---@param width? number The width of the rectangle.
---@param height? number The height of the rectangle.
---@param thickness? number The thickness of the rectangle.
---@param angle? number The rotation of the rectangle around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param radius? number The radius of the rectangle corners.  If the radius is zero or negative, the rectangle will have sharp corners.
---@param segments? number The number of circular segments to use for each corner.  This increases the smoothness, but increases the number of vertices in the mesh.
function Pass:roundrect(x, y, z, width, height, thickness, angle, ax, ay, az, radius, segments) end

---Draws a rounded rectangle.
---
---@param position vector The position of the rectangle.
---@param size vector The size of the rectangle (width, height, thickness).
---@param orientation quaternion The orientation of the rectangle.
---@param radius? number The radius of the rectangle corners.  If the radius is zero or negative, the rectangle will have sharp corners.
---@param segments? number The number of circular segments to use for each corner.  This increases the smoothness, but increases the number of vertices in the mesh.
function Pass:roundrect(position, size, orientation, radius, segments) end

---Draws a rounded rectangle.
---
---@param transform Mat4 The transform of the rectangle.
---@param radius? number The radius of the rectangle corners.  If the radius is zero or negative, the rectangle will have sharp corners.
---@param segments? number The number of circular segments to use for each corner.  This increases the smoothness, but increases the number of vertices in the mesh.
function Pass:roundrect(transform, radius, segments) end

---Scales the coordinate system.
---
---@param sx number The x component of the scale.
---@param sy? number The y component of the scale.
---@param sz? number The z component of the scale.
function Pass:scale(sx, sy, sz) end

---Scales the coordinate system.
---
---@param scale vector The scale to apply.
function Pass:scale(scale) end

---Sends a value to a variable in the Pass's active `Shader`.  The active shader is changed using `Pass:setShader`.
---
---#### Notes:
---
---The new value will persist until a new shader is set that uses a different "type" for the binding number of the variable.  See `Pass:setShader` for more details.
---
---#### Example:
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    uniform sampler mySampler;
---    uniform Colors { vec4 colors[256]; };
---    uniform texture2D rocks;
---    uniform uint constant;
---
---    vec4 lovrmain() {
---      return DefaultPosition;
---    }
---  ]], 'unlit')
---
---  clampler = lovr.graphics.newSampler({ wrap = 'clamp' })
---  colorBuffer = lovr.graphics.newBuffer(256, 'vec4')
---  rockTexture = lovr.graphics.newTexture('rocks.jpg')
---end
---
---function lovr.draw(pass)
---  pass:setShader(shader)
---  pass:send('mySampler', clampler)
---  pass:send('Colors', colorBuffer)
---  pass:send('rocks', rockTexture)
---  pass:send('constant', 42)
---  -- Draw
---end
---```
---
---@param name string The name of the Shader variable.
---@param buffer Buffer The Buffer to assign.
---@param offset? number An offset from the start of the buffer where data will be read, in bytes.
---@param extent? number The number of bytes that will be available for reading.  If zero, as much data as possible will be bound, depending on the offset, buffer size, and the `uniformBufferRange` or `storageBufferRange` limit.
function Pass:send(name, buffer, offset, extent) end

---Sends a value to a variable in the Pass's active `Shader`.  The active shader is changed using `Pass:setShader`.
---
---#### Notes:
---
---The new value will persist until a new shader is set that uses a different "type" for the binding number of the variable.  See `Pass:setShader` for more details.
---
---#### Example:
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    uniform sampler mySampler;
---    uniform Colors { vec4 colors[256]; };
---    uniform texture2D rocks;
---    uniform uint constant;
---
---    vec4 lovrmain() {
---      return DefaultPosition;
---    }
---  ]], 'unlit')
---
---  clampler = lovr.graphics.newSampler({ wrap = 'clamp' })
---  colorBuffer = lovr.graphics.newBuffer(256, 'vec4')
---  rockTexture = lovr.graphics.newTexture('rocks.jpg')
---end
---
---function lovr.draw(pass)
---  pass:setShader(shader)
---  pass:send('mySampler', clampler)
---  pass:send('Colors', colorBuffer)
---  pass:send('rocks', rockTexture)
---  pass:send('constant', 42)
---  -- Draw
---end
---```
---
---@param name string The name of the Shader variable.
---@param texture Texture The Texture to assign.
function Pass:send(name, texture) end

---Sends a value to a variable in the Pass's active `Shader`.  The active shader is changed using `Pass:setShader`.
---
---#### Notes:
---
---The new value will persist until a new shader is set that uses a different "type" for the binding number of the variable.  See `Pass:setShader` for more details.
---
---#### Example:
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    uniform sampler mySampler;
---    uniform Colors { vec4 colors[256]; };
---    uniform texture2D rocks;
---    uniform uint constant;
---
---    vec4 lovrmain() {
---      return DefaultPosition;
---    }
---  ]], 'unlit')
---
---  clampler = lovr.graphics.newSampler({ wrap = 'clamp' })
---  colorBuffer = lovr.graphics.newBuffer(256, 'vec4')
---  rockTexture = lovr.graphics.newTexture('rocks.jpg')
---end
---
---function lovr.draw(pass)
---  pass:setShader(shader)
---  pass:send('mySampler', clampler)
---  pass:send('Colors', colorBuffer)
---  pass:send('rocks', rockTexture)
---  pass:send('constant', 42)
---  -- Draw
---end
---```
---
---@param name string The name of the Shader variable.
---@param sampler Sampler The Sampler to assign.
function Pass:send(name, sampler) end

---Sends a value to a variable in the Pass's active `Shader`.  The active shader is changed using `Pass:setShader`.
---
---#### Notes:
---
---The new value will persist until a new shader is set that uses a different "type" for the binding number of the variable.  See `Pass:setShader` for more details.
---
---#### Example:
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    uniform sampler mySampler;
---    uniform Colors { vec4 colors[256]; };
---    uniform texture2D rocks;
---    uniform uint constant;
---
---    vec4 lovrmain() {
---      return DefaultPosition;
---    }
---  ]], 'unlit')
---
---  clampler = lovr.graphics.newSampler({ wrap = 'clamp' })
---  colorBuffer = lovr.graphics.newBuffer(256, 'vec4')
---  rockTexture = lovr.graphics.newTexture('rocks.jpg')
---end
---
---function lovr.draw(pass)
---  pass:setShader(shader)
---  pass:send('mySampler', clampler)
---  pass:send('Colors', colorBuffer)
---  pass:send('rocks', rockTexture)
---  pass:send('constant', 42)
---  -- Draw
---end
---```
---
---@param name string The name of the Shader variable.
---@param data any Numbers, booleans, vectors, or tables to assign to the data or uniform buffer.
function Pass:send(name, data) end

---Sets whether alpha to coverage is enabled.  Alpha to coverage factors the alpha of a pixel into antialiasing calculations.  It can be used to get antialiased edges on textures with transparency.  It's often used for foliage.
---
---#### Notes:
---
---By default, alpha to coverage is disabled.
---
---@param enable boolean Whether alpha to coverage should be enabled.
function Pass:setAlphaToCoverage(enable) end

---Sets the blend mode.  When a pixel is drawn, the blend mode controls how it is mixed with the color and alpha of the pixel underneath it.
---
---See `Pass:setBlendState` for a lower-level alternative that allows for more control over the blending equation.
---
---#### Notes:
---
---The default blend mode is `alpha` with the `alphamultiply` alpha mode.
---
---@param blend BlendMode The blend mode.
---@param alphaBlend BlendAlphaMode The alpha blend mode, used to control premultiplied alpha.
function Pass:setBlendMode(blend, alphaBlend) end

---Sets the blend mode.  When a pixel is drawn, the blend mode controls how it is mixed with the color and alpha of the pixel underneath it.
---
---See `Pass:setBlendState` for a lower-level alternative that allows for more control over the blending equation.
---
---#### Notes:
---
---The default blend mode is `alpha` with the `alphamultiply` alpha mode.
---
function Pass:setBlendMode() end

---Sets the blend mode.  When a pixel is drawn, the blend mode controls how it is mixed with the color and alpha of the pixel underneath it.
---
---See `Pass:setBlendState` for a lower-level alternative that allows for more control over the blending equation.
---
---#### Notes:
---
---The default blend mode is `alpha` with the `alphamultiply` alpha mode.
---
---@param index number The index of the canvas texture that will use the new blend mode.
---@param blend BlendMode The blend mode.
---@param alphaBlend BlendAlphaMode The alpha blend mode, used to control premultiplied alpha.
function Pass:setBlendMode(index, blend, alphaBlend) end

---Sets the blend mode.  When a pixel is drawn, the blend mode controls how it is mixed with the color and alpha of the pixel underneath it.
---
---See `Pass:setBlendState` for a lower-level alternative that allows for more control over the blending equation.
---
---#### Notes:
---
---The default blend mode is `alpha` with the `alphamultiply` alpha mode.
---
---@param index number The index of the canvas texture that will use the new blend mode.
function Pass:setBlendMode(index) end

---Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel underneath it.
---
---#### Notes:
---
---[This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
---
---@param op BlendOp The blend operation to use for color and alpha.
---@param src BlendFactor The source factor to use for color and alpha.
---@param dst BlendFactor The destination factor to use for color and alpha.
function Pass:setBlendState(op, src, dst) end

---Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel underneath it.
---
---#### Notes:
---
---[This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
---
---@param opColor BlendOp The blend operation to use for color.
---@param opAlpha BlendOp The blend operation to use for alpha.
---@param srcColor BlendFactor The source factor to use for color.
---@param srcAlpha BlendFactor The source factor to use for alpha.
---@param dstColor BlendFactor The destination factor to use for color.
---@param dstAlpha BlendFactor The destination factor to use for alpha.
function Pass:setBlendState(opColor, opAlpha, srcColor, srcAlpha, dstColor, dstAlpha) end

---Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel underneath it.
---
---#### Notes:
---
---[This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
---
function Pass:setBlendState() end

---Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel underneath it.
---
---#### Notes:
---
---[This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
---
---@param index number The index of the canvas texture that will use the new blend state.
---@param op BlendOp The blend operation to use for color and alpha.
---@param src BlendFactor The source factor to use for color and alpha.
---@param dst BlendFactor The destination factor to use for color and alpha.
function Pass:setBlendState(index, op, src, dst) end

---Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel underneath it.
---
---#### Notes:
---
---[This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
---
---@param index number The index of the canvas texture that will use the new blend state.
---@param opColor BlendOp The blend operation to use for color.
---@param opAlpha BlendOp The blend operation to use for alpha.
---@param srcColor BlendFactor The source factor to use for color.
---@param srcAlpha BlendFactor The source factor to use for alpha.
---@param dstColor BlendFactor The destination factor to use for color.
---@param dstAlpha BlendFactor The destination factor to use for alpha.
function Pass:setBlendState(index, opColor, opAlpha, srcColor, srcAlpha, dstColor, dstAlpha) end

---Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel underneath it.
---
---#### Notes:
---
---[This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
---
---@param index number The index of the canvas texture that will use the new blend state.
function Pass:setBlendState(index) end

---Sets the Pass's canvas.  The canvas is a set of textures that the Pass will draw to when it's submitted, along with configuration for the depth buffer and antialiasing.
---
---#### Notes:
---
---Changing the canvas will reset the pass, as though `Pass:reset` was called.
---
---All textures must have the same dimensions, layer counts, and multisample counts.  They also must have been created with the `render` usage flag.
---
---The number of layers in the textures determines how many views (cameras) the pass has.  Each draw will be rendered to all texture layers, as seen from the corresponding camera.  For example, VR rendering will use a canvas texture with 2 layers, one for each eye.
---
---To render to a specific mipmap level or layer of a texture, use texture views (`lovr.graphics.newTextureView`).
---
---Mipmaps will be regenerated for all of canvas textures at the end of a render pass.
---
---If the Pass has multiple color textures, a fragment shader should be used to write a different color to each texture.  Here's an example that writes red to the first texture and blue to the second texture:
---
---    // Declare an output variable for the second texture
---    layout(location = 1) out vec4 secondColor;
---
---    vec4 lovrmain() {
---      secondColor = vec4(0, 0, 1, 1);
---      return vec4(1, 0, 0, 1);
---    }
---
---@param ... Texture One or more color textures the pass will render to.
function Pass:setCanvas(...) end

---Sets the Pass's canvas.  The canvas is a set of textures that the Pass will draw to when it's submitted, along with configuration for the depth buffer and antialiasing.
---
---#### Notes:
---
---Changing the canvas will reset the pass, as though `Pass:reset` was called.
---
---All textures must have the same dimensions, layer counts, and multisample counts.  They also must have been created with the `render` usage flag.
---
---The number of layers in the textures determines how many views (cameras) the pass has.  Each draw will be rendered to all texture layers, as seen from the corresponding camera.  For example, VR rendering will use a canvas texture with 2 layers, one for each eye.
---
---To render to a specific mipmap level or layer of a texture, use texture views (`lovr.graphics.newTextureView`).
---
---Mipmaps will be regenerated for all of canvas textures at the end of a render pass.
---
---If the Pass has multiple color textures, a fragment shader should be used to write a different color to each texture.  Here's an example that writes red to the first texture and blue to the second texture:
---
---    // Declare an output variable for the second texture
---    layout(location = 1) out vec4 secondColor;
---
---    vec4 lovrmain() {
---      secondColor = vec4(0, 0, 1, 1);
---      return vec4(1, 0, 0, 1);
---    }
---
---@param canvas? {depth: any, samples: number} The canvas.  Each numeric key is a color texture to render to (up to 4), along with the following keys to control depth buffer and antialiasing settings:
function Pass:setCanvas(canvas) end

---Sets the Pass's canvas.  The canvas is a set of textures that the Pass will draw to when it's submitted, along with configuration for the depth buffer and antialiasing.
---
---#### Notes:
---
---Changing the canvas will reset the pass, as though `Pass:reset` was called.
---
---All textures must have the same dimensions, layer counts, and multisample counts.  They also must have been created with the `render` usage flag.
---
---The number of layers in the textures determines how many views (cameras) the pass has.  Each draw will be rendered to all texture layers, as seen from the corresponding camera.  For example, VR rendering will use a canvas texture with 2 layers, one for each eye.
---
---To render to a specific mipmap level or layer of a texture, use texture views (`lovr.graphics.newTextureView`).
---
---Mipmaps will be regenerated for all of canvas textures at the end of a render pass.
---
---If the Pass has multiple color textures, a fragment shader should be used to write a different color to each texture.  Here's an example that writes red to the first texture and blue to the second texture:
---
---    // Declare an output variable for the second texture
---    layout(location = 1) out vec4 secondColor;
---
---    vec4 lovrmain() {
---      secondColor = vec4(0, 0, 1, 1);
---      return vec4(1, 0, 0, 1);
---    }
---
function Pass:setCanvas() end

---Sets the clear values of the pass.  This controls the initial colors of the canvas texture pixels at the beginning of the render pass.  For each color texture, it can be one of the following:
---
---- A specific RGBA color value (or number for the depth texture).
---- `true`, to do a "fast clear" to undefined values.  This is useful if the pass is going to end
---  up drawing to all of the texture's pixels.
---- `false`, to avoid clearing and load the texture's existing pixels.  This can be slow on mobile
---  GPUs.
---
---#### Notes:
---
---If the depth clear is not given, it will be set to 0.
---
---All clear colors will default to transparent black (all zeros) when the Pass is created.
---
---@param hex number A hexcode color to clear all color textures to.
function Pass:setClear(hex) end

---Sets the clear values of the pass.  This controls the initial colors of the canvas texture pixels at the beginning of the render pass.  For each color texture, it can be one of the following:
---
---- A specific RGBA color value (or number for the depth texture).
---- `true`, to do a "fast clear" to undefined values.  This is useful if the pass is going to end
---  up drawing to all of the texture's pixels.
---- `false`, to avoid clearing and load the texture's existing pixels.  This can be slow on mobile
---  GPUs.
---
---#### Notes:
---
---If the depth clear is not given, it will be set to 0.
---
---All clear colors will default to transparent black (all zeros) when the Pass is created.
---
---@param r number The red component of the clear color.
---@param g number The green component of the clear color.
---@param b number The blue component of the clear color.
---@param a? number The alpha component of the clear color.
function Pass:setClear(r, g, b, a) end

---Sets the clear values of the pass.  This controls the initial colors of the canvas texture pixels at the beginning of the render pass.  For each color texture, it can be one of the following:
---
---- A specific RGBA color value (or number for the depth texture).
---- `true`, to do a "fast clear" to undefined values.  This is useful if the pass is going to end
---  up drawing to all of the texture's pixels.
---- `false`, to avoid clearing and load the texture's existing pixels.  This can be slow on mobile
---  GPUs.
---
---#### Notes:
---
---If the depth clear is not given, it will be set to 0.
---
---All clear colors will default to transparent black (all zeros) when the Pass is created.
---
---@param clear boolean Whether color textures should be cleared.
function Pass:setClear(clear) end

---Sets the clear values of the pass.  This controls the initial colors of the canvas texture pixels at the beginning of the render pass.  For each color texture, it can be one of the following:
---
---- A specific RGBA color value (or number for the depth texture).
---- `true`, to do a "fast clear" to undefined values.  This is useful if the pass is going to end
---  up drawing to all of the texture's pixels.
---- `false`, to avoid clearing and load the texture's existing pixels.  This can be slow on mobile
---  GPUs.
---
---#### Notes:
---
---If the depth clear is not given, it will be set to 0.
---
---All clear colors will default to transparent black (all zeros) when the Pass is created.
---
---@param t table A table of clear values.  This can be a table of 4 numbers to use for all color textures, or it can be a list of boolean and/or RGBA tables to use for each individual color texture.  It can also have a `depth` key with a boolean/number for the depth texture's clear.
function Pass:setClear(t) end

---Sets the color used for drawing.  Color components are from 0 to 1.
---
---#### Notes:
---
---The default color is `(1, 1, 1, 1)`.
---
---@param r number The red component of the color.
---@param g number The green component of the color.
---@param b number The blue component of the color.
---@param a? number The alpha component of the color.
function Pass:setColor(r, g, b, a) end

---Sets the color used for drawing.  Color components are from 0 to 1.
---
---#### Notes:
---
---The default color is `(1, 1, 1, 1)`.
---
---@param t {number} A table of 3 or 4 color components.
function Pass:setColor(t) end

---Sets the color used for drawing.  Color components are from 0 to 1.
---
---#### Notes:
---
---The default color is `(1, 1, 1, 1)`.
---
---@param hex number A hexcode.
---@param a? number The alpha component of the color.
function Pass:setColor(hex, a) end

---Sets the color channels affected by drawing, on a per-channel basis.  Disabling color writes is often used to render to the depth or stencil buffer without affecting existing pixel colors.
---
---#### Notes:
---
---By default, color writes are enabled for all channels.
---
---@param enable boolean Whether all color components should be affected by draws.
function Pass:setColorWrite(enable) end

---Sets the color channels affected by drawing, on a per-channel basis.  Disabling color writes is often used to render to the depth or stencil buffer without affecting existing pixel colors.
---
---#### Notes:
---
---By default, color writes are enabled for all channels.
---
---@param r boolean Whether the red component should be affected by draws.
---@param g boolean Whether the green component should be affected by draws.
---@param b boolean Whether the blue component should be affected by draws.
---@param a boolean Whether the alpha component should be affected by draws.
function Pass:setColorWrite(r, g, b, a) end

---Sets the color channels affected by drawing, on a per-channel basis.  Disabling color writes is often used to render to the depth or stencil buffer without affecting existing pixel colors.
---
---#### Notes:
---
---By default, color writes are enabled for all channels.
---
---@param index number The index of the canvas texture to update.
---@param enable boolean Whether all color components should be affected by draws.
function Pass:setColorWrite(index, enable) end

---Sets the color channels affected by drawing, on a per-channel basis.  Disabling color writes is often used to render to the depth or stencil buffer without affecting existing pixel colors.
---
---#### Notes:
---
---By default, color writes are enabled for all channels.
---
---@param index number The index of the canvas texture to update.
---@param r boolean Whether the red component should be affected by draws.
---@param g boolean Whether the green component should be affected by draws.
---@param b boolean Whether the blue component should be affected by draws.
---@param a boolean Whether the alpha component should be affected by draws.
function Pass:setColorWrite(index, r, g, b, a) end

---Sets whether the front or back faces of triangles are culled.
---
---#### Notes:
---
---By default, face culling is disabled.
---
---@param mode CullMode Whether `front` faces, `back` faces, or `none` of the faces should be culled.
---@deprecated
function Pass:setCullMode(mode) end

---Sets whether the front or back faces of triangles are culled.
---
---#### Notes:
---
---By default, face culling is disabled.
---
---@deprecated
function Pass:setCullMode() end

---Enables or disables depth clamp.  Normally, when pixels fall outside of the clipping planes, they are clipped (not rendered).  Depth clamp will instead render these pixels, clamping their depth on to the clipping planes.
---
---#### Notes:
---
---This isn\'t supported on all GPUs.  Use the `depthClamp` feature of `lovr.graphics.getFeatures` to check for support.  If depth clamp is enabled when unsupported, it will silently fall back to depth clipping.
---
---Depth clamping is not enabled by default.
---
---@param enable boolean Whether depth clamp should be enabled.
function Pass:setDepthClamp(enable) end

---Set the depth offset.  This is a constant offset added to the depth value of pixels, as well as a "sloped" depth offset that is scaled based on the "slope" of the depth at the pixel.
---
---This can be used to fix Z fighting when rendering decals or other nearly-overlapping objects, and is also useful for shadow biasing when implementing shadow mapping.
---
---#### Notes:
---
---The default depth offset is zero for both values.
---
---This only applies to triangles, not points or lines.
---
---The units for these offsets aren't specified very well -- they depend on the format of the depth texture, and the GPU can use them slightly differently for its depth calculations.  However, an `offset` of 1 will roughly correspond to the smallest-possible depth difference (e.g. 2^-16 for a `d16` depth texture).
---
---The sloped depth scale is multiplied by the slope of the depth of the triangle.  For example, if pixels in the triangle all have the same depth (i.e. the triangle is facing the camera), then the slope of the depth will be zero and the sloped depth offset won't have any effect.  As the triangle starts to face away from the camera, the slope of the depth will increase and the sloped depth offset will begin to apply.  This can also be thought of corresponding to the normal vector of the triangle relative to the camera.
---
---Note that the offsets can be negative.  With LÖVR's default projection matrix, depth values of zero are far away and one are close up, so positive depth offsets will push depth values "closer" to the viewer.  With flipped projection matrices (a depth test of `lequal`), negative depth offsets would be used instead.
---
---@param offset? number The depth offset.
---@param sloped? number The sloped depth offset.
function Pass:setDepthOffset(offset, sloped) end

---Sets the depth test.
---
---#### Notes:
---
---When using LÖVR's default projection (reverse Z with infinite far plane) the default depth test is `gequal`, depth values of 0.0 are on the far plane and depth values of 1.0 are on the near plane, closer to the camera.
---
---The near and far clipping planes are set with `Pass:setProjection`.  The default is set with `lovr.headset.setClipDistance`.
---
---A depth buffer must be present to use the depth test, but this is enabled by default.
---
---@param test CompareMode The new depth test to use.
function Pass:setDepthTest(test) end

---Sets the depth test.
---
---#### Notes:
---
---When using LÖVR's default projection (reverse Z with infinite far plane) the default depth test is `gequal`, depth values of 0.0 are on the far plane and depth values of 1.0 are on the near plane, closer to the camera.
---
---The near and far clipping planes are set with `Pass:setProjection`.  The default is set with `lovr.headset.setClipDistance`.
---
---A depth buffer must be present to use the depth test, but this is enabled by default.
---
function Pass:setDepthTest() end

---Sets whether draws write to the depth buffer.  When a pixel is drawn, if depth writes are enabled and the pixel passes the depth test, the depth buffer will be updated with the pixel's depth value.
---
---#### Notes:
---
---The default depth write is `true`.
---
---@param write boolean Whether the depth buffer should be affected by draws.
function Pass:setDepthWrite(write) end

---Sets whether the front or back faces of triangles are culled.
---
---#### Notes:
---
---By default, face culling is disabled.
---
---@param mode CullMode Whether `front` faces, `back` faces, or `none` of the faces should be culled.
function Pass:setFaceCull(mode) end

---Sets whether the front or back faces of triangles are culled.
---
---#### Notes:
---
---By default, face culling is disabled.
---
function Pass:setFaceCull() end

---Sets the font used for `Pass:text`.
---
---@param font Font The Font to use when rendering text.
function Pass:setFont(font) end

---Sets the material.  This will apply to most drawing, except for text, skyboxes, and models, which use their own materials.
---
---@param material Texture | Material The texture or material to apply to surfaces.
function Pass:setMaterial(material) end

---Sets the material.  This will apply to most drawing, except for text, skyboxes, and models, which use their own materials.
---
function Pass:setMaterial() end

---Changes the way vertices are connected together when drawing using `Pass:mesh`.
---
---#### Notes:
---
---The default mesh mode is `triangles`.
---
---@param mode DrawMode The mesh mode to use.
function Pass:setMeshMode(mode) end

---Sets the camera projection.  This can set the projection for a single view by giving its index, otherwise the projection will be set for all views.  The number of views is determined by the number of array layers in the canvas textures.
---
---The Pass returned by `lovr.headset.getPass` will have its views automatically configured to match the headset.
---
---#### Notes:
---
---By default, the projection is set by the headset.  Each HMD has a specific field of view given by `lovr.headset.getViewAngles`, and the clipping planes can be customized with `lovr.headset.setClipDistance`.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  -- Orthographic/2D
---  pass:setProjection('orthographic')
---
---  -- 90 degree perspective projection
---  pass:setProjection('perspective', math.rad(90))
---
---  -- Asymmetric, for 1 view
---  local fov = math.rad(60) / 2
---  pass:setProjection(1, fov, fov, fov, fov, .1, 0)
---
---  -- Copying from headset
---  for i = 1, lovr.headset.getViewCount() do
---    local left, right, up, down = lovr.headset.getViewAngles(i)
---    local near, far = lovr.headset.getClipDistance()
---    pass:setProjection(i, left, right, up, down, near, far)
---  end
---end
---```
---
---@param type ProjectionType The type of projection to set.
---@param ... number Parameters for the projection.
function Pass:setProjection(type, ...) end

---Sets the camera projection.  This can set the projection for a single view by giving its index, otherwise the projection will be set for all views.  The number of views is determined by the number of array layers in the canvas textures.
---
---The Pass returned by `lovr.headset.getPass` will have its views automatically configured to match the headset.
---
---#### Notes:
---
---By default, the projection is set by the headset.  Each HMD has a specific field of view given by `lovr.headset.getViewAngles`, and the clipping planes can be customized with `lovr.headset.setClipDistance`.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  -- Orthographic/2D
---  pass:setProjection('orthographic')
---
---  -- 90 degree perspective projection
---  pass:setProjection('perspective', math.rad(90))
---
---  -- Asymmetric, for 1 view
---  local fov = math.rad(60) / 2
---  pass:setProjection(1, fov, fov, fov, fov, .1, 0)
---
---  -- Copying from headset
---  for i = 1, lovr.headset.getViewCount() do
---    local left, right, up, down = lovr.headset.getViewAngles(i)
---    local near, far = lovr.headset.getClipDistance()
---    pass:setProjection(i, left, right, up, down, near, far)
---  end
---end
---```
---
---@param matrix Mat4 The projection matrix.
function Pass:setProjection(matrix) end

---Sets the camera projection.  This can set the projection for a single view by giving its index, otherwise the projection will be set for all views.  The number of views is determined by the number of array layers in the canvas textures.
---
---The Pass returned by `lovr.headset.getPass` will have its views automatically configured to match the headset.
---
---#### Notes:
---
---By default, the projection is set by the headset.  Each HMD has a specific field of view given by `lovr.headset.getViewAngles`, and the clipping planes can be customized with `lovr.headset.setClipDistance`.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  -- Orthographic/2D
---  pass:setProjection('orthographic')
---
---  -- 90 degree perspective projection
---  pass:setProjection('perspective', math.rad(90))
---
---  -- Asymmetric, for 1 view
---  local fov = math.rad(60) / 2
---  pass:setProjection(1, fov, fov, fov, fov, .1, 0)
---
---  -- Copying from headset
---  for i = 1, lovr.headset.getViewCount() do
---    local left, right, up, down = lovr.headset.getViewAngles(i)
---    local near, far = lovr.headset.getClipDistance()
---    pass:setProjection(i, left, right, up, down, near, far)
---  end
---end
---```
---
---@param view number The index of the view to update.
---@param type ProjectionType The type of projection to set.
---@param ... number Parameters for the projection.
function Pass:setProjection(view, type, ...) end

---Sets the camera projection.  This can set the projection for a single view by giving its index, otherwise the projection will be set for all views.  The number of views is determined by the number of array layers in the canvas textures.
---
---The Pass returned by `lovr.headset.getPass` will have its views automatically configured to match the headset.
---
---#### Notes:
---
---By default, the projection is set by the headset.  Each HMD has a specific field of view given by `lovr.headset.getViewAngles`, and the clipping planes can be customized with `lovr.headset.setClipDistance`.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  -- Orthographic/2D
---  pass:setProjection('orthographic')
---
---  -- 90 degree perspective projection
---  pass:setProjection('perspective', math.rad(90))
---
---  -- Asymmetric, for 1 view
---  local fov = math.rad(60) / 2
---  pass:setProjection(1, fov, fov, fov, fov, .1, 0)
---
---  -- Copying from headset
---  for i = 1, lovr.headset.getViewCount() do
---    local left, right, up, down = lovr.headset.getViewAngles(i)
---    local near, far = lovr.headset.getClipDistance()
---    pass:setProjection(i, left, right, up, down, near, far)
---  end
---end
---```
---
---@param view number The index of the view to update.
---@param matrix Mat4 The projection matrix.
function Pass:setProjection(view, matrix) end

---Sets the camera projection.  This can set the projection for a single view by giving its index, otherwise the projection will be set for all views.  The number of views is determined by the number of array layers in the canvas textures.
---
---The Pass returned by `lovr.headset.getPass` will have its views automatically configured to match the headset.
---
---#### Notes:
---
---By default, the projection is set by the headset.  Each HMD has a specific field of view given by `lovr.headset.getViewAngles`, and the clipping planes can be customized with `lovr.headset.setClipDistance`.
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  -- Orthographic/2D
---  pass:setProjection('orthographic')
---
---  -- 90 degree perspective projection
---  pass:setProjection('perspective', math.rad(90))
---
---  -- Asymmetric, for 1 view
---  local fov = math.rad(60) / 2
---  pass:setProjection(1, fov, fov, fov, fov, .1, 0)
---
---  -- Copying from headset
---  for i = 1, lovr.headset.getViewCount() do
---    local left, right, up, down = lovr.headset.getViewAngles(i)
---    local near, far = lovr.headset.getClipDistance()
---    pass:setProjection(i, left, right, up, down, near, far)
---  end
---end
---```
---
---@param view number The index of the view to update.
---@param left number The left field of view angle, in radians.  Positive values are to the left of the view center.
---@param right number The right field of view angle, in radians.  Positive values are to the right of the view center.
---@param up number The top field of view angle, in radians.  Positive values are above the view center.
---@param down number The bottom field of view angle, in radians.  Positive values are below the view center.
---@param near? number The near clipping plane distance, in meters.
---@param far? number The far clipping plane distance, in meters.
---@deprecated
function Pass:setProjection(view, left, right, up, down, near, far) end

---Sets the default `Sampler` to use when sampling textures.  It is also possible to send a custom sampler to a shader using `Pass:send` and use that instead, which allows customizing the sampler on a per-texture basis.
---
---#### Notes:
---
---The `getPixel` shader helper function will use this sampler.
---
---When a Pass is reset, its sampler will be reset to `linear`.
---
---The sampler applies to all draws in the pass on submit, regardless of when the sampler is set.
---
---If you need different samplers for each draw, currently you have to send a `Sampler` object to a Shader (this is not ideal).
---
---#### Example:
---
---```lua
---function lovr.draw(pass)
---  pass:setSampler('nearest') -- activate minecraft mode
---  pass:setMaterial(rock)
---  pass:cube(x, y, z)
---end
---```
---
---@param sampler? Sampler | FilterMode The Sampler shaders will use when reading from textures.  It can also be a `FilterMode`, for convenience (other sampler settings will use their defaults).
function Pass:setSampler(sampler) end

---Sets the scissor rectangle.  Any pixels outside the scissor rectangle will not be drawn.
---
---#### Notes:
---
---Negative `x` and `y` will be clamped to zero.  `w` and `h` must be positive, and will be clamped to the size of the canvas.
---
---By default, the scissor covers the entire canvas.
---
---@param x number The x coordinate of the upper-left corner of the scissor rectangle.
---@param y number The y coordinate of the upper-left corner of the scissor rectangle.
---@param w number The width of the scissor rectangle.
---@param h number The height of the scissor rectangle.
function Pass:setScissor(x, y, w, h) end

---Sets the scissor rectangle.  Any pixels outside the scissor rectangle will not be drawn.
---
---#### Notes:
---
---Negative `x` and `y` will be clamped to zero.  `w` and `h` must be positive, and will be clamped to the size of the canvas.
---
---By default, the scissor covers the entire canvas.
---
function Pass:setScissor() end

---Sets the active shader.  The Shader will affect all drawing operations until it is changed again.
---
---#### Notes:
---
---Changing the shader will preserve variable values (the ones set using `Pass:send`) **unless** the new shader declares a variable with the same as one in the old shader, but a different type. The variable "type" means one of the following:
---
---- Uniform buffer (`uniform`).
---- Storage buffer (`buffer`).
---- Sampled texture, (`uniform texture<type>`).
---- Storage texture, (`uniform image<type>`).
---- Sampler (`uniform sampler`).
---
---If there's a clash in types, the variable will be reset to use a default resource:
---
---- Buffer variables do not have well-defined behavior when they are reset like this, and may
---  return random data or even crash the GPU.
---- Texture variable will use a default texture with a single white pixel.
---- Sampler variables will use a default sampler with a `linear` filter mode and `repeat` wrap
---  mode.
---
---Uniform variables with basic types like `float`, `vec3`, `mat4`, etc. will have their data preserved as long as both shaders declare the variable with the same name and type.
---
---@param shader Shader | DefaultShader The shader to use.
function Pass:setShader(shader) end

---Sets the active shader.  The Shader will affect all drawing operations until it is changed again.
---
---#### Notes:
---
---Changing the shader will preserve variable values (the ones set using `Pass:send`) **unless** the new shader declares a variable with the same as one in the old shader, but a different type. The variable "type" means one of the following:
---
---- Uniform buffer (`uniform`).
---- Storage buffer (`buffer`).
---- Sampled texture, (`uniform texture<type>`).
---- Storage texture, (`uniform image<type>`).
---- Sampler (`uniform sampler`).
---
---If there's a clash in types, the variable will be reset to use a default resource:
---
---- Buffer variables do not have well-defined behavior when they are reset like this, and may
---  return random data or even crash the GPU.
---- Texture variable will use a default texture with a single white pixel.
---- Sampler variables will use a default sampler with a `linear` filter mode and `repeat` wrap
---  mode.
---
---Uniform variables with basic types like `float`, `vec3`, `mat4`, etc. will have their data preserved as long as both shaders declare the variable with the same name and type.
---
function Pass:setShader() end

---Sets the stencil test.  Any pixels that fail the stencil test won't be drawn.  For example, setting the stencil test to `('equal', 1)` will only draw pixels that have a stencil value of 1. The stencil buffer can be modified by drawing while stencil writes are enabled with `lovr.graphics.setStencilWrite`.
---
---#### Notes:
---
---The stencil test is disabled by default.
---
---Setting the stencil test requires the `Pass` to have a depth texture with the `d24s8` or `d32fs8` format (the `s` means "stencil").  The `t.graphics.stencil` and `t.headset.stencil` flags in `lovr.conf` can be used to request a stencil format for the default window and headset passes, respectively.
---
---@param test CompareMode The new stencil test to use.
---@param value number The stencil value to compare against.
---@param mask? number An optional mask to apply to stencil values before the comparison.
function Pass:setStencilTest(test, value, mask) end

---Sets the stencil test.  Any pixels that fail the stencil test won't be drawn.  For example, setting the stencil test to `('equal', 1)` will only draw pixels that have a stencil value of 1. The stencil buffer can be modified by drawing while stencil writes are enabled with `lovr.graphics.setStencilWrite`.
---
---#### Notes:
---
---The stencil test is disabled by default.
---
---Setting the stencil test requires the `Pass` to have a depth texture with the `d24s8` or `d32fs8` format (the `s` means "stencil").  The `t.graphics.stencil` and `t.headset.stencil` flags in `lovr.conf` can be used to request a stencil format for the default window and headset passes, respectively.
---
function Pass:setStencilTest() end

---Sets or disables stencil writes.  When stencil writes are enabled, any pixels drawn will update the values in the stencil buffer using the `StencilAction` set.
---
---#### Notes:
---
---By default, stencil writes are disabled.
---
---Setting the stencil test requires the `Pass` to have a depth texture with the `d24s8` or `d32fs8` format (the `s` means "stencil").  The `t.graphics.stencil` and `t.headset.stencil` flags in `lovr.conf` can be used to request a stencil format for the default window and headset passes, respectively.
---
---@param action StencilAction | {StencilAction} How pixels should update the stencil buffer when they are drawn.  Can also be a list of 3 stencil actions, used when a pixel fails the stencil test, fails the depth test, or passes the stencil test, respectively.
---@param value? number When using the 'replace' action, this is the value to replace with.
---@param mask? number An optional mask to apply to stencil values before writing.
function Pass:setStencilWrite(action, value, mask) end

---Sets or disables stencil writes.  When stencil writes are enabled, any pixels drawn will update the values in the stencil buffer using the `StencilAction` set.
---
---#### Notes:
---
---By default, stencil writes are disabled.
---
---Setting the stencil test requires the `Pass` to have a depth texture with the `d24s8` or `d32fs8` format (the `s` means "stencil").  The `t.graphics.stencil` and `t.headset.stencil` flags in `lovr.conf` can be used to request a stencil format for the default window and headset passes, respectively.
---
function Pass:setStencilWrite() end

---Sets the Buffer where tally results will be written to.  Each time the render pass finishes, the results of all the tallies will be copied to the Buffer at the specified offset.  The buffer can be used in a later pass in a compute shader, or the data in the buffer can be read back using e.g. `Buffer:newReadback`.
---
---#### Notes:
---
---Each tally result is a 4-byte unsigned integer with the number of samples that passed the depth and stencil tests.
---
---If the buffer doesn't have enough room to store all the tallies, the number of tallies copied will be clamped to the minimum number that will fit.
---
---@param buffer Buffer The buffer.
---@param offset number A byte offset where results will be written.  Must be a multiple of 4.
function Pass:setTallyBuffer(buffer, offset) end

---Sets the Buffer where tally results will be written to.  Each time the render pass finishes, the results of all the tallies will be copied to the Buffer at the specified offset.  The buffer can be used in a later pass in a compute shader, or the data in the buffer can be read back using e.g. `Buffer:newReadback`.
---
---#### Notes:
---
---Each tally result is a 4-byte unsigned integer with the number of samples that passed the depth and stencil tests.
---
---If the buffer doesn't have enough room to store all the tallies, the number of tallies copied will be clamped to the minimum number that will fit.
---
function Pass:setTallyBuffer() end

---Enables or disables view frustum culling.  When enabled, if an object is drawn outside of the camera view, the draw will be skipped.  This can improve performance.
---
---#### Notes:
---
---View frustum culling is disabled by default.
---
---Objects will be culled against all views in the Pass.  The pose and projection for these views is controlled using `Pass:setViewPose` and `Pass:setProjection`.
---
---View frustum culling will increase CPU usage, but will reduce GPU usage depending on how many objects get culled and how many vertices they have.
---
---For most scenes that draw objects all around the camera, frustum culling will usually result in large speedups.  However, it's always good to measure to be sure.  For example, if every object drawn is in view, then frustum culling will only make things slower, because LÖVR will spend time checking if objects are in view without actually culling any of them.
---
---`Pass:getStats` will return `draws` and `drawsCulled` fields.  The `submitTime` and `gpuTime` fields (with `lovr.graphics.setTimingEnabled`) are a good way to measure the impact of culling.
---
---To cull an object against a view frustum, LÖVR needs to know the object's bounding box.  The following types of draws have bounding boxes:
---
---- `Pass:plane`
---- `Pass:roundrect`
---- `Pass:cube`
---- `Pass:box`
---- `Pass:circle`
---- `Pass:sphere`
---- `Pass:cylinder`
---- `Pass:cone`
---- `Pass:capsule`
---- `Pass:torus`
---- `Pass:draw` (see notes below for `Model` and `Mesh` objects)
---
---The following draws do **not** currently have bounding boxes, and will not be culled:
---
---- `Pass:points`
---- `Pass:line`
---- `Pass:text`
---- `Pass:skybox`
---- `Pass:fill`
---- `Pass:mesh`
---
---`Model` objects only compute their bounding box when they're loaded, using the initial node transforms.  If a model is animated, then the bounding box will become out of sync and culling will not work properly.  View culling should be disabled when rendering animated models.
---
---`Mesh` objects will not have a bounding box by default.  Meshes with a storage type of `cpu` can compute their bounding boxes using `Mesh:computeBoundingBox`, which should be called after creating the Mesh or whenever its vertices change.  Any type of Mesh can have its bounding box set manually using `Mesh:setBoundingBox`.  This can be faster than `Mesh:computeBoundingBox` if the bounding box is already known, and is the only way to give a `gpu` Mesh a bounding box.
---
---@param enable boolean Whether frustum culling should be enabled.
function Pass:setViewCull(enable) end

---Sets the pose for a single view.  Objects rendered in this view will appear as though the camera is positioned using the given pose.
---
---Up to 6 views are supported.  When rendering to the headset, views are changed to match the eye positions.  These view poses are also available using `lovr.headset.getViewPose`.
---
---@param view number The index of the view to update.
---@param x number The x position of the viewer, in meters.
---@param y number The y position of the viewer, in meters.
---@param z number The z position of the viewer, in meters.
---@param angle number The number of radians the viewer is rotated around its axis of rotation.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Pass:setViewPose(view, x, y, z, angle, ax, ay, az) end

---Sets the pose for a single view.  Objects rendered in this view will appear as though the camera is positioned using the given pose.
---
---Up to 6 views are supported.  When rendering to the headset, views are changed to match the eye positions.  These view poses are also available using `lovr.headset.getViewPose`.
---
---@param view number The index of the view to update.
---@param position vector The position of the viewer, in meters.
---@param orientation quaternion The orientation of the viewer.
function Pass:setViewPose(view, position, orientation) end

---Sets the pose for a single view.  Objects rendered in this view will appear as though the camera is positioned using the given pose.
---
---Up to 6 views are supported.  When rendering to the headset, views are changed to match the eye positions.  These view poses are also available using `lovr.headset.getViewPose`.
---
---@param view number The index of the view to update.
---@param matrix Mat4 A matrix containing the viewer pose.
---@param inverted boolean Whether the matrix is an inverted pose (a view matrix).
function Pass:setViewPose(view, matrix, inverted) end

---Sets the viewport.  Everything rendered will get mapped to the rectangle defined by the viewport.  More specifically, this defines the transformation from normalized device coordinates to pixel coordinates.
---
---#### Notes:
---
---The viewport rectangle can use floating point numbers.
---
---A negative viewport height (with a y coordinate equal to the bottom of the viewport) can be used to flip the rendering vertically.
---
---The default viewport extends from `(0, 0)` to the dimensions of the canvas, with min depth and max depth respectively set to 0 and 1.
---
---@param x number The x coordinate of the upper-left corner of the viewport.
---@param y number The y coordinate of the upper-left corner of the viewport.
---@param w number The width of the viewport.  Must be positive.
---@param h number The height of the viewport.  May be negative.
---@param dmin? number The min component of the depth range, between 0 and 1.
---@param dmax? number The max component of the depth range, between 0 and 1.
function Pass:setViewport(x, y, w, h, dmin, dmax) end

---Sets the viewport.  Everything rendered will get mapped to the rectangle defined by the viewport.  More specifically, this defines the transformation from normalized device coordinates to pixel coordinates.
---
---#### Notes:
---
---The viewport rectangle can use floating point numbers.
---
---A negative viewport height (with a y coordinate equal to the bottom of the viewport) can be used to flip the rendering vertically.
---
---The default viewport extends from `(0, 0)` to the dimensions of the canvas, with min depth and max depth respectively set to 0 and 1.
---
function Pass:setViewport() end

---Sets whether vertices in the clockwise or counterclockwise order vertices are considered the "front" face of a triangle.  This is used for culling with `Pass:setCullMode`.
---
---#### Notes:
---
---The default winding is counterclockwise.  LÖVR's builtin shapes are wound counterclockwise.
---
---@param winding Winding Whether triangle vertices are ordered `clockwise` or `counterclockwise`.
function Pass:setWinding(winding) end

---Enables or disables wireframe rendering.  This will draw all triangles as lines while active. It's intended to be used for debugging, since it usually has a performance cost.
---
---#### Notes:
---
---Wireframe rendering is disabled by default.
---
---There is currently no way to change the thickness of the lines.
---
---@param enable boolean Whether wireframe rendering should be enabled.
function Pass:setWireframe(enable) end

---Draws a skybox.
---
---#### Notes:
---
---The skybox will be rotated based on the camera rotation.
---
---The skybox is drawn using a fullscreen triangle.
---
---The skybox uses a custom shader, so set the shader to `nil` before calling this function (unless explicitly using a custom shader).
---
---@param skybox Texture The skybox to render.  Its `TextureType` can be `cube` to render as a cubemap, or `2d` to render as an equirectangular (spherical) 2D image.
function Pass:skybox(skybox) end

---Draws a skybox.
---
---#### Notes:
---
---The skybox will be rotated based on the camera rotation.
---
---The skybox is drawn using a fullscreen triangle.
---
---The skybox uses a custom shader, so set the shader to `nil` before calling this function (unless explicitly using a custom shader).
---
function Pass:skybox() end

---Draws a sphere
---
---#### Notes:
---
---The local origin of the sphere is in its center.
---
---@param x? number The x coordinate of the center of the sphere.
---@param y? number The y coordinate of the center of the sphere.
---@param z? number The z coordinate of the center of the sphere.
---@param radius? number The radius of the sphere.
---@param angle? number The rotation of the sphere around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param longitudes? number The number of "horizontal" segments.
---@param latitudes? number The number of "vertical" segments.
function Pass:sphere(x, y, z, radius, angle, ax, ay, az, longitudes, latitudes) end

---Draws a sphere
---
---#### Notes:
---
---The local origin of the sphere is in its center.
---
---@param position vector The position of the sphere.
---@param radius? number The radius of the sphere.
---@param orientation quaternion The orientation of the sphere.
---@param longitudes? number The number of "horizontal" segments.
---@param latitudes? number The number of "vertical" segments.
function Pass:sphere(position, radius, orientation, longitudes, latitudes) end

---Draws a sphere
---
---#### Notes:
---
---The local origin of the sphere is in its center.
---
---@param transform Mat4 The transform of the sphere.
---@param longitudes? number The number of "horizontal" segments.
---@param latitudes? number The number of "vertical" segments.
function Pass:sphere(transform, longitudes, latitudes) end

---Draws text.  The font can be changed using `Pass:setFont`.
---
---#### Notes:
---
---UTF-8 encoded strings are supported.
---
---Newlines will start a new line of text.  Tabs will be rendered as four spaces.  Carriage returns are ignored.
---
---With the default font pixel density, a scale of 1.0 makes the text height 1 meter.
---
---The wrap value does not take into account the text's scale.
---
---Text rendering requires a special shader, which will only be automatically used when the active shader is set to `nil`.
---
---Blending should be enabled when rendering text (it's on by default).
---
---This function can draw up to 16384 visible characters at a time, and will currently throw an error if the string is too long.
---
---@param text string The text to render.
---@param x? number The x coordinate of the text origin.
---@param y? number The y coordinate of the text origin.
---@param z? number The z coordinate of the text origin.
---@param scale? number The scale of the text (with the default pixel density, units are meters).
---@param angle? number The rotation of the text around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param wrap? number The maximum width of each line in meters (before scale is applied).  When zero, the text will not wrap.
---@param halign? HorizontalAlign The horizontal alignment relative to the text origin.
---@param valign? VerticalAlign The vertical alignment relative to the text origin.
function Pass:text(text, x, y, z, scale, angle, ax, ay, az, wrap, halign, valign) end

---Draws text.  The font can be changed using `Pass:setFont`.
---
---#### Notes:
---
---UTF-8 encoded strings are supported.
---
---Newlines will start a new line of text.  Tabs will be rendered as four spaces.  Carriage returns are ignored.
---
---With the default font pixel density, a scale of 1.0 makes the text height 1 meter.
---
---The wrap value does not take into account the text's scale.
---
---Text rendering requires a special shader, which will only be automatically used when the active shader is set to `nil`.
---
---Blending should be enabled when rendering text (it's on by default).
---
---This function can draw up to 16384 visible characters at a time, and will currently throw an error if the string is too long.
---
---@param text string The text to render.
---@param position vector The position of the text.
---@param scale? number The scale of the text (with the default pixel density, units are meters).
---@param orientation quaternion The orientation of the text.
---@param wrap? number The maximum width of each line in meters (before scale is applied).  When zero, the text will not wrap.
---@param halign? HorizontalAlign The horizontal alignment relative to the text origin.
---@param valign? VerticalAlign The vertical alignment relative to the text origin.
function Pass:text(text, position, scale, orientation, wrap, halign, valign) end

---Draws text.  The font can be changed using `Pass:setFont`.
---
---#### Notes:
---
---UTF-8 encoded strings are supported.
---
---Newlines will start a new line of text.  Tabs will be rendered as four spaces.  Carriage returns are ignored.
---
---With the default font pixel density, a scale of 1.0 makes the text height 1 meter.
---
---The wrap value does not take into account the text's scale.
---
---Text rendering requires a special shader, which will only be automatically used when the active shader is set to `nil`.
---
---Blending should be enabled when rendering text (it's on by default).
---
---This function can draw up to 16384 visible characters at a time, and will currently throw an error if the string is too long.
---
---@param text string The text to render.
---@param transform Mat4 The transform of the text.
---@param wrap? number The maximum width of each line in meters (before scale is applied).  When zero, the text will not wrap.
---@param halign? HorizontalAlign The horizontal alignment relative to the text origin.
---@param valign? VerticalAlign The vertical alignment relative to the text origin.
function Pass:text(text, transform, wrap, halign, valign) end

---Draws text.  The font can be changed using `Pass:setFont`.
---
---#### Notes:
---
---UTF-8 encoded strings are supported.
---
---Newlines will start a new line of text.  Tabs will be rendered as four spaces.  Carriage returns are ignored.
---
---With the default font pixel density, a scale of 1.0 makes the text height 1 meter.
---
---The wrap value does not take into account the text's scale.
---
---Text rendering requires a special shader, which will only be automatically used when the active shader is set to `nil`.
---
---Blending should be enabled when rendering text (it's on by default).
---
---This function can draw up to 16384 visible characters at a time, and will currently throw an error if the string is too long.
---
---@param colortext table A table of multicolor strings to render.  Can be a flat table, like `{ color, string, color, string }`, or as nested pairs, like `{ { color, string }, { color, string } }`.  Colors can be given as tables, vectors, or hexcodes.
---@param x? number The x coordinate of the text origin.
---@param y? number The y coordinate of the text origin.
---@param z? number The z coordinate of the text origin.
---@param scale? number The scale of the text (with the default pixel density, units are meters).
---@param angle? number The rotation of the text around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param wrap? number The maximum width of each line in meters (before scale is applied).  When zero, the text will not wrap.
---@param halign? HorizontalAlign The horizontal alignment relative to the text origin.
---@param valign? VerticalAlign The vertical alignment relative to the text origin.
function Pass:text(colortext, x, y, z, scale, angle, ax, ay, az, wrap, halign, valign) end

---Draws text.  The font can be changed using `Pass:setFont`.
---
---#### Notes:
---
---UTF-8 encoded strings are supported.
---
---Newlines will start a new line of text.  Tabs will be rendered as four spaces.  Carriage returns are ignored.
---
---With the default font pixel density, a scale of 1.0 makes the text height 1 meter.
---
---The wrap value does not take into account the text's scale.
---
---Text rendering requires a special shader, which will only be automatically used when the active shader is set to `nil`.
---
---Blending should be enabled when rendering text (it's on by default).
---
---This function can draw up to 16384 visible characters at a time, and will currently throw an error if the string is too long.
---
---@param colortext table A table of multicolor strings to render.  Can be a flat table, like `{ color, string, color, string }`, or as nested pairs, like `{ { color, string }, { color, string } }`.  Colors can be given as tables, vectors, or hexcodes.
---@param position vector The position of the text.
---@param scale? number The scale of the text (with the default pixel density, units are meters).
---@param orientation quaternion The orientation of the text.
---@param wrap? number The maximum width of each line in meters (before scale is applied).  When zero, the text will not wrap.
---@param halign? HorizontalAlign The horizontal alignment relative to the text origin.
---@param valign? VerticalAlign The vertical alignment relative to the text origin.
function Pass:text(colortext, position, scale, orientation, wrap, halign, valign) end

---Draws text.  The font can be changed using `Pass:setFont`.
---
---#### Notes:
---
---UTF-8 encoded strings are supported.
---
---Newlines will start a new line of text.  Tabs will be rendered as four spaces.  Carriage returns are ignored.
---
---With the default font pixel density, a scale of 1.0 makes the text height 1 meter.
---
---The wrap value does not take into account the text's scale.
---
---Text rendering requires a special shader, which will only be automatically used when the active shader is set to `nil`.
---
---Blending should be enabled when rendering text (it's on by default).
---
---This function can draw up to 16384 visible characters at a time, and will currently throw an error if the string is too long.
---
---@param colortext table A table of multicolor strings to render.  Can be a flat table, like `{ color, string, color, string }`, or as nested pairs, like `{ { color, string }, { color, string } }`.  Colors can be given as tables, vectors, or hexcodes.
---@param transform Mat4 The transform of the text.
---@param wrap? number The maximum width of each line in meters (before scale is applied).  When zero, the text will not wrap.
---@param halign? HorizontalAlign The horizontal alignment relative to the text origin.
---@param valign? VerticalAlign The vertical alignment relative to the text origin.
function Pass:text(colortext, transform, wrap, halign, valign) end

---Draws a torus.
---
---#### Notes:
---
---The local origin is in the center of the torus, and the torus forms a circle around the local Z axis.
---
---@param x? number The x coordinate of the center of the torus.
---@param y? number The y coordinate of the center of the torus.
---@param z? number The z coordinate of the center of the torus.
---@param radius? number The radius of the torus.
---@param thickness? number The thickness of the torus.
---@param angle? number The rotation of the torus around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param tsegments? number The number of toroidal (circular) segments to render.
---@param psegments? number The number of poloidal (tubular) segments to render.
function Pass:torus(x, y, z, radius, thickness, angle, ax, ay, az, tsegments, psegments) end

---Draws a torus.
---
---#### Notes:
---
---The local origin is in the center of the torus, and the torus forms a circle around the local Z axis.
---
---@param position vector The position of the center of the torus.
---@param scale vector The size of the torus (x and y scale the radius, z is the thickness).
---@param orientation quaternion The orientation of the torus.
---@param tsegments? number The number of toroidal (circular) segments to render.
---@param psegments? number The number of poloidal (tubular) segments to render.
function Pass:torus(position, scale, orientation, tsegments, psegments) end

---Draws a torus.
---
---#### Notes:
---
---The local origin is in the center of the torus, and the torus forms a circle around the local Z axis.
---
---@param transform Mat4 The transform of the torus.
---@param tsegments? number The number of toroidal (circular) segments to render.
---@param psegments? number The number of poloidal (tubular) segments to render.
function Pass:torus(transform, tsegments, psegments) end

---Transforms the coordinate system.
---
---@param x number The x component of the translation.
---@param y number The y component of the translation.
---@param z number The z component of the translation.
---@param sx number The x component of the scale.
---@param sy number The y component of the scale.
---@param sz number The z component of the scale.
---@param angle number The amount to rotate the coordinate system by, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Pass:transform(x, y, z, sx, sy, sz, angle, ax, ay, az) end

---Transforms the coordinate system.
---
---@param x number The x component of the translation.
---@param y number The y component of the translation.
---@param z number The z component of the translation.
---@param angle number The amount to rotate the coordinate system by, in radians.
---@param ax number The x component of the axis of rotation.
---@param ay number The y component of the axis of rotation.
---@param az number The z component of the axis of rotation.
function Pass:transform(x, y, z, angle, ax, ay, az) end

---Transforms the coordinate system.
---
---@param translation vector The translation to apply.
---@param scale vector The scale to apply.
---@param rotation quaternion A quaternion containing the rotation to apply.
function Pass:transform(translation, scale, rotation) end

---Transforms the coordinate system.
---
---@param transform Mat4 A matrix containing the transformation to apply.
function Pass:transform(transform) end

---Translates the coordinate system.
---
---#### Notes:
---
---Order matters when scaling, translating, and rotating the coordinate system.
---
---@param x number The x component of the translation.
---@param y number The y component of the translation.
---@param z number The z component of the translation.
function Pass:translate(x, y, z) end

---Translates the coordinate system.
---
---#### Notes:
---
---Order matters when scaling, translating, and rotating the coordinate system.
---
---@param translation vector The translation.
function Pass:translate(translation) end

---Raytracers store the information needed to trace rays in shaders.  They are sometimes also called "acceleration structures".  Raytracing is useful for implementing lighting effects in shaders, like shadows and ambient occlusion.
---
---### Usage
---
---After creating a Raytracer with `lovr.graphics.newRaytracer`, add `Mesh` and `Model` objects to it with `Raytracer:add`.  After adding everything, call `Raytracer:build` to finalize everything.  Finally, send the Raytracer to a `Shader` with `Pass:send`.  The shader code can use the Raytracer to trace rays.
---
---Not all GPUs support raytracing.  Use `lovr.graphics.getFeatures` to check for the `raytracing` feature.
---
---### Objects
---
---To move objects after adding them, use the ID returned from `Raytracer:add` along with `Raytracer:set` to set a new transform for the object.  To remove an object, either set its scale to zero, set its layer mask to zero, or call `Raytracer:clear` to remove everything and rebuild the raytracer from scratch.
---
---Objects can be placed on up to 8 different layers when they are added to the raytracer.  When tracing rays in shaders, rays have a mask that controls which layers they can hit.
---
---Raytracers have a fixed capacity that must be declared upfront.  `Raytracer:add` will return `nil` instead of an ID if this capacity is exceeded.
---
---`Mesh` and `Model` have their own internal "mini raytracer".  The first time an object is added to a raytracer, LÖVR will create the mini raytracer and build it automatically.  However, if the vertices change after the object has been added to the raytracer, the raytracer needs to be rebuilt with `Mesh:buildRaytracer` or `Model:buildRaytracer` for the changes to take affect. Additionally, any `Raytracer` objects using those meshes/models need to be rebuilt as well.
---@class Raytracer
local Raytracer = {}

---Adds a `Mesh` or `Model` to the Raytracer.
---
---The object has a custom transform, and exists on up to 8 layers, given as a bitmask.
---
---After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
---
---@param mesh Mesh The Mesh to add to the Raytracer.
---@param x? number The x coordinate to place the object at.
---@param y? number The y coordinate to place the object at.
---@param z? number The z coordinate to place the object at.
---@param scale? number The scale of the object.
---@param angle? number The rotation of the object around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param layers? number A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on the second layer, 0x3 for the first two layers, etc.
---@param tag? number A custom tag for the object, provided in the shader when the object is hit.  Shaders can use this tag for whatever they want.  If nil, the tag will be set to the same ID as the one returned by this function. The tag can be between 0 and 16,777,215.
---@return number id An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the Raytracer is full, the object is not added and this ID will be nil.
function Raytracer:add(mesh, x, y, z, scale, angle, ax, ay, az, layers, tag) end

---Adds a `Mesh` or `Model` to the Raytracer.
---
---The object has a custom transform, and exists on up to 8 layers, given as a bitmask.
---
---After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
---
---@param model Model The Model to add to the Raytracer.
---@param x? number The x coordinate to place the object at.
---@param y? number The y coordinate to place the object at.
---@param z? number The z coordinate to place the object at.
---@param scale? number The scale of the object.
---@param angle? number The rotation of the object around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param layers? number A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on the second layer, 0x3 for the first two layers, etc.
---@param tag? number A custom tag for the object, provided in the shader when the object is hit.  Shaders can use this tag for whatever they want.  If nil, the tag will be set to the same ID as the one returned by this function. The tag can be between 0 and 16,777,215.
---@return number id An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the Raytracer is full, the object is not added and this ID will be nil.
function Raytracer:add(model, x, y, z, scale, angle, ax, ay, az, layers, tag) end

---Adds a `Mesh` or `Model` to the Raytracer.
---
---The object has a custom transform, and exists on up to 8 layers, given as a bitmask.
---
---After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
---
---@param mesh Mesh The Mesh to add to the Raytracer.
---@param position vector The position to place the object at.
---@param scale3 vector The scale of the object.
---@param orientation quaternion The orientation of the object.
---@param layers? number A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on the second layer, 0x3 for the first two layers, etc.
---@param tag? number A custom tag for the object, provided in the shader when the object is hit.  Shaders can use this tag for whatever they want.  If nil, the tag will be set to the same ID as the one returned by this function. The tag can be between 0 and 16,777,215.
---@return number id An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the Raytracer is full, the object is not added and this ID will be nil.
function Raytracer:add(mesh, position, scale3, orientation, layers, tag) end

---Adds a `Mesh` or `Model` to the Raytracer.
---
---The object has a custom transform, and exists on up to 8 layers, given as a bitmask.
---
---After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
---
---@param model Model The Model to add to the Raytracer.
---@param position vector The position to place the object at.
---@param scale3 vector The scale of the object.
---@param orientation quaternion The orientation of the object.
---@param layers? number A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on the second layer, 0x3 for the first two layers, etc.
---@param tag? number A custom tag for the object, provided in the shader when the object is hit.  Shaders can use this tag for whatever they want.  If nil, the tag will be set to the same ID as the one returned by this function. The tag can be between 0 and 16,777,215.
---@return number id An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the Raytracer is full, the object is not added and this ID will be nil.
function Raytracer:add(model, position, scale3, orientation, layers, tag) end

---Adds a `Mesh` or `Model` to the Raytracer.
---
---The object has a custom transform, and exists on up to 8 layers, given as a bitmask.
---
---After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
---
---@param mesh Mesh The Mesh to add to the Raytracer.
---@param transform Mat4 The transform of the object.
---@param layers? number A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on the second layer, 0x3 for the first two layers, etc.
---@param tag? number A custom tag for the object, provided in the shader when the object is hit.  Shaders can use this tag for whatever they want.  If nil, the tag will be set to the same ID as the one returned by this function. The tag can be between 0 and 16,777,215.
---@return number id An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the Raytracer is full, the object is not added and this ID will be nil.
function Raytracer:add(mesh, transform, layers, tag) end

---Adds a `Mesh` or `Model` to the Raytracer.
---
---The object has a custom transform, and exists on up to 8 layers, given as a bitmask.
---
---After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
---
---@param model Model The Model to add to the Raytracer.
---@param transform Mat4 The transform of the object.
---@param layers? number A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on the second layer, 0x3 for the first two layers, etc.
---@param tag? number A custom tag for the object, provided in the shader when the object is hit.  Shaders can use this tag for whatever they want.  If nil, the tag will be set to the same ID as the one returned by this function. The tag can be between 0 and 16,777,215.
---@return number id An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the Raytracer is full, the object is not added and this ID will be nil.
function Raytracer:add(model, transform, layers, tag) end

---Builds the Raytracer, finalizing all the changes made by `Raytracer:add` and `Raytracer:set`.
---
function Raytracer:build() end

---Removes everything from the Raytracer, setting its count back to zero
---
---#### Notes:
---
---This does not rebuild the raytracer.
---
function Raytracer:clear() end

---Returns the capacity of the Raytracer, or the number of objects it can hold.  The capacity is declared when the raytracer is created, and can not be changed afterwards.
---
---#### Notes:
---
---`Raytracer:add` returns nil if the Raytracer is full.
---
---@return number capacity The capacity of the raytracer.
function Raytracer:getCapacity() end

---Returns the number of objects in the Raytracer.
---
---#### Notes:
---
---`Raytracer:add` returns nil if the Raytracer is full.
---
---@return number count The number of objects in the Raytracer.
function Raytracer:getCount() end

---Moves a `Mesh` or `Model` to the Raytracer, using an ID previously returned by `Raytracer:add`. This function can also change the layer mask and tag of the object.
---
---After adding and moving objects, call `Raytracer:build` to finalize the raytracer.
---
---@param id number The ID of the object to change.
---@param x? number The x coordinate to place the object at.
---@param y? number The y coordinate to place the object at.
---@param z? number The z coordinate to place the object at.
---@param scale? number The scale of the object.
---@param angle? number The rotation of the object around its rotation axis, in radians.
---@param ax? number The x component of the axis of rotation.
---@param ay? number The y component of the axis of rotation.
---@param az? number The z component of the axis of rotation.
---@param layers? number The new layer mask for the object, or nil to leave it unchanged.
---@param tag? number The new tag for the object, or nil to leave it unchanged.
function Raytracer:set(id, x, y, z, scale, angle, ax, ay, az, layers, tag) end

---Moves a `Mesh` or `Model` to the Raytracer, using an ID previously returned by `Raytracer:add`. This function can also change the layer mask and tag of the object.
---
---After adding and moving objects, call `Raytracer:build` to finalize the raytracer.
---
---@param id number The ID of the object to change.
---@param position vector The position to place the object at.
---@param scale3 vector The scale of the object.
---@param orientation quaternion The orientation of the object.
---@param layers? number The new layer mask for the object, or nil to leave it unchanged.
---@param tag? number The new tag for the object, or nil to leave it unchanged.
function Raytracer:set(id, position, scale3, orientation, layers, tag) end

---Moves a `Mesh` or `Model` to the Raytracer, using an ID previously returned by `Raytracer:add`. This function can also change the layer mask and tag of the object.
---
---After adding and moving objects, call `Raytracer:build` to finalize the raytracer.
---
---@param id number The ID of the object to change.
---@param transform Mat4 The transform of the object.
---@param layers? number The new layer mask for the object, or nil to leave it unchanged.
---@param tag? number The new tag for the object, or nil to leave it unchanged.
function Raytracer:set(id, transform, layers, tag) end

---Readbacks track the progress of an asynchronous read of a `Buffer` or `Texture`.  The Readback can be polled for completion or the CPU with `Readback:isComplete`, or you can wait for it to finish using `Readback:wait`.
---@class Readback
local Readback = {}

---Returns the Readback's data as a Blob.
---
---#### Notes:
---
---If the Readback is reading back a Texture, returns `nil`.
---
---@return Blob blob The Blob.
function Readback:getBlob() end

---Returns the data from the Readback, as a table.  See `Buffer:getData` for the way the table is structured.
---
---#### Notes:
---
---This returns `nil` for readbacks of `Texture` objects.
---
---@return table data A table containing the data that was read back.
function Readback:getData() end

---Returns the Readback's data as an Image.
---
---#### Notes:
---
---If the Readback is not reading back a Texture, returns `nil`.
---
---@return Image image The Image.
function Readback:getImage() end

---Returns whether the Readback has completed on the GPU and its data is available.
---
---@return boolean complete Whether the readback is complete.
function Readback:isComplete() end

---Blocks the CPU until the Readback is finished on the GPU.
---
---#### Notes:
---
---If `lovr.graphics.submit` or `lovr.graphics.wait` has not been called since the readback was created, the readback has not been submitted yet, so no wait will occur and this function will return `false`.
---
---@return boolean waited Whether the CPU had to be blocked for waiting.
function Readback:wait() end

---Samplers are objects that control how pixels are read from a texture.  They can control whether the pixels are smoothed, whether the texture wraps at the edge of its UVs, and more.
---
---Each `Pass` has a default sampler that will be used by default, which can be changed using `Pass:setSampler`.  Also, samplers can be declared in shaders using the following syntax:
---
---    uniform sampler mySampler;
---
---A Sampler can be sent to the variable using `Pass:send('mySampler', sampler)`.
---
---The properties of a Sampler are immutable, and can't be changed after it's created.
---@class Sampler
local Sampler = {}

---Returns the anisotropy level of the Sampler.  Anisotropy smooths out a texture's appearance when viewed at grazing angles.
---
---#### Notes:
---
---Not all GPUs support anisotropy.  The maximum anisotropy level is given by the `anisotropy` limit of `lovr.graphics.getLimits`, which may be zero.  It's very common for the maximum to be 16, however.
---
---@return number anisotropy The anisotropy level of the sampler.
function Sampler:getAnisotropy() end

---Returns the compare mode of the Sampler.  This is a feature typically only used for shadow mapping.  Using a sampler with a compare mode requires it to be declared in a shader as a `samplerShadow` instead of a `sampler` variable, and used with a texture that has a depth format.  The result of sampling a depth texture with a shadow sampler is a number between 0 and 1, indicating the percentage of sampled pixels that passed the comparison.
---
---@return CompareMode compare The compare mode of the sampler.
function Sampler:getCompareMode() end

---Returns the filter mode of the Sampler.
---
---@return FilterMode min The filter mode used when the texture is minified.
---@return FilterMode mag The filter mode used when the texture is magnified.
---@return FilterMode mip The filter mode used to select a mipmap level.
function Sampler:getFilter() end

---Returns the mipmap range of the Sampler.  This is used to clamp the range of mipmap levels that can be accessed from a texture.
---
---@return number min The minimum mipmap level that will be sampled (0 is the largest image).
---@return number max The maximum mipmap level that will be sampled.
function Sampler:getMipmapRange() end

---Returns the wrap mode of the sampler, used to wrap or clamp texture coordinates when the extend outside of the 0-1 range.
---
---@return WrapMode x The wrap mode used in the horizontal direction.
---@return WrapMode y The wrap mode used in the vertical direction.
---@return WrapMode z The wrap mode used in the "z" direction, for 3D textures only.
function Sampler:getWrap() end

---Shaders are small GPU programs.  See the `Shaders` guide for a full introduction to Shaders.
---@class Shader
local Shader = {}

---Clones a shader.  This creates an inexpensive copy of it with different flags.  It can be used to create several variants of a shader with different behavior.
---
---@param flags table A table of shader flags.  The keys of the table should be flag names or flag ID numbers. The values can be numbers or booleans, depending on the type of the flag as declared in the shader.  The clones set here will override any set in the parent shader.  See `ShaderFlag` for the set of builtin shader flags.
---@return Shader shader The new Shader.
function Shader:clone(flags) end

---Returns the format of a buffer declared in shader code.  The return type matches the same syntax used by `lovr.graphics.newBuffer` and `Buffer:getFormat`, so it can be used to quickly create a Buffer that matches a variable from a Shader.
---
---#### Notes:
---
---If the buffer only has a single array field, the format will be "unwrapped" to an array instead of a single-field struct with an array in it.  Example:
---
---    shader = lovr.graphics.newShader([[
---      buffer Numbers {
---        uint numbers[64];
---      };
---
---      void lovrmain(){}
---    ]])
---
---    shader:getBufferFormat('Numbers')
---    -- returns {{ name = 'numbers', type = 'u32' }}, 64
---    -- not     {{ name = 'numbers', type = 'u32', length = 64 }}, 1
---
---Similarly, if the buffer only has a single struct field, the format will be "unwrapped" to the inner struct.  This lets you use a struct for a Buffer's data without having to wrap everything in an extra namespace.  Example:
---
---    shader = lovr.graphics.newShader([[
---      struct HandParams {
---        vec3 pos;
---        float grip;
---      };
---
---      buffer Hand {
---        HandParams params;
---      };
---
---      void lovrmain(){}
---    ]])
---
---    shader:getBufferFormat('Hand')
---    -- returns {{ name = 'pos', type = 'vec3' }, { name = 'grip', type = 'float' }}, 1
---    -- not     {{ name = 'params', type = {...}}}, 1
---
---#### Example:
---
---```lua
---shader = lovr.graphics.newShader([[
---  uniform Transforms {
---    mat4 transforms[32];
---  };
---
---  vec4 lovrmain() {
---    return Projection * View * transforms[InstanceIndex] * VertexPosition;
---  }
---]], 'unlit')
---
---local format, length = shader:getBufferFormat('Transforms')
---print(length) --> 32
---print(format[1].name) --> 'transforms'
---print(format[1].type) --> 'mat4'
---
----- Can pass the 2 results directly to newBuffer:
---transforms = lovr.graphics.newBuffer(shader:getBufferFormat('Transforms'))
---
----- Or override the length with some initial data:
---transforms = lovr.graphics.newBuffer(shader:getBufferFormat('Transforms'), objects)
---```
---
---@param name string The name of the buffer variable to return the format of.
---@return table format A list of fields that match the type declaration of the buffer in the shader code.  Each field has `name`, `type`, and `offset` keys.  If the field is an array, it will have `length` and `stride` keys as well.  The top-level table also has a `stride` key.  Offsets and strides are in bytes.
---@return number length The number of items in the buffer (or 1 if the buffer is not an array).
function Shader:getBufferFormat(name) end

---Returns the debug label of the Shader, which will show up when the Shader is printed and in some graphics debugging tools.  This is set when the Shader is created, and can't be changed afterwards.
---
---@return string label The label, or nil if none was set.
function Shader:getLabel() end

---Returns whether the shader is a graphics or compute shader.
---
---@return ShaderType type The type of the Shader.
function Shader:getType() end

---Returns the workgroup size of a compute shader.  The workgroup size defines how many times a compute shader is invoked for each workgroup dispatched by `Pass:compute`.
---
---#### Notes:
---
---For example, if the workgroup size is `8x8x1` and `16x16x16` workgroups are dispatched, then the compute shader will run `16 * 16 * 16 * (8 * 8 * 1) = 262144` times.
---
---The maximum workgroup size is hardware-specific, and is given by the `workgroupSize` and `totalWorkgroupSize` limit in `lovr.graphics.getLimits`.
---
---@return number x The x size of a workgroup.
---@return number y The y size of a workgroup.
---@return number z The z size of a workgroup.
function Shader:getWorkgroupSize() end

---Returns whether the Shader has a vertex attribute, by name or location.
---
---#### Example:
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    in uint coolAttribute;
---
---    vec4 lovrmain() {
---      return DefaultPosition;
---    }
---  ]], [[
---    vec4 lovrmain() {
---      return DefaultColor;
---    }
---  ]])
---
---  print(shader:hasAttribute('coolAttribute')) --> true
---end
---```
---
---@param name string The name of an attribute.
---@return boolean exists Whether the Shader has the attribute.
function Shader:hasAttribute(name) end

---Returns whether the Shader has a vertex attribute, by name or location.
---
---#### Example:
---
---```lua
---function lovr.load()
---  shader = lovr.graphics.newShader([[
---    in uint coolAttribute;
---
---    vec4 lovrmain() {
---      return DefaultPosition;
---    }
---  ]], [[
---    vec4 lovrmain() {
---      return DefaultColor;
---    }
---  ]])
---
---  print(shader:hasAttribute('coolAttribute')) --> true
---end
---```
---
---@param location number The location of an attribute.
---@return boolean exists Whether the Shader has the attribute.
function Shader:hasAttribute(location) end

---Returns whether the Shader has a given stage.
---
---@param stage ShaderStage The stage.
---@return boolean exists Whether the Shader has the stage.
function Shader:hasStage(stage) end

---Returns whether the Shader has a variable.
---
---#### Notes:
---
---This will return true if the variable is a buffer, texture, sampler, or other uniform variable (anything that can be sent with `Pass:send`).
---
---#### Example:
---
---```lua
---for key, texture in pairs(textures) do
---  if shader:hasVariable(key) then
---    pass:send(key, texture)
---  end
---end
---```
---
---@param name string The name of the variable to check.
---@return boolean exists Whether the Shader has the variable.
function Shader:hasVariable(name) end

---Textures are multidimensional blocks of memory on the GPU, contrasted with `Buffer` objects which are one-dimensional.  Textures are used as the destination for rendering operations, and textures loaded from images provide surface data to `Material` objects.
---@class Texture
local Texture = {}

---Clears layers and mipmaps in a texture to a given color.
---
---When a Texture is being used as a canvas for a `Pass`, the clear color can be set with `Pass:setClear`, which a more efficient way to clear the texture before rendering.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage to clear it.
---
---The clear color will be interpreted as a linear color for sRGB formats.
---
---When clearing a 3D texture, the `layer` and `layerCount` arguments are ignored, and all of the layers in a mipmap level will be cleared.
---
function Texture:clear() end

---Clears layers and mipmaps in a texture to a given color.
---
---When a Texture is being used as a canvas for a `Pass`, the clear color can be set with `Pass:setClear`, which a more efficient way to clear the texture before rendering.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage to clear it.
---
---The clear color will be interpreted as a linear color for sRGB formats.
---
---When clearing a 3D texture, the `layer` and `layerCount` arguments are ignored, and all of the layers in a mipmap level will be cleared.
---
---@param hex number The hexcode color to clear to.
---@param layer? number The index of the first layer to clear.
---@param layerCount? number The number of layers to clear.  If nil, clears the rest of the layers.
---@param mipmap? number The index of the first mipmap to clear.
---@param mipmapCount? number The number of mipmaps to clear.  If nil, clears the rest of the mipmaps.
function Texture:clear(hex, layer, layerCount, mipmap, mipmapCount) end

---Clears layers and mipmaps in a texture to a given color.
---
---When a Texture is being used as a canvas for a `Pass`, the clear color can be set with `Pass:setClear`, which a more efficient way to clear the texture before rendering.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage to clear it.
---
---The clear color will be interpreted as a linear color for sRGB formats.
---
---When clearing a 3D texture, the `layer` and `layerCount` arguments are ignored, and all of the layers in a mipmap level will be cleared.
---
---@param r number The red component of the clear color.
---@param g number The green component of the clear color.
---@param b number The blue component of the clear color.
---@param a number The alpha component of the clear color.
---@param layer? number The index of the first layer to clear.
---@param layerCount? number The number of layers to clear.  If nil, clears the rest of the layers.
---@param mipmap? number The index of the first mipmap to clear.
---@param mipmapCount? number The number of mipmaps to clear.  If nil, clears the rest of the mipmaps.
function Texture:clear(r, g, b, a, layer, layerCount, mipmap, mipmapCount) end

---Clears layers and mipmaps in a texture to a given color.
---
---When a Texture is being used as a canvas for a `Pass`, the clear color can be set with `Pass:setClear`, which a more efficient way to clear the texture before rendering.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage to clear it.
---
---The clear color will be interpreted as a linear color for sRGB formats.
---
---When clearing a 3D texture, the `layer` and `layerCount` arguments are ignored, and all of the layers in a mipmap level will be cleared.
---
---@param t {number} A table with color components.
---@param layer? number The index of the first layer to clear.
---@param layerCount? number The number of layers to clear.  If nil, clears the rest of the layers.
---@param mipmap? number The index of the first mipmap to clear.
---@param mipmapCount? number The number of mipmaps to clear.  If nil, clears the rest of the mipmaps.
function Texture:clear(t, layer, layerCount, mipmap, mipmapCount) end

---Clears layers and mipmaps in a texture to a given color.
---
---When a Texture is being used as a canvas for a `Pass`, the clear color can be set with `Pass:setClear`, which a more efficient way to clear the texture before rendering.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage to clear it.
---
---The clear color will be interpreted as a linear color for sRGB formats.
---
---When clearing a 3D texture, the `layer` and `layerCount` arguments are ignored, and all of the layers in a mipmap level will be cleared.
---
---@param v vector A vector with the clear color (alpha will be 1).
---@param layer? number The index of the first layer to clear.
---@param layerCount? number The number of layers to clear.  If nil, clears the rest of the layers.
---@param mipmap? number The index of the first mipmap to clear.
---@param mipmapCount? number The number of mipmaps to clear.  If nil, clears the rest of the mipmaps.
function Texture:clear(v, layer, layerCount, mipmap, mipmapCount) end

---Regenerates mipmap levels of a texture.  This downscales pixels from the texture to progressively smaller sizes and saves them.  If the texture is drawn at a smaller scale later, the mipmaps are used, which smooths out the appearance and improves performance.
---
---#### Notes:
---
---Mipmaps will automatically be regenerated for textures after rendering to them in a `Pass`. This can be disabled by rendering to a single-level texture view instead.
---
---The texture must have been created with the `transfer` usage to mipmap it.
---
---The texture can not be multisampled.
---
---Texture views can not currently be mipmapped.
---
---@param base? number The base mipmap level which will be used to generate subsequent mipmaps.
---@param count? number The number of mipmap levels to generate.  If nil, the rest of the mipmaps will be generated.
function Texture:generateMipmaps(base, count) end

---Returns the width, height, and depth of the Texture.
---
---@return number width The width of the Texture.
---@return number height The height of the Texture.
---@return number layers The number of layers in the Texture.
function Texture:getDimensions() end

---Returns the format of the texture.
---
---@return TextureFormat format The format of the Texture.
---@return boolean linear Whether the format is linear or srgb.
function Texture:getFormat() end

---Returns the height of the Texture, in pixels.
---
---@return number height The height of the Texture, in pixels.
function Texture:getHeight() end

---Returns the debug label of the Texture, which will show up when the Texture is printed and in some graphics debugging tools.  This is set when the Texture is created, and can't be changed afterwards.
---
---@return string label The label, or nil if none was set.
function Texture:getLabel() end

---Returns the layer count of the Texture.  2D textures always have 1 layer and cubemaps always have a layer count divisible by 6.  3D and array textures have a variable number of layers.
---
---@return number layers The layer count of the Texture.
function Texture:getLayerCount() end

---Returns the number of mipmap levels in the Texture.
---
---@return number mipmaps The number of mipmap levels in the Texture.
function Texture:getMipmapCount() end

---Creates and returns a new `Image` object with the current pixels of the Texture.  This function is very very slow because it stalls the CPU until the download is complete.  It should only be used for debugging, non-interactive scripts, etc.  For an asynchronous version that doesn't stall the CPU, see `Texture:newReadback`.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage.
---
---Multisampled textures can not be read back.
---
---It is not currently possible to read back a texture view.
---
---@param x? number The x offset of the region to download.
---@param y? number The y offset of the region to download.
---@param layer? number The index of the layer to download.
---@param mipmap? number The index of the mipmap level to download.
---@param width? number The width of the pixel rectangle to download.  If nil, the "rest" of the width will be used, based on the texture width and x offset.
---@param height? number The height of the pixel rectangle to download.  If nil, the "rest" of the height will be used, based on the texture height and y offset.
---@return Image image The new image with the pixels.
function Texture:getPixels(x, y, layer, mipmap, width, height) end

---Returns the number of samples in the texture.  Multiple samples are used for multisample antialiasing when rendering to the texture.  Currently, the sample count is either 1 (not antialiased) or 4 (antialiased).
---
---@return number samples The number of samples in the Texture.
function Texture:getSampleCount() end

---Returns the Sampler object previously assigned with `Texture:setSampler`.
---
---This API is experimental, and subject to change in the future!
---
---@return Sampler sampler The Sampler object.
function Texture:getSampler() end

---Returns the type of the texture.
---
---@return TextureType type The type of the Texture.
function Texture:getType() end

---Returns the width of the Texture, in pixels.
---
---@return number width The width of the Texture, in pixels.
function Texture:getWidth() end

---Returns whether a Texture was created with a set of `TextureUsage` flags.  Usage flags are specified when the Texture is created, and restrict what you can do with a Texture object.  By default, only the `sample` usage is enabled.  Applying a smaller set of usage flags helps LÖVR optimize things better.
---
---@param ... TextureUsage One or more usage flags.
---@return boolean supported Whether the Texture has all the provided usage flags.
function Texture:hasUsage(...) end

---Creates and returns a new `Readback` that will download the pixels in the Texture from VRAM. Once the readback is complete, `Readback:getImage` returns an `Image` with a CPU copy of the data.
---
---#### Notes:
---
---The texture must have been created with the `transfer` usage.
---
---Multisampled textures can not be read back.
---
---It is not currently possible to read back a texture view.
---
---#### Example:
---
---Take a screenshot when pressing a key.  This uses an intermediate texture and render pass, to work around the fact that the window/headset textures don't support transfers.
---
---```lua
---local screenshot = false
---local readback
---local texture
---local pass
---
---function lovr.keypressed(key)
---  if key == 'p' then screenshot = true end
---end
---
---function lovr.load()
---  local width, height = lovr.headset.getDisplayDimensions()
---
---  texture = lovr.graphics.newTexture(width, height, {
---    usage = { 'render', 'transfer', 'sample' }
---  })
---
---  pass = lovr.graphics.newPass(texture)
---end
---
---function lovr.update()
---  pass:reset()
---  for i = 1, lovr.headset.getViewCount() do
---    pass:setViewPose(i, lovr.headset.getViewPose(i))
---    pass:setProjection(i, lovr.headset.getViewAngles(i))
---  end
---  pass:text('hellooo', 0, 1.7, -1, .1)
---  lovr.graphics.submit(pass)
---
---  if screenshot and not readback then
---    readback = texture:newReadback()
---    screenshot = false
---  end
---
---  if readback and readback:isComplete() then
---    local filename = 'screenshot.png'
---    lovr.filesystem.write(filename, readback:getImage():encode())
---    print('saved screenshot to ' .. filename)
---    readback = nil
---  end
---end
---
---function lovr.draw(p)
---  p:fill(texture)
---end
---```
---
---@param x? number The x offset of the region to download.
---@param y? number The y offset of the region to download.
---@param layer? number The index of the layer to download.
---@param mipmap? number The index of the mipmap level to download.
---@param width? number The width of the pixel rectangle to download.  If nil, the "rest" of the width will be used, based on the texture width and x offset.
---@param height? number The height of the pixel rectangle to download.  If nil, the "rest" of the height will be used, based on the texture height and y offset.
---@return Readback readback A new Readback object.
function Texture:newReadback(x, y, layer, mipmap, width, height) end

---Sets pixels in the texture.  The source data can be an `Image` with the pixels to upload, or another `Texture` object to copy from.
---
---#### Notes:
---
---Note that calling `Texture:setPixels(Image)` will only update the first mipmap of the texture, leaving the other mipmaps as-is.  You may want to regenerate the texture's mipmaps afterwards by calling `Texture:generateMipmaps`, or disable mipmaps entirely by setting `mipmaps` to false in `lovr.graphics.newTexture`.
---
---The destination and source textures must have been created with the `transfer` usage.
---
---Images can't be copied to multisample textures.  Multisample textures can be copied between each other as long as there isn't any scaling.
---
---If either texture has a depth format, then both textures must have the same format.
---
---When using different region sizes in a texture-to-texture copy:
---
---- It is not possible to mix 3D with non-3D textures.
---- Not every texture format is supported, use `lovr.graphics.isFormatSupported` to check.
---
---@param source Texture | Image The source texture or image to copy to this texture.
---@param dstx? number The x offset to copy to.
---@param dsty? number The y offset to copy to.
---@param dstlayer? number The index of the layer to copy to.
---@param dstmipmap? number The index of the mipmap level to copy to.
---@param srcx? number The x offset to copy from.
---@param srcy? number The y offset to copy from.
---@param srclayer? number The index of the layer to copy from.
---@param srcmipmap? number The index of the mipmap level to copy from.
---@param width? number The width of the region of pixels to copy.  If nil, the maximum possible width will be used, based on the widths of the source/destination and the offset parameters.
---@param height? number The height of the region of pixels to copy.  If nil, the maximum possible height will be used, based on the heights of the source/destination and the offset parameters.
---@param layers? number The number of layers to copy.  If nil, copies as many layers as possible.
function Texture:setPixels(
	source,
	dstx,
	dsty,
	dstlayer,
	dstmipmap,
	srcx,
	srcy,
	srclayer,
	srcmipmap,
	width,
	height,
	layers
)
end

---Sets sampler settings for the texture.  This can either be a `FilterMode` like `nearest`, or a `Sampler` object, which allows configuring all of the filtering and wrapping settings.
---
---There are other ways of using custom samplers for a texture, but they have disadvantages:
---
---- `Sampler` objects can be sent to shaders and used to sample from the texture, but this
---  requires writing custom shader code and sending sampler objects with `Pass:send`, which is
---  inconvenient.
---- `Pass:setSampler` exists, but it applies to all textures in all draws in the Pass.  It doesn't
---  allow for changing filtering settings on a per-texture basis.
---
---This API is experimental, and subject to change in the future!
---
---@param mode FilterMode The FilterMode shaders will use when reading pixels from the texture.
function Texture:setSampler(mode) end

---Sets sampler settings for the texture.  This can either be a `FilterMode` like `nearest`, or a `Sampler` object, which allows configuring all of the filtering and wrapping settings.
---
---There are other ways of using custom samplers for a texture, but they have disadvantages:
---
---- `Sampler` objects can be sent to shaders and used to sample from the texture, but this
---  requires writing custom shader code and sending sampler objects with `Pass:send`, which is
---  inconvenient.
---- `Pass:setSampler` exists, but it applies to all textures in all draws in the Pass.  It doesn't
---  allow for changing filtering settings on a per-texture basis.
---
---This API is experimental, and subject to change in the future!
---
---@param sampler Sampler The Sampler object shaders will use when reading pixels from the texture.
function Texture:setSampler(sampler) end

---Sets sampler settings for the texture.  This can either be a `FilterMode` like `nearest`, or a `Sampler` object, which allows configuring all of the filtering and wrapping settings.
---
---There are other ways of using custom samplers for a texture, but they have disadvantages:
---
---- `Sampler` objects can be sent to shaders and used to sample from the texture, but this
---  requires writing custom shader code and sending sampler objects with `Pass:send`, which is
---  inconvenient.
---- `Pass:setSampler` exists, but it applies to all textures in all draws in the Pass.  It doesn't
---  allow for changing filtering settings on a per-texture basis.
---
---This API is experimental, and subject to change in the future!
---
function Texture:setSampler() end

---Controls whether premultiplied alpha is enabled.
---@alias BlendAlphaMode
---Color channel values are multiplied by the alpha channel during blending.
---| "alphamultiply"
---Color channel values are not multiplied by the alpha.  Instead, it's assumed that the colors have already been multiplied by the alpha.  This should be used if the pixels being drawn have already been blended, or "pre-multiplied".
---| "premultiplied"

---Different blend factors used by `Pass:setBlendState` to control the source and destination factors used for blending.
---@alias BlendFactor
---Zero.
---| "zero"
---One.
---| "one"
---Source color.
---| "srccolor"
---One minus the source color.
---| "oneminussrccolor"
---Source alpha.
---| "srcalpha"
---One minus the source alpha.
---| "oneminussrcalpha"
---Destination color.
---| "dstcolor"
---One minus the destination color.
---| "oneminusdstcolor"
---Destination alpha.
---| "dstalpha"
---One minus the destination alpha.
---| "oneminusdstalpha"
---min(srcalpha, oneminusdstalpha)
---| "srcalphasaturated"

---Different ways pixels can blend with the pixels behind them.
---@alias BlendMode
---Colors will be mixed based on alpha.
---| "alpha"
---Colors will be added to the existing color, alpha will not be changed.
---| "add"
---Colors will be subtracted from the existing color, alpha will not be changed.
---| "subtract"
---All color channels will be multiplied together, producing a darkening effect.
---| "multiply"
---The maximum value of each color channel will be used.
---| "lighten"
---The minimum value of each color channel will be used.
---| "darken"
---The opposite of multiply: the pixel colors are inverted, multiplied, and inverted again, producing a lightening effect.
---| "screen"
---The incoming colors will replace the existing colors.  This is the same as using a blend mode of `nil`.
---| "none"

---Different blend operations used by `Pass:setBlendState` to control how the source and destination factors are combined.
---@alias BlendOp
---Adds the two factors together.
---| "add"
---Subtracts the destination from the source.
---| "subtract"
---Subtracts the source from the destination.
---| "reversesubtract"
---Takes the minimum of the two factors.
---| "min"
---Takes the maximum of the two factors.
---| "max"

---The method used to compare depth and stencil values when performing the depth and stencil tests. Also used for compare modes in `Sampler`s.
---@alias CompareMode
---The test does not take place, and acts as though it always passes.
---| "none"
---The test passes if the values are equal.
---| "equal"
---The test passes if the values are not equal.
---| "notequal"
---The test passes if the value is less than the existing one.
---| "less"
---The test passes if the value is less than or equal to the existing one.
---| "lequal"
---The test passes if the value is greater than the existing one.
---| "greater"
---The test passes if the value is greater than or equal to the existing one.
---| "gequal"

---The different ways of doing triangle backface culling.
---@alias CullMode
---Both sides of triangles will be drawn.
---| "none"
---Skips rendering the back side of triangles.
---| "back"
---Skips rendering the front side of triangles.
---| "front"

---The different ways to pack Buffer fields into memory.
---
---The default is `packed`, which is suitable for vertex buffers and index buffers.  It doesn't add any padding between elements, and so it doesn't waste any space.  However, this layout won't necessarily work for uniform buffers and storage buffers.
---
---The `std140` layout corresponds to the std140 layout used for uniform buffers in GLSL.  It adds the most padding between fields, and requires the stride to be a multiple of 16.  Example:
---
---    layout(std140) uniform ObjectScales { float scales[64]; };
---
---The `std430` layout corresponds to the std430 layout used for storage buffers in GLSL.  It adds some padding between certain types, and may round up the stride.  Example:
---
---    layout(std430) buffer TileSizes { vec2 sizes[]; }
---@alias DataLayout
---The packed layout, without any padding.
---| "packed"
---The std140 layout.
---| "std140"
---The std430 layout.
---| "std430"

---Different types for `Buffer` fields.  These are scalar, vector, or matrix types, usually packed into small amounts of space to reduce the amount of memory they occupy.
---
---The names are encoded as follows:
---
---- The data type:
---  - `i` for signed integer
---  - `u` for unsigned integer
---  - `sn` for signed normalized (-1 to 1)
---  - `un` for unsigned normalized (0 to 1)
---  - `f` for floating point
---- The bit depth of each component
---- The letter `x` followed by the component count (for vectors)
---@alias DataType
---Four 8-bit signed integers.
---| "i8x4"
---Four 8-bit unsigned integers.
---| "u8x4"
---Four 8-bit signed normalized values.
---| "sn8x4"
---Four 8-bit unsigned normalized values (aka `color`).
---| "un8x4"
---Three 10-bit signed normalized values, and 2 padding bits.
---| "sn10x3"
---Three 10-bit unsigned normalized values, and 2 padding bits.
---| "un10x3"
---One 16-bit signed integer.
---| "i16"
---Two 16-bit signed integers.
---| "i16x2"
---Four 16-bit signed integers.
---| "i16x4"
---One 16-bit unsigned integer.
---| "u16"
---Two 16-bit unsigned integers.
---| "u16x2"
---Four 16-bit unsigned integers.
---| "u16x4"
---Two 16-bit signed normalized values.
---| "sn16x2"
---Four 16-bit signed normalized values.
---| "sn16x4"
---Two 16-bit unsigned normalized values.
---| "un16x2"
---Four 16-bit unsigned normalized values.
---| "un16x4"
---One 32-bit signed integer (aka `int`).
---| "i32"
---Two 32-bit signed integers.
---| "i32x2"
---Three 32-bit signed integers.
---| "i32x3"
---Four 32-bit signed integers.
---| "i32x4"
---One 32-bit unsigned integer (aka `uint`).
---| "u32"
---Two 32-bit unsigned integers.
---| "u32x2"
---Three 32-bit unsigned integers.
---| "u32x3"
---Four 32-bit unsigned integers.
---| "u32x4"
---Two 16-bit floating point numbers.
---| "f16x2"
---Four 16-bit floating point numbers.
---| "f16x4"
---One 32-bit floating point number (aka `float`).
---| "f32"
---Two 32-bit floating point numbers (aka `vec2`).
---| "f32x2"
---Three 32-bit floating point numbers (aka `vec3`).
---| "f32x3"
---Four 32-bit floating point numbers (aka `vec4`).
---| "f32x4"
---A 2x2 matrix containing four 32-bit floats.
---| "mat2"
---A 3x3 matrix containing nine 32-bit floats.
---| "mat3"
---A 4x4 matrix containing sixteen 32-bit floats.
---| "mat4"
---Like u16, but 1-indexed.
---| "index16"
---Like u32, but 1-indexed.
---| "index32"

---The set of shaders built in to LÖVR.  These can be passed to `Pass:setShader` or `lovr.graphics.newShader` instead of writing GLSL code.  The shaders can be further customized by using the `flags` option to change their behavior.  If the active shader is set to `nil`, LÖVR picks one of these shaders to use.
---@alias DefaultShader
---Basic shader without lighting that uses colors and a texture.
---| "unlit"
---Shades triangles based on their normal, resulting in a cool rainbow effect.
---| "normal"
---Renders font glyphs.
---| "font"
---Renders cubemaps.
---| "cubemap"
---Renders spherical textures.
---| "equirect"
---Renders a fullscreen triangle.
---| "fill"

---Different ways vertices in a mesh can be connected together and filled in with pixels.
---@alias DrawMode
---Each vertex is rendered as a single point.  The size of the point can be controlled using the `pointSize` shader flag, or by writing to the `PointSize` variable in shaders.  The maximum point size is given by the `pointSize` limit from `lovr.graphics.getLimits`.
---| "points"
---Pairs of vertices are connected with line segments.  To draw a single line through all of the vertices, an index buffer can be used to repeat vertices.  It is not currently possible to change the width of the lines, although cylinders or capsules can be used as an alternative.
---| "lines"
---Every 3 vertices form a triangle, which is filled in with pixels (unless `Pass:setWireframe` is used).  This mode is the most commonly used.
---| "triangles"

---Whether a shape should be drawn filled or outlined.
---@alias DrawStyle
---The shape will be filled in (the default).
---| "fill"
---The shape will be outlined.
---| "line"

---Controls how `Sampler` objects smooth pixels in textures.
---@alias FilterMode
---A pixelated appearance where the "nearest neighbor" pixel is used.
---| "nearest"
---A smooth appearance where neighboring pixels are averaged.
---| "linear"
---An even smoother appearance, but slower and typically only available on mobile GPUs. Use `lovr.graphics.isFormatSupported('format', 'cubic')` to check for support for a specific format, or `lovr.graphics.getFeatures().cubic` to see if cubic filtering is supported at all.
---
---Note that this can only be used for `min` and `mag` options in sampler.  Trying to use this for the `mip` filter mode will silently fall back to `linear`.
---| "cubic"

---Different ways to horizontally align text with `Pass:text`.
---@alias HorizontalAlign
---Left-aligned text.
---| "left"
---Centered text.
---| "center"
---Right-aligned text.
---| "right"

---Whether a Mesh stores its data on the CPU or GPU.
---@alias MeshStorage
---The Mesh will store a copy of the vertices on the CPU.
---| "cpu"
---The Mesh will not keep a CPU copy, only storing vertices on the GPU.
---| "gpu"

---Different coordinate spaces for nodes in a `Model`.
---@alias OriginType
---Transforms are relative to the origin (root) of the Model.
---| "root"
---Transforms are relative to the parent of the node.
---| "parent"

---The different projection types for `Pass:setProjection`.
---@alias ProjectionType
---A 2D orthographic projection given by 6 numbers: left, right, bottom, top, near, far. Left/right default to 0 and the width of the canvas.  Bottom/top default to 0 and the height of the canvas.  Near and far default to -1 and 1.  All of the numbers can be left off to set an orthographic projection with 0,0 in the upper-left corner and units in pixels.
---| "orthographic"
---A 3D perspective projection given by 4 numbers: fovy, aspect, near, far.  Fovy is in radians and defaults to 90 degrees.  The aspect ratio is width/height and defaults to the aspect ratio of the canvas.  Near and far default to .01 and 0.
---| "perspective"
---An asymmetric perspective projection given by 6 numbers: left, right, up, down, near, far. This is meant to be used with `lovr.headset.getViewAngles`.  All of the angles are in radians, and are usually positive.  Near and far default to .01 and 0.
---| "asymmetric"
---16 numbers for a raw projection matrix, in column-major order.
---| "matrix"

---Built-in shader flags.  Shaders can use both user-created specialization constants (or simply "flags") alongside the following built-in ones.
---@alias ShaderFlag
---The point size when drawing points with e.g. `Pass:points`, in pixels.
---| "pointSize"
---Multiply the pass color (`Pass:setColor`) into the `Color` variable sent to the fragment shader.
---| "passColor"
---Multiply the material color (`Pass:setMaterial`) into the `Color` variable sent to the fragment shader.
---| "materialColor"
---Multiply the vertex color (from the `VertexColor` attribute) into the `Color` variable sent to the fragment shader.
---| "vertexColors"
---Apply the UV transform from the material to the `VertexUV` attribute.
---| "uvTransform"
---Enable alpha cutoff.  When enabled, pixels will be discarded if their alpha is less than the `alphaCutoff` value of the material.
---| "alphaCutoff"
---Enable glow.  When enabled, the Material\'s `glowTexture` and `glow` property will get added to the color of the pixel returned by `lovrmain`.  This is also called an "emissive" texture and is used for parts of an object that give off light, like an LED screen or the headlights on a car.
---| "glow"
---Use the normal map texture in the material to affect the normal direction of surfaces.  This only affects the `normal` variable in the `Surface` struct.
---| "normalMap"
---Use the vertex tangents of the model for normal mapping.  When this is `false`, tangents will be computed in the fragment shader from the vertex positions, UVs, and normal vector.
---| "vertexTangents"
---Use the color texture of the material.  If this is `false`, the color will only be derived from the `Color` variable (pass color, material color, vertex color), and the color texture will be ignored.
---| "colorTexture"
---Sample the `glowTexture` of the material when applying glow.  Note that glow is only active when the `glow` flag is also enabled.  If this is false, then materials will give off a constant glow using their `glow` property, and the glow texture is ignored.
---| "glowTexture"
---Sample the blue channel of the material's metalness texture when computing the metalness value of a `Surface`. When false, the surface will have a constant metalness based on the material's `metalness` property, instead of using a texture.
---| "metalnessTexture"
---Sample the green channel of the material's roughness texture when computing the roughness value of a `Surface`. When false, the surface will have a constant roughness based on the material's `roughness` property, instead of using a texture.
---| "roughnessTexture"
---Sample the red channel of the `occlusionTexture` of the material to compute the occlusion property of a `Surface`.  When false, the occlusion will be `1.0` (no occlusion).
---| "ambientOcclusion"
---Sample the red channel of the material's `clearcoatTexture` to compute the `clearcoat` property of a `Surface`.  When false, only the `clearcoat` property of the material will be used, and the texture will be ignored.
---| "clearcoatTexture"
---Apply ACES tonemapping to the final color output.  This will compress color channel values down to the 0-1 range while attempting to preserve detail in highlights and shadows.
---| "tonemap"

---Different shader stages.  Graphics shaders have a `vertex` and `fragment` stage, and compute shaders have a single `compute` stage.
---@alias ShaderStage
---The vertex stage, which computes transformed vertex positions.
---| "vertex"
---The fragment stage, which computes pixel colors.
---| "fragment"
---The compute stage, which performs arbitrary computation.
---| "compute"

---The two types of shaders that can be created.
---@alias ShaderType
---A graphics shader with a vertex and pixel stage.
---| "graphics"
---A compute shader with a single compute stage.
---| "compute"

---Different types of stacks that can be pushed and popped with `Pass:push` and `Pass:pop`.
---@alias StackType
---The transform stack (`Pass:transform`, `Pass:translate`, etc.).
---| "transform"
---Graphics state, like `Pass:setColor`, `Pass:setFont`, etc.  Notably this does not include camera poses/projections or shader variables changed with `Pass:send`.
---| "state"

---Different ways of updating the stencil buffer with `Pass:setStencilWrite`.
---@alias StencilAction
---Stencil buffer pixels will not be changed by draws.
---| "keep"
---Stencil buffer pixels will be set to zero.
---| "zero"
---Stencil buffer pixels will be replaced with a custom value.
---| "replace"
---Stencil buffer pixels will be incremented each time they're rendered to.
---| "increment"
---Stencil buffer pixels will be decremented each time they're rendered to.
---| "decrement"
---Similar to increment, but will wrap around to 0 when it exceeds 255.
---| "incrementwrap"
---Similar to decrement, but will wrap around to 255 when it goes below 0.
---| "decrementwrap"
---The bits in the stencil buffer pixels will be inverted.
---| "invert"

---These are the different ways `Texture` objects can be used.  These are passed in to `lovr.graphics.isFormatSupported` to see which texture operations are supported by the GPU for a given format.
---@alias TextureFeature
---The Texture can be sampled (e.g. used in a `Material` or sent to a `texture2D` variable in shaders).
---| "sample"
---The Texture can used as a canvas in a `Pass`.
---| "render"
---The Texture can be sent to a storage image variable in shaders (e.g. `image2D`).
---| "storage"
---The Texture can be used with `Pass:blit` and `Pass:generateMipmaps`.
---| "blit"
---The Texture can be used with a sampler that uses a `cubic` filter mode.  See `FilterMode`.
---| "cubic"

---Different types of textures.  Textures are multidimensional blocks of GPU memory, and the texture's type determines how many dimensions there are, and adds some semantics about what the 3rd dimension means.
---@alias TextureType
---A single 2D image, the most common type.
---| "2d"
---A 3D image, where a sequence of 2D images defines a 3D volume.  Each mipmap level of a 3D texture gets smaller in the x, y, and z axes, unlike cubemap and array textures.
---| "3d"
---Six square 2D images with the same dimensions that define the faces of a cubemap, used for skyboxes or other "directional" images.  Can also have higher multiples of 6 images, which will be interpreted as a cubemap array image.
---| "cube"
---Array textures are sequences of distinct 2D images that all have the same dimensions.
---| "array"

---These are the different things `Texture`s can be used for.  When creating a Texture, a set of these flags can be provided, restricting what operations are allowed on the texture.  Using a smaller set of flags may improve performance.  If none are provided, the only usage flag applied is `sample`.
---@alias TextureUsage
---Whether the texture can be sampled from in Shaders (i.e. used in a material, or bound to a variable with a `texture` type, like `texture2D`).
---| "sample"
---Whether the texture can be rendered to (i.e. by using it as a render target in `lovr.graphics.pass`).
---| "render"
---Whether the texture can be used as a storage texture for compute operations (i.e. bound to a variable with an `image` type, like `image2D`).
---| "storage"
---Whether the texture can be used for transfer operations like `Texture:setPixels`, `Texture:blit`, etc.
---| "transfer"

---Different ways to vertically align text with `Pass:text`.
---@alias VerticalAlign
---Top-aligned text.
---| "top"
---Centered text.
---| "middle"
---Bottom-aligned text.
---| "bottom"

---Indicates whether the front face of a triangle uses the clockwise or counterclockwise vertex order.
---@alias Winding
---Clockwise winding.
---| "clockwise"
---Counterclockwise winding.
---| "counterclockwise"

---Controls how `Sampler` objects wrap textures.
---@alias WrapMode
---Pixels will be clamped to the edge, with pixels outside the 0-1 uv range using colors from the nearest edge.
---| "clamp"
---Tiles the texture.
---| "repeat"
---Similar to `repeat`, but flips the texture each time it repeats.
---| "mirror"
---Similar to `clamp`, but everything outside the 0-1 uv range will be filled with transparent black, i.e. `(0, 0, 0, 0)`.
---| "border"
