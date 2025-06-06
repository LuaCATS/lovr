---@meta

---`lovr` is the single global table that is exposed to every LÖVR app. It contains a set of **modules** and a set of **callbacks**.
---
---@class lovr
lovr = {}

---Get the current major, minor, and patch version of LÖVR.
---
---@return number major The major version.
---@return number minor The minor version.
---@return number patch The patch number.
---@return string codename The version codename.
---@return string commit The commit hash (not available in all builds).
function lovr.getVersion() end

---The superclass of all LÖVR objects.  All objects have these methods.
---@class Object
local Object = {}

---Immediately destroys Lua's reference to the object it's called on.  After calling this function on an object, it is an error to do anything with the object from Lua (call methods on it, pass it to other functions, etc.).  If nothing else is using the object, it will be destroyed immediately, which can be used to destroy something earlier than it would normally be garbage collected in order to reduce memory.
---
---#### Notes:
---
---The object may not be destroyed immediately if something else is referring to it (e.g. it is pushed to a Channel or exists in the payload of a pending event).
---
function Object:release() end

---Returns the name of the object's type as a string.
---
---#### Example:
---
---```lua
---function isTexture(obj)
---  return type(obj) == 'userdata' and obj:type() == 'Texture'
---end
---```
---
---@return string type The type of the object.
function Object:type() end
