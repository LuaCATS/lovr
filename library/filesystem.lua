---@meta

---The `lovr.filesystem` module provides access to the filesystem.
---
---All files written will go in a special folder called the "save directory".  The location of the save directory is platform-specific:
---
---<table>
---  <tr>
---    <td>Windows</td>
---    <td><code>C:\Users\&lt;user&gt;\AppData\Roaming\LOVR\&lt;identity&gt;</code></td>
---  </tr>
---  <tr>
---    <td>macOS</td>
---    <td><code>/Users/&lt;user&gt;/Library/Application Support/LOVR/&lt;identity&gt;</code></td>
---  </tr>
---  <tr>
---    <td>Linux</td>
---    <td><code>/home/&lt;user&gt;/.local/share/LOVR/&lt;identity&gt;</code></td>
---  </tr>
---  <tr>
---    <td>Android</td>
---    <td><code>/sdcard/Android/data/&lt;identity&gt;/files</code></td>
---  </tr> </table>
---
---`<identity>` is a unique identifier for the project, and can be set in `lovr.conf`.  On Android, the identity can not be changed and will always be the package id (e.g. `org.lovr.app`).
---
---When files are read, they will be searched for in multiple places.  By default, the save directory is checked first, then the project source (folder or zip).  That way, when data is written to a file, any future reads will see the new data.  The `t.saveprecedence` conf setting can be used to change this precedence.
---
---Conceptually, `lovr.filesystem` uses a "virtual filesystem", which is an ordered list of folders and zip files that are merged into a single filesystem hierarchy.  Folders and archives in the list can be added and removed with `lovr.filesystem.mount` and `lovr.filesystem.unmount`.
---
---LÖVR extends Lua's `require` function to look for modules in the virtual filesystem.  The search patterns can be changed with `lovr.filesystem.setRequirePath`, similar to `package.path`.
---
---@class lovr.filesystem
lovr.filesystem = {}

---Appends content to the end of a file.
---
---#### Notes:
---
---If the file does not exist, it is created.
---
---@param filename string The file to append to.
---@param content string A string to write to the end of the file.
---@return number bytes The number of bytes actually appended to the file.
function lovr.filesystem.append(filename, content) end

---Appends content to the end of a file.
---
---#### Notes:
---
---If the file does not exist, it is created.
---
---@param filename string The file to append to.
---@param blob Blob A Blob containing data to append to the file.
---@return number bytes The number of bytes actually appended to the file.
function lovr.filesystem.append(filename, blob) end

---Creates a directory in the save directory.  Any parent directories that don't exist will also be created.
---
---@param path string The directory to create, recursively.
---@return boolean success Whether the directory was created.
function lovr.filesystem.createDirectory(path) end

---Returns the application data directory.  This will be something like:
---
---- `C:\Users\user\AppData\Roaming` on Windows.
---- `/home/user/.config` on Linux.
---- `/Users/user/Library/Application Support` on macOS.
---
---@return string path The absolute path to the appdata directory.
function lovr.filesystem.getAppdataDirectory() end

---Returns a sorted table containing all files and folders in a single directory.
---
---#### Notes:
---
---This function calls `table.sort` to sort the results, so if `table.sort` is not available in the global scope the results are not guaranteed to be sorted.
---
---@param path string The directory.
---@return table items A table with a string for each file and subfolder in the directory.
function lovr.filesystem.getDirectoryItems(path) end

---Returns the absolute path of the LÖVR executable.
---
---@return string path The absolute path of the LÖVR executable, or `nil` if it is unknown.
function lovr.filesystem.getExecutablePath() end

---Returns the identity of the game, which is used as the name of the save directory.  The default is `default`.  It can be changed using `t.identity` in `lovr.conf`.
---
---#### Notes:
---
---On Android, this is always the package id (like `org.lovr.app`).
---
---@return string identity The name of the save directory, or `nil` if it isn't set.
function lovr.filesystem.getIdentity() end

---Returns when a file was last modified, since some arbitrary time in the past.
---
---@param path string The file to check.
---@return number time The modification time of the file, in seconds, or `nil` if it's unknown.
function lovr.filesystem.getLastModified(path) end

---Get the absolute path of the mounted archive containing a path in the virtual filesystem.  This can be used to determine if a file is in the game's source directory or the save directory.
---
---@param path string The path to check.
---@return string realpath The absolute path of the mounted archive containing `path`.
function lovr.filesystem.getRealDirectory(path) end

---Returns the require path.  The require path is a semicolon-separated list of patterns that LÖVR will use to search for files when they are `require`d.  Any question marks in the pattern will be replaced with the module that is being required.  It is similar to Lua\'s `package.path` variable, but the main difference is that the patterns are relative to the virtual filesystem.
---
---#### Notes:
---
---The default reqiure path is '?.lua;?/init.lua'.
---
---@return string path The semicolon separated list of search patterns.
function lovr.filesystem.getRequirePath() end

---Returns the absolute path to the save directory.
---
---#### Notes:
---
---The save directory takes the following form:
---
---    <appdata>/LOVR/<identity>
---
---Where `<appdata>` is `lovr.filesystem.getAppdataDirectory` and `<identity>` is `lovr.filesystem.getIdentity` and can be customized using `lovr.conf`.
---
---@return string path The absolute path to the save directory.
function lovr.filesystem.getSaveDirectory() end

---Returns the size of a file, in bytes.
---
---#### Notes:
---
---If the file does not exist, an error is thrown.
---
---@param file string The file.
---@return number size The size of the file, in bytes.
function lovr.filesystem.getSize(file) end

---Get the absolute path of the project's source directory or archive.
---
---@return string path The absolute path of the project's source, or `nil` if it's unknown.
function lovr.filesystem.getSource() end

---Returns the absolute path of the user's home directory.
---
---@return string path The absolute path of the user's home directory.
function lovr.filesystem.getUserDirectory() end

---Returns the absolute path of the working directory.  Usually this is where the executable was started from.
---
---@return string path The current working directory, or `nil` if it's unknown.
function lovr.filesystem.getWorkingDirectory() end

---Check if a path exists and is a directory.
---
---@param path string The path to check.
---@return boolean isDirectory Whether or not the path is a directory.
function lovr.filesystem.isDirectory(path) end

---Check if a path exists and is a file.
---
---@param path string The path to check.
---@return boolean isFile Whether or not the path is a file.
function lovr.filesystem.isFile(path) end

---Returns whether the current project source is fused to the executable.
---
---@return boolean fused Whether or not the project is fused.
function lovr.filesystem.isFused() end

---Load a file containing Lua code, returning a Lua chunk that can be run.
---
---#### Notes:
---
---An error is thrown if the file contains syntax errors.
---
---#### Example:
---
---Safely loading code:
---
---```lua
---local success, chunk = pcall(lovr.filesystem.load, filename)
---if not success then
---  print('Oh no! There was an error: ' .. tostring(chunk))
---else
---  local success, result = pcall(chunk)
---  print(success, result)
---end
---```
---
---@param filename string The file to load.
---@param mode? string The type of code that can be loaded.  `t` allows text, `b` allows binary, and `bt` allows both.
---@return function chunk The runnable chunk.
function lovr.filesystem.load(filename, mode) end

---Mounts a directory or `.zip` archive, adding it to the virtual filesystem.  This allows you to read files from it.
---
---#### Notes:
---
---The `append` option lets you control the priority of the archive's files in the event of naming collisions.
---
---This function is not thread safe.  Mounting or unmounting an archive while other threads call lovr.filesystem functions is not supported.
---
---#### Example:
---
---Mount `data.zip` with a file `images/background.png`:
---
---```lua
---lovr.filesystem.mount('data.zip', 'assets')
---print(lovr.filesystem.isFile('assets/images/background.png')) -- true
---```
---
---@param path string The path to mount.
---@param mountpoint? string The path in the virtual filesystem to mount to.
---@param append? boolean Whether the archive will be added to the end or the beginning of the search path.
---@param root? string A subdirectory inside the archive to use as the root.  If `nil`, the actual root of the archive is used.
---@return boolean success Whether the archive was successfully mounted.
function lovr.filesystem.mount(path, mountpoint, append, root) end

---Creates a new Blob that contains the contents of a file.
---
---@param filename string The file to load.
---@return Blob blob The new Blob.
function lovr.filesystem.newBlob(filename) end

---Opens a file, returning a `File` object that can be used to read/write the file contents.
---
---Normally you can just use `lovr.filesystem.read`, `lovr.filesystem.write`, etc.  However, those methods open and close the file each time they are called.  So, when performing multiple operations on a file, creating a File object and keeping it open will have less overhead.
---
---#### Example:
---
---```lua
---function lovr.load()
---  local file = lovr.filesystem.newFile('asdf.txt', 'w')
---  file:write('asdf')
---  file:release()
---end
---```
---
---@param path string The path of the file to open.
---@param mode OpenMode The mode to open the file in (`r`, `w`, or `a`).
---@return File file A new file object, or nil if an error occurred.
---@return string error The error message, if an error occurred.
function lovr.filesystem.newFile(path, mode) end

---Read the contents of a file.
---
---#### Notes:
---
---If the file does not exist or cannot be read, nil is returned.
---
---@param filename string The name of the file to read.
---@param bytes? number The number of bytes to read (if -1, all bytes will be read).
---@return string contents The contents of the file.
---@return number bytes The number of bytes read from the file.
function lovr.filesystem.read(filename, bytes) end

---Remove a file or directory in the save directory.
---
---#### Notes:
---
---A directory can only be removed if it is empty.
---
---To recursively remove a folder, use this function with `lovr.filesystem.getDirectoryItems`.
---
---@param path string The file or directory to remove.
---@return boolean success Whether the path was removed.
function lovr.filesystem.remove(path) end

---Set the name of the save directory.  This function can only be called once and is called automatically at startup, so this function normally isn't called manually.  However, the identity can be changed by setting the `t.identity` option in `lovr.conf`.
---
---@param identity string The name of the save directory.
function lovr.filesystem.setIdentity(identity) end

---Sets the require path.  The require path is a semicolon-separated list of patterns that LÖVR will use to search for files when they are `require`d.  Any question marks in the pattern will be replaced with the module that is being required.  It is similar to Lua\'s `package.path` variable, except the patterns will be checked using `lovr.filesystem` APIs. This allows `require` to work even when the project is packaged into a zip archive, or when the project is launched from a different directory.
---
---#### Notes:
---
---The default reqiure path is '?.lua;?/init.lua'.
---
---@param path? string An optional semicolon separated list of search patterns.
function lovr.filesystem.setRequirePath(path) end

---Unmounts a directory or archive previously mounted with `lovr.filesystem.mount`.
---
---#### Notes:
---
---This function is not thread safe.  Mounting or unmounting an archive while other threads call lovr.filesystem functions is not supported.
---
---@param path string The path to unmount.
---@return boolean success Whether the archive was unmounted.
function lovr.filesystem.unmount(path) end

---Stops watching files.
---
function lovr.filesystem.unwatch() end

---Starts watching the filesystem for changes.  File events will be reported by the `lovr.filechanged` callback.
---
---Currently, on PC, only files in the source directory will be watched.  On Android, files in the save directory will be watched instead, so that pushing new files with `adb` can be detected.
---
function lovr.filesystem.watch() end

---Write to a file in the save directory.
---
---#### Notes:
---
---If the file does not exist, it is created.
---
---If the file already has data in it, it will be replaced with the new content.
---
---If the path contains subdirectories, all of the parent directories need to exist first or the write will fail.  Use `lovr.filesystem.createDirectory` to make sure they're created first.
---
---@param filename string The file to write to.
---@param content string A string to write to the file.
---@return boolean success Whether the write was successful.
function lovr.filesystem.write(filename, content) end

---Write to a file in the save directory.
---
---#### Notes:
---
---If the file does not exist, it is created.
---
---If the file already has data in it, it will be replaced with the new content.
---
---If the path contains subdirectories, all of the parent directories need to exist first or the write will fail.  Use `lovr.filesystem.createDirectory` to make sure they're created first.
---
---@param filename string The file to write to.
---@param blob Blob A Blob containing data to write to the file.
---@return boolean success Whether the write was successful.
function lovr.filesystem.write(filename, blob) end

---A File is an object that provides read or write access to a file on the filesystem.
---@class File
local File = {}

---Returns the mode the file was opened in.
---
---@return OpenMode mode The mode the file was opened in (`r`, `w`, or `a`).
function File:getMode() end

---Returns the file's path.
---
---@return string path The file path.
function File:getPath() end

---Returns the size of the file, in bytes.
---
---@return number size The size of the file, in bytes, or nil if an error occurred.
---@return string error The error message, if an error occurred.
function File:getSize() end

---Returns whether the end of file has been reached.  When true, `File:read` will no longer return data.
---
---@return boolean eof Whether the end of the file has been reached.
function File:isEOF() end

---Reads data from the file.
---
---#### Notes:
---
---The file must have been opened for reading.
---
---The maximum number of bytes that can be read at a time is 2^53 - 1.
---
---@param bytes number The number of bytes to read from the file, or `nil` to read the rest of the file.
---@return string data The data that was read, or nil if an error occurred.
---@return number size The number of bytes that were read, or the error message if an error occurred.
function File:read(bytes) end

---Seeks to a new position in the file.  `File:read` and `File:write` will read/write relative to this position.
---
---@param offset number The new file offset, in bytes.
function File:seek(offset) end

---Returns the seek position of the file, which is where `File:read` and `File:write will read/write from.
---
---@return number offset The file offset, in bytes.
function File:tell() end

---Writes data to the file.
---
---#### Notes:
---
---The maximum number of bytes that can be written at a time is 2^53 - 1.
---
---Use `File:seek` to control where the data is written.
---
---@param string string A string to write to the file.
---@param size? number The number of bytes to write, or nil to write all of the data from the string/Blob.
---@return boolean success Whether the data was successfully written.
---@return string message The error message.
function File:write(string, size) end

---Writes data to the file.
---
---#### Notes:
---
---The maximum number of bytes that can be written at a time is 2^53 - 1.
---
---Use `File:seek` to control where the data is written.
---
---@param blob Blob The Blob containing data to write to the file.
---@param size? number The number of bytes to write, or nil to write all of the data from the string/Blob.
---@return boolean success Whether the data was successfully written.
---@return string message The error message.
function File:write(blob, size) end

---The different actions that can be taken on files, reported by `lovr.filechanged` when filesystem watching is active.
---@alias FileAction
---The file was created.
---| "create"
---The file was deleted.
---| "delete"
---The file's contents were modified.
---| "modify"
---The file was renamed.
---| "rename"

---Different ways to open a `File` with `lovr.filesystem.newFile`.
---@alias OpenMode
---Open the file for reading.
---| "r"
---Open the file for writing (overwrites existing data).
---| "w"
---Open the file for appending.
---| "a"
