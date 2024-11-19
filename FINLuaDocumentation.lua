---@meta

--- 
---@class ModuleTableFunction
ModuleTableFunction = {}

--- 
---@type string
ModuleTableFunction.name = nil


--- 
---@type string
ModuleTableFunction.displayName = nil


--- 
---@type string
ModuleTableFunction.description = nil


--- 
---@type string
ModuleTableFunction.quickRef = nil


--- The component library contains functions that allow interaction with the component network.
---@type table
component = {}
--- Generates and returns instances of the network components with the given UUIDs. +
--- You can pass any amount of parameters and each parameter will then have a corresponding return value. +
--- Each parameter can be either a string, or an array of strings.
--- These strings should then contain just the UUID of a network component. +
--- If a network component cannot be found for a given string, nil will be used for the return.
--- Otherwise, an instance of the network component will be returned. +
--- If a parameter is a string array, the return value will be an array of network component instances.
---@param ... string | string[] The UUID[-Arrays] of the network component[s].
---@return Object | Object[] | nil ... The Network-Component[-Array]s associated with the UUIDs, nil if the UUID was not found.
---@type (fun(...:string | string[]):(...:Object | Object[] | nil))|ModuleTableFunction
function component.proxy(...) end


--- Searches the component network for components with the given query or have the given type. +
--- You can pass multiple parameters and each parameter will be handled separately and returns a corresponding return value.
---@param ... string | Object-Class A nick/group query as string or a class for the components in the network you try to find.
---@return string[] ... List of network component UUIDs which pass the given nick query or are of the given type.
---@type (fun(...:string | Object-Class):(...:string[]))|ModuleTableFunction
function component.findComponent(...) end




--- The Computer Library provides functions for interaction with the computer and especially the Lua Runtime.
---@type table
computer = {}
--- Returns the used memory and memory capacity the computer has.
---@return int usage The memory usage at the current time
---@return int capacity The memory capacity the computer has
---@type (fun():(usage:int,capacity:int))|ModuleTableFunction
function computer.getMemory() end


--- Returns a reference to the computer case in which the current code is running.
---@return ComputerCase case 
---@type (fun():(case:ComputerCase))|ModuleTableFunction
function computer.getInstance() end


--- Stops the current code execution immediately and queues the system to restart in the next tick.
---@type (fun())|ModuleTableFunction
function computer.reset() end


--- Stops the current code execution. +
--- Basically kills the PC runtime immediately.
---@type (fun())|ModuleTableFunction
function computer.stop() end


--- Crashes the computer with the given error message.
---@type (fun())|ModuleTableFunction
function computer.panic() end


--- This function can be used to skip the current lua tick prematurely.
--- Mostly for people who want to optimize their games runtime performance.
---@type (fun())|ModuleTableFunction
function computer.skip() end


--- This function is mainly used to allow switching to a higher tick runtime state.
--- Usually you use this when you want to make your code run faster when using functions that can run in asynchronous environment.
---@type (fun())|ModuleTableFunction
function computer.promote() end


--- This function is used to allow switching back to the normal tick rate.
---@type (fun())|ModuleTableFunction
function computer.demote() end


--- Returns true if the Lua runtime is currently promoted/elevated.
--- Which means its running in an seperate game thread allowing for fast bulk calculations.
---@return bool isPromoted 
---@type (fun():(isPromoted:bool))|ModuleTableFunction
function computer.isPromoted() end


--- DEPRECATED! Please use `isPromoted()` instead
---@type (fun())|ModuleTableFunction
function computer.state() end


--- Lets the computer emit a simple beep sound with the given pitch.
---@type (fun())|ModuleTableFunction
function computer.beep() end


--- Sets the code of the current eeprom. Doesn￢ﾀﾙt cause a system reset.
---@type (fun())|ModuleTableFunction
function computer.setEEPROM() end


--- Returns the current eeprom contents.
---@return string code 
---@type (fun():(code:string))|ModuleTableFunction
function computer.getEEPROM() end


--- Returns the number of game seconds passed since the save got created. A game day consists of 24 game hours, a game hour consists of 60 game minutes, a game minute consists of 60 game seconds.
---@return number time 
---@type (fun():(time:number))|ModuleTableFunction
function computer.time() end


--- Returns the amount of milliseconds passed since the system started.
---@return int millis 
---@type (fun():(millis:int))|ModuleTableFunction
function computer.millis() end


--- Allows you to print a log message to the computers log with the given log verbosity.
---@param verbosity int The log-level/verbosity of the message you want to log. 0 = Debug, 1 = Info, 2 = Warning, 3 = Error & 4 = Fatal
---@param message string The log message you want to print
---@type (fun(verbosity:int,message:string))|ModuleTableFunction
function computer.log(verbosity, message) end


--- This function allows you to prompt a user with the given username, with a text message.
---@param text string The Text you want to send as Notification to the user
---@param username string The username of the user you want to send the notification to
---@type (fun(text:string,username:string))|ModuleTableFunction
function computer.textNotification(text, username) end


--- Allows to send a World Marker/Attention Ping for all or the given user.
---@param position Struct<FVector> The position in the world where the ping should occur
---@param username string The username of the user you want to ping.
---@type (fun(position:Struct<FVector>,username:string))|ModuleTableFunction
function computer.attentionPing(position, username) end


--- Returns some kind of strange/mysterious time data from a unknown place (the real life).
---@return int unix Unix Timestamp
---@return string cultureTime The time as text with the culture format used by the Host
---@return string iso8601 The time as a Date-Time-Stamp after ISO 8601
---@type (fun():(unix:int,cultureTime:string,iso8601:string))|ModuleTableFunction
function computer.magicTime() end


--- This function allows you to get all installed https://docs.ficsit.app/ficsit-networks/latest/buildings/ComputerCase/index.html#_pci_interface[PCI-Devices] in a computer of a given type.
--- Have a look at https://docs.ficsit.app/ficsit-networks/latest/lua/examples/PCIDevices.html[this] example to fully understand how it works.
---@param type Class Optional type which will be used to filter all PCI-Devices. If not provided, will return all PCI-Devices.
---@return Object[] objects An array containing instances for each PCI-Device built into the computer.
---@type (fun(type:Class):(objects:Object[]))|ModuleTableFunction
function computer.getPCIDevices(type) end


--- Field containing a reference to the Media Subsystem.
---@type FINMediaSubsystem
computer.media = nil




--- 
---@type table
debug = {}
--- Allows to log the given strings to the Game Log.
---@type (fun())|ModuleTableFunction
function debug.log() end


--- Check https://www.lua.org/manual/5.4/manual.html#pdf-debug.getinfo[the Lua Manual] for more information.
---@type (fun())|ModuleTableFunction
function debug.getinfo() end


--- Check https://www.lua.org/manual/5.4/manual.html#pdf-debug.traceback[the Lua Manual] for more information.
---@type (fun())|ModuleTableFunction
function debug.traceback() end




--- 
---@class EventQueue
EventQueue = {}

--- 
---@type (fun())|ModuleTableFunction
function EventQueue.pull() end


--- Returns a Future that resolves when a signal got added to the queue that matches the given Event Filter.
---@type (fun())|ModuleTableFunction
function EventQueue.waitFor() end


--- The Event API provides classes, functions and variables for interacting with the component network.
---@type table
event = {}
--- Adds the running lua context to the listen queue of the given components.
---@type (fun())|ModuleTableFunction
function event.listen() end


--- Returns all signal senders this computer is listening to.
---@return Object[] listening 
---@type (fun():(listening:Object[]))|ModuleTableFunction
function event.listening() end


--- Waits for a signal in the queue. Blocks the execution until a signal got pushed to the signal queue, or the timeout is reached. +
--- Returns directly if there is already a signal in the queue (the tick doesn￢ﾀﾙt get yielded).
---@param timeout number The amount of time needs to pass until pull unblocks when no signal got pushed. If not set, the function will block indefinitely until a signal gets pushed. If set to `0` (int), will not yield the tick and directly return with the signal data or nil if no signal was in the queue.
---@return string|nil event The name of the returned signal. Nil when timeout got reached.
---@return Object sender The component representation of the signal sender. Not set when timeout got reached.
---@return any... parameters The parameters passed to the signal. Not set when timeout got reached.
---@type (fun(timeout:number):(event:string|nil,sender:Object,parameters:any...))|ModuleTableFunction
function event.pull(timeout) end


--- Removes the running lua context from the listen queue of the given components. Basically the opposite of listen.
---@type (fun())|ModuleTableFunction
function event.ignore() end


--- Stops listening to any signal sender. If afterwards there are still coming signals in, it might be the system itself or caching bug.
---@type (fun())|ModuleTableFunction
function event.ignoreAll() end


--- Clears every signal from the signal queue.
---@type (fun())|ModuleTableFunction
function event.clear() end


--- Creates an Event filter expression.
---@type (fun())|ModuleTableFunction
function event.filter() end


--- Registers the given function as a listener.
--- When `event.pull()` pulls a signal from the queue, that matches the given Event-Filter,
--- a Task will be created using the function and the signals parameters will be passed into the function.
---@type (fun())|ModuleTableFunction
function event.registerListener() end


--- Creates a new event queue.
--- When this variable closes or gets garbage collected, it will stop receiving signals.
---@type (fun())|ModuleTableFunction
function event.queue() end


--- Returns a Future that resolves when a signal got polled that matches the given Event Filter.
---@type (fun())|ModuleTableFunction
function event.waitFor() end




--- 
---@class File
File = {}

--- Closes the File-Stream.
---@type (fun())|ModuleTableFunction
function File.close() end


--- Writes the given strings to the File-Stream.
---@type (fun())|ModuleTableFunction
function File.write() end


--- Reads up to the given amount of bytes from the file.
--- Strings may be smaller than the given amount of bytes due to f.e. reaching the End-Of-File.
---@type (fun())|ModuleTableFunction
function File.read() end


--- Moves the File-Streams pointer to a position defined by the offset and from what starting location.
--- 
--- .Possble `where` values
--- [%collapsible]
--- ====
--- * `cur` Offset is relative to the current location
--- * `set` Offset is relative to the beginning of the file
--- * `end` Offset is relative to the end of the file
--- ====
---@type (fun())|ModuleTableFunction
function File.seek() end


--- The filesystem api provides structures, functions and variables for interacting with the virtual file systems.
--- You can't access files outside the virtual filesystem. If you try to do so, the Lua runtime crashes.
---@type table
filesystem = {}
--- Trys to create a new file system of the given type with the given name.
--- The created filesystem will be added to the system DevDevice.
--- 
--- .Possible Types:
--- [%collapsible]
--- ====
--- * `tmpfs`
--- +
--- A temporary filesystem only existing at runtime in the memory of your computer. All data will be lost when the system stops.
--- ====
---@param type string the type of the new filesystem
---@param name string the name of the new filesystem you want to create
---@return bool success returns true if it was able to create the new filesystem
---@type (fun(type:string,name:string):(success:bool))|ModuleTableFunction
function filesystem.makeFileSystem(type, name) end


--- Tries to remove the filesystem with the given name from the system DevDevice.
--- All mounts of the device will run invalid.
---@param name string the name of the new filesystem you want to remove
---@return bool success returns true if it was able to remove the new filesystem
---@type (fun(name:string):(success:bool))|ModuleTableFunction
function filesystem.removeFileSystem(name) end


--- Trys to mount the system DevDevice to the given location.
--- The DevDevice is special Device holding DeviceNodes for all filesystems added to the system. (like TmpFS and drives). It is unmountable as well as getting mounted a seccond time.
---@param path string path to the mountpoint were the dev device should get mounted to
---@return bool success returns if it was able to mount the DevDevice
---@type (fun(path:string):(success:bool))|ModuleTableFunction
function filesystem.initFileSystem(path) end


--- Opens a file-stream and returns it as File-table.
--- 
--- .Possible Modes
--- [%collapsible]
--- ====
--- [cols="1,1,4a"]
--- |===
--- | `r` | read only
--- | File-Stream can just read from file. +
---   If file doesn￢ﾀﾙt exist, open will return nil
--- | `w` | write
--- | File-Stream can read and write. +
---   Creates the file if it doesn￢ﾀﾙt exist
--- | `a` | end of file
--- | File-Stream can read and write. +
---   Cursor is set to the end of file.
--- | `+r` | truncate
--- | File-Stream can read and write. +
---   All previous data in file gets dropped
--- | `+a` | append
--- | File-Stream can read the full file, +
---   but can only write to the end of the existing file.
--- |===
--- ====
---@param path string the path to the file you want to open a file-stream for
---@param mode string The mode for the file stream
---@return File file The File table of the file stream. Nil if not able to open file in read only.
---@type (fun(path:string,mode:string):(file:File))|ModuleTableFunction
function filesystem.open(path, mode) end


--- Creates the folder path.
---@param path string folder path the function should create
---@param recursive bool If false creates only the last folder of the path. If true creates all folders in the path.
---@return bool success Returns true if it was able to create the directory.
---@type (fun(path:string,recursive:bool):(success:bool))|ModuleTableFunction
function filesystem.createDir(path, recursive) end


--- Removes the filesystem object at the given path.
---@param path string path to the filesystem object
---@param recusive bool If false only removes the given filesystem object. If true removes all childs of the filesystem object.
---@return bool success Returns true if it was able to remove the node
---@type (fun(path:string,recusive:bool):(success:bool))|ModuleTableFunction
function filesystem.remove(path, recusive) end


--- Moves the filesystem object from the given path to the other given path.
--- 
--- Function fails if it is not able to move the object.
---@param from string path to the filesystem object you want to move
---@param to string path to the filesystem object the target should get moved to
---@return bool success returns true if it was able to move the node
---@type (fun(from:string,to:string):(success:bool))|ModuleTableFunction
function filesystem.move(from, to) end


--- Renames the filesystem object at the given path to the given name.
---@param path string path to the filesystem object you want to rename
---@param name string the new name for your filesystem object
---@return bool success returns true if it was able to rename the node
---@type (fun(path:string,name:string):(success:bool))|ModuleTableFunction
function filesystem.rename(path, name) end


--- Returns true if the given path exists.
---@type (fun())|ModuleTableFunction
function filesystem.exists() end


--- Lists all children names of the node with the given path. (f.e. items in a folder)
---@type (fun())|ModuleTableFunction
function filesystem.children() end


--- Returns true if the given path refers to a file.
---@type (fun())|ModuleTableFunction
function filesystem.isFile() end


--- Returns true if the given path refers to directory.
---@type (fun())|ModuleTableFunction
function filesystem.isDir() end


--- This function mounts the device referenced by the the path to a device node to the given mount point.
---@param device string the path to the device you want to mount
---@param mountPoint string the path to the point were the device should get mounted to
---@return bool success true if the mount was executed successfully
---@type (fun(device:string,mountPoint:string):(success:bool))|ModuleTableFunction
function filesystem.mount(device, mountPoint) end


--- This function unmounts if the device at the given mount point.
---@param mountPoint string the path the device is mounted to
---@return bool success returns true if it was able to unmount the device located at the mount point
---@type (fun(mountPoint:string):(success:bool))|ModuleTableFunction
function filesystem.unmount(mountPoint) end


--- Executes Lua code in the file referd by the given path.
--- 
--- Function fails if path doesn￢ﾀﾙt exist or path doesn￢ﾀﾙt refer to a file.
--- 
--- Returns the result of the execute function or what ever it yielded
---@type (fun())|ModuleTableFunction
function filesystem.doFile() end


--- Loads the file refered by the given path as a Lua function and returns it.
--- Functions fails if path doesn￢ﾀﾙt exist or path doesn￢ﾀﾙt reger to a file.
---@type (fun())|ModuleTableFunction
function filesystem.loadFile() end


--- Combines a variable amount of strings as paths together to one big path.
--- 
--- Additionally, applies given conversion. Defined by the optionally given integer.
--- 
--- .Possible Conversions
--- [%collapsible]
--- ====
--- [cols="1,10a"]
--- |===
--- | 0 | Normalize the path. +
---       `/my/../weird/./path` -> `/weird/path`
--- | 1 | Normalizes and converts the path to an absolute path. +
---       `my/abs/path` -> `/my/abs/path`
--- | 2 | Normalizes and converts the path to an relative path. +
---       `/my/relative/path` -> `my/relative/path`
--- | 3 | Returns the whole file/folder name. +
---       `/path/to/file.txt` -> `file.txt`
--- | 4 | Returns the stem of the filename. +
---       `/path/to/file.txt` -> `file` +
---       `/path/to/.file` -> `.file`
--- | 5 | Returns the file-extension of the filename. +
---       `/path/to/file.txt` -> `.txt` +
---       `/path/to/.file` -> empty-str +
---       `/path/to/file.` -> `.`
--- |===
--- ====
---@type (fun())|ModuleTableFunction
function filesystem.path() end


--- Each provided string will be viewed as one filesystem-path and will be checked for lexical features. +
--- Each of those string will then have a integer return value which is a bit-flag-register describing those lexical features.
--- 
--- .Bit-Flags
--- [%collapsible]
--- ====
--- [cols="1,10a"]
--- |===
--- | 1 | Is filesystem root
--- | 2 | Is Empty (includes if it is root-path)
--- | 3 | Is absolute path
--- | 4 | Is only a file/folder name
--- | 5 | Filename has extension
--- | 6 | Ends with a `/` -> refers a directory
--- |===
--- ====
---@type (fun())|ModuleTableFunction
function filesystem.analyzePath() end


--- For each given string, returns a bool to tell if string is a valid node (file/folder) name.
---@type (fun())|ModuleTableFunction
function filesystem.isNode() end


--- Returns for each given string path, a table that defines contains some meta information about node the string references.
--- 
--- .Possible `type`-Field strings
--- [%collapsible]
--- ====
--- [cols="1,10a"]
--- | ===
--- | `File`			| A normal File
--- | `Directory`	| A directory or folder that can hold multiple nodes.
--- | `Device`		| A special type of Node that represents a filesystem and can be mounted.
--- | `Unknown`		| The node type is not known to this utility function.
--- | ===
--- ====
---@type (fun())|ModuleTableFunction
function filesystem.meta() end




--- 
---@class FutureStruct
FutureStruct = {}

--- 
---@class Future
Future = {}

--- 
---@type (fun())|ModuleTableFunction
function Future.get() end


--- 
---@type (fun())|ModuleTableFunction
function Future.poll() end


--- 
---@type (fun())|ModuleTableFunction
function Future.await() end


--- 
---@type (fun())|ModuleTableFunction
function Future.canGet() end


--- The global Future Library provides functions to work more easily with futures.
---@type table
future = {}
--- Wraps the given thread/coroutine in a Lua-Future
---@return Future future 
---@type (fun():(future:Future))|ModuleTableFunction
function future.async() end


--- Creates a new Future that will only finish once all futures passed as parameters have finished.
---@return Future future 
---@type (fun():(future:Future))|ModuleTableFunction
function future.join() end


--- Creates a future that returns after the given amount of seconds.
---@type (fun())|ModuleTableFunction
function future.sleep() end


--- A list of futures that are considered "Tasks".
--- Tasks could be seen as background threads. Effectively getting "joined" together.
--- Examples for tasks are callback invocations of timers and event listeners.
future.tasks = nil


--- Adds the given futures to the tasks list.
---@type (fun())|ModuleTableFunction
function future.addTask() end


--- Runs the default task scheduler once.
---@type (fun())|ModuleTableFunction
function future.run() end


--- Runs the default task scheduler indefinitely until no tasks are left.
---@type (fun())|ModuleTableFunction
function future.loop() end




--- 
async = nil


--- Blocks the current thread/future until the given amount of time passed
sleep = nil


--- 
---@class Class
Class = {}

--- 
---@class ClassLib
ClassLib = {}

---@type Object-Class
ClassLib.Object = {}
---@type SignPrefab-Class
ClassLib.SignPrefab = {}
---@type ActorComponent-Class
ClassLib.ActorComponent = {}
---@type Actor-Class
ClassLib.Actor = {}
---@type PowerConnection-Class
ClassLib.PowerConnection = {}
---@type FactoryConnection-Class
ClassLib.FactoryConnection = {}
---@type PipeConnectionBase-Class
ClassLib.PipeConnectionBase = {}
---@type PipeConnection-Class
ClassLib.PipeConnection = {}
---@type RailroadTrackConnection-Class
ClassLib.RailroadTrackConnection = {}
---@type TrainPlatformConnection-Class
ClassLib.TrainPlatformConnection = {}
---@type FINAdvancedNetworkConnectionComponent-Class
ClassLib.FINAdvancedNetworkConnectionComponent = {}
---@type FINMCPAdvConnector-Class
ClassLib.FINMCPAdvConnector = {}
---@type RailroadVehicleMovement-Class
ClassLib.RailroadVehicleMovement = {}
---@type Inventory-Class
ClassLib.Inventory = {}
---@type PowerInfo-Class
ClassLib.PowerInfo = {}
---@type Vehicle-Class
ClassLib.Vehicle = {}
---@type RailroadVehicle-Class
ClassLib.RailroadVehicle = {}
---@type WheeledVehicle-Class
ClassLib.WheeledVehicle = {}
---@type FGBuildableConveyorAttachment-Class
ClassLib.FGBuildableConveyorAttachment = {}
---@type Buildable-Class
ClassLib.Buildable = {}
---@type FGBuildableAttachmentMerger-Class
ClassLib.FGBuildableAttachmentMerger = {}
---@type Build_ConveyorAttachmentMerger_C-Class
ClassLib.Build_ConveyorAttachmentMerger_C = {}
---@type FGBuildableAttachmentSplitter-Class
ClassLib.FGBuildableAttachmentSplitter = {}
---@type Build_ConveyorAttachmentSplitter_C-Class
ClassLib.Build_ConveyorAttachmentSplitter_C = {}
---@type FGBuildableConveyorAttachmentLightweight-Class
ClassLib.FGBuildableConveyorAttachmentLightweight = {}
---@type FGBuildableSplitterSmart-Class
ClassLib.FGBuildableSplitterSmart = {}
---@type Build_ConveyorAttachmentSplitterProgrammable_C-Class
ClassLib.Build_ConveyorAttachmentSplitterProgrammable_C = {}
---@type Build_ConveyorAttachmentSplitterSmart_C-Class
ClassLib.Build_ConveyorAttachmentSplitterSmart_C = {}
---@type CodeableMerger-Class
ClassLib.CodeableMerger = {}
---@type Build_CodeableMerger_C-Class
ClassLib.Build_CodeableMerger_C = {}
---@type CodeableSplitter-Class
ClassLib.CodeableSplitter = {}
---@type Build_CodeableSplitter_C-Class
ClassLib.Build_CodeableSplitter_C = {}
---@type Build_RatioSplitter_C-Class
ClassLib.Build_RatioSplitter_C = {}
---@type Build_RatioMerger_C-Class
ClassLib.Build_RatioMerger_C = {}
---@type FGBuildableAutomatedWorkBench-Class
ClassLib.FGBuildableAutomatedWorkBench = {}
---@type Manufacturer-Class
ClassLib.Manufacturer = {}
---@type Factory-Class
ClassLib.Factory = {}
---@type Build_AutomatedWorkBench_C-Class
ClassLib.Build_AutomatedWorkBench_C = {}
---@type FGBuildableManufacturerVariablePower-Class
ClassLib.FGBuildableManufacturerVariablePower = {}
---@type Build_HadronCollider_C-Class
ClassLib.Build_HadronCollider_C = {}
---@type Serie_Hadron_C-Class
ClassLib.Serie_Hadron_C = {}
---@type Build_Converter_C-Class
ClassLib.Build_Converter_C = {}
---@type Build_QuantumEncoder_C-Class
ClassLib.Build_QuantumEncoder_C = {}
---@type Build_Packager_C-Class
ClassLib.Build_Packager_C = {}
---@type Serie_Packager_C-Class
ClassLib.Serie_Packager_C = {}
---@type Build_SmelterMk1_C-Class
ClassLib.Build_SmelterMk1_C = {}
---@type Serie_Smelt_C-Class
ClassLib.Serie_Smelt_C = {}
---@type Build_ConstructorMk1_C-Class
ClassLib.Build_ConstructorMk1_C = {}
---@type Serie_Const_C-Class
ClassLib.Serie_Const_C = {}
---@type Build_OilRefinery_C-Class
ClassLib.Build_OilRefinery_C = {}
---@type Serie_Refinery_C-Class
ClassLib.Serie_Refinery_C = {}
---@type Build_FoundryMk1_C-Class
ClassLib.Build_FoundryMk1_C = {}
---@type Serie_Foundry_C-Class
ClassLib.Serie_Foundry_C = {}
---@type Build_ManufacturerMk1_C-Class
ClassLib.Build_ManufacturerMk1_C = {}
---@type Serie_Manufacturer_C-Class
ClassLib.Serie_Manufacturer_C = {}
---@type Build_AssemblerMk1_C-Class
ClassLib.Build_AssemblerMk1_C = {}
---@type Serie_Assembler_C-Class
ClassLib.Serie_Assembler_C = {}
---@type Build_Blender_C-Class
ClassLib.Build_Blender_C = {}
---@type Serie_Blender_C-Class
ClassLib.Serie_Blender_C = {}
---@type FGBuildableCheatFluidSink-Class
ClassLib.FGBuildableCheatFluidSink = {}
---@type FGBuildableCheatFluidSpawner-Class
ClassLib.FGBuildableCheatFluidSpawner = {}
---@type FGBuildableCheatItemSink-Class
ClassLib.FGBuildableCheatItemSink = {}
---@type FGBuildableCheatItemSpawner-Class
ClassLib.FGBuildableCheatItemSpawner = {}
---@type Build_TruckStation_C-Class
ClassLib.Build_TruckStation_C = {}
---@type DockingStation-Class
ClassLib.DockingStation = {}
---@type FGBuildableDroneStation-Class
ClassLib.FGBuildableDroneStation = {}
---@type Build_DroneStation_C-Class
ClassLib.Build_DroneStation_C = {}
---@type FGBuildableFactorySimpleProducer-Class
ClassLib.FGBuildableFactorySimpleProducer = {}
---@type Build_TreeGiftProducer_C-Class
ClassLib.Build_TreeGiftProducer_C = {}
---@type Build_FrackingSmasher_C-Class
ClassLib.Build_FrackingSmasher_C = {}
---@type FGBuildableFrackingActivator-Class
ClassLib.FGBuildableFrackingActivator = {}
---@type FGBuildableResourceExtractorBase-Class
ClassLib.FGBuildableResourceExtractorBase = {}
---@type Build_FrackingExtractor_C-Class
ClassLib.Build_FrackingExtractor_C = {}
---@type FGBuildableFrackingExtractor-Class
ClassLib.FGBuildableFrackingExtractor = {}
---@type FGBuildableResourceExtractor-Class
ClassLib.FGBuildableResourceExtractor = {}
---@type Build_WaterPump_C-Class
ClassLib.Build_WaterPump_C = {}
---@type FGBuildableWaterPump-Class
ClassLib.FGBuildableWaterPump = {}
---@type Serie_WaterPump_C-Class
ClassLib.Serie_WaterPump_C = {}
---@type Build_MinerMk1_C-Class
ClassLib.Build_MinerMk1_C = {}
---@type Build_MinerMk2_C-Class
ClassLib.Build_MinerMk2_C = {}
---@type Build_MinerMk3_C-Class
ClassLib.Build_MinerMk3_C = {}
---@type Build_OilPump_C-Class
ClassLib.Build_OilPump_C = {}
---@type FGBuildableGeneratorFuel-Class
ClassLib.FGBuildableGeneratorFuel = {}
---@type FGBuildableGenerator-Class
ClassLib.FGBuildableGenerator = {}
---@type FGBuildableGeneratorNuclear-Class
ClassLib.FGBuildableGeneratorNuclear = {}
---@type Build_GeneratorNuclear_C-Class
ClassLib.Build_GeneratorNuclear_C = {}
---@type Serie_Nuclear_C-Class
ClassLib.Serie_Nuclear_C = {}
---@type Build_GeneratorIntegratedBiomass_C-Class
ClassLib.Build_GeneratorIntegratedBiomass_C = {}
---@type Build_GeneratorBiomass_Automated_C-Class
ClassLib.Build_GeneratorBiomass_Automated_C = {}
---@type Serie_Biomass_C-Class
ClassLib.Serie_Biomass_C = {}
---@type Build_GeneratorFuel_C-Class
ClassLib.Build_GeneratorFuel_C = {}
---@type Serie_FuelGen_C-Class
ClassLib.Serie_FuelGen_C = {}
---@type Build_GeneratorCoal_C-Class
ClassLib.Build_GeneratorCoal_C = {}
---@type Serie_GenCoal_C-Class
ClassLib.Serie_GenCoal_C = {}
---@type Build_GeneratorBiomass_C-Class
ClassLib.Build_GeneratorBiomass_C = {}
---@type FGBuildableGeneratorGeoThermal-Class
ClassLib.FGBuildableGeneratorGeoThermal = {}
---@type Build_GeneratorGeoThermal_C-Class
ClassLib.Build_GeneratorGeoThermal_C = {}
---@type FGBuildableJumppad-Class
ClassLib.FGBuildableJumppad = {}
---@type Build_JumpPadAdjustable_C-Class
ClassLib.Build_JumpPadAdjustable_C = {}
---@type FGBuildablePipeHyperBooster-Class
ClassLib.FGBuildablePipeHyperBooster = {}
---@type FGBuildablePipeHyperAttachment-Class
ClassLib.FGBuildablePipeHyperAttachment = {}
---@type FGBuildablePipeHyperJunction-Class
ClassLib.FGBuildablePipeHyperJunction = {}
---@type FGBuildablePipelineAttachment-Class
ClassLib.FGBuildablePipelineAttachment = {}
---@type FGBuildablePipelineJunction-Class
ClassLib.FGBuildablePipelineJunction = {}
---@type Build_PipelineJunction_Cross_C-Class
ClassLib.Build_PipelineJunction_Cross_C = {}
---@type Build_MultiJunction_C-Class
ClassLib.Build_MultiJunction_C = {}
---@type PipelinePump-Class
ClassLib.PipelinePump = {}
---@type Build_PipelinePumpMk2_C-Class
ClassLib.Build_PipelinePumpMk2_C = {}
---@type Build_CheatFluidPump_C-Class
ClassLib.Build_CheatFluidPump_C = {}
---@type SeriePipePumpMK2_C-Class
ClassLib.SeriePipePumpMK2_C = {}
---@type Serie_PumpMK2_C-Class
ClassLib.Serie_PumpMK2_C = {}
---@type Build_PipelinePump_C-Class
ClassLib.Build_PipelinePump_C = {}
---@type Serie_PipelinePump_C-Class
ClassLib.Serie_PipelinePump_C = {}
---@type Build_Valve_C-Class
ClassLib.Build_Valve_C = {}
---@type Counter_Valve_C-Class
ClassLib.Counter_Valve_C = {}
---@type FGBuildablePipePart-Class
ClassLib.FGBuildablePipePart = {}
---@type FGBuildablePipeHyperPart-Class
ClassLib.FGBuildablePipeHyperPart = {}
---@type PipeHyperStart-Class
ClassLib.PipeHyperStart = {}
---@type Build_PipeHyperStart_C-Class
ClassLib.Build_PipeHyperStart_C = {}
---@type Serie_HyperTubeEntrance_C-Class
ClassLib.Serie_HyperTubeEntrance_C = {}
---@type PipeReservoir-Class
ClassLib.PipeReservoir = {}
---@type Build_IndustrialTank_C-Class
ClassLib.Build_IndustrialTank_C = {}
---@type Build_PipeStorageTank_C-Class
ClassLib.Build_PipeStorageTank_C = {}
---@type FGBuildablePortal-Class
ClassLib.FGBuildablePortal = {}
---@type FGBuildablePortalBase-Class
ClassLib.FGBuildablePortalBase = {}
---@type Build_Portal_C-Class
ClassLib.Build_Portal_C = {}
---@type FGBuildablePortalSatellite-Class
ClassLib.FGBuildablePortalSatellite = {}
---@type Build_PortalSatellite_C-Class
ClassLib.Build_PortalSatellite_C = {}
---@type FGBuildablePowerBooster-Class
ClassLib.FGBuildablePowerBooster = {}
---@type Build_AlienPowerBuilding_C-Class
ClassLib.Build_AlienPowerBuilding_C = {}
---@type PowerStorage-Class
ClassLib.PowerStorage = {}
---@type Build_PowerStorageMk1_C-Class
ClassLib.Build_PowerStorageMk1_C = {}
---@type FGBuildableRadarTower-Class
ClassLib.FGBuildableRadarTower = {}
---@type Build_RadarTower_C-Class
ClassLib.Build_RadarTower_C = {}
---@type TrainPlatform-Class
ClassLib.TrainPlatform = {}
---@type RailroadStation-Class
ClassLib.RailroadStation = {}
---@type Build_TrainStation_C-Class
ClassLib.Build_TrainStation_C = {}
---@type TrainPlatformCargo-Class
ClassLib.TrainPlatformCargo = {}
---@type Build_TrainDockingStation_C-Class
ClassLib.Build_TrainDockingStation_C = {}
---@type Build_TrainDockingStationLiquid_C-Class
ClassLib.Build_TrainDockingStationLiquid_C = {}
---@type FGBuildableTrainPlatformEmpty-Class
ClassLib.FGBuildableTrainPlatformEmpty = {}
---@type Build_TrainPlatformEmpty_C-Class
ClassLib.Build_TrainPlatformEmpty_C = {}
---@type Build_TrainPlatformEmpty_02_C-Class
ClassLib.Build_TrainPlatformEmpty_02_C = {}
---@type ResourceSink-Class
ClassLib.ResourceSink = {}
---@type Build_ResourceSink_C-Class
ClassLib.Build_ResourceSink_C = {}
---@type Serie_Sink_C-Class
ClassLib.Serie_Sink_C = {}
---@type FGBuildableResourceSinkShop-Class
ClassLib.FGBuildableResourceSinkShop = {}
---@type Build_ResourceSinkShop_C-Class
ClassLib.Build_ResourceSinkShop_C = {}
---@type FGBuildableSpaceElevator-Class
ClassLib.FGBuildableSpaceElevator = {}
---@type Build_SpaceElevator_C-Class
ClassLib.Build_SpaceElevator_C = {}
---@type DimensionalDepotUploader-Class
ClassLib.DimensionalDepotUploader = {}
---@type FGBuildableStorage-Class
ClassLib.FGBuildableStorage = {}
---@type Build_CentralStorage_C-Class
ClassLib.Build_CentralStorage_C = {}
---@type Build_Overlow1_C-Class
ClassLib.Build_Overlow1_C = {}
---@type Build_Overlow_C-Class
ClassLib.Build_Overlow_C = {}
---@type Build_StorageIntegrated_C-Class
ClassLib.Build_StorageIntegrated_C = {}
---@type Build_StorageContainerMk1_C-Class
ClassLib.Build_StorageContainerMk1_C = {}
---@type Child_St_C-Class
ClassLib.Child_St_C = {}
---@type MultiVBalanc_3to9_C-Class
ClassLib.MultiVBalanc_3to9_C = {}
---@type MultiSplitter_9m_C-Class
ClassLib.MultiSplitter_9m_C = {}
---@type MultiSplitter_22m_C-Class
ClassLib.MultiSplitter_22m_C = {}
---@type MultiSplitter_8m_C-Class
ClassLib.MultiSplitter_8m_C = {}
---@type Build_TripleUnidirectional_V_C-Class
ClassLib.Build_TripleUnidirectional_V_C = {}
---@type MultiMerger_2_C-Class
ClassLib.MultiMerger_2_C = {}
---@type MultiVBalanc_9to3_2_C-Class
ClassLib.MultiVBalanc_9to3_2_C = {}
---@type Build_TripleUnidirectional_H_C-Class
ClassLib.Build_TripleUnidirectional_H_C = {}
---@type MultiVBalanc_12to12_C-Class
ClassLib.MultiVBalanc_12to12_C = {}
---@type MultiBalanc_3_C-Class
ClassLib.MultiBalanc_3_C = {}
---@type MultiSplitter_18m_C-Class
ClassLib.MultiSplitter_18m_C = {}
---@type MultiMerger_22m_C-Class
ClassLib.MultiMerger_22m_C = {}
---@type MultiVBalanc_3_C-Class
ClassLib.MultiVBalanc_3_C = {}
---@type MultiMerger_18m_C-Class
ClassLib.MultiMerger_18m_C = {}
---@type MultiBalanc_C-Class
ClassLib.MultiBalanc_C = {}
---@type MultiVBalanc_18to6_C-Class
ClassLib.MultiVBalanc_18to6_C = {}
---@type MultiSplitter_2_C-Class
ClassLib.MultiSplitter_2_C = {}
---@type MultiMerger_8m_C-Class
ClassLib.MultiMerger_8m_C = {}
---@type MultiBalanc_2_C-Class
ClassLib.MultiBalanc_2_C = {}
---@type MultiMerger_3_C-Class
ClassLib.MultiMerger_3_C = {}
---@type MultiSplitter_C-Class
ClassLib.MultiSplitter_C = {}
---@type Build_TripleC_C-Class
ClassLib.Build_TripleC_C = {}
---@type MultiMerger_9m_C-Class
ClassLib.MultiMerger_9m_C = {}
---@type Build_TripleB_C-Class
ClassLib.Build_TripleB_C = {}
---@type MultiSplitter_3_C-Class
ClassLib.MultiSplitter_3_C = {}
---@type MultiMerger_C-Class
ClassLib.MultiMerger_C = {}
---@type Build_StorageContainerMk2_C-Class
ClassLib.Build_StorageContainerMk2_C = {}
---@type Build_StorageBlueprint_C-Class
ClassLib.Build_StorageBlueprint_C = {}
---@type Build_StorageHazard_C-Class
ClassLib.Build_StorageHazard_C = {}
---@type Build_StorageMedkit_C-Class
ClassLib.Build_StorageMedkit_C = {}
---@type Build_StoragePlayer_C-Class
ClassLib.Build_StoragePlayer_C = {}
---@type Build_TradingPost_C-Class
ClassLib.Build_TradingPost_C = {}
---@type FGBuildableTradingPost-Class
ClassLib.FGBuildableTradingPost = {}
---@type CL_CounterLimiter-Class
ClassLib.CL_CounterLimiter = {}
---@type Build_CounterLimiter_C-Class
ClassLib.Build_CounterLimiter_C = {}
---@type LBBuild_ModularLoadBalancer-Class
ClassLib.LBBuild_ModularLoadBalancer = {}
---@type Build_ModularLoadBalancer_C-Class
ClassLib.Build_ModularLoadBalancer_C = {}
---@type Build_ModularLoadBalancer_Box_C-Class
ClassLib.Build_ModularLoadBalancer_Box_C = {}
---@type Build_ModularLoadBalancer_Block_C-Class
ClassLib.Build_ModularLoadBalancer_Block_C = {}
---@type Build_ModularLoadBalancer_Input_C-Class
ClassLib.Build_ModularLoadBalancer_Input_C = {}
---@type Build_ModularLoadBalancer_Overflow_C-Class
ClassLib.Build_ModularLoadBalancer_Overflow_C = {}
---@type Build_ModularLoadBalancer_Filtered_C-Class
ClassLib.Build_ModularLoadBalancer_Filtered_C = {}
---@type Build_ModularLoadBalancer_Programmable_C-Class
ClassLib.Build_ModularLoadBalancer_Programmable_C = {}
---@type Build_ModularLoadBalancer_Overflow_Output_C-Class
ClassLib.Build_ModularLoadBalancer_Overflow_Output_C = {}
---@type Build_ModularLoadBalancer_Programmable_Output_C-Class
ClassLib.Build_ModularLoadBalancer_Programmable_Output_C = {}
---@type Build_ModularLoadBalancer_Filtered_Output_C-Class
ClassLib.Build_ModularLoadBalancer_Filtered_Output_C = {}
---@type Build_ModularLoadBalancer_Output_C-Class
ClassLib.Build_ModularLoadBalancer_Output_C = {}
---@type Build_CheatPowerSource_C-Class
ClassLib.Build_CheatPowerSource_C = {}
---@type Build_CheatPowerSink_C-Class
ClassLib.Build_CheatPowerSink_C = {}
---@type Build_JumpPad_C-Class
ClassLib.Build_JumpPad_C = {}
---@type Build_JumpPadTilted_C-Class
ClassLib.Build_JumpPadTilted_C = {}
---@type Build_LandingPad_C-Class
ClassLib.Build_LandingPad_C = {}
---@type Build_CandyCaneDecor_C-Class
ClassLib.Build_CandyCaneDecor_C = {}
---@type Build_Snowman_C-Class
ClassLib.Build_Snowman_C = {}
---@type FGBuildableBeam-Class
ClassLib.FGBuildableBeam = {}
---@type FGBuildableFactoryBuilding-Class
ClassLib.FGBuildableFactoryBuilding = {}
---@type FGBuildableBeamLightweight-Class
ClassLib.FGBuildableBeamLightweight = {}
---@type Build_Beam_Painted_C-Class
ClassLib.Build_Beam_Painted_C = {}
---@type Build_Beam_C-Class
ClassLib.Build_Beam_C = {}
---@type FGBuildableCornerWall-Class
ClassLib.FGBuildableCornerWall = {}
---@type Build_Roof_Metal_InCorner_01_C-Class
ClassLib.Build_Roof_Metal_InCorner_01_C = {}
---@type FGBuildableCornerWallLightweight-Class
ClassLib.FGBuildableCornerWallLightweight = {}
---@type Build_Roof_Metal_InCorner_02_C-Class
ClassLib.Build_Roof_Metal_InCorner_02_C = {}
---@type Build_Roof_Metal_InCorner_03_C-Class
ClassLib.Build_Roof_Metal_InCorner_03_C = {}
---@type Build_Roof_Metal_OutCorner_01_C-Class
ClassLib.Build_Roof_Metal_OutCorner_01_C = {}
---@type Build_Roof_Metal_OutCorner_02_C-Class
ClassLib.Build_Roof_Metal_OutCorner_02_C = {}
---@type Build_Roof_Metal_OutCorner_03_C-Class
ClassLib.Build_Roof_Metal_OutCorner_03_C = {}
---@type Build_Roof_Orange_InCorner_01_C-Class
ClassLib.Build_Roof_Orange_InCorner_01_C = {}
---@type Build_Roof_Orange_InCorner_02_C-Class
ClassLib.Build_Roof_Orange_InCorner_02_C = {}
---@type Build_Roof_Orange_InCorner_03_C-Class
ClassLib.Build_Roof_Orange_InCorner_03_C = {}
---@type Build_Roof_Orange_OutCorner_01_C-Class
ClassLib.Build_Roof_Orange_OutCorner_01_C = {}
---@type Build_Roof_Orange_OutCorner_02_C-Class
ClassLib.Build_Roof_Orange_OutCorner_02_C = {}
---@type Build_Roof_Orange_OutCorner_03_C-Class
ClassLib.Build_Roof_Orange_OutCorner_03_C = {}
---@type Build_Roof_Tar_InCorner_01_C-Class
ClassLib.Build_Roof_Tar_InCorner_01_C = {}
---@type Build_Roof_Tar_InCorner_02_C-Class
ClassLib.Build_Roof_Tar_InCorner_02_C = {}
---@type Build_Roof_Tar_InCorner_03_C-Class
ClassLib.Build_Roof_Tar_InCorner_03_C = {}
---@type Build_Roof_Tar_OutCorner_01_C-Class
ClassLib.Build_Roof_Tar_OutCorner_01_C = {}
---@type Build_Roof_Tar_OutCorner_02_C-Class
ClassLib.Build_Roof_Tar_OutCorner_02_C = {}
---@type Build_Roof_Tar_OutCorner_03_C-Class
ClassLib.Build_Roof_Tar_OutCorner_03_C = {}
---@type Build_Roof_Window_InCorner_01_C-Class
ClassLib.Build_Roof_Window_InCorner_01_C = {}
---@type Build_Roof_Window_InCorner_02_C-Class
ClassLib.Build_Roof_Window_InCorner_02_C = {}
---@type Build_Roof_Window_InCorner_03_C-Class
ClassLib.Build_Roof_Window_InCorner_03_C = {}
---@type Build_Roof_Window_OutCorner_01_C-Class
ClassLib.Build_Roof_Window_OutCorner_01_C = {}
---@type Build_Roof_Window_OutCorner_02_C-Class
ClassLib.Build_Roof_Window_OutCorner_02_C = {}
---@type Build_Roof_Window_OutCorner_03_C-Class
ClassLib.Build_Roof_Window_OutCorner_03_C = {}
---@type Build_Wall_Concrete_8x8_Corner_2_C-Class
ClassLib.Build_Wall_Concrete_8x8_Corner_2_C = {}
---@type Build_Wall_Concrete_8x4_Corner_2_C-Class
ClassLib.Build_Wall_Concrete_8x4_Corner_2_C = {}
---@type Build_Wall_Orange_8x8_Corner_02_C-Class
ClassLib.Build_Wall_Orange_8x8_Corner_02_C = {}
---@type Build_Wall_Orange_8x4_Corner_02_C-Class
ClassLib.Build_Wall_Orange_8x4_Corner_02_C = {}
---@type Build_Wall_Steel_8x8_Corner_01_C-Class
ClassLib.Build_Wall_Steel_8x8_Corner_01_C = {}
---@type Build_Wall_Steel_8x4_Corner_01_C-Class
ClassLib.Build_Wall_Steel_8x4_Corner_01_C = {}
---@type Build_Wall_Steel_8x4_Corner_2_C-Class
ClassLib.Build_Wall_Steel_8x4_Corner_2_C = {}
---@type Build_Wall_Steel_8x8_Corner_2_C-Class
ClassLib.Build_Wall_Steel_8x8_Corner_2_C = {}
---@type Build_Wall_Concrete_8x4_Corner_01_C-Class
ClassLib.Build_Wall_Concrete_8x4_Corner_01_C = {}
---@type Build_Wall_Concrete_8x8_Corner_01_C-Class
ClassLib.Build_Wall_Concrete_8x8_Corner_01_C = {}
---@type Build_Wall_Orange_8x8_Corner_01_C-Class
ClassLib.Build_Wall_Orange_8x8_Corner_01_C = {}
---@type Build_Wall_Orange_8x4_Corner_01_C-Class
ClassLib.Build_Wall_Orange_8x4_Corner_01_C = {}
---@type Door-Class
ClassLib.Door = {}
---@type FGBuildableWall-Class
ClassLib.FGBuildableWall = {}
---@type Build_Wall_Door_8x4_01_C-Class
ClassLib.Build_Wall_Door_8x4_01_C = {}
---@type BUILD_SingleDoor_Base_01_C-Class
ClassLib.BUILD_SingleDoor_Base_01_C = {}
---@type Build_Wall_Concrete_SDoor_8x4_C-Class
ClassLib.Build_Wall_Concrete_SDoor_8x4_C = {}
---@type Build_SteelWall_8x4_DoorS_01_C-Class
ClassLib.Build_SteelWall_8x4_DoorS_01_C = {}
---@type Build_Wall_Door_8x4_03_Steel_C-Class
ClassLib.Build_Wall_Door_8x4_03_Steel_C = {}
---@type Build_Wall_Concrete_CDoor_8x4_C-Class
ClassLib.Build_Wall_Concrete_CDoor_8x4_C = {}
---@type Build_SteelWall_8x4_DoorC_01_C-Class
ClassLib.Build_SteelWall_8x4_DoorC_01_C = {}
---@type Build_Wall_Door_8x4_01_Steel_C-Class
ClassLib.Build_Wall_Door_8x4_01_Steel_C = {}
---@type Build_Wall_Door_8x4_03_C-Class
ClassLib.Build_Wall_Door_8x4_03_C = {}
---@type Build_Gate_Automated_8x4_C-Class
ClassLib.Build_Gate_Automated_8x4_C = {}
---@type Build_SteelWall_8x4_Window_01_C-Class
ClassLib.Build_SteelWall_8x4_Window_01_C = {}
---@type FGBuildableWallLightweight-Class
ClassLib.FGBuildableWallLightweight = {}
---@type Build_Wall_Concrete_8x4_Window_01_C-Class
ClassLib.Build_Wall_Concrete_8x4_Window_01_C = {}
---@type Build_Wall_Concrete_8x1_C-Class
ClassLib.Build_Wall_Concrete_8x1_C = {}
---@type Build_Wall_Concrete_Angular_8x4_C-Class
ClassLib.Build_Wall_Concrete_Angular_8x4_C = {}
---@type Build_Wall_Concrete_Tris_8x2_C-Class
ClassLib.Build_Wall_Concrete_Tris_8x2_C = {}
---@type Build_Wall_Concrete_FlipTris_8x1_C-Class
ClassLib.Build_Wall_Concrete_FlipTris_8x1_C = {}
---@type Build_Wall_Orange_Tris_8x8_C-Class
ClassLib.Build_Wall_Orange_Tris_8x8_C = {}
---@type Build_Wall_Concrete_8x4_C-Class
ClassLib.Build_Wall_Concrete_8x4_C = {}
---@type Build_Wall_Concrete_FlipTris_8x2_C-Class
ClassLib.Build_Wall_Concrete_FlipTris_8x2_C = {}
---@type Build_Wall_Concrete_FlipTris_8x4_C-Class
ClassLib.Build_Wall_Concrete_FlipTris_8x4_C = {}
---@type Build_Wall_Concrete_FlipTris_8x8_C-Class
ClassLib.Build_Wall_Concrete_FlipTris_8x8_C = {}
---@type Build_Wall_Concrete_Tris_8x1_C-Class
ClassLib.Build_Wall_Concrete_Tris_8x1_C = {}
---@type Build_Wall_Concrete_Tris_8x4_C-Class
ClassLib.Build_Wall_Concrete_Tris_8x4_C = {}
---@type Build_Wall_Orange_FlipTris_8x8_C-Class
ClassLib.Build_Wall_Orange_FlipTris_8x8_C = {}
---@type Build_Wall_Concrete_Angular_8x8_C-Class
ClassLib.Build_Wall_Concrete_Angular_8x8_C = {}
---@type Build_Wall_Orange_Tris_8x1_C-Class
ClassLib.Build_Wall_Orange_Tris_8x1_C = {}
---@type Build_Wall_Orange_Angular_8x4_C-Class
ClassLib.Build_Wall_Orange_Angular_8x4_C = {}
---@type Build_Wall_Orange_FlipTris_8x1_C-Class
ClassLib.Build_Wall_Orange_FlipTris_8x1_C = {}
---@type Build_Wall_Orange_Angular_8x8_C-Class
ClassLib.Build_Wall_Orange_Angular_8x8_C = {}
---@type Build_Wall_Orange_Tris_8x2_C-Class
ClassLib.Build_Wall_Orange_Tris_8x2_C = {}
---@type Build_Wall_Orange_FlipTris_8x2_C-Class
ClassLib.Build_Wall_Orange_FlipTris_8x2_C = {}
---@type Build_Wall_Orange_FlipTris_8x4_C-Class
ClassLib.Build_Wall_Orange_FlipTris_8x4_C = {}
---@type Build_Wall_Orange_Tris_8x4_C-Class
ClassLib.Build_Wall_Orange_Tris_8x4_C = {}
---@type Build_Wall_Concrete_8x4_ConveyorHole_01_C-Class
ClassLib.Build_Wall_Concrete_8x4_ConveyorHole_01_C = {}
---@type Build_Wall_Concrete_8x4_ConveyorHole_02_C-Class
ClassLib.Build_Wall_Concrete_8x4_ConveyorHole_02_C = {}
---@type Build_SteelWall_8x4_C-Class
ClassLib.Build_SteelWall_8x4_C = {}
---@type Build_SteelWall_FlipTris_8x4_C-Class
ClassLib.Build_SteelWall_FlipTris_8x4_C = {}
---@type Build_SteelWall_FlipTris_8x1_C-Class
ClassLib.Build_SteelWall_FlipTris_8x1_C = {}
---@type Build_SteelWall_Tris_8x8_C-Class
ClassLib.Build_SteelWall_Tris_8x8_C = {}
---@type Build_WallSet_Steel_Angular_8x4_C-Class
ClassLib.Build_WallSet_Steel_Angular_8x4_C = {}
---@type Build_Wall_8x4_02_C-Class
ClassLib.Build_Wall_8x4_02_C = {}
---@type Build_SteelWall_8x1_C-Class
ClassLib.Build_SteelWall_8x1_C = {}
---@type Build_SteelWall_Tris_8x4_C-Class
ClassLib.Build_SteelWall_Tris_8x4_C = {}
---@type Build_WallSet_Steel_Angular_8x8_C-Class
ClassLib.Build_WallSet_Steel_Angular_8x8_C = {}
---@type Build_SteelWall_Tris_8x2_C-Class
ClassLib.Build_SteelWall_Tris_8x2_C = {}
---@type Build_SteelWall_Tris_8x1_C-Class
ClassLib.Build_SteelWall_Tris_8x1_C = {}
---@type Build_SteelWall_FlipTris_8x2_C-Class
ClassLib.Build_SteelWall_FlipTris_8x2_C = {}
---@type Build_Wall_8x4_01_C-Class
ClassLib.Build_Wall_8x4_01_C = {}
---@type Build_SteelWall_8x4_Window_04_C-Class
ClassLib.Build_SteelWall_8x4_Window_04_C = {}
---@type Build_Wall_Concrete_8x4_Window_02_C-Class
ClassLib.Build_Wall_Concrete_8x4_Window_02_C = {}
---@type Build_Wall_Orange_8x1_C-Class
ClassLib.Build_Wall_Orange_8x1_C = {}
---@type Build_Wall_Concrete_8x4_Window_03_C-Class
ClassLib.Build_Wall_Concrete_8x4_Window_03_C = {}
---@type Build_SteelWall_8x4_Window_03_C-Class
ClassLib.Build_SteelWall_8x4_Window_03_C = {}
---@type Build_SteelWall_8x4_Window_02_C-Class
ClassLib.Build_SteelWall_8x4_Window_02_C = {}
---@type Build_Wall_Concrete_8x4_Window_04_C-Class
ClassLib.Build_Wall_Concrete_8x4_Window_04_C = {}
---@type Build_Wall_Concrete_Tris_8x8_C-Class
ClassLib.Build_Wall_Concrete_Tris_8x8_C = {}
---@type Build_Wall_Conveyor_8x4_01_Steel_C-Class
ClassLib.Build_Wall_Conveyor_8x4_01_Steel_C = {}
---@type Build_SteelWall_8x4_Gate_01_C-Class
ClassLib.Build_SteelWall_8x4_Gate_01_C = {}
---@type Build_Wall_Concrete_Gate_8x4_C-Class
ClassLib.Build_Wall_Concrete_Gate_8x4_C = {}
---@type Build_Wall_Gate_8x4_01_C-Class
ClassLib.Build_Wall_Gate_8x4_01_C = {}
---@type Build_Wall_Window_8x4_01_C-Class
ClassLib.Build_Wall_Window_8x4_01_C = {}
---@type Build_Wall_Window_8x4_04_C-Class
ClassLib.Build_Wall_Window_8x4_04_C = {}
---@type Build_Wall_Window_8x4_03_C-Class
ClassLib.Build_Wall_Window_8x4_03_C = {}
---@type Build_Wall_Window_8x4_02_C-Class
ClassLib.Build_Wall_Window_8x4_02_C = {}
---@type Build_Wall_Window_Thin_8x4_01_C-Class
ClassLib.Build_Wall_Window_Thin_8x4_01_C = {}
---@type Build_Wall_Window_Thin_8x4_02_C-Class
ClassLib.Build_Wall_Window_Thin_8x4_02_C = {}
---@type Build_Barrier_Low_01_C-Class
ClassLib.Build_Barrier_Low_01_C = {}
---@type Build_Barrier_Tall_01_C-Class
ClassLib.Build_Barrier_Tall_01_C = {}
---@type Build_Concrete_Barrier_01_C-Class
ClassLib.Build_Concrete_Barrier_01_C = {}
---@type Build_Fence_01_C-Class
ClassLib.Build_Fence_01_C = {}
---@type Build_FenceRamp_8x1_L_C-Class
ClassLib.Build_FenceRamp_8x1_L_C = {}
---@type Build_FenceRamp_8x1_R_C-Class
ClassLib.Build_FenceRamp_8x1_R_C = {}
---@type Build_FenceRamp_8x2_L_C-Class
ClassLib.Build_FenceRamp_8x2_L_C = {}
---@type Build_FenceRamp_8x2_R_C-Class
ClassLib.Build_FenceRamp_8x2_R_C = {}
---@type Build_FenceRamp_8x4_L_C-Class
ClassLib.Build_FenceRamp_8x4_L_C = {}
---@type Build_FenceRamp_8x4_R_C-Class
ClassLib.Build_FenceRamp_8x4_R_C = {}
---@type Build_Railing_01_C-Class
ClassLib.Build_Railing_01_C = {}
---@type Build_SM_RailingRamp_8x1_01_C-Class
ClassLib.Build_SM_RailingRamp_8x1_01_C = {}
---@type Build_SM_RailingRamp_8x2_01_C-Class
ClassLib.Build_SM_RailingRamp_8x2_01_C = {}
---@type Build_SM_RailingRamp_8x4_01_C-Class
ClassLib.Build_SM_RailingRamp_8x4_01_C = {}
---@type Build_ChainLinkFence_C-Class
ClassLib.Build_ChainLinkFence_C = {}
---@type Build_TarpFence_C-Class
ClassLib.Build_TarpFence_C = {}
---@type Build_Wall_Frame_01_C-Class
ClassLib.Build_Wall_Frame_01_C = {}
---@type Build_Wall_Window_8x4_05_C-Class
ClassLib.Build_Wall_Window_8x4_05_C = {}
---@type Build_Wall_Window_8x4_06_C-Class
ClassLib.Build_Wall_Window_8x4_06_C = {}
---@type Build_Wall_Window_8x4_07_C-Class
ClassLib.Build_Wall_Window_8x4_07_C = {}
---@type Build_Wall_Conveyor_8x4_02_C-Class
ClassLib.Build_Wall_Conveyor_8x4_02_C = {}
---@type Build_Wall_Conveyor_8x4_03_C-Class
ClassLib.Build_Wall_Conveyor_8x4_03_C = {}
---@type Build_Wall_Conveyor_8x4_01_C-Class
ClassLib.Build_Wall_Conveyor_8x4_01_C = {}
---@type Build_Wall_Concrete_8x4_ConveyorHole_03_C-Class
ClassLib.Build_Wall_Concrete_8x4_ConveyorHole_03_C = {}
---@type Build_Wall_Conveyor_8x4_03_Steel_C-Class
ClassLib.Build_Wall_Conveyor_8x4_03_Steel_C = {}
---@type Build_SteelWall_FlipTris_8x8_C-Class
ClassLib.Build_SteelWall_FlipTris_8x8_C = {}
---@type Build_Wall_Conveyor_8x4_02_Steel_C-Class
ClassLib.Build_Wall_Conveyor_8x4_02_Steel_C = {}
---@type Build_DoorMiddle_C-Class
ClassLib.Build_DoorMiddle_C = {}
---@type Build_Construction_Beam_04_C-Class
ClassLib.Build_Construction_Beam_04_C = {}
---@type Build_Wall_Conveyor_8x4_04_C-Class
ClassLib.Build_Wall_Conveyor_8x4_04_C = {}
---@type Build_Wall_Conveyor_8x4_04_Steel_C-Class
ClassLib.Build_Wall_Conveyor_8x4_04_Steel_C = {}
---@type FGBuildableFactoryBuildingLightweight-Class
ClassLib.FGBuildableFactoryBuildingLightweight = {}
---@type Build_DownQuarterPipe_Asphalt_8x4_C-Class
ClassLib.Build_DownQuarterPipe_Asphalt_8x4_C = {}
---@type FGBuildableFoundationLightweight-Class
ClassLib.FGBuildableFoundationLightweight = {}
---@type FGBuildableFoundation-Class
ClassLib.FGBuildableFoundation = {}
---@type Build_DownQuarterPipeInCorner_Asphalt_8x4_C-Class
ClassLib.Build_DownQuarterPipeInCorner_Asphalt_8x4_C = {}
---@type Build_DownQuarterPipeOutCorner_Asphalt_8x4_C-Class
ClassLib.Build_DownQuarterPipeOutCorner_Asphalt_8x4_C = {}
---@type Build_Foundation_Asphalt_8x1_C-Class
ClassLib.Build_Foundation_Asphalt_8x1_C = {}
---@type Build_Foundation_Asphalt_8x2_C-Class
ClassLib.Build_Foundation_Asphalt_8x2_C = {}
---@type Build_Foundation_Asphalt_8x4_C-Class
ClassLib.Build_Foundation_Asphalt_8x4_C = {}
---@type Build_InvertedRamp_DCorner_Asphalt_8x1_C-Class
ClassLib.Build_InvertedRamp_DCorner_Asphalt_8x1_C = {}
---@type Build_InvertedRamp_DCorner_Asphalt_8x2_C-Class
ClassLib.Build_InvertedRamp_DCorner_Asphalt_8x2_C = {}
---@type Build_InvertedRamp_DCorner_Asphalt_8x4_C-Class
ClassLib.Build_InvertedRamp_DCorner_Asphalt_8x4_C = {}
---@type Build_InvertedRamp_UCorner_Asphalt_8x1_C-Class
ClassLib.Build_InvertedRamp_UCorner_Asphalt_8x1_C = {}
---@type Build_InvertedRamp_UCorner_Asphalt_8x2_C-Class
ClassLib.Build_InvertedRamp_UCorner_Asphalt_8x2_C = {}
---@type Build_InvertedRamp_UCorner_Asphalt_8x4_C-Class
ClassLib.Build_InvertedRamp_UCorner_Asphalt_8x4_C = {}
---@type Build_QuarterPipe_Asphalt_8x4_C-Class
ClassLib.Build_QuarterPipe_Asphalt_8x4_C = {}
---@type Build_QuarterPipeInCorner_Asphalt_8x4_C-Class
ClassLib.Build_QuarterPipeInCorner_Asphalt_8x4_C = {}
---@type Build_QuarterPipeMiddle_Asphalt_8x1_C-Class
ClassLib.Build_QuarterPipeMiddle_Asphalt_8x1_C = {}
---@type Build_QuarterPipeMiddle_Asphalt_8x2_C-Class
ClassLib.Build_QuarterPipeMiddle_Asphalt_8x2_C = {}
---@type Build_QuarterPipeMiddle_Asphalt_8x4_C-Class
ClassLib.Build_QuarterPipeMiddle_Asphalt_8x4_C = {}
---@type Build_QuarterPipeMiddleInCorner_Asphalt_8x1_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Asphalt_8x1_C = {}
---@type Build_QuarterPipeMiddleInCorner_Asphalt_8x2_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Asphalt_8x2_C = {}
---@type Build_QuarterPipeMiddleInCorner_Asphalt_8x4_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Asphalt_8x4_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Asphalt_4x1_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Asphalt_4x1_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Asphalt_4x2_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Asphalt_4x2_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Asphalt_4x4_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Asphalt_4x4_C = {}
---@type Build_QuarterPipeOutCorner_Asphalt_8x4_C-Class
ClassLib.Build_QuarterPipeOutCorner_Asphalt_8x4_C = {}
---@type Build_Ramp_DownCorner_Asphalt_8x1_C-Class
ClassLib.Build_Ramp_DownCorner_Asphalt_8x1_C = {}
---@type Build_Ramp_DownCorner_Asphalt_8x2_C-Class
ClassLib.Build_Ramp_DownCorner_Asphalt_8x2_C = {}
---@type Build_Ramp_DownCorner_Asphalt_8x4_C-Class
ClassLib.Build_Ramp_DownCorner_Asphalt_8x4_C = {}
---@type Build_Ramp_UpCorner_Asphalt_8x1_C-Class
ClassLib.Build_Ramp_UpCorner_Asphalt_8x1_C = {}
---@type Build_Ramp_UpCorner_Asphalt_8x2_C-Class
ClassLib.Build_Ramp_UpCorner_Asphalt_8x2_C = {}
---@type Build_Ramp_UpCorner_Asphalt_8x4_C-Class
ClassLib.Build_Ramp_UpCorner_Asphalt_8x4_C = {}
---@type Build_Flat_Frame_01_C-Class
ClassLib.Build_Flat_Frame_01_C = {}
---@type Build_Foundation_8x1_01_C-Class
ClassLib.Build_Foundation_8x1_01_C = {}
---@type Build_Foundation_8x2_01_C-Class
ClassLib.Build_Foundation_8x2_01_C = {}
---@type Build_Foundation_8x4_01_C-Class
ClassLib.Build_Foundation_8x4_01_C = {}
---@type Build_Foundation_Frame_01_C-Class
ClassLib.Build_Foundation_Frame_01_C = {}
---@type Build_FoundationGlass_01_C-Class
ClassLib.Build_FoundationGlass_01_C = {}
---@type Build_QuarterPipe_C-Class
ClassLib.Build_QuarterPipe_C = {}
---@type Build_QuarterPipe_02_C-Class
ClassLib.Build_QuarterPipe_02_C = {}
---@type Build_QuarterPipeCorner_01_C-Class
ClassLib.Build_QuarterPipeCorner_01_C = {}
---@type Build_QuarterPipeCorner_02_C-Class
ClassLib.Build_QuarterPipeCorner_02_C = {}
---@type Build_QuarterPipeCorner_03_C-Class
ClassLib.Build_QuarterPipeCorner_03_C = {}
---@type Build_QuarterPipeCorner_04_C-Class
ClassLib.Build_QuarterPipeCorner_04_C = {}
---@type Build_DownQuarterPipe_Concrete_8x4_C-Class
ClassLib.Build_DownQuarterPipe_Concrete_8x4_C = {}
---@type Build_DownQuarterPipeInCorner_Concrete_8x4_C-Class
ClassLib.Build_DownQuarterPipeInCorner_Concrete_8x4_C = {}
---@type Build_DownQuarterPipeOutCorner_Concrete_8x4_C-Class
ClassLib.Build_DownQuarterPipeOutCorner_Concrete_8x4_C = {}
---@type Build_Foundation_Concrete_8x1_C-Class
ClassLib.Build_Foundation_Concrete_8x1_C = {}
---@type Build_Foundation_Concrete_8x2_C-Class
ClassLib.Build_Foundation_Concrete_8x2_C = {}
---@type Build_Foundation_Concrete_8x4_C-Class
ClassLib.Build_Foundation_Concrete_8x4_C = {}
---@type Build_InvertedRamp_DCorner_Concrete_8x1_C-Class
ClassLib.Build_InvertedRamp_DCorner_Concrete_8x1_C = {}
---@type Build_InvertedRamp_DCorner_Concrete_8x2_C-Class
ClassLib.Build_InvertedRamp_DCorner_Concrete_8x2_C = {}
---@type Build_InvertedRamp_DCorner_Concrete_8x4_C-Class
ClassLib.Build_InvertedRamp_DCorner_Concrete_8x4_C = {}
---@type Build_InvertedRamp_UCorner_Concrete_8x1_C-Class
ClassLib.Build_InvertedRamp_UCorner_Concrete_8x1_C = {}
---@type Build_InvertedRamp_UCorner_Concrete_8x2_C-Class
ClassLib.Build_InvertedRamp_UCorner_Concrete_8x2_C = {}
---@type Build_InvertedRamp_UCorner_Concrete_8x4_C-Class
ClassLib.Build_InvertedRamp_UCorner_Concrete_8x4_C = {}
---@type Build_QuarterPipe_Concrete_8x4_C-Class
ClassLib.Build_QuarterPipe_Concrete_8x4_C = {}
---@type Build_QuarterPipeInCorner_Concrete_8x4_C-Class
ClassLib.Build_QuarterPipeInCorner_Concrete_8x4_C = {}
---@type Build_QuarterPipeMiddle_Concrete_8x1_C-Class
ClassLib.Build_QuarterPipeMiddle_Concrete_8x1_C = {}
---@type Build_QuarterPipeMiddle_Concrete_8x2_C-Class
ClassLib.Build_QuarterPipeMiddle_Concrete_8x2_C = {}
---@type Build_QuarterPipeMiddle_Concrete_8x4_C-Class
ClassLib.Build_QuarterPipeMiddle_Concrete_8x4_C = {}
---@type Build_QuarterPipeMiddleInCorner_Concrete_8x1_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Concrete_8x1_C = {}
---@type Build_QuarterPipeMiddleInCorner_Concrete_8x2_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Concrete_8x2_C = {}
---@type Build_QuarterPipeMiddleInCorner_Concrete_8x4_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Concrete_8x4_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Concrete_4x1_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Concrete_4x1_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Concrete_4x2_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Concrete_4x2_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Concrete_4x4_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Concrete_4x4_C = {}
---@type Build_QuarterPipeOutCorner_Concrete_8x4_C-Class
ClassLib.Build_QuarterPipeOutCorner_Concrete_8x4_C = {}
---@type Build_Ramp_DownCorner_Concrete_8x1_C-Class
ClassLib.Build_Ramp_DownCorner_Concrete_8x1_C = {}
---@type Build_Ramp_DownCorner_Concrete_8x2_C-Class
ClassLib.Build_Ramp_DownCorner_Concrete_8x2_C = {}
---@type Build_Ramp_DownCorner_Concrete_8x4_C-Class
ClassLib.Build_Ramp_DownCorner_Concrete_8x4_C = {}
---@type Build_Ramp_UpCorner_Concrete_8x1_C-Class
ClassLib.Build_Ramp_UpCorner_Concrete_8x1_C = {}
---@type Build_Ramp_UpCorner_Concrete_8x2_C-Class
ClassLib.Build_Ramp_UpCorner_Concrete_8x2_C = {}
---@type Build_Ramp_UpCorner_Concrete_8x4_C-Class
ClassLib.Build_Ramp_UpCorner_Concrete_8x4_C = {}
---@type Build_QuarterPipeMiddle_Ficsit_8x1_C-Class
ClassLib.Build_QuarterPipeMiddle_Ficsit_8x1_C = {}
---@type Build_QuarterPipeMiddle_Ficsit_8x2_C-Class
ClassLib.Build_QuarterPipeMiddle_Ficsit_8x2_C = {}
---@type Build_QuarterPipeMiddle_Ficsit_8x4_C-Class
ClassLib.Build_QuarterPipeMiddle_Ficsit_8x4_C = {}
---@type Build_QuarterPipeMiddleInCorner_Ficsit_8x1_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Ficsit_8x1_C = {}
---@type Build_QuarterPipeMiddleInCorner_Ficsit_8x2_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Ficsit_8x2_C = {}
---@type Build_QuarterPipeMiddleInCorner_Ficsit_8x4_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Ficsit_8x4_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Ficsit_4x1_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Ficsit_4x1_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Ficsit_4x2_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Ficsit_4x2_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Ficsit_4x4_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Ficsit_4x4_C = {}
---@type Build_DownQuarterPipe_Grip_8x4_C-Class
ClassLib.Build_DownQuarterPipe_Grip_8x4_C = {}
---@type Build_DownQuarterPipeInCorner_Grip_8x4_C-Class
ClassLib.Build_DownQuarterPipeInCorner_Grip_8x4_C = {}
---@type Build_DownQuarterPipeOutCorner_Grip_8x4_C-Class
ClassLib.Build_DownQuarterPipeOutCorner_Grip_8x4_C = {}
---@type Build_Foundation_Metal_8x1_C-Class
ClassLib.Build_Foundation_Metal_8x1_C = {}
---@type Build_Foundation_Metal_8x2_C-Class
ClassLib.Build_Foundation_Metal_8x2_C = {}
---@type Build_Foundation_Metal_8x4_C-Class
ClassLib.Build_Foundation_Metal_8x4_C = {}
---@type Build_InvertedRamp_DCorner_Metal_8x1_C-Class
ClassLib.Build_InvertedRamp_DCorner_Metal_8x1_C = {}
---@type Build_InvertedRamp_DCorner_Metal_8x2_C-Class
ClassLib.Build_InvertedRamp_DCorner_Metal_8x2_C = {}
---@type Build_InvertedRamp_DCorner_Metal_8x4_C-Class
ClassLib.Build_InvertedRamp_DCorner_Metal_8x4_C = {}
---@type Build_InvertedRamp_UCorner_Metal_8x1_C-Class
ClassLib.Build_InvertedRamp_UCorner_Metal_8x1_C = {}
---@type Build_InvertedRamp_UCorner_Metal_8x2_C-Class
ClassLib.Build_InvertedRamp_UCorner_Metal_8x2_C = {}
---@type Build_InvertedRamp_UCorner_Metal_8x4_C-Class
ClassLib.Build_InvertedRamp_UCorner_Metal_8x4_C = {}
---@type Build_QuarterPipe_Grip_8x4_C-Class
ClassLib.Build_QuarterPipe_Grip_8x4_C = {}
---@type Build_QuarterPipeInCorner_Grip_8x4_C-Class
ClassLib.Build_QuarterPipeInCorner_Grip_8x4_C = {}
---@type Build_QuarterPipeMiddle_Grip_8x1_C-Class
ClassLib.Build_QuarterPipeMiddle_Grip_8x1_C = {}
---@type Build_QuarterPipeMiddle_Grip_8x2_C-Class
ClassLib.Build_QuarterPipeMiddle_Grip_8x2_C = {}
---@type Build_QuarterPipeMiddle_Grip_8x4_C-Class
ClassLib.Build_QuarterPipeMiddle_Grip_8x4_C = {}
---@type Build_QuarterPipeMiddleInCorner_Grip_8x1_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Grip_8x1_C = {}
---@type Build_QuarterPipeMiddleInCorner_Grip_8x2_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Grip_8x2_C = {}
---@type Build_QuarterPipeMiddleInCorner_Grip_8x4_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_Grip_8x4_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Grip_4x1_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Grip_4x1_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Grip_4x2_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Grip_4x2_C = {}
---@type Build_QuarterPipeMiddleOutCorner_Grip_4x4_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_Grip_4x4_C = {}
---@type Build_QuarterPipeOutCorner_Grip_8x4_C-Class
ClassLib.Build_QuarterPipeOutCorner_Grip_8x4_C = {}
---@type Build_Ramp_DownCorner_Metal_8x1_C-Class
ClassLib.Build_Ramp_DownCorner_Metal_8x1_C = {}
---@type Build_Ramp_DownCorner_Metal_8x2_C-Class
ClassLib.Build_Ramp_DownCorner_Metal_8x2_C = {}
---@type Build_Ramp_DownCorner_Metal_8x4_C-Class
ClassLib.Build_Ramp_DownCorner_Metal_8x4_C = {}
---@type Build_Ramp_UpCorner_Metal_8x1_C-Class
ClassLib.Build_Ramp_UpCorner_Metal_8x1_C = {}
---@type Build_Ramp_UpCorner_Metal_8x2_C-Class
ClassLib.Build_Ramp_UpCorner_Metal_8x2_C = {}
---@type Build_Ramp_UpCorner_Metal_8x4_C-Class
ClassLib.Build_Ramp_UpCorner_Metal_8x4_C = {}
---@type Build_DownQuarterPipe_ConcretePolished_8x4_C-Class
ClassLib.Build_DownQuarterPipe_ConcretePolished_8x4_C = {}
---@type Build_DownQuarterPipeInCorner_ConcretePolished_8x4_C-Class
ClassLib.Build_DownQuarterPipeInCorner_ConcretePolished_8x4_C = {}
---@type Build_DownQuarterPipeOutCorner_ConcretePolished_8x4_C-Class
ClassLib.Build_DownQuarterPipeOutCorner_ConcretePolished_8x4_C = {}
---@type Build_Foundation_ConcretePolished_8x1_C-Class
ClassLib.Build_Foundation_ConcretePolished_8x1_C = {}
---@type Build_Foundation_ConcretePolished_8x2_2_C-Class
ClassLib.Build_Foundation_ConcretePolished_8x2_2_C = {}
---@type Build_Foundation_ConcretePolished_8x4_C-Class
ClassLib.Build_Foundation_ConcretePolished_8x4_C = {}
---@type Build_InvertedRamp_DCorner_Polished_8x1_C-Class
ClassLib.Build_InvertedRamp_DCorner_Polished_8x1_C = {}
---@type Build_InvertedRamp_DCorner_Polished_8x2_C-Class
ClassLib.Build_InvertedRamp_DCorner_Polished_8x2_C = {}
---@type Build_InvertedRamp_DCorner_Polished_8x4_C-Class
ClassLib.Build_InvertedRamp_DCorner_Polished_8x4_C = {}
---@type Build_InvertedRamp_UCorner_Polished_8x1_C-Class
ClassLib.Build_InvertedRamp_UCorner_Polished_8x1_C = {}
---@type Build_InvertedRamp_UCorner_Polished_8x2_C-Class
ClassLib.Build_InvertedRamp_UCorner_Polished_8x2_C = {}
---@type Build_InvertedRamp_UCorner_Polished_8x4_C-Class
ClassLib.Build_InvertedRamp_UCorner_Polished_8x4_C = {}
---@type Build_QuarterPipe_ConcretePolished_8x4_C-Class
ClassLib.Build_QuarterPipe_ConcretePolished_8x4_C = {}
---@type Build_QuarterPipeInCorner_ConcretePolished_8x4_C-Class
ClassLib.Build_QuarterPipeInCorner_ConcretePolished_8x4_C = {}
---@type Build_QuarterPipeMiddle_PolishedConcrete_8x1_C-Class
ClassLib.Build_QuarterPipeMiddle_PolishedConcrete_8x1_C = {}
---@type Build_QuarterPipeMiddle_PolishedConcrete_8x2_C-Class
ClassLib.Build_QuarterPipeMiddle_PolishedConcrete_8x2_C = {}
---@type Build_QuarterPipeMiddle_PolishedConcrete_8x4_C-Class
ClassLib.Build_QuarterPipeMiddle_PolishedConcrete_8x4_C = {}
---@type Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x1_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x1_C = {}
---@type Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x2_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x2_C = {}
---@type Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x4_C-Class
ClassLib.Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x4_C = {}
---@type Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x1_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x1_C = {}
---@type Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x2_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x2_C = {}
---@type Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x4_C-Class
ClassLib.Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x4_C = {}
---@type Build_QuarterPipeOutCorner_ConcretePolished_8x4_C-Class
ClassLib.Build_QuarterPipeOutCorner_ConcretePolished_8x4_C = {}
---@type Build_Ramp_DownCorner_Polished_8x1_C-Class
ClassLib.Build_Ramp_DownCorner_Polished_8x1_C = {}
---@type Build_Ramp_DownCorner_Polished_8x2_C-Class
ClassLib.Build_Ramp_DownCorner_Polished_8x2_C = {}
---@type Build_Ramp_DownCorner_Polished_8x4_C-Class
ClassLib.Build_Ramp_DownCorner_Polished_8x4_C = {}
---@type Build_Ramp_UpCorner_Polished_8x1_C-Class
ClassLib.Build_Ramp_UpCorner_Polished_8x1_C = {}
---@type Build_Ramp_UpCorner_Polished_8x2_C-Class
ClassLib.Build_Ramp_UpCorner_Polished_8x2_C = {}
---@type Build_Ramp_UpCorner_Polished_8x4_C-Class
ClassLib.Build_Ramp_UpCorner_Polished_8x4_C = {}
---@type Build_Ramp_Diagonal_8x1_01_C-Class
ClassLib.Build_Ramp_Diagonal_8x1_01_C = {}
---@type Build_Ramp_Diagonal_8x1_02_C-Class
ClassLib.Build_Ramp_Diagonal_8x1_02_C = {}
---@type Build_Ramp_Diagonal_8x2_01_C-Class
ClassLib.Build_Ramp_Diagonal_8x2_01_C = {}
---@type Build_Ramp_Diagonal_8x2_02_C-Class
ClassLib.Build_Ramp_Diagonal_8x2_02_C = {}
---@type Build_Ramp_Diagonal_8x4_01_C-Class
ClassLib.Build_Ramp_Diagonal_8x4_01_C = {}
---@type Build_Ramp_Diagonal_8x4_02_C-Class
ClassLib.Build_Ramp_Diagonal_8x4_02_C = {}
---@type Build_RampInverted_8x1_Corner_01_C-Class
ClassLib.Build_RampInverted_8x1_Corner_01_C = {}
---@type Build_RampInverted_8x1_Corner_02_C-Class
ClassLib.Build_RampInverted_8x1_Corner_02_C = {}
---@type Build_RampInverted_8x2_Corner_01_C-Class
ClassLib.Build_RampInverted_8x2_Corner_01_C = {}
---@type Build_RampInverted_8x2_Corner_02_C-Class
ClassLib.Build_RampInverted_8x2_Corner_02_C = {}
---@type Build_RampInverted_8x4_Corner_01_C-Class
ClassLib.Build_RampInverted_8x4_Corner_01_C = {}
---@type Build_RampInverted_8x4_Corner_02_C-Class
ClassLib.Build_RampInverted_8x4_Corner_02_C = {}
---@type FGBuildableRamp-Class
ClassLib.FGBuildableRamp = {}
---@type Build_InvertedRamp_Asphalt_8x1_C-Class
ClassLib.Build_InvertedRamp_Asphalt_8x1_C = {}
---@type FGBuildableRampLightweight-Class
ClassLib.FGBuildableRampLightweight = {}
---@type Build_InvertedRamp_Asphalt_8x2_C-Class
ClassLib.Build_InvertedRamp_Asphalt_8x2_C = {}
---@type Build_InvertedRamp_Asphalt_8x4_C-Class
ClassLib.Build_InvertedRamp_Asphalt_8x4_C = {}
---@type Build_Ramp_Asphalt_8x1_C-Class
ClassLib.Build_Ramp_Asphalt_8x1_C = {}
---@type Build_Ramp_Asphalt_8x2_C-Class
ClassLib.Build_Ramp_Asphalt_8x2_C = {}
---@type Build_Ramp_Asphalt_8x4_C-Class
ClassLib.Build_Ramp_Asphalt_8x4_C = {}
---@type Build_RampDouble_Asphalt_8x1_C-Class
ClassLib.Build_RampDouble_Asphalt_8x1_C = {}
---@type Build_RampDouble_Asphalt_8x2_C-Class
ClassLib.Build_RampDouble_Asphalt_8x2_C = {}
---@type Build_RampDouble_Asphalt_8x4_C-Class
ClassLib.Build_RampDouble_Asphalt_8x4_C = {}
---@type Build_Stair_Asphalt_8x1_C-Class
ClassLib.Build_Stair_Asphalt_8x1_C = {}
---@type Build_Stair_Asphalt_8x2_C-Class
ClassLib.Build_Stair_Asphalt_8x2_C = {}
---@type Build_Stair_Asphalt_8x4_C-Class
ClassLib.Build_Stair_Asphalt_8x4_C = {}
---@type Build_InvertedRamp_Concrete_8x1_C-Class
ClassLib.Build_InvertedRamp_Concrete_8x1_C = {}
---@type Build_InvertedRamp_Concrete_8x2_C-Class
ClassLib.Build_InvertedRamp_Concrete_8x2_C = {}
---@type Build_InvertedRamp_Concrete_8x4_C-Class
ClassLib.Build_InvertedRamp_Concrete_8x4_C = {}
---@type Build_Ramp_Concrete_8x1_C-Class
ClassLib.Build_Ramp_Concrete_8x1_C = {}
---@type Build_Ramp_Concrete_8x2_C-Class
ClassLib.Build_Ramp_Concrete_8x2_C = {}
---@type Build_Ramp_Concrete_8x4_C-Class
ClassLib.Build_Ramp_Concrete_8x4_C = {}
---@type Build_RampDouble_Concrete_8x1_C-Class
ClassLib.Build_RampDouble_Concrete_8x1_C = {}
---@type Build_RampDouble_Concrete_8x2_C-Class
ClassLib.Build_RampDouble_Concrete_8x2_C = {}
---@type Build_RampDouble_Concrete_8x4_C-Class
ClassLib.Build_RampDouble_Concrete_8x4_C = {}
---@type Build_Stair_Concrete_8x1_C-Class
ClassLib.Build_Stair_Concrete_8x1_C = {}
---@type Build_Stair_Concrete_8x2_C-Class
ClassLib.Build_Stair_Concrete_8x2_C = {}
---@type Build_Stair_Concrete_8x4_C-Class
ClassLib.Build_Stair_Concrete_8x4_C = {}
---@type Build_Stair_FicsitSet_8x1_01_C-Class
ClassLib.Build_Stair_FicsitSet_8x1_01_C = {}
---@type Build_Stair_FicsitSet_8x2_01_C-Class
ClassLib.Build_Stair_FicsitSet_8x2_01_C = {}
---@type Build_Stair_FicsitSet_8x4_01_C-Class
ClassLib.Build_Stair_FicsitSet_8x4_01_C = {}
---@type Build_InvertedRamp_Metal_8x1_C-Class
ClassLib.Build_InvertedRamp_Metal_8x1_C = {}
---@type Build_InvertedRamp_Metal_8x2_C-Class
ClassLib.Build_InvertedRamp_Metal_8x2_C = {}
---@type Build_InvertedRamp_Metal_8x4_C-Class
ClassLib.Build_InvertedRamp_Metal_8x4_C = {}
---@type Build_Ramp_Metal_8x1_C-Class
ClassLib.Build_Ramp_Metal_8x1_C = {}
---@type Build_Ramp_Metal_8x2_C-Class
ClassLib.Build_Ramp_Metal_8x2_C = {}
---@type Build_Ramp_Metal_8x4_C-Class
ClassLib.Build_Ramp_Metal_8x4_C = {}
---@type Build_RampDouble_Metal_8x1_C-Class
ClassLib.Build_RampDouble_Metal_8x1_C = {}
---@type Build_RampDouble_Metal_8x2_C-Class
ClassLib.Build_RampDouble_Metal_8x2_C = {}
---@type Build_RampDouble_Metal_8x4_C-Class
ClassLib.Build_RampDouble_Metal_8x4_C = {}
---@type Build_Stair_GripMetal_8x1_C-Class
ClassLib.Build_Stair_GripMetal_8x1_C = {}
---@type Build_Stair_GripMetal_8x2_C-Class
ClassLib.Build_Stair_GripMetal_8x2_C = {}
---@type Build_Stair_GripMetal_8x4_C-Class
ClassLib.Build_Stair_GripMetal_8x4_C = {}
---@type Build_InvertedRamp_Polished_8x1_C-Class
ClassLib.Build_InvertedRamp_Polished_8x1_C = {}
---@type Build_InvertedRamp_Polished_8x2_C-Class
ClassLib.Build_InvertedRamp_Polished_8x2_C = {}
---@type Build_InvertedRamp_Polished_8x4_C-Class
ClassLib.Build_InvertedRamp_Polished_8x4_C = {}
---@type Build_Ramp_Polished_8x1_C-Class
ClassLib.Build_Ramp_Polished_8x1_C = {}
---@type Build_Ramp_Polished_8x2_C-Class
ClassLib.Build_Ramp_Polished_8x2_C = {}
---@type Build_Ramp_Polished_8x4_C-Class
ClassLib.Build_Ramp_Polished_8x4_C = {}
---@type Build_RampDouble_Polished_8x1_C-Class
ClassLib.Build_RampDouble_Polished_8x1_C = {}
---@type Build_RampDouble_Polished_8x2_C-Class
ClassLib.Build_RampDouble_Polished_8x2_C = {}
---@type Build_RampDouble_Polished_8x4_C-Class
ClassLib.Build_RampDouble_Polished_8x4_C = {}
---@type Build_Stair_PolishedConcrete_8x1_C-Class
ClassLib.Build_Stair_PolishedConcrete_8x1_C = {}
---@type Build_Stair_PolishedConcrete_8x2_C-Class
ClassLib.Build_Stair_PolishedConcrete_8x2_C = {}
---@type Build_Stair_PolishedConcrete_8x4_C-Class
ClassLib.Build_Stair_PolishedConcrete_8x4_C = {}
---@type Build_Ramp_8x1_01_C-Class
ClassLib.Build_Ramp_8x1_01_C = {}
---@type Build_Ramp_8x2_01_C-Class
ClassLib.Build_Ramp_8x2_01_C = {}
---@type Build_Ramp_8x4_01_C-Class
ClassLib.Build_Ramp_8x4_01_C = {}
---@type Build_Ramp_8x4_Inverted_01_C-Class
ClassLib.Build_Ramp_8x4_Inverted_01_C = {}
---@type Build_Ramp_8x8x8_C-Class
ClassLib.Build_Ramp_8x8x8_C = {}
---@type Build_Ramp_Frame_01_C-Class
ClassLib.Build_Ramp_Frame_01_C = {}
---@type Build_Ramp_Frame_Inverted_01_C-Class
ClassLib.Build_Ramp_Frame_Inverted_01_C = {}
---@type Build_RampDouble_C-Class
ClassLib.Build_RampDouble_C = {}
---@type Build_RampDouble_8x1_C-Class
ClassLib.Build_RampDouble_8x1_C = {}
---@type Build_RampInverted_8x1_C-Class
ClassLib.Build_RampInverted_8x1_C = {}
---@type Build_RampInverted_8x2_01_C-Class
ClassLib.Build_RampInverted_8x2_01_C = {}
---@type Build_Roof_A_01_C-Class
ClassLib.Build_Roof_A_01_C = {}
---@type Build_Roof_A_02_C-Class
ClassLib.Build_Roof_A_02_C = {}
---@type Build_Roof_A_03_C-Class
ClassLib.Build_Roof_A_03_C = {}
---@type Build_Roof_A_04_C-Class
ClassLib.Build_Roof_A_04_C = {}
---@type Build_Roof_Orange_01_C-Class
ClassLib.Build_Roof_Orange_01_C = {}
---@type Build_Roof_Orange_02_C-Class
ClassLib.Build_Roof_Orange_02_C = {}
---@type Build_Roof_Orange_03_C-Class
ClassLib.Build_Roof_Orange_03_C = {}
---@type Build_Roof_Orange_04_C-Class
ClassLib.Build_Roof_Orange_04_C = {}
---@type Build_Roof_Tar_01_C-Class
ClassLib.Build_Roof_Tar_01_C = {}
---@type Build_Roof_Tar_02_C-Class
ClassLib.Build_Roof_Tar_02_C = {}
---@type Build_Roof_Tar_03_C-Class
ClassLib.Build_Roof_Tar_03_C = {}
---@type Build_Roof_Tar_04_C-Class
ClassLib.Build_Roof_Tar_04_C = {}
---@type Build_Roof_Window_01_C-Class
ClassLib.Build_Roof_Window_01_C = {}
---@type Build_Roof_Window_02_C-Class
ClassLib.Build_Roof_Window_02_C = {}
---@type Build_Roof_Window_03_C-Class
ClassLib.Build_Roof_Window_03_C = {}
---@type Build_Roof_Window_04_C-Class
ClassLib.Build_Roof_Window_04_C = {}
---@type Build_Foundation_Curved_Right_C-Class
ClassLib.Build_Foundation_Curved_Right_C = {}
---@type FGBuildablePillar-Class
ClassLib.FGBuildablePillar = {}
---@type FGBuildablePillarLightweight-Class
ClassLib.FGBuildablePillarLightweight = {}
---@type Build_PillarBase_C-Class
ClassLib.Build_PillarBase_C = {}
---@type Build_PillarMiddle_C-Class
ClassLib.Build_PillarMiddle_C = {}
---@type Build_PillarMiddle_Concrete_C-Class
ClassLib.Build_PillarMiddle_Concrete_C = {}
---@type Build_PillarMiddle_Frame_C-Class
ClassLib.Build_PillarMiddle_Frame_C = {}
---@type Build_PillarTop_C-Class
ClassLib.Build_PillarTop_C = {}
---@type Build_Pillar_Small_Concrete_C-Class
ClassLib.Build_Pillar_Small_Concrete_C = {}
---@type Build_Pillar_Small_Frame_C-Class
ClassLib.Build_Pillar_Small_Frame_C = {}
---@type Build_Pillar_Small_Metal_C-Class
ClassLib.Build_Pillar_Small_Metal_C = {}
---@type Build_PillarBase_Small_C-Class
ClassLib.Build_PillarBase_Small_C = {}
---@type FGBuildableStair-Class
ClassLib.FGBuildableStair = {}
---@type Build_Stairs_Left_01_C-Class
ClassLib.Build_Stairs_Left_01_C = {}
---@type Build_Stairs_Right_01_C-Class
ClassLib.Build_Stairs_Right_01_C = {}
---@type FGBuildableWalkway-Class
ClassLib.FGBuildableWalkway = {}
---@type FGBuildableWalkwayLightweight-Class
ClassLib.FGBuildableWalkwayLightweight = {}
---@type Build_CatwalkCorner_C-Class
ClassLib.Build_CatwalkCorner_C = {}
---@type Build_CatwalkCross_C-Class
ClassLib.Build_CatwalkCross_C = {}
---@type Build_CatwalkRamp_C-Class
ClassLib.Build_CatwalkRamp_C = {}
---@type Build_CatwalkStairs_C-Class
ClassLib.Build_CatwalkStairs_C = {}
---@type Build_CatwalkStraight_C-Class
ClassLib.Build_CatwalkStraight_C = {}
---@type Build_CatwalkT_C-Class
ClassLib.Build_CatwalkT_C = {}
---@type Build_WalkwayCross_C-Class
ClassLib.Build_WalkwayCross_C = {}
---@type Build_WalkwayRamp_C-Class
ClassLib.Build_WalkwayRamp_C = {}
---@type Build_WalkwayT_C-Class
ClassLib.Build_WalkwayT_C = {}
---@type Build_WalkwayTrun_C-Class
ClassLib.Build_WalkwayTrun_C = {}
---@type Build_WalkwayStraight_C-Class
ClassLib.Build_WalkwayStraight_C = {}
---@type Build_Beam_Connector_C-Class
ClassLib.Build_Beam_Connector_C = {}
---@type Build_Beam_Connector_Double_C-Class
ClassLib.Build_Beam_Connector_Double_C = {}
---@type Build_Beam_Support_C-Class
ClassLib.Build_Beam_Support_C = {}
---@type FGBuildableBlueprintDesigner-Class
ClassLib.FGBuildableBlueprintDesigner = {}
---@type Build_BlueprintDesigner_C-Class
ClassLib.Build_BlueprintDesigner_C = {}
---@type Build_BlueprintDesigner_MK2_C-Class
ClassLib.Build_BlueprintDesigner_MK2_C = {}
---@type Build_BlueprintDesigner_Mk3_C-Class
ClassLib.Build_BlueprintDesigner_Mk3_C = {}
---@type FGBuildableCalendar-Class
ClassLib.FGBuildableCalendar = {}
---@type BP_ChristmasCalendar_C-Class
ClassLib.BP_ChristmasCalendar_C = {}
---@type CircuitBridge-Class
ClassLib.CircuitBridge = {}
---@type CircuitSwitch-Class
ClassLib.CircuitSwitch = {}
---@type CircuitSwitchPriority-Class
ClassLib.CircuitSwitchPriority = {}
---@type Build_PriorityPowerSwitch_C-Class
ClassLib.Build_PriorityPowerSwitch_C = {}
---@type Build_PowerSwitch_C-Class
ClassLib.Build_PowerSwitch_C = {}
---@type FGBuildableControlPanelHost-Class
ClassLib.FGBuildableControlPanelHost = {}
---@type LightsControlPanel-Class
ClassLib.LightsControlPanel = {}
---@type Build_LightsControlPanel_C-Class
ClassLib.Build_LightsControlPanel_C = {}
---@type FGBuildableConveyorBelt-Class
ClassLib.FGBuildableConveyorBelt = {}
---@type FGBuildableConveyorBase-Class
ClassLib.FGBuildableConveyorBase = {}
---@type Build_ConveyorBeltMk1_C-Class
ClassLib.Build_ConveyorBeltMk1_C = {}
---@type Build_ConveyorBeltMk2_C-Class
ClassLib.Build_ConveyorBeltMk2_C = {}
---@type Build_ConveyorBeltMk3_C-Class
ClassLib.Build_ConveyorBeltMk3_C = {}
---@type Build_ConveyorBeltMk4_C-Class
ClassLib.Build_ConveyorBeltMk4_C = {}
---@type Build_ConveyorBeltMk5_C-Class
ClassLib.Build_ConveyorBeltMk5_C = {}
---@type Build_ConveyorBeltMk6_C-Class
ClassLib.Build_ConveyorBeltMk6_C = {}
---@type FGBuildableConveyorLift-Class
ClassLib.FGBuildableConveyorLift = {}
---@type Build_ConveyorLiftMk1_C-Class
ClassLib.Build_ConveyorLiftMk1_C = {}
---@type Build_ConveyorLiftMk2_C-Class
ClassLib.Build_ConveyorLiftMk2_C = {}
---@type Build_ConveyorLiftMk3_C-Class
ClassLib.Build_ConveyorLiftMk3_C = {}
---@type Build_ConveyorLiftMk4_C-Class
ClassLib.Build_ConveyorLiftMk4_C = {}
---@type Build_ConveyorLiftMk5_C-Class
ClassLib.Build_ConveyorLiftMk5_C = {}
---@type Build_ConveyorLiftMk6_C-Class
ClassLib.Build_ConveyorLiftMk6_C = {}
---@type LightSource-Class
ClassLib.LightSource = {}
---@type FGBuildableFloodlight-Class
ClassLib.FGBuildableFloodlight = {}
---@type Build_FloodlightPole_C-Class
ClassLib.Build_FloodlightPole_C = {}
---@type Build_FloodlightWall_C-Class
ClassLib.Build_FloodlightWall_C = {}
---@type Build_CeilingLight_C-Class
ClassLib.Build_CeilingLight_C = {}
---@type Build_StreetLight_C-Class
ClassLib.Build_StreetLight_C = {}
---@type FGBuildableHubTerminal-Class
ClassLib.FGBuildableHubTerminal = {}
---@type Build_HubTerminal_C-Class
ClassLib.Build_HubTerminal_C = {}
---@type UndismantableHub_C-Class
ClassLib.UndismantableHub_C = {}
---@type Build_Ladder_C-Class
ClassLib.Build_Ladder_C = {}
---@type FGBuildableLadder-Class
ClassLib.FGBuildableLadder = {}
---@type FGBuildableMAM-Class
ClassLib.FGBuildableMAM = {}
---@type Build_Mam_C-Class
ClassLib.Build_Mam_C = {}
---@type FGBuildablePassthroughBase-Class
ClassLib.FGBuildablePassthroughBase = {}
---@type FGBuildablePassthrough-Class
ClassLib.FGBuildablePassthrough = {}
---@type Build_FoundationPassthrough_Lift_C-Class
ClassLib.Build_FoundationPassthrough_Lift_C = {}
---@type Build_FoundationPassthrough_Pipe_C-Class
ClassLib.Build_FoundationPassthrough_Pipe_C = {}
---@type FGBuildablePassthroughPipeHyper-Class
ClassLib.FGBuildablePassthroughPipeHyper = {}
---@type Build_FoundationPassthrough_Hypertube_C-Class
ClassLib.Build_FoundationPassthrough_Hypertube_C = {}
---@type FGBuildablePipeBase-Class
ClassLib.FGBuildablePipeBase = {}
---@type BuildablePipeHyper-Class
ClassLib.BuildablePipeHyper = {}
---@type Build_PipeHyper_C-Class
ClassLib.Build_PipeHyper_C = {}
---@type FGBuildablePipeline-Class
ClassLib.FGBuildablePipeline = {}
---@type Build_Pipeline_C-Class
ClassLib.Build_Pipeline_C = {}
---@type Build_Pipeline_NoIndicator_C-Class
ClassLib.Build_Pipeline_NoIndicator_C = {}
---@type Build_PipelineMK2_C-Class
ClassLib.Build_PipelineMK2_C = {}
---@type Build_PipelineMK2_NoIndicator_C-Class
ClassLib.Build_PipelineMK2_NoIndicator_C = {}
---@type FGBuildablePipelineFlowIndicator-Class
ClassLib.FGBuildablePipelineFlowIndicator = {}
---@type Build_PipelineFlowIndicator_C-Class
ClassLib.Build_PipelineFlowIndicator_C = {}
---@type FGBuildablePipelineSupport-Class
ClassLib.FGBuildablePipelineSupport = {}
---@type FGBuildablePoleBase-Class
ClassLib.FGBuildablePoleBase = {}
---@type Build_PipeHyperSupport_C-Class
ClassLib.Build_PipeHyperSupport_C = {}
---@type Build_HyperPoleStackable_C-Class
ClassLib.Build_HyperPoleStackable_C = {}
---@type Build_PipelineSupport_C-Class
ClassLib.Build_PipelineSupport_C = {}
---@type Build_PipeSupportStackable_C-Class
ClassLib.Build_PipeSupportStackable_C = {}
---@type Build_ConveyorPole_C-Class
ClassLib.Build_ConveyorPole_C = {}
---@type FGBuildablePoleLightweight-Class
ClassLib.FGBuildablePoleLightweight = {}
---@type FGBuildablePole-Class
ClassLib.FGBuildablePole = {}
---@type FGConveyorPoleStackable-Class
ClassLib.FGConveyorPoleStackable = {}
---@type Build_ConveyorPoleStackable_C-Class
ClassLib.Build_ConveyorPoleStackable_C = {}
---@type Serie_StackPole_C-Class
ClassLib.Serie_StackPole_C = {}
---@type Serie_Stack_C-Class
ClassLib.Serie_Stack_C = {}
---@type FGBuildableSignSupport-Class
ClassLib.FGBuildableSignSupport = {}
---@type Build_SignPole_C-Class
ClassLib.Build_SignPole_C = {}
---@type Build_ConveyorCeilingAttachment_C-Class
ClassLib.Build_ConveyorCeilingAttachment_C = {}
---@type FGBuildablePixelSign-Class
ClassLib.FGBuildablePixelSign = {}
---@type SignBase-Class
ClassLib.SignBase = {}
---@type Build_StandaloneWidgetSign_Huge_C-Class
ClassLib.Build_StandaloneWidgetSign_Huge_C = {}
---@type WidgetSign-Class
ClassLib.WidgetSign = {}
---@type Build_StandaloneWidgetSign_Large_C-Class
ClassLib.Build_StandaloneWidgetSign_Large_C = {}
---@type Build_StandaloneWidgetSign_Medium_C-Class
ClassLib.Build_StandaloneWidgetSign_Medium_C = {}
---@type Build_StandaloneWidgetSign_Portrait_C-Class
ClassLib.Build_StandaloneWidgetSign_Portrait_C = {}
---@type Build_StandaloneWidgetSign_Square_C-Class
ClassLib.Build_StandaloneWidgetSign_Square_C = {}
---@type Build_StandaloneWidgetSign_Square_Tiny_C-Class
ClassLib.Build_StandaloneWidgetSign_Square_Tiny_C = {}
---@type Build_StandaloneWidgetSign_Square_Small_C-Class
ClassLib.Build_StandaloneWidgetSign_Square_Small_C = {}
---@type Build_StandaloneWidgetSign_Small_C-Class
ClassLib.Build_StandaloneWidgetSign_Small_C = {}
---@type Build_StandaloneWidgetSign_SmallVeryWide_C-Class
ClassLib.Build_StandaloneWidgetSign_SmallVeryWide_C = {}
---@type Build_StandaloneWidgetSign_SmallWide_C-Class
ClassLib.Build_StandaloneWidgetSign_SmallWide_C = {}
---@type Build_PowerPoleWall_C-Class
ClassLib.Build_PowerPoleWall_C = {}
---@type FGBuildablePowerPole-Class
ClassLib.FGBuildablePowerPole = {}
---@type Build_PowerPoleWall_Mk2_C-Class
ClassLib.Build_PowerPoleWall_Mk2_C = {}
---@type Build_PowerPoleWall_Mk3_C-Class
ClassLib.Build_PowerPoleWall_Mk3_C = {}
---@type Build_PowerPoleMk1_C-Class
ClassLib.Build_PowerPoleMk1_C = {}
---@type Build_PowerPoleMk2_C-Class
ClassLib.Build_PowerPoleMk2_C = {}
---@type Build_PowerPoleMk3_C-Class
ClassLib.Build_PowerPoleMk3_C = {}
---@type Build_PowerPoleWallDouble_C-Class
ClassLib.Build_PowerPoleWallDouble_C = {}
---@type Build_PowerPoleWallDouble_Mk2_C-Class
ClassLib.Build_PowerPoleWallDouble_Mk2_C = {}
---@type Build_PowerPoleWallDouble_Mk3_C-Class
ClassLib.Build_PowerPoleWallDouble_Mk3_C = {}
---@type Build_PowerTower_C-Class
ClassLib.Build_PowerTower_C = {}
---@type Build_PowerTowerPlatform_C-Class
ClassLib.Build_PowerTowerPlatform_C = {}
---@type FGBuildablePowerTower-Class
ClassLib.FGBuildablePowerTower = {}
---@type FGBuildableRailroadBridge-Class
ClassLib.FGBuildableRailroadBridge = {}
---@type RailroadSignal-Class
ClassLib.RailroadSignal = {}
---@type Build_RailroadBlockSignal_C-Class
ClassLib.Build_RailroadBlockSignal_C = {}
---@type Build_RailroadPathSignal_C-Class
ClassLib.Build_RailroadPathSignal_C = {}
---@type RailroadSwitchControl-Class
ClassLib.RailroadSwitchControl = {}
---@type Build_RailroadSwitchControl_C-Class
ClassLib.Build_RailroadSwitchControl_C = {}
---@type Build_RailroadTrack_C-Class
ClassLib.Build_RailroadTrack_C = {}
---@type RailroadTrack-Class
ClassLib.RailroadTrack = {}
---@type Build_RailroadTrackIntegrated_C-Class
ClassLib.Build_RailroadTrackIntegrated_C = {}
---@type FGBuildableRoad-Class
ClassLib.FGBuildableRoad = {}
---@type FGBuildableSnowDispenser-Class
ClassLib.FGBuildableSnowDispenser = {}
---@type Build_SnowDispenser_C-Class
ClassLib.Build_SnowDispenser_C = {}
---@type Build_PowerLine_C-Class
ClassLib.Build_PowerLine_C = {}
---@type FGBuildableWire-Class
ClassLib.FGBuildableWire = {}
---@type Build_XmassLightsLine_C-Class
ClassLib.Build_XmassLightsLine_C = {}
---@type FGCustomizationLocker-Class
ClassLib.FGCustomizationLocker = {}
---@type Build_Locker_MK1_C-Class
ClassLib.Build_Locker_MK1_C = {}
---@type FGPioneerPotty-Class
ClassLib.FGPioneerPotty = {}
---@type BUILD_Potty_mk1_C-Class
ClassLib.BUILD_Potty_mk1_C = {}
---@type FINNetworkAdapter-Class
ClassLib.FINNetworkAdapter = {}
---@type Build_NetworkAdapter_C-Class
ClassLib.Build_NetworkAdapter_C = {}
---@type FINNetworkCable-Class
ClassLib.FINNetworkCable = {}
---@type Build_NetworkCable_C-Class
ClassLib.Build_NetworkCable_C = {}
---@type Build_ThinNetworkCable_C-Class
ClassLib.Build_ThinNetworkCable_C = {}
---@type NetworkRouter-Class
ClassLib.NetworkRouter = {}
---@type Build_NetworkRouter_C-Class
ClassLib.Build_NetworkRouter_C = {}
---@type FINWirelessAccessPoint-Class
ClassLib.FINWirelessAccessPoint = {}
---@type Build_WirelessAccessPoint_C-Class
ClassLib.Build_WirelessAccessPoint_C = {}
---@type ComputerCase-Class
ClassLib.ComputerCase = {}
---@type Build_ComputerCase_C-Class
ClassLib.Build_ComputerCase_C = {}
---@type FINComputerModule-Class
ClassLib.FINComputerModule = {}
---@type FINComputerDriveHolder-Class
ClassLib.FINComputerDriveHolder = {}
---@type Build_DriveHolder_C-Class
ClassLib.Build_DriveHolder_C = {}
---@type FINComputerGPU-Class
ClassLib.FINComputerGPU = {}
---@type GPUT1-Class
ClassLib.GPUT1 = {}
---@type Build_GPU_T1_C-Class
ClassLib.Build_GPU_T1_C = {}
---@type FINComputerGPUT2-Class
ClassLib.FINComputerGPUT2 = {}
---@type Build_GPU_T2_C-Class
ClassLib.Build_GPU_T2_C = {}
---@type FINComputerMemory-Class
ClassLib.FINComputerMemory = {}
---@type Build_RAM_T1_C-Class
ClassLib.Build_RAM_T1_C = {}
---@type NetworkCard-Class
ClassLib.NetworkCard = {}
---@type Build_NetworkCard_C-Class
ClassLib.Build_NetworkCard_C = {}
---@type FINComputerProcessor-Class
ClassLib.FINComputerProcessor = {}
---@type FINComputerProcessorLua-Class
ClassLib.FINComputerProcessorLua = {}
---@type Build_CPU_Lua_C-Class
ClassLib.Build_CPU_Lua_C = {}
---@type FINComputerScreen-Class
ClassLib.FINComputerScreen = {}
---@type Build_ScreenDriver_C-Class
ClassLib.Build_ScreenDriver_C = {}
---@type FINInternetCard-Class
ClassLib.FINInternetCard = {}
---@type Build_InternetCard_C-Class
ClassLib.Build_InternetCard_C = {}
---@type IndicatorPole-Class
ClassLib.IndicatorPole = {}
---@type Build_IndicatorPole_C-Class
ClassLib.Build_IndicatorPole_C = {}
---@type ModularIndicatorPole-Class
ClassLib.ModularIndicatorPole = {}
---@type Build_ModularIndicatorPole_C-Class
ClassLib.Build_ModularIndicatorPole_C = {}
---@type FINModularIndicatorPoleModule-Class
ClassLib.FINModularIndicatorPoleModule = {}
---@type ModularPoleModule_Buzzer-Class
ClassLib.ModularPoleModule_Buzzer = {}
---@type ModularPoleModule_Indicator-Class
ClassLib.ModularPoleModule_Indicator = {}
---@type FINModuleBase-Class
ClassLib.FINModuleBase = {}
---@type FINModuleScreen-Class
ClassLib.FINModuleScreen = {}
---@type Build_ModuleScreen_C-Class
ClassLib.Build_ModuleScreen_C = {}
---@type PushbuttonModule-Class
ClassLib.PushbuttonModule = {}
---@type MushroomPushbuttonModule-Class
ClassLib.MushroomPushbuttonModule = {}
---@type MushroomPushbuttonModuleBig-Class
ClassLib.MushroomPushbuttonModuleBig = {}
---@type PotWDisplayModule-Class
ClassLib.PotWDisplayModule = {}
---@type SwitchModule2Position-Class
ClassLib.SwitchModule2Position = {}
---@type SwitchModule3Position-Class
ClassLib.SwitchModule3Position = {}
---@type ModuleStopButton-Class
ClassLib.ModuleStopButton = {}
---@type ModuleButton-Class
ClassLib.ModuleButton = {}
---@type EncoderModule-Class
ClassLib.EncoderModule = {}
---@type ModuleSwitch-Class
ClassLib.ModuleSwitch = {}
---@type PotentiometerModule-Class
ClassLib.PotentiometerModule = {}
---@type ModulePotentiometer-Class
ClassLib.ModulePotentiometer = {}
---@type MicroDisplayModule-Class
ClassLib.MicroDisplayModule = {}
---@type LargeMicroDisplayModule-Class
ClassLib.LargeMicroDisplayModule = {}
---@type Label1x1Module-Class
ClassLib.Label1x1Module = {}
---@type Label3x1Module-Class
ClassLib.Label3x1Module = {}
---@type Label2x1Module-Class
ClassLib.Label2x1Module = {}
---@type Build_Module_RingedLabel_1x1_C-Class
ClassLib.Build_Module_RingedLabel_1x1_C = {}
---@type ModuleTextDisplay-Class
ClassLib.ModuleTextDisplay = {}
---@type SquareMicroDisplayModule-Class
ClassLib.SquareMicroDisplayModule = {}
---@type BigGaugeModule-Class
ClassLib.BigGaugeModule = {}
---@type BuzzerModule-Class
ClassLib.BuzzerModule = {}
---@type GaugeModule-Class
ClassLib.GaugeModule = {}
---@type Build_ModulePlug_C-Class
ClassLib.Build_ModulePlug_C = {}
---@type BasicSubplate_2x2-Class
ClassLib.BasicSubplate_2x2 = {}
---@type Build_BasicSubplate2x2Labeled_C-Class
ClassLib.Build_BasicSubplate2x2Labeled_C = {}
---@type IndicatorModule-Class
ClassLib.IndicatorModule = {}
---@type Screen-Class
ClassLib.Screen = {}
---@type Build_Screen_C-Class
ClassLib.Build_Screen_C = {}
---@type FINSizeablePanel-Class
ClassLib.FINSizeablePanel = {}
---@type SizeableModulePanel-Class
ClassLib.SizeableModulePanel = {}
---@type SpeakerPole-Class
ClassLib.SpeakerPole = {}
---@type Build_Speakers_C-Class
ClassLib.Build_Speakers_C = {}
---@type VehicleScanner-Class
ClassLib.VehicleScanner = {}
---@type Build_VehicleScanner_C-Class
ClassLib.Build_VehicleScanner_C = {}
---@type AbsoluteNumber-Class
ClassLib.AbsoluteNumber = {}
---@type FGWiremodBuildable-Class
ClassLib.FGWiremodBuildable = {}
---@type Build_AbsoluteNumber_C-Class
ClassLib.Build_AbsoluteNumber_C = {}
---@type MultistateWiremodBuildable-Class
ClassLib.MultistateWiremodBuildable = {}
---@type Acos-Class
ClassLib.Acos = {}
---@type Build_ACos_C-Class
ClassLib.Build_ACos_C = {}
---@type AddNumbers-Class
ClassLib.AddNumbers = {}
---@type Build_AddNumbers_C-Class
ClassLib.Build_AddNumbers_C = {}
---@type AND-Class
ClassLib.AND = {}
---@type Build_AND_Gate_C-Class
ClassLib.Build_AND_Gate_C = {}
---@type AppendString-Class
ClassLib.AppendString = {}
---@type Build_AppendString_C-Class
ClassLib.Build_AppendString_C = {}
---@type ArrayFind-Class
ClassLib.ArrayFind = {}
---@type Build_ArrayFind_C-Class
ClassLib.Build_ArrayFind_C = {}
---@type Asin-Class
ClassLib.Asin = {}
---@type Build_ASin_C-Class
ClassLib.Build_ASin_C = {}
---@type Atan-Class
ClassLib.Atan = {}
---@type Build_ATan_C-Class
ClassLib.Build_ATan_C = {}
---@type Atan2-Class
ClassLib.Atan2 = {}
---@type Build_ATan2_C-Class
ClassLib.Build_ATan2_C = {}
---@type BounceInterpolation-Class
ClassLib.BounceInterpolation = {}
---@type Build_BounceInterp_C-Class
ClassLib.Build_BounceInterp_C = {}
---@type CircularIntepolation-Class
ClassLib.CircularIntepolation = {}
---@type Build_CircularInterp_C-Class
ClassLib.Build_CircularInterp_C = {}
---@type Cos-Class
ClassLib.Cos = {}
---@type Build_Cos_C-Class
ClassLib.Build_Cos_C = {}
---@type DivideNumbers-Class
ClassLib.DivideNumbers = {}
---@type Build_DivideNumbers_C-Class
ClassLib.Build_DivideNumbers_C = {}
---@type EaseInterpolation-Class
ClassLib.EaseInterpolation = {}
---@type Build_EaseInterp_C-Class
ClassLib.Build_EaseInterp_C = {}
---@type ExpoInterpolation-Class
ClassLib.ExpoInterpolation = {}
---@type Build_ExpoInterp_C-Class
ClassLib.Build_ExpoInterp_C = {}
---@type ItemAmountToStack-Class
ClassLib.ItemAmountToStack = {}
---@type Build_ItemAmountToStack_C-Class
ClassLib.Build_ItemAmountToStack_C = {}
---@type ItemStackToAmount-Class
ClassLib.ItemStackToAmount = {}
---@type Build_ItemStackToAmount_C-Class
ClassLib.Build_ItemStackToAmount_C = {}
---@type LerpColor-Class
ClassLib.LerpColor = {}
---@type Build_LerpColor_C-Class
ClassLib.Build_LerpColor_C = {}
---@type MultiplyNumbers-Class
ClassLib.MultiplyNumbers = {}
---@type Build_MultiplyNumbers_C-Class
ClassLib.Build_MultiplyNumbers_C = {}
---@type NAND-Class
ClassLib.NAND = {}
---@type Build_NAND_Gate_C-Class
ClassLib.Build_NAND_Gate_C = {}
---@type NOR-Class
ClassLib.NOR = {}
---@type Build_NOR_Gate_C-Class
ClassLib.Build_NOR_Gate_C = {}
---@type NumberAverage-Class
ClassLib.NumberAverage = {}
---@type Build_NumberAverage_C-Class
ClassLib.Build_NumberAverage_C = {}
---@type NumberMax-Class
ClassLib.NumberMax = {}
---@type Build_NumberMax_C-Class
ClassLib.Build_NumberMax_C = {}
---@type NumberMin-Class
ClassLib.NumberMin = {}
---@type Build_NumberMin_C-Class
ClassLib.Build_NumberMin_C = {}
---@type NumberSubtract-Class
ClassLib.NumberSubtract = {}
---@type Build_Subtract_C-Class
ClassLib.Build_Subtract_C = {}
---@type OR-Class
ClassLib.OR = {}
---@type Build_OR_Gate_C-Class
ClassLib.Build_OR_Gate_C = {}
---@type SelectValue-Class
ClassLib.SelectValue = {}
---@type Build_BooleanSelect_C-Class
ClassLib.Build_BooleanSelect_C = {}
---@type Sin-Class
ClassLib.Sin = {}
---@type Build_Sin_C-Class
ClassLib.Build_Sin_C = {}
---@type SinusoidalInterpolation-Class
ClassLib.SinusoidalInterpolation = {}
---@type Build_SinInterp_C-Class
ClassLib.Build_SinInterp_C = {}
---@type Siren-Class
ClassLib.Siren = {}
---@type Build_Siren_C-Class
ClassLib.Build_Siren_C = {}
---@type StringCase-Class
ClassLib.StringCase = {}
---@type Build_StringCase_C-Class
ClassLib.Build_StringCase_C = {}
---@type Tan-Class
ClassLib.Tan = {}
---@type Build_Tan_C-Class
ClassLib.Build_Tan_C = {}
---@type ToString-Class
ClassLib.ToString = {}
---@type Build_ToString_C-Class
ClassLib.Build_ToString_C = {}
---@type ToStringArray-Class
ClassLib.ToStringArray = {}
---@type Build_ToStringArray_C-Class
ClassLib.Build_ToStringArray_C = {}
---@type XNOR-Class
ClassLib.XNOR = {}
---@type Build_XNOR_Gate_C-Class
ClassLib.Build_XNOR_Gate_C = {}
---@type XOR-Class
ClassLib.XOR = {}
---@type Build_XOR_Gate_C-Class
ClassLib.Build_XOR_Gate_C = {}
---@type Build_TestBuilding_C-Class
ClassLib.Build_TestBuilding_C = {}
---@type ArrayAdd-Class
ClassLib.ArrayAdd = {}
---@type Build_ArrayAdd_C-Class
ClassLib.Build_ArrayAdd_C = {}
---@type ArrayAppend-Class
ClassLib.ArrayAppend = {}
---@type Build_ArrayAppend_C-Class
ClassLib.Build_ArrayAppend_C = {}
---@type ArrayBreak-Class
ClassLib.ArrayBreak = {}
---@type Build_BreakArray_C-Class
ClassLib.Build_BreakArray_C = {}
---@type ArrayClear-Class
ClassLib.ArrayClear = {}
---@type Build_ClearArray_C-Class
ClassLib.Build_ClearArray_C = {}
---@type ArrayContains-Class
ClassLib.ArrayContains = {}
---@type Build_ArrayContains_C-Class
ClassLib.Build_ArrayContains_C = {}
---@type ArrayFilter-Class
ClassLib.ArrayFilter = {}
---@type Build_ArrayFilter_C-Class
ClassLib.Build_ArrayFilter_C = {}
---@type ArrayGet-Class
ClassLib.ArrayGet = {}
---@type Build_ArrayGet_C-Class
ClassLib.Build_ArrayGet_C = {}
---@type ArrayHistory-Class
ClassLib.ArrayHistory = {}
---@type Build_ArrayHistory_C-Class
ClassLib.Build_ArrayHistory_C = {}
---@type ArrayInsert-Class
ClassLib.ArrayInsert = {}
---@type Build_ArrayInsert_C-Class
ClassLib.Build_ArrayInsert_C = {}
---@type ArrayIterator-Class
ClassLib.ArrayIterator = {}
---@type Build_ArrayIterator_C-Class
ClassLib.Build_ArrayIterator_C = {}
---@type ArrayLength-Class
ClassLib.ArrayLength = {}
---@type Build_ArrayLength_C-Class
ClassLib.Build_ArrayLength_C = {}
---@type ArrayMake-Class
ClassLib.ArrayMake = {}
---@type Build_MakeArray_C-Class
ClassLib.Build_MakeArray_C = {}
---@type ArrayRemove-Class
ClassLib.ArrayRemove = {}
---@type Build_ArrayRemove_C-Class
ClassLib.Build_ArrayRemove_C = {}
---@type ArrayResize-Class
ClassLib.ArrayResize = {}
---@type Build_ResizeArray_C-Class
ClassLib.Build_ResizeArray_C = {}
---@type ArraySet-Class
ClassLib.ArraySet = {}
---@type Build_ArraySet_C-Class
ClassLib.Build_ArraySet_C = {}
---@type BoolArrayToInt-Class
ClassLib.BoolArrayToInt = {}
---@type Build_BoolArrayToInt_C-Class
ClassLib.Build_BoolArrayToInt_C = {}
---@type BoolToNumber-Class
ClassLib.BoolToNumber = {}
---@type Build_BoolToNumber_C-Class
ClassLib.Build_BoolToNumber_C = {}
---@type BreakColor-Class
ClassLib.BreakColor = {}
---@type Build_BreakColor_C-Class
ClassLib.Build_BreakColor_C = {}
---@type BreakColorRGBA-Class
ClassLib.BreakColorRGBA = {}
---@type Build_BreakColorRGBA_C-Class
ClassLib.Build_BreakColorRGBA_C = {}
---@type BreakCustomStruct-Class
ClassLib.BreakCustomStruct = {}
---@type Build_BreakCustomStruct_C-Class
ClassLib.Build_BreakCustomStruct_C = {}
---@type BreakEntity-Class
ClassLib.BreakEntity = {}
---@type Build_BreakEntity_C-Class
ClassLib.Build_BreakEntity_C = {}
---@type BreakInventory-Class
ClassLib.BreakInventory = {}
---@type Build_BreakInventory_C-Class
ClassLib.Build_BreakInventory_C = {}
---@type BreakItemAmount-Class
ClassLib.BreakItemAmount = {}
---@type Build_BreakItemAmount_C-Class
ClassLib.Build_BreakItemAmount_C = {}
---@type BreakItemStack-Class
ClassLib.BreakItemStack = {}
---@type Build_BreakItemStack_C-Class
ClassLib.Build_BreakItemStack_C = {}
---@type BreakPixelImage-Class
ClassLib.BreakPixelImage = {}
---@type BreakPowerCircuit-Class
ClassLib.BreakPowerCircuit = {}
---@type Build_BreakPowerCircuit_C-Class
ClassLib.Build_BreakPowerCircuit_C = {}
---@type BreakRecipe-Class
ClassLib.BreakRecipe = {}
---@type Build_BreakRecipe_C-Class
ClassLib.Build_BreakRecipe_C = {}
---@type BreakTimeTableStop-Class
ClassLib.BreakTimeTableStop = {}
---@type Build_BreakTrainStop_C-Class
ClassLib.Build_BreakTrainStop_C = {}
---@type BreakTrainTimeTable-Class
ClassLib.BreakTrainTimeTable = {}
---@type Build_BreakTimeTable_C-Class
ClassLib.Build_BreakTimeTable_C = {}
---@type BreakVector-Class
ClassLib.BreakVector = {}
---@type Build_BreakVector_C-Class
ClassLib.Build_BreakVector_C = {}
---@type ChangeDetector-Class
ClassLib.ChangeDetector = {}
---@type Build_ChangeDetector_C-Class
ClassLib.Build_ChangeDetector_C = {}
---@type CircuitryMapMarker-Class
ClassLib.CircuitryMapMarker = {}
---@type Build_MapBeacon_C-Class
ClassLib.Build_MapBeacon_C = {}
---@type ClampNumber-Class
ClassLib.ClampNumber = {}
---@type Build_ClampNumber_C-Class
ClassLib.Build_ClampNumber_C = {}
---@type ColorToHex-Class
ClassLib.ColorToHex = {}
---@type Build_ColorToHexString_C-Class
ClassLib.Build_ColorToHexString_C = {}
---@type CombineInventories-Class
ClassLib.CombineInventories = {}
---@type Build_CombineInventories_C-Class
ClassLib.Build_CombineInventories_C = {}
---@type CombineItemStacks-Class
ClassLib.CombineItemStacks = {}
---@type Build_CombineStacks_C-Class
ClassLib.Build_CombineStacks_C = {}
---@type ConfigurableConstant-Class
ClassLib.ConfigurableConstant = {}
---@type Build_Const_C-Class
ClassLib.Build_Const_C = {}
---@type ConveyorLimiter-Class
ClassLib.ConveyorLimiter = {}
---@type Build_ConveyorLimiter_C-Class
ClassLib.Build_ConveyorLimiter_C = {}
---@type DegreesToRadians-Class
ClassLib.DegreesToRadians = {}
---@type Build_DegToRad_C-Class
ClassLib.Build_DegToRad_C = {}
---@type DeltaTime-Class
ClassLib.DeltaTime = {}
---@type Build_DeltaTime_C-Class
ClassLib.Build_DeltaTime_C = {}
---@type DesaturateColor-Class
ClassLib.DesaturateColor = {}
---@type Build_DesaturateColor_C-Class
ClassLib.Build_DesaturateColor_C = {}
---@type DFlipFlop-Class
ClassLib.DFlipFlop = {}
---@type Build_D_Flip_Flop_C-Class
ClassLib.Build_D_Flip_Flop_C = {}
---@type Equals-Class
ClassLib.Equals = {}
---@type Build_Equals_C-Class
ClassLib.Build_Equals_C = {}
---@type FallingEdgeDelay-Class
ClassLib.FallingEdgeDelay = {}
---@type Build_FallingEdgeDelay_C-Class
ClassLib.Build_FallingEdgeDelay_C = {}
---@type FallingEdgeDetector-Class
ClassLib.FallingEdgeDetector = {}
---@type Build_FallingEdgeDetector_C-Class
ClassLib.Build_FallingEdgeDetector_C = {}
---@type FindSubstring-Class
ClassLib.FindSubstring = {}
---@type Build_FindInString_C-Class
ClassLib.Build_FindInString_C = {}
---@type GameTimeSensor-Class
ClassLib.GameTimeSensor = {}
---@type Build_GameTimeSensor_C-Class
ClassLib.Build_GameTimeSensor_C = {}
---@type GetItemStack-Class
ClassLib.GetItemStack = {}
---@type Build_GetItemStack_C-Class
ClassLib.Build_GetItemStack_C = {}
---@type GetStringChar-Class
ClassLib.GetStringChar = {}
---@type Build_GetChar_C-Class
ClassLib.Build_GetChar_C = {}
---@type GraphScreen-Class
ClassLib.GraphScreen = {}
---@type HexToColor-Class
ClassLib.HexToColor = {}
---@type Build_HexToColor_C-Class
ClassLib.Build_HexToColor_C = {}
---@type HttpRequestModule-Class
ClassLib.HttpRequestModule = {}
---@type Build_NetworkRequestModule_C-Class
ClassLib.Build_NetworkRequestModule_C = {}
---@type IncrementDecrement-Class
ClassLib.IncrementDecrement = {}
---@type Build_IncrementDecrement_C-Class
ClassLib.Build_IncrementDecrement_C = {}
---@type IntToBoolArray-Class
ClassLib.IntToBoolArray = {}
---@type Build_IntToBoolArray_C-Class
ClassLib.Build_IntToBoolArray_C = {}
---@type InverseNumber-Class
ClassLib.InverseNumber = {}
---@type Build_Inverse_C-Class
ClassLib.Build_Inverse_C = {}
---@type ItemBuffer-Class
ClassLib.ItemBuffer = {}
---@type Build_ItemBuffer_C-Class
ClassLib.Build_ItemBuffer_C = {}
---@type ItemHologram-Class
ClassLib.ItemHologram = {}
---@type Build_ItemHologram_C-Class
ClassLib.Build_ItemHologram_C = {}
---@type LerpNumber-Class
ClassLib.LerpNumber = {}
---@type Build_LerpNumber_C-Class
ClassLib.Build_LerpNumber_C = {}
---@type LightsColorEditor-Class
ClassLib.LightsColorEditor = {}
---@type Build_ColorSlotEditor_C-Class
ClassLib.Build_ColorSlotEditor_C = {}
---@type LinearInterpolation-Class
ClassLib.LinearInterpolation = {}
---@type LinearMotionAdapter-Class
ClassLib.LinearMotionAdapter = {}
---@type Build_LinearMotionAdapter_C-Class
ClassLib.Build_LinearMotionAdapter_C = {}
---@type MakeColor-Class
ClassLib.MakeColor = {}
---@type Build_MakeColor_C-Class
ClassLib.Build_MakeColor_C = {}
---@type MakeColorRGBA-Class
ClassLib.MakeColorRGBA = {}
---@type Build_MakeColorRGBA_C-Class
ClassLib.Build_MakeColorRGBA_C = {}
---@type CustomStructProcessor-Class
ClassLib.CustomStructProcessor = {}
---@type Build_CustomStructProcessor_C-Class
ClassLib.Build_CustomStructProcessor_C = {}
---@type MakeItemAmount-Class
ClassLib.MakeItemAmount = {}
---@type Build_MakeItemAmount_C-Class
ClassLib.Build_MakeItemAmount_C = {}
---@type MakeItemStack-Class
ClassLib.MakeItemStack = {}
---@type Build_MakeItemStack_C-Class
ClassLib.Build_MakeItemStack_C = {}
---@type MakeSplitterRule-Class
ClassLib.MakeSplitterRule = {}
---@type Build_MakeSplitterRule_C-Class
ClassLib.Build_MakeSplitterRule_C = {}
---@type MakeVector-Class
ClassLib.MakeVector = {}
---@type Build_MakeVector_C-Class
ClassLib.Build_MakeVector_C = {}
---@type ManagedSign-Class
ClassLib.ManagedSign = {}
---@type BP_ManagedSign_C-Class
ClassLib.BP_ManagedSign_C = {}
---@type Build_ManagedSign_SmallBillboard_C-Class
ClassLib.Build_ManagedSign_SmallBillboard_C = {}
---@type Build_ManagedSign_CustomSize_C-Class
ClassLib.Build_ManagedSign_CustomSize_C = {}
---@type Build_ManagedSign_SquareSmall_C-Class
ClassLib.Build_ManagedSign_SquareSmall_C = {}
---@type Build_ManagedSign_Portrait_C-Class
ClassLib.Build_ManagedSign_Portrait_C = {}
---@type Build_ManagedSign_SquareLarge_C-Class
ClassLib.Build_ManagedSign_SquareLarge_C = {}
---@type Build_ManagedSign_BigBillboard_C-Class
ClassLib.Build_ManagedSign_BigBillboard_C = {}
---@type Build_ManagedSign_SquareMedium_C-Class
ClassLib.Build_ManagedSign_SquareMedium_C = {}
---@type Build_ManagedSign_Display_C-Class
ClassLib.Build_ManagedSign_Display_C = {}
---@type MathExpressionEvaluator-Class
ClassLib.MathExpressionEvaluator = {}
---@type Build_MathExpEvaluator_C-Class
ClassLib.Build_MathExpEvaluator_C = {}
---@type ModifyCustomStruct-Class
ClassLib.ModifyCustomStruct = {}
---@type Build_ModifyCustomStruct_C-Class
ClassLib.Build_ModifyCustomStruct_C = {}
---@type Multiplexer-Class
ClassLib.Multiplexer = {}
---@type Build_Multiplexer_C-Class
ClassLib.Build_Multiplexer_C = {}
---@type NegateNumber-Class
ClassLib.NegateNumber = {}
---@type Build_NegateNumber_C-Class
ClassLib.Build_NegateNumber_C = {}
---@type NormalizeNumber-Class
ClassLib.NormalizeNumber = {}
---@type Build_Percent_C-Class
ClassLib.Build_Percent_C = {}
---@type NOT-Class
ClassLib.NOT = {}
---@type Build_NOT_Gate_C-Class
ClassLib.Build_NOT_Gate_C = {}
---@type Notificator-Class
ClassLib.Notificator = {}
---@type Build_Notificator_C-Class
ClassLib.Build_Notificator_C = {}
---@type NumberCeil-Class
ClassLib.NumberCeil = {}
---@type Build_NumberRoundUp_C-Class
ClassLib.Build_NumberRoundUp_C = {}
---@type NumberEquals-Class
ClassLib.NumberEquals = {}
---@type Build_NumberEquals_C-Class
ClassLib.Build_NumberEquals_C = {}
---@type NumberExponent-Class
ClassLib.NumberExponent = {}
---@type Build_ExpNumber_C-Class
ClassLib.Build_ExpNumber_C = {}
---@type NumberFloor-Class
ClassLib.NumberFloor = {}
---@type Build_NumberRoundDown_C-Class
ClassLib.Build_NumberRoundDown_C = {}
---@type NumberFractional-Class
ClassLib.NumberFractional = {}
---@type Build_NumberFractional_C-Class
ClassLib.Build_NumberFractional_C = {}
---@type NumberGreater-Class
ClassLib.NumberGreater = {}
---@type Build_NumberGreater_C-Class
ClassLib.Build_NumberGreater_C = {}
---@type NumberGreaterOrEqual-Class
ClassLib.NumberGreaterOrEqual = {}
---@type Build_NumberGreaterOrEqual_C-Class
ClassLib.Build_NumberGreaterOrEqual_C = {}
---@type NumberIsInRange-Class
ClassLib.NumberIsInRange = {}
---@type Build_NumberIsInRange_C-Class
ClassLib.Build_NumberIsInRange_C = {}
---@type NumberLesser-Class
ClassLib.NumberLesser = {}
---@type Build_NumberLesser_C-Class
ClassLib.Build_NumberLesser_C = {}
---@type NumberLesserOrEqual-Class
ClassLib.NumberLesserOrEqual = {}
---@type Build_NumberLessOrEqual_C-Class
ClassLib.Build_NumberLessOrEqual_C = {}
---@type NumberLog-Class
ClassLib.NumberLog = {}
---@type Build_NumberLog_C-Class
ClassLib.Build_NumberLog_C = {}
---@type NumberLog10-Class
ClassLib.NumberLog10 = {}
---@type Build_NumberLog10_C-Class
ClassLib.Build_NumberLog10_C = {}
---@type NumberModulo-Class
ClassLib.NumberModulo = {}
---@type Build_NumberModulo_C-Class
ClassLib.Build_NumberModulo_C = {}
---@type NumberPower-Class
ClassLib.NumberPower = {}
---@type Build_PowerNumber_C-Class
ClassLib.Build_PowerNumber_C = {}
---@type NumberRound-Class
ClassLib.NumberRound = {}
---@type Build_Round_C-Class
ClassLib.Build_Round_C = {}
---@type NumberSign-Class
ClassLib.NumberSign = {}
---@type Build_Sign_C-Class
ClassLib.Build_Sign_C = {}
---@type NumberSquareRoot-Class
ClassLib.NumberSquareRoot = {}
---@type Build_SquareRoot_C-Class
ClassLib.Build_SquareRoot_C = {}
---@type NumberToBool-Class
ClassLib.NumberToBool = {}
---@type Build_NumberToBool_C-Class
ClassLib.Build_NumberToBool_C = {}
---@type NumberToHexString-Class
ClassLib.NumberToHexString = {}
---@type Build_NumberToHex_C-Class
ClassLib.Build_NumberToHex_C = {}
---@type NumberToTime-Class
ClassLib.NumberToTime = {}
---@type Build_NumberToTimeString_C-Class
ClassLib.Build_NumberToTimeString_C = {}
---@type NumberTruncate-Class
ClassLib.NumberTruncate = {}
---@type Build_TruncateNumber_C-Class
ClassLib.Build_TruncateNumber_C = {}
---@type Oscilloscope-Class
ClassLib.Oscilloscope = {}
---@type PerlinNoise1D-Class
ClassLib.PerlinNoise1D = {}
---@type Build_PerlinNoise1D_C-Class
ClassLib.Build_PerlinNoise1D_C = {}
---@type PerlinNoise3D-Class
ClassLib.PerlinNoise3D = {}
---@type Build_PerlinNoise3D_C-Class
ClassLib.Build_PerlinNoise3D_C = {}
---@type Pi-Class
ClassLib.Pi = {}
---@type Build_PI_C-Class
ClassLib.Build_PI_C = {}
---@type Pixel-Class
ClassLib.Pixel = {}
---@type Build_Pixel_C-Class
ClassLib.Build_Pixel_C = {}
---@type BoolPixel-Class
ClassLib.BoolPixel = {}
---@type Build_BoolPixel_C-Class
ClassLib.Build_BoolPixel_C = {}
---@type PixelArtManager-Class
ClassLib.PixelArtManager = {}
---@type Build_PixelArtManager_C-Class
ClassLib.Build_PixelArtManager_C = {}
---@type PlayerSensor-Class
ClassLib.PlayerSensor = {}
---@type Build_PlayerSensor_C-Class
ClassLib.Build_PlayerSensor_C = {}
---@type ProximitySensor-Class
ClassLib.ProximitySensor = {}
---@type Build_Proximity_C-Class
ClassLib.Build_Proximity_C = {}
---@type QuadraticFormula-Class
ClassLib.QuadraticFormula = {}
---@type Build_QuadraticFormula_C-Class
ClassLib.Build_QuadraticFormula_C = {}
---@type RadiansToDegrees-Class
ClassLib.RadiansToDegrees = {}
---@type Build_RadToDeg_C-Class
ClassLib.Build_RadToDeg_C = {}
---@type RadiationSensor-Class
ClassLib.RadiationSensor = {}
---@type Build_RadiationSensor_C-Class
ClassLib.Build_RadiationSensor_C = {}
---@type RadioReceiver-Class
ClassLib.RadioReceiver = {}
---@type Build_Radio_Receive_C-Class
ClassLib.Build_Radio_Receive_C = {}
---@type RadioTransmitter-Class
ClassLib.RadioTransmitter = {}
---@type Build_Radio_Transmit_C-Class
ClassLib.Build_Radio_Transmit_C = {}
---@type RandomNumber-Class
ClassLib.RandomNumber = {}
---@type Build_RandomNumber_C-Class
ClassLib.Build_RandomNumber_C = {}
---@type RangerSensor-Class
ClassLib.RangerSensor = {}
---@type Build_Ranger_C-Class
ClassLib.Build_Ranger_C = {}
---@type RemapNumber-Class
ClassLib.RemapNumber = {}
---@type Build_RemapValue_C-Class
ClassLib.Build_RemapValue_C = {}
---@type RemoteControlReceiver-Class
ClassLib.RemoteControlReceiver = {}
---@type Build_RemoteControlReceiver_C-Class
ClassLib.Build_RemoteControlReceiver_C = {}
---@type RepeatString-Class
ClassLib.RepeatString = {}
---@type Build_RepeatString_C-Class
ClassLib.Build_RepeatString_C = {}
---@type ReplaceString-Class
ClassLib.ReplaceString = {}
---@type Build_Replace_C-Class
ClassLib.Build_Replace_C = {}
---@type ResourceSinkInfo-Class
ClassLib.ResourceSinkInfo = {}
---@type Build_ResourceSinkInfo_C-Class
ClassLib.Build_ResourceSinkInfo_C = {}
---@type ReverseString-Class
ClassLib.ReverseString = {}
---@type Build_ReverseString_C-Class
ClassLib.Build_ReverseString_C = {}
---@type RisingEdgeDelay-Class
ClassLib.RisingEdgeDelay = {}
---@type Build_RisingEdgeDelay_C-Class
ClassLib.Build_RisingEdgeDelay_C = {}
---@type RisingEdgeDetector-Class
ClassLib.RisingEdgeDetector = {}
---@type Build_RisingEdgeDetector_C-Class
ClassLib.Build_RisingEdgeDetector_C = {}
---@type SignalSelector-Class
ClassLib.SignalSelector = {}
---@type Build_SignalSelector_C-Class
ClassLib.Build_SignalSelector_C = {}
---@type SoundEmitter-Class
ClassLib.SoundEmitter = {}
---@type Build_SoundEmitter_C-Class
ClassLib.Build_SoundEmitter_C = {}
---@type SplitString-Class
ClassLib.SplitString = {}
---@type Build_SplitString_C-Class
ClassLib.Build_SplitString_C = {}
---@type SRLatch-Class
ClassLib.SRLatch = {}
---@type Build_SR_Latch_C-Class
ClassLib.Build_SR_Latch_C = {}
---@type SRLatchWithEnable-Class
ClassLib.SRLatchWithEnable = {}
---@type Build_SR_Latch_EN_C-Class
ClassLib.Build_SR_Latch_EN_C = {}
---@type StepInterpolation-Class
ClassLib.StepInterpolation = {}
---@type Build_StepInterpolation_C-Class
ClassLib.Build_StepInterpolation_C = {}
---@type StringByte-Class
ClassLib.StringByte = {}
---@type Build_ToByte_C-Class
ClassLib.Build_ToByte_C = {}
---@type StringEquals-Class
ClassLib.StringEquals = {}
---@type Build_EqualString_C-Class
ClassLib.Build_EqualString_C = {}
---@type StringLength-Class
ClassLib.StringLength = {}
---@type Build_StringLength_C-Class
ClassLib.Build_StringLength_C = {}
---@type StringToBool-Class
ClassLib.StringToBool = {}
---@type Build_StringToBool_C-Class
ClassLib.Build_StringToBool_C = {}
---@type StringToColor-Class
ClassLib.StringToColor = {}
---@type Build_StringToColor_C-Class
ClassLib.Build_StringToColor_C = {}
---@type StringToNumber-Class
ClassLib.StringToNumber = {}
---@type Build_StringToNumber_C-Class
ClassLib.Build_StringToNumber_C = {}
---@type StringToVector-Class
ClassLib.StringToVector = {}
---@type Build_StringToVector_C-Class
ClassLib.Build_StringToVector_C = {}
---@type Substring-Class
ClassLib.Substring = {}
---@type Build_Substring_C-Class
ClassLib.Build_Substring_C = {}
---@type SwatchController-Class
ClassLib.SwatchController = {}
---@type Build_GlobalColorSwatchController_C-Class
ClassLib.Build_GlobalColorSwatchController_C = {}
---@type CustomSwatchController-Class
ClassLib.CustomSwatchController = {}
---@type Build_CustomColorSwatchController_C-Class
ClassLib.Build_CustomColorSwatchController_C = {}
---@type TextureRenderer-Class
ClassLib.TextureRenderer = {}
---@type Build_ImageRenderer_C-Class
ClassLib.Build_ImageRenderer_C = {}
---@type TFlipFlop-Class
ClassLib.TFlipFlop = {}
---@type Build_T_FlipFlop_C-Class
ClassLib.Build_T_FlipFlop_C = {}
---@type Timer-Class
ClassLib.Timer = {}
---@type Build_Timer_C-Class
ClassLib.Build_Timer_C = {}
---@type Transistor-Class
ClassLib.Transistor = {}
---@type Build_Transistor_C-Class
ClassLib.Build_Transistor_C = {}
---@type TrimString-Class
ClassLib.TrimString = {}
---@type Build_TrimString_C-Class
ClassLib.Build_TrimString_C = {}
---@type VectorAdd-Class
ClassLib.VectorAdd = {}
---@type Build_VectorAdd_C-Class
ClassLib.Build_VectorAdd_C = {}
---@type VectorCrossProduct-Class
ClassLib.VectorCrossProduct = {}
---@type Build_CrossProduct_C-Class
ClassLib.Build_CrossProduct_C = {}
---@type VectorDistance-Class
ClassLib.VectorDistance = {}
---@type Build_VectorDistance_C-Class
ClassLib.Build_VectorDistance_C = {}
---@type VectorDivide-Class
ClassLib.VectorDivide = {}
---@type Build_VectorDivide_C-Class
ClassLib.Build_VectorDivide_C = {}
---@type VectorDotProduct-Class
ClassLib.VectorDotProduct = {}
---@type Build_DotProduct_C-Class
ClassLib.Build_DotProduct_C = {}
---@type VectorEquals-Class
ClassLib.VectorEquals = {}
---@type Build_VectorEqual_C-Class
ClassLib.Build_VectorEqual_C = {}
---@type VectorGridSnap-Class
ClassLib.VectorGridSnap = {}
---@type Build_VectorGridSnap_C-Class
ClassLib.Build_VectorGridSnap_C = {}
---@type VectorMultiply-Class
ClassLib.VectorMultiply = {}
---@type Build_VectorMultiply_C-Class
ClassLib.Build_VectorMultiply_C = {}
---@type VectorNumberDivide-Class
ClassLib.VectorNumberDivide = {}
---@type Build_VectorNumberDivide_C-Class
ClassLib.Build_VectorNumberDivide_C = {}
---@type VectorNumberMultiply-Class
ClassLib.VectorNumberMultiply = {}
---@type Build_VectorNumberMultiply_C-Class
ClassLib.Build_VectorNumberMultiply_C = {}
---@type VectorSubtract-Class
ClassLib.VectorSubtract = {}
---@type Build_VectorSubtract_C-Class
ClassLib.Build_VectorSubtract_C = {}
---@type VectorToColor-Class
ClassLib.VectorToColor = {}
---@type Build_VectorToColor_C-Class
ClassLib.Build_VectorToColor_C = {}
---@type ButtonBase_C-Class
ClassLib.ButtonBase_C = {}
---@type Build_Button_C-Class
ClassLib.Build_Button_C = {}
---@type Build_ButtonToggle_C-Class
ClassLib.Build_ButtonToggle_C = {}
---@type Build_Keyboard_C-Class
ClassLib.Build_Keyboard_C = {}
---@type Build_Keypad_C-Class
ClassLib.Build_Keypad_C = {}
---@type Build_AdjustableSlider_C-Class
ClassLib.Build_AdjustableSlider_C = {}
---@type Build_TextureDownloader_C-Class
ClassLib.Build_TextureDownloader_C = {}
---@type Build_OSTimeDate_C-Class
ClassLib.Build_OSTimeDate_C = {}
---@type Build_HitDetector_C-Class
ClassLib.Build_HitDetector_C = {}
---@type Build_HUBInfo_C-Class
ClassLib.Build_HUBInfo_C = {}
---@type Build_MAMResearchInfo_C-Class
ClassLib.Build_MAMResearchInfo_C = {}
---@type Build_GameWeather_C-Class
ClassLib.Build_GameWeather_C = {}
---@type CircuitryBlueprintConnectionProxy-Class
ClassLib.CircuitryBlueprintConnectionProxy = {}
---@type Build_NetworkPole_C-Class
ClassLib.Build_NetworkPole_C = {}
---@type Build_NetworkWallPlug_C-Class
ClassLib.Build_NetworkWallPlug_C = {}
---@type Build_SmallNetworkWallPlug_C-Class
ClassLib.Build_SmallNetworkWallPlug_C = {}
---@type Build_ConveyorPoleWall_C-Class
ClassLib.Build_ConveyorPoleWall_C = {}
---@type Build_Blueprint_C-Class
ClassLib.Build_Blueprint_C = {}
---@type Build_WorkBenchIntegrated_C-Class
ClassLib.Build_WorkBenchIntegrated_C = {}
---@type Build_NetworkWallPlug_Double_C-Class
ClassLib.Build_NetworkWallPlug_Double_C = {}
---@type LargeControlPanel-Class
ClassLib.LargeControlPanel = {}
---@type ModulePanel-Class
ClassLib.ModulePanel = {}
---@type Build_MicroPanel1_Center_C-Class
ClassLib.Build_MicroPanel1_Center_C = {}
---@type Build_MicroPanel6_C-Class
ClassLib.Build_MicroPanel6_C = {}
---@type Build_MicroPanel1_C-Class
ClassLib.Build_MicroPanel1_C = {}
---@type Build_MicroPanel2_C-Class
ClassLib.Build_MicroPanel2_C = {}
---@type Build_MicroPanel3_C-Class
ClassLib.Build_MicroPanel3_C = {}
---@type LargeVerticalControlPanel-Class
ClassLib.LargeVerticalControlPanel = {}
---@type Build_HyperTubeWallHole_C-Class
ClassLib.Build_HyperTubeWallHole_C = {}
---@type Build_HyperTubeWallSupport_C-Class
ClassLib.Build_HyperTubeWallSupport_C = {}
---@type Build_LookoutTower_C-Class
ClassLib.Build_LookoutTower_C = {}
---@type Build_PipelineSupportWall_C-Class
ClassLib.Build_PipelineSupportWall_C = {}
---@type Build_PipelineSupportWallHole_C-Class
ClassLib.Build_PipelineSupportWallHole_C = {}
---@type Build_WorkBench_C-Class
ClassLib.Build_WorkBench_C = {}
---@type Build_Workshop_C-Class
ClassLib.Build_Workshop_C = {}
---@type Build_XmassTree_C-Class
ClassLib.Build_XmassTree_C = {}
---@type Build_WreathDecor_C-Class
ClassLib.Build_WreathDecor_C = {}
---@type Build_TetrominoGame_Computer_C-Class
ClassLib.Build_TetrominoGame_Computer_C = {}
---@type Train-Class
ClassLib.Train = {}
---@type PowerCircuit-Class
ClassLib.PowerCircuit = {}
---@type TimeTable-Class
ClassLib.TimeTable = {}
---@type TargetList-Class
ClassLib.TargetList = {}
---@type DimensionalDepot-Class
ClassLib.DimensionalDepot = {}
---@type ItemType-Class
ClassLib.ItemType = {}
---@type FINMediaSubsystem-Class
ClassLib.FINMediaSubsystem = {}
---@type ItemCategory-Class
ClassLib.ItemCategory = {}
---@type Recipe-Class
ClassLib.Recipe = {}
---@type SignType-Class
ClassLib.SignType = {}
---@type ReflectionBase-Class
ClassLib.ReflectionBase = {}
---@type Property-Class
ClassLib.Property = {}
---@type ArrayProperty-Class
ClassLib.ArrayProperty = {}
---@type ClassProperty-Class
ClassLib.ClassProperty = {}
---@type ObjectProperty-Class
ClassLib.ObjectProperty = {}
---@type StructProperty-Class
ClassLib.StructProperty = {}
---@type TraceProperty-Class
ClassLib.TraceProperty = {}
---@type Struct-Class
ClassLib.Struct = {}
---@type Class-Class
ClassLib.Class = {}
---@type Function-Class
ClassLib.Function = {}
---@type Signal-Class
ClassLib.Signal = {}
---@type FGBuildableDecor-Class
ClassLib.FGBuildableDecor = {}
---@type FGBuildableSpeedSign-Class
ClassLib.FGBuildableSpeedSign = {}
---@type FGBuildableWindTurbine-Class
ClassLib.FGBuildableWindTurbine = {}
--- A peseudo table that can be used to look up classes/types.
--- Ideal usage of it is `classes.Inventory`.
--- Since the type lookup occurs in the metatable-function, you can still use the []-Operator in the case
--- you want to look up something based on a dynamic string e.g. `structs[myStringVar]` works just fine.
---@type ClassLib
classes = nil


--- 
---@class Object
Object = {}

--- Functions of the reflection system are not directly Lua Functions, instead they are this type.
--- This has various reason, but one neat thing it allows us to do, is to provide documentation capabilities.
--- Instead of just calling it, you can also ask for information about the function it self.
--- And it makes debugging a bit easier.
---@class ReflectionFunction
ReflectionFunction = {}

--- Returns the Reflection-System Object that represents this Reflected Function.
--- This way you can deeply inspect the function and its associations.
---@type Function
ReflectionFunction.asFunctionObject = nil


--- A string containing the signature and description of the function for quick way to get info one the function within code.
---@type string
ReflectionFunction.quickRef = nil


--- Calls the function deferred in the next tick. Returns a Future to allow check for execution and get the return parameters.
---@type function
ReflectionFunction.callDeferred = nil


--- 
---@class Struct
Struct = {}

--- 
---@class StructType
StructType = {}

--- 
---@class StructLib
StructLib = {}

---@type fun(table):Vector
function StructLib.Vector(t) end
---@type fun(table):Vector2D
function StructLib.Vector2D(t) end
---@type fun(table):Color
function StructLib.Color(t) end
---@type fun(table):Rotator
function StructLib.Rotator(t) end
---@type fun(table):Vector4
function StructLib.Vector4(t) end
---@type fun(table):Margin
function StructLib.Margin(t) end
---@type fun(table):Item
function StructLib.Item(t) end
---@type fun(table):ItemStack
function StructLib.ItemStack(t) end
---@type fun(table):ItemAmount
function StructLib.ItemAmount(t) end
---@type fun(table):IconData
function StructLib.IconData(t) end
---@type fun(table):TrainDockingRuleSet
function StructLib.TrainDockingRuleSet(t) end
---@type fun(table):PrefabSignData
function StructLib.PrefabSignData(t) end
---@type fun(table):LogEntry
function StructLib.LogEntry(t) end
---@type fun(table):RailroadSignalBlock
function StructLib.RailroadSignalBlock(t) end
---@type fun(table):TargetPoint
function StructLib.TargetPoint(t) end
---@type fun(table):TimeTableStop
function StructLib.TimeTableStop(t) end
---@type fun(table):TrackGraph
function StructLib.TrackGraph(t) end
---@type fun(table):Future
function StructLib.Future(t) end
---@type fun(table):GPUT1Buffer
function StructLib.GPUT1Buffer(t) end
---@type fun(table):GPUT2DrawCallBox
function StructLib.GPUT2DrawCallBox(t) end
---@type fun(table):EventFilter
function StructLib.EventFilter(t) end
--- A peseudo table that can be used to look up struct types (which can then be used to easily construct a struct of that type).
--- Ideal usage of it is `structs.MyStruct` (with a Constructor `structs.Vector(x,y,z)`).
--- Since the type lookup occurs in the metatable-function, you can still use the []-Operator in the case
--- you want to look up something based on a dynamic string e.g. `structs[myStringVar]` works just fine.
---@type StructLib
structs = nil


--- The base class of every object.
---@class Object
---@field public hash integer A Hash of this object. This is a value that nearly uniquely identifies this object.
---@field public internalName string The unreal engine internal name of this object.
---@field public internalPath string The unreal engine internal path name of this object.
---@field public nick string **Only available for Network Components!** Allows access to the Network Components Nick.
---@field public id string **Only available for Network Components!** Allows access to the Network Components UUID.
---@field public isNetworkComponent boolean True if this object is a network component and has a id and nick.
Object = {}
--- Returns a hash of this object. This is a value that nearly uniquely identifies this object.
---@return integer hash The hash of this object.
---@type (fun(self:Object):(hash:integer))|ReflectionFunction
function Object:getHash() end
--- Returns the type (aka class) of this object.
---@return Class type The type of this object
---@type (fun(self:Object):(type:Class))|ReflectionFunction
function Object:getType() end
--- Checks if this Object is a child of the given typen.
---@param parent Object-Class The parent we check if this object is a child of.
---@return boolean isChild True if this object is a child of the given type.
---@type (fun(self:Object,parent:Object-Class):(isChild:boolean))|ReflectionFunction
function Object:isA(parent) end
--- The base class of every object.
---@class Object-Class
---@field public hash integer A Hash of this object. This is a value that nearly uniquely identifies this object.
---@field public internalName string The unreal engine internal name of this object.
---@field public internalPath string The unreal engine internal path name of this object.
Object_Class = {}
--- Returns the hash of this class. This is a value that nearly uniquely idenfies this object.
---@return integer hash The hash of this class.
---@type (fun(self:Object-Class):(hash:integer))|ReflectionFunction
function Object_Class:getHash() end
--- Returns the type (aka class) of this class instance.
---@return Class type The type of this class instance
---@type (fun(self:Object-Class):(type:Class))|ReflectionFunction
function Object_Class:getType() end
--- Checks if this Type is a child of the given typen.
---@param parent Object-Class The parent we check if this type is a child of.
---@return boolean isChild True if this type is a child of the given type.
---@type (fun(self:Object-Class,parent:Object-Class):(isChild:boolean))|ReflectionFunction
function Object_Class:isChildOf(parent) end

--- Descibes a layout of a sign.
---@class SignPrefab : Object
SignPrefab = {}
--- Descibes a layout of a sign.
---@class SignPrefab-Class : Object-Class
SignPrefab_Class = {}

--- A component/part of an actor in the world.
---@class ActorComponent : Object
---@field public owner Actor The parent actor of which this component is part of
ActorComponent = {}
--- A component/part of an actor in the world.
---@class ActorComponent-Class : Object-Class
ActorComponent_Class = {}

--- This is the base class of all things that can exist within the world by them self.
---@class Actor : Object
---@field public location Vector The location of the actor in the world.
---@field public scale Vector The scale of the actor in the world.
---@field public rotation Rotator The rotation of the actor in the world.
Actor = {}
--- Returns a list of power connectors this actor might have.
---@return PowerConnection[] connectors The power connectors this actor has.
---@type (fun(self:Actor):(connectors:PowerConnection[]))|ReflectionFunction
function Actor:getPowerConnectors() end
--- Returns a list of factory connectors this actor might have.
---@return FactoryConnection[] connectors The factory connectors this actor has.
---@type (fun(self:Actor):(connectors:FactoryConnection[]))|ReflectionFunction
function Actor:getFactoryConnectors() end
--- Returns a list of pipe (fluid & hyper) connectors this actor might have.
---@return PipeConnectionBase[] connectors The pipe connectors this actor has.
---@type (fun(self:Actor):(connectors:PipeConnectionBase[]))|ReflectionFunction
function Actor:getPipeConnectors() end
--- Returns a list of inventories this actor might have.
---@return Inventory[] inventories The inventories this actor has.
---@type (fun(self:Actor):(inventories:Inventory[]))|ReflectionFunction
function Actor:getInventories() end
--- Returns the components that make-up this actor.
---@param componentType ActorComponent-Class The class will be used as filter.
---@return ActorComponent[] components The components of this actor.
---@type (fun(self:Actor,componentType:ActorComponent-Class):(components:ActorComponent[]))|ReflectionFunction
function Actor:getComponents(componentType) end
--- Returns the name of network connectors this actor might have.
---@return ActorComponent[] connectors The factory connectors this actor has.
---@type (fun(self:Actor):(connectors:ActorComponent[]))|ReflectionFunction
function Actor:getNetworkConnectors() end
--- This is the base class of all things that can exist within the world by them self.
---@class Actor-Class : Object-Class
Actor_Class = {}

--- A actor component that allows for a connection point to the power network. Basically a point were a power cable can get attached to.
---@class PowerConnection : ActorComponent
---@field public connections integer The amount of connections this power connection has.
---@field public maxConnections integer The maximum amount of connections this power connection can handle.
PowerConnection = {}
--- Returns the power info component of this power connection.
---@return PowerInfo power The power info compoent this power connection uses.
---@type (fun(self:PowerConnection):(power:PowerInfo))|ReflectionFunction
function PowerConnection:getPower() end
--- Returns the power circuit to which this connection component is attached to.
---@return PowerCircuit circuit The Power Circuit this connection component is attached to.
---@type (fun(self:PowerConnection):(circuit:PowerCircuit))|ReflectionFunction
function PowerConnection:getCircuit() end
--- A actor component that allows for a connection point to the power network. Basically a point were a power cable can get attached to.
---@class PowerConnection-Class : ActorComponent-Class
PowerConnection_Class = {}

--- A actor component that is a connection point to which a conveyor or pipe can get attached to.
---@class FactoryConnection : ActorComponent
---@field public type integer Returns the type of the connection. 0 = Conveyor, 1 = Pipe
---@field public direction integer The direction in which the items/fluids flow. 0 = Input, 1 = Output, 2 = Any, 3 = Used just as snap point
---@field public isConnected boolean True if something is connected to this connection.
---@field public allowedItem ItemType-Class This item type defines which items are the only ones this connector can transfer. Null allows all items to be transfered.
---@field public blocked boolean True if this connector doesn't transfer any items except the 'Unblocked Transfers'.
---@field public unblockedTransfers integer The count of transfers that can still happen even if the connector is blocked. Use the 'AddUnblockedTransfers' function to change this. The count decreases by one when an item gets transfered.
FactoryConnection = {}
--- Adds the given count to the unblocked transfers counter. The resulting value gets clamped to >= 0. Negative values allow to decrease the counter manually. The returning int is the now set count.
---@param unblockedTransfers integer The count of unblocked transfers to add.
---@return integer newUnblockedTransfers The new count of unblocked transfers.
---@type (fun(self:FactoryConnection,unblockedTransfers:integer):(newUnblockedTransfers:integer))|ReflectionFunction
function FactoryConnection:addUnblockedTransfers(unblockedTransfers) end
--- Returns the internal inventory of the connection component.
---@return Inventory inventory The internal inventory of the connection component.
---@type (fun(self:FactoryConnection):(inventory:Inventory))|ReflectionFunction
function FactoryConnection:getInventory() end
--- Returns the connected factory connection component.
---@return FactoryConnection connected The connected factory connection component.
---@type (fun(self:FactoryConnection):(connected:FactoryConnection))|ReflectionFunction
function FactoryConnection:getConnected() end
--- A actor component that is a connection point to which a conveyor or pipe can get attached to.
---@class FactoryConnection-Class : ActorComponent-Class
FactoryConnection_Class = {}

--- A actor component base that is a connection point to which a pipe for fluid or hyper can get attached to.
---@class PipeConnectionBase : ActorComponent
---@field public isConnected boolean True if something is connected to this connection.
PipeConnectionBase = {}
--- Returns the connected pipe connection component.
---@return PipeConnectionBase connected The connected pipe connection component.
---@type (fun(self:PipeConnectionBase):(connected:PipeConnectionBase))|ReflectionFunction
function PipeConnectionBase:getConnection() end
--- A actor component base that is a connection point to which a pipe for fluid or hyper can get attached to.
---@class PipeConnectionBase-Class : ActorComponent-Class
PipeConnectionBase_Class = {}

--- A actor component that is a connection point to which a fluid pipe can get attached to.
---@class PipeConnection : PipeConnectionBase
---@field public fluidBoxContent number Returns the amount of fluid this fluid container contains
---@field public fluidBoxHeight number Returns the height of this fluid container
---@field public fluidBoxLaminarHeight number Returns the laminar height of this fluid container
---@field public fluidBoxFlowThrough number Returns the amount of fluid flowing through this fluid container
---@field public fluidBoxFlowFill number Returns the fill rate of this fluid container
---@field public fluidBoxFlowDrain number Returns the drain rate of this fluid container
---@field public fluidBoxFlowLimit number Returns the the maximum flow limit of this fluid container
---@field public networkID integer Returns the network ID of the pipe network this connection is associated with
PipeConnection = {}
--- ?
---@return ItemType fluidDescriptor ?
---@type (fun(self:PipeConnection):(fluidDescriptor:ItemType))|ReflectionFunction
function PipeConnection:getFluidDescriptor() end
--- Flush the associated pipe network
---@type (fun(self:PipeConnection))|ReflectionFunction
function PipeConnection:flushPipeNetwork() end
--- A actor component that is a connection point to which a fluid pipe can get attached to.
---@class PipeConnection-Class : PipeConnectionBase-Class
PipeConnection_Class = {}

--- This is a actor component for railroad tracks that allows to connecto to other track connections and so to connection multiple tracks with each eather so you can build a train network.
---@class RailroadTrackConnection : ActorComponent
---@field public connectorLocation Vector The world location of the the connection.
---@field public connectorNormal Vector The normal vecotr of the connector.
---@field public isConnected boolean True if the connection has any connection to other connections.
---@field public isFacingSwitch boolean True if this connection is pointing to the merge/spread point of the switch.
---@field public isTrailingSwitch boolean True if this connection is pointing away from the merge/spread point of a switch.
---@field public numSwitchPositions integer Returns the number of different switch poisitions this switch can have.
RailroadTrackConnection = {}
--- Returns the connected connection with the given index.
---@param index integer The index of the connected connection you want to get.
---@return RailroadTrackConnection connection The connected connection at the given index.
---@type (fun(self:RailroadTrackConnection,index:integer):(connection:RailroadTrackConnection))|ReflectionFunction
function RailroadTrackConnection:getConnection(index) end
--- Returns a list of all connected connections.
---@return RailroadTrackConnection[] connections A list of all connected connections.
---@type (fun(self:RailroadTrackConnection):(connections:RailroadTrackConnection[]))|ReflectionFunction
function RailroadTrackConnection:getConnections() end
--- Returns the track pos at which this connection is.
---@return RailroadTrack track The track the track pos points to.
---@return number offset The offset of the track pos.
---@return number forward The forward direction of the track pos. 1 = with the track direction, -1 = against the track direction
---@type (fun(self:RailroadTrackConnection):(track:RailroadTrack,offset:number,forward:number))|ReflectionFunction
function RailroadTrackConnection:getTrackPos() end
--- Returns the track of which this connection is part of.
---@return RailroadTrack track The track of which this connection is part of.
---@type (fun(self:RailroadTrackConnection):(track:RailroadTrack))|ReflectionFunction
function RailroadTrackConnection:getTrack() end
--- Returns the switch control of this connection.
---@return RailroadSwitchControl switchControl The switch control of this connection.
---@type (fun(self:RailroadTrackConnection):(switchControl:RailroadSwitchControl))|ReflectionFunction
function RailroadTrackConnection:getSwitchControl() end
--- Returns the station of which this connection is part of.
---@return RailroadStation station The station of which this connection is part of.
---@type (fun(self:RailroadTrackConnection):(station:RailroadStation))|ReflectionFunction
function RailroadTrackConnection:getStation() end
--- Returns the signal this connection is facing to.
---@return RailroadSignal signal The signal this connection is facing.
---@type (fun(self:RailroadTrackConnection):(signal:RailroadSignal))|ReflectionFunction
function RailroadTrackConnection:getFacingSignal() end
--- Returns the signal this connection is trailing from.
---@return RailroadSignal signal The signal this connection is trailing.
---@type (fun(self:RailroadTrackConnection):(signal:RailroadSignal))|ReflectionFunction
function RailroadTrackConnection:getTrailingSignal() end
--- Returns the opposite connection of the track this connection is part of.
---@return RailroadTrackConnection opposite The opposite connection of the track this connection is part of.
---@type (fun(self:RailroadTrackConnection):(opposite:RailroadTrackConnection))|ReflectionFunction
function RailroadTrackConnection:getOpposite() end
--- Returns the next connection in the direction of the track. (used the correct path switched point to)
---@return RailroadTrackConnection next The next connection in the direction of the track.
---@type (fun(self:RailroadTrackConnection):(next:RailroadTrackConnection))|ReflectionFunction
function RailroadTrackConnection:getNext() end
--- Sets the position (connection index) to which the track switch points to.
---@param index integer The connection index to which the switch should point to.
---@type (fun(self:RailroadTrackConnection,index:integer))|ReflectionFunction
function RailroadTrackConnection:setSwitchPosition(index) end
--- Returns the current switch position.
---@return integer index The index of the connection connection the switch currently points to.
---@type (fun(self:RailroadTrackConnection):(index:integer))|ReflectionFunction
function RailroadTrackConnection:getSwitchPosition() end
--- Forces the switch position to a given location. Even autopilot will be forced to use this track. A negative number can be used to remove the forced track.
---@param index integer The connection index to whcih the switch should be force to point to. Negative number to remove the lock.
---@return Future_RailroadTrackConnection_forceSwitchPosition
---@type (fun(self:RailroadTrackConnection,index:integer))|ReflectionFunction
function RailroadTrackConnection:forceSwitchPosition(index) end
---@class Future_RailroadTrackConnection_forceSwitchPosition : Future
Future_RailroadTrackConnection_forceSwitchPosition = {}
---@type fun(self:Future_RailroadTrackConnection_forceSwitchPosition)
function Future_RailroadTrackConnection_forceSwitchPosition:await() end
---@type fun(self:Future_RailroadTrackConnection_forceSwitchPosition)
function Future_RailroadTrackConnection_forceSwitchPosition:get() end
---@type fun(self:Future_RailroadTrackConnection_forceSwitchPosition):boolean
function Future_RailroadTrackConnection_forceSwitchPosition:canGet() end
--- This is a actor component for railroad tracks that allows to connecto to other track connections and so to connection multiple tracks with each eather so you can build a train network.
---@class RailroadTrackConnection-Class : ActorComponent-Class
RailroadTrackConnection_Class = {}

--- A component that is used to connect two Train Platforms together.
---@class TrainPlatformConnection : ActorComponent
---@field public connected TrainPlatformConnection The connected train platform connection.
---@field public trackConnection RailroadTrackConnection The associated railroad track connection.
---@field public platformOwner TrainPlatform The train platform that owns this platform connection component.
---@field public connectionType integer The type of this train platform connection.<br>0 = Out<br>1 = In<br>2 = Neutral
TrainPlatformConnection = {}
--- A component that is used to connect two Train Platforms together.
---@class TrainPlatformConnection-Class : ActorComponent-Class
TrainPlatformConnection_Class = {}

--- 
---@class FINAdvancedNetworkConnectionComponent : ActorComponent
FINAdvancedNetworkConnectionComponent = {}
--- 
---@class FINAdvancedNetworkConnectionComponent-Class : ActorComponent-Class
FINAdvancedNetworkConnectionComponent_Class = {}

--- 
---@class FINMCPAdvConnector : FINAdvancedNetworkConnectionComponent
FINMCPAdvConnector = {}
--- 
---@class FINMCPAdvConnector-Class : FINAdvancedNetworkConnectionComponent-Class
FINMCPAdvConnector_Class = {}

--- This actor component contains all the infomation about the movement of a railroad vehicle.
---@class RailroadVehicleMovement : ActorComponent
---@field public orientation number The orientation of the vehicle
---@field public mass number The current mass of the vehicle.
---@field public tareMass number The tare mass of the vehicle.
---@field public payloadMass number The mass of the payload of the vehicle.
---@field public speed number The current forward speed of the vehicle.
---@field public relativeSpeed number The current relative forward speed to the ground.
---@field public maxSpeed number The maximum forward speed the vehicle can reach.
---@field public gravitationalForce number The current gravitational force acting on the vehicle.
---@field public tractiveForce number The current tractive force acting on the vehicle.
---@field public resistiveForce number The resistive force currently acting on the vehicle.
---@field public gradientForce number The gradient force currently acting on the vehicle.
---@field public brakingForce number The braking force currently acting on the vehicle.
---@field public airBrakingForce number The air braking force currently acting on the vehicle.
---@field public dynamicBrakingForce number The dynamic braking force currently acting on the vehicle.
---@field public maxTractiveEffort number The maximum tractive effort of this vehicle.
---@field public maxDynamicBrakingEffort number The maximum dynamic braking effort of this vehicle.
---@field public maxAirBrakingEffort number The maximum air braking effort of this vehicle.
---@field public trackGrade number The current track grade of this vehicle.
---@field public trackCurvature number The current track curvature of this vehicle.
---@field public wheelsetAngle number The wheelset angle of this vehicle.
---@field public rollingResistance number The current rolling resistance of this vehicle.
---@field public curvatureResistance number The current curvature resistance of this vehicle.
---@field public airResistance number The current air resistance of this vehicle.
---@field public gradientResistance number The current gardient resistance of this vehicle.
---@field public wheelRotation number The current wheel rotation of this vehicle.
---@field public numWheelsets integer The number of wheelsets this vehicle has.
---@field public isMoving boolean True if this vehicle is currently moving.
RailroadVehicleMovement = {}
--- Returns the vehicle this movement component holds the movement information of.
---@return RailroadVehicle vehicle The vehicle this movement component holds the movement information of.
---@type (fun(self:RailroadVehicleMovement):(vehicle:RailroadVehicle))|ReflectionFunction
function RailroadVehicleMovement:getVehicle() end
--- Returns the current rotation of the given wheelset.
---@param wheelset integer The index of the wheelset you want to get the rotation of.
---@return number x The wheelset's rotation X component.
---@return number y The wheelset's rotation Y component.
---@return number z The wheelset's rotation Z component.
---@type (fun(self:RailroadVehicleMovement,wheelset:integer):(x:number,y:number,z:number))|ReflectionFunction
function RailroadVehicleMovement:getWheelsetRotation(wheelset) end
--- Returns the offset of the wheelset with the given index from the start of the vehicle.
---@param wheelset integer The index of the wheelset you want to get the offset of.
---@return number offset The offset of the wheelset.
---@type (fun(self:RailroadVehicleMovement,wheelset:integer):(offset:number))|ReflectionFunction
function RailroadVehicleMovement:getWheelsetOffset(wheelset) end
--- Returns the normal vector and the extention of the coupler with the given index.
---@param coupler integer The index of which you want to get the normal and extention of.
---@return number x The X component of the coupler normal.
---@return number y The Y component of the coupler normal.
---@return number z The Z component of the coupler normal.
---@return number extention The extention of the coupler.
---@type (fun(self:RailroadVehicleMovement,coupler:integer):(x:number,y:number,z:number,extention:number))|ReflectionFunction
function RailroadVehicleMovement:getCouplerRotationAndExtention(coupler) end
--- This actor component contains all the infomation about the movement of a railroad vehicle.
---@class RailroadVehicleMovement-Class : ActorComponent-Class
RailroadVehicleMovement_Class = {}

--- A actor component that can hold multiple item stacks.
--- WARNING! Be aware of container inventories, and never open their UI, otherwise these function will not work as expected.
---@class Inventory : ActorComponent
---@field public itemCount integer The absolute amount of items in the whole inventory.
---@field public size integer The count of available item stack slots this inventory has.
Inventory = {}
--- Returns the item stack at the given index.
--- Takes integers as input and returns the corresponding stacks.
---@param ... any
---@type (fun(self:Inventory,...:any))|ReflectionFunction
function Inventory:getStack(...) end
--- Sorts the whole inventory. (like the middle mouse click into a inventory)
---@type (fun(self:Inventory))|ReflectionFunction
function Inventory:sort() end
--- Swaps two given stacks inside the inventory.
---@param index1 integer The index of the first stack in the inventory.
---@param index2 integer The index of the second stack in the inventory.
---@return boolean successful True if the swap was successful.
---@type (fun(self:Inventory,index1:integer,index2:integer):(successful:boolean))|ReflectionFunction
function Inventory:swapStacks(index1, index2) end
--- Removes all discardable items from the inventory completely. They will be gone! No way to get them back!
---@return Future_Inventory_flush
---@type (fun(self:Inventory))|ReflectionFunction
function Inventory:flush() end
---@class Future_Inventory_flush : Future
Future_Inventory_flush = {}
---@type fun(self:Future_Inventory_flush)
function Future_Inventory_flush:await() end
---@type fun(self:Future_Inventory_flush)
function Future_Inventory_flush:get() end
---@type fun(self:Future_Inventory_flush):boolean
function Future_Inventory_flush:canGet() end
--- Returns true if the item stack at the given index can be split.
---@param index integer The slot index of which you want to check if the stack can be split.
---@return boolean canSplit True if the stack at the given index can be split.
---@type (fun(self:Inventory,index:integer):(canSplit:boolean))|ReflectionFunction
function Inventory:canSplitAtIndex(index) end
--- Tries to split the stack at the given index and puts the given amount of items into a free slot.
---@param index integer The index of the stack you want to split.
---@param num integer The number of items you want to split off the stack at the given index.
---@type (fun(self:Inventory,index:integer,num:integer))|ReflectionFunction
function Inventory:splitAtIndex(index, num) end
--- A actor component that can hold multiple item stacks.
--- WARNING! Be aware of container inventories, and never open their UI, otherwise these function will not work as expected.
---@class Inventory-Class : ActorComponent-Class
Inventory_Class = {}

--- A actor component that provides information and mainly statistics about the power connection it is attached to.
---@class PowerInfo : ActorComponent
---@field public dynProduction number The production cpacity this connection provided last tick.
---@field public baseProduction number The base production capactiy this connection always provides.
---@field public maxDynProduction number The maximum production capactiy this connection could have provided to the circuit in the last tick.
---@field public targetConsumption number The amount of energy the connection wanted to consume from the circuit in the last tick.
---@field public consumption number The amount of energy the connection actually consumed in the last tick.
---@field public hasPower boolean True if the connection has satisfied power values and counts as beeing powered. (True if it has power)
PowerInfo = {}
--- Returns the power circuit this info component is part of.
---@return PowerCircuit circuit The Power Circuit this info component is attached to.
---@type (fun(self:PowerInfo):(circuit:PowerCircuit))|ReflectionFunction
function PowerInfo:getCircuit() end
--- A actor component that provides information and mainly statistics about the power connection it is attached to.
---@class PowerInfo-Class : ActorComponent-Class
PowerInfo_Class = {}

--- A base class for all vehicles.
---@class Vehicle : Actor
---@field public health number The health of the vehicle.
---@field public maxHealth number The maximum amount of health this vehicle can have.
---@field public isSelfDriving boolean True if the vehicle is currently self driving.
Vehicle = {}
--- A base class for all vehicles.
---@class Vehicle-Class : Actor-Class
Vehicle_Class = {}

--- The base class for any vehicle that drives on train tracks.
---@class RailroadVehicle : Vehicle
---@field public length number The length of this vehicle on the track.
---@field public isDocked boolean True if this vehicle is currently docked to a platform.
---@field public isReversed boolean True if the vheicle is placed reversed on the track.
RailroadVehicle = {}
--- Returns the train of which this vehicle is part of.
---@return Train train The train of which this vehicle is part of
---@type (fun(self:RailroadVehicle):(train:Train))|ReflectionFunction
function RailroadVehicle:getTrain() end
--- Allows to check if the given coupler is coupled to another car.
---@param coupler integer The Coupler you want to check. 0 = Front, 1 = Back
---@return boolean coupled True of the give coupler is coupled to another car.
---@type (fun(self:RailroadVehicle,coupler:integer):(coupled:boolean))|ReflectionFunction
function RailroadVehicle:isCoupled(coupler) end
--- Allows to get the coupled vehicle at the given coupler.
---@param coupler integer The Coupler you want to get the car from. 0 = Front, 1 = Back
---@return RailroadVehicle coupled The coupled car of the given coupler is coupled to another car.
---@type (fun(self:RailroadVehicle,coupler:integer):(coupled:RailroadVehicle))|ReflectionFunction
function RailroadVehicle:getCoupled(coupler) end
--- Returns the track graph of which this vehicle is part of.
---@return TrackGraph track The track graph of which this vehicle is part of.
---@type (fun(self:RailroadVehicle):(track:TrackGraph))|ReflectionFunction
function RailroadVehicle:getTrackGraph() end
--- Returns the track pos at which this vehicle is.
---@return RailroadTrack track The track the track pos points to.
---@return number offset The offset of the track pos.
---@return number forward The forward direction of the track pos. 1 = with the track direction, -1 = against the track direction
---@type (fun(self:RailroadVehicle):(track:RailroadTrack,offset:number,forward:number))|ReflectionFunction
function RailroadVehicle:getTrackPos() end
--- Returns the vehicle movement of this vehicle.
---@return RailroadVehicleMovement movement The movement of this vehicle.
---@type (fun(self:RailroadVehicle):(movement:RailroadVehicleMovement))|ReflectionFunction
function RailroadVehicle:getMovement() end
--- The base class for any vehicle that drives on train tracks.
---@class RailroadVehicle-Class : Vehicle-Class
RailroadVehicle_Class = {}

--- The base class for all vehicles that used wheels for movement.
---@class WheeledVehicle : Vehicle
---@field public speed number The current forward speed of this vehicle.
---@field public burnRatio number The amount of fuel this vehicle burns.
---@field public hasFuel boolean True if the vehicle has currently fuel to drive.
WheeledVehicle = {}
--- Returns the inventory that contains the fuel of the vehicle.
---@return Inventory inventory The fuel inventory of the vehicle.
---@type (fun(self:WheeledVehicle):(inventory:Inventory))|ReflectionFunction
function WheeledVehicle:getFuelInv() end
--- Returns the inventory that contains the storage of the vehicle.
---@return Inventory inventory The storage inventory of the vehicle.
---@type (fun(self:WheeledVehicle):(inventory:Inventory))|ReflectionFunction
function WheeledVehicle:getStorageInv() end
--- Allows to check if the given item type is a valid fuel for this vehicle.
---@param item ItemType-Class The item type you want to check.
---@return boolean isValid True if the given item type is a valid fuel for this vehicle.
---@type (fun(self:WheeledVehicle,item:ItemType-Class):(isValid:boolean))|ReflectionFunction
function WheeledVehicle:isValidFuel(item) end
--- Returns the index of the target that the vehicle tries to move to right now.
---@return integer index The index of the current target.
---@type (fun(self:WheeledVehicle):(index:integer))|ReflectionFunction
function WheeledVehicle:getCurrentTarget() end
--- Sets the current target to the next target in the list.
---@type (fun(self:WheeledVehicle))|ReflectionFunction
function WheeledVehicle:nextTarget() end
--- Sets the target with the given index as the target this vehicle tries to move to right now.
---@param index integer The index of the target this vehicle should move to now.
---@type (fun(self:WheeledVehicle,index:integer))|ReflectionFunction
function WheeledVehicle:setCurrentTarget(index) end
--- Returns the list of targets/path waypoints.
---@return TargetList targetList The list of targets/path-waypoints.
---@type (fun(self:WheeledVehicle):(targetList:TargetList))|ReflectionFunction
function WheeledVehicle:getTargetList() end
--- The base class for all vehicles that used wheels for movement.
---@class WheeledVehicle-Class : Vehicle-Class
WheeledVehicle_Class = {}

--- 
---@class FGBuildableConveyorAttachment : Buildable
FGBuildableConveyorAttachment = {}
--- 
---@class FGBuildableConveyorAttachment-Class : Buildable-Class
FGBuildableConveyorAttachment_Class = {}

--- The base class of all buildables.
---@class Buildable : Actor
---@field public numPowerConnections integer The count of available power connections this building has.
---@field public numFactoryConnections integer The cound of available factory connections this building has.
---@field public numFactoryOutputConnections integer The count of available factory output connections this building has.
Buildable = {}
--- The base class of all buildables.
---@class Buildable-Class : Actor-Class
Buildable_Class = {}

--- 
---@class FGBuildableAttachmentMerger : FGBuildableConveyorAttachment
FGBuildableAttachmentMerger = {}
--- 
---@class FGBuildableAttachmentMerger-Class : FGBuildableConveyorAttachment-Class
FGBuildableAttachmentMerger_Class = {}

--- Merges up to three Conveyor Belts into one.
---@class Build_ConveyorAttachmentMerger_C : FGBuildableAttachmentMerger
Build_ConveyorAttachmentMerger_C = {}
--- Merges up to three Conveyor Belts into one.
---@class Build_ConveyorAttachmentMerger_C-Class : FGBuildableAttachmentMerger-Class
Build_ConveyorAttachmentMerger_C_Class = {}

--- 
---@class FGBuildableAttachmentSplitter : FGBuildableConveyorAttachment
FGBuildableAttachmentSplitter = {}
--- 
---@class FGBuildableAttachmentSplitter-Class : FGBuildableConveyorAttachment-Class
FGBuildableAttachmentSplitter_Class = {}

--- Splits one Conveyor Belt into two or three. 
--- Useful for diverting parts and resources away from backlogged Conveyor Belts.
---@class Build_ConveyorAttachmentSplitter_C : FGBuildableAttachmentSplitter
Build_ConveyorAttachmentSplitter_C = {}
--- Splits one Conveyor Belt into two or three. 
--- Useful for diverting parts and resources away from backlogged Conveyor Belts.
---@class Build_ConveyorAttachmentSplitter_C-Class : FGBuildableAttachmentSplitter-Class
Build_ConveyorAttachmentSplitter_C_Class = {}

--- 
---@class FGBuildableConveyorAttachmentLightweight : FGBuildableConveyorAttachment
FGBuildableConveyorAttachmentLightweight = {}
--- 
---@class FGBuildableConveyorAttachmentLightweight-Class : FGBuildableConveyorAttachment-Class
FGBuildableConveyorAttachmentLightweight_Class = {}

--- 
---@class FGBuildableSplitterSmart : FGBuildableConveyorAttachment
FGBuildableSplitterSmart = {}
--- 
---@class FGBuildableSplitterSmart-Class : FGBuildableConveyorAttachment-Class
FGBuildableSplitterSmart_Class = {}

--- Splits one Conveyor Belt into two or three. 
--- Multiple filters can be set for each output to allow specific parts to pass through.
---@class Build_ConveyorAttachmentSplitterProgrammable_C : FGBuildableSplitterSmart
Build_ConveyorAttachmentSplitterProgrammable_C = {}
--- Splits one Conveyor Belt into two or three. 
--- Multiple filters can be set for each output to allow specific parts to pass through.
---@class Build_ConveyorAttachmentSplitterProgrammable_C-Class : FGBuildableSplitterSmart-Class
Build_ConveyorAttachmentSplitterProgrammable_C_Class = {}

--- Splits one Conveyor Belt into two or three.
--- A filter can be set for each output to allow a specific part to pass through.
---@class Build_ConveyorAttachmentSplitterSmart_C : FGBuildableSplitterSmart
Build_ConveyorAttachmentSplitterSmart_C = {}
--- Splits one Conveyor Belt into two or three.
--- A filter can be set for each output to allow a specific part to pass through.
---@class Build_ConveyorAttachmentSplitterSmart_C-Class : FGBuildableSplitterSmart-Class
Build_ConveyorAttachmentSplitterSmart_C_Class = {}

--- 
---@class CodeableMerger : FGBuildableConveyorAttachment
---@field public canOutput boolean Is true if the output queue has a slot available for an item from one of the input queues.
CodeableMerger = {}
--- Allows to transfer an item from the given input queue to the output queue if possible.
---@param input integer The index of the input queue you want to transfer the next item to the output queue. (0 = right, 1 = middle, 2 = left)
---@return boolean transfered true if it was able to transfer the item.
---@type (fun(self:CodeableMerger,input:integer):(transfered:boolean))|ReflectionFunction
function CodeableMerger:transferItem(input) end
--- Returns the next item in the given input queue.
---@param input integer The index of the input queue you want to check (0 = right, 1 = middle, 2 = left)
---@return Item item The next item in the input queue.
---@type (fun(self:CodeableMerger,input:integer):(item:Item))|ReflectionFunction
function CodeableMerger:getInput(input) end
--- 
---@class CodeableMerger-Class : FGBuildableConveyorAttachment-Class
CodeableMerger_Class = {}

--- The FicsIt-Networks Codeable Merger  is able to get connected to the component network and provides functions and signals for custom merger behaviour defenition.
--- 
--- This allows you to change the merging behaviour in runtime by connected computers so it can f.e. depend on the amount of items in a storage container.
---@class Build_CodeableMerger_C : CodeableMerger
Build_CodeableMerger_C = {}
--- The FicsIt-Networks Codeable Merger  is able to get connected to the component network and provides functions and signals for custom merger behaviour defenition.
--- 
--- This allows you to change the merging behaviour in runtime by connected computers so it can f.e. depend on the amount of items in a storage container.
---@class Build_CodeableMerger_C-Class : CodeableMerger-Class
Build_CodeableMerger_C_Class = {}

--- 
---@class CodeableSplitter : FGBuildableConveyorAttachment
CodeableSplitter = {}
--- Allows to transfer an item from the input queue to the given output queue if possible.
---@param output integer The index of the output queue you want to transfer the next item to (0 = left, 1 = middle, 2 = right)
---@return boolean transfered true if it was able to transfer the item.
---@type (fun(self:CodeableSplitter,output:integer):(transfered:boolean))|ReflectionFunction
function CodeableSplitter:transferItem(output) end
--- Returns the next item in the input queue.
---@return Item item The next item in the input queue.
---@type (fun(self:CodeableSplitter):(item:Item))|ReflectionFunction
function CodeableSplitter:getInput() end
--- Returns the factory connector associated with the given index.
---@param outputIndex integer The integer used in TransferItem and ItemOutputted to reference a specific output. Valid Values: 0-3
---@return FactoryConnection ReturnValue 
---@type (fun(self:CodeableSplitter,outputIndex:integer):(ReturnValue:FactoryConnection))|ReflectionFunction
function CodeableSplitter:getConnectorByIndex(outputIndex) end
--- Allows to check if we can transfer an item to the given output queue.
---@param output integer The index of the output queue you want to check (0 = left, 1 = middle, 2 = right)
---@return Future_CodeableSplitter_canOutput
---@type (fun(self:CodeableSplitter,output:integer):(Future_CodeableSplitter_canOutput))|ReflectionFunction
function CodeableSplitter:canOutput(output) end
---@class Future_CodeableSplitter_canOutput : Future
Future_CodeableSplitter_canOutput = {}
---@type fun(self:Future_CodeableSplitter_canOutput):(canTransfer:boolean)
function Future_CodeableSplitter_canOutput:await() end
---@type fun(self:Future_CodeableSplitter_canOutput):(canTransfer:boolean)
function Future_CodeableSplitter_canOutput:get() end
---@type fun(self:Future_CodeableSplitter_canOutput):boolean
function Future_CodeableSplitter_canOutput:canGet() end
--- 
---@class CodeableSplitter-Class : FGBuildableConveyorAttachment-Class
CodeableSplitter_Class = {}

--- The FicsIt-Networks Codeable Splitter is able to get connected to the component network and provides functions and signals for custom splitter behaviour defenition.
--- 
--- This allows you to change the splitting behaviour in runtime by connected computers so it can f.e. depend on the amount of items in a storage container.
---@class Build_CodeableSplitter_C : CodeableSplitter
Build_CodeableSplitter_C = {}
--- The FicsIt-Networks Codeable Splitter is able to get connected to the component network and provides functions and signals for custom splitter behaviour defenition.
--- 
--- This allows you to change the splitting behaviour in runtime by connected computers so it can f.e. depend on the amount of items in a storage container.
---@class Build_CodeableSplitter_C-Class : CodeableSplitter-Class
Build_CodeableSplitter_C_Class = {}

--- Split the input into any ratio and set rules for what should happen when an output is blocked
---@class Build_RatioSplitter_C : FGBuildableConveyorAttachment
Build_RatioSplitter_C = {}
--- Split the input into any ratio and set rules for what should happen when an output is blocked
---@class Build_RatioSplitter_C-Class : FGBuildableConveyorAttachment-Class
Build_RatioSplitter_C_Class = {}

--- Merge the inputs with any ratio and set rules for what should happen when an input is empty
---@class Build_RatioMerger_C : FGBuildableConveyorAttachment
Build_RatioMerger_C = {}
--- Merge the inputs with any ratio and set rules for what should happen when an input is empty
---@class Build_RatioMerger_C-Class : FGBuildableConveyorAttachment-Class
Build_RatioMerger_C_Class = {}

--- 
---@class FGBuildableAutomatedWorkBench : Manufacturer
FGBuildableAutomatedWorkBench = {}
--- 
---@class FGBuildableAutomatedWorkBench-Class : Manufacturer-Class
FGBuildableAutomatedWorkBench_Class = {}

--- The base class of every machine that uses a recipe to produce something automatically.
---@class Manufacturer : Factory
Manufacturer = {}
--- Returns the currently set recipe of the manufacturer.
---@return Recipe-Class recipe The currently set recipe.
---@type (fun(self:Manufacturer):(recipe:Recipe-Class))|ReflectionFunction
function Manufacturer:getRecipe() end
--- Returns the list of recipes this manufacturer can get set to and process.
---@return Recipe-Class[] recipes The list of avalible recipes.
---@type (fun(self:Manufacturer):(recipes:Recipe-Class[]))|ReflectionFunction
function Manufacturer:getRecipes() end
--- Sets the currently producing recipe of this manufacturer.
---@param recipe Recipe-Class The recipe this manufacturer should produce.
---@return Future_Manufacturer_setRecipe
---@type (fun(self:Manufacturer,recipe:Recipe-Class):(Future_Manufacturer_setRecipe))|ReflectionFunction
function Manufacturer:setRecipe(recipe) end
---@class Future_Manufacturer_setRecipe : Future
Future_Manufacturer_setRecipe = {}
---@type fun(self:Future_Manufacturer_setRecipe):(gotSet:boolean)
function Future_Manufacturer_setRecipe:await() end
---@type fun(self:Future_Manufacturer_setRecipe):(gotSet:boolean)
function Future_Manufacturer_setRecipe:get() end
---@type fun(self:Future_Manufacturer_setRecipe):boolean
function Future_Manufacturer_setRecipe:canGet() end
--- Returns the input inventory of this manufacturer.
---@return Inventory inventory The input inventory of this manufacturer
---@type (fun(self:Manufacturer):(inventory:Inventory))|ReflectionFunction
function Manufacturer:getInputInv() end
--- Returns the output inventory of this manufacturer.
---@return Inventory inventory The output inventory of this manufacturer.
---@type (fun(self:Manufacturer):(inventory:Inventory))|ReflectionFunction
function Manufacturer:getOutputInv() end
--- The base class of every machine that uses a recipe to produce something automatically.
---@class Manufacturer-Class : Factory-Class
Manufacturer_Class = {}

--- The base class of most machines you can build.
---@class Factory : Buildable
---@field public progress number The current production progress of the current production cycle.
---@field public powerConsumProducing number The power consumption when producing.
---@field public productivity number The productivity of this factory.
---@field public cycleTime number The time that passes till one production cycle is finsihed.
---@field public canChangePotential boolean True if the factory can change its potential.
---@field public maxPotential number The maximum potential this factory can be set to (depending on the number of crystals).
---@field public minPotential number The minimum potential this factory needs to be set to.
---@field public maxDefaultPotential number The default maximum potential this factory can be set to.
---@field public currentPotential number The potential this factory is currently using.
---@field public potential number The potential this factory is currently set to and 'should'  use. (the overclock value)<br> 0 = 0%, 1 = 100%
---@field public potentialInventory Inventory The Inventory that holds the crystals used for potential.
---@field public canChangeProductionBoost boolean True if the factory can change its production boost.
---@field public maxProductionBoost number The maximum production boost this factory can be set to (depending on the number of shards).
---@field public maxDefaultProductionBoost number The maximum production boost this factory can be set to.
---@field public minDefaultProductionBoost number The minimum production boost this factory has to be set to.
---@field public currentProductionBoost number The current production boost this factory uses.
---@field public productionBoost number The current production boost this factory should use.
---@field public standby boolean True if the factory is in standby.
Factory = {}
--- Changes the potential this factory is currently set to and 'should' use. (the overclock value)
---@param potential number The potential that should be used.<br>0 = 0%, 1 = 100%
---@return Future_Factory_setPotential
---@type (fun(self:Factory,potential:number))|ReflectionFunction
function Factory:setPotential(potential) end
---@class Future_Factory_setPotential : Future
Future_Factory_setPotential = {}
---@type fun(self:Future_Factory_setPotential)
function Future_Factory_setPotential:await() end
---@type fun(self:Future_Factory_setPotential)
function Future_Factory_setPotential:get() end
---@type fun(self:Future_Factory_setPotential):boolean
function Future_Factory_setPotential:canGet() end
--- Changes the production boost this factory is currently set to and 'should' use.
---@param productionBoost number The production boost that should be used.<br>0 = 0%, 1 = 100%
---@return Future_Factory_setProductionBoost
---@type (fun(self:Factory,productionBoost:number))|ReflectionFunction
function Factory:setProductionBoost(productionBoost) end
---@class Future_Factory_setProductionBoost : Future
Future_Factory_setProductionBoost = {}
---@type fun(self:Future_Factory_setProductionBoost)
function Future_Factory_setProductionBoost:await() end
---@type fun(self:Future_Factory_setProductionBoost)
function Future_Factory_setProductionBoost:get() end
---@type fun(self:Future_Factory_setProductionBoost):boolean
function Future_Factory_setProductionBoost:canGet() end
--- The base class of most machines you can build.
---@class Factory-Class : Buildable-Class
Factory_Class = {}

--- text here
---@class Build_AutomatedWorkBench_C : FGBuildableAutomatedWorkBench
Build_AutomatedWorkBench_C = {}
--- text here
---@class Build_AutomatedWorkBench_C-Class : FGBuildableAutomatedWorkBench-Class
Build_AutomatedWorkBench_C_Class = {}

--- 
---@class FGBuildableManufacturerVariablePower : Manufacturer
FGBuildableManufacturerVariablePower = {}
--- 
---@class FGBuildableManufacturerVariablePower-Class : Manufacturer-Class
FGBuildableManufacturerVariablePower_Class = {}

--- Uses electromagnetic fields to propel particles to very high speeds and energies. The specific design allows for a variety of processes, including matter generation and conversion.
--- 
--- Warning: Power usage is extremely high and unstable, and varies per recipe.
---@class Build_HadronCollider_C : FGBuildableManufacturerVariablePower
Build_HadronCollider_C = {}
--- Uses electromagnetic fields to propel particles to very high speeds and energies. The specific design allows for a variety of processes, including matter generation and conversion.
--- 
--- Warning: Power usage is extremely high and unstable, and varies per recipe.
---@class Build_HadronCollider_C-Class : FGBuildableManufacturerVariablePower-Class
Build_HadronCollider_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- The FICSIT Particle Accelerator uses electromagnetic fields to propel particles to very high speeds and energies. The specific design allows for a variety of processes, such as matter generation and conversion.
--- 
--- Warning: Power usage is extremely high, unstable, and varies per recipe.
---@class Serie_Hadron_C : Build_HadronCollider_C
Serie_Hadron_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- The FICSIT Particle Accelerator uses electromagnetic fields to propel particles to very high speeds and energies. The specific design allows for a variety of processes, such as matter generation and conversion.
--- 
--- Warning: Power usage is extremely high, unstable, and varies per recipe.
---@class Serie_Hadron_C-Class : Build_HadronCollider_C-Class
Serie_Hadron_C_Class = {}

--- The Converter harnesses Reanimated SAM to enable precise matter and energy transmutation.
--- 
--- Warning: Power usage is very high and unstable.
---@class Build_Converter_C : FGBuildableManufacturerVariablePower
Build_Converter_C = {}
--- The Converter harnesses Reanimated SAM to enable precise matter and energy transmutation.
--- 
--- Warning: Power usage is very high and unstable.
---@class Build_Converter_C-Class : FGBuildableManufacturerVariablePower-Class
Build_Converter_C_Class = {}

--- The Quantum Encoder uses Excited Photonic Matter to produce the most complex of parts, controlling development up to the quantum level.
--- 
--- Warning: Power usage is extremely high and unstable.
---@class Build_QuantumEncoder_C : FGBuildableManufacturerVariablePower
Build_QuantumEncoder_C = {}
--- The Quantum Encoder uses Excited Photonic Matter to produce the most complex of parts, controlling development up to the quantum level.
--- 
--- Warning: Power usage is extremely high and unstable.
---@class Build_QuantumEncoder_C-Class : FGBuildableManufacturerVariablePower-Class
Build_QuantumEncoder_C_Class = {}

--- Packages and unpackages fluids.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both Conveyor Belt and Pipeline input and output ports so that a wide range of recipes can be automated.
---@class Build_Packager_C : Manufacturer
Build_Packager_C = {}
--- Packages and unpackages fluids.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both Conveyor Belt and Pipeline input and output ports so that a wide range of recipes can be automated.
---@class Build_Packager_C-Class : Manufacturer-Class
Build_Packager_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Used for the packaging and unpacking of fluids.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both a Conveyor Belt and Pipe input and output, to allow for the automation of various recipes.
---@class Serie_Packager_C : Build_Packager_C
Serie_Packager_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Used for the packaging and unpacking of fluids.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both a Conveyor Belt and Pipe input and output, to allow for the automation of various recipes.
---@class Serie_Packager_C-Class : Build_Packager_C-Class
Serie_Packager_C_Class = {}

--- Smelts ore into ingots.
--- 
--- Can be automated by feeding ore in via a Conveyor Belt connected to the input port. The resulting ingots can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_SmelterMk1_C : Manufacturer
Build_SmelterMk1_C = {}
--- Smelts ore into ingots.
--- 
--- Can be automated by feeding ore in via a Conveyor Belt connected to the input port. The resulting ingots can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_SmelterMk1_C-Class : Manufacturer-Class
Build_SmelterMk1_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Smelts ore into ingots.
--- 
--- Can be automated by feeding ore into it with a conveyor belt connected to the input. The produced ingots can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Smelt_C : Build_SmelterMk1_C
Serie_Smelt_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Smelts ore into ingots.
--- 
--- Can be automated by feeding ore into it with a conveyor belt connected to the input. The produced ingots can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Smelt_C-Class : Build_SmelterMk1_C-Class
Serie_Smelt_C_Class = {}

--- Crafts 1 part into another part.
--- 
--- Can be automated by feeding component parts in via a Conveyor Belt connected to the input port. The resulting parts can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_ConstructorMk1_C : Manufacturer
Build_ConstructorMk1_C = {}
--- Crafts 1 part into another part.
--- 
--- Can be automated by feeding component parts in via a Conveyor Belt connected to the input port. The resulting parts can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_ConstructorMk1_C-Class : Manufacturer-Class
Build_ConstructorMk1_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Crafts one part into another part.
--- 
--- Can be automated by feeding parts into it with a conveyor belt connected to the input. The produced parts can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Const_C : Build_ConstructorMk1_C
Serie_Const_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Crafts one part into another part.
--- 
--- Can be automated by feeding parts into it with a conveyor belt connected to the input. The produced parts can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Const_C-Class : Build_ConstructorMk1_C-Class
Serie_Const_C_Class = {}

--- Refines fluid and/or solid parts into other parts.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both Conveyor Belt and Pipeline input and output ports so that a wide range of recipes can be automated.
---@class Build_OilRefinery_C : Manufacturer
Build_OilRefinery_C = {}
--- Refines fluid and/or solid parts into other parts.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both Conveyor Belt and Pipeline input and output ports so that a wide range of recipes can be automated.
---@class Build_OilRefinery_C-Class : Manufacturer-Class
Build_OilRefinery_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Refines fluid and/or solid parts into other parts.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both a Conveyor Belt and Pipe input and output, to allow for the automation of various recipes.
---@class Serie_Refinery_C : Build_OilRefinery_C
Serie_Refinery_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Refines fluid and/or solid parts into other parts.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Contains both a Conveyor Belt and Pipe input and output, to allow for the automation of various recipes.
---@class Serie_Refinery_C-Class : Build_OilRefinery_C-Class
Serie_Refinery_C_Class = {}

--- Smelts 2 resources into alloy ingots.
--- 
--- Can be automated by feeding ore in via Conveyor Belts connected to the input ports. The resulting ingots can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_FoundryMk1_C : Manufacturer
Build_FoundryMk1_C = {}
--- Smelts 2 resources into alloy ingots.
--- 
--- Can be automated by feeding ore in via Conveyor Belts connected to the input ports. The resulting ingots can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_FoundryMk1_C-Class : Manufacturer-Class
Build_FoundryMk1_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Smelts two resources into alloy ingots.
--- 
--- Can be automated by feeding ore into it with a conveyor belt connected to the inputs. The produced ingots can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Foundry_C : Build_FoundryMk1_C
Serie_Foundry_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Smelts two resources into alloy ingots.
--- 
--- Can be automated by feeding ore into it with a conveyor belt connected to the inputs. The produced ingots can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Foundry_C-Class : Build_FoundryMk1_C-Class
Serie_Foundry_C_Class = {}

--- Crafts 3 or 4 parts into another part.
--- 
--- Can be automated by feeding component parts in via Conveyor Belts connected to the input ports. The resulting parts can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_ManufacturerMk1_C : Manufacturer
Build_ManufacturerMk1_C = {}
--- Crafts 3 or 4 parts into another part.
--- 
--- Can be automated by feeding component parts in via Conveyor Belts connected to the input ports. The resulting parts can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_ManufacturerMk1_C-Class : Manufacturer-Class
Build_ManufacturerMk1_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Crafts three or four parts into another part.
--- 
--- Can be automated by feeding parts into it with a conveyor belt connected to the input. The produced parts can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Manufacturer_C : Build_ManufacturerMk1_C
Serie_Manufacturer_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Crafts three or four parts into another part.
--- 
--- Can be automated by feeding parts into it with a conveyor belt connected to the input. The produced parts can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Manufacturer_C-Class : Build_ManufacturerMk1_C-Class
Serie_Manufacturer_C_Class = {}

--- Crafts 2 parts into another part.
--- 
--- Can be automated by feeding component parts in via Conveyor Belts connected to the input ports. The resulting parts can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_AssemblerMk1_C : Manufacturer
Build_AssemblerMk1_C = {}
--- Crafts 2 parts into another part.
--- 
--- Can be automated by feeding component parts in via Conveyor Belts connected to the input ports. The resulting parts can be automatically extracted by connecting a Conveyor Belt to the output port.
---@class Build_AssemblerMk1_C-Class : Manufacturer-Class
Build_AssemblerMk1_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Crafts two parts into another part.
--- 
--- Can be automated by feeding parts into it with a conveyor belt connected to the input. The produced parts can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Assembler_C : Build_AssemblerMk1_C
Serie_Assembler_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.
--- 
--- Crafts two parts into another part.
--- 
--- Can be automated by feeding parts into it with a conveyor belt connected to the input. The produced parts can be automatically extracted by connecting a conveyor belt to the output.
---@class Serie_Assembler_C-Class : Build_AssemblerMk1_C-Class
Serie_Assembler_C_Class = {}

--- Blends fluids together or combines them with solid parts in a wide variety of processes.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Has both Conveyor Belt and Pipeline input and output ports.
---@class Build_Blender_C : Manufacturer
Build_Blender_C = {}
--- Blends fluids together or combines them with solid parts in a wide variety of processes.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Has both Conveyor Belt and Pipeline input and output ports.
---@class Build_Blender_C-Class : Manufacturer-Class
Build_Blender_C_Class = {}

--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.T
--- 
--- he Blender is capable of blending fluids and combining them with solid parts in various processes.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards).
--- 
--- Contains both Conveyor Belt and Pipe inputs and outputs.
---@class Serie_Blender_C : Build_Blender_C
Serie_Blender_C = {}
--- Daisy Chain Smart Input Factory: All machines has 4 power connections and only gets the triple of resources needed by each production.T
--- 
--- he Blender is capable of blending fluids and combining them with solid parts in various processes.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards).
--- 
--- Contains both Conveyor Belt and Pipe inputs and outputs.
---@class Serie_Blender_C-Class : Build_Blender_C-Class
Serie_Blender_C_Class = {}

--- 
---@class FGBuildableCheatFluidSink : Factory
FGBuildableCheatFluidSink = {}
--- 
---@class FGBuildableCheatFluidSink-Class : Factory-Class
FGBuildableCheatFluidSink_Class = {}

--- 
---@class FGBuildableCheatFluidSpawner : Factory
FGBuildableCheatFluidSpawner = {}
--- 
---@class FGBuildableCheatFluidSpawner-Class : Factory-Class
FGBuildableCheatFluidSpawner_Class = {}

--- 
---@class FGBuildableCheatItemSink : Factory
FGBuildableCheatItemSink = {}
--- 
---@class FGBuildableCheatItemSink-Class : Factory-Class
FGBuildableCheatItemSink_Class = {}

--- 
---@class FGBuildableCheatItemSpawner : Factory
FGBuildableCheatItemSpawner = {}
--- 
---@class FGBuildableCheatItemSpawner-Class : Factory-Class
FGBuildableCheatItemSpawner_Class = {}

--- Sends or receives resources to/from vehicles.
--- 
--- Has 48 inventory slots.
--- 
--- Transfers up to 120 stacks per minute to/from docked vehicles. 
--- Always refuels vehicles if it has access to a matching fuel type.
---@class Build_TruckStation_C : DockingStation
Build_TruckStation_C = {}
--- Sends or receives resources to/from vehicles.
--- 
--- Has 48 inventory slots.
--- 
--- Transfers up to 120 stacks per minute to/from docked vehicles. 
--- Always refuels vehicles if it has access to a matching fuel type.
---@class Build_TruckStation_C-Class : DockingStation-Class
Build_TruckStation_C_Class = {}

--- A docking station for wheeled vehicles to transfer cargo.
---@class DockingStation : Factory
---@field public isLoadMode boolean True if the docking station loads docked vehicles, flase if it unloads them.
---@field public isLoadUnloading boolean True if the docking station is currently loading or unloading a docked vehicle.
DockingStation = {}
--- Returns the fuel inventory of the docking station.
---@return Inventory inventory The fuel inventory of the docking station.
---@type (fun(self:DockingStation):(inventory:Inventory))|ReflectionFunction
function DockingStation:getFuelInv() end
--- Returns the cargo inventory of the docking staiton.
---@return Inventory inventory The cargo inventory of this docking station.
---@type (fun(self:DockingStation):(inventory:Inventory))|ReflectionFunction
function DockingStation:getInv() end
--- Returns the currently docked actor.
---@return Actor docked The currently docked actor.
---@type (fun(self:DockingStation):(docked:Actor))|ReflectionFunction
function DockingStation:getDocked() end
--- Undocked the currently docked vehicle from this docking station.
---@type (fun(self:DockingStation))|ReflectionFunction
function DockingStation:undock() end
--- A docking station for wheeled vehicles to transfer cargo.
---@class DockingStation-Class : Factory-Class
DockingStation_Class = {}

--- 
---@class FGBuildableDroneStation : Factory
FGBuildableDroneStation = {}
--- 
---@class FGBuildableDroneStation-Class : Factory-Class
FGBuildableDroneStation_Class = {}

--- Functions as home Port to a single Drone, which transports available input back and forth between its home Port and destination Ports.
--- Drone Ports can have one other Port assigned as their transport destination.
--- 
--- The Drone Port interface provides delivery details and allows management of Port connections.
---@class Build_DroneStation_C : FGBuildableDroneStation
Build_DroneStation_C = {}
--- Functions as home Port to a single Drone, which transports available input back and forth between its home Port and destination Ports.
--- Drone Ports can have one other Port assigned as their transport destination.
--- 
--- The Drone Port interface provides delivery details and allows management of Port connections.
---@class Build_DroneStation_C-Class : FGBuildableDroneStation-Class
Build_DroneStation_C_Class = {}

--- 
---@class FGBuildableFactorySimpleProducer : Factory
FGBuildableFactorySimpleProducer = {}
--- 
---@class FGBuildableFactorySimpleProducer-Class : Factory-Class
FGBuildableFactorySimpleProducer_Class = {}

--- It comes bearing gifts.
--- Produces 15 Gifts per minute.
---@class Build_TreeGiftProducer_C : FGBuildableFactorySimpleProducer
Build_TreeGiftProducer_C = {}
--- It comes bearing gifts.
--- Produces 15 Gifts per minute.
---@class Build_TreeGiftProducer_C-Class : FGBuildableFactorySimpleProducer-Class
Build_TreeGiftProducer_C_Class = {}

--- Activates a Resource Well by pressurizing the underground resource. Must be placed on a Resource Well.
--- Once activated, Resource Well Extractors can be placed on the surrounding sub-nodes to extract the resource.
--- Requires power. Overclocking increases the output potential of the entire Resource Well.
---@class Build_FrackingSmasher_C : FGBuildableFrackingActivator
Build_FrackingSmasher_C = {}
--- Activates a Resource Well by pressurizing the underground resource. Must be placed on a Resource Well.
--- Once activated, Resource Well Extractors can be placed on the surrounding sub-nodes to extract the resource.
--- Requires power. Overclocking increases the output potential of the entire Resource Well.
---@class Build_FrackingSmasher_C-Class : FGBuildableFrackingActivator-Class
Build_FrackingSmasher_C_Class = {}

--- 
---@class FGBuildableFrackingActivator : FGBuildableResourceExtractorBase
FGBuildableFrackingActivator = {}
--- 
---@class FGBuildableFrackingActivator-Class : FGBuildableResourceExtractorBase-Class
FGBuildableFrackingActivator_Class = {}

--- 
---@class FGBuildableResourceExtractorBase : Factory
FGBuildableResourceExtractorBase = {}
--- 
---@class FGBuildableResourceExtractorBase-Class : Factory-Class
FGBuildableResourceExtractorBase_Class = {}

--- Collects pressurized resources when placed on the activated sub-nodes of a Resource Well. Does not require power.
--- 
--- Default Extraction Rate: 60 m³ of fluid per minute.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
---@class Build_FrackingExtractor_C : FGBuildableFrackingExtractor
Build_FrackingExtractor_C = {}
--- Collects pressurized resources when placed on the activated sub-nodes of a Resource Well. Does not require power.
--- 
--- Default Extraction Rate: 60 m³ of fluid per minute.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
---@class Build_FrackingExtractor_C-Class : FGBuildableFrackingExtractor-Class
Build_FrackingExtractor_C_Class = {}

--- 
---@class FGBuildableFrackingExtractor : FGBuildableResourceExtractor
FGBuildableFrackingExtractor = {}
--- 
---@class FGBuildableFrackingExtractor-Class : FGBuildableResourceExtractor-Class
FGBuildableFrackingExtractor_Class = {}

--- 
---@class FGBuildableResourceExtractor : FGBuildableResourceExtractorBase
FGBuildableResourceExtractor = {}
--- 
---@class FGBuildableResourceExtractor-Class : FGBuildableResourceExtractorBase-Class
FGBuildableResourceExtractor_Class = {}

--- Extracts water from the body of water it is built on.
--- Note: the water needs to be sufficiently deep, and rivers are generally not deep enough.
--- 
--- Default Extraction Rate: 120 m³ of water per minute.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
---@class Build_WaterPump_C : FGBuildableWaterPump
Build_WaterPump_C = {}
--- Extracts water from the body of water it is built on.
--- Note: the water needs to be sufficiently deep, and rivers are generally not deep enough.
--- 
--- Default Extraction Rate: 120 m³ of water per minute.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
---@class Build_WaterPump_C-Class : FGBuildableWaterPump-Class
Build_WaterPump_C_Class = {}

--- 
---@class FGBuildableWaterPump : FGBuildableResourceExtractor
FGBuildableWaterPump = {}
--- 
---@class FGBuildableWaterPump-Class : FGBuildableResourceExtractor-Class
FGBuildableWaterPump_Class = {}

--- Special Mod: Has multiple Power Connection in it.
--- 
--- Default extraction rate: 120m³ water per minute.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Extracts water from the body of water it is build on.
--- Note that the water needs to be deep enough and that rivers do not commonly suffice.
---@class Serie_WaterPump_C : Build_WaterPump_C
Serie_WaterPump_C = {}
--- Special Mod: Has multiple Power Connection in it.
--- 
--- Default extraction rate: 120m³ water per minute.
--- Head Lift: 10 meters.
--- (Allows fluids to be transported 10 meters upwards.)
--- 
--- Extracts water from the body of water it is build on.
--- Note that the water needs to be deep enough and that rivers do not commonly suffice.
---@class Serie_WaterPump_C-Class : Build_WaterPump_C-Class
Serie_WaterPump_C_Class = {}

--- Extracts solid resources from the resource node it is built on. 
--- Default extraction rate is 60 resources per minute. 
--- Extraction rate varies based on resource node purity. Outputs all extracted resources onto connected Conveyor Belts.
---@class Build_MinerMk1_C : FGBuildableResourceExtractor
Build_MinerMk1_C = {}
--- Extracts solid resources from the resource node it is built on. 
--- Default extraction rate is 60 resources per minute. 
--- Extraction rate varies based on resource node purity. Outputs all extracted resources onto connected Conveyor Belts.
---@class Build_MinerMk1_C-Class : FGBuildableResourceExtractor-Class
Build_MinerMk1_C_Class = {}

--- Extracts solid resources from the resource node it is built on. 
--- Default extraction rate is 120 resources per minute. 
--- Extraction rate varies based on resource node purity. Outputs all extracted resources onto connected Conveyor Belts.
---@class Build_MinerMk2_C : FGBuildableResourceExtractor
Build_MinerMk2_C = {}
--- Extracts solid resources from the resource node it is built on. 
--- Default extraction rate is 120 resources per minute. 
--- Extraction rate varies based on resource node purity. Outputs all extracted resources onto connected Conveyor Belts.
---@class Build_MinerMk2_C-Class : FGBuildableResourceExtractor-Class
Build_MinerMk2_C_Class = {}

--- Extracts solid resources from the resource node it is built on. 
--- Default extraction rate is 240 resources per minute. 
--- Extraction rate varies based on resource node purity. Outputs all extracted resources onto connected Conveyor Belts.
---@class Build_MinerMk3_C : Build_MinerMk2_C
Build_MinerMk3_C = {}
--- Extracts solid resources from the resource node it is built on. 
--- Default extraction rate is 240 resources per minute. 
--- Extraction rate varies based on resource node purity. Outputs all extracted resources onto connected Conveyor Belts.
---@class Build_MinerMk3_C-Class : Build_MinerMk2_C-Class
Build_MinerMk3_C_Class = {}

--- Extracts Crude Oil when built on an oil node. Extraction rates vary based on node purity.
--- 
--- Default Extraction Rate: 120 m³ of oil per minute.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
---@class Build_OilPump_C : FGBuildableResourceExtractor
Build_OilPump_C = {}
--- Extracts Crude Oil when built on an oil node. Extraction rates vary based on node purity.
--- 
--- Default Extraction Rate: 120 m³ of oil per minute.
--- Head Lift: 10 m
--- (Allows fluids to be transported 10 meters upwards.)
---@class Build_OilPump_C-Class : FGBuildableResourceExtractor-Class
Build_OilPump_C_Class = {}

--- 
---@class FGBuildableGeneratorFuel : FGBuildableGenerator
FGBuildableGeneratorFuel = {}
--- 
---@class FGBuildableGeneratorFuel-Class : FGBuildableGenerator-Class
FGBuildableGeneratorFuel_Class = {}

--- 
---@class FGBuildableGenerator : Factory
FGBuildableGenerator = {}
--- 
---@class FGBuildableGenerator-Class : Factory-Class
FGBuildableGenerator_Class = {}

--- 
---@class FGBuildableGeneratorNuclear : FGBuildableGeneratorFuel
FGBuildableGeneratorNuclear = {}
--- 
---@class FGBuildableGeneratorNuclear-Class : FGBuildableGeneratorFuel-Class
FGBuildableGeneratorNuclear_Class = {}

--- Consumes Nuclear Fuel Rods and Water to produce electricity for the power grid.
--- 
--- Produces Nuclear Waste, which is extracted via the Conveyor Belt output.
--- 
--- Caution: Always generates power at the set clock speed. Shuts down if fuel requirements are not met.
---@class Build_GeneratorNuclear_C : FGBuildableGeneratorNuclear
Build_GeneratorNuclear_C = {}
--- Consumes Nuclear Fuel Rods and Water to produce electricity for the power grid.
--- 
--- Produces Nuclear Waste, which is extracted via the Conveyor Belt output.
--- 
--- Caution: Always generates power at the set clock speed. Shuts down if fuel requirements are not met.
---@class Build_GeneratorNuclear_C-Class : FGBuildableGeneratorNuclear-Class
Build_GeneratorNuclear_C_Class = {}

--- Special Mod: Has multiple Power Connection in it.
--- 
--- Consumes Nuclear Fuel Rods and Water to produce electricty for the power grid.
--- 
--- Produces Nuclear Waste, which is extracted from the conveyor belt output.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Serie_Nuclear_C : Build_GeneratorNuclear_C
Serie_Nuclear_C = {}
--- Special Mod: Has multiple Power Connection in it.
--- 
--- Consumes Nuclear Fuel Rods and Water to produce electricty for the power grid.
--- 
--- Produces Nuclear Waste, which is extracted from the conveyor belt output.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Serie_Nuclear_C-Class : Build_GeneratorNuclear_C-Class
Serie_Nuclear_C_Class = {}

--- Burns Biomass to produce power. Biomass must be loaded manually and can be obtained by picking up flora in the world.
--- 
--- Produces up to 20 MW of power while operating.
---@class Build_GeneratorIntegratedBiomass_C : FGBuildableGeneratorFuel
Build_GeneratorIntegratedBiomass_C = {}
--- Burns Biomass to produce power. Biomass must be loaded manually and can be obtained by picking up flora in the world.
--- 
--- Produces up to 20 MW of power while operating.
---@class Build_GeneratorIntegratedBiomass_C-Class : FGBuildableGeneratorFuel-Class
Build_GeneratorIntegratedBiomass_C_Class = {}

--- Burns various forms of Biomass to generate electricity for the power grid.
--- Has a Conveyor Belt input port that allows the Biomass supply to be automated.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Build_GeneratorBiomass_Automated_C : FGBuildableGeneratorFuel
Build_GeneratorBiomass_Automated_C = {}
--- Burns various forms of Biomass to generate electricity for the power grid.
--- Has a Conveyor Belt input port that allows the Biomass supply to be automated.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Build_GeneratorBiomass_Automated_C-Class : FGBuildableGeneratorFuel-Class
Build_GeneratorBiomass_Automated_C_Class = {}

--- Special Mod: Has multiple Power Connection in it.
--- 
--- Burns various forms of biomass to generate electricity for the power grid.
--- Has no input and must therefore be fed biomass manually.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Serie_Biomass_C : Build_GeneratorBiomass_Automated_C
Serie_Biomass_C = {}
--- Special Mod: Has multiple Power Connection in it.
--- 
--- Burns various forms of biomass to generate electricity for the power grid.
--- Has no input and must therefore be fed biomass manually.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Serie_Biomass_C-Class : Build_GeneratorBiomass_Automated_C-Class
Serie_Biomass_C_Class = {}

--- Consumes Fuel to generate electricity for the power grid.
--- Has a Pipeline input port that allows the Fuel supply to be automated.
--- 
--- Caution: Always generates power at the set clock speed. Shuts down if fuel requirements are not met.
---@class Build_GeneratorFuel_C : FGBuildableGeneratorFuel
Build_GeneratorFuel_C = {}
--- Consumes Fuel to generate electricity for the power grid.
--- Has a Pipeline input port that allows the Fuel supply to be automated.
--- 
--- Caution: Always generates power at the set clock speed. Shuts down if fuel requirements are not met.
---@class Build_GeneratorFuel_C-Class : FGBuildableGeneratorFuel-Class
Build_GeneratorFuel_C_Class = {}

--- Special Mod: Has multiple Power Connection in it.
--- 
--- Consumes Fuel to generate electricity for the power grid.
--- Has a Pipe input so the Fuel supply can be automated.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Serie_FuelGen_C : Build_GeneratorFuel_C
Serie_FuelGen_C = {}
--- Special Mod: Has multiple Power Connection in it.
--- 
--- Consumes Fuel to generate electricity for the power grid.
--- Has a Pipe input so the Fuel supply can be automated.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Serie_FuelGen_C-Class : Build_GeneratorFuel_C-Class
Serie_FuelGen_C_Class = {}

--- Burns Coal to boil Water. The steam produced rotates turbines that generate electricity for the power grid.
--- Has Conveyor Belt and Pipeline input ports that allow the Coal and Water supply to be automated.
--- 
--- Caution: Always generates power at the set clock speed. Shuts down if fuel requirements are not met.
---@class Build_GeneratorCoal_C : FGBuildableGeneratorFuel
Build_GeneratorCoal_C = {}
--- Burns Coal to boil Water. The steam produced rotates turbines that generate electricity for the power grid.
--- Has Conveyor Belt and Pipeline input ports that allow the Coal and Water supply to be automated.
--- 
--- Caution: Always generates power at the set clock speed. Shuts down if fuel requirements are not met.
---@class Build_GeneratorCoal_C-Class : FGBuildableGeneratorFuel-Class
Build_GeneratorCoal_C_Class = {}

--- Has 4 connections
--- 
--- Burns Coal to boil Water, the produced steam rotates turbines to generate electricity for the power grid.
--- Has a Conveyor Belt and Pipe input, so both the Coal and Water supply can be automated.
--- 
--- Caution: Always generates at the set clock speed. Shuts down if fuel requirements are not met.
---@class Serie_GenCoal_C : Build_GeneratorCoal_C
Serie_GenCoal_C = {}
--- Has 4 connections
--- 
--- Burns Coal to boil Water, the produced steam rotates turbines to generate electricity for the power grid.
--- Has a Conveyor Belt and Pipe input, so both the Coal and Water supply can be automated.
--- 
--- Caution: Always generates at the set clock speed. Shuts down if fuel requirements are not met.
---@class Serie_GenCoal_C-Class : Build_GeneratorCoal_C-Class
Serie_GenCoal_C_Class = {}

--- Burns various forms of Biomass to generate electricity for the power grid.
--- Has a Conveyor Belt input port that allows the Biomass supply to be automated.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Build_GeneratorBiomass_C : FGBuildableGeneratorFuel
Build_GeneratorBiomass_C = {}
--- Burns various forms of Biomass to generate electricity for the power grid.
--- Has a Conveyor Belt input port that allows the Biomass supply to be automated.
--- 
--- Resource consumption will automatically be lowered to meet power demands.
---@class Build_GeneratorBiomass_C-Class : FGBuildableGeneratorFuel-Class
Build_GeneratorBiomass_C_Class = {}

--- 
---@class FGBuildableGeneratorGeoThermal : FGBuildableGenerator
FGBuildableGeneratorGeoThermal = {}
--- 
---@class FGBuildableGeneratorGeoThermal-Class : FGBuildableGenerator-Class
FGBuildableGeneratorGeoThermal_Class = {}

--- Harnesses geothermal energy to generate power. Must be built on a Geyser.
--- 
--- Caution: Power production fluctuates.
--- 
--- Power Production:
--- Impure Geyser: 50-150 MW (100 MW average)
--- Normal Geyser: 100-300 MW (200 MW average)
--- Pure Geyser: 200-600 MW (400 MW average)
---@class Build_GeneratorGeoThermal_C : FGBuildableGeneratorGeoThermal
Build_GeneratorGeoThermal_C = {}
--- Harnesses geothermal energy to generate power. Must be built on a Geyser.
--- 
--- Caution: Power production fluctuates.
--- 
--- Power Production:
--- Impure Geyser: 50-150 MW (100 MW average)
--- Normal Geyser: 100-300 MW (200 MW average)
--- Pure Geyser: 200-600 MW (400 MW average)
---@class Build_GeneratorGeoThermal_C-Class : FGBuildableGeneratorGeoThermal-Class
Build_GeneratorGeoThermal_C_Class = {}

--- 
---@class FGBuildableJumppad : Factory
FGBuildableJumppad = {}
--- 
---@class FGBuildableJumppad-Class : Factory-Class
FGBuildableJumppad_Class = {}

--- Launches pioneers for quick, vertical traversal.
--- The launch angle can be adjusted while building.
--- Caution: Be sure to land safely!
---@class Build_JumpPadAdjustable_C : FGBuildableJumppad
Build_JumpPadAdjustable_C = {}
--- Launches pioneers for quick, vertical traversal.
--- The launch angle can be adjusted while building.
--- Caution: Be sure to land safely!
---@class Build_JumpPadAdjustable_C-Class : FGBuildableJumppad-Class
Build_JumpPadAdjustable_C_Class = {}

--- 
---@class FGBuildablePipeHyperBooster : FGBuildablePipeHyperAttachment
FGBuildablePipeHyperBooster = {}
--- 
---@class FGBuildablePipeHyperBooster-Class : FGBuildablePipeHyperAttachment-Class
FGBuildablePipeHyperBooster_Class = {}

--- 
---@class FGBuildablePipeHyperAttachment : Factory
FGBuildablePipeHyperAttachment = {}
--- 
---@class FGBuildablePipeHyperAttachment-Class : Factory-Class
FGBuildablePipeHyperAttachment_Class = {}

--- 
---@class FGBuildablePipeHyperJunction : FGBuildablePipeHyperAttachment
FGBuildablePipeHyperJunction = {}
--- 
---@class FGBuildablePipeHyperJunction-Class : FGBuildablePipeHyperAttachment-Class
FGBuildablePipeHyperJunction_Class = {}

--- 
---@class FGBuildablePipelineAttachment : Factory
FGBuildablePipelineAttachment = {}
--- 
---@class FGBuildablePipelineAttachment-Class : Factory-Class
FGBuildablePipelineAttachment_Class = {}

--- 
---@class FGBuildablePipelineJunction : FGBuildablePipelineAttachment
FGBuildablePipelineJunction = {}
--- 
---@class FGBuildablePipelineJunction-Class : FGBuildablePipelineAttachment-Class
FGBuildablePipelineJunction_Class = {}

--- Attaches to a Pipeline, allowing it to be split up to 4 ways.
---@class Build_PipelineJunction_Cross_C : FGBuildablePipelineJunction
Build_PipelineJunction_Cross_C = {}
--- Attaches to a Pipeline, allowing it to be split up to 4 ways.
---@class Build_PipelineJunction_Cross_C-Class : FGBuildablePipelineJunction-Class
Build_PipelineJunction_Cross_C_Class = {}

--- Can be attached to a pipeline to split it 12-way.
---@class Build_MultiJunction_C : Build_PipelineJunction_Cross_C
Build_MultiJunction_C = {}
--- Can be attached to a pipeline to split it 12-way.
---@class Build_MultiJunction_C-Class : Build_PipelineJunction_Cross_C-Class
Build_MultiJunction_C_Class = {}

--- A building that can pump fluids to a higher level within a pipeline.
---@class PipelinePump : FGBuildablePipelineAttachment
---@field public maxHeadlift number The maximum amount of headlift this pump can provide.
---@field public designedHeadlift number The amomunt of headlift this pump is designed for.
---@field public indicatorHeadlift number The amount of headlift the indicator shows.
---@field public indicatorHeadliftPct number The amount of headlift the indicator shows as percantage from max.
---@field public userFlowLimit number The flow limit of this pump the user can specifiy. Use -1 for now user set limit. (in m^3/s)
---@field public flowLimit number The overal flow limit of this pump. (in m^3/s)
---@field public flowLimitPct number The overal flow limit of this pump. (in percent)
---@field public flow number The current flow amount. (in m^3/s)
---@field public flowPct number The current flow amount. (in percent)
PipelinePump = {}
--- A building that can pump fluids to a higher level within a pipeline.
---@class PipelinePump-Class : FGBuildablePipelineAttachment-Class
PipelinePump_Class = {}

--- Can be attached to a Pipeline to apply Head Lift.
--- Maximum Head Lift: 50 m
--- (Allows fluids to be transported 50 meters upwards.)
--- 
--- NOTE: Arrows and holograms when building indicate Head Lift direction.
--- NOTE: Head Lift does not stack, so space between Pumps is recommended.
---@class Build_PipelinePumpMk2_C : PipelinePump
Build_PipelinePumpMk2_C = {}
--- Can be attached to a Pipeline to apply Head Lift.
--- Maximum Head Lift: 50 m
--- (Allows fluids to be transported 50 meters upwards.)
--- 
--- NOTE: Arrows and holograms when building indicate Head Lift direction.
--- NOTE: Head Lift does not stack, so space between Pumps is recommended.
---@class Build_PipelinePumpMk2_C-Class : PipelinePump-Class
Build_PipelinePumpMk2_C_Class = {}

--- A pump with a configurable head lift.
---@class Build_CheatFluidPump_C : Build_PipelinePumpMk2_C
Build_CheatFluidPump_C = {}
--- A pump with a configurable head lift.
---@class Build_CheatFluidPump_C-Class : Build_PipelinePumpMk2_C-Class
Build_CheatFluidPump_C_Class = {}

--- 
---@class SeriePipePumpMK2_C : Build_PipelinePumpMk2_C
SeriePipePumpMK2_C = {}
--- 
---@class SeriePipePumpMK2_C-Class : Build_PipelinePumpMk2_C-Class
SeriePipePumpMK2_C_Class = {}

--- 
---@class Serie_PumpMK2_C : Build_PipelinePumpMk2_C
Serie_PumpMK2_C = {}
--- 
---@class Serie_PumpMK2_C-Class : Build_PipelinePumpMk2_C-Class
Serie_PumpMK2_C_Class = {}

--- Attaches to a Pipeline to apply Head Lift.
--- Maximum Head Lift: 20 m
--- (Allows fluids to be transported 20 m upwards.)
--- 
--- NOTE: Arrows and holograms when building indicate Head Lift direction.
--- NOTE: Head Lift does not stack, so space between Pumps is recommended.
---@class Build_PipelinePump_C : PipelinePump
Build_PipelinePump_C = {}
--- Attaches to a Pipeline to apply Head Lift.
--- Maximum Head Lift: 20 m
--- (Allows fluids to be transported 20 m upwards.)
--- 
--- NOTE: Arrows and holograms when building indicate Head Lift direction.
--- NOTE: Head Lift does not stack, so space between Pumps is recommended.
---@class Build_PipelinePump_C-Class : PipelinePump-Class
Build_PipelinePump_C_Class = {}

--- Special Mod: Has multiple Power Connection in it.
--- 
--- Can be attached to a Pipeline to apply Head Lift.
--- Maximum Head Lift: 20 meters
--- (Allows fluids to be transported 20 meters upwards.)
--- Outputs fluids at 300m³ per minute.
--- 
--- NOTE: Has an in- and output direction.
--- NOTE: Head Lift does not stack, so space between Pumps is recommended.
---@class Serie_PipelinePump_C : Build_PipelinePump_C
Serie_PipelinePump_C = {}
--- Special Mod: Has multiple Power Connection in it.
--- 
--- Can be attached to a Pipeline to apply Head Lift.
--- Maximum Head Lift: 20 meters
--- (Allows fluids to be transported 20 meters upwards.)
--- Outputs fluids at 300m³ per minute.
--- 
--- NOTE: Has an in- and output direction.
--- NOTE: Head Lift does not stack, so space between Pumps is recommended.
---@class Serie_PipelinePump_C-Class : Build_PipelinePump_C-Class
Serie_PipelinePump_C_Class = {}

--- Limits Pipeline flow rates.
--- Can be attached to a Pipeline.
--- 
--- NOTE: Has an in- and output direction.
---@class Build_Valve_C : PipelinePump
Build_Valve_C = {}
--- Limits Pipeline flow rates.
--- Can be attached to a Pipeline.
--- 
--- NOTE: Has an in- and output direction.
---@class Build_Valve_C-Class : PipelinePump-Class
Build_Valve_C_Class = {}

--- Limits Pipeline flow rates.
--- Can be attached to a Pipeline.
--- 
--- NOTE: Has an in- and output direction.
---@class Counter_Valve_C : Build_Valve_C
Counter_Valve_C = {}
--- Limits Pipeline flow rates.
--- Can be attached to a Pipeline.
--- 
--- NOTE: Has an in- and output direction.
---@class Counter_Valve_C-Class : Build_Valve_C-Class
Counter_Valve_C_Class = {}

--- 
---@class FGBuildablePipePart : Factory
FGBuildablePipePart = {}
--- 
---@class FGBuildablePipePart-Class : Factory-Class
FGBuildablePipePart_Class = {}

--- 
---@class FGBuildablePipeHyperPart : FGBuildablePipePart
FGBuildablePipeHyperPart = {}
--- 
---@class FGBuildablePipeHyperPart-Class : FGBuildablePipePart-Class
FGBuildablePipeHyperPart_Class = {}

--- A actor that is a hypertube entrance buildable
---@class PipeHyperStart : FGBuildablePipeHyperPart
PipeHyperStart = {}
--- A actor that is a hypertube entrance buildable
---@class PipeHyperStart-Class : FGBuildablePipeHyperPart-Class
PipeHyperStart_Class = {}

--- Powers up a Hypertube system and allows it to be entered.
---@class Build_PipeHyperStart_C : PipeHyperStart
Build_PipeHyperStart_C = {}
--- Powers up a Hypertube system and allows it to be entered.
---@class Build_PipeHyperStart_C-Class : PipeHyperStart-Class
Build_PipeHyperStart_C_Class = {}

--- Special Mod: Has multiple Power Connection in it.
--- 
--- Used to enter and power a Hyper Tube.
---@class Serie_HyperTubeEntrance_C : Build_PipeHyperStart_C
Serie_HyperTubeEntrance_C = {}
--- Special Mod: Has multiple Power Connection in it.
--- 
--- Used to enter and power a Hyper Tube.
---@class Serie_HyperTubeEntrance_C-Class : Build_PipeHyperStart_C-Class
Serie_HyperTubeEntrance_C_Class = {}

--- The base class for all fluid tanks.
---@class PipeReservoir : Factory
---@field public fluidContent number The amount of fluid in the tank.
---@field public maxFluidContent number The maximum amount of fluid this tank can hold.
---@field public flowFill number The currentl inflow rate of fluid.
---@field public flowDrain number The current outflow rate of fluid.
---@field public flowLimit number The maximum flow rate of fluid this tank can handle.
PipeReservoir = {}
--- Emptys the whole fluid container.
---@type (fun(self:PipeReservoir))|ReflectionFunction
function PipeReservoir:flush() end
--- Returns the type of the fluid.
---@return ItemType-Class type The type of the fluid the tank contains.
---@type (fun(self:PipeReservoir):(type:ItemType-Class))|ReflectionFunction
function PipeReservoir:getFluidType() end
--- The base class for all fluid tanks.
---@class PipeReservoir-Class : Factory-Class
PipeReservoir_Class = {}

--- Holds up to 2400 m³ of fluid.
--- Has Pipeline input and output ports.
---@class Build_IndustrialTank_C : PipeReservoir
Build_IndustrialTank_C = {}
--- Holds up to 2400 m³ of fluid.
--- Has Pipeline input and output ports.
---@class Build_IndustrialTank_C-Class : PipeReservoir-Class
Build_IndustrialTank_C_Class = {}

--- Holds up to 400 m³ of fluid.
--- Has Pipeline input and output ports.
---@class Build_PipeStorageTank_C : PipeReservoir
Build_PipeStorageTank_C = {}
--- Holds up to 400 m³ of fluid.
--- Has Pipeline input and output ports.
---@class Build_PipeStorageTank_C-Class : PipeReservoir-Class
Build_PipeStorageTank_C_Class = {}

--- 
---@class FGBuildablePortal : FGBuildablePortalBase
FGBuildablePortal = {}
--- 
---@class FGBuildablePortal-Class : FGBuildablePortalBase-Class
FGBuildablePortal_Class = {}

--- 
---@class FGBuildablePortalBase : Factory
FGBuildablePortalBase = {}
--- 
---@class FGBuildablePortalBase-Class : Factory-Class
FGBuildablePortalBase_Class = {}

--- Enables pioneer teleportation between two linked Portals.
--- 
--- Each Portal can only have a single link. 
--- A link can only be made between a Main and Satellite Portal.
--- 
--- Singularity Cells need to be supplied to the Main Portal and will be consumed to establish and maintain the Portal link.
--- 
--- WARNINGS:
--- - Massive power draw will occur during start-up and usage.
--- - Power draw on use increases with travel distance.
--- - Link start-up will take time. Letting the connection expire is not recommended.
--- - Failure to deliver sufficient Singularity Cells will cause the link to expire.
--- - FICSIT does not condone the use of wormhole technology. Any usage of wormhole technology is at the user's own risk.
---@class Build_Portal_C : FGBuildablePortal
Build_Portal_C = {}
--- Enables pioneer teleportation between two linked Portals.
--- 
--- Each Portal can only have a single link. 
--- A link can only be made between a Main and Satellite Portal.
--- 
--- Singularity Cells need to be supplied to the Main Portal and will be consumed to establish and maintain the Portal link.
--- 
--- WARNINGS:
--- - Massive power draw will occur during start-up and usage.
--- - Power draw on use increases with travel distance.
--- - Link start-up will take time. Letting the connection expire is not recommended.
--- - Failure to deliver sufficient Singularity Cells will cause the link to expire.
--- - FICSIT does not condone the use of wormhole technology. Any usage of wormhole technology is at the user's own risk.
---@class Build_Portal_C-Class : FGBuildablePortal-Class
Build_Portal_C_Class = {}

--- 
---@class FGBuildablePortalSatellite : FGBuildablePortalBase
FGBuildablePortalSatellite = {}
--- 
---@class FGBuildablePortalSatellite-Class : FGBuildablePortalBase-Class
FGBuildablePortalSatellite_Class = {}

--- Enables pioneer teleportation between two linked Portals.
--- 
--- Each Portal can only have a single link. 
--- A link can only be made between a Main and Satellite Portal.
--- 
--- Singularity Cells need to be supplied to the Main Portal and will be consumed to establish and maintain the Portal link.
--- 
--- WARNINGS:
--- - Massive power draw will occur during start-up and usage.
--- - Power draw on use increases with travel distance.
--- - Link start-up will take time. Letting the connection expire is not recommended.
--- - Failure to deliver sufficient Singularity Cells will cause the link to expire.
--- - FICSIT does not condone the use of wormhole technology. Any usage of wormhole technology is at the user's own risk.
---@class Build_PortalSatellite_C : FGBuildablePortalSatellite
Build_PortalSatellite_C = {}
--- Enables pioneer teleportation between two linked Portals.
--- 
--- Each Portal can only have a single link. 
--- A link can only be made between a Main and Satellite Portal.
--- 
--- Singularity Cells need to be supplied to the Main Portal and will be consumed to establish and maintain the Portal link.
--- 
--- WARNINGS:
--- - Massive power draw will occur during start-up and usage.
--- - Power draw on use increases with travel distance.
--- - Link start-up will take time. Letting the connection expire is not recommended.
--- - Failure to deliver sufficient Singularity Cells will cause the link to expire.
--- - FICSIT does not condone the use of wormhole technology. Any usage of wormhole technology is at the user's own risk.
---@class Build_PortalSatellite_C-Class : FGBuildablePortalSatellite-Class
Build_PortalSatellite_C_Class = {}

--- 
---@class FGBuildablePowerBooster : Factory
FGBuildablePowerBooster = {}
--- 
---@class FGBuildablePowerBooster-Class : Factory-Class
FGBuildablePowerBooster_Class = {}

--- Generates power based on the total amount of power on the attached power grid.
--- 
--- This experimental technology is somehow able to extract power from the Somersloop by blasting it with energy.
---@class Build_AlienPowerBuilding_C : FGBuildablePowerBooster
Build_AlienPowerBuilding_C = {}
--- Generates power based on the total amount of power on the attached power grid.
--- 
--- This experimental technology is somehow able to extract power from the Somersloop by blasting it with energy.
---@class Build_AlienPowerBuilding_C-Class : FGBuildablePowerBooster-Class
Build_AlienPowerBuilding_C_Class = {}

--- A building that can store power for later usage.
---@class PowerStorage : Factory
---@field public powerStore number The current amount of energy stored in the storage.
---@field public powerCapacity number The amount of energy the storage can hold max.
---@field public powerStorePercent number The current power store in percent.
---@field public powerIn number The amount of power coming into the storage.
---@field public powerOut number The amount of power going out from the storage.
---@field public timeUntilFull number The time in seconds until the storage is filled.
---@field public timeUntilEmpty number The time in seconds until the storage is empty.
---@field public batteryStatus integer The current status of the battery.<br>0 = Idle, 1 = Idle Empty, 2 = Idle Full, 3 = Power In, 4 = Power Out
---@field public batteryMaxIndicatorLevel integer The maximum count of Level lights that are shown.
PowerStorage = {}
--- A building that can store power for later usage.
---@class PowerStorage-Class : Factory-Class
PowerStorage_Class = {}

--- Connects to a power grid to store excess power produced. The stored power can be harnessed if power grid consumption exceeds production.
--- 
--- Storage Capacity: 100 MWh (100 MW for 1 hour)
--- Maximum Charge Rate: 100 MW
--- Maximum Discharge Rate: Unlimited
---@class Build_PowerStorageMk1_C : PowerStorage
Build_PowerStorageMk1_C = {}
--- Connects to a power grid to store excess power produced. The stored power can be harnessed if power grid consumption exceeds production.
--- 
--- Storage Capacity: 100 MWh (100 MW for 1 hour)
--- Maximum Charge Rate: 100 MW
--- Maximum Discharge Rate: Unlimited
---@class Build_PowerStorageMk1_C-Class : PowerStorage-Class
Build_PowerStorageMk1_C_Class = {}

--- 
---@class FGBuildableRadarTower : Factory
FGBuildableRadarTower = {}
--- 
---@class FGBuildableRadarTower-Class : Factory-Class
FGBuildableRadarTower_Class = {}

--- Scans the surrounding area to display additional information on the Map.
--- 
--- Information revealed on the Map includes:
--- - Resource node locations
--- - Terrain data
--- - Flora & fauna information
--- - Notable signal readings
---@class Build_RadarTower_C : FGBuildableRadarTower
Build_RadarTower_C = {}
--- Scans the surrounding area to display additional information on the Map.
--- 
--- Information revealed on the Map includes:
--- - Resource node locations
--- - Terrain data
--- - Flora & fauna information
--- - Notable signal readings
---@class Build_RadarTower_C-Class : FGBuildableRadarTower-Class
Build_RadarTower_C_Class = {}

--- The base class for all train station parts.
---@class TrainPlatform : Factory
---@field public status integer The current docking status of the platform.
---@field public isReversed boolean True if the orientation of the platform is reversed relative to the track/station.
TrainPlatform = {}
--- Returns the track graph of which this platform is part of.
---@return TrackGraph graph The track graph of which this platform is part of.
---@type (fun(self:TrainPlatform):(graph:TrackGraph))|ReflectionFunction
function TrainPlatform:getTrackGraph() end
--- Returns the track pos at which this train platform is placed.
---@return RailroadTrack track The track the track pos points to.
---@return number offset The offset of the track pos.
---@return number forward The forward direction of the track pos. 1 = with the track direction, -1 = against the track direction
---@type (fun(self:TrainPlatform):(track:RailroadTrack,offset:number,forward:number))|ReflectionFunction
function TrainPlatform:getTrackPos() end
--- Returns the connected platform in the given direction.
---@param platformConnection TrainPlatformConnection The platform connection of which you want to find the opposite connection of.
---@return TrainPlatformConnection oppositeConnection The platform connection at the opposite side.
---@type (fun(self:TrainPlatform,platformConnection:TrainPlatformConnection):(oppositeConnection:TrainPlatformConnection))|ReflectionFunction
function TrainPlatform:getConnectedPlatform(platformConnection) end
--- Returns a list of all connected platforms in order.
---@return TrainPlatformConnection[] platforms The list of connected platforms
---@type (fun(self:TrainPlatform):(platforms:TrainPlatformConnection[]))|ReflectionFunction
function TrainPlatform:getAllConnectedPlatforms() end
--- Returns the currently docked vehicle.
---@return Vehicle vehicle The currently docked vehicle
---@type (fun(self:TrainPlatform):(vehicle:Vehicle))|ReflectionFunction
function TrainPlatform:getDockedVehicle() end
--- Returns the master platform of this train station.
---@return RailroadVehicle master The master platform of this train station.
---@type (fun(self:TrainPlatform):(master:RailroadVehicle))|ReflectionFunction
function TrainPlatform:getMaster() end
--- Returns the currently docked locomotive at the train station.
---@return RailroadVehicle locomotive The currently docked locomotive at the train station.
---@type (fun(self:TrainPlatform):(locomotive:RailroadVehicle))|ReflectionFunction
function TrainPlatform:getDockedLocomotive() end
--- The base class for all train station parts.
---@class TrainPlatform-Class : Factory-Class
TrainPlatform_Class = {}

--- The train station master platform. This platform holds the name and manages docking of trains.
---@class RailroadStation : TrainPlatform
---@field public name string The name of the railroad station.
---@field public dockedOffset integer The Offset to the beginning of the station at which trains dock.
RailroadStation = {}
--- The train station master platform. This platform holds the name and manages docking of trains.
---@class RailroadStation-Class : TrainPlatform-Class
RailroadStation_Class = {}

--- Serves as a hub for Locomotives, which can be set to navigate to and stop at a Train Station.
--- You can connect power to a Train Station to power up the trains on the Railway as well as feed power to other stations.
---@class Build_TrainStation_C : RailroadStation
Build_TrainStation_C = {}
--- Serves as a hub for Locomotives, which can be set to navigate to and stop at a Train Station.
--- You can connect power to a Train Station to power up the trains on the Railway as well as feed power to other stations.
---@class Build_TrainStation_C-Class : RailroadStation-Class
Build_TrainStation_C_Class = {}

--- A train platform that allows for loading and unloading cargo cars.
---@class TrainPlatformCargo : TrainPlatform
---@field public isLoading boolean True if the cargo platform is currently loading the docked cargo vehicle.
---@field public isInLoadMode boolean True if the cargo platform is set to load cargo, false if it should unload the cargo.
---@field public isUnloading boolean True if the cargo platform is currently loading or unloading the docked cargo vehicle.
---@field public dockedOffset number The offset to the track start of the platform at were the vehicle docked.
---@field public outputFlow number The current output flow rate.
---@field public inputFlow number The current input flow rate.
---@field public fullLoad boolean True if the docked cargo vehicle is fully loaded.
---@field public fullUnload boolean Ture if the docked cargo vehicle is fully unloaded.
TrainPlatformCargo = {}
--- A train platform that allows for loading and unloading cargo cars.
---@class TrainPlatformCargo-Class : TrainPlatform-Class
TrainPlatformCargo_Class = {}

--- Loads and unloads Freight Cars that stop at the Freight Platform.
--- Loading and unloading options can be set by configuring the building.
--- Snaps to other Platforms and Stations.
--- Needs to be connected to a powered Railway to function.
---@class Build_TrainDockingStation_C : TrainPlatformCargo
Build_TrainDockingStation_C = {}
--- Loads and unloads Freight Cars that stop at the Freight Platform.
--- Loading and unloading options can be set by configuring the building.
--- Snaps to other Platforms and Stations.
--- Needs to be connected to a powered Railway to function.
---@class Build_TrainDockingStation_C-Class : TrainPlatformCargo-Class
Build_TrainDockingStation_C_Class = {}

--- Loads and unloads Freight Cars that stop at the Freight Platform.
--- Loading and unloading options can be set by configuring the building.
--- Snaps to other Platforms and Stations.
--- Needs to be connected to a powered Railway to function.
---@class Build_TrainDockingStationLiquid_C : TrainPlatformCargo
Build_TrainDockingStationLiquid_C = {}
--- Loads and unloads Freight Cars that stop at the Freight Platform.
--- Loading and unloading options can be set by configuring the building.
--- Snaps to other Platforms and Stations.
--- Needs to be connected to a powered Railway to function.
---@class Build_TrainDockingStationLiquid_C-Class : TrainPlatformCargo-Class
Build_TrainDockingStationLiquid_C_Class = {}

--- 
---@class FGBuildableTrainPlatformEmpty : TrainPlatform
FGBuildableTrainPlatformEmpty = {}
--- 
---@class FGBuildableTrainPlatformEmpty-Class : TrainPlatform-Class
FGBuildableTrainPlatformEmpty_Class = {}

--- Creates empty space where necessary.
---@class Build_TrainPlatformEmpty_C : FGBuildableTrainPlatformEmpty
Build_TrainPlatformEmpty_C = {}
--- Creates empty space where necessary.
---@class Build_TrainPlatformEmpty_C-Class : FGBuildableTrainPlatformEmpty-Class
Build_TrainPlatformEmpty_C_Class = {}

--- Creates empty space where necessary.
---@class Build_TrainPlatformEmpty_02_C : FGBuildableTrainPlatformEmpty
Build_TrainPlatformEmpty_02_C = {}
--- Creates empty space where necessary.
---@class Build_TrainPlatformEmpty_02_C-Class : FGBuildableTrainPlatformEmpty-Class
Build_TrainPlatformEmpty_02_C_Class = {}

--- The resource sink, also known a A.W.E.S.O.M.E Sink
---@class ResourceSink : Factory
---@field public numPoints integer The number of available points.
---@field public numCoupons integer The number of available coupons to print.
---@field public numPointsToNextCoupon integer The number of needed points for the next coupon.
---@field public couponProgress number The percentage of the progress for the next coupon.
ResourceSink = {}
--- The resource sink, also known a A.W.E.S.O.M.E Sink
---@class ResourceSink-Class : Factory-Class
ResourceSink_Class = {}

--- Got excess resources? Fear not, for FICSIT does not waste! The newly developed AWESOME Sink turns any and all useful parts into research data just as fast as you can supply them! 
--- Participating pioneers will be compensated with Coupons that can be spent at the AWESOME Shop.
---@class Build_ResourceSink_C : ResourceSink
Build_ResourceSink_C = {}
--- Got excess resources? Fear not, for FICSIT does not waste! The newly developed AWESOME Sink turns any and all useful parts into research data just as fast as you can supply them! 
--- Participating pioneers will be compensated with Coupons that can be spent at the AWESOME Shop.
---@class Build_ResourceSink_C-Class : ResourceSink-Class
Build_ResourceSink_C_Class = {}

--- Got excess resources? Fear not, for FICSIT does not waste! The newly developed AWESOME Sink turns any and all useful parts into research data just as fast as you can supply them! 
--- Participating pioneers will be compensated with Coupons that can be spent at the AWESOME Shop.
---@class Serie_Sink_C : Build_ResourceSink_C
Serie_Sink_C = {}
--- Got excess resources? Fear not, for FICSIT does not waste! The newly developed AWESOME Sink turns any and all useful parts into research data just as fast as you can supply them! 
--- Participating pioneers will be compensated with Coupons that can be spent at the AWESOME Shop.
---@class Serie_Sink_C-Class : Build_ResourceSink_C-Class
Serie_Sink_C_Class = {}

--- 
---@class FGBuildableResourceSinkShop : Factory
FGBuildableResourceSinkShop = {}
--- 
---@class FGBuildableResourceSinkShop-Class : Factory-Class
FGBuildableResourceSinkShop_Class = {}

--- Redeem your FICSIT Coupons here! 
--- For those employees going the extra kilometer we have set aside special bonus milestones and rewards! Get your Coupons in the AWESOME Sink program now!
--- 
--- *No refunds possible.
---@class Build_ResourceSinkShop_C : FGBuildableResourceSinkShop
Build_ResourceSinkShop_C = {}
--- Redeem your FICSIT Coupons here! 
--- For those employees going the extra kilometer we have set aside special bonus milestones and rewards! Get your Coupons in the AWESOME Sink program now!
--- 
--- *No refunds possible.
---@class Build_ResourceSinkShop_C-Class : FGBuildableResourceSinkShop-Class
Build_ResourceSinkShop_C_Class = {}

--- 
---@class FGBuildableSpaceElevator : Factory
FGBuildableSpaceElevator = {}
--- 
---@class FGBuildableSpaceElevator-Class : Factory-Class
FGBuildableSpaceElevator_Class = {}

--- Requires deliveries of special Project Parts to complete Project Assembly Phases.
--- Completing these Phases will unlock new Tiers in the HUB Terminal.
---@class Build_SpaceElevator_C : FGBuildableSpaceElevator
Build_SpaceElevator_C = {}
--- Requires deliveries of special Project Parts to complete Project Assembly Phases.
--- Completing these Phases will unlock new Tiers in the HUB Terminal.
---@class Build_SpaceElevator_C-Class : FGBuildableSpaceElevator-Class
Build_SpaceElevator_C_Class = {}

--- The container that allows you to upload items to the dimensional depot. The dimensional depot is also known as central storage.
---@class DimensionalDepotUploader : FGBuildableStorage
---@field public isUploadingToCentralStorage boolean True if the uploader is currently uploading items to the dimensional depot.
---@field public centralStorageUploadProgress number The upload progress of the item that currently gets uploaded.
---@field public isUploadInventoryEmpty boolean True if the inventory of items to upload is empty.
---@field public centralStorage DimensionalDepot The central stroage it self.
DimensionalDepotUploader = {}
--- The container that allows you to upload items to the dimensional depot. The dimensional depot is also known as central storage.
---@class DimensionalDepotUploader-Class : FGBuildableStorage-Class
DimensionalDepotUploader_Class = {}

--- 
---@class FGBuildableStorage : Factory
FGBuildableStorage = {}
--- 
---@class FGBuildableStorage-Class : Factory-Class
FGBuildableStorage_Class = {}

--- The Dimensional Depot Uploader is used to upload resources to a dimensional storage deposit.
--- From here resources can be used by the Build Gun and Crafting Stations, as if they were in the pioneer Inventory.
---@class Build_CentralStorage_C : DimensionalDepotUploader
Build_CentralStorage_C = {}
--- The Dimensional Depot Uploader is used to upload resources to a dimensional storage deposit.
--- From here resources can be used by the Build Gun and Crafting Stations, as if they were in the pioneer Inventory.
---@class Build_CentralStorage_C-Class : DimensionalDepotUploader-Class
Build_CentralStorage_C_Class = {}

--- Dimensional Depot Uploader with Output
--- 
--- Items only enter according to the upload speed, when uploading is no longer necessary, the items are sent to the output.
---@class Build_Overlow1_C : Build_CentralStorage_C
Build_Overlow1_C = {}
--- Dimensional Depot Uploader with Output
--- 
--- Items only enter according to the upload speed, when uploading is no longer necessary, the items are sent to the output.
---@class Build_Overlow1_C-Class : Build_CentralStorage_C-Class
Build_Overlow1_C_Class = {}

--- Dimensional Depot Uploader with Output
--- 
--- The item always pass by. The overflow is uploaded.
--- 
--- Contains 24 slots.
---@class Build_Overlow_C : Build_CentralStorage_C
Build_Overlow_C = {}
--- Dimensional Depot Uploader with Output
--- 
--- The item always pass by. The overflow is uploaded.
--- 
--- Contains 24 slots.
---@class Build_Overlow_C-Class : Build_CentralStorage_C-Class
Build_Overlow_C_Class = {}

--- Contains 25 slots for storing large amounts of items.
---@class Build_StorageIntegrated_C : FGBuildableStorage
Build_StorageIntegrated_C = {}
--- Contains 25 slots for storing large amounts of items.
---@class Build_StorageIntegrated_C-Class : FGBuildableStorage-Class
Build_StorageIntegrated_C_Class = {}

--- Contains 24 slots for storing large amounts of items.
--- Has 1 Conveyor Belt input port and 1 Conveyor Belt output port.
---@class Build_StorageContainerMk1_C : FGBuildableStorage
Build_StorageContainerMk1_C = {}
--- Contains 24 slots for storing large amounts of items.
--- Has 1 Conveyor Belt input port and 1 Conveyor Belt output port.
---@class Build_StorageContainerMk1_C-Class : FGBuildableStorage-Class
Build_StorageContainerMk1_C_Class = {}

--- X
---@class Child_St_C : Build_StorageContainerMk1_C
Child_St_C = {}
--- X
---@class Child_St_C-Class : Build_StorageContainerMk1_C-Class
Child_St_C_Class = {}

--- Has 3 inputs and 9 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_3to9_C : FGBuildableStorage
MultiVBalanc_3to9_C = {}
--- Has 3 inputs and 9 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_3to9_C-Class : FGBuildableStorage-Class
MultiVBalanc_3to9_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 9 meters spacing.
---@class MultiSplitter_9m_C : FGBuildableStorage
MultiSplitter_9m_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 9 meters spacing.
---@class MultiSplitter_9m_C-Class : FGBuildableStorage-Class
MultiSplitter_9m_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 22 meters spacing.
---@class MultiSplitter_22m_C : FGBuildableStorage
MultiSplitter_22m_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 22 meters spacing.
---@class MultiSplitter_22m_C-Class : FGBuildableStorage-Class
MultiSplitter_22m_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 8 meters spacing.
---@class MultiSplitter_8m_C : FGBuildableStorage
MultiSplitter_8m_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 8 meters spacing.
---@class MultiSplitter_8m_C-Class : FGBuildableStorage-Class
MultiSplitter_8m_C_Class = {}

--- Splits conveyor belts.
---@class Build_TripleUnidirectional_V_C : FGBuildableStorage
Build_TripleUnidirectional_V_C = {}
--- Splits conveyor belts.
---@class Build_TripleUnidirectional_V_C-Class : FGBuildableStorage-Class
Build_TripleUnidirectional_V_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 10 meters spacing.
---@class MultiMerger_2_C : FGBuildableStorage
MultiMerger_2_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 10 meters spacing.
---@class MultiMerger_2_C-Class : FGBuildableStorage-Class
MultiMerger_2_C_Class = {}

--- Has 9 inputs and 3 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_9to3_2_C : FGBuildableStorage
MultiVBalanc_9to3_2_C = {}
--- Has 9 inputs and 3 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_9to3_2_C-Class : FGBuildableStorage-Class
MultiVBalanc_9to3_2_C_Class = {}

--- Splits conveyor belts.
---@class Build_TripleUnidirectional_H_C : FGBuildableStorage
Build_TripleUnidirectional_H_C = {}
--- Splits conveyor belts.
---@class Build_TripleUnidirectional_H_C-Class : FGBuildableStorage-Class
Build_TripleUnidirectional_H_C_Class = {}

--- Has 12 inputs and 12 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_12to12_C : FGBuildableStorage
MultiVBalanc_12to12_C = {}
--- Has 12 inputs and 12 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_12to12_C-Class : FGBuildableStorage-Class
MultiVBalanc_12to12_C_Class = {}

--- Has 6 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
--- Has 12 meters spacing.
---@class MultiBalanc_3_C : FGBuildableStorage
MultiBalanc_3_C = {}
--- Has 6 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
--- Has 12 meters spacing.
---@class MultiBalanc_3_C-Class : FGBuildableStorage-Class
MultiBalanc_3_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 18 meters spacing.
---@class MultiSplitter_18m_C : FGBuildableStorage
MultiSplitter_18m_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 18 meters spacing.
---@class MultiSplitter_18m_C-Class : FGBuildableStorage-Class
MultiSplitter_18m_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 22 meters spacing.
---@class MultiMerger_22m_C : FGBuildableStorage
MultiMerger_22m_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 22 meters spacing.
---@class MultiMerger_22m_C-Class : FGBuildableStorage-Class
MultiMerger_22m_C_Class = {}

--- Has 6 inputs and 18 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_3_C : FGBuildableStorage
MultiVBalanc_3_C = {}
--- Has 6 inputs and 18 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_3_C-Class : FGBuildableStorage-Class
MultiVBalanc_3_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 18 meters spacing.
---@class MultiMerger_18m_C : FGBuildableStorage
MultiMerger_18m_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 18 meters spacing.
---@class MultiMerger_18m_C-Class : FGBuildableStorage-Class
MultiMerger_18m_C_Class = {}

--- Has 6 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
--- Has 6 meters spacing.
---@class MultiBalanc_C : FGBuildableStorage
MultiBalanc_C = {}
--- Has 6 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
--- Has 6 meters spacing.
---@class MultiBalanc_C-Class : FGBuildableStorage-Class
MultiBalanc_C_Class = {}

--- Has 18 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_18to6_C : FGBuildableStorage
MultiVBalanc_18to6_C = {}
--- Has 18 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
---@class MultiVBalanc_18to6_C-Class : FGBuildableStorage-Class
MultiVBalanc_18to6_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 10 meters spacing.
---@class MultiSplitter_2_C : FGBuildableStorage
MultiSplitter_2_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 10 meters spacing.
---@class MultiSplitter_2_C-Class : FGBuildableStorage-Class
MultiSplitter_2_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 8 meters spacing.
---@class MultiMerger_8m_C : FGBuildableStorage
MultiMerger_8m_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 8 meters spacing.
---@class MultiMerger_8m_C-Class : FGBuildableStorage-Class
MultiMerger_8m_C_Class = {}

--- Has 6 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
--- Has 10 meters spacing.
---@class MultiBalanc_2_C : FGBuildableStorage
MultiBalanc_2_C = {}
--- Has 6 inputs and 6 outputs.
--- Not Compatible with Area Actions!!!
--- Has 10 meters spacing.
---@class MultiBalanc_2_C-Class : FGBuildableStorage-Class
MultiBalanc_2_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 12 meters spacing.
---@class MultiMerger_3_C : FGBuildableStorage
MultiMerger_3_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 12 meters spacing.
---@class MultiMerger_3_C-Class : FGBuildableStorage-Class
MultiMerger_3_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 6 meters spacing.
---@class MultiSplitter_C : FGBuildableStorage
MultiSplitter_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 6 meters spacing.
---@class MultiSplitter_C-Class : FGBuildableStorage-Class
MultiSplitter_C_Class = {}

--- Splits conveyor belts.
---@class Build_TripleC_C : FGBuildableStorage
Build_TripleC_C = {}
--- Splits conveyor belts.
---@class Build_TripleC_C-Class : FGBuildableStorage-Class
Build_TripleC_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 9 meters spacing.
---@class MultiMerger_9m_C : FGBuildableStorage
MultiMerger_9m_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 9 meters spacing.
---@class MultiMerger_9m_C-Class : FGBuildableStorage-Class
MultiMerger_9m_C_Class = {}

--- Splits conveyor belts.
---@class Build_TripleB_C : FGBuildableStorage
Build_TripleB_C = {}
--- Splits conveyor belts.
---@class Build_TripleB_C-Class : FGBuildableStorage-Class
Build_TripleB_C_Class = {}

--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 12 meters spacing.
---@class MultiSplitter_3_C : FGBuildableStorage
MultiSplitter_3_C = {}
--- Splits conveyor belts in eleven. 
--- Useful to move parts and resources from oversaturated conveyor belts.
--- Has 12 meters spacing.
---@class MultiSplitter_3_C-Class : FGBuildableStorage-Class
MultiSplitter_3_C_Class = {}

--- Merges up to eleven  conveyor belts into one.
--- Has 6 meters spacing.
---@class MultiMerger_C : FGBuildableStorage
MultiMerger_C = {}
--- Merges up to eleven  conveyor belts into one.
--- Has 6 meters spacing.
---@class MultiMerger_C-Class : FGBuildableStorage-Class
MultiMerger_C_Class = {}

--- Contains 48 slots for storing large amounts of items.
--- Has 2 Conveyor Belt input ports and 2 Conveyor Belt output ports.
---@class Build_StorageContainerMk2_C : FGBuildableStorage
Build_StorageContainerMk2_C = {}
--- Contains 48 slots for storing large amounts of items.
--- Has 2 Conveyor Belt input ports and 2 Conveyor Belt output ports.
---@class Build_StorageContainerMk2_C-Class : FGBuildableStorage-Class
Build_StorageContainerMk2_C_Class = {}

--- Blueprint Storage that parts are returned to when the Blueprint Designer is cleared.
--- 
--- 40 slots.
---@class Build_StorageBlueprint_C : FGBuildableStorage
Build_StorageBlueprint_C = {}
--- Blueprint Storage that parts are returned to when the Blueprint Designer is cleared.
--- 
--- 40 slots.
---@class Build_StorageBlueprint_C-Class : FGBuildableStorage-Class
Build_StorageBlueprint_C_Class = {}

--- Contains 25 slots for storing large amounts of items.
---@class Build_StorageHazard_C : FGBuildableStorage
Build_StorageHazard_C = {}
--- Contains 25 slots for storing large amounts of items.
---@class Build_StorageHazard_C-Class : FGBuildableStorage-Class
Build_StorageHazard_C_Class = {}

--- Contains 25 slots for storing large amounts of items.
---@class Build_StorageMedkit_C : FGBuildableStorage
Build_StorageMedkit_C = {}
--- Contains 25 slots for storing large amounts of items.
---@class Build_StorageMedkit_C-Class : FGBuildableStorage-Class
Build_StorageMedkit_C_Class = {}

--- Contains 25 slots for storing large amounts of items.
---@class Build_StoragePlayer_C : FGBuildableStorage
Build_StoragePlayer_C = {}
--- Contains 25 slots for storing large amounts of items.
---@class Build_StoragePlayer_C-Class : FGBuildableStorage-Class
Build_StoragePlayer_C_Class = {}

--- The heart of your factory. This is where you complete FICSIT milestones to unlock additional schematics for buildings, vehicles, parts, equipment, etc.
---@class Build_TradingPost_C : FGBuildableTradingPost
Build_TradingPost_C = {}
--- The heart of your factory. This is where you complete FICSIT milestones to unlock additional schematics for buildings, vehicles, parts, equipment, etc.
---@class Build_TradingPost_C-Class : FGBuildableTradingPost-Class
Build_TradingPost_C_Class = {}

--- 
---@class FGBuildableTradingPost : Factory
FGBuildableTradingPost = {}
--- 
---@class FGBuildableTradingPost-Class : Factory-Class
FGBuildableTradingPost_Class = {}

--- 
---@class CL_CounterLimiter : Factory
CL_CounterLimiter = {}
--- 
---@param NewLimit number 
---@type (fun(self:CL_CounterLimiter,NewLimit:number))|ReflectionFunction
function CL_CounterLimiter:SetThroughputLimit(NewLimit) end
--- 
---@return number ReturnValue 
---@type (fun(self:CL_CounterLimiter):(ReturnValue:number))|ReflectionFunction
function CL_CounterLimiter:GetThroughputLimit() end
--- 
---@return number ReturnValue 
---@type (fun(self:CL_CounterLimiter):(ReturnValue:number))|ReflectionFunction
function CL_CounterLimiter:GetCurrentIPM() end
--- 
---@class CL_CounterLimiter-Class : Factory-Class
CL_CounterLimiter_Class = {}

--- A conveyor belt attachment that counts and displays the actual item throughput per minute. Can optionally limit the number of items allowed per minute.
---@class Build_CounterLimiter_C : CL_CounterLimiter
Build_CounterLimiter_C = {}
--- A conveyor belt attachment that counts and displays the actual item throughput per minute. Can optionally limit the number of items allowed per minute.
---@class Build_CounterLimiter_C-Class : CL_CounterLimiter-Class
Build_CounterLimiter_C_Class = {}

--- 
---@class LBBuild_ModularLoadBalancer : Factory
LBBuild_ModularLoadBalancer = {}
--- 
---@class LBBuild_ModularLoadBalancer-Class : Factory-Class
LBBuild_ModularLoadBalancer_Class = {}

--- Modular attachment that can be snapped together to form a load balancer of any size
---@class Build_ModularLoadBalancer_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_C = {}
--- Modular attachment that can be snapped together to form a load balancer of any size
---@class Build_ModularLoadBalancer_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_C_Class = {}

--- No input or output. Can be used to space out and connect other modules.
---@class Build_ModularLoadBalancer_Box_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Box_C = {}
--- No input or output. Can be used to space out and connect other modules.
---@class Build_ModularLoadBalancer_Box_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Box_C_Class = {}

--- No input or output. Can be used to space out and connect other modules.
---@class Build_ModularLoadBalancer_Block_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Block_C = {}
--- No input or output. Can be used to space out and connect other modules.
---@class Build_ModularLoadBalancer_Block_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Block_C_Class = {}

--- Has only an Input.
---@class Build_ModularLoadBalancer_Input_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Input_C = {}
--- Has only an Input.
---@class Build_ModularLoadBalancer_Input_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Input_C_Class = {}

--- Has Input and Output. If there are no other Outputs in the Balancer group then items are sent to this Output.
---@class Build_ModularLoadBalancer_Overflow_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Overflow_C = {}
--- Has Input and Output. If there are no other Outputs in the Balancer group then items are sent to this Output.
---@class Build_ModularLoadBalancer_Overflow_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Overflow_C_Class = {}

--- Has Input and Output. A filter can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Filtered_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Filtered_C = {}
--- Has Input and Output. A filter can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Filtered_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Filtered_C_Class = {}

--- Has Input and Output. Multiple filters can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Programmable_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Programmable_C = {}
--- Has Input and Output. Multiple filters can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Programmable_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Programmable_C_Class = {}

--- Only has an Output. If there are no other Outputs in the Balancer group then items are sent to this Output.
---@class Build_ModularLoadBalancer_Overflow_Output_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Overflow_Output_C = {}
--- Only has an Output. If there are no other Outputs in the Balancer group then items are sent to this Output.
---@class Build_ModularLoadBalancer_Overflow_Output_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Overflow_Output_C_Class = {}

--- Only has an Output. Multiple filters can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Programmable_Output_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Programmable_Output_C = {}
--- Only has an Output. Multiple filters can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Programmable_Output_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Programmable_Output_C_Class = {}

--- Has only an Output. A filter can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Filtered_Output_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Filtered_Output_C = {}
--- Has only an Output. A filter can be defined for the Output. The filtered output is prioritized over non-filtered modules.
---@class Build_ModularLoadBalancer_Filtered_Output_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Filtered_Output_C_Class = {}

--- Has only an Output.
---@class Build_ModularLoadBalancer_Output_C : LBBuild_ModularLoadBalancer
Build_ModularLoadBalancer_Output_C = {}
--- Has only an Output.
---@class Build_ModularLoadBalancer_Output_C-Class : LBBuild_ModularLoadBalancer-Class
Build_ModularLoadBalancer_Output_C_Class = {}

--- 
---@class Build_CheatPowerSource_C : Factory
Build_CheatPowerSource_C = {}
--- 
---@class Build_CheatPowerSource_C-Class : Factory-Class
Build_CheatPowerSource_C_Class = {}

--- 
---@class Build_CheatPowerSink_C : Factory
Build_CheatPowerSink_C = {}
--- 
---@class Build_CheatPowerSink_C-Class : Factory-Class
Build_CheatPowerSink_C_Class = {}

--- Propels you upwards through the air.
--- Make sure you land softly.
---@class Build_JumpPad_C : Factory
Build_JumpPad_C = {}
--- Propels you upwards through the air.
--- Make sure you land softly.
---@class Build_JumpPad_C-Class : Factory-Class
Build_JumpPad_C_Class = {}

--- Propels you forwards through the air.
--- Make sure you land softly.
---@class Build_JumpPadTilted_C : Build_JumpPad_C
Build_JumpPadTilted_C = {}
--- Propels you forwards through the air.
--- Make sure you land softly.
---@class Build_JumpPadTilted_C-Class : Build_JumpPad_C-Class
Build_JumpPadTilted_C_Class = {}

--- Generates a speed-dampening jelly.
--- Guarantees a safe landing.
---@class Build_LandingPad_C : Factory
Build_LandingPad_C = {}
--- Generates a speed-dampening jelly.
--- Guarantees a safe landing.
---@class Build_LandingPad_C-Class : Factory-Class
Build_LandingPad_C_Class = {}

--- A giant, delicious Candy Cane.
--- 
--- *Warning: Not actually delicious... or edible, for that matter.
---@class Build_CandyCaneDecor_C : Factory
Build_CandyCaneDecor_C = {}
--- A giant, delicious Candy Cane.
--- 
--- *Warning: Not actually delicious... or edible, for that matter.
---@class Build_CandyCaneDecor_C-Class : Factory-Class
Build_CandyCaneDecor_C_Class = {}

--- Do you wanna build it?
--- You will finally have a friend!
--- 
--- *Disclaimer: It is not actually your friend.
---@class Build_Snowman_C : Factory
Build_Snowman_C = {}
--- Do you wanna build it?
--- You will finally have a friend!
--- 
--- *Disclaimer: It is not actually your friend.
---@class Build_Snowman_C-Class : Factory-Class
Build_Snowman_C_Class = {}

--- 
---@class FGBuildableBeam : FGBuildableFactoryBuilding
FGBuildableBeam = {}
--- 
---@class FGBuildableBeam-Class : FGBuildableFactoryBuilding-Class
FGBuildableBeam_Class = {}

--- 
---@class FGBuildableFactoryBuilding : Buildable
FGBuildableFactoryBuilding = {}
--- 
---@class FGBuildableFactoryBuilding-Class : Buildable-Class
FGBuildableFactoryBuilding_Class = {}

--- 
---@class FGBuildableBeamLightweight : FGBuildableBeam
FGBuildableBeamLightweight = {}
--- 
---@class FGBuildableBeamLightweight-Class : FGBuildableBeam-Class
FGBuildableBeamLightweight_Class = {}

--- Snaps to other Beams and various other structural buildings.
--- Beams support multiple build modes for different use cases.
---@class Build_Beam_Painted_C : FGBuildableBeamLightweight
Build_Beam_Painted_C = {}
--- Snaps to other Beams and various other structural buildings.
--- Beams support multiple build modes for different use cases.
---@class Build_Beam_Painted_C-Class : FGBuildableBeamLightweight-Class
Build_Beam_Painted_C_Class = {}

--- Snaps to other Beams and various other structural buildings.
--- Beams support multiple build modes for different use cases.
---@class Build_Beam_C : FGBuildableBeamLightweight
Build_Beam_C = {}
--- Snaps to other Beams and various other structural buildings.
--- Beams support multiple build modes for different use cases.
---@class Build_Beam_C-Class : FGBuildableBeamLightweight-Class
Build_Beam_C_Class = {}

--- 
---@class FGBuildableCornerWall : FGBuildableFactoryBuilding
FGBuildableCornerWall = {}
--- 
---@class FGBuildableCornerWall-Class : FGBuildableFactoryBuilding-Class
FGBuildableCornerWall_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Metal_InCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Metal_InCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Metal_InCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Metal_InCorner_01_C_Class = {}

--- 
---@class FGBuildableCornerWallLightweight : FGBuildableCornerWall
FGBuildableCornerWallLightweight = {}
--- 
---@class FGBuildableCornerWallLightweight-Class : FGBuildableCornerWall-Class
FGBuildableCornerWallLightweight_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Metal_InCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Metal_InCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Metal_InCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Metal_InCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Metal_InCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Metal_InCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Metal_InCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Metal_InCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Metal_OutCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Metal_OutCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Metal_OutCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Metal_OutCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Metal_OutCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Metal_OutCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Metal_OutCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Metal_OutCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Metal_OutCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Metal_OutCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Metal_OutCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Metal_OutCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Orange_InCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Orange_InCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Orange_InCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Orange_InCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Orange_InCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Orange_InCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Orange_InCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Orange_InCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Orange_InCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Orange_InCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Orange_InCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Orange_InCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Orange_OutCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Orange_OutCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Orange_OutCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Orange_OutCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Orange_OutCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Orange_OutCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Orange_OutCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Orange_OutCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Orange_OutCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Orange_OutCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Orange_OutCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Orange_OutCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Tar_InCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Tar_InCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Tar_InCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Tar_InCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Tar_InCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Tar_InCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Tar_InCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Tar_InCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Tar_InCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Tar_InCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Tar_InCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Tar_InCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Tar_OutCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Tar_OutCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Tar_OutCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Tar_OutCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Tar_OutCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Tar_OutCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Tar_OutCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Tar_OutCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Tar_OutCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Tar_OutCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Tar_OutCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Tar_OutCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Window_InCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Window_InCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Window_InCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Window_InCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Window_InCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Window_InCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Window_InCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Window_InCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Window_InCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Window_InCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Window_InCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Window_InCorner_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Window_OutCorner_01_C : FGBuildableCornerWallLightweight
Build_Roof_Window_OutCorner_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Window_OutCorner_01_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Window_OutCorner_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Window_OutCorner_02_C : FGBuildableCornerWallLightweight
Build_Roof_Window_OutCorner_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Window_OutCorner_02_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Window_OutCorner_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Window_OutCorner_03_C : FGBuildableCornerWallLightweight
Build_Roof_Window_OutCorner_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Window_OutCorner_03_C-Class : FGBuildableCornerWallLightweight-Class
Build_Roof_Window_OutCorner_03_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_8x8_Corner_2_C : FGBuildableCornerWall
Build_Wall_Concrete_8x8_Corner_2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_8x8_Corner_2_C-Class : FGBuildableCornerWall-Class
Build_Wall_Concrete_8x8_Corner_2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Corner_2_C : FGBuildableCornerWall
Build_Wall_Concrete_8x4_Corner_2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Corner_2_C-Class : FGBuildableCornerWall-Class
Build_Wall_Concrete_8x4_Corner_2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_8x8_Corner_02_C : FGBuildableCornerWall
Build_Wall_Orange_8x8_Corner_02_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_8x8_Corner_02_C-Class : FGBuildableCornerWall-Class
Build_Wall_Orange_8x8_Corner_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_8x4_Corner_02_C : FGBuildableCornerWall
Build_Wall_Orange_8x4_Corner_02_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_8x4_Corner_02_C-Class : FGBuildableCornerWall-Class
Build_Wall_Orange_8x4_Corner_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Steel_8x8_Corner_01_C : FGBuildableCornerWall
Build_Wall_Steel_8x8_Corner_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Steel_8x8_Corner_01_C-Class : FGBuildableCornerWall-Class
Build_Wall_Steel_8x8_Corner_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Steel_8x4_Corner_01_C : FGBuildableCornerWall
Build_Wall_Steel_8x4_Corner_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Steel_8x4_Corner_01_C-Class : FGBuildableCornerWall-Class
Build_Wall_Steel_8x4_Corner_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Steel_8x4_Corner_2_C : FGBuildableCornerWall
Build_Wall_Steel_8x4_Corner_2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Steel_8x4_Corner_2_C-Class : FGBuildableCornerWall-Class
Build_Wall_Steel_8x4_Corner_2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Steel_8x8_Corner_2_C : FGBuildableCornerWall
Build_Wall_Steel_8x8_Corner_2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Steel_8x8_Corner_2_C-Class : FGBuildableCornerWall-Class
Build_Wall_Steel_8x8_Corner_2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Corner_01_C : FGBuildableCornerWall
Build_Wall_Concrete_8x4_Corner_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Corner_01_C-Class : FGBuildableCornerWall-Class
Build_Wall_Concrete_8x4_Corner_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_8x8_Corner_01_C : FGBuildableCornerWall
Build_Wall_Concrete_8x8_Corner_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_8x8_Corner_01_C-Class : FGBuildableCornerWall-Class
Build_Wall_Concrete_8x8_Corner_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_8x8_Corner_01_C : FGBuildableCornerWall
Build_Wall_Orange_8x8_Corner_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_8x8_Corner_01_C-Class : FGBuildableCornerWall-Class
Build_Wall_Orange_8x8_Corner_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_8x4_Corner_01_C : FGBuildableCornerWall
Build_Wall_Orange_8x4_Corner_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_8x4_Corner_01_C-Class : FGBuildableCornerWall-Class
Build_Wall_Orange_8x4_Corner_01_C_Class = {}

--- The base class of all doors.
---@class Door : FGBuildableWall
Door = {}
--- Returns the Door Mode/Configuration.
--- 0 = Automatic
--- 1 = Always Closed
--- 2 = Always Open
---@return integer configuration The current door mode/configuration.
---@type (fun(self:Door):(configuration:integer))|ReflectionFunction
function Door:getConfiguration() end
--- Sets the Door Mode/Configuration, only some modes are allowed, if the mod you try to set is invalid, nothing changes.
--- 0 = Automatic
--- 1 = Always Closed
--- 2 = Always Open
---@param configuration integer The new configuration for the door.
---@return Future_Door_setConfiguration
---@type (fun(self:Door,configuration:integer))|ReflectionFunction
function Door:setConfiguration(configuration) end
---@class Future_Door_setConfiguration : Future
Future_Door_setConfiguration = {}
---@type fun(self:Future_Door_setConfiguration)
function Future_Door_setConfiguration:await() end
---@type fun(self:Future_Door_setConfiguration)
function Future_Door_setConfiguration:get() end
---@type fun(self:Future_Door_setConfiguration):boolean
function Future_Door_setConfiguration:canGet() end
--- The base class of all doors.
---@class Door-Class : FGBuildableWall-Class
Door_Class = {}

--- 
---@class FGBuildableWall : FGBuildableFactoryBuilding
FGBuildableWall = {}
--- 
---@class FGBuildableWall-Class : FGBuildableFactoryBuilding-Class
FGBuildableWall_Class = {}

--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_01_C : BUILD_SingleDoor_Base_01_C
Build_Wall_Door_8x4_01_C = {}
--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_01_C-Class : BUILD_SingleDoor_Base_01_C-Class
Build_Wall_Door_8x4_01_C_Class = {}

--- 
---@class BUILD_SingleDoor_Base_01_C : Door
BUILD_SingleDoor_Base_01_C = {}
--- 
---@class BUILD_SingleDoor_Base_01_C-Class : Door-Class
BUILD_SingleDoor_Base_01_C_Class = {}

--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_SDoor_8x4_C : BUILD_SingleDoor_Base_01_C
Build_Wall_Concrete_SDoor_8x4_C = {}
--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_SDoor_8x4_C-Class : BUILD_SingleDoor_Base_01_C-Class
Build_Wall_Concrete_SDoor_8x4_C_Class = {}

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_SteelWall_8x4_DoorS_01_C : BUILD_SingleDoor_Base_01_C
Build_SteelWall_8x4_DoorS_01_C = {}
--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_SteelWall_8x4_DoorS_01_C-Class : BUILD_SingleDoor_Base_01_C-Class
Build_SteelWall_8x4_DoorS_01_C_Class = {}

--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_03_Steel_C : Build_SteelWall_8x4_DoorS_01_C
Build_Wall_Door_8x4_03_Steel_C = {}
--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_03_Steel_C-Class : Build_SteelWall_8x4_DoorS_01_C-Class
Build_Wall_Door_8x4_03_Steel_C_Class = {}

--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_CDoor_8x4_C : BUILD_SingleDoor_Base_01_C
Build_Wall_Concrete_CDoor_8x4_C = {}
--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_CDoor_8x4_C-Class : BUILD_SingleDoor_Base_01_C-Class
Build_Wall_Concrete_CDoor_8x4_C_Class = {}

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_SteelWall_8x4_DoorC_01_C : BUILD_SingleDoor_Base_01_C
Build_SteelWall_8x4_DoorC_01_C = {}
--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_SteelWall_8x4_DoorC_01_C-Class : BUILD_SingleDoor_Base_01_C-Class
Build_SteelWall_8x4_DoorC_01_C_Class = {}

--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_01_Steel_C : Build_SteelWall_8x4_DoorC_01_C
Build_Wall_Door_8x4_01_Steel_C = {}
--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_01_Steel_C-Class : Build_SteelWall_8x4_DoorC_01_C-Class
Build_Wall_Door_8x4_01_Steel_C_Class = {}

--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_03_C : BUILD_SingleDoor_Base_01_C
Build_Wall_Door_8x4_03_C = {}
--- Allows pioneers to pass through a wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Door_8x4_03_C-Class : BUILD_SingleDoor_Base_01_C-Class
Build_Wall_Door_8x4_03_C_Class = {}

--- Automatically opens when living beings or vehicles approach it.
--- Gate settings can be configured.
--- Snaps to Foundations and Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Gate_Automated_8x4_C : Door
Build_Gate_Automated_8x4_C = {}
--- Automatically opens when living beings or vehicles approach it.
--- Gate settings can be configured.
--- Snaps to Foundations and Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Gate_Automated_8x4_C-Class : Door-Class
Build_Gate_Automated_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_01_C : FGBuildableWallLightweight
Build_SteelWall_8x4_Window_01_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_01_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x4_Window_01_C_Class = {}

--- 
---@class FGBuildableWallLightweight : FGBuildableWall
FGBuildableWallLightweight = {}
--- 
---@class FGBuildableWallLightweight-Class : FGBuildableWall-Class
FGBuildableWallLightweight_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_01_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_Window_01_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_Window_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Concrete_8x1_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Concrete_8x1_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_Angular_8x4_C : FGBuildableWallLightweight
Build_Wall_Concrete_Angular_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_Angular_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Angular_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Concrete_Tris_8x2_C : FGBuildableWallLightweight
Build_Wall_Concrete_Tris_8x2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Concrete_Tris_8x2_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Tris_8x2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Concrete_FlipTris_8x1_C : FGBuildableWallLightweight
Build_Wall_Concrete_FlipTris_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Concrete_FlipTris_8x1_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_FlipTris_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_Tris_8x8_C : FGBuildableWallLightweight
Build_Wall_Orange_Tris_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_Tris_8x8_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_Tris_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Concrete_FlipTris_8x2_C : FGBuildableWallLightweight
Build_Wall_Concrete_FlipTris_8x2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Concrete_FlipTris_8x2_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_FlipTris_8x2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_FlipTris_8x4_C : FGBuildableWallLightweight
Build_Wall_Concrete_FlipTris_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_FlipTris_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_FlipTris_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_FlipTris_8x8_C : FGBuildableWallLightweight
Build_Wall_Concrete_FlipTris_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_FlipTris_8x8_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_FlipTris_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Concrete_Tris_8x1_C : FGBuildableWallLightweight
Build_Wall_Concrete_Tris_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Concrete_Tris_8x1_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Tris_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_Tris_8x4_C : FGBuildableWallLightweight
Build_Wall_Concrete_Tris_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_Tris_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Tris_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_FlipTris_8x8_C : FGBuildableWallLightweight
Build_Wall_Orange_FlipTris_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_FlipTris_8x8_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_FlipTris_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_Angular_8x8_C : FGBuildableWallLightweight
Build_Wall_Concrete_Angular_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_Angular_8x8_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Angular_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Orange_Tris_8x1_C : FGBuildableWallLightweight
Build_Wall_Orange_Tris_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Orange_Tris_8x1_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_Tris_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_Angular_8x4_C : FGBuildableWallLightweight
Build_Wall_Orange_Angular_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_Angular_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_Angular_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Orange_FlipTris_8x1_C : FGBuildableWallLightweight
Build_Wall_Orange_FlipTris_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Orange_FlipTris_8x1_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_FlipTris_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_Angular_8x8_C : FGBuildableWallLightweight
Build_Wall_Orange_Angular_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Orange_Angular_8x8_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_Angular_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Orange_Tris_8x2_C : FGBuildableWallLightweight
Build_Wall_Orange_Tris_8x2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Orange_Tris_8x2_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_Tris_8x2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Orange_FlipTris_8x2_C : FGBuildableWallLightweight
Build_Wall_Orange_FlipTris_8x2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_Wall_Orange_FlipTris_8x2_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_FlipTris_8x2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_FlipTris_8x4_C : FGBuildableWallLightweight
Build_Wall_Orange_FlipTris_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_FlipTris_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_FlipTris_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_Tris_8x4_C : FGBuildableWallLightweight
Build_Wall_Orange_Tris_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Orange_Tris_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_Tris_8x4_C_Class = {}

--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_ConveyorHole_01_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_ConveyorHole_01_C = {}
--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_ConveyorHole_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_ConveyorHole_01_C_Class = {}

--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_ConveyorHole_02_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_ConveyorHole_02_C = {}
--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_ConveyorHole_02_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_ConveyorHole_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_C : FGBuildableWallLightweight
Build_SteelWall_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_FlipTris_8x4_C : FGBuildableWallLightweight
Build_SteelWall_FlipTris_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_FlipTris_8x4_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_FlipTris_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_SteelWall_FlipTris_8x1_C : FGBuildableWallLightweight
Build_SteelWall_FlipTris_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_SteelWall_FlipTris_8x1_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_FlipTris_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_SteelWall_Tris_8x8_C : FGBuildableWallLightweight
Build_SteelWall_Tris_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_SteelWall_Tris_8x8_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_Tris_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_WallSet_Steel_Angular_8x4_C : FGBuildableWallLightweight
Build_WallSet_Steel_Angular_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_WallSet_Steel_Angular_8x4_C-Class : FGBuildableWallLightweight-Class
Build_WallSet_Steel_Angular_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_8x4_02_C : FGBuildableWallLightweight
Build_Wall_8x4_02_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_8x4_02_C-Class : FGBuildableWallLightweight-Class
Build_Wall_8x4_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_SteelWall_8x1_C : FGBuildableWallLightweight
Build_SteelWall_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_SteelWall_8x1_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_Tris_8x4_C : FGBuildableWallLightweight
Build_SteelWall_Tris_8x4_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_Tris_8x4_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_Tris_8x4_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_WallSet_Steel_Angular_8x8_C : FGBuildableWallLightweight
Build_WallSet_Steel_Angular_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_WallSet_Steel_Angular_8x8_C-Class : FGBuildableWallLightweight-Class
Build_WallSet_Steel_Angular_8x8_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_SteelWall_Tris_8x2_C : FGBuildableWallLightweight
Build_SteelWall_Tris_8x2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_SteelWall_Tris_8x2_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_Tris_8x2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_SteelWall_Tris_8x1_C : FGBuildableWallLightweight
Build_SteelWall_Tris_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_SteelWall_Tris_8x1_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_Tris_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_SteelWall_FlipTris_8x2_C : FGBuildableWallLightweight
Build_SteelWall_FlipTris_8x2_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 2 m
---@class Build_SteelWall_FlipTris_8x2_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_FlipTris_8x2_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_8x4_01_C : FGBuildableWallLightweight
Build_Wall_8x4_01_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_8x4_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_8x4_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_04_C : FGBuildableWallLightweight
Build_SteelWall_8x4_Window_04_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_04_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x4_Window_04_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_02_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_Window_02_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_02_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_Window_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Orange_8x1_C : FGBuildableWallLightweight
Build_Wall_Orange_8x1_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 1 m
---@class Build_Wall_Orange_8x1_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Orange_8x1_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_03_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_Window_03_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_03_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_Window_03_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_03_C : FGBuildableWallLightweight
Build_SteelWall_8x4_Window_03_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_03_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x4_Window_03_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_02_C : FGBuildableWallLightweight
Build_SteelWall_8x4_Window_02_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Window_02_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x4_Window_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_04_C : FGBuildableWallLightweight
Build_Wall_Concrete_8x4_Window_04_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_Window_04_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_8x4_Window_04_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_Tris_8x8_C : FGBuildableWallLightweight
Build_Wall_Concrete_Tris_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_Wall_Concrete_Tris_8x8_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Tris_8x8_C_Class = {}

--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_01_Steel_C : FGBuildableWallLightweight
Build_Wall_Conveyor_8x4_01_Steel_C = {}
--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_01_Steel_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Conveyor_8x4_01_Steel_C_Class = {}

--- Allows pioneers to pass through a Wall.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Gate_01_C : FGBuildableWallLightweight
Build_SteelWall_8x4_Gate_01_C = {}
--- Allows pioneers to pass through a Wall.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_SteelWall_8x4_Gate_01_C-Class : FGBuildableWallLightweight-Class
Build_SteelWall_8x4_Gate_01_C_Class = {}

--- Allows pioneers to pass through a Wall.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_Gate_8x4_C : FGBuildableWallLightweight
Build_Wall_Concrete_Gate_8x4_C = {}
--- Allows pioneers to pass through a Wall.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_Gate_8x4_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Concrete_Gate_8x4_C_Class = {}

--- Allows pioneers to pass through a Wall.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Gate_8x4_01_C : FGBuildableWallLightweight
Build_Wall_Gate_8x4_01_C = {}
--- Allows pioneers to pass through a Wall.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Gate_8x4_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Gate_8x4_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_01_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_01_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_04_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_04_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_04_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_04_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_03_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_03_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_03_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_03_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_02_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_02_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_02_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_02_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_Thin_8x4_01_C : FGBuildableWallLightweight
Build_Wall_Window_Thin_8x4_01_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_Thin_8x4_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_Thin_8x4_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_Thin_8x4_02_C : FGBuildableWallLightweight
Build_Wall_Window_Thin_8x4_02_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_Thin_8x4_02_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_Thin_8x4_02_C_Class = {}

--- Creates a safer and more efficient working environment.
---@class Build_Barrier_Low_01_C : FGBuildableWallLightweight
Build_Barrier_Low_01_C = {}
--- Creates a safer and more efficient working environment.
---@class Build_Barrier_Low_01_C-Class : FGBuildableWallLightweight-Class
Build_Barrier_Low_01_C_Class = {}

--- Creates a safer and more efficient working environment.
---@class Build_Barrier_Tall_01_C : FGBuildableWallLightweight
Build_Barrier_Tall_01_C = {}
--- Creates a safer and more efficient working environment.
---@class Build_Barrier_Tall_01_C-Class : FGBuildableWallLightweight-Class
Build_Barrier_Tall_01_C_Class = {}

--- Creates a safer and more efficient working environment.
---@class Build_Concrete_Barrier_01_C : FGBuildableWallLightweight
Build_Concrete_Barrier_01_C = {}
--- Creates a safer and more efficient working environment.
---@class Build_Concrete_Barrier_01_C-Class : FGBuildableWallLightweight-Class
Build_Concrete_Barrier_01_C_Class = {}

--- Creates a safer working environment when built on the edge of Foundations.
---@class Build_Fence_01_C : FGBuildableWallLightweight
Build_Fence_01_C = {}
--- Creates a safer working environment when built on the edge of Foundations.
---@class Build_Fence_01_C-Class : FGBuildableWallLightweight-Class
Build_Fence_01_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x1_L_C : FGBuildableWallLightweight
Build_FenceRamp_8x1_L_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x1_L_C-Class : FGBuildableWallLightweight-Class
Build_FenceRamp_8x1_L_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x1_R_C : FGBuildableWallLightweight
Build_FenceRamp_8x1_R_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x1_R_C-Class : FGBuildableWallLightweight-Class
Build_FenceRamp_8x1_R_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x2_L_C : FGBuildableWallLightweight
Build_FenceRamp_8x2_L_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x2_L_C-Class : FGBuildableWallLightweight-Class
Build_FenceRamp_8x2_L_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x2_R_C : FGBuildableWallLightweight
Build_FenceRamp_8x2_R_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x2_R_C-Class : FGBuildableWallLightweight-Class
Build_FenceRamp_8x2_R_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x4_L_C : FGBuildableWallLightweight
Build_FenceRamp_8x4_L_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x4_L_C-Class : FGBuildableWallLightweight-Class
Build_FenceRamp_8x4_L_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x4_R_C : FGBuildableWallLightweight
Build_FenceRamp_8x4_R_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_FenceRamp_8x4_R_C-Class : FGBuildableWallLightweight-Class
Build_FenceRamp_8x4_R_C_Class = {}

--- Creates a safer working environment when built on the edge of Foundations.
--- 
--- This Railing is 4 m long and automatically angles itself when built on Ramps.
---@class Build_Railing_01_C : FGBuildableWallLightweight
Build_Railing_01_C = {}
--- Creates a safer working environment when built on the edge of Foundations.
--- 
--- This Railing is 4 m long and automatically angles itself when built on Ramps.
---@class Build_Railing_01_C-Class : FGBuildableWallLightweight-Class
Build_Railing_01_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_SM_RailingRamp_8x1_01_C : FGBuildableWallLightweight
Build_SM_RailingRamp_8x1_01_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_SM_RailingRamp_8x1_01_C-Class : FGBuildableWallLightweight-Class
Build_SM_RailingRamp_8x1_01_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_SM_RailingRamp_8x2_01_C : FGBuildableWallLightweight
Build_SM_RailingRamp_8x2_01_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_SM_RailingRamp_8x2_01_C-Class : FGBuildableWallLightweight-Class
Build_SM_RailingRamp_8x2_01_C_Class = {}

--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_SM_RailingRamp_8x4_01_C : FGBuildableWallLightweight
Build_SM_RailingRamp_8x4_01_C = {}
--- The Fence can be built on the edges of floors to prevent you from falling off.
---@class Build_SM_RailingRamp_8x4_01_C-Class : FGBuildableWallLightweight-Class
Build_SM_RailingRamp_8x4_01_C_Class = {}

--- Creates a safer and more efficient working environment.
---@class Build_ChainLinkFence_C : FGBuildableWallLightweight
Build_ChainLinkFence_C = {}
--- Creates a safer and more efficient working environment.
---@class Build_ChainLinkFence_C-Class : FGBuildableWallLightweight-Class
Build_ChainLinkFence_C_Class = {}

--- Creates a safer and more efficient working environment.
---@class Build_TarpFence_C : FGBuildableWallLightweight
Build_TarpFence_C = {}
--- Creates a safer and more efficient working environment.
---@class Build_TarpFence_C-Class : FGBuildableWallLightweight-Class
Build_TarpFence_C_Class = {}

--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Frame_01_C : FGBuildableWallLightweight
Build_Wall_Frame_01_C = {}
--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Frame_01_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Frame_01_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_05_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_05_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_05_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_05_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_06_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_06_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_06_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_06_C_Class = {}

--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_07_C : FGBuildableWallLightweight
Build_Wall_Window_8x4_07_C = {}
--- Snaps to Foundations and other Walls.
--- The windows allow pioneers to see through a wall.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Window_8x4_07_C-Class : FGBuildableWallLightweight-Class
Build_Wall_Window_8x4_07_C_Class = {}

--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_02_C : FGBuildableWall
Build_Wall_Conveyor_8x4_02_C = {}
--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_02_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_02_C_Class = {}

--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_03_C : FGBuildableWall
Build_Wall_Conveyor_8x4_03_C = {}
--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_03_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_03_C_Class = {}

--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_01_C : FGBuildableWall
Build_Wall_Conveyor_8x4_01_C = {}
--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_01_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_01_C_Class = {}

--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_ConveyorHole_03_C : FGBuildableWall
Build_Wall_Concrete_8x4_ConveyorHole_03_C = {}
--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Concrete_8x4_ConveyorHole_03_C-Class : FGBuildableWall-Class
Build_Wall_Concrete_8x4_ConveyorHole_03_C_Class = {}

--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_03_Steel_C : FGBuildableWall
Build_Wall_Conveyor_8x4_03_Steel_C = {}
--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_03_Steel_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_03_Steel_C_Class = {}

--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_SteelWall_FlipTris_8x8_C : FGBuildableWall
Build_SteelWall_FlipTris_8x8_C = {}
--- Snaps to Foundations and other Walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8 m x 8 m
---@class Build_SteelWall_FlipTris_8x8_C-Class : FGBuildableWall-Class
Build_SteelWall_FlipTris_8x8_C_Class = {}

--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_02_Steel_C : FGBuildableWall
Build_Wall_Conveyor_8x4_02_Steel_C = {}
--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8 m x 4 m
---@class Build_Wall_Conveyor_8x4_02_Steel_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_02_Steel_C_Class = {}

--- 
---@class Build_DoorMiddle_C : FGBuildableWall
Build_DoorMiddle_C = {}
--- 
---@class Build_DoorMiddle_C-Class : FGBuildableWall-Class
Build_DoorMiddle_C_Class = {}

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_Construction_Beam_04_C : FGBuildableWall
Build_Construction_Beam_04_C = {}
--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_Construction_Beam_04_C-Class : FGBuildableWall-Class
Build_Construction_Beam_04_C_Class = {}

--- Connects to other Walls and Foundations. Use these to make buildings with several floors.
--- Has 1 Conveyor Belt connection perpendicular to the wall.
--- Height: 4 m
---@class Build_Wall_Conveyor_8x4_04_C : FGBuildableWall
Build_Wall_Conveyor_8x4_04_C = {}
--- Connects to other Walls and Foundations. Use these to make buildings with several floors.
--- Has 1 Conveyor Belt connection perpendicular to the wall.
--- Height: 4 m
---@class Build_Wall_Conveyor_8x4_04_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_04_C_Class = {}

--- Connects to other Walls and Foundations. Use these to make buildings with several floors.
--- Has 1 Conveyor Belt connection perpendicular to the wall.
--- Height: 4 m
---@class Build_Wall_Conveyor_8x4_04_Steel_C : FGBuildableWall
Build_Wall_Conveyor_8x4_04_Steel_C = {}
--- Connects to other Walls and Foundations. Use these to make buildings with several floors.
--- Has 1 Conveyor Belt connection perpendicular to the wall.
--- Height: 4 m
---@class Build_Wall_Conveyor_8x4_04_Steel_C-Class : FGBuildableWall-Class
Build_Wall_Conveyor_8x4_04_Steel_C_Class = {}

--- 
---@class FGBuildableFactoryBuildingLightweight : FGBuildableFactoryBuilding
FGBuildableFactoryBuildingLightweight = {}
--- 
---@class FGBuildableFactoryBuildingLightweight-Class : FGBuildableFactoryBuilding-Class
FGBuildableFactoryBuildingLightweight_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipe_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipe_Asphalt_8x4_C_Class = {}

--- 
---@class FGBuildableFoundationLightweight : FGBuildableFoundation
FGBuildableFoundationLightweight = {}
--- 
---@class FGBuildableFoundationLightweight-Class : FGBuildableFoundation-Class
FGBuildableFoundationLightweight_Class = {}

--- 
---@class FGBuildableFoundation : FGBuildableFactoryBuilding
FGBuildableFoundation = {}
--- 
---@class FGBuildableFoundation-Class : FGBuildableFactoryBuilding-Class
FGBuildableFoundation_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeInCorner_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeInCorner_Asphalt_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeOutCorner_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeOutCorner_Asphalt_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_Foundation_Asphalt_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Asphalt_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_Foundation_Asphalt_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Asphalt_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_Foundation_Asphalt_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Asphalt_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Asphalt_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Asphalt_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Asphalt_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Asphalt_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Asphalt_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Asphalt_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Asphalt_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Asphalt_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Asphalt_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Asphalt_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Asphalt_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Asphalt_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipe_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipe_Asphalt_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeInCorner_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeInCorner_Asphalt_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Asphalt_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Asphalt_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Asphalt_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Asphalt_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Asphalt_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Asphalt_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Asphalt_8x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Asphalt_8x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Asphalt_8x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Asphalt_8x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Asphalt_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Asphalt_4x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Asphalt_4x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Asphalt_4x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Asphalt_4x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Asphalt_4x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Asphalt_4x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Asphalt_4x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Asphalt_4x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Asphalt_4x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Asphalt_4x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Asphalt_4x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Asphalt_4x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeOutCorner_Asphalt_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeOutCorner_Asphalt_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Asphalt_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Asphalt_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Asphalt_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Asphalt_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Asphalt_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Asphalt_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Asphalt_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Asphalt_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Asphalt_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Asphalt_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Asphalt_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Asphalt_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Asphalt_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Asphalt_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Asphalt_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Asphalt_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Asphalt_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Asphalt_8x4_C_Class = {}

--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 0.5 m
---@class Build_Flat_Frame_01_C : FGBuildableFoundationLightweight
Build_Flat_Frame_01_C = {}
--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 0.5 m
---@class Build_Flat_Frame_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Flat_Frame_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_8x1_01_C : FGBuildableFoundationLightweight
Build_Foundation_8x1_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_8x1_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_8x1_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_8x2_01_C : FGBuildableFoundationLightweight
Build_Foundation_8x2_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_8x2_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_8x2_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_8x4_01_C : FGBuildableFoundationLightweight
Build_Foundation_8x4_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_8x4_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_8x4_01_C_Class = {}

--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Frame_01_C : FGBuildableFoundationLightweight
Build_Foundation_Frame_01_C = {}
--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Frame_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Frame_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_FoundationGlass_01_C : FGBuildableFoundationLightweight
Build_FoundationGlass_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_FoundationGlass_01_C-Class : FGBuildableFoundationLightweight-Class
Build_FoundationGlass_01_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_C : FGBuildableFoundationLightweight
Build_QuarterPipe_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipe_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_02_C : FGBuildableFoundationLightweight
Build_QuarterPipe_02_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_02_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipe_02_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_01_C : FGBuildableFoundationLightweight
Build_QuarterPipeCorner_01_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_01_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeCorner_01_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_02_C : FGBuildableFoundationLightweight
Build_QuarterPipeCorner_02_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_02_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeCorner_02_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_03_C : FGBuildableFoundationLightweight
Build_QuarterPipeCorner_03_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_03_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeCorner_03_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_04_C : FGBuildableFoundationLightweight
Build_QuarterPipeCorner_04_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeCorner_04_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeCorner_04_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipe_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipe_Concrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeInCorner_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeInCorner_Concrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeOutCorner_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeOutCorner_Concrete_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_Foundation_Concrete_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Concrete_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_Foundation_Concrete_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Concrete_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_Foundation_Concrete_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Concrete_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Concrete_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Concrete_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Concrete_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Concrete_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Concrete_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Concrete_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Concrete_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Concrete_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Concrete_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Concrete_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Concrete_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Concrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipe_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipe_Concrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeInCorner_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeInCorner_Concrete_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Concrete_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Concrete_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Concrete_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Concrete_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Concrete_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Concrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Concrete_8x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Concrete_8x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Concrete_8x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Concrete_8x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Concrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Concrete_4x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Concrete_4x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Concrete_4x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Concrete_4x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Concrete_4x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Concrete_4x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Concrete_4x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Concrete_4x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Concrete_4x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Concrete_4x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Concrete_4x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Concrete_4x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeOutCorner_Concrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeOutCorner_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Concrete_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Concrete_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Concrete_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Concrete_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Concrete_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Concrete_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Concrete_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Concrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Concrete_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Concrete_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Concrete_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Concrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Concrete_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Concrete_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Concrete_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Concrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Concrete_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Ficsit_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Ficsit_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Ficsit_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Ficsit_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Ficsit_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Ficsit_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Ficsit_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Ficsit_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Ficsit_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Ficsit_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Ficsit_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Ficsit_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Ficsit_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Ficsit_8x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Ficsit_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Ficsit_8x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Ficsit_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Ficsit_8x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Ficsit_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Ficsit_8x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Ficsit_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Ficsit_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Ficsit_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Ficsit_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Ficsit_4x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Ficsit_4x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Ficsit_4x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Ficsit_4x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Ficsit_4x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Ficsit_4x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Ficsit_4x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Ficsit_4x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Ficsit_4x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Ficsit_4x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Ficsit_4x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Ficsit_4x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_Grip_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipe_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipe_Grip_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_Grip_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeInCorner_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeInCorner_Grip_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_Grip_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeOutCorner_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeOutCorner_Grip_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_Metal_8x1_C : FGBuildableFoundationLightweight
Build_Foundation_Metal_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_Metal_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Metal_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_Metal_8x2_C : FGBuildableFoundationLightweight
Build_Foundation_Metal_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_Metal_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Metal_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Metal_8x4_C : FGBuildableFoundationLightweight
Build_Foundation_Metal_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_Metal_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_Metal_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Metal_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Metal_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Metal_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Metal_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Metal_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Metal_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Metal_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Metal_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Metal_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Metal_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Metal_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Metal_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Metal_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Metal_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Metal_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Metal_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Metal_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Metal_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Metal_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Metal_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Metal_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Metal_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Metal_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Metal_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_Grip_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipe_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipe_Grip_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_Grip_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeInCorner_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeInCorner_Grip_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Grip_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Grip_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_Grip_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Grip_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Grip_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Grip_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_Grip_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Grip_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Grip_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_Grip_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_Grip_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Grip_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Grip_8x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_Grip_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Grip_8x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Grip_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Grip_8x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_Grip_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Grip_8x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Grip_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_Grip_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Grip_4x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Grip_4x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_Grip_4x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Grip_4x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Grip_4x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Grip_4x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_Grip_4x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Grip_4x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Grip_4x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_Grip_4x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_Grip_4x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_Grip_4x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_Grip_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeOutCorner_Grip_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_Grip_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeOutCorner_Grip_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Metal_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Metal_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Metal_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Metal_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Metal_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Metal_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Metal_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Metal_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Metal_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Metal_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Metal_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Metal_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Metal_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Metal_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Metal_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Metal_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Metal_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Metal_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Metal_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Metal_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Metal_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Metal_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Metal_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Metal_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipe_ConcretePolished_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipe_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipe_ConcretePolished_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeInCorner_ConcretePolished_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeInCorner_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeInCorner_ConcretePolished_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_DownQuarterPipeOutCorner_ConcretePolished_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_DownQuarterPipeOutCorner_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_DownQuarterPipeOutCorner_ConcretePolished_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_ConcretePolished_8x1_C : FGBuildableFoundationLightweight
Build_Foundation_ConcretePolished_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Foundation_ConcretePolished_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_ConcretePolished_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_ConcretePolished_8x2_2_C : FGBuildableFoundationLightweight
Build_Foundation_ConcretePolished_8x2_2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Foundation_ConcretePolished_8x2_2_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_ConcretePolished_8x2_2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_Foundation_ConcretePolished_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Foundation_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Foundation_ConcretePolished_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Polished_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Polished_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_DCorner_Polished_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Polished_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Polished_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Polished_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_DCorner_Polished_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Polished_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Polished_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_DCorner_Polished_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_DCorner_Polished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_DCorner_Polished_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Polished_8x1_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Polished_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_UCorner_Polished_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Polished_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Polished_8x2_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Polished_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_UCorner_Polished_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Polished_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Polished_8x4_C : FGBuildableFoundationLightweight
Build_InvertedRamp_UCorner_Polished_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_UCorner_Polished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_InvertedRamp_UCorner_Polished_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipe_ConcretePolished_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipe_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipe_ConcretePolished_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeInCorner_ConcretePolished_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeInCorner_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeInCorner_ConcretePolished_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_PolishedConcrete_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_PolishedConcrete_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddle_PolishedConcrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_PolishedConcrete_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_PolishedConcrete_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_PolishedConcrete_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddle_PolishedConcrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_PolishedConcrete_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_PolishedConcrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddle_PolishedConcrete_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddle_PolishedConcrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddle_PolishedConcrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 1 m
---@class Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 2 m
---@class Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleInCorner_PolishedConcrete_8x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x1_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x1_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 1 m
---@class Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x1_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x1_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x2_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x2_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 2 m
---@class Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x2_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x2_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 4 m x 4 m
---@class Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeMiddleOutCorner_PolishedConcrete_4x4_C_Class = {}

--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_ConcretePolished_8x4_C : FGBuildableFoundationLightweight
Build_QuarterPipeOutCorner_ConcretePolished_8x4_C = {}
--- Provides an optional factory look that is smoother and offers possibilities for recreational activities. 
--- Still utilizes the standard Foundation building grid for improved building placement.
--- 
--- Size: 8 m x 4 m
---@class Build_QuarterPipeOutCorner_ConcretePolished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_QuarterPipeOutCorner_ConcretePolished_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Polished_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Polished_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_DownCorner_Polished_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Polished_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Polished_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Polished_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_DownCorner_Polished_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Polished_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Polished_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_DownCorner_Polished_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_DownCorner_Polished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_DownCorner_Polished_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Polished_8x1_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Polished_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_UpCorner_Polished_8x1_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Polished_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Polished_8x2_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Polished_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_UpCorner_Polished_8x2_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Polished_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Polished_8x4_C : FGBuildableFoundationLightweight
Build_Ramp_UpCorner_Polished_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_UpCorner_Polished_8x4_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_UpCorner_Polished_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Diagonal_8x1_01_C : FGBuildableFoundationLightweight
Build_Ramp_Diagonal_8x1_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Diagonal_8x1_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_Diagonal_8x1_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Diagonal_8x1_02_C : FGBuildableFoundationLightweight
Build_Ramp_Diagonal_8x1_02_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Diagonal_8x1_02_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_Diagonal_8x1_02_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Diagonal_8x2_01_C : FGBuildableFoundationLightweight
Build_Ramp_Diagonal_8x2_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Diagonal_8x2_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_Diagonal_8x2_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Diagonal_8x2_02_C : FGBuildableFoundationLightweight
Build_Ramp_Diagonal_8x2_02_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Diagonal_8x2_02_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_Diagonal_8x2_02_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Diagonal_8x4_01_C : FGBuildableFoundationLightweight
Build_Ramp_Diagonal_8x4_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Diagonal_8x4_01_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_Diagonal_8x4_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Diagonal_8x4_02_C : FGBuildableFoundationLightweight
Build_Ramp_Diagonal_8x4_02_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Diagonal_8x4_02_C-Class : FGBuildableFoundationLightweight-Class
Build_Ramp_Diagonal_8x4_02_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_RampInverted_8x1_Corner_01_C : FGBuildableFoundationLightweight
Build_RampInverted_8x1_Corner_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_RampInverted_8x1_Corner_01_C-Class : FGBuildableFoundationLightweight-Class
Build_RampInverted_8x1_Corner_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_RampInverted_8x1_Corner_02_C : FGBuildableFoundationLightweight
Build_RampInverted_8x1_Corner_02_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_RampInverted_8x1_Corner_02_C-Class : FGBuildableFoundationLightweight-Class
Build_RampInverted_8x1_Corner_02_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampInverted_8x2_Corner_01_C : FGBuildableFoundationLightweight
Build_RampInverted_8x2_Corner_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampInverted_8x2_Corner_01_C-Class : FGBuildableFoundationLightweight-Class
Build_RampInverted_8x2_Corner_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampInverted_8x2_Corner_02_C : FGBuildableFoundationLightweight
Build_RampInverted_8x2_Corner_02_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampInverted_8x2_Corner_02_C-Class : FGBuildableFoundationLightweight-Class
Build_RampInverted_8x2_Corner_02_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampInverted_8x4_Corner_01_C : FGBuildableFoundationLightweight
Build_RampInverted_8x4_Corner_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampInverted_8x4_Corner_01_C-Class : FGBuildableFoundationLightweight-Class
Build_RampInverted_8x4_Corner_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampInverted_8x4_Corner_02_C : FGBuildableFoundationLightweight
Build_RampInverted_8x4_Corner_02_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampInverted_8x4_Corner_02_C-Class : FGBuildableFoundationLightweight-Class
Build_RampInverted_8x4_Corner_02_C_Class = {}

--- 
---@class FGBuildableRamp : FGBuildableFoundation
FGBuildableRamp = {}
--- 
---@class FGBuildableRamp-Class : FGBuildableFoundation-Class
FGBuildableRamp_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Asphalt_8x1_C : FGBuildableRampLightweight
Build_InvertedRamp_Asphalt_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Asphalt_8x1_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Asphalt_8x1_C_Class = {}

--- 
---@class FGBuildableRampLightweight : FGBuildableRamp
FGBuildableRampLightweight = {}
--- 
---@class FGBuildableRampLightweight-Class : FGBuildableRamp-Class
FGBuildableRampLightweight_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Asphalt_8x2_C : FGBuildableRampLightweight
Build_InvertedRamp_Asphalt_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Asphalt_8x2_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Asphalt_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Asphalt_8x4_C : FGBuildableRampLightweight
Build_InvertedRamp_Asphalt_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Asphalt_8x4_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Asphalt_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Asphalt_8x1_C : FGBuildableRampLightweight
Build_Ramp_Asphalt_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Asphalt_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Asphalt_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Asphalt_8x2_C : FGBuildableRampLightweight
Build_Ramp_Asphalt_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Asphalt_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Asphalt_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Asphalt_8x4_C : FGBuildableRampLightweight
Build_Ramp_Asphalt_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Asphalt_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Asphalt_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Asphalt_8x1_C : FGBuildableRampLightweight
Build_RampDouble_Asphalt_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Asphalt_8x1_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Asphalt_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Asphalt_8x2_C : FGBuildableRampLightweight
Build_RampDouble_Asphalt_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Asphalt_8x2_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Asphalt_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 8 m
---@class Build_RampDouble_Asphalt_8x4_C : FGBuildableRampLightweight
Build_RampDouble_Asphalt_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 8 m
---@class Build_RampDouble_Asphalt_8x4_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Asphalt_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_Asphalt_8x1_C : FGBuildableRampLightweight
Build_Stair_Asphalt_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_Asphalt_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Stair_Asphalt_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_Asphalt_8x2_C : FGBuildableRampLightweight
Build_Stair_Asphalt_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_Asphalt_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Stair_Asphalt_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_Asphalt_8x4_C : FGBuildableRampLightweight
Build_Stair_Asphalt_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_Asphalt_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Stair_Asphalt_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Concrete_8x1_C : FGBuildableRampLightweight
Build_InvertedRamp_Concrete_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Concrete_8x1_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Concrete_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Concrete_8x2_C : FGBuildableRampLightweight
Build_InvertedRamp_Concrete_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Concrete_8x2_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Concrete_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Concrete_8x4_C : FGBuildableRampLightweight
Build_InvertedRamp_Concrete_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Concrete_8x4_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Concrete_8x1_C : FGBuildableRampLightweight
Build_Ramp_Concrete_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Concrete_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Concrete_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Concrete_8x2_C : FGBuildableRampLightweight
Build_Ramp_Concrete_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Concrete_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Concrete_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Concrete_8x4_C : FGBuildableRampLightweight
Build_Ramp_Concrete_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Concrete_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Concrete_8x1_C : FGBuildableRampLightweight
Build_RampDouble_Concrete_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Concrete_8x1_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Concrete_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Concrete_8x2_C : FGBuildableRampLightweight
Build_RampDouble_Concrete_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Concrete_8x2_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Concrete_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Concrete_8x4_C : FGBuildableRampLightweight
Build_RampDouble_Concrete_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Concrete_8x4_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_Concrete_8x1_C : FGBuildableRampLightweight
Build_Stair_Concrete_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_Concrete_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Stair_Concrete_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_Concrete_8x2_C : FGBuildableRampLightweight
Build_Stair_Concrete_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_Concrete_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Stair_Concrete_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_Concrete_8x4_C : FGBuildableRampLightweight
Build_Stair_Concrete_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_Concrete_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Stair_Concrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_FicsitSet_8x1_01_C : FGBuildableRampLightweight
Build_Stair_FicsitSet_8x1_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_FicsitSet_8x1_01_C-Class : FGBuildableRampLightweight-Class
Build_Stair_FicsitSet_8x1_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_FicsitSet_8x2_01_C : FGBuildableRampLightweight
Build_Stair_FicsitSet_8x2_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_FicsitSet_8x2_01_C-Class : FGBuildableRampLightweight-Class
Build_Stair_FicsitSet_8x2_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_FicsitSet_8x4_01_C : FGBuildableRampLightweight
Build_Stair_FicsitSet_8x4_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_FicsitSet_8x4_01_C-Class : FGBuildableRampLightweight-Class
Build_Stair_FicsitSet_8x4_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Metal_8x1_C : FGBuildableRampLightweight
Build_InvertedRamp_Metal_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Metal_8x1_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Metal_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Metal_8x2_C : FGBuildableRampLightweight
Build_InvertedRamp_Metal_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Metal_8x2_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Metal_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Metal_8x4_C : FGBuildableRampLightweight
Build_InvertedRamp_Metal_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Metal_8x4_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Metal_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Metal_8x1_C : FGBuildableRampLightweight
Build_Ramp_Metal_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Metal_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Metal_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Metal_8x2_C : FGBuildableRampLightweight
Build_Ramp_Metal_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Metal_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Metal_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Metal_8x4_C : FGBuildableRampLightweight
Build_Ramp_Metal_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Metal_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Metal_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Metal_8x1_C : FGBuildableRampLightweight
Build_RampDouble_Metal_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Metal_8x1_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Metal_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Metal_8x2_C : FGBuildableRampLightweight
Build_RampDouble_Metal_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Metal_8x2_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Metal_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Metal_8x4_C : FGBuildableRampLightweight
Build_RampDouble_Metal_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Metal_8x4_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Metal_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_GripMetal_8x1_C : FGBuildableRampLightweight
Build_Stair_GripMetal_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_GripMetal_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Stair_GripMetal_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_GripMetal_8x2_C : FGBuildableRampLightweight
Build_Stair_GripMetal_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_GripMetal_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Stair_GripMetal_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_GripMetal_8x4_C : FGBuildableRampLightweight
Build_Stair_GripMetal_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_GripMetal_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Stair_GripMetal_8x4_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Polished_8x1_C : FGBuildableRampLightweight
Build_InvertedRamp_Polished_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_InvertedRamp_Polished_8x1_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Polished_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Polished_8x2_C : FGBuildableRampLightweight
Build_InvertedRamp_Polished_8x2_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_InvertedRamp_Polished_8x2_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Polished_8x2_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Polished_8x4_C : FGBuildableRampLightweight
Build_InvertedRamp_Polished_8x4_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_InvertedRamp_Polished_8x4_C-Class : FGBuildableRampLightweight-Class
Build_InvertedRamp_Polished_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Polished_8x1_C : FGBuildableRampLightweight
Build_Ramp_Polished_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_Polished_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Polished_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Polished_8x2_C : FGBuildableRampLightweight
Build_Ramp_Polished_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_Polished_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Polished_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Polished_8x4_C : FGBuildableRampLightweight
Build_Ramp_Polished_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Polished_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Polished_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Polished_8x1_C : FGBuildableRampLightweight
Build_RampDouble_Polished_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_Polished_8x1_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Polished_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Polished_8x2_C : FGBuildableRampLightweight
Build_RampDouble_Polished_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Polished_8x2_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Polished_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Polished_8x4_C : FGBuildableRampLightweight
Build_RampDouble_Polished_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_Polished_8x4_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_Polished_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_PolishedConcrete_8x1_C : FGBuildableRampLightweight
Build_Stair_PolishedConcrete_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 1 m
---@class Build_Stair_PolishedConcrete_8x1_C-Class : FGBuildableRampLightweight-Class
Build_Stair_PolishedConcrete_8x1_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_PolishedConcrete_8x2_C : FGBuildableRampLightweight
Build_Stair_PolishedConcrete_8x2_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 2 m
---@class Build_Stair_PolishedConcrete_8x2_C-Class : FGBuildableRampLightweight-Class
Build_Stair_PolishedConcrete_8x2_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_PolishedConcrete_8x4_C : FGBuildableRampLightweight
Build_Stair_PolishedConcrete_8x4_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Foundation Stairs are just Ramps with extra steps.
--- 
--- Size: 8 m x 4 m
---@class Build_Stair_PolishedConcrete_8x4_C-Class : FGBuildableRampLightweight-Class
Build_Stair_PolishedConcrete_8x4_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_8x1_01_C : FGBuildableRampLightweight
Build_Ramp_8x1_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_Ramp_8x1_01_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_8x1_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_8x2_01_C : FGBuildableRampLightweight
Build_Ramp_8x2_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_Ramp_8x2_01_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_8x2_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_8x4_01_C : FGBuildableRampLightweight
Build_Ramp_8x4_01_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_8x4_01_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_8x4_01_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_8x4_Inverted_01_C : FGBuildableRampLightweight
Build_Ramp_8x4_Inverted_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_8x4_Inverted_01_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_8x4_Inverted_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 8 m
---@class Build_Ramp_8x8x8_C : FGBuildableRampLightweight
Build_Ramp_8x8x8_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 8 m
---@class Build_Ramp_8x8x8_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_8x8x8_C_Class = {}

--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Frame_01_C : FGBuildableRampLightweight
Build_Ramp_Frame_01_C = {}
--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Frame_01_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Frame_01_C_Class = {}

--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Frame_Inverted_01_C : FGBuildableRampLightweight
Build_Ramp_Frame_Inverted_01_C = {}
--- Snaps to other structural buildings.
--- Frames provide a more open factory aesthetic.
--- 
--- Size: 8 m x 4 m
---@class Build_Ramp_Frame_Inverted_01_C-Class : FGBuildableRampLightweight-Class
Build_Ramp_Frame_Inverted_01_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_C : FGBuildableRampLightweight
Build_RampDouble_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 4 m
---@class Build_RampDouble_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_C_Class = {}

--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_8x1_C : FGBuildableRampLightweight
Build_RampDouble_8x1_C = {}
--- Snaps to Foundations and makes it easier to get onto them.
--- 
--- Buildings on top of the Ramp snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampDouble_8x1_C-Class : FGBuildableRampLightweight-Class
Build_RampDouble_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_RampInverted_8x1_C : FGBuildableRampLightweight
Build_RampInverted_8x1_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 1 m
---@class Build_RampInverted_8x1_C-Class : FGBuildableRampLightweight-Class
Build_RampInverted_8x1_C_Class = {}

--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampInverted_8x2_01_C : FGBuildableRampLightweight
Build_RampInverted_8x2_01_C = {}
--- Provides a flat floor to build your factory on.
--- 
--- Buildings on top of the Foundation snap to a grid, making it easier to line them up with each other.
--- 
--- Size: 8 m x 2 m
---@class Build_RampInverted_8x2_01_C-Class : FGBuildableRampLightweight-Class
Build_RampInverted_8x2_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 0.5 m
---@class Build_Roof_A_01_C : FGBuildableRampLightweight
Build_Roof_A_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 0.5 m
---@class Build_Roof_A_01_C-Class : FGBuildableRampLightweight-Class
Build_Roof_A_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_A_02_C : FGBuildableRampLightweight
Build_Roof_A_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_A_02_C-Class : FGBuildableRampLightweight-Class
Build_Roof_A_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_A_03_C : FGBuildableRampLightweight
Build_Roof_A_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_A_03_C-Class : FGBuildableRampLightweight-Class
Build_Roof_A_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_A_04_C : FGBuildableRampLightweight
Build_Roof_A_04_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_A_04_C-Class : FGBuildableRampLightweight-Class
Build_Roof_A_04_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x flat
---@class Build_Roof_Orange_01_C : FGBuildableRampLightweight
Build_Roof_Orange_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x flat
---@class Build_Roof_Orange_01_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Orange_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Orange_02_C : FGBuildableRampLightweight
Build_Roof_Orange_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Orange_02_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Orange_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Orange_03_C : FGBuildableRampLightweight
Build_Roof_Orange_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Orange_03_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Orange_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Orange_04_C : FGBuildableRampLightweight
Build_Roof_Orange_04_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Orange_04_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Orange_04_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x flat
---@class Build_Roof_Tar_01_C : FGBuildableRampLightweight
Build_Roof_Tar_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x flat
---@class Build_Roof_Tar_01_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Tar_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Tar_02_C : FGBuildableRampLightweight
Build_Roof_Tar_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Tar_02_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Tar_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Tar_03_C : FGBuildableRampLightweight
Build_Roof_Tar_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Tar_03_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Tar_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Tar_04_C : FGBuildableRampLightweight
Build_Roof_Tar_04_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Tar_04_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Tar_04_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x flat
---@class Build_Roof_Window_01_C : FGBuildableRampLightweight
Build_Roof_Window_01_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x flat
---@class Build_Roof_Window_01_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Window_01_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Window_02_C : FGBuildableRampLightweight
Build_Roof_Window_02_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 1 m
---@class Build_Roof_Window_02_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Window_02_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Window_03_C : FGBuildableRampLightweight
Build_Roof_Window_03_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 2 m
---@class Build_Roof_Window_03_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Window_03_C_Class = {}

--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Window_04_C : FGBuildableRampLightweight
Build_Roof_Window_04_C = {}
--- Snaps to Foundations, Walls, and other Roofs.
--- 
--- Size: 8 m x 4 m
---@class Build_Roof_Window_04_C-Class : FGBuildableRampLightweight-Class
Build_Roof_Window_04_C_Class = {}

--- Provides a flat floor to build your factory on. 
--- Buildings on top of the foundation are adjusted to a grid, to make it easier to line them up to each other.
---@class Build_Foundation_Curved_Right_C : FGBuildableFoundation
Build_Foundation_Curved_Right_C = {}
--- Provides a flat floor to build your factory on. 
--- Buildings on top of the foundation are adjusted to a grid, to make it easier to line them up to each other.
---@class Build_Foundation_Curved_Right_C-Class : FGBuildableFoundation-Class
Build_Foundation_Curved_Right_C_Class = {}

--- 
---@class FGBuildablePillar : FGBuildableFactoryBuilding
FGBuildablePillar = {}
--- 
---@class FGBuildablePillar-Class : FGBuildableFactoryBuilding-Class
FGBuildablePillar_Class = {}

--- 
---@class FGBuildablePillarLightweight : FGBuildablePillar
FGBuildablePillarLightweight = {}
--- 
---@class FGBuildablePillarLightweight-Class : FGBuildablePillar-Class
FGBuildablePillarLightweight_Class = {}

--- Snaps to Pillars. Can be placed on surfaces like Foundations and Walls.
---@class Build_PillarBase_C : FGBuildablePillarLightweight
Build_PillarBase_C = {}
--- Snaps to Pillars. Can be placed on surfaces like Foundations and Walls.
---@class Build_PillarBase_C-Class : FGBuildablePillarLightweight-Class
Build_PillarBase_C_Class = {}

--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 4 m x 4 m
---@class Build_PillarMiddle_C : FGBuildablePillarLightweight
Build_PillarMiddle_C = {}
--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 4 m x 4 m
---@class Build_PillarMiddle_C-Class : FGBuildablePillarLightweight-Class
Build_PillarMiddle_C_Class = {}

--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 4 m x 4 m
---@class Build_PillarMiddle_Concrete_C : FGBuildablePillarLightweight
Build_PillarMiddle_Concrete_C = {}
--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 4 m x 4 m
---@class Build_PillarMiddle_Concrete_C-Class : FGBuildablePillarLightweight-Class
Build_PillarMiddle_Concrete_C_Class = {}

--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 4 m x 4 m
---@class Build_PillarMiddle_Frame_C : FGBuildablePillarLightweight
Build_PillarMiddle_Frame_C = {}
--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 4 m x 4 m
---@class Build_PillarMiddle_Frame_C-Class : FGBuildablePillarLightweight-Class
Build_PillarMiddle_Frame_C_Class = {}

--- Pillar Top
---@class Build_PillarTop_C : FGBuildablePillarLightweight
Build_PillarTop_C = {}
--- Pillar Top
---@class Build_PillarTop_C-Class : FGBuildablePillarLightweight-Class
Build_PillarTop_C_Class = {}

--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 2 m x 4 m
---@class Build_Pillar_Small_Concrete_C : FGBuildablePillarLightweight
Build_Pillar_Small_Concrete_C = {}
--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 2 m x 4 m
---@class Build_Pillar_Small_Concrete_C-Class : FGBuildablePillarLightweight-Class
Build_Pillar_Small_Concrete_C_Class = {}

--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 2 m x 4 m
---@class Build_Pillar_Small_Frame_C : FGBuildablePillarLightweight
Build_Pillar_Small_Frame_C = {}
--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 2 m x 4 m
---@class Build_Pillar_Small_Frame_C-Class : FGBuildablePillarLightweight-Class
Build_Pillar_Small_Frame_C_Class = {}

--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 2 m x 4 m
---@class Build_Pillar_Small_Metal_C : FGBuildablePillarLightweight
Build_Pillar_Small_Metal_C = {}
--- Snaps to other Pillars. Can be placed on surfaces like Foundations and Walls.
--- 
--- Size: 2 m x 4 m
---@class Build_Pillar_Small_Metal_C-Class : FGBuildablePillarLightweight-Class
Build_Pillar_Small_Metal_C_Class = {}

--- Snaps to Pillars. Can be placed on surfaces like Foundations and Walls.
---@class Build_PillarBase_Small_C : FGBuildablePillarLightweight
Build_PillarBase_Small_C = {}
--- Snaps to Pillars. Can be placed on surfaces like Foundations and Walls.
---@class Build_PillarBase_Small_C-Class : FGBuildablePillarLightweight-Class
Build_PillarBase_Small_C_Class = {}

--- 
---@class FGBuildableStair : FGBuildableFactoryBuilding
FGBuildableStair = {}
--- 
---@class FGBuildableStair-Class : FGBuildableFactoryBuilding-Class
FGBuildableStair_Class = {}

--- Snaps to Foundations.
--- Simplifies access between floors of your structures.
---@class Build_Stairs_Left_01_C : FGBuildableStair
Build_Stairs_Left_01_C = {}
--- Snaps to Foundations.
--- Simplifies access between floors of your structures.
---@class Build_Stairs_Left_01_C-Class : FGBuildableStair-Class
Build_Stairs_Left_01_C_Class = {}

--- Snaps to Foundations.
--- Simplifies access between floors of your structures.
---@class Build_Stairs_Right_01_C : FGBuildableStair
Build_Stairs_Right_01_C = {}
--- Snaps to Foundations.
--- Simplifies access between floors of your structures.
---@class Build_Stairs_Right_01_C-Class : FGBuildableStair-Class
Build_Stairs_Right_01_C_Class = {}

--- 
---@class FGBuildableWalkway : FGBuildableFactoryBuilding
FGBuildableWalkway = {}
--- 
---@class FGBuildableWalkway-Class : FGBuildableFactoryBuilding-Class
FGBuildableWalkway_Class = {}

--- 
---@class FGBuildableWalkwayLightweight : FGBuildableWalkway
FGBuildableWalkwayLightweight = {}
--- 
---@class FGBuildableWalkwayLightweight-Class : FGBuildableWalkway-Class
FGBuildableWalkwayLightweight_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkCorner_C : FGBuildableWalkwayLightweight
Build_CatwalkCorner_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkCorner_C-Class : FGBuildableWalkwayLightweight-Class
Build_CatwalkCorner_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkCross_C : FGBuildableWalkwayLightweight
Build_CatwalkCross_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkCross_C-Class : FGBuildableWalkwayLightweight-Class
Build_CatwalkCross_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkRamp_C : FGBuildableWalkwayLightweight
Build_CatwalkRamp_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkRamp_C-Class : FGBuildableWalkwayLightweight-Class
Build_CatwalkRamp_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkStairs_C : FGBuildableWalkwayLightweight
Build_CatwalkStairs_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkStairs_C-Class : FGBuildableWalkwayLightweight-Class
Build_CatwalkStairs_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkStraight_C : FGBuildableWalkwayLightweight
Build_CatwalkStraight_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkStraight_C-Class : FGBuildableWalkwayLightweight-Class
Build_CatwalkStraight_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkT_C : FGBuildableWalkwayLightweight
Build_CatwalkT_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_CatwalkT_C-Class : FGBuildableWalkwayLightweight-Class
Build_CatwalkT_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayCross_C : FGBuildableWalkwayLightweight
Build_WalkwayCross_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayCross_C-Class : FGBuildableWalkwayLightweight-Class
Build_WalkwayCross_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayRamp_C : FGBuildableWalkwayLightweight
Build_WalkwayRamp_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayRamp_C-Class : FGBuildableWalkwayLightweight-Class
Build_WalkwayRamp_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayT_C : FGBuildableWalkwayLightweight
Build_WalkwayT_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayT_C-Class : FGBuildableWalkwayLightweight-Class
Build_WalkwayT_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayTrun_C : FGBuildableWalkwayLightweight
Build_WalkwayTrun_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayTrun_C-Class : FGBuildableWalkwayLightweight-Class
Build_WalkwayTrun_C_Class = {}

--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayStraight_C : FGBuildableWalkway
Build_WalkwayStraight_C = {}
--- Snaps to Foundations and other Walkways.
--- Specifically designed for humans to walk on.
---@class Build_WalkwayStraight_C-Class : FGBuildableWalkway-Class
Build_WalkwayStraight_C_Class = {}

--- Hides seams and makes Beam connections more visually pleasing.
---@class Build_Beam_Connector_C : FGBuildableFactoryBuilding
Build_Beam_Connector_C = {}
--- Hides seams and makes Beam connections more visually pleasing.
---@class Build_Beam_Connector_C-Class : FGBuildableFactoryBuilding-Class
Build_Beam_Connector_C_Class = {}

--- Hides seams and makes Beam connections more visually pleasing.
---@class Build_Beam_Connector_Double_C : FGBuildableFactoryBuilding
Build_Beam_Connector_Double_C = {}
--- Hides seams and makes Beam connections more visually pleasing.
---@class Build_Beam_Connector_Double_C-Class : FGBuildableFactoryBuilding-Class
Build_Beam_Connector_Double_C_Class = {}

--- Snaps to Beams and various other structural buildings.
--- Used to aesthetically connect beams to surfaces.
---@class Build_Beam_Support_C : FGBuildableFactoryBuilding
Build_Beam_Support_C = {}
--- Snaps to Beams and various other structural buildings.
--- Used to aesthetically connect beams to surfaces.
---@class Build_Beam_Support_C-Class : FGBuildableFactoryBuilding-Class
Build_Beam_Support_C_Class = {}

--- 
---@class FGBuildableBlueprintDesigner : Buildable
FGBuildableBlueprintDesigner = {}
--- 
---@class FGBuildableBlueprintDesigner-Class : Buildable-Class
FGBuildableBlueprintDesigner_Class = {}

--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Blueprint tab of the Build Menu.
--- 
--- Note that buildings can only be placed in the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Dimensions: 32 m x 32 m x 32 m
---@class Build_BlueprintDesigner_C : FGBuildableBlueprintDesigner
Build_BlueprintDesigner_C = {}
--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Blueprint tab of the Build Menu.
--- 
--- Note that buildings can only be placed in the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Dimensions: 32 m x 32 m x 32 m
---@class Build_BlueprintDesigner_C-Class : FGBuildableBlueprintDesigner-Class
Build_BlueprintDesigner_C_Class = {}

--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Blueprint tab of the Build Menu.
--- 
--- Note that buildings can only be placed in the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Dimensions: 40 m x 40 m x 40 m
---@class Build_BlueprintDesigner_MK2_C : FGBuildableBlueprintDesigner
Build_BlueprintDesigner_MK2_C = {}
--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Blueprint tab of the Build Menu.
--- 
--- Note that buildings can only be placed in the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Dimensions: 40 m x 40 m x 40 m
---@class Build_BlueprintDesigner_MK2_C-Class : FGBuildableBlueprintDesigner-Class
Build_BlueprintDesigner_MK2_C_Class = {}

--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Blueprint tab of the Build Menu.
--- 
--- Note that buildings can only be placed in the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Dimensions: 48 m x 48 m x 48 m
---@class Build_BlueprintDesigner_Mk3_C : FGBuildableBlueprintDesigner
Build_BlueprintDesigner_Mk3_C = {}
--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Blueprint tab of the Build Menu.
--- 
--- Note that buildings can only be placed in the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Dimensions: 48 m x 48 m x 48 m
---@class Build_BlueprintDesigner_Mk3_C-Class : FGBuildableBlueprintDesigner-Class
Build_BlueprintDesigner_Mk3_C_Class = {}

--- 
---@class FGBuildableCalendar : Buildable
FGBuildableCalendar = {}
--- 
---@class FGBuildableCalendar-Class : Buildable-Class
FGBuildableCalendar_Class = {}

--- 
---@class BP_ChristmasCalendar_C : FGBuildableCalendar
BP_ChristmasCalendar_C = {}
--- 
---@class BP_ChristmasCalendar_C-Class : FGBuildableCalendar-Class
BP_ChristmasCalendar_C_Class = {}

--- A building that can connect two circuit networks together.
---@class CircuitBridge : Buildable
---@field public isBridgeConnected boolean True if the bridge is connected to two circuits.
---@field public isBridgeActive boolean True if the two circuits are connected to each other and act as one entity.
CircuitBridge = {}
--- A building that can connect two circuit networks together.
---@class CircuitBridge-Class : Buildable-Class
CircuitBridge_Class = {}

--- A circuit bridge that can be activated and deactivate by the player.
---@class CircuitSwitch : CircuitBridge
---@field public isSwitchOn boolean True if the two circuits are connected to each other and act as one entity.
CircuitSwitch = {}
--- Changes the circuit switch state.
---@param state boolean The new switch state.
---@return Future_CircuitSwitch_setIsSwitchOn
---@type (fun(self:CircuitSwitch,state:boolean))|ReflectionFunction
function CircuitSwitch:setIsSwitchOn(state) end
---@class Future_CircuitSwitch_setIsSwitchOn : Future
Future_CircuitSwitch_setIsSwitchOn = {}
---@type fun(self:Future_CircuitSwitch_setIsSwitchOn)
function Future_CircuitSwitch_setIsSwitchOn:await() end
---@type fun(self:Future_CircuitSwitch_setIsSwitchOn)
function Future_CircuitSwitch_setIsSwitchOn:get() end
---@type fun(self:Future_CircuitSwitch_setIsSwitchOn):boolean
function Future_CircuitSwitch_setIsSwitchOn:canGet() end
--- A circuit bridge that can be activated and deactivate by the player.
---@class CircuitSwitch-Class : CircuitBridge-Class
CircuitSwitch_Class = {}

--- A circuit power switch that can be activated and deactivated based on a priority to prevent a full factory power shutdown.
---@class CircuitSwitchPriority : CircuitSwitch
---@field public priority integer The priority group of which this switch is part of.
CircuitSwitchPriority = {}
--- A circuit power switch that can be activated and deactivated based on a priority to prevent a full factory power shutdown.
---@class CircuitSwitchPriority-Class : CircuitSwitch-Class
CircuitSwitchPriority_Class = {}

--- Priority Power Switches can be ranked by priority. When power production is too low, Switches will start turning off automatically until the power stabilizes, starting with Priority Group 8.
---@class Build_PriorityPowerSwitch_C : CircuitSwitchPriority
Build_PriorityPowerSwitch_C = {}
--- Priority Power Switches can be ranked by priority. When power production is too low, Switches will start turning off automatically until the power stabilizes, starting with Priority Group 8.
---@class Build_PriorityPowerSwitch_C-Class : CircuitSwitchPriority-Class
Build_PriorityPowerSwitch_C_Class = {}

--- Enables/disables the connection between 2 power grids when switched ON/OFF.
--- 
--- Note the A and B connector labels.
---@class Build_PowerSwitch_C : CircuitSwitch
Build_PowerSwitch_C = {}
--- Enables/disables the connection between 2 power grids when switched ON/OFF.
--- 
--- Note the A and B connector labels.
---@class Build_PowerSwitch_C-Class : CircuitSwitch-Class
Build_PowerSwitch_C_Class = {}

--- 
---@class FGBuildableControlPanelHost : CircuitBridge
FGBuildableControlPanelHost = {}
--- 
---@class FGBuildableControlPanelHost-Class : CircuitBridge-Class
FGBuildableControlPanelHost_Class = {}

--- A control panel to configure multiple lights at once.
---@class LightsControlPanel : FGBuildableControlPanelHost
---@field public isLightEnabled boolean True if the lights should be enabled
---@field public isTimeOfDayAware boolean True if the lights should automatically turn on and off depending on the time of the day.
---@field public intensity number The intensity of the lights.
---@field public colorSlot integer The color slot the lights should use.
LightsControlPanel = {}
--- Allows to update the light color that is referenced by the given slot.
---@param slot integer The slot you want to update the referencing color for.
---@param color Color The color this slot should now reference.
---@return Future_LightsControlPanel_setColorFromSlot
---@type (fun(self:LightsControlPanel,slot:integer,color:Color))|ReflectionFunction
function LightsControlPanel:setColorFromSlot(slot, color) end
---@class Future_LightsControlPanel_setColorFromSlot : Future
Future_LightsControlPanel_setColorFromSlot = {}
---@type fun(self:Future_LightsControlPanel_setColorFromSlot)
function Future_LightsControlPanel_setColorFromSlot:await() end
---@type fun(self:Future_LightsControlPanel_setColorFromSlot)
function Future_LightsControlPanel_setColorFromSlot:get() end
---@type fun(self:Future_LightsControlPanel_setColorFromSlot):boolean
function Future_LightsControlPanel_setColorFromSlot:canGet() end
--- A control panel to configure multiple lights at once.
---@class LightsControlPanel-Class : FGBuildableControlPanelHost-Class
LightsControlPanel_Class = {}

--- Sections off a series of lights, allowing them to be adjusted as a group.
--- 
--- Controls all lights connected to the power grid via the Light Connector (yellow label).
--- Note: Other Control Panels and Power Switches interrupt the connection.
---@class Build_LightsControlPanel_C : LightsControlPanel
Build_LightsControlPanel_C = {}
--- Sections off a series of lights, allowing them to be adjusted as a group.
--- 
--- Controls all lights connected to the power grid via the Light Connector (yellow label).
--- Note: Other Control Panels and Power Switches interrupt the connection.
---@class Build_LightsControlPanel_C-Class : LightsControlPanel-Class
Build_LightsControlPanel_C_Class = {}

--- 
---@class FGBuildableConveyorBelt : FGBuildableConveyorBase
FGBuildableConveyorBelt = {}
--- 
---@class FGBuildableConveyorBelt-Class : FGBuildableConveyorBase-Class
FGBuildableConveyorBelt_Class = {}

--- 
---@class FGBuildableConveyorBase : Buildable
FGBuildableConveyorBase = {}
--- 
---@class FGBuildableConveyorBase-Class : Buildable-Class
FGBuildableConveyorBase_Class = {}

--- Transports up to 60 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk1_C : FGBuildableConveyorBelt
Build_ConveyorBeltMk1_C = {}
--- Transports up to 60 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk1_C-Class : FGBuildableConveyorBelt-Class
Build_ConveyorBeltMk1_C_Class = {}

--- Transports up to 120 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk2_C : Build_ConveyorBeltMk1_C
Build_ConveyorBeltMk2_C = {}
--- Transports up to 120 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk2_C-Class : Build_ConveyorBeltMk1_C-Class
Build_ConveyorBeltMk2_C_Class = {}

--- Transports up to 270 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk3_C : Build_ConveyorBeltMk1_C
Build_ConveyorBeltMk3_C = {}
--- Transports up to 270 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk3_C-Class : Build_ConveyorBeltMk1_C-Class
Build_ConveyorBeltMk3_C_Class = {}

--- Transports up to 480 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk4_C : Build_ConveyorBeltMk1_C
Build_ConveyorBeltMk4_C = {}
--- Transports up to 480 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk4_C-Class : Build_ConveyorBeltMk1_C-Class
Build_ConveyorBeltMk4_C_Class = {}

--- Transports up to 780 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk5_C : Build_ConveyorBeltMk1_C
Build_ConveyorBeltMk5_C = {}
--- Transports up to 780 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk5_C-Class : Build_ConveyorBeltMk1_C-Class
Build_ConveyorBeltMk5_C_Class = {}

--- Transports up to 1200 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk6_C : Build_ConveyorBeltMk1_C
Build_ConveyorBeltMk6_C = {}
--- Transports up to 1200 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk6_C-Class : Build_ConveyorBeltMk1_C-Class
Build_ConveyorBeltMk6_C_Class = {}

--- 
---@class FGBuildableConveyorLift : FGBuildableConveyorBase
FGBuildableConveyorLift = {}
--- 
---@class FGBuildableConveyorLift-Class : FGBuildableConveyorBase-Class
FGBuildableConveyorLift_Class = {}

--- Transports up to 60 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk1_C : FGBuildableConveyorLift
Build_ConveyorLiftMk1_C = {}
--- Transports up to 60 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk1_C-Class : FGBuildableConveyorLift-Class
Build_ConveyorLiftMk1_C_Class = {}

--- Transports up to 120 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk2_C : Build_ConveyorLiftMk1_C
Build_ConveyorLiftMk2_C = {}
--- Transports up to 120 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk2_C-Class : Build_ConveyorLiftMk1_C-Class
Build_ConveyorLiftMk2_C_Class = {}

--- Transports up to 270 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk3_C : Build_ConveyorLiftMk1_C
Build_ConveyorLiftMk3_C = {}
--- Transports up to 270 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk3_C-Class : Build_ConveyorLiftMk1_C-Class
Build_ConveyorLiftMk3_C_Class = {}

--- Transports up to 480 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk4_C : Build_ConveyorLiftMk1_C
Build_ConveyorLiftMk4_C = {}
--- Transports up to 480 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk4_C-Class : Build_ConveyorLiftMk1_C-Class
Build_ConveyorLiftMk4_C_Class = {}

--- Transports up to 780 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk5_C : Build_ConveyorLiftMk1_C
Build_ConveyorLiftMk5_C = {}
--- Transports up to 780 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk5_C-Class : Build_ConveyorLiftMk1_C-Class
Build_ConveyorLiftMk5_C_Class = {}

--- Transports up to 1200 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk6_C : Build_ConveyorLiftMk1_C
Build_ConveyorLiftMk6_C = {}
--- Transports up to 1200 resources per minute. Used to move resources between floors.
---@class Build_ConveyorLiftMk6_C-Class : Build_ConveyorLiftMk1_C-Class
Build_ConveyorLiftMk6_C_Class = {}

--- The base class for all light you can build.
---@class LightSource : Buildable
---@field public isLightEnabled boolean True if the light is enabled
---@field public isTimeOfDayAware boolean True if the light should automatically turn on and off depending on the time of the day.
---@field public intensity number The intensity of the light.
---@field public colorSlot integer The color slot the light uses.
LightSource = {}
--- Returns the light color that is referenced by the given slot.
---@param slot integer The slot you want to get the referencing color from.
---@return Color color The color this slot references.
---@type (fun(self:LightSource,slot:integer):(color:Color))|ReflectionFunction
function LightSource:getColorFromSlot(slot) end
--- Allows to update the light color that is referenced by the given slot.
---@param slot integer The slot you want to update the referencing color for.
---@param color Color The color this slot should now reference.
---@return Future_LightSource_setColorFromSlot
---@type (fun(self:LightSource,slot:integer,color:Color))|ReflectionFunction
function LightSource:setColorFromSlot(slot, color) end
---@class Future_LightSource_setColorFromSlot : Future
Future_LightSource_setColorFromSlot = {}
---@type fun(self:Future_LightSource_setColorFromSlot)
function Future_LightSource_setColorFromSlot:await() end
---@type fun(self:Future_LightSource_setColorFromSlot)
function Future_LightSource_setColorFromSlot:get() end
---@type fun(self:Future_LightSource_setColorFromSlot):boolean
function Future_LightSource_setColorFromSlot:canGet() end
--- The base class for all light you can build.
---@class LightSource-Class : Buildable-Class
LightSource_Class = {}

--- 
---@class FGBuildableFloodlight : LightSource
FGBuildableFloodlight = {}
--- 
---@class FGBuildableFloodlight-Class : LightSource-Class
FGBuildableFloodlight_Class = {}

--- Illuminates large or outdoor spaces.
--- 
--- Light color and intensity can be adjusted.
--- Allows for up to 2 Power Line connections.
---@class Build_FloodlightPole_C : FGBuildableFloodlight
Build_FloodlightPole_C = {}
--- Illuminates large or outdoor spaces.
--- 
--- Light color and intensity can be adjusted.
--- Allows for up to 2 Power Line connections.
---@class Build_FloodlightPole_C-Class : FGBuildableFloodlight-Class
Build_FloodlightPole_C_Class = {}

--- Attaches to Walls and Foundations to illuminate large spaces.
--- 
--- Light color and intensity can be modified via a Light Control Panel.
--- Allows for up to 2 Power Line connections.
---@class Build_FloodlightWall_C : FGBuildableFloodlight
Build_FloodlightWall_C = {}
--- Attaches to Walls and Foundations to illuminate large spaces.
--- 
--- Light color and intensity can be modified via a Light Control Panel.
--- Allows for up to 2 Power Line connections.
---@class Build_FloodlightWall_C-Class : FGBuildableFloodlight-Class
Build_FloodlightWall_C_Class = {}

--- Lights up indoor factory spaces when placed on ceilings.
--- 
--- Light color and intensity can be adjusted via a Light Control Panel.
--- Allows for up to 2 Power Line connections.
---@class Build_CeilingLight_C : LightSource
Build_CeilingLight_C = {}
--- Lights up indoor factory spaces when placed on ceilings.
--- 
--- Light color and intensity can be adjusted via a Light Control Panel.
--- Allows for up to 2 Power Line connections.
---@class Build_CeilingLight_C-Class : LightSource-Class
Build_CeilingLight_C_Class = {}

--- Lights up factory areas and roads.
--- 
--- Light color and intensity can be adjusted.
--- Allows for up to 2 Power Line connections.
---@class Build_StreetLight_C : LightSource
Build_StreetLight_C = {}
--- Lights up factory areas and roads.
--- 
--- Light color and intensity can be adjusted.
--- Allows for up to 2 Power Line connections.
---@class Build_StreetLight_C-Class : LightSource-Class
Build_StreetLight_C_Class = {}

--- 
---@class FGBuildableHubTerminal : Buildable
FGBuildableHubTerminal = {}
--- 
---@class FGBuildableHubTerminal-Class : Buildable-Class
FGBuildableHubTerminal_Class = {}

--- 
---@class Build_HubTerminal_C : FGBuildableHubTerminal
Build_HubTerminal_C = {}
--- 
---@class Build_HubTerminal_C-Class : FGBuildableHubTerminal-Class
Build_HubTerminal_C_Class = {}

--- 
---@class UndismantableHub_C : Build_HubTerminal_C
UndismantableHub_C = {}
--- 
---@class UndismantableHub_C-Class : Build_HubTerminal_C-Class
UndismantableHub_C_Class = {}

--- Snaps to Walls and Foundations. Default height is 2 m, but it can be extended while building.
---@class Build_Ladder_C : FGBuildableLadder
Build_Ladder_C = {}
--- Snaps to Walls and Foundations. Default height is 2 m, but it can be extended while building.
---@class Build_Ladder_C-Class : FGBuildableLadder-Class
Build_Ladder_C_Class = {}

--- 
---@class FGBuildableLadder : Buildable
FGBuildableLadder = {}
--- 
---@class FGBuildableLadder-Class : Buildable-Class
FGBuildableLadder_Class = {}

--- 
---@class FGBuildableMAM : Buildable
FGBuildableMAM = {}
--- 
---@class FGBuildableMAM-Class : Buildable-Class
FGBuildableMAM_Class = {}

--- The Molecular Analysis Machine is used to analyze new and exotic materials found on alien planets.
--- Through the MAM, R&D will assist pioneers in turning any valuable data into usable research options and new technologies.
---@class Build_Mam_C : FGBuildableMAM
Build_Mam_C = {}
--- The Molecular Analysis Machine is used to analyze new and exotic materials found on alien planets.
--- Through the MAM, R&D will assist pioneers in turning any valuable data into usable research options and new technologies.
---@class Build_Mam_C-Class : FGBuildableMAM-Class
Build_Mam_C_Class = {}

--- 
---@class FGBuildablePassthroughBase : Buildable
FGBuildablePassthroughBase = {}
--- 
---@class FGBuildablePassthroughBase-Class : Buildable-Class
FGBuildablePassthroughBase_Class = {}

--- 
---@class FGBuildablePassthrough : FGBuildablePassthroughBase
FGBuildablePassthrough = {}
--- 
---@class FGBuildablePassthrough-Class : FGBuildablePassthroughBase-Class
FGBuildablePassthrough_Class = {}

--- Attaches to Foundations, allowing Conveyor Lifts to pass through.
---@class Build_FoundationPassthrough_Lift_C : FGBuildablePassthrough
Build_FoundationPassthrough_Lift_C = {}
--- Attaches to Foundations, allowing Conveyor Lifts to pass through.
---@class Build_FoundationPassthrough_Lift_C-Class : FGBuildablePassthrough-Class
Build_FoundationPassthrough_Lift_C_Class = {}

--- Attaches to Foundations, allowing Pipelines to pass through.
---@class Build_FoundationPassthrough_Pipe_C : FGBuildablePassthrough
Build_FoundationPassthrough_Pipe_C = {}
--- Attaches to Foundations, allowing Pipelines to pass through.
---@class Build_FoundationPassthrough_Pipe_C-Class : FGBuildablePassthrough-Class
Build_FoundationPassthrough_Pipe_C_Class = {}

--- 
---@class FGBuildablePassthroughPipeHyper : FGBuildablePassthroughBase
FGBuildablePassthroughPipeHyper = {}
--- 
---@class FGBuildablePassthroughPipeHyper-Class : FGBuildablePassthroughBase-Class
FGBuildablePassthroughPipeHyper_Class = {}

--- Attaches to Foundations, allowing Hypertubes to pass through.
---@class Build_FoundationPassthrough_Hypertube_C : FGBuildablePassthroughPipeHyper
Build_FoundationPassthrough_Hypertube_C = {}
--- Attaches to Foundations, allowing Hypertubes to pass through.
---@class Build_FoundationPassthrough_Hypertube_C-Class : FGBuildablePassthroughPipeHyper-Class
Build_FoundationPassthrough_Hypertube_C_Class = {}

--- 
---@class FGBuildablePipeBase : Buildable
FGBuildablePipeBase = {}
--- 
---@class FGBuildablePipeBase-Class : Buildable-Class
FGBuildablePipeBase_Class = {}

--- A hypertube pipe
---@class BuildablePipeHyper : FGBuildablePipeBase
BuildablePipeHyper = {}
--- A hypertube pipe
---@class BuildablePipeHyper-Class : FGBuildablePipeBase-Class
BuildablePipeHyper_Class = {}

--- Transports FICSIT employees.
--- A Hypertube system cannot be powered up or used until a Hypertube Entrance is attached.
---@class Build_PipeHyper_C : BuildablePipeHyper
Build_PipeHyper_C = {}
--- Transports FICSIT employees.
--- A Hypertube system cannot be powered up or used until a Hypertube Entrance is attached.
---@class Build_PipeHyper_C-Class : BuildablePipeHyper-Class
Build_PipeHyper_C_Class = {}

--- 
---@class FGBuildablePipeline : FGBuildablePipeBase
FGBuildablePipeline = {}
--- 
---@class FGBuildablePipeline-Class : FGBuildablePipeBase-Class
FGBuildablePipeline_Class = {}

--- Transports fluids.
--- External indicators show flow rate, direction, and volume.
--- Capacity: 300 m³ of fluid per minute.
---@class Build_Pipeline_C : FGBuildablePipeline
Build_Pipeline_C = {}
--- Transports fluids.
--- External indicators show flow rate, direction, and volume.
--- Capacity: 300 m³ of fluid per minute.
---@class Build_Pipeline_C-Class : FGBuildablePipeline-Class
Build_Pipeline_C_Class = {}

--- Transports fluids.
--- Capacity: 300 m³ of fluid per minute.
--- 
--- Caution: This version of the Pipeline does not feature an external indicator.
---@class Build_Pipeline_NoIndicator_C : Build_Pipeline_C
Build_Pipeline_NoIndicator_C = {}
--- Transports fluids.
--- Capacity: 300 m³ of fluid per minute.
--- 
--- Caution: This version of the Pipeline does not feature an external indicator.
---@class Build_Pipeline_NoIndicator_C-Class : Build_Pipeline_C-Class
Build_Pipeline_NoIndicator_C_Class = {}

--- Transports fluids.
--- External indicators show flow rate, direction, and volume.
--- Capacity: 600 m³ of fluid per minute.
---@class Build_PipelineMK2_C : FGBuildablePipeline
Build_PipelineMK2_C = {}
--- Transports fluids.
--- External indicators show flow rate, direction, and volume.
--- Capacity: 600 m³ of fluid per minute.
---@class Build_PipelineMK2_C-Class : FGBuildablePipeline-Class
Build_PipelineMK2_C_Class = {}

--- Transports fluids.
--- Capacity: 600 m³ of fluid per minute.
--- 
--- Caution: This version of the Pipeline does not feature an external indicator.
---@class Build_PipelineMK2_NoIndicator_C : Build_PipelineMK2_C
Build_PipelineMK2_NoIndicator_C = {}
--- Transports fluids.
--- Capacity: 600 m³ of fluid per minute.
--- 
--- Caution: This version of the Pipeline does not feature an external indicator.
---@class Build_PipelineMK2_NoIndicator_C-Class : Build_PipelineMK2_C-Class
Build_PipelineMK2_NoIndicator_C_Class = {}

--- 
---@class FGBuildablePipelineFlowIndicator : Buildable
FGBuildablePipelineFlowIndicator = {}
--- 
---@class FGBuildablePipelineFlowIndicator-Class : Buildable-Class
FGBuildablePipelineFlowIndicator_Class = {}

--- 
---@class Build_PipelineFlowIndicator_C : FGBuildablePipelineFlowIndicator
Build_PipelineFlowIndicator_C = {}
--- 
---@class Build_PipelineFlowIndicator_C-Class : FGBuildablePipelineFlowIndicator-Class
Build_PipelineFlowIndicator_C_Class = {}

--- 
---@class FGBuildablePipelineSupport : FGBuildablePoleBase
FGBuildablePipelineSupport = {}
--- 
---@class FGBuildablePipelineSupport-Class : FGBuildablePoleBase-Class
FGBuildablePipelineSupport_Class = {}

--- 
---@class FGBuildablePoleBase : Buildable
FGBuildablePoleBase = {}
--- 
---@class FGBuildablePoleBase-Class : Buildable-Class
FGBuildablePoleBase_Class = {}

--- Supports Hypertubes, allowing them to stretch over longer distances.
---@class Build_PipeHyperSupport_C : FGBuildablePipelineSupport
Build_PipeHyperSupport_C = {}
--- Supports Hypertubes, allowing them to stretch over longer distances.
---@class Build_PipeHyperSupport_C-Class : FGBuildablePipelineSupport-Class
Build_PipeHyperSupport_C_Class = {}

--- Supports Hypertubes. Can be stacked on other stackable supports.
---@class Build_HyperPoleStackable_C : FGBuildablePipelineSupport
Build_HyperPoleStackable_C = {}
--- Supports Hypertubes. Can be stacked on other stackable supports.
---@class Build_HyperPoleStackable_C-Class : FGBuildablePipelineSupport-Class
Build_HyperPoleStackable_C_Class = {}

--- Connects Pipeline segments. Support height can be adjusted.
--- Useful for routing Pipelines more precisely and across long distances.
---@class Build_PipelineSupport_C : FGBuildablePipelineSupport
Build_PipelineSupport_C = {}
--- Connects Pipeline segments. Support height can be adjusted.
--- Useful for routing Pipelines more precisely and across long distances.
---@class Build_PipelineSupport_C-Class : FGBuildablePipelineSupport-Class
Build_PipelineSupport_C_Class = {}

--- Supports Pipelines. Can be stacked on other stackable supports.
---@class Build_PipeSupportStackable_C : FGBuildablePipelineSupport
Build_PipeSupportStackable_C = {}
--- Supports Pipelines. Can be stacked on other stackable supports.
---@class Build_PipeSupportStackable_C-Class : FGBuildablePipelineSupport-Class
Build_PipeSupportStackable_C_Class = {}

--- Connects Conveyor Belt segments. Pole height can be adjusted.
--- Useful for routing Conveyor Belts more precisely and across long distances.
---@class Build_ConveyorPole_C : FGBuildablePoleLightweight
Build_ConveyorPole_C = {}
--- Connects Conveyor Belt segments. Pole height can be adjusted.
--- Useful for routing Conveyor Belts more precisely and across long distances.
---@class Build_ConveyorPole_C-Class : FGBuildablePoleLightweight-Class
Build_ConveyorPole_C_Class = {}

--- 
---@class FGBuildablePoleLightweight : FGBuildablePole
FGBuildablePoleLightweight = {}
--- 
---@class FGBuildablePoleLightweight-Class : FGBuildablePole-Class
FGBuildablePoleLightweight_Class = {}

--- 
---@class FGBuildablePole : FGBuildablePoleBase
FGBuildablePole = {}
--- 
---@class FGBuildablePole-Class : FGBuildablePoleBase-Class
FGBuildablePole_Class = {}

--- 
---@class FGConveyorPoleStackable : FGBuildablePole
FGConveyorPoleStackable = {}
--- 
---@class FGConveyorPoleStackable-Class : FGBuildablePole-Class
FGConveyorPoleStackable_Class = {}

--- Supports Conveyor Belts. Can be stacked on other stackable supports.
---@class Build_ConveyorPoleStackable_C : FGConveyorPoleStackable
Build_ConveyorPoleStackable_C = {}
--- Supports Conveyor Belts. Can be stacked on other stackable supports.
---@class Build_ConveyorPoleStackable_C-Class : FGConveyorPoleStackable-Class
Build_ConveyorPoleStackable_C_Class = {}

--- Conveyor pole and Power Pole with fixed size that is stackable
--- 
--- Can connect 4 Power Cables.
---@class Serie_StackPole_C : Build_ConveyorPoleStackable_C
Serie_StackPole_C = {}
--- Conveyor pole and Power Pole with fixed size that is stackable
--- 
--- Can connect 4 Power Cables.
---@class Serie_StackPole_C-Class : Build_ConveyorPoleStackable_C-Class
Serie_StackPole_C_Class = {}

--- Supports Conveyor Belts. Can be stacked on other stackable supports.
---@class Serie_Stack_C : Build_ConveyorPoleStackable_C
Serie_Stack_C = {}
--- Supports Conveyor Belts. Can be stacked on other stackable supports.
---@class Serie_Stack_C-Class : Build_ConveyorPoleStackable_C-Class
Serie_Stack_C_Class = {}

--- 
---@class FGBuildableSignSupport : FGBuildablePoleBase
FGBuildableSignSupport = {}
--- 
---@class FGBuildableSignSupport-Class : FGBuildablePoleBase-Class
FGBuildableSignSupport_Class = {}

--- 
---@class Build_SignPole_C : FGBuildableSignSupport
Build_SignPole_C = {}
--- 
---@class Build_SignPole_C-Class : FGBuildableSignSupport-Class
Build_SignPole_C_Class = {}

--- Attaches to ceilings and other ceiling mounts.
--- Useful for routing Conveyor Belts more precisely and over long distances.
---@class Build_ConveyorCeilingAttachment_C : FGBuildablePoleBase
Build_ConveyorCeilingAttachment_C = {}
--- Attaches to ceilings and other ceiling mounts.
--- Useful for routing Conveyor Belts more precisely and over long distances.
---@class Build_ConveyorCeilingAttachment_C-Class : FGBuildablePoleBase-Class
Build_ConveyorCeilingAttachment_C_Class = {}

--- 
---@class FGBuildablePixelSign : SignBase
FGBuildablePixelSign = {}
--- 
---@class FGBuildablePixelSign-Class : SignBase-Class
FGBuildablePixelSign_Class = {}

--- The base class for all signs in the game.
---@class SignBase : Buildable
SignBase = {}
--- Returns the sign type descriptor
---@return SignType-Class descriptor The sign type descriptor
---@type (fun(self:SignBase):(descriptor:SignType-Class))|ReflectionFunction
function SignBase:getSignType() end
--- The base class for all signs in the game.
---@class SignBase-Class : Buildable-Class
SignBase_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 16 m x 8 m
---@class Build_StandaloneWidgetSign_Huge_C : WidgetSign
Build_StandaloneWidgetSign_Huge_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 16 m x 8 m
---@class Build_StandaloneWidgetSign_Huge_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Huge_C_Class = {}

--- The type of sign that allows you to define layouts, images, texts and colors manually.
---@class WidgetSign : SignBase
WidgetSign = {}
--- Sets the prefabg sign data e.g. the user settings like colo and more to define the signs content.
---@param prefabSignData PrefabSignData The new prefab sign data for this sign.
---@return Future_WidgetSign_setPrefabSignData
---@type (fun(self:WidgetSign,prefabSignData:PrefabSignData))|ReflectionFunction
function WidgetSign:setPrefabSignData(prefabSignData) end
---@class Future_WidgetSign_setPrefabSignData : Future
Future_WidgetSign_setPrefabSignData = {}
---@type fun(self:Future_WidgetSign_setPrefabSignData)
function Future_WidgetSign_setPrefabSignData:await() end
---@type fun(self:Future_WidgetSign_setPrefabSignData)
function Future_WidgetSign_setPrefabSignData:get() end
---@type fun(self:Future_WidgetSign_setPrefabSignData):boolean
function Future_WidgetSign_setPrefabSignData:canGet() end
--- Returns the prefabg sign data e.g. the user settings like colo and more to define the signs content.
---@return PrefabSignData prefabSignData The new prefab sign data for this sign.
---@type (fun(self:WidgetSign):(prefabSignData:PrefabSignData))|ReflectionFunction
function WidgetSign:getPrefabSignData() end
--- The type of sign that allows you to define layouts, images, texts and colors manually.
---@class WidgetSign-Class : SignBase-Class
WidgetSign_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 8 m x 4 m
---@class Build_StandaloneWidgetSign_Large_C : WidgetSign
Build_StandaloneWidgetSign_Large_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 8 m x 4 m
---@class Build_StandaloneWidgetSign_Large_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Large_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 1 m
---@class Build_StandaloneWidgetSign_Medium_C : WidgetSign
Build_StandaloneWidgetSign_Medium_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 1 m
---@class Build_StandaloneWidgetSign_Medium_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Medium_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 3 m
---@class Build_StandaloneWidgetSign_Portrait_C : WidgetSign
Build_StandaloneWidgetSign_Portrait_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 3 m
---@class Build_StandaloneWidgetSign_Portrait_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Portrait_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 2 m
---@class Build_StandaloneWidgetSign_Square_C : WidgetSign
Build_StandaloneWidgetSign_Square_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 2 m
---@class Build_StandaloneWidgetSign_Square_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Square_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 0.5 m x 0.5 m
---@class Build_StandaloneWidgetSign_Square_Tiny_C : WidgetSign
Build_StandaloneWidgetSign_Square_Tiny_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 0.5 m x 0.5 m
---@class Build_StandaloneWidgetSign_Square_Tiny_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Square_Tiny_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 1 m x 1 m
---@class Build_StandaloneWidgetSign_Square_Small_C : WidgetSign
Build_StandaloneWidgetSign_Square_Small_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 1 m x 1 m
---@class Build_StandaloneWidgetSign_Square_Small_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Square_Small_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 0.5 m
---@class Build_StandaloneWidgetSign_Small_C : WidgetSign
Build_StandaloneWidgetSign_Small_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 2 m x 0.5 m
---@class Build_StandaloneWidgetSign_Small_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_Small_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 4 m x 0.5 m
---@class Build_StandaloneWidgetSign_SmallVeryWide_C : WidgetSign
Build_StandaloneWidgetSign_SmallVeryWide_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 4 m x 0.5 m
---@class Build_StandaloneWidgetSign_SmallVeryWide_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_SmallVeryWide_C_Class = {}

--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 3 m x 0.5 m
---@class Build_StandaloneWidgetSign_SmallWide_C : WidgetSign
Build_StandaloneWidgetSign_SmallWide_C = {}
--- Improves factory organization. The colors, icons, background, and text are customizable.
--- 
--- Can be freestanding, placed on Walls, or attached to most buildings, including Storage Containers.
--- 
--- Size: 3 m x 0.5 m
---@class Build_StandaloneWidgetSign_SmallWide_C-Class : WidgetSign-Class
Build_StandaloneWidgetSign_SmallWide_C_Class = {}

--- Functions like a Power Pole, but attaches to a wall.
--- 
--- Allows for up to 4 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWall_C : FGBuildablePowerPole
Build_PowerPoleWall_C = {}
--- Functions like a Power Pole, but attaches to a wall.
--- 
--- Allows for up to 4 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWall_C-Class : FGBuildablePowerPole-Class
Build_PowerPoleWall_C_Class = {}

--- 
---@class FGBuildablePowerPole : Buildable
FGBuildablePowerPole = {}
--- 
---@class FGBuildablePowerPole-Class : Buildable-Class
FGBuildablePowerPole_Class = {}

--- Functions like a Power Pole, but attaches to a wall.
--- 
--- Allows for up to 7 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWall_Mk2_C : Build_PowerPoleWall_C
Build_PowerPoleWall_Mk2_C = {}
--- Functions like a Power Pole, but attaches to a wall.
--- 
--- Allows for up to 7 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWall_Mk2_C-Class : Build_PowerPoleWall_C-Class
Build_PowerPoleWall_Mk2_C_Class = {}

--- Functions like a Power Pole, but attaches to a wall.
--- 
--- Allows for up to 10 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWall_Mk3_C : Build_PowerPoleWall_C
Build_PowerPoleWall_Mk3_C = {}
--- Functions like a Power Pole, but attaches to a wall.
--- 
--- Allows for up to 10 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWall_Mk3_C-Class : Build_PowerPoleWall_C-Class
Build_PowerPoleWall_Mk3_C_Class = {}

--- Allows for up to 4 Power Line connections.
--- 
--- Connect Power Poles, Power Generators, and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleMk1_C : FGBuildablePowerPole
Build_PowerPoleMk1_C = {}
--- Allows for up to 4 Power Line connections.
--- 
--- Connect Power Poles, Power Generators, and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleMk1_C-Class : FGBuildablePowerPole-Class
Build_PowerPoleMk1_C_Class = {}

--- Allows for up to 7 Power Line connections.
--- 
--- Connect Power Poles, Power Generators, and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleMk2_C : Build_PowerPoleMk1_C
Build_PowerPoleMk2_C = {}
--- Allows for up to 7 Power Line connections.
--- 
--- Connect Power Poles, Power Generators, and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleMk2_C-Class : Build_PowerPoleMk1_C-Class
Build_PowerPoleMk2_C_Class = {}

--- Allows for up to 10 Power Line connections.
--- 
--- Connect Power Poles, Power Generators, and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleMk3_C : Build_PowerPoleMk1_C
Build_PowerPoleMk3_C = {}
--- Allows for up to 10 Power Line connections.
--- 
--- Connect Power Poles, Power Generators, and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleMk3_C-Class : Build_PowerPoleMk1_C-Class
Build_PowerPoleMk3_C_Class = {}

--- Functions like a Power Pole, but attaches to a wall. Has one connector on each side of the wall.
--- 
--- Allows for up to 4 Power Line connections per side.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWallDouble_C : FGBuildablePowerPole
Build_PowerPoleWallDouble_C = {}
--- Functions like a Power Pole, but attaches to a wall. Has one connector on each side of the wall.
--- 
--- Allows for up to 4 Power Line connections per side.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWallDouble_C-Class : FGBuildablePowerPole-Class
Build_PowerPoleWallDouble_C_Class = {}

--- Functions like a Power Pole, but attaches to a wall. Has one connector on each side of the wall.
--- 
--- Allows for up to 7 Power Line connections per side.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWallDouble_Mk2_C : Build_PowerPoleWallDouble_C
Build_PowerPoleWallDouble_Mk2_C = {}
--- Functions like a Power Pole, but attaches to a wall. Has one connector on each side of the wall.
--- 
--- Allows for up to 7 Power Line connections per side.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWallDouble_Mk2_C-Class : Build_PowerPoleWallDouble_C-Class
Build_PowerPoleWallDouble_Mk2_C_Class = {}

--- Functions like a Power Pole, but attaches to a wall. Has one connector on each side of the wall.
--- 
--- Allows for up to 10 Power Line connections per side.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWallDouble_Mk3_C : Build_PowerPoleWallDouble_Mk2_C
Build_PowerPoleWallDouble_Mk3_C = {}
--- Functions like a Power Pole, but attaches to a wall. Has one connector on each side of the wall.
--- 
--- Allows for up to 10 Power Line connections per side.
--- 
--- Connect Power Poles, Power Generators and factory buildings with Power Lines to create a power grid. The power grid supplies all connected buildings with power.
---@class Build_PowerPoleWallDouble_Mk3_C-Class : Build_PowerPoleWallDouble_Mk2_C-Class
Build_PowerPoleWallDouble_Mk3_C_Class = {}

--- Helps span Power Lines across greater distances.
--- There is an additional power connector at the bottom of the Power Tower to connect it to other buildings, such as Power Poles.
---@class Build_PowerTower_C : FGBuildablePowerPole
Build_PowerTower_C = {}
--- Helps span Power Lines across greater distances.
--- There is an additional power connector at the bottom of the Power Tower to connect it to other buildings, such as Power Poles.
---@class Build_PowerTower_C-Class : FGBuildablePowerPole-Class
Build_PowerTower_C_Class = {}

--- Helps span Power Lines across greater distances.
--- There is an additional power connector at the bottom of the Power Tower to connect it to other buildings, such as Power Poles.
--- 
--- Note: This Power Tower variant includes a ladder and platform for improved utility.
---@class Build_PowerTowerPlatform_C : Build_PowerTower_C
Build_PowerTowerPlatform_C = {}
--- Helps span Power Lines across greater distances.
--- There is an additional power connector at the bottom of the Power Tower to connect it to other buildings, such as Power Poles.
--- 
--- Note: This Power Tower variant includes a ladder and platform for improved utility.
---@class Build_PowerTowerPlatform_C-Class : Build_PowerTower_C-Class
Build_PowerTowerPlatform_C_Class = {}

--- 
---@class FGBuildablePowerTower : Buildable
FGBuildablePowerTower = {}
--- 
---@class FGBuildablePowerTower-Class : Buildable-Class
FGBuildablePowerTower_Class = {}

--- 
---@class FGBuildableRailroadBridge : Buildable
FGBuildableRailroadBridge = {}
--- 
---@class FGBuildableRailroadBridge-Class : Buildable-Class
FGBuildableRailroadBridge_Class = {}

--- A train signal to control trains on a track.
---@class RailroadSignal : Buildable
---@field public isPathSignal boolean True if this signal is a path-signal.
---@field public isBiDirectional boolean True if this signal is bi-directional. (trains can pass into both directions)
---@field public hasObservedBlock boolean True if this signal is currently observing at least one block.
---@field public blockValidation integer Any error states of the block.<br>0 = Unknown<br>1 = No Error<br>2 = No Exit Signal<br>3 = Contains Loop<br>4 = Contains Mixed Entry Signals
---@field public aspect integer The aspect of the signal. The aspect shows if a train is allowed to pass (clear) or not and if it should dock.<br>0 = Unknown<br>1 = The track is clear and the train is allowed to pass.<br>2 = The next track is Occupied and the train should stop<br>3 = The train should dock.
RailroadSignal = {}
--- Returns the track block this signals observes.
---@return RailroadSignalBlock block The railroad signal block this signal is observing.
---@type (fun(self:RailroadSignal):(block:RailroadSignalBlock))|ReflectionFunction
function RailroadSignal:getObservedBlock() end
--- Returns a list of the guarded connections. (incoming connections)
---@return RailroadTrackConnection[] guardedConnections The guarded connections.
---@type (fun(self:RailroadSignal):(guardedConnections:RailroadTrackConnection[]))|ReflectionFunction
function RailroadSignal:getGuardedConnnections() end
--- Returns a list of the observed connections. (outgoing connections)
---@return RailroadTrackConnection[] observedConnections The observed connections.
---@type (fun(self:RailroadSignal):(observedConnections:RailroadTrackConnection[]))|ReflectionFunction
function RailroadSignal:getObservedConnections() end
--- A train signal to control trains on a track.
---@class RailroadSignal-Class : Buildable-Class
RailroadSignal_Class = {}

--- Directs the movement of trains to avoid collisions and bottlenecks.
--- 
--- Block Signals can be placed on Railways to create 'Blocks' between them. When a train is occupying one of these Blocks, other trains will be unable to enter it.
--- 
--- Caution: Signals are directional! Trains are unable to move against this direction, so be sure to set up Signals in both directions for bi-directional Railways.
---@class Build_RailroadBlockSignal_C : RailroadSignal
Build_RailroadBlockSignal_C = {}
--- Directs the movement of trains to avoid collisions and bottlenecks.
--- 
--- Block Signals can be placed on Railways to create 'Blocks' between them. When a train is occupying one of these Blocks, other trains will be unable to enter it.
--- 
--- Caution: Signals are directional! Trains are unable to move against this direction, so be sure to set up Signals in both directions for bi-directional Railways.
---@class Build_RailroadBlockSignal_C-Class : RailroadSignal-Class
Build_RailroadBlockSignal_C_Class = {}

--- Directs the movement of trains to avoid collisions and bottlenecks.
--- 
--- Path Signals are advanced signals that are especially useful for bi-directional Railways and complex intersections. They function similarly to Block Signals, but rather than occupying the entire Block, trains can reserve a specific path through it and will only enter the Block if their path allows them to fully pass through.
--- 
--- Caution: Signals are directional! Trains are unable to move against this direction, so be sure to set up Signals in both directions for bi-directional Railways.
---@class Build_RailroadPathSignal_C : RailroadSignal
Build_RailroadPathSignal_C = {}
--- Directs the movement of trains to avoid collisions and bottlenecks.
--- 
--- Path Signals are advanced signals that are especially useful for bi-directional Railways and complex intersections. They function similarly to Block Signals, but rather than occupying the entire Block, trains can reserve a specific path through it and will only enter the Block if their path allows them to fully pass through.
--- 
--- Caution: Signals are directional! Trains are unable to move against this direction, so be sure to set up Signals in both directions for bi-directional Railways.
---@class Build_RailroadPathSignal_C-Class : RailroadSignal-Class
Build_RailroadPathSignal_C_Class = {}

--- The controler object for a railroad switch.
---@class RailroadSwitchControl : Buildable
RailroadSwitchControl = {}
--- Toggles the railroad switch like if you interact with it.
---@type (fun(self:RailroadSwitchControl))|ReflectionFunction
function RailroadSwitchControl:toggleSwitch() end
--- Returns the current switch position of this switch.
---@return integer position The current switch position of this switch.
---@type (fun(self:RailroadSwitchControl):(position:integer))|ReflectionFunction
function RailroadSwitchControl:switchPosition() end
--- Returns the Railroad Connection this switch is controlling.
---@return RailroadTrackConnection connection The controlled connectino.
---@type (fun(self:RailroadSwitchControl):(connection:RailroadTrackConnection))|ReflectionFunction
function RailroadSwitchControl:getControlledConnection() end
--- The controler object for a railroad switch.
---@class RailroadSwitchControl-Class : Buildable-Class
RailroadSwitchControl_Class = {}

--- 
---@class Build_RailroadSwitchControl_C : RailroadSwitchControl
Build_RailroadSwitchControl_C = {}
--- 
---@class Build_RailroadSwitchControl_C-Class : RailroadSwitchControl-Class
Build_RailroadSwitchControl_C_Class = {}

--- Carries trains reliably and quickly.
--- Has a wide turn angle, so make sure to plan it out properly.
---@class Build_RailroadTrack_C : RailroadTrack
Build_RailroadTrack_C = {}
--- Carries trains reliably and quickly.
--- Has a wide turn angle, so make sure to plan it out properly.
---@class Build_RailroadTrack_C-Class : RailroadTrack-Class
Build_RailroadTrack_C_Class = {}

--- A peice of railroad track over which trains can drive.
---@class RailroadTrack : Buildable
---@field public length number The length of the track.
---@field public isOwnedByPlatform boolean True if the track is part of/owned by a railroad platform.
RailroadTrack = {}
--- Returns the closes track position from the given world position
---@param worldPos Vector The world position form which you want to get the closest track position.
---@return RailroadTrack track The track the track pos points to.
---@return number offset The offset of the track pos.
---@return number forward The forward direction of the track pos. 1 = with the track direction, -1 = against the track direction
---@type (fun(self:RailroadTrack,worldPos:Vector):(track:RailroadTrack,offset:number,forward:number))|ReflectionFunction
function RailroadTrack:getClosestTrackPosition(worldPos) end
--- Returns the world location and world rotation of the track position from the given track position.
---@param track RailroadTrack The track the track pos points to.
---@param offset number The offset of the track pos.
---@param forward number The forward direction of the track pos. 1 = with the track direction, -1 = against the track direction
---@return Vector location The location at the given track position
---@return Vector rotation The rotation at the given track position (forward vector)
---@type (fun(self:RailroadTrack,track:RailroadTrack,offset:number,forward:number):(location:Vector,rotation:Vector))|ReflectionFunction
function RailroadTrack:getWorldLocAndRotAtPos(track, offset, forward) end
--- Returns the railroad track connection at the given direction.
---@param direction integer The direction of which you want to get the connector from. 0 = front, 1 = back
---@return RailroadTrackConnection connection The connection component in the given direction.
---@type (fun(self:RailroadTrack,direction:integer):(connection:RailroadTrackConnection))|ReflectionFunction
function RailroadTrack:getConnection(direction) end
--- Returns the track graph of which this track is part of.
---@return TrackGraph track The track graph of which this track is part of.
---@type (fun(self:RailroadTrack):(track:TrackGraph))|ReflectionFunction
function RailroadTrack:getTrackGraph() end
--- Returns a list of Railroad Vehicles on the Track
---@return RailroadVehicle[] vehicles THe list of vehicles on the track.
---@type (fun(self:RailroadTrack):(vehicles:RailroadVehicle[]))|ReflectionFunction
function RailroadTrack:getVehicles() end
--- A peice of railroad track over which trains can drive.
---@class RailroadTrack-Class : Buildable-Class
RailroadTrack_Class = {}

--- 
---@class Build_RailroadTrackIntegrated_C : RailroadTrack
Build_RailroadTrackIntegrated_C = {}
--- 
---@class Build_RailroadTrackIntegrated_C-Class : RailroadTrack-Class
Build_RailroadTrackIntegrated_C_Class = {}

--- 
---@class FGBuildableRoad : Buildable
FGBuildableRoad = {}
--- 
---@class FGBuildableRoad-Class : Buildable-Class
FGBuildableRoad_Class = {}

--- 
---@class FGBuildableSnowDispenser : Buildable
FGBuildableSnowDispenser = {}
--- 
---@class FGBuildableSnowDispenser-Class : Buildable-Class
FGBuildableSnowDispenser_Class = {}

--- Makes it snow!
--- Attaches to Walls and ceilings.
---@class Build_SnowDispenser_C : FGBuildableSnowDispenser
Build_SnowDispenser_C = {}
--- Makes it snow!
--- Attaches to Walls and ceilings.
---@class Build_SnowDispenser_C-Class : FGBuildableSnowDispenser-Class
Build_SnowDispenser_C_Class = {}

--- Connects Power Poles, Power Generators, and factory buildings.
---@class Build_PowerLine_C : FGBuildableWire
Build_PowerLine_C = {}
--- Connects Power Poles, Power Generators, and factory buildings.
---@class Build_PowerLine_C-Class : FGBuildableWire-Class
Build_PowerLine_C_Class = {}

--- 
---@class FGBuildableWire : Buildable
FGBuildableWire = {}
--- 
---@class FGBuildableWire-Class : Buildable-Class
FGBuildableWire_Class = {}

--- Used to connect Power Poles, Power Generators and factory buildings. Has pretty lights to boot!
---@class Build_XmassLightsLine_C : FGBuildableWire
Build_XmassLightsLine_C = {}
--- Used to connect Power Poles, Power Generators and factory buildings. Has pretty lights to boot!
---@class Build_XmassLightsLine_C-Class : FGBuildableWire-Class
Build_XmassLightsLine_C_Class = {}

--- 
---@class FGCustomizationLocker : Buildable
FGCustomizationLocker = {}
--- 
---@class FGCustomizationLocker-Class : Buildable-Class
FGCustomizationLocker_Class = {}

--- 
---@class Build_Locker_MK1_C : FGCustomizationLocker
Build_Locker_MK1_C = {}
--- 
---@class Build_Locker_MK1_C-Class : FGCustomizationLocker-Class
Build_Locker_MK1_C_Class = {}

--- 
---@class FGPioneerPotty : Buildable
FGPioneerPotty = {}
--- 
---@class FGPioneerPotty-Class : Buildable-Class
FGPioneerPotty_Class = {}

--- 
---@class BUILD_Potty_mk1_C : FGPioneerPotty
BUILD_Potty_mk1_C = {}
--- 
---@class BUILD_Potty_mk1_C-Class : FGPioneerPotty-Class
BUILD_Potty_mk1_C_Class = {}

--- 
---@class FINNetworkAdapter : Buildable
FINNetworkAdapter = {}
--- 
---@class FINNetworkAdapter-Class : Buildable-Class
FINNetworkAdapter_Class = {}

--- 
---@class Build_NetworkAdapter_C : FINNetworkAdapter
Build_NetworkAdapter_C = {}
--- 
---@class Build_NetworkAdapter_C-Class : FINNetworkAdapter-Class
Build_NetworkAdapter_C_Class = {}

--- 
---@class FINNetworkCable : Buildable
FINNetworkCable = {}
--- 
---@class FINNetworkCable-Class : Buildable-Class
FINNetworkCable_Class = {}

--- The FicsIt-Networks Network Cable allows you to connect your network components wich each other.
--- 
--- This is the core process of building up your own computer network.
--- 
--- You can cconnect this cable via two a two step placement procedure to two network connectors, or, if the component/machine/whatever doesn't have a network connector, it will try to create add a network adpater to the machine to still allow you to connect it to your network.
---@class Build_NetworkCable_C : FINNetworkCable
Build_NetworkCable_C = {}
--- The FicsIt-Networks Network Cable allows you to connect your network components wich each other.
--- 
--- This is the core process of building up your own computer network.
--- 
--- You can cconnect this cable via two a two step placement procedure to two network connectors, or, if the component/machine/whatever doesn't have a network connector, it will try to create add a network adpater to the machine to still allow you to connect it to your network.
---@class Build_NetworkCable_C-Class : FINNetworkCable-Class
Build_NetworkCable_C_Class = {}

--- The FicsIt-Networks Thin Network Cable allows you to connect your network panels with each other more gracefully.
--- 
--- This cable works just like the normal network cable except it can only connect between MCP panels and Small Network Plugs.
--- 
--- You can then connect Normal/Large Network Cables to those Small Network Plugs to be able to connect your MCP Panels with a computer.
---@class Build_ThinNetworkCable_C : FINNetworkCable
Build_ThinNetworkCable_C = {}
--- The FicsIt-Networks Thin Network Cable allows you to connect your network panels with each other more gracefully.
--- 
--- This cable works just like the normal network cable except it can only connect between MCP panels and Small Network Plugs.
--- 
--- You can then connect Normal/Large Network Cables to those Small Network Plugs to be able to connect your MCP Panels with a computer.
---@class Build_ThinNetworkCable_C-Class : FINNetworkCable-Class
Build_ThinNetworkCable_C_Class = {}

--- 
---@class NetworkRouter : Buildable
---@field public isWhitelist boolean 
---@field public isAddrWhitelist boolean True if the address filter list is used as whitelist.
NetworkRouter = {}
--- Overrides the port filter list with the given array.
---@return integer[] ports The port array you want to override the filter list with.
---@type (fun(self:NetworkRouter):(ports:integer[]))|ReflectionFunction
function NetworkRouter:setPortList() end
--- Overrides the address filter list with the given array.
---@return string[] addresses The address array you want to override the filter list with.
---@type (fun(self:NetworkRouter):(addresses:string[]))|ReflectionFunction
function NetworkRouter:setAddrList() end
--- Removes the given port from the port filter list.
---@param port integer The port you want to remove from the list.
---@type (fun(self:NetworkRouter,port:integer))|ReflectionFunction
function NetworkRouter:removePortList(port) end
--- Removes the given address from the address filter list.
---@param addr string The address you want to remove from the list.
---@type (fun(self:NetworkRouter,addr:string))|ReflectionFunction
function NetworkRouter:removeAddrList(addr) end
--- Allows to get all the ports of the port filter list as array.
---@return integer[] ports The port array of the filter list.
---@type (fun(self:NetworkRouter):(ports:integer[]))|ReflectionFunction
function NetworkRouter:getPortList() end
--- Allows to get all the addresses of the address filter list as array.
---@return string[] addresses The address array of the filter list.
---@type (fun(self:NetworkRouter):(addresses:string[]))|ReflectionFunction
function NetworkRouter:getAddrList() end
--- Adds a given port to the port filter list.
---@param port integer The port you want to add to the list.
---@type (fun(self:NetworkRouter,port:integer))|ReflectionFunction
function NetworkRouter:addPortList(port) end
--- 
---@param addr string 
---@type (fun(self:NetworkRouter,addr:string))|ReflectionFunction
function NetworkRouter:addAddrList(addr) end
--- 
---@class NetworkRouter-Class : Buildable-Class
NetworkRouter_Class = {}

--- The FicsIt-Networks Network Router allows you to sepparate two different component network from each other.
--- But it still lets network messages sent by network cards through.
--- This allows for better networking capabilities, faster networking (can reduce game lag) and makes working with larger networks and multiple computer more easy.
--- 
--- The router also provides a couple of functions which allow you to create filters for ports and message senders.
---@class Build_NetworkRouter_C : NetworkRouter
Build_NetworkRouter_C = {}
--- The FicsIt-Networks Network Router allows you to sepparate two different component network from each other.
--- But it still lets network messages sent by network cards through.
--- This allows for better networking capabilities, faster networking (can reduce game lag) and makes working with larger networks and multiple computer more easy.
--- 
--- The router also provides a couple of functions which allow you to create filters for ports and message senders.
---@class Build_NetworkRouter_C-Class : NetworkRouter-Class
Build_NetworkRouter_C_Class = {}

--- 
---@class FINWirelessAccessPoint : Buildable
FINWirelessAccessPoint = {}
--- 
---@class FINWirelessAccessPoint-Class : Buildable-Class
FINWirelessAccessPoint_Class = {}

--- The Ficsit Networks Wireless Access Point allows you to connect a circuit to the Ficsit Wireless Area Network (FWAN), which uses Radio Towers frequencies to create a messaging network over the planet.
---  
--- It should be connected to a Radio Tower, then all network messages received will be broadcasted to all other Wireless Access Points across the map.
---@class Build_WirelessAccessPoint_C : FINWirelessAccessPoint
Build_WirelessAccessPoint_C = {}
--- The Ficsit Networks Wireless Access Point allows you to connect a circuit to the Ficsit Wireless Area Network (FWAN), which uses Radio Towers frequencies to create a messaging network over the planet.
---  
--- It should be connected to a Radio Tower, then all network messages received will be broadcasted to all other Wireless Access Points across the map.
---@class Build_WirelessAccessPoint_C-Class : FINWirelessAccessPoint-Class
Build_WirelessAccessPoint_C_Class = {}

--- 
---@class ComputerCase : Buildable
ComputerCase = {}
--- Stops the Computer (Processor).
---@return Future_ComputerCase_stopComputer
---@type (fun(self:ComputerCase))|ReflectionFunction
function ComputerCase:stopComputer() end
---@class Future_ComputerCase_stopComputer : Future
Future_ComputerCase_stopComputer = {}
---@type fun(self:Future_ComputerCase_stopComputer)
function Future_ComputerCase_stopComputer:await() end
---@type fun(self:Future_ComputerCase_stopComputer)
function Future_ComputerCase_stopComputer:get() end
---@type fun(self:Future_ComputerCase_stopComputer):boolean
function Future_ComputerCase_stopComputer:canGet() end
--- Starts the Computer (Processor).
---@return Future_ComputerCase_startComputer
---@type (fun(self:ComputerCase))|ReflectionFunction
function ComputerCase:startComputer() end
---@class Future_ComputerCase_startComputer : Future
Future_ComputerCase_startComputer = {}
---@type fun(self:Future_ComputerCase_startComputer)
function Future_ComputerCase_startComputer:await() end
---@type fun(self:Future_ComputerCase_startComputer)
function Future_ComputerCase_startComputer:get() end
---@type fun(self:Future_ComputerCase_startComputer):boolean
function Future_ComputerCase_startComputer:canGet() end
--- Returns the internal kernel state of the computer.
---@return integer result The current internal kernel state.
---@type (fun(self:ComputerCase):(result:integer))|ReflectionFunction
function ComputerCase:getState() end
--- Returns the log of the computer. Output is paginated using the input parameters. A negative Page will indicate pagination from the bottom (latest log entry first).
---@param pageSize integer The size of the returned page.
---@param page integer The index of the page you want to return. Negative to start indexing at the bottom (latest entries first).
---@return Future_ComputerCase_getLog
---@type (fun(self:ComputerCase,pageSize:integer,page:integer):(Future_ComputerCase_getLog))|ReflectionFunction
function ComputerCase:getLog(pageSize, page) end
---@class Future_ComputerCase_getLog : Future
Future_ComputerCase_getLog = {}
---@type fun(self:Future_ComputerCase_getLog):(log:LogEntry[],logSize:integer)
function Future_ComputerCase_getLog:await() end
---@type fun(self:Future_ComputerCase_getLog):(log:LogEntry[],logSize:integer)
function Future_ComputerCase_getLog:get() end
---@type fun(self:Future_ComputerCase_getLog):boolean
function Future_ComputerCase_getLog:canGet() end
--- 
---@class ComputerCase-Class : Buildable-Class
ComputerCase_Class = {}

--- The FicsIt-Network computer case is the most important thing you will know of. This case already holds the essentials of a computer for you. Like a network connector, keyboard, mouse and screen. But most important of all, it already has a motherboard were you can place and configure the computer just like you want.
---@class Build_ComputerCase_C : ComputerCase
Build_ComputerCase_C = {}
--- The FicsIt-Network computer case is the most important thing you will know of. This case already holds the essentials of a computer for you. Like a network connector, keyboard, mouse and screen. But most important of all, it already has a motherboard were you can place and configure the computer just like you want.
---@class Build_ComputerCase_C-Class : ComputerCase-Class
Build_ComputerCase_C_Class = {}

--- 
---@class FINComputerModule : Buildable
FINComputerModule = {}
--- 
---@class FINComputerModule-Class : Buildable-Class
FINComputerModule_Class = {}

--- 
---@class FINComputerDriveHolder : FINComputerModule
FINComputerDriveHolder = {}
--- 
---@class FINComputerDriveHolder-Class : FINComputerModule-Class
FINComputerDriveHolder_Class = {}

--- The FicsIt-Networks Drive holder allows you to add any hard drive to the computer system.
--- 
--- The drive will then be able to get mounted as root FS or to get added as device file to the FS, after that you will be able to manually mount the drive to your desired location.
---@class Build_DriveHolder_C : FINComputerDriveHolder
Build_DriveHolder_C = {}
--- The FicsIt-Networks Drive holder allows you to add any hard drive to the computer system.
--- 
--- The drive will then be able to get mounted as root FS or to get added as device file to the FS, after that you will be able to manually mount the drive to your desired location.
---@class Build_DriveHolder_C-Class : FINComputerDriveHolder-Class
Build_DriveHolder_C_Class = {}

--- 
---@class FINComputerGPU : FINComputerModule
FINComputerGPU = {}
--- 
---@return Vector2D ReturnValue 
---@type (fun(self:FINComputerGPU):(ReturnValue:Vector2D))|ReflectionFunction
function FINComputerGPU:getScreenSize() end
--- Binds this GPU to the given screen. Unbinds the already bound screen.
---@param newScreen Object The screen you want to bind this GPU to. Null if you want to unbind the screen.
---@return Future_FINComputerGPU_bindScreen
---@type (fun(self:FINComputerGPU,newScreen:Object))|ReflectionFunction
function FINComputerGPU:bindScreen(newScreen) end
---@class Future_FINComputerGPU_bindScreen : Future
Future_FINComputerGPU_bindScreen = {}
---@type fun(self:Future_FINComputerGPU_bindScreen)
function Future_FINComputerGPU_bindScreen:await() end
---@type fun(self:Future_FINComputerGPU_bindScreen)
function Future_FINComputerGPU_bindScreen:get() end
---@type fun(self:Future_FINComputerGPU_bindScreen):boolean
function Future_FINComputerGPU_bindScreen:canGet() end
--- 
---@class FINComputerGPU-Class : FINComputerModule-Class
FINComputerGPU_Class = {}

--- 
---@class GPUT1 : FINComputerGPU
GPUT1 = {}
--- Draws the given text at the given position to the hidden screen buffer.
---@param x integer The x coordinate at which the text should get drawn.
---@param y integer The y coordinate at which the text should get drawn.
---@param str string The text you want to draw on-to the buffer.
---@type (fun(self:GPUT1,x:integer,y:integer,str:string))|ReflectionFunction
function GPUT1:setText(x, y, str) end
--- Changes the size of the text-grid (and buffer).
---@param w integer The width of the text-gird.
---@param h integer The height of the text-grid.
---@type (fun(self:GPUT1,w:integer,h:integer))|ReflectionFunction
function GPUT1:setSize(w, h) end
--- Changes the foreground color that is used for the next draw calls.
---@param r number The red portion of the foreground color. (0.0 - 1.0)
---@param g number The green portion of the foreground color. (0.0 - 1.0)
---@param b number The blue portion of the foreground color. (0.0 - 1.0)
---@param a number The opacity of the foreground color. (0.0 - 1.0)
---@type (fun(self:GPUT1,r:number,g:number,b:number,a:number))|ReflectionFunction
function GPUT1:setForeground(r, g, b, a) end
--- Allows to change the back buffer of the GPU to the given buffer.
---@param buffer GPUT1Buffer The Buffer you want to now use as back buffer.
---@type (fun(self:GPUT1,buffer:GPUT1Buffer))|ReflectionFunction
function GPUT1:setBuffer(buffer) end
--- Changes the background color that is used for the next draw calls.
---@param r number The red portion of the background color. (0.0 - 1.0)
---@param g number The green portion of the background color. (0.0 - 1.0)
---@param b number The blue portion of the background color. (0.0 - 1.0)
---@param a number The opacity of the background color. (0.0 - 1.0)
---@type (fun(self:GPUT1,r:number,g:number,b:number,a:number))|ReflectionFunction
function GPUT1:setBackground(r, g, b, a) end
--- Returns the size of the text-grid (and buffer).
---@return integer w The width of the text-gird.
---@return integer h The height of the text-grid.
---@type (fun(self:GPUT1):(w:integer,h:integer))|ReflectionFunction
function GPUT1:getSize() end
--- Returns the currently bound screen.
---@return Object screen The currently bound screen.
---@type (fun(self:GPUT1):(screen:Object))|ReflectionFunction
function GPUT1:getScreen() end
--- Returns the back buffer as struct to be able to use advanced buffer handling functions. (struct is a copy)
---@return GPUT1Buffer buffer The Buffer that is currently the back buffer.
---@type (fun(self:GPUT1):(buffer:GPUT1Buffer))|ReflectionFunction
function GPUT1:getBuffer() end
--- Flushes the hidden screen buffer to the visible screen buffer and so makes the draw calls visible.
---@type (fun(self:GPUT1))|ReflectionFunction
function GPUT1:flush() end
--- Draws the given character at all given positions in the given rectangle on-to the hidden screen buffer.
---@param x integer The x coordinate at which the rectangle should get drawn. (upper-left corner)
---@param y integer The y coordinate at which the rectangle should get drawn. (upper-left corner)
---@param dx integer The width of the rectangle.
---@param dy integer The height of the rectangle.
---@param str string The character you want to use for the rectangle. (first char in the given string)
---@type (fun(self:GPUT1,x:integer,y:integer,dx:integer,dy:integer,str:string))|ReflectionFunction
function GPUT1:fill(x, y, dx, dy, str) end
--- 
---@class GPUT1-Class : FINComputerGPU-Class
GPUT1_Class = {}

--- The FicsIt-Networks GPU T1 allows you to render a character grid onto any kind of screen.
--- 
--- Each character of this grid can be colored as you want as well as the background of each character.
--- 
--- You can also change the resolution to up to 150x50 characters.
--- 
--- The GPU also implemnts some signals allowing you to interact with the graphics more easily via keyboard, mouse and even touch.
---@class Build_GPU_T1_C : GPUT1
Build_GPU_T1_C = {}
--- The FicsIt-Networks GPU T1 allows you to render a character grid onto any kind of screen.
--- 
--- Each character of this grid can be colored as you want as well as the background of each character.
--- 
--- You can also change the resolution to up to 150x50 characters.
--- 
--- The GPU also implemnts some signals allowing you to interact with the graphics more easily via keyboard, mouse and even touch.
---@class Build_GPU_T1_C-Class : GPUT1-Class
Build_GPU_T1_C_Class = {}

--- 
---@class FINComputerGPUT2 : FINComputerGPU
FINComputerGPUT2 = {}
--- Pushes a transformation to the geometry stack. All subsequent drawcalls will be transformed through all previously pushed geometries and this one. Be aware, only all draw calls till, this geometry gets pop'ed are transformed, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param translation Vector2D The local translation that is supposed to happen to all further drawcalls. Translation can be also thought as 'repositioning'.
---@param rotation number The local rotation that gets applied to all subsequent draw calls. The origin of the rotation is the whole screens center point. The value is in degrees.
---@param scale Vector2D The scale that gets applied to the whole screen localy along the (rotated) axis. No change in scale is (1,1).
---@type (fun(self:FINComputerGPUT2,translation:Vector2D,rotation:number,scale:Vector2D))|ReflectionFunction
function FINComputerGPUT2:pushTransform(translation, rotation, scale) end
--- Pushes a layout to the geometry stack. All subsequent drawcalls will be transformed through all previously pushed geometries and this one. Be aware, only all draw calls, till this geometry gets pop'ed are transformed, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param offset Vector2D The local translation (or offset) that is supposed to happen to all further drawcalls. Translation can be also thought as 'repositioning'.
---@param size Vector2D The scale that gets applied to the whole screen localy along both axis. No change in scale is 1.
---@param scale number 
---@type (fun(self:FINComputerGPUT2,offset:Vector2D,size:Vector2D,scale:number))|ReflectionFunction
function FINComputerGPUT2:pushLayout(offset, size, scale) end
--- Pushes a rectangle to the clipping stack. All subsequent drawcalls will be clipped to only be visible within this clipping zone and all previously pushed clipping zones. Be aware, only all draw calls, till this clipping zone gets pop'ed are getting clipped by it, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param position Vector2D The local position of the upper left corner of the clipping rectangle.
---@param size Vector2D The size of the clipping rectangle.
---@type (fun(self:FINComputerGPUT2,position:Vector2D,size:Vector2D))|ReflectionFunction
function FINComputerGPUT2:pushClipRect(position, size) end
--- Pushes a 4 pointed polygon to the clipping stack. All subsequent drawcalls will be clipped to only be visible within this clipping zone and all previously pushed clipping zones. Be aware, only all draw calls, till this clipping zone gets pop'ed are getting clipped by it, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param topLeft Vector2D The local position of the top left point.
---@param topRight Vector2D The local position of the top right point.
---@param bottomLeft Vector2D The local position of the top right point.
---@param bottomRight Vector2D The local position of the bottom right point.
---@type (fun(self:FINComputerGPUT2,topLeft:Vector2D,topRight:Vector2D,bottomLeft:Vector2D,bottomRight:Vector2D))|ReflectionFunction
function FINComputerGPUT2:pushClipPolygon(topLeft, topRight, bottomLeft, bottomRight) end
--- Pops the top most geometry from the geometry stack. The latest geometry on the stack gets removed first. (Last In, First Out)
---@type (fun(self:FINComputerGPUT2))|ReflectionFunction
function FINComputerGPUT2:popGeometry() end
--- Pops the top most clipping zone from the clipping stack. The latest clipping zone on the stack gets removed first. (Last In, First Out)
---@type (fun(self:FINComputerGPUT2))|ReflectionFunction
function FINComputerGPUT2:popClip() end
--- 
---@param Text string 
---@param Size integer 
---@param bMonospace boolean 
---@return Future_FINComputerGPUT2_measureText
---@type (fun(self:FINComputerGPUT2,Text:string,Size:integer,bMonospace:boolean):(Future_FINComputerGPUT2_measureText))|ReflectionFunction
function FINComputerGPUT2:measureText(Text, Size, bMonospace) end
---@class Future_FINComputerGPUT2_measureText : Future
Future_FINComputerGPUT2_measureText = {}
---@type fun(self:Future_FINComputerGPUT2_measureText):(ReturnValue:Vector2D)
function Future_FINComputerGPUT2_measureText:await() end
---@type fun(self:Future_FINComputerGPUT2_measureText):(ReturnValue:Vector2D)
function Future_FINComputerGPUT2_measureText:get() end
---@type fun(self:Future_FINComputerGPUT2_measureText):boolean
function Future_FINComputerGPUT2_measureText:canGet() end
--- Flushes all draw calls to the visible draw call buffer to show all changes at once. The draw buffer gets cleared afterwards.
---@type (fun(self:FINComputerGPUT2))|ReflectionFunction
function FINComputerGPUT2:flush() end
--- Draws some Text at the given position (top left corner of the text), text, size, color and rotation.
---@param position Vector2D The position of the top left corner of the text.
---@param text string The text to draw.
---@param size integer The font size used.
---@param color Color The color of the text.
---@param monospace boolean True if a monospace font should be used.
---@type (fun(self:FINComputerGPUT2,position:Vector2D,text:string,size:integer,color:Color,monospace:boolean))|ReflectionFunction
function FINComputerGPUT2:drawText(position, text, size, color, monospace) end
--- Draws a Spline from one position to another with given directions, thickness and color.
---@param start Vector2D The local position of the start point of the spline.
---@param startDirections Vector2D The direction of the spline of how it exists the start point.
---@param end Vector2D The local position of the end point of the spline.
---@param endDirection Vector2D The direction of how the spline enters the end position.
---@param thickness number The thickness of the line drawn.
---@param color Color The color of the line drawn.
---@type (fun(self:FINComputerGPUT2,start:Vector2D,startDirections:Vector2D,end:Vector2D,endDirection:Vector2D,thickness:number,color:Color))|ReflectionFunction
function FINComputerGPUT2:drawSpline(start, startDirections, end, endDirection, thickness, color) end
--- Draws a Rectangle with the upper left corner at the given local position, size, color and rotation around the upper left corner.
---@param position Vector2D The local position of the upper left corner of the rectangle.
---@param size Vector2D The size of the rectangle.
---@param color Color The color of the rectangle.
---@param image string If not empty string, should be image reference that should be placed inside the rectangle.
---@param rotation number The rotation of the rectangle around the upper left corner in degrees.
---@type (fun(self:FINComputerGPUT2,position:Vector2D,size:Vector2D,color:Color,image:string,rotation:number))|ReflectionFunction
function FINComputerGPUT2:drawRect(position, size, color, image, rotation) end
--- Draws connected lines through all given points with the given thickness and color.
---@param points Vector2D[] The local points that get connected by lines one after the other.
---@param thickness number The thickness of the lines.
---@param color Color The color of the lines.
---@type (fun(self:FINComputerGPUT2,points:Vector2D[],thickness:number,color:Color))|ReflectionFunction
function FINComputerGPUT2:drawLines(points, thickness, color) end
--- Draws a box.
---@param boxSettings GPUT2DrawCallBox The settings of the box you want to draw.
---@type (fun(self:FINComputerGPUT2,boxSettings:GPUT2DrawCallBox))|ReflectionFunction
function FINComputerGPUT2:drawBox(boxSettings) end
--- Draws a Cubic Bezier Spline from one position to another with given control points, thickness and color.
---@param p0 Vector2D The local position of the start point of the spline.
---@param p1 Vector2D The local position of the first control point.
---@param p2 Vector2D The local position of the second control point.
---@param p3 Vector2D The local position of the end point of the spline.
---@param thickness number The thickness of the line drawn.
---@param color Color The color of the line drawn.
---@type (fun(self:FINComputerGPUT2,p0:Vector2D,p1:Vector2D,p2:Vector2D,p3:Vector2D,thickness:number,color:Color))|ReflectionFunction
function FINComputerGPUT2:drawBezier(p0, p1, p2, p3, thickness, color) end
--- 
---@class FINComputerGPUT2-Class : FINComputerGPU-Class
FINComputerGPUT2_Class = {}

--- The Graphical Processing Unit T2 allows for 2D Drawing on a screen.
--- 
--- You are able to draw with lines, boxes, text, images & more.
--- 
--- And through the use of transformation stack and clipping stack, you can more easily create more complex drawings!
--- 
--- The GPU also implemnts some signals allowing you to interact with the graphics more easily via keyboard, mouse and even touch.
---@class Build_GPU_T2_C : FINComputerGPUT2
Build_GPU_T2_C = {}
--- The Graphical Processing Unit T2 allows for 2D Drawing on a screen.
--- 
--- You are able to draw with lines, boxes, text, images & more.
--- 
--- And through the use of transformation stack and clipping stack, you can more easily create more complex drawings!
--- 
--- The GPU also implemnts some signals allowing you to interact with the graphics more easily via keyboard, mouse and even touch.
---@class Build_GPU_T2_C-Class : FINComputerGPUT2-Class
Build_GPU_T2_C_Class = {}

--- 
---@class FINComputerMemory : FINComputerModule
FINComputerMemory = {}
--- 
---@class FINComputerMemory-Class : FINComputerModule-Class
FINComputerMemory_Class = {}

--- This is 100kB of amazing FicsIt-Networks Memory.
--- 
--- You can add multiple of the memory bars to your PC and so you can extend the memory of your PC.
--- 
--- You always need to have enough memory because FicsIt doesn't allow out of memory exceptions and if you bring a computer to throw one, you will loose one month of payment.
---@class Build_RAM_T1_C : FINComputerMemory
Build_RAM_T1_C = {}
--- This is 100kB of amazing FicsIt-Networks Memory.
--- 
--- You can add multiple of the memory bars to your PC and so you can extend the memory of your PC.
--- 
--- You always need to have enough memory because FicsIt doesn't allow out of memory exceptions and if you bring a computer to throw one, you will loose one month of payment.
---@class Build_RAM_T1_C-Class : FINComputerMemory-Class
Build_RAM_T1_C_Class = {}

--- 
---@class NetworkCard : FINComputerModule
NetworkCard = {}
--- Sends a network message to the receiver with the given address on the given port. The data you want to add can be passed as additional parameters. Max amount of such parameters is 7 and they can only be nil, booleans, numbers and strings.
---@param receiver string The component ID as string of the component you want to send the network message to.
---@param port integer The port on which the network message should get sent. For outgoing network messages a port does not need to be opened.
---@param ... any
---@type (fun(self:NetworkCard,receiver:string,port:integer,...:any))|ReflectionFunction
function NetworkCard:send(receiver, port, ...) end
--- Opens the given port so the network card is able to receive network messages on the given port.
---@param port integer The port you want to open.
---@type (fun(self:NetworkCard,port:integer))|ReflectionFunction
function NetworkCard:open(port) end
--- Closes all ports of the network card so no further messages are able to get received
---@type (fun(self:NetworkCard))|ReflectionFunction
function NetworkCard:closeAll() end
--- Closes the given port so the network card wont receive network messages on the given port.
---@param port integer The port you want to close.
---@type (fun(self:NetworkCard,port:integer))|ReflectionFunction
function NetworkCard:close(port) end
--- Sends a network message to all components in the network message network (including networks sepperated by network routers) on the given port. The data you want to add can be passed as additional parameters. Max amount of such parameters is 7 and they can only be nil, booleans, numbers and strings.
---@param port integer The port on which the network message should get sent. For outgoing network messages a port does not need to be opened.
---@param ... any
---@type (fun(self:NetworkCard,port:integer,...:any))|ReflectionFunction
function NetworkCard:broadcast(port, ...) end
--- 
---@class NetworkCard-Class : FINComputerModule-Class
NetworkCard_Class = {}

--- The FicsIt-Networks Network Card allows you to send network messages to other network cards in the same computer network.
--- 
--- You can use unicast and broadcast messages to share information between multiple different computers in the same network.
--- 
--- This is the best and easiest way for you to communicate between multiple computers.
--- 
--- If you want to recieve network messages, make sure you also open the according port, since every message is asscociated with a port allowing for better filtering.
---@class Build_NetworkCard_C : NetworkCard
Build_NetworkCard_C = {}
--- The FicsIt-Networks Network Card allows you to send network messages to other network cards in the same computer network.
--- 
--- You can use unicast and broadcast messages to share information between multiple different computers in the same network.
--- 
--- This is the best and easiest way for you to communicate between multiple computers.
--- 
--- If you want to recieve network messages, make sure you also open the according port, since every message is asscociated with a port allowing for better filtering.
---@class Build_NetworkCard_C-Class : NetworkCard-Class
Build_NetworkCard_C_Class = {}

--- 
---@class FINComputerProcessor : FINComputerModule
FINComputerProcessor = {}
--- 
---@class FINComputerProcessor-Class : FINComputerModule-Class
FINComputerProcessor_Class = {}

--- 
---@class FINComputerProcessorLua : FINComputerProcessor
FINComputerProcessorLua = {}
--- 
---@class FINComputerProcessorLua-Class : FINComputerProcessor-Class
FINComputerProcessorLua_Class = {}

--- This CPU is from the FicsIt-Lua series and allows you to program the PC with Lua.
--- 
--- You can only place one CPU per PC.
--- 
--- You are required to have at least one CPU per PC to run it. FicsIt does not allow unused PC Cases to get build.
---@class Build_CPU_Lua_C : FINComputerProcessorLua
Build_CPU_Lua_C = {}
--- This CPU is from the FicsIt-Lua series and allows you to program the PC with Lua.
--- 
--- You can only place one CPU per PC.
--- 
--- You are required to have at least one CPU per PC to run it. FicsIt does not allow unused PC Cases to get build.
---@class Build_CPU_Lua_C-Class : FINComputerProcessorLua-Class
Build_CPU_Lua_C_Class = {}

--- 
---@class FINComputerScreen : FINComputerModule
FINComputerScreen = {}
--- 
---@class FINComputerScreen-Class : FINComputerModule-Class
FINComputerScreen_Class = {}

--- The FicsIt-Networks Screen Driver allows you to add a screen display to the UI of the computer case you build this module into.
--- 
--- You can then use the computer API to get a reference to the screen and so you can bind the screen to a GPU.
---@class Build_ScreenDriver_C : FINComputerScreen
Build_ScreenDriver_C = {}
--- The FicsIt-Networks Screen Driver allows you to add a screen display to the UI of the computer case you build this module into.
--- 
--- You can then use the computer API to get a reference to the screen and so you can bind the screen to a GPU.
---@class Build_ScreenDriver_C-Class : FINComputerScreen-Class
Build_ScreenDriver_C_Class = {}

--- 
---@class FINInternetCard : FINComputerModule
FINInternetCard = {}
--- Does an HTTP-Request. If a payload is given, the Content-Type header has to be set. All additional parameters have to be strings and in pairs of two for defining the http headers and values.
---@param url string The URL for which you want to make an HTTP Request.
---@param method string The http request method/verb you want to make the request. f.e. 'GET', 'POST'
---@param data string The http request payload you want to sent.
---@param ... any
---@return Future ReturnValue 
---@type (fun(self:FINInternetCard,url:string,method:string,data:string,...:any):(ReturnValue:Future))|ReflectionFunction
function FINInternetCard:request(url, method, data, ...) end
--- 
---@class FINInternetCard-Class : FINComputerModule-Class
FINInternetCard_Class = {}

--- A Internet Card!
---@class Build_InternetCard_C : FINInternetCard
Build_InternetCard_C = {}
--- A Internet Card!
---@class Build_InternetCard_C-Class : FINInternetCard-Class
Build_InternetCard_C_Class = {}

--- 
---@class IndicatorPole : Buildable
IndicatorPole = {}
--- Allows to change the color and light intensity of the indicator lamp.
---@param r number The red part of the color in which the light glows. (0.0 - 1.0)
---@param g number The green part of the color in which the light glows. (0.0 - 1.0)
---@param b number The blue part of the color in which the light glows. (0.0 - 1.0)
---@param e number The light intensity of the pole. (0.0 - 5.0)
---@type (fun(self:IndicatorPole,r:number,g:number,b:number,e:number))|ReflectionFunction
function IndicatorPole:setColor(r, g, b, e) end
--- Allows to get the pole placed on top of this pole.
---@return IndicatorPole topPole The pole placed on top of this pole.
---@type (fun(self:IndicatorPole):(topPole:IndicatorPole))|ReflectionFunction
function IndicatorPole:getTopPole() end
--- Allows to get the color and light intensity of the indicator lamp.
---@return number r The red part of the color in which the light glows. (0.0 - 1.0)
---@return number g The green part of the color in which the light glows. (0.0 - 1.0)
---@return number b The blue part of the color in which the light glows. (0.0 - 1.0)
---@return number e The light intensity of the pole. (0.0 - 5.0)
---@type (fun(self:IndicatorPole):(r:number,g:number,b:number,e:number))|ReflectionFunction
function IndicatorPole:getColor() end
--- 
---@return IndicatorPole ReturnValue 
---@type (fun(self:IndicatorPole):(ReturnValue:IndicatorPole))|ReflectionFunction
function IndicatorPole:getBottomPole() end
--- 
---@class IndicatorPole-Class : Buildable-Class
IndicatorPole_Class = {}

--- The FicsIt-Networks indicator light allows yout to determine by the looks of from far away the state of a machine or program.
--- 
--- It has dynamic height, is stack able and you can control the color of it via accessing it from the computer network.
---@class Build_IndicatorPole_C : IndicatorPole
Build_IndicatorPole_C = {}
--- The FicsIt-Networks indicator light allows yout to determine by the looks of from far away the state of a machine or program.
--- 
--- It has dynamic height, is stack able and you can control the color of it via accessing it from the computer network.
---@class Build_IndicatorPole_C-Class : IndicatorPole-Class
Build_IndicatorPole_C_Class = {}

--- 
---@class ModularIndicatorPole : Buildable
ModularIndicatorPole = {}
--- Returns the next pole module if any.
---@return Actor next The next module in this chain.
---@type (fun(self:ModularIndicatorPole):(next:Actor))|ReflectionFunction
function ModularIndicatorPole:getNext() end
--- Gets the module at the given position in the stack
---@param module integer The module at the given offset in the stack or nil if none
---@return Actor index The index in the stack, 0 being the first module
---@type (fun(self:ModularIndicatorPole,module:integer):(index:Actor))|ReflectionFunction
function ModularIndicatorPole:getModule(module) end
--- 
---@class ModularIndicatorPole-Class : Buildable-Class
ModularIndicatorPole_Class = {}

--- The Modular FicsIt Indicator Pole allows busy pioneers to check on the status of machines, factories and much more from a long distance far away. To express the status you can stack individual modules. FicsIt invested more money to make the indicator pole suitable for every situation by allowing it to be placed on walls, floors and beams with a dynamic orientation and even dynamic height.
---@class Build_ModularIndicatorPole_C : ModularIndicatorPole
Build_ModularIndicatorPole_C = {}
--- The Modular FicsIt Indicator Pole allows busy pioneers to check on the status of machines, factories and much more from a long distance far away. To express the status you can stack individual modules. FicsIt invested more money to make the indicator pole suitable for every situation by allowing it to be placed on walls, floors and beams with a dynamic orientation and even dynamic height.
---@class Build_ModularIndicatorPole_C-Class : ModularIndicatorPole-Class
Build_ModularIndicatorPole_C_Class = {}

--- 
---@class FINModularIndicatorPoleModule : Buildable
FINModularIndicatorPoleModule = {}
--- Gets the previous module or the base mount if this called from the last module.
---@return Buildable previous The previous module or base mount.
---@type (fun(self:FINModularIndicatorPoleModule):(previous:Buildable))|ReflectionFunction
function FINModularIndicatorPoleModule:getPrevious() end
--- Returns the next pole module if any.
---@return FINModularIndicatorPoleModule next The next module in this chain.
---@type (fun(self:FINModularIndicatorPoleModule):(next:FINModularIndicatorPoleModule))|ReflectionFunction
function FINModularIndicatorPoleModule:getNext() end
--- 
---@class FINModularIndicatorPoleModule-Class : Buildable-Class
FINModularIndicatorPoleModule_Class = {}

--- FicsIt Buzzer Module for FicsIt Modular Indicator Poles provides pioneers with the most fundamental sound generator. 
---@class ModularPoleModule_Buzzer : FINModularIndicatorPoleModule
---@field public volume number 
---@field public decayCurve number 
---@field public decayTime number 
---@field public attackCurve number 
---@field public isPlaying boolean 
---@field public attackTime number 
---@field public frequency number Sets the frequency for this buzzer
ModularPoleModule_Buzzer = {}
--- 
---@return Future_ModularPoleModule_Buzzer_stop
---@type (fun(self:ModularPoleModule_Buzzer))|ReflectionFunction
function ModularPoleModule_Buzzer:stop() end
---@class Future_ModularPoleModule_Buzzer_stop : Future
Future_ModularPoleModule_Buzzer_stop = {}
---@type fun(self:Future_ModularPoleModule_Buzzer_stop)
function Future_ModularPoleModule_Buzzer_stop:await() end
---@type fun(self:Future_ModularPoleModule_Buzzer_stop)
function Future_ModularPoleModule_Buzzer_stop:get() end
---@type fun(self:Future_ModularPoleModule_Buzzer_stop):boolean
function Future_ModularPoleModule_Buzzer_stop:canGet() end
--- 
---@return Future_ModularPoleModule_Buzzer_beep
---@type (fun(self:ModularPoleModule_Buzzer))|ReflectionFunction
function ModularPoleModule_Buzzer:beep() end
---@class Future_ModularPoleModule_Buzzer_beep : Future
Future_ModularPoleModule_Buzzer_beep = {}
---@type fun(self:Future_ModularPoleModule_Buzzer_beep)
function Future_ModularPoleModule_Buzzer_beep:await() end
---@type fun(self:Future_ModularPoleModule_Buzzer_beep)
function Future_ModularPoleModule_Buzzer_beep:get() end
---@type fun(self:Future_ModularPoleModule_Buzzer_beep):boolean
function Future_ModularPoleModule_Buzzer_beep:canGet() end
--- FicsIt Buzzer Module for FicsIt Modular Indicator Poles provides pioneers with the most fundamental sound generator. 
---@class ModularPoleModule_Buzzer-Class : FINModularIndicatorPoleModule-Class
ModularPoleModule_Buzzer_Class = {}

--- FicsIt Indicator Module for FicsIt Modular Indicator Poles provides pioneers with the most fundamental indicator. The new and improved incandecent RGB bulb provides versatility to the industrious. Each modules color and intensity can be set via the network by a computer.
---@class ModularPoleModule_Indicator : FINModularIndicatorPoleModule
ModularPoleModule_Indicator = {}
--- 
---@return Color FLinearColor 
---@type (fun(self:ModularPoleModule_Indicator):(FLinearColor:Color))|ReflectionFunction
function ModularPoleModule_Indicator:getColor() end
--- Sets the color of this module
---@param r number The red part of the color in which the light glows. (0.0 - 1.0)
---@param g number The green part of the color in which the light glows. (0.0 - 1.0)
---@param b number The blue part of the color in which the light glows. (0.0 - 1.0)
---@param e number The light intensity of the pole. (>=0.0)
---@type (fun(self:ModularPoleModule_Indicator,r:number,g:number,b:number,e:number))|ReflectionFunction
function ModularPoleModule_Indicator:setColor(r, g, b, e) end
--- FicsIt Indicator Module for FicsIt Modular Indicator Poles provides pioneers with the most fundamental indicator. The new and improved incandecent RGB bulb provides versatility to the industrious. Each modules color and intensity can be set via the network by a computer.
---@class ModularPoleModule_Indicator-Class : FINModularIndicatorPoleModule-Class
ModularPoleModule_Indicator_Class = {}

--- 
---@class FINModuleBase : Buildable
FINModuleBase = {}
--- 
---@class FINModuleBase-Class : Buildable-Class
FINModuleBase_Class = {}

--- 
---@class FINModuleScreen : FINModuleBase
FINModuleScreen = {}
--- 
---@class FINModuleScreen-Class : FINModuleBase-Class
FINModuleScreen_Class = {}

--- This Screen Module for modular I/O Panels allows you to show graphics a GPU renders and to interact with it.
--- 
--- You can use the instance of the module to bind it to a GPU. The screen will then display the graphics the GPU renders. If you just look at the screen with the crosshair you will trigger the GPUs OnMouseMove events or if you event click with the right of left mouse button while doing so, you can also trigger the MouseDown and MouseUp events.
---@class Build_ModuleScreen_C : FINModuleScreen
Build_ModuleScreen_C = {}
--- This Screen Module for modular I/O Panels allows you to show graphics a GPU renders and to interact with it.
--- 
--- You can use the instance of the module to bind it to a GPU. The screen will then display the graphics the GPU renders. If you just look at the screen with the crosshair you will trigger the GPUs OnMouseMove events or if you event click with the right of left mouse button while doing so, you can also trigger the MouseDown and MouseUp events.
---@class Build_ModuleScreen_C-Class : FINModuleScreen-Class
Build_ModuleScreen_C_Class = {}

--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
--- 
--- Use the Ficsit Label Marker to change the text and foreground color of the button.
---@class PushbuttonModule : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
PushbuttonModule = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:PushbuttonModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function PushbuttonModule:setColor(Red, Green, Blue, Emit) end
--- Triggers a button press by code.
---@type (fun(self:PushbuttonModule))|ReflectionFunction
function PushbuttonModule:Trigger() end
--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
--- 
--- Use the Ficsit Label Marker to change the text and foreground color of the button.
---@class PushbuttonModule-Class : FINModuleBase-Class
PushbuttonModule_Class = {}

--- This Mushroom Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
--- 
--- Use the Ficsit Label Marker to change the text and foreground color of the button.
---@class MushroomPushbuttonModule : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
MushroomPushbuttonModule = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:MushroomPushbuttonModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function MushroomPushbuttonModule:setColor(Red, Green, Blue, Emit) end
--- Triggers a button press by code.
---@type (fun(self:MushroomPushbuttonModule))|ReflectionFunction
function MushroomPushbuttonModule:Trigger() end
--- This Mushroom Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
--- 
--- Use the Ficsit Label Marker to change the text and foreground color of the button.
---@class MushroomPushbuttonModule-Class : FINModuleBase-Class
MushroomPushbuttonModule_Class = {}

--- This Mushroom Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
--- 
--- Use the Ficsit Label Marker to change the text and foreground color of the button.
---@class MushroomPushbuttonModuleBig : MushroomPushbuttonModule
MushroomPushbuttonModuleBig = {}
--- This Mushroom Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
--- 
--- Use the Ficsit Label Marker to change the text and foreground color of the button.
---@class MushroomPushbuttonModuleBig-Class : MushroomPushbuttonModule-Class
MushroomPushbuttonModuleBig_Class = {}

--- This Potentiometer Module allows for input of a fixed value range and fires a signal with the new value each time the internal counter changes. This version has a readout display on it.
---@class PotWDisplayModule : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
---@field public autovalue boolean This sets whether or not to automatically update the display text to the potentiometer value or to use custom text. Default is true. All setText calls will be ignored if true.
---@field public value integer The current value of this potentiometer. Setting this will change the internal value.
---@field public max integer The maximum  value for this potentiometer
---@field public min integer The minimum value for this potentiometer
PotWDisplayModule = {}
--- Sets the text to be displayed on this micro display
---@param text string The new text to display
---@type (fun(self:PotWDisplayModule,text:string))|ReflectionFunction
function PotWDisplayModule:setText(text) end
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:PotWDisplayModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function PotWDisplayModule:setColor(Red, Green, Blue, Emit) end
--- This Potentiometer Module allows for input of a fixed value range and fires a signal with the new value each time the internal counter changes. This version has a readout display on it.
---@class PotWDisplayModule-Class : FINModuleBase-Class
PotWDisplayModule_Class = {}

--- This Switch Module for modular I/O Panels is used to toggle between a true and false value. It has an illuminable spot on the knob and you can use them to trigger specific programmed events.
---@class SwitchModule2Position : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
---@field public state boolean Returns the current state of this switch
SwitchModule2Position = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:SwitchModule2Position,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function SwitchModule2Position:setColor(Red, Green, Blue, Emit) end
--- This Switch Module for modular I/O Panels is used to toggle between a true and false value. It has an illuminable spot on the knob and you can use them to trigger specific programmed events.
---@class SwitchModule2Position-Class : FINModuleBase-Class
SwitchModule2Position_Class = {}

--- This Switch Module for modular I/O Panels is used to toggle between three different settings. It has an illuminable spot on the knob and you can use them to trigger specific programmed events.
---@class SwitchModule3Position : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
---@field public state integer Returns the current state of this switch
SwitchModule3Position = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:SwitchModule3Position,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function SwitchModule3Position:setColor(Red, Green, Blue, Emit) end
--- This Switch Module for modular I/O Panels is used to toggle between three different settings. It has an illuminable spot on the knob and you can use them to trigger specific programmed events.
---@class SwitchModule3Position-Class : FINModuleBase-Class
SwitchModule3Position_Class = {}

--- This Stop Button Module for the modular I/O Panel is used to trigger important programmable events.
---@class ModuleStopButton : FINModuleBase
ModuleStopButton = {}
--- Triggers a button press by code.
---@type (fun(self:ModuleStopButton))|ReflectionFunction
function ModuleStopButton:trigger() end
--- This Stop Button Module for the modular I/O Panel is used to trigger important programmable events.
---@class ModuleStopButton-Class : FINModuleBase-Class
ModuleStopButton_Class = {}

--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class ModuleButton : FINModuleBase
ModuleButton = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:ModuleButton,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function ModuleButton:setColor(Red, Green, Blue, Emit) end
--- Triggers a button press by code.
---@type (fun(self:ModuleButton))|ReflectionFunction
function ModuleButton:trigger() end
--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class ModuleButton-Class : FINModuleBase-Class
ModuleButton_Class = {}

--- This Potentiometer Module allows for input of a value with infinite range, this because it only fires how much the value changed since last, not how much it is at.
---@class EncoderModule : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
EncoderModule = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:EncoderModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function EncoderModule:setColor(Red, Green, Blue, Emit) end
--- This Potentiometer Module allows for input of a value with infinite range, this because it only fires how much the value changed since last, not how much it is at.
---@class EncoderModule-Class : FINModuleBase-Class
EncoderModule_Class = {}

--- The Lever Module for the modular I/O Panel is used to switch a programm state between two different value (on or off).
---@class ModuleSwitch : FINModuleBase
---@field public state boolean The current state in which the switch is in
ModuleSwitch = {}
--- The Lever Module for the modular I/O Panel is used to switch a programm state between two different value (on or off).
---@class ModuleSwitch-Class : FINModuleBase-Class
ModuleSwitch_Class = {}

--- This Potentiometer Module allows for input of a fixed value range and fires a signal with the new value each time the internal counter changes.
---@class PotentiometerModule : FINModuleBase
---@field public enabled boolean Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
---@field public value integer The current value of this potentiometer. Setting this will change the internal value.
---@field public max integer The maximum  value for this potentiometer
---@field public min integer The minimum value for this potentiometer
PotentiometerModule = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:PotentiometerModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function PotentiometerModule:setColor(Red, Green, Blue, Emit) end
--- This Potentiometer Module allows for input of a fixed value range and fires a signal with the new value each time the internal counter changes.
---@class PotentiometerModule-Class : FINModuleBase-Class
PotentiometerModule_Class = {}

--- The Potentiometer Module for the Modular I/O Control Panel allows you to have rotation input value for you programs.
--- 
--- You can rotate it indefinetly into any direction where every rotation triggers a computer network signal.
---@class ModulePotentiometer : FINModuleBase
ModulePotentiometer = {}
--- Rotates the potentiometer into the given direction.
---@param anticlockwise boolean True if the potentiometer should be rotated anticlockwise.
---@type (fun(self:ModulePotentiometer,anticlockwise:boolean))|ReflectionFunction
function ModulePotentiometer:rotate(anticlockwise) end
--- The Potentiometer Module for the Modular I/O Control Panel allows you to have rotation input value for you programs.
--- 
--- You can rotate it indefinetly into any direction where every rotation triggers a computer network signal.
---@class ModulePotentiometer-Class : FINModuleBase-Class
ModulePotentiometer_Class = {}

--- Provides a small text only display for Control Panels. 
--- Can display up to 3 digits, One additional dot may be used.
---@class MicroDisplayModule : FINModuleBase
MicroDisplayModule = {}
--- Sets the text to be displayed on this micro display
---@param text string The new text to display
---@type (fun(self:MicroDisplayModule,text:string))|ReflectionFunction
function MicroDisplayModule:setText(text) end
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:MicroDisplayModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function MicroDisplayModule:setColor(Red, Green, Blue, Emit) end
--- Provides a small text only display for Control Panels. 
--- Can display up to 3 digits, One additional dot may be used.
---@class MicroDisplayModule-Class : FINModuleBase-Class
MicroDisplayModule_Class = {}

--- Provides a relatively small text only display for Control Panels. 
--- Text height is fixed, but text is squeezed to fit horizontally.
---@class LargeMicroDisplayModule : FINModuleBase
LargeMicroDisplayModule = {}
--- Sets the text to be displayed on this micro display
---@param text string The new text to display
---@return Future_LargeMicroDisplayModule_setText
---@type (fun(self:LargeMicroDisplayModule,text:string))|ReflectionFunction
function LargeMicroDisplayModule:setText(text) end
---@class Future_LargeMicroDisplayModule_setText : Future
Future_LargeMicroDisplayModule_setText = {}
---@type fun(self:Future_LargeMicroDisplayModule_setText)
function Future_LargeMicroDisplayModule_setText:await() end
---@type fun(self:Future_LargeMicroDisplayModule_setText)
function Future_LargeMicroDisplayModule_setText:get() end
---@type fun(self:Future_LargeMicroDisplayModule_setText):boolean
function Future_LargeMicroDisplayModule_setText:canGet() end
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:LargeMicroDisplayModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function LargeMicroDisplayModule:setColor(Red, Green, Blue, Emit) end
--- Provides a relatively small text only display for Control Panels. 
--- Text height is fixed, but text is squeezed to fit horizontally.
---@class LargeMicroDisplayModule-Class : FINModuleBase-Class
LargeMicroDisplayModule_Class = {}

--- Label is just a module for placing a label onto the panel
---@class Label1x1Module : FINModuleBase
Label1x1Module = {}
--- Label is just a module for placing a label onto the panel
---@class Label1x1Module-Class : FINModuleBase-Class
Label1x1Module_Class = {}

--- Label is just a module for placing a label onto the panel
---@class Label3x1Module : Label1x1Module
Label3x1Module = {}
--- Label is just a module for placing a label onto the panel
---@class Label3x1Module-Class : Label1x1Module-Class
Label3x1Module_Class = {}

--- Label is just a module for placing a label onto the panel
---@class Label2x1Module : Label1x1Module
Label2x1Module = {}
--- Label is just a module for placing a label onto the panel
---@class Label2x1Module-Class : Label1x1Module-Class
Label2x1Module_Class = {}

--- Label is just a module for placing a label onto the panel
---@class Build_Module_RingedLabel_1x1_C : Label1x1Module
Build_Module_RingedLabel_1x1_C = {}
--- Label is just a module for placing a label onto the panel
---@class Build_Module_RingedLabel_1x1_C-Class : Label1x1Module-Class
Build_Module_RingedLabel_1x1_C_Class = {}

--- The FicsIt-Networks Text-Display Module for the Modular Control Panel is a simple GPU and Screen combined!
--- 
--- It allows you to display any kind of text with differnt font sizes and you can even switch between two fonts!
--- 
--- But you can't interact with it, nor change the background/foreground color as you can do with a GPU.
---@class ModuleTextDisplay : FINModuleBase
---@field public monospace boolean True if the text should be displayed in monospace.
---@field public size integer The size of the text that is displayed.
---@field public text string The text that is displayed on the screen.
ModuleTextDisplay = {}
--- The FicsIt-Networks Text-Display Module for the Modular Control Panel is a simple GPU and Screen combined!
--- 
--- It allows you to display any kind of text with differnt font sizes and you can even switch between two fonts!
--- 
--- But you can't interact with it, nor change the background/foreground color as you can do with a GPU.
---@class ModuleTextDisplay-Class : FINModuleBase-Class
ModuleTextDisplay_Class = {}

--- Provides a relatively small text only display for Control Panels. 
--- Text height is fixed, but text is squeezed to fit horizontally.
---@class SquareMicroDisplayModule : FINModuleBase
SquareMicroDisplayModule = {}
--- Sets the text to be displayed on this micro display
---@param text string The new text to display
---@return Future_SquareMicroDisplayModule_setText
---@type (fun(self:SquareMicroDisplayModule,text:string))|ReflectionFunction
function SquareMicroDisplayModule:setText(text) end
---@class Future_SquareMicroDisplayModule_setText : Future
Future_SquareMicroDisplayModule_setText = {}
---@type fun(self:Future_SquareMicroDisplayModule_setText)
function Future_SquareMicroDisplayModule_setText:await() end
---@type fun(self:Future_SquareMicroDisplayModule_setText)
function Future_SquareMicroDisplayModule_setText:get() end
---@type fun(self:Future_SquareMicroDisplayModule_setText):boolean
function Future_SquareMicroDisplayModule_setText:canGet() end
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:SquareMicroDisplayModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function SquareMicroDisplayModule:setColor(Red, Green, Blue, Emit) end
--- Provides a relatively small text only display for Control Panels. 
--- Text height is fixed, but text is squeezed to fit horizontally.
---@class SquareMicroDisplayModule-Class : FINModuleBase-Class
SquareMicroDisplayModule_Class = {}

--- A medium analogue Gauge for use on Large Panels. The red portion and needle position can be changed through FIN
---@class BigGaugeModule : FINModuleBase
---@field public limit number 
---@field public percent number 
BigGaugeModule = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:BigGaugeModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function BigGaugeModule:setBackgroundColor(Red, Green, Blue, Emit) end
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:BigGaugeModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function BigGaugeModule:setColor(Red, Green, Blue, Emit) end
--- A medium analogue Gauge for use on Large Panels. The red portion and needle position can be changed through FIN
---@class BigGaugeModule-Class : FINModuleBase-Class
BigGaugeModule_Class = {}

--- A small buzzer for panel mounting capable of playing single frequency beeps
---@class BuzzerModule : FINModuleBase
---@field public volume number 
---@field public decayCurve number 
---@field public decayTime number 
---@field public attackCurve number 
---@field public isPlaying boolean 
---@field public attackTime number 
---@field public frequency number Sets the frequency for this buzzer
BuzzerModule = {}
--- 
---@return Future_BuzzerModule_stop
---@type (fun(self:BuzzerModule))|ReflectionFunction
function BuzzerModule:stop() end
---@class Future_BuzzerModule_stop : Future
Future_BuzzerModule_stop = {}
---@type fun(self:Future_BuzzerModule_stop)
function Future_BuzzerModule_stop:await() end
---@type fun(self:Future_BuzzerModule_stop)
function Future_BuzzerModule_stop:get() end
---@type fun(self:Future_BuzzerModule_stop):boolean
function Future_BuzzerModule_stop:canGet() end
--- 
---@return Future_BuzzerModule_beep
---@type (fun(self:BuzzerModule))|ReflectionFunction
function BuzzerModule:beep() end
---@class Future_BuzzerModule_beep : Future
Future_BuzzerModule_beep = {}
---@type fun(self:Future_BuzzerModule_beep)
function Future_BuzzerModule_beep:await() end
---@type fun(self:Future_BuzzerModule_beep)
function Future_BuzzerModule_beep:get() end
---@type fun(self:Future_BuzzerModule_beep):boolean
function Future_BuzzerModule_beep:canGet() end
--- A small buzzer for panel mounting capable of playing single frequency beeps
---@class BuzzerModule-Class : FINModuleBase-Class
BuzzerModule_Class = {}

--- A small analogue Gauge for use on Micro Enclosures. The red portion and needle position can be changed through FIN
---@class GaugeModule : FINModuleBase
---@field public percent number The needle position of this gauge. Value is a float between 0 and 1
---@field public limit number The colored limit region of this gauge. Value is a float, 0 to 1
GaugeModule = {}
--- Sets the color of the limit region of the gauge
---@param r number Red Color Value. Float between 0 and 1
---@param g number Green Color Value. Float between 0 and 1
---@param b number Blue Color Value. Float between 0 and 1
---@type (fun(self:GaugeModule,r:number,g:number,b:number))|ReflectionFunction
function GaugeModule:setBackgroundColor(r, g, b) end
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:GaugeModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function GaugeModule:setColor(Red, Green, Blue, Emit) end
--- A small analogue Gauge for use on Micro Enclosures. The red portion and needle position can be changed through FIN
---@class GaugeModule-Class : FINModuleBase-Class
GaugeModule_Class = {}

--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class Build_ModulePlug_C : FINModuleBase
Build_ModulePlug_C = {}
--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class Build_ModulePlug_C-Class : FINModuleBase-Class
Build_ModulePlug_C_Class = {}

--- This subplate allows one to place a single module in the center of a 2x2 module grid.
--- 
--- 
---@class BasicSubplate_2x2 : FINModuleBase
BasicSubplate_2x2 = {}
--- Returns the module associated with this subplate.
--- This is effectively the same as calling getModule(0,0)
---@return Actor Module 
---@type (fun(self:BasicSubplate_2x2):(Module:Actor))|ReflectionFunction
function BasicSubplate_2x2:getSubModule() end
--- Returns all the modules on this subplate
---@return Object[] modules 
---@type (fun(self:BasicSubplate_2x2):(modules:Object[]))|ReflectionFunction
function BasicSubplate_2x2:getModules() end
--- 
---@param X integer 
---@param Y integer 
---@return Actor Module 
---@type (fun(self:BasicSubplate_2x2,X:integer,Y:integer):(Module:Actor))|ReflectionFunction
function BasicSubplate_2x2:getModule(X, Y) end
--- This subplate allows one to place a single module in the center of a 2x2 module grid.
--- 
--- 
---@class BasicSubplate_2x2-Class : FINModuleBase-Class
BasicSubplate_2x2_Class = {}

--- This subplate allows one to place a single module in the center of a 2x2 module grid.
--- 
--- 
---@class Build_BasicSubplate2x2Labeled_C : BasicSubplate_2x2
Build_BasicSubplate2x2Labeled_C = {}
--- This subplate allows one to place a single module in the center of a 2x2 module grid.
--- 
--- 
---@class Build_BasicSubplate2x2Labeled_C-Class : BasicSubplate_2x2-Class
Build_BasicSubplate2x2Labeled_C_Class = {}

--- Indicator Module for panels
---@class IndicatorModule : FINModuleBase
IndicatorModule = {}
--- 
---@param Red number 
---@param Green number 
---@param Blue number 
---@param Emit number 
---@type (fun(self:IndicatorModule,Red:number,Green:number,Blue:number,Emit:number))|ReflectionFunction
function IndicatorModule:setColor(Red, Green, Blue, Emit) end
--- Indicator Module for panels
---@class IndicatorModule-Class : FINModuleBase-Class
IndicatorModule_Class = {}

--- 
---@class Screen : Buildable
Screen = {}
--- Returns the size of the screen in 'panels'.
---@return integer width The width of the screen.
---@return integer height The height of the screen.
---@type (fun(self:Screen):(width:integer,height:integer))|ReflectionFunction
function Screen:getSize() end
--- 
---@class Screen-Class : Buildable-Class
Screen_Class = {}

--- The FicsIt-Networks large screen allows you to display anything a GPU can render onto a huge plane.
--- 
--- You can also interact with the monitor by locking at it and also by clicking on it.
---@class Build_Screen_C : Screen
Build_Screen_C = {}
--- The FicsIt-Networks large screen allows you to display anything a GPU can render onto a huge plane.
--- 
--- You can also interact with the monitor by locking at it and also by clicking on it.
---@class Build_Screen_C-Class : Screen-Class
Build_Screen_C_Class = {}

--- 
---@class FINSizeablePanel : Buildable
FINSizeablePanel = {}
--- 
---@class FINSizeablePanel-Class : Buildable-Class
FINSizeablePanel_Class = {}

--- This panel allows for dynamic sizeing. For placing on walls.
---@class SizeableModulePanel : FINSizeablePanel
---@field public height integer The Height of this panel in modules
---@field public width integer The Width of this panel in modules
SizeableModulePanel = {}
--- Returns all modules placed on the panel.
---@return Object[] modules All the modules placed on the panel.
---@type (fun(self:SizeableModulePanel):(modules:Object[]))|ReflectionFunction
function SizeableModulePanel:getModules() end
--- Returns the module placed at the given location on the panel.
---@param x integer The x position of the command point, starting from the non-cable end. Indexing starts at 0.
---@param y integer The y position  of the command point, starting from the non-cable end. Indexing starts at 0.
---@return Actor module The module you want to get. Null if no module was placed.
---@type (fun(self:SizeableModulePanel,x:integer,y:integer):(module:Actor))|ReflectionFunction
function SizeableModulePanel:getModule(x, y) end
--- This panel allows for dynamic sizeing. For placing on walls.
---@class SizeableModulePanel-Class : FINSizeablePanel-Class
SizeableModulePanel_Class = {}

--- This speaker pole allows to play custom sound files, In-Game
---@class SpeakerPole : Buildable
SpeakerPole = {}
--- Stops the currently playing sound file.
---@return Future_SpeakerPole_stopSound
---@type (fun(self:SpeakerPole))|ReflectionFunction
function SpeakerPole:stopSound() end
---@class Future_SpeakerPole_stopSound : Future
Future_SpeakerPole_stopSound = {}
---@type fun(self:Future_SpeakerPole_stopSound)
function Future_SpeakerPole_stopSound:await() end
---@type fun(self:Future_SpeakerPole_stopSound)
function Future_SpeakerPole_stopSound:get() end
---@type fun(self:Future_SpeakerPole_stopSound):boolean
function Future_SpeakerPole_stopSound:canGet() end
--- Plays a custom sound file ingame
---@param sound string The sound file (without the file ending) you want to play
---@param startPoint number The start point in seconds at which the system should start playing
---@return Future_SpeakerPole_playSound
---@type (fun(self:SpeakerPole,sound:string,startPoint:number))|ReflectionFunction
function SpeakerPole:playSound(sound, startPoint) end
---@class Future_SpeakerPole_playSound : Future
Future_SpeakerPole_playSound = {}
---@type fun(self:Future_SpeakerPole_playSound)
function Future_SpeakerPole_playSound:await() end
---@type fun(self:Future_SpeakerPole_playSound)
function Future_SpeakerPole_playSound:get() end
---@type fun(self:Future_SpeakerPole_playSound):boolean
function Future_SpeakerPole_playSound:canGet() end
--- This speaker pole allows to play custom sound files, In-Game
---@class SpeakerPole-Class : Buildable-Class
SpeakerPole_Class = {}

--- The FicsIt-Networks speaker pole is a network component which allows you to use one more sense of the pioneers to give commands to them or to just make ambient better.
--- 
--- The speaker pole can play sound files located in the Computer Folder "/Sounds" in your Satisfactory Save-Games-Folder. The FicsIt-Networks speaker pole is only able to play .ogg files cause FicsIt Inc. has the opinion other file formates are useless.
---@class Build_Speakers_C : SpeakerPole
Build_Speakers_C = {}
--- 
---@param Volume number 
---@type (fun(self:Build_Speakers_C,Volume:number))|ReflectionFunction
function Build_Speakers_C:setVolume(Volume) end
--- 
---@param Range number 
---@type (fun(self:Build_Speakers_C,Range:number))|ReflectionFunction
function Build_Speakers_C:setRange(Range) end
--- 
---@return number Volume 
---@type (fun(self:Build_Speakers_C):(Volume:number))|ReflectionFunction
function Build_Speakers_C:getVolume() end
--- 
---@return number Range 
---@type (fun(self:Build_Speakers_C):(Range:number))|ReflectionFunction
function Build_Speakers_C:getRange() end
--- The FicsIt-Networks speaker pole is a network component which allows you to use one more sense of the pioneers to give commands to them or to just make ambient better.
--- 
--- The speaker pole can play sound files located in the Computer Folder "/Sounds" in your Satisfactory Save-Games-Folder. The FicsIt-Networks speaker pole is only able to play .ogg files cause FicsIt Inc. has the opinion other file formates are useless.
---@class Build_Speakers_C-Class : SpeakerPole-Class
Build_Speakers_C_Class = {}

--- 
---@class VehicleScanner : Buildable
VehicleScanner = {}
--- Allows to change the color and light intensity of the scanner.
---@param r number The red part of the color in which the scanner glows. (0.0 - 1.0)
---@param g number The green part of the color in which the scanner glows. (0.0 - 1.0)
---@param b number The blue part of the color in which the scanner glows. (0.0 - 1.0)
---@param e number The light intensity of the scanner. (0.0 - 5.0)
---@type (fun(self:VehicleScanner,r:number,g:number,b:number,e:number))|ReflectionFunction
function VehicleScanner:setColor(r, g, b, e) end
--- Returns the last vehicle that entered the scanner.
---@return Vehicle vehicle The vehicle that entered the scanner. null if it has already left the scanner.
---@type (fun(self:VehicleScanner):(vehicle:Vehicle))|ReflectionFunction
function VehicleScanner:getLastVehicle() end
--- Allows to get the color and light intensity of the scanner.
---@return number r The red part of the color in which the scanner glows. (0.0 - 1.0)
---@return number g The green part of the color in which the scanner glows. (0.0 - 1.0)
---@return number b The blue part of the color in which the scanner glows. (0.0 - 1.0)
---@return number e The light intensity of the scanner. (0.0 - 5.0)
---@type (fun(self:VehicleScanner):(r:number,g:number,b:number,e:number))|ReflectionFunction
function VehicleScanner:getColor() end
--- 
---@class VehicleScanner-Class : Buildable-Class
VehicleScanner_Class = {}

--- The FicsIt-Networks Vehicle Scanner allows you to communicate with vehicles driving over the scanner.
--- 
--- You can also get notified when a vehicle enters or leaves the scanner.
---@class Build_VehicleScanner_C : VehicleScanner
Build_VehicleScanner_C = {}
--- The FicsIt-Networks Vehicle Scanner allows you to communicate with vehicles driving over the scanner.
--- 
--- You can also get notified when a vehicle enters or leaves the scanner.
---@class Build_VehicleScanner_C-Class : VehicleScanner-Class
Build_VehicleScanner_C_Class = {}

--- 
---@class AbsoluteNumber : FGWiremodBuildable
AbsoluteNumber = {}
--- 
---@class AbsoluteNumber-Class : FGWiremodBuildable-Class
AbsoluteNumber_Class = {}

--- 
---@class FGWiremodBuildable : Buildable
FGWiremodBuildable = {}
--- 
---@param InputIndex integer 
---@param Value Vector[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Vector[]))|ReflectionFunction
function FGWiremodBuildable:setVectorArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Vector 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Vector))|ReflectionFunction
function FGWiremodBuildable:setVector(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value string[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:string[]))|ReflectionFunction
function FGWiremodBuildable:setStringArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value string 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:string))|ReflectionFunction
function FGWiremodBuildable:setString(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value ItemStack[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:ItemStack[]))|ReflectionFunction
function FGWiremodBuildable:setStackArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value ItemStack 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:ItemStack))|ReflectionFunction
function FGWiremodBuildable:setStack(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Object-Class[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Object-Class[]))|ReflectionFunction
function FGWiremodBuildable:setRecipeArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Object-Class 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Object-Class))|ReflectionFunction
function FGWiremodBuildable:setRecipe(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value PowerCircuit[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:PowerCircuit[]))|ReflectionFunction
function FGWiremodBuildable:setPowerGridArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value PowerCircuit 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:PowerCircuit))|ReflectionFunction
function FGWiremodBuildable:setPowerGrid(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value number[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:number[]))|ReflectionFunction
function FGWiremodBuildable:setNumberArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value number 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:number))|ReflectionFunction
function FGWiremodBuildable:setNumber(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value ItemAmount[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:ItemAmount[]))|ReflectionFunction
function FGWiremodBuildable:setItemAmountArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value ItemAmount 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:ItemAmount))|ReflectionFunction
function FGWiremodBuildable:setItemAmount(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Inventory[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Inventory[]))|ReflectionFunction
function FGWiremodBuildable:setInventoryArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Inventory 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Inventory))|ReflectionFunction
function FGWiremodBuildable:setInventory(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Actor[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Actor[]))|ReflectionFunction
function FGWiremodBuildable:setEntityArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Actor 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Actor))|ReflectionFunction
function FGWiremodBuildable:setEntity(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Color[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Color[]))|ReflectionFunction
function FGWiremodBuildable:setColorArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value Color 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:Color))|ReflectionFunction
function FGWiremodBuildable:setColor(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value boolean[] 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:boolean[]))|ReflectionFunction
function FGWiremodBuildable:setBoolArray(InputIndex, Value) end
--- 
---@param InputIndex integer 
---@param Value boolean 
---@type (fun(self:FGWiremodBuildable,InputIndex:integer,Value:boolean))|ReflectionFunction
function FGWiremodBuildable:setBool(InputIndex, Value) end
--- 
---@return boolean ReturnValue 
---@type (fun(self:FGWiremodBuildable):(ReturnValue:boolean))|ReflectionFunction
function FGWiremodBuildable:isBlueprinted() end
--- 
---@param FunctionName string 
---@param DefaultValue Vector 
---@return Vector ReturnValue 
---@type (fun(self:FGWiremodBuildable,FunctionName:string,DefaultValue:Vector):(ReturnValue:Vector))|ReflectionFunction
function FGWiremodBuildable:getVector(FunctionName, DefaultValue) end
--- 
---@param FunctionName string 
---@param DefaultValue string 
---@return string ReturnValue 
---@type (fun(self:FGWiremodBuildable,FunctionName:string,DefaultValue:string):(ReturnValue:string))|ReflectionFunction
function FGWiremodBuildable:getString(FunctionName, DefaultValue) end
--- 
---@param FunctionName string 
---@return Future_FGWiremodBuildable_getOutputString
---@type (fun(self:FGWiremodBuildable,FunctionName:string):(Future_FGWiremodBuildable_getOutputString))|ReflectionFunction
function FGWiremodBuildable:getOutputString(FunctionName) end
---@class Future_FGWiremodBuildable_getOutputString : Future
Future_FGWiremodBuildable_getOutputString = {}
---@type fun(self:Future_FGWiremodBuildable_getOutputString):(ReturnValue:string)
function Future_FGWiremodBuildable_getOutputString:await() end
---@type fun(self:Future_FGWiremodBuildable_getOutputString):(ReturnValue:string)
function Future_FGWiremodBuildable_getOutputString:get() end
---@type fun(self:Future_FGWiremodBuildable_getOutputString):boolean
function Future_FGWiremodBuildable_getOutputString:canGet() end
--- 
---@param FunctionName string 
---@param DefaultValue number 
---@return number ReturnValue 
---@type (fun(self:FGWiremodBuildable,FunctionName:string,DefaultValue:number):(ReturnValue:number))|ReflectionFunction
function FGWiremodBuildable:getNumber(FunctionName, DefaultValue) end
--- 
---@param InputIndex integer 
---@return Future_FGWiremodBuildable_getInputValueString
---@type (fun(self:FGWiremodBuildable,InputIndex:integer):(Future_FGWiremodBuildable_getInputValueString))|ReflectionFunction
function FGWiremodBuildable:getInputValueString(InputIndex) end
---@class Future_FGWiremodBuildable_getInputValueString : Future
Future_FGWiremodBuildable_getInputValueString = {}
---@type fun(self:Future_FGWiremodBuildable_getInputValueString):(ReturnValue:string)
function Future_FGWiremodBuildable_getInputValueString:await() end
---@type fun(self:Future_FGWiremodBuildable_getInputValueString):(ReturnValue:string)
function Future_FGWiremodBuildable_getInputValueString:get() end
---@type fun(self:Future_FGWiremodBuildable_getInputValueString):boolean
function Future_FGWiremodBuildable_getInputValueString:canGet() end
--- 
---@param FunctionName string 
---@return integer ReturnValue 
---@type (fun(self:FGWiremodBuildable,FunctionName:string):(ReturnValue:integer))|ReflectionFunction
function FGWiremodBuildable:getFunctionReturnType(FunctionName) end
--- 
---@param FunctionName string 
---@param DefaultValue Color 
---@return Color ReturnValue 
---@type (fun(self:FGWiremodBuildable,FunctionName:string,DefaultValue:Color):(ReturnValue:Color))|ReflectionFunction
function FGWiremodBuildable:getColor(FunctionName, DefaultValue) end
--- 
---@param FunctionName string 
---@param DefaultValue boolean 
---@return boolean ReturnValue 
---@type (fun(self:FGWiremodBuildable,FunctionName:string,DefaultValue:boolean):(ReturnValue:boolean))|ReflectionFunction
function FGWiremodBuildable:getBool(FunctionName, DefaultValue) end
--- 
---@return string[] Out 
---@type (fun(self:FGWiremodBuildable):(Out:string[]))|ReflectionFunction
function FGWiremodBuildable:getAllCircuitryFuncs() end
--- 
---@class FGWiremodBuildable-Class : Buildable-Class
FGWiremodBuildable_Class = {}

--- Returns absolute of input
---@class Build_AbsoluteNumber_C : AbsoluteNumber
Build_AbsoluteNumber_C = {}
--- Returns absolute of input
---@class Build_AbsoluteNumber_C-Class : AbsoluteNumber-Class
Build_AbsoluteNumber_C_Class = {}

--- 
---@class MultistateWiremodBuildable : FGWiremodBuildable
MultistateWiremodBuildable = {}
--- 
---@class MultistateWiremodBuildable-Class : FGWiremodBuildable-Class
MultistateWiremodBuildable_Class = {}

--- 
---@class Acos : MultistateWiremodBuildable
Acos = {}
--- 
---@class Acos-Class : MultistateWiremodBuildable-Class
Acos_Class = {}

--- Returns arccosine of the input.
---@class Build_ACos_C : Acos
Build_ACos_C = {}
--- Returns arccosine of the input.
---@class Build_ACos_C-Class : Acos-Class
Build_ACos_C_Class = {}

--- 
---@class AddNumbers : MultistateWiremodBuildable
AddNumbers = {}
--- 
---@class AddNumbers-Class : MultistateWiremodBuildable-Class
AddNumbers_Class = {}

--- Adds all inputs together
---@class Build_AddNumbers_C : AddNumbers
Build_AddNumbers_C = {}
--- Adds all inputs together
---@class Build_AddNumbers_C-Class : AddNumbers-Class
Build_AddNumbers_C_Class = {}

--- 
---@class AND : MultistateWiremodBuildable
AND = {}
--- 
---@class AND-Class : MultistateWiremodBuildable-Class
AND_Class = {}

--- Returns true if all connected inputs are true
---@class Build_AND_Gate_C : AND
Build_AND_Gate_C = {}
--- Returns true if all connected inputs are true
---@class Build_AND_Gate_C-Class : AND-Class
Build_AND_Gate_C_Class = {}

--- 
---@class AppendString : MultistateWiremodBuildable
AppendString = {}
--- 
---@class AppendString-Class : MultistateWiremodBuildable-Class
AppendString_Class = {}

--- Adds all input strings into one.
---@class Build_AppendString_C : AppendString
Build_AppendString_C = {}
--- Adds all input strings into one.
---@class Build_AppendString_C-Class : AppendString-Class
Build_AppendString_C_Class = {}

--- 
---@class ArrayFind : MultistateWiremodBuildable
ArrayFind = {}
--- 
---@class ArrayFind-Class : MultistateWiremodBuildable-Class
ArrayFind_Class = {}

--- Accepts any array and an object.
--- Returns first index in the array that equals to that object.
---@class Build_ArrayFind_C : ArrayFind
Build_ArrayFind_C = {}
--- Accepts any array and an object.
--- Returns first index in the array that equals to that object.
---@class Build_ArrayFind_C-Class : ArrayFind-Class
Build_ArrayFind_C_Class = {}

--- 
---@class Asin : MultistateWiremodBuildable
Asin = {}
--- 
---@class Asin-Class : MultistateWiremodBuildable-Class
Asin_Class = {}

--- Returns arcsine of the input.
---@class Build_ASin_C : Asin
Build_ASin_C = {}
--- Returns arcsine of the input.
---@class Build_ASin_C-Class : Asin-Class
Build_ASin_C_Class = {}

--- 
---@class Atan : MultistateWiremodBuildable
Atan = {}
--- 
---@class Atan-Class : MultistateWiremodBuildable-Class
Atan_Class = {}

--- Returns arctan of the input.
---@class Build_ATan_C : Atan
Build_ATan_C = {}
--- Returns arctan of the input.
---@class Build_ATan_C-Class : Atan-Class
Build_ATan_C_Class = {}

--- 
---@class Atan2 : MultistateWiremodBuildable
Atan2 = {}
--- 
---@class Atan2-Class : MultistateWiremodBuildable-Class
Atan2_Class = {}

--- Returns arctan2 of the input.
---@class Build_ATan2_C : Atan2
Build_ATan2_C = {}
--- Returns arctan2 of the input.
---@class Build_ATan2_C-Class : Atan2-Class
Build_ATan2_C_Class = {}

--- 
---@class BounceInterpolation : MultistateWiremodBuildable
BounceInterpolation = {}
--- 
---@class BounceInterpolation-Class : MultistateWiremodBuildable-Class
BounceInterpolation_Class = {}

--- Bounce Interpolation.
---@class Build_BounceInterp_C : BounceInterpolation
Build_BounceInterp_C = {}
--- Bounce Interpolation.
---@class Build_BounceInterp_C-Class : BounceInterpolation-Class
Build_BounceInterp_C_Class = {}

--- 
---@class CircularIntepolation : MultistateWiremodBuildable
CircularIntepolation = {}
--- 
---@class CircularIntepolation-Class : MultistateWiremodBuildable-Class
CircularIntepolation_Class = {}

--- Circular interpolation.
---@class Build_CircularInterp_C : CircularIntepolation
Build_CircularInterp_C = {}
--- Circular interpolation.
---@class Build_CircularInterp_C-Class : CircularIntepolation-Class
Build_CircularInterp_C_Class = {}

--- 
---@class Cos : MultistateWiremodBuildable
Cos = {}
--- 
---@class Cos-Class : MultistateWiremodBuildable-Class
Cos_Class = {}

--- Returns cosine of the input.
---@class Build_Cos_C : Cos
Build_Cos_C = {}
--- Returns cosine of the input.
---@class Build_Cos_C-Class : Cos-Class
Build_Cos_C_Class = {}

--- 
---@class DivideNumbers : MultistateWiremodBuildable
DivideNumbers = {}
--- 
---@class DivideNumbers-Class : MultistateWiremodBuildable-Class
DivideNumbers_Class = {}

--- Divides all connected inputs in ascending order
---@class Build_DivideNumbers_C : DivideNumbers
Build_DivideNumbers_C = {}
--- Divides all connected inputs in ascending order
---@class Build_DivideNumbers_C-Class : DivideNumbers-Class
Build_DivideNumbers_C_Class = {}

--- 
---@class EaseInterpolation : MultistateWiremodBuildable
EaseInterpolation = {}
--- 
---@class EaseInterpolation-Class : MultistateWiremodBuildable-Class
EaseInterpolation_Class = {}

--- Ease interpolation.
---@class Build_EaseInterp_C : EaseInterpolation
Build_EaseInterp_C = {}
--- Ease interpolation.
---@class Build_EaseInterp_C-Class : EaseInterpolation-Class
Build_EaseInterp_C_Class = {}

--- 
---@class ExpoInterpolation : MultistateWiremodBuildable
ExpoInterpolation = {}
--- 
---@class ExpoInterpolation-Class : MultistateWiremodBuildable-Class
ExpoInterpolation_Class = {}

--- Exponential interpolation.
---@class Build_ExpoInterp_C : ExpoInterpolation
Build_ExpoInterp_C = {}
--- Exponential interpolation.
---@class Build_ExpoInterp_C-Class : ExpoInterpolation-Class
Build_ExpoInterp_C_Class = {}

--- 
---@class ItemAmountToStack : MultistateWiremodBuildable
ItemAmountToStack = {}
--- 
---@class ItemAmountToStack-Class : MultistateWiremodBuildable-Class
ItemAmountToStack_Class = {}

--- Accepts item amount and outputs an identical item stack.
---@class Build_ItemAmountToStack_C : ItemAmountToStack
Build_ItemAmountToStack_C = {}
--- Accepts item amount and outputs an identical item stack.
---@class Build_ItemAmountToStack_C-Class : ItemAmountToStack-Class
Build_ItemAmountToStack_C_Class = {}

--- 
---@class ItemStackToAmount : MultistateWiremodBuildable
ItemStackToAmount = {}
--- 
---@class ItemStackToAmount-Class : MultistateWiremodBuildable-Class
ItemStackToAmount_Class = {}

--- Accepts item stack and outputs an identical item amount.
---@class Build_ItemStackToAmount_C : ItemStackToAmount
Build_ItemStackToAmount_C = {}
--- Accepts item stack and outputs an identical item amount.
---@class Build_ItemStackToAmount_C-Class : ItemStackToAmount-Class
Build_ItemStackToAmount_C_Class = {}

--- 
---@class LerpColor : MultistateWiremodBuildable
LerpColor = {}
--- 
---@class LerpColor-Class : MultistateWiremodBuildable-Class
LerpColor_Class = {}

--- Linearly interpolates the color from color A to color B based on Alpha.
---@class Build_LerpColor_C : LerpColor
Build_LerpColor_C = {}
--- Linearly interpolates the color from color A to color B based on Alpha.
---@class Build_LerpColor_C-Class : LerpColor-Class
Build_LerpColor_C_Class = {}

--- 
---@class MultiplyNumbers : MultistateWiremodBuildable
MultiplyNumbers = {}
--- 
---@class MultiplyNumbers-Class : MultistateWiremodBuildable-Class
MultiplyNumbers_Class = {}

--- Multiplies all connected inputs together
---@class Build_MultiplyNumbers_C : MultiplyNumbers
Build_MultiplyNumbers_C = {}
--- Multiplies all connected inputs together
---@class Build_MultiplyNumbers_C-Class : MultiplyNumbers-Class
Build_MultiplyNumbers_C_Class = {}

--- 
---@class NAND : MultistateWiremodBuildable
NAND = {}
--- 
---@class NAND-Class : MultistateWiremodBuildable-Class
NAND_Class = {}

--- Returns true if not all inputs are true
---@class Build_NAND_Gate_C : NAND
Build_NAND_Gate_C = {}
--- Returns true if not all inputs are true
---@class Build_NAND_Gate_C-Class : NAND-Class
Build_NAND_Gate_C_Class = {}

--- 
---@class NOR : MultistateWiremodBuildable
NOR = {}
--- 
---@class NOR-Class : MultistateWiremodBuildable-Class
NOR_Class = {}

--- Returns true if none of the inputs are true
---@class Build_NOR_Gate_C : NOR
Build_NOR_Gate_C = {}
--- Returns true if none of the inputs are true
---@class Build_NOR_Gate_C-Class : NOR-Class
Build_NOR_Gate_C_Class = {}

--- 
---@class NumberAverage : MultistateWiremodBuildable
NumberAverage = {}
--- 
---@class NumberAverage-Class : MultistateWiremodBuildable-Class
NumberAverage_Class = {}

--- Returns the average of all connected inputs
---@class Build_NumberAverage_C : NumberAverage
Build_NumberAverage_C = {}
--- Returns the average of all connected inputs
---@class Build_NumberAverage_C-Class : NumberAverage-Class
Build_NumberAverage_C_Class = {}

--- 
---@class NumberMax : MultistateWiremodBuildable
NumberMax = {}
--- 
---@class NumberMax-Class : MultistateWiremodBuildable-Class
NumberMax_Class = {}

--- Out of two numbers, outputs the greater one.
---@class Build_NumberMax_C : NumberMax
Build_NumberMax_C = {}
--- Out of two numbers, outputs the greater one.
---@class Build_NumberMax_C-Class : NumberMax-Class
Build_NumberMax_C_Class = {}

--- 
---@class NumberMin : MultistateWiremodBuildable
NumberMin = {}
--- 
---@class NumberMin-Class : MultistateWiremodBuildable-Class
NumberMin_Class = {}

--- Out of two numbers, outputs the lesser one.
---@class Build_NumberMin_C : NumberMin
Build_NumberMin_C = {}
--- Out of two numbers, outputs the lesser one.
---@class Build_NumberMin_C-Class : NumberMin-Class
Build_NumberMin_C_Class = {}

--- 
---@class NumberSubtract : MultistateWiremodBuildable
NumberSubtract = {}
--- 
---@class NumberSubtract-Class : MultistateWiremodBuildable-Class
NumberSubtract_Class = {}

--- Subtracts B from A
---@class Build_Subtract_C : NumberSubtract
Build_Subtract_C = {}
--- Subtracts B from A
---@class Build_Subtract_C-Class : NumberSubtract-Class
Build_Subtract_C_Class = {}

--- 
---@class OR : MultistateWiremodBuildable
OR = {}
--- 
---@class OR-Class : MultistateWiremodBuildable-Class
OR_Class = {}

--- Returns true if any input is true
---@class Build_OR_Gate_C : OR
Build_OR_Gate_C = {}
--- Returns true if any input is true
---@class Build_OR_Gate_C-Class : OR-Class
Build_OR_Gate_C_Class = {}

--- 
---@class SelectValue : MultistateWiremodBuildable
SelectValue = {}
--- 
---@class SelectValue-Class : MultistateWiremodBuildable-Class
SelectValue_Class = {}

--- Allows to select from two or more values based on a value.
--- I.e. if value is true then output one value, else output a different one.
---@class Build_BooleanSelect_C : SelectValue
Build_BooleanSelect_C = {}
--- Allows to select from two or more values based on a value.
--- I.e. if value is true then output one value, else output a different one.
---@class Build_BooleanSelect_C-Class : SelectValue-Class
Build_BooleanSelect_C_Class = {}

--- 
---@class Sin : MultistateWiremodBuildable
Sin = {}
--- 
---@class Sin-Class : MultistateWiremodBuildable-Class
Sin_Class = {}

--- Returns sine of the input.
---@class Build_Sin_C : Sin
Build_Sin_C = {}
--- Returns sine of the input.
---@class Build_Sin_C-Class : Sin-Class
Build_Sin_C_Class = {}

--- 
---@class SinusoidalInterpolation : MultistateWiremodBuildable
SinusoidalInterpolation = {}
--- 
---@class SinusoidalInterpolation-Class : MultistateWiremodBuildable-Class
SinusoidalInterpolation_Class = {}

--- Sinusoidal Interpolation.
---@class Build_SinInterp_C : SinusoidalInterpolation
Build_SinInterp_C = {}
--- Sinusoidal Interpolation.
---@class Build_SinInterp_C-Class : SinusoidalInterpolation-Class
Build_SinInterp_C_Class = {}

--- 
---@class Siren : MultistateWiremodBuildable
Siren = {}
--- 
---@class Siren-Class : MultistateWiremodBuildable-Class
Siren_Class = {}

--- Plays an alarm sound with configurable range, volume, and pitch.
--- 
--- WORK IN PROGRESS. THIS WILL WORK AND LOOK BETTER LATER.
---@class Build_Siren_C : Siren
Build_Siren_C = {}
--- Plays an alarm sound with configurable range, volume, and pitch.
--- 
--- WORK IN PROGRESS. THIS WILL WORK AND LOOK BETTER LATER.
---@class Build_Siren_C-Class : Siren-Class
Build_Siren_C_Class = {}

--- 
---@class StringCase : MultistateWiremodBuildable
StringCase = {}
--- 
---@class StringCase-Class : MultistateWiremodBuildable-Class
StringCase_Class = {}

--- Modifies string to be lowercase or UPPERCASE.
---@class Build_StringCase_C : StringCase
Build_StringCase_C = {}
--- Modifies string to be lowercase or UPPERCASE.
---@class Build_StringCase_C-Class : StringCase-Class
Build_StringCase_C_Class = {}

--- 
---@class Tan : MultistateWiremodBuildable
Tan = {}
--- 
---@class Tan-Class : MultistateWiremodBuildable-Class
Tan_Class = {}

--- Returns tangent of the input.
---@class Build_Tan_C : Tan
Build_Tan_C = {}
--- Returns tangent of the input.
---@class Build_Tan_C-Class : Tan-Class
Build_Tan_C_Class = {}

--- 
---@class ToString : MultistateWiremodBuildable
ToString = {}
--- 
---@class ToString-Class : MultistateWiremodBuildable-Class
ToString_Class = {}

--- Converts input value to a string
--- 
--- SPECIAL MODE: When input value is of type "Number", gains additional inputs for formatting (i.e. removing fractional part, or limiting its length to a specific value)
---@class Build_ToString_C : ToString
Build_ToString_C = {}
--- Converts input value to a string
--- 
--- SPECIAL MODE: When input value is of type "Number", gains additional inputs for formatting (i.e. removing fractional part, or limiting its length to a specific value)
---@class Build_ToString_C-Class : ToString-Class
Build_ToString_C_Class = {}

--- 
---@class ToStringArray : MultistateWiremodBuildable
ToStringArray = {}
--- 
---@class ToStringArray-Class : MultistateWiremodBuildable-Class
ToStringArray_Class = {}

--- Converts input array to array of strings
--- 
--- SPECIAL MODE: When input array is of type "Number Array", gains additional inputs for formatting (i.e. removing fractional part, or limiting its length to a specific value)
---@class Build_ToStringArray_C : ToStringArray
Build_ToStringArray_C = {}
--- Converts input array to array of strings
--- 
--- SPECIAL MODE: When input array is of type "Number Array", gains additional inputs for formatting (i.e. removing fractional part, or limiting its length to a specific value)
---@class Build_ToStringArray_C-Class : ToStringArray-Class
Build_ToStringArray_C_Class = {}

--- 
---@class XNOR : MultistateWiremodBuildable
XNOR = {}
--- 
---@class XNOR-Class : MultistateWiremodBuildable-Class
XNOR_Class = {}

--- Returns true if an even number of inputs returned true
---@class Build_XNOR_Gate_C : XNOR
Build_XNOR_Gate_C = {}
--- Returns true if an even number of inputs returned true
---@class Build_XNOR_Gate_C-Class : XNOR-Class
Build_XNOR_Gate_C_Class = {}

--- 
---@class XOR : MultistateWiremodBuildable
XOR = {}
--- 
---@class XOR-Class : MultistateWiremodBuildable-Class
XOR_Class = {}

--- Returns true if an odd number of inputs returned true
---@class Build_XOR_Gate_C : XOR
Build_XOR_Gate_C = {}
--- Returns true if an odd number of inputs returned true
---@class Build_XOR_Gate_C-Class : XOR-Class
Build_XOR_Gate_C_Class = {}

--- BBBB
---@class Build_TestBuilding_C : MultistateWiremodBuildable
Build_TestBuilding_C = {}
--- BBBB
---@class Build_TestBuilding_C-Class : MultistateWiremodBuildable-Class
Build_TestBuilding_C_Class = {}

--- 
---@class ArrayAdd : FGWiremodBuildable
ArrayAdd = {}
--- 
---@class ArrayAdd-Class : FGWiremodBuildable-Class
ArrayAdd_Class = {}

--- Adds a new element to the end of the array.
---@class Build_ArrayAdd_C : ArrayAdd
Build_ArrayAdd_C = {}
--- Adds a new element to the end of the array.
---@class Build_ArrayAdd_C-Class : ArrayAdd-Class
Build_ArrayAdd_C_Class = {}

--- 
---@class ArrayAppend : FGWiremodBuildable
ArrayAppend = {}
--- 
---@class ArrayAppend-Class : FGWiremodBuildable-Class
ArrayAppend_Class = {}

--- Combines two arrays of any type into one array.
--- If array types don't match, returns the first connected array.
--- <Orange>Not for use with inventories, use a more optimized "Combine Inventories" gate instead.</>
--- 
--- <Orange>VERY EXPENSIVE! DO NOT ABUSE THIS GATE - YOU ARE RISKING FREQUENT CRASHES IF YOU"RE TOO CARELESS.
--- THERE ARE PROBABLY OTHER WAYS TO DO WHAT YOU WANT - CONSULT ON DISCORD SERVER.</>
---@class Build_ArrayAppend_C : ArrayAppend
Build_ArrayAppend_C = {}
--- Combines two arrays of any type into one array.
--- If array types don't match, returns the first connected array.
--- <Orange>Not for use with inventories, use a more optimized "Combine Inventories" gate instead.</>
--- 
--- <Orange>VERY EXPENSIVE! DO NOT ABUSE THIS GATE - YOU ARE RISKING FREQUENT CRASHES IF YOU"RE TOO CARELESS.
--- THERE ARE PROBABLY OTHER WAYS TO DO WHAT YOU WANT - CONSULT ON DISCORD SERVER.</>
---@class Build_ArrayAppend_C-Class : ArrayAppend-Class
Build_ArrayAppend_C_Class = {}

--- 
---@class ArrayBreak : FGWiremodBuildable
ArrayBreak = {}
--- 
---@class ArrayBreak-Class : FGWiremodBuildable-Class
ArrayBreak_Class = {}

--- Splits array into multiple outputs. Each element in the array is an output.
---@class Build_BreakArray_C : ArrayBreak
Build_BreakArray_C = {}
--- Splits array into multiple outputs. Each element in the array is an output.
---@class Build_BreakArray_C-Class : ArrayBreak-Class
Build_BreakArray_C_Class = {}

--- 
---@class ArrayClear : FGWiremodBuildable
ArrayClear = {}
--- 
---@class ArrayClear-Class : FGWiremodBuildable-Class
ArrayClear_Class = {}

--- Returns an empty array of the same type.
---@class Build_ClearArray_C : ArrayClear
Build_ClearArray_C = {}
--- Returns an empty array of the same type.
---@class Build_ClearArray_C-Class : ArrayClear-Class
Build_ClearArray_C_Class = {}

--- 
---@class ArrayContains : FGWiremodBuildable
ArrayContains = {}
--- 
---@class ArrayContains-Class : FGWiremodBuildable-Class
ArrayContains_Class = {}

--- Checks if array contains a specific element.
---@class Build_ArrayContains_C : ArrayContains
Build_ArrayContains_C = {}
--- Checks if array contains a specific element.
---@class Build_ArrayContains_C-Class : ArrayContains-Class
Build_ArrayContains_C_Class = {}

--- 
---@class ArrayFilter : FGWiremodBuildable
ArrayFilter = {}
--- 
---@class ArrayFilter-Class : FGWiremodBuildable-Class
ArrayFilter_Class = {}

--- Accepts array and allows filtering it by user set parameters (i.e. only getting numbers that are higher than X in number array, or only item stacks that have specific items in item arrays)
---@class Build_ArrayFilter_C : ArrayFilter
Build_ArrayFilter_C = {}
--- Accepts array and allows filtering it by user set parameters (i.e. only getting numbers that are higher than X in number array, or only item stacks that have specific items in item arrays)
---@class Build_ArrayFilter_C-Class : ArrayFilter-Class
Build_ArrayFilter_C_Class = {}

--- 
---@class ArrayGet : FGWiremodBuildable
ArrayGet = {}
--- 
---@class ArrayGet-Class : FGWiremodBuildable-Class
ArrayGet_Class = {}

--- Accepts any array, outputs the element at specified index.
---@class Build_ArrayGet_C : ArrayGet
Build_ArrayGet_C = {}
--- Accepts any array, outputs the element at specified index.
---@class Build_ArrayGet_C-Class : ArrayGet-Class
Build_ArrayGet_C_Class = {}

--- 
---@class ArrayHistory : FGWiremodBuildable
ArrayHistory = {}
--- 
---@class ArrayHistory-Class : FGWiremodBuildable-Class
ArrayHistory_Class = {}

--- Accepts any non array value and records it to an array of a set size.
--- 
--- This gate can be used to keep track of certain values (i.e. productivity of machines) to later be displayed or processed in some way.
--- Tip: if you want to record the value whenever it changes without an interaction, connect the "Record" input through a change detector.
---@class Build_ArrayHistory_C : ArrayHistory
Build_ArrayHistory_C = {}
--- Accepts any non array value and records it to an array of a set size.
--- 
--- This gate can be used to keep track of certain values (i.e. productivity of machines) to later be displayed or processed in some way.
--- Tip: if you want to record the value whenever it changes without an interaction, connect the "Record" input through a change detector.
---@class Build_ArrayHistory_C-Class : ArrayHistory-Class
Build_ArrayHistory_C_Class = {}

--- 
---@class ArrayInsert : FGWiremodBuildable
ArrayInsert = {}
--- 
---@class ArrayInsert-Class : FGWiremodBuildable-Class
ArrayInsert_Class = {}

--- Inserts element in the array at specified index.
--- Index must be valid for the gate to work.
---@class Build_ArrayInsert_C : ArrayInsert
Build_ArrayInsert_C = {}
--- Inserts element in the array at specified index.
--- Index must be valid for the gate to work.
---@class Build_ArrayInsert_C-Class : ArrayInsert-Class
Build_ArrayInsert_C_Class = {}

--- 
---@class ArrayIterator : FGWiremodBuildable
ArrayIterator = {}
--- 
---@class ArrayIterator-Class : FGWiremodBuildable-Class
ArrayIterator_Class = {}

--- Equivalent of 'for' loop.
--- Accepts any array and allows to move between elements with "Increment Index" and "Decrement Index".
---@class Build_ArrayIterator_C : ArrayIterator
Build_ArrayIterator_C = {}
--- Equivalent of 'for' loop.
--- Accepts any array and allows to move between elements with "Increment Index" and "Decrement Index".
---@class Build_ArrayIterator_C-Class : ArrayIterator-Class
Build_ArrayIterator_C_Class = {}

--- 
---@class ArrayLength : FGWiremodBuildable
ArrayLength = {}
--- 
---@class ArrayLength-Class : FGWiremodBuildable-Class
ArrayLength_Class = {}

--- Returns length of an array.
---@class Build_ArrayLength_C : ArrayLength
Build_ArrayLength_C = {}
--- Returns length of an array.
---@class Build_ArrayLength_C-Class : ArrayLength-Class
Build_ArrayLength_C_Class = {}

--- 
---@class ArrayMake : FGWiremodBuildable
ArrayMake = {}
--- 
---@class ArrayMake-Class : FGWiremodBuildable-Class
ArrayMake_Class = {}

--- Creates an array from non array types. Scales the input list when the last input is connected.
---@class Build_MakeArray_C : ArrayMake
Build_MakeArray_C = {}
--- Creates an array from non array types. Scales the input list when the last input is connected.
---@class Build_MakeArray_C-Class : ArrayMake-Class
Build_MakeArray_C_Class = {}

--- 
---@class ArrayRemove : FGWiremodBuildable
ArrayRemove = {}
--- 
---@class ArrayRemove-Class : FGWiremodBuildable-Class
ArrayRemove_Class = {}

--- Removes element in the array at specified index.
---@class Build_ArrayRemove_C : ArrayRemove
Build_ArrayRemove_C = {}
--- Removes element in the array at specified index.
---@class Build_ArrayRemove_C-Class : ArrayRemove-Class
Build_ArrayRemove_C_Class = {}

--- 
---@class ArrayResize : FGWiremodBuildable
ArrayResize = {}
--- 
---@class ArrayResize-Class : FGWiremodBuildable-Class
ArrayResize_Class = {}

--- Changes array's size to the specified.
--- WARNING: Avoid resizing arrays to absurd sizes, if your game crashes it's not our fault.
---@class Build_ResizeArray_C : ArrayResize
Build_ResizeArray_C = {}
--- Changes array's size to the specified.
--- WARNING: Avoid resizing arrays to absurd sizes, if your game crashes it's not our fault.
---@class Build_ResizeArray_C-Class : ArrayResize-Class
Build_ResizeArray_C_Class = {}

--- 
---@class ArraySet : FGWiremodBuildable
ArraySet = {}
--- 
---@class ArraySet-Class : FGWiremodBuildable-Class
ArraySet_Class = {}

--- Replaces element in the array at specified index.
---@class Build_ArraySet_C : ArraySet
Build_ArraySet_C = {}
--- Replaces element in the array at specified index.
---@class Build_ArraySet_C-Class : ArraySet-Class
Build_ArraySet_C_Class = {}

--- 
---@class BoolArrayToInt : FGWiremodBuildable
BoolArrayToInt = {}
--- 
---@class BoolArrayToInt-Class : FGWiremodBuildable-Class
BoolArrayToInt_Class = {}

--- Converts bool array to integer (using bitwise operations)
---@class Build_BoolArrayToInt_C : BoolArrayToInt
Build_BoolArrayToInt_C = {}
--- Converts bool array to integer (using bitwise operations)
---@class Build_BoolArrayToInt_C-Class : BoolArrayToInt-Class
Build_BoolArrayToInt_C_Class = {}

--- 
---@class BoolToNumber : FGWiremodBuildable
BoolToNumber = {}
--- 
---@class BoolToNumber-Class : FGWiremodBuildable-Class
BoolToNumber_Class = {}

--- Converts bool input to number output
---@class Build_BoolToNumber_C : BoolToNumber
Build_BoolToNumber_C = {}
--- Converts bool input to number output
---@class Build_BoolToNumber_C-Class : BoolToNumber-Class
Build_BoolToNumber_C_Class = {}

--- 
---@class BreakColor : FGWiremodBuildable
BreakColor = {}
--- 
---@class BreakColor-Class : FGWiremodBuildable-Class
BreakColor_Class = {}

--- Splits color to HSVA values.
---@class Build_BreakColor_C : BreakColor
Build_BreakColor_C = {}
--- Splits color to HSVA values.
---@class Build_BreakColor_C-Class : BreakColor-Class
Build_BreakColor_C_Class = {}

--- 
---@class BreakColorRGBA : FGWiremodBuildable
BreakColorRGBA = {}
--- 
---@class BreakColorRGBA-Class : FGWiremodBuildable-Class
BreakColorRGBA_Class = {}

--- Splits color to RGBA values.
---@class Build_BreakColorRGBA_C : BreakColorRGBA
Build_BreakColorRGBA_C = {}
--- Splits color to RGBA values.
---@class Build_BreakColorRGBA_C-Class : BreakColorRGBA-Class
Build_BreakColorRGBA_C_Class = {}

--- 
---@class BreakCustomStruct : FGWiremodBuildable
BreakCustomStruct = {}
--- 
---@class BreakCustomStruct-Class : FGWiremodBuildable-Class
BreakCustomStruct_Class = {}

--- Splits custom struct into a list of its values
---@class Build_BreakCustomStruct_C : BreakCustomStruct
Build_BreakCustomStruct_C = {}
--- Splits custom struct into a list of its values
---@class Build_BreakCustomStruct_C-Class : BreakCustomStruct-Class
Build_BreakCustomStruct_C_Class = {}

--- 
---@class BreakEntity : FGWiremodBuildable
BreakEntity = {}
--- 
---@class BreakEntity-Class : FGWiremodBuildable-Class
BreakEntity_Class = {}

--- Accepts entity as an input, splits info to separate outputs
---@class Build_BreakEntity_C : BreakEntity
Build_BreakEntity_C = {}
--- Accepts entity as an input, splits info to separate outputs
---@class Build_BreakEntity_C-Class : BreakEntity-Class
Build_BreakEntity_C_Class = {}

--- 
---@class BreakInventory : FGWiremodBuildable
BreakInventory = {}
--- 
---@class BreakInventory-Class : FGWiremodBuildable-Class
BreakInventory_Class = {}

--- Accepts inventory as an input, splits info to separate outputs
---@class Build_BreakInventory_C : BreakInventory
Build_BreakInventory_C = {}
--- Accepts inventory as an input, splits info to separate outputs
---@class Build_BreakInventory_C-Class : BreakInventory-Class
Build_BreakInventory_C_Class = {}

--- 
---@class BreakItemAmount : FGWiremodBuildable
BreakItemAmount = {}
--- 
---@class BreakItemAmount-Class : FGWiremodBuildable-Class
BreakItemAmount_Class = {}

--- Accepts item amount as an input, splits info to separate outputs
---@class Build_BreakItemAmount_C : BreakItemAmount
Build_BreakItemAmount_C = {}
--- Accepts item amount as an input, splits info to separate outputs
---@class Build_BreakItemAmount_C-Class : BreakItemAmount-Class
Build_BreakItemAmount_C_Class = {}

--- 
---@class BreakItemStack : FGWiremodBuildable
BreakItemStack = {}
--- 
---@class BreakItemStack-Class : FGWiremodBuildable-Class
BreakItemStack_Class = {}

--- Accepts item stack as input, splits info into separate outputs
---@class Build_BreakItemStack_C : BreakItemStack
Build_BreakItemStack_C = {}
--- Accepts item stack as input, splits info into separate outputs
---@class Build_BreakItemStack_C-Class : BreakItemStack-Class
Build_BreakItemStack_C_Class = {}

--- 
---@class BreakPixelImage : FGWiremodBuildable
BreakPixelImage = {}
--- 
---@class BreakPixelImage-Class : FGWiremodBuildable-Class
BreakPixelImage_Class = {}

--- 
---@class BreakPowerCircuit : FGWiremodBuildable
BreakPowerCircuit = {}
--- 
---@class BreakPowerCircuit-Class : FGWiremodBuildable-Class
BreakPowerCircuit_Class = {}

--- Accepts power circuit info as an input, splits the info to separate outputs
---@class Build_BreakPowerCircuit_C : BreakPowerCircuit
Build_BreakPowerCircuit_C = {}
--- Accepts power circuit info as an input, splits the info to separate outputs
---@class Build_BreakPowerCircuit_C-Class : BreakPowerCircuit-Class
Build_BreakPowerCircuit_C_Class = {}

--- 
---@class BreakRecipe : FGWiremodBuildable
BreakRecipe = {}
--- 
---@class BreakRecipe-Class : FGWiremodBuildable-Class
BreakRecipe_Class = {}

--- Accepts recipe as an input, splits info to separate outputs
---@class Build_BreakRecipe_C : BreakRecipe
Build_BreakRecipe_C = {}
--- Accepts recipe as an input, splits info to separate outputs
---@class Build_BreakRecipe_C-Class : BreakRecipe-Class
Build_BreakRecipe_C_Class = {}

--- 
---@class BreakTimeTableStop : FGWiremodBuildable
BreakTimeTableStop = {}
--- 
---@class BreakTimeTableStop-Class : FGWiremodBuildable-Class
BreakTimeTableStop_Class = {}

--- Accepts train stop as input, splits info to separate outputs
---@class Build_BreakTrainStop_C : BreakTimeTableStop
Build_BreakTrainStop_C = {}
--- Accepts train stop as input, splits info to separate outputs
---@class Build_BreakTrainStop_C-Class : BreakTimeTableStop-Class
Build_BreakTrainStop_C_Class = {}

--- 
---@class BreakTrainTimeTable : FGWiremodBuildable
BreakTrainTimeTable = {}
--- 
---@class BreakTrainTimeTable-Class : FGWiremodBuildable-Class
BreakTrainTimeTable_Class = {}

--- Gathers train schedule from locomotive entity, splits info to separate outputs
--- 
--- To get the locomotive entity, aim at it with wiring tool and select "Select object as entity output" in actions menu
---@class Build_BreakTimeTable_C : BreakTrainTimeTable
Build_BreakTimeTable_C = {}
--- Gathers train schedule from locomotive entity, splits info to separate outputs
--- 
--- To get the locomotive entity, aim at it with wiring tool and select "Select object as entity output" in actions menu
---@class Build_BreakTimeTable_C-Class : BreakTrainTimeTable-Class
Build_BreakTimeTable_C_Class = {}

--- 
---@class BreakVector : FGWiremodBuildable
BreakVector = {}
--- 
---@class BreakVector-Class : FGWiremodBuildable-Class
BreakVector_Class = {}

--- Splits vector input to XYZ outputs
---@class Build_BreakVector_C : BreakVector
Build_BreakVector_C = {}
--- Splits vector input to XYZ outputs
---@class Build_BreakVector_C-Class : BreakVector-Class
Build_BreakVector_C_Class = {}

--- 
---@class ChangeDetector : FGWiremodBuildable
ChangeDetector = {}
--- 
---@class ChangeDetector-Class : FGWiremodBuildable-Class
ChangeDetector_Class = {}

--- Accepts value of any type, outputs a signal for a brief moment when the value changes.
---@class Build_ChangeDetector_C : ChangeDetector
Build_ChangeDetector_C = {}
--- Accepts value of any type, outputs a signal for a brief moment when the value changes.
---@class Build_ChangeDetector_C-Class : ChangeDetector-Class
Build_ChangeDetector_C_Class = {}

--- 
---@class CircuitryMapMarker : FGWiremodBuildable
CircuitryMapMarker = {}
--- 
---@class CircuitryMapMarker-Class : FGWiremodBuildable-Class
CircuitryMapMarker_Class = {}

--- Allows to place a marker on the map with configurable settings such as color, text, icon, position, etc.
---@class Build_MapBeacon_C : CircuitryMapMarker
Build_MapBeacon_C = {}
--- Allows to place a marker on the map with configurable settings such as color, text, icon, position, etc.
---@class Build_MapBeacon_C-Class : CircuitryMapMarker-Class
Build_MapBeacon_C_Class = {}

--- 
---@class ClampNumber : FGWiremodBuildable
ClampNumber = {}
--- 
---@class ClampNumber-Class : FGWiremodBuildable-Class
ClampNumber_Class = {}

--- Clamps the number between min and max
---@class Build_ClampNumber_C : ClampNumber
Build_ClampNumber_C = {}
--- Clamps the number between min and max
---@class Build_ClampNumber_C-Class : ClampNumber-Class
Build_ClampNumber_C_Class = {}

--- 
---@class ColorToHex : FGWiremodBuildable
ColorToHex = {}
--- 
---@class ColorToHex-Class : FGWiremodBuildable-Class
ColorToHex_Class = {}

--- Converts color input to hex string (i.e. 001122FF)
---@class Build_ColorToHexString_C : ColorToHex
Build_ColorToHexString_C = {}
--- Converts color input to hex string (i.e. 001122FF)
---@class Build_ColorToHexString_C-Class : ColorToHex-Class
Build_ColorToHexString_C_Class = {}

--- 
---@class CombineInventories : FGWiremodBuildable
CombineInventories = {}
--- 
---@class CombineInventories-Class : FGWiremodBuildable-Class
CombineInventories_Class = {}

--- Accepts array of inventories and combines their info together.
--- 
--- You can use anything that has an inventory - containers, trains, vehicles, and even players.
---@class Build_CombineInventories_C : CombineInventories
Build_CombineInventories_C = {}
--- Accepts array of inventories and combines their info together.
--- 
--- You can use anything that has an inventory - containers, trains, vehicles, and even players.
---@class Build_CombineInventories_C-Class : CombineInventories-Class
Build_CombineInventories_C_Class = {}

--- 
---@class CombineItemStacks : FGWiremodBuildable
CombineItemStacks = {}
--- 
---@class CombineItemStacks-Class : FGWiremodBuildable-Class
CombineItemStacks_Class = {}

--- Allows to combine multiple stacks of items into one stack.
--- 
--- For example if you have 3 stacks of iron with 100 iron in each stack, you will get one stack with 300 iron. Same for every other item in the array.
--- 
--- <Orange>DO NOT USE THIS FOR ADVANCED SIGNS - INVENTORY DISPLAYER HAS THIS FEATURE AS A CONFIG TOGGLE</>
---@class Build_CombineStacks_C : CombineItemStacks
Build_CombineStacks_C = {}
--- Allows to combine multiple stacks of items into one stack.
--- 
--- For example if you have 3 stacks of iron with 100 iron in each stack, you will get one stack with 300 iron. Same for every other item in the array.
--- 
--- <Orange>DO NOT USE THIS FOR ADVANCED SIGNS - INVENTORY DISPLAYER HAS THIS FEATURE AS A CONFIG TOGGLE</>
---@class Build_CombineStacks_C-Class : CombineItemStacks-Class
Build_CombineStacks_C_Class = {}

--- 
---@class ConfigurableConstant : FGWiremodBuildable
ConfigurableConstant = {}
--- 
---@param Name string 
---@param CircuitryType integer 
---@param Value string 
---@type (fun(self:ConfigurableConstant,Name:string,CircuitryType:integer,Value:string))|ReflectionFunction
function ConfigurableConstant:setValueByValueString(Name, CircuitryType, Value) end
--- 
---@class ConfigurableConstant-Class : FGWiremodBuildable-Class
ConfigurableConstant_Class = {}

--- Allows you to create variables that you can use anywhere.
---@class Build_Const_C : ConfigurableConstant
Build_Const_C = {}
--- Allows you to create variables that you can use anywhere.
---@class Build_Const_C-Class : ConfigurableConstant-Class
Build_Const_C_Class = {}

--- 
---@class ConveyorLimiter : FGWiremodBuildable
ConveyorLimiter = {}
--- 
---@class ConveyorLimiter-Class : FGWiremodBuildable-Class
ConveyorLimiter_Class = {}

--- Calculates throughput rate every second, takes 120 seconds to get the full values.
--- Must be snapped to a conveyor belt to place
---@class Build_ConveyorLimiter_C : ConveyorLimiter
Build_ConveyorLimiter_C = {}
--- Calculates throughput rate every second, takes 120 seconds to get the full values.
--- Must be snapped to a conveyor belt to place
---@class Build_ConveyorLimiter_C-Class : ConveyorLimiter-Class
Build_ConveyorLimiter_C_Class = {}

--- 
---@class DegreesToRadians : FGWiremodBuildable
DegreesToRadians = {}
--- 
---@class DegreesToRadians-Class : FGWiremodBuildable-Class
DegreesToRadians_Class = {}

--- Converts degrees input to radians
---@class Build_DegToRad_C : DegreesToRadians
Build_DegToRad_C = {}
--- Converts degrees input to radians
---@class Build_DegToRad_C-Class : DegreesToRadians-Class
Build_DegToRad_C_Class = {}

--- 
---@class DeltaTime : FGWiremodBuildable
DeltaTime = {}
--- 
---@class DeltaTime-Class : FGWiremodBuildable-Class
DeltaTime_Class = {}

--- Outputs how much time it took for satisfactory to process the last frame.
---@class Build_DeltaTime_C : DeltaTime
Build_DeltaTime_C = {}
--- Outputs how much time it took for satisfactory to process the last frame.
---@class Build_DeltaTime_C-Class : DeltaTime-Class
Build_DeltaTime_C_Class = {}

--- 
---@class DesaturateColor : FGWiremodBuildable
DesaturateColor = {}
--- 
---@class DesaturateColor-Class : FGWiremodBuildable-Class
DesaturateColor_Class = {}

--- Returns a desaturated color.
--- Accepts a number with 0 meaning no desaturation and 1 == full desaturation.
---@class Build_DesaturateColor_C : DesaturateColor
Build_DesaturateColor_C = {}
--- Returns a desaturated color.
--- Accepts a number with 0 meaning no desaturation and 1 == full desaturation.
---@class Build_DesaturateColor_C-Class : DesaturateColor-Class
Build_DesaturateColor_C_Class = {}

--- 
---@class DFlipFlop : FGWiremodBuildable
DFlipFlop = {}
--- 
---@class DFlipFlop-Class : FGWiremodBuildable-Class
DFlipFlop_Class = {}

--- When CLK (clock type signal) is true, changes the output to whatever D is.
---@class Build_D_Flip_Flop_C : DFlipFlop
Build_D_Flip_Flop_C = {}
--- When CLK (clock type signal) is true, changes the output to whatever D is.
---@class Build_D_Flip_Flop_C-Class : DFlipFlop-Class
Build_D_Flip_Flop_C_Class = {}

--- 
---@class Equals : FGWiremodBuildable
Equals = {}
--- 
---@class Equals-Class : FGWiremodBuildable-Class
Equals_Class = {}

--- Accepts 2 values of any type. Returns true if they are equal.
---@class Build_Equals_C : Equals
Build_Equals_C = {}
--- Accepts 2 values of any type. Returns true if they are equal.
---@class Build_Equals_C-Class : Equals-Class
Build_Equals_C_Class = {}

--- 
---@class FallingEdgeDelay : FGWiremodBuildable
FallingEdgeDelay = {}
--- 
---@class FallingEdgeDelay-Class : FGWiremodBuildable-Class
FallingEdgeDelay_Class = {}

--- When bool value goes from true to false, this gate will delay that by X seconds.
--- If the value goes to true while the delay is ongoing, the timer will be reset.
---@class Build_FallingEdgeDelay_C : FallingEdgeDelay
Build_FallingEdgeDelay_C = {}
--- When bool value goes from true to false, this gate will delay that by X seconds.
--- If the value goes to true while the delay is ongoing, the timer will be reset.
---@class Build_FallingEdgeDelay_C-Class : FallingEdgeDelay-Class
Build_FallingEdgeDelay_C_Class = {}

--- 
---@class FallingEdgeDetector : FGWiremodBuildable
FallingEdgeDetector = {}
--- 
---@class FallingEdgeDetector-Class : FGWiremodBuildable-Class
FallingEdgeDetector_Class = {}

--- Detects when input goes from high to low and outputs a signal for a brief moment
---@class Build_FallingEdgeDetector_C : FallingEdgeDetector
Build_FallingEdgeDetector_C = {}
--- Detects when input goes from high to low and outputs a signal for a brief moment
---@class Build_FallingEdgeDetector_C-Class : FallingEdgeDetector-Class
Build_FallingEdgeDetector_C_Class = {}

--- 
---@class FindSubstring : FGWiremodBuildable
FindSubstring = {}
--- 
---@class FindSubstring-Class : FGWiremodBuildable-Class
FindSubstring_Class = {}

--- Finds provided substring in the source string. Case insensitive by default.
---@class Build_FindInString_C : FindSubstring
Build_FindInString_C = {}
--- Finds provided substring in the source string. Case insensitive by default.
---@class Build_FindInString_C-Class : FindSubstring-Class
Build_FindInString_C_Class = {}

--- 
---@class GameTimeSensor : FGWiremodBuildable
GameTimeSensor = {}
--- 
---@class GameTimeSensor-Class : FGWiremodBuildable-Class
GameTimeSensor_Class = {}

--- Outputs information about game world time.
---@class Build_GameTimeSensor_C : GameTimeSensor
Build_GameTimeSensor_C = {}
--- Outputs information about game world time.
---@class Build_GameTimeSensor_C-Class : GameTimeSensor-Class
Build_GameTimeSensor_C_Class = {}

--- 
---@class GetItemStack : FGWiremodBuildable
GetItemStack = {}
--- 
---@class GetItemStack-Class : FGWiremodBuildable-Class
GetItemStack_Class = {}

--- Accepts array of stacks and item descriptor filter, outputs the first stack that uses that descriptor.
---@class Build_GetItemStack_C : GetItemStack
Build_GetItemStack_C = {}
--- Accepts array of stacks and item descriptor filter, outputs the first stack that uses that descriptor.
---@class Build_GetItemStack_C-Class : GetItemStack-Class
Build_GetItemStack_C_Class = {}

--- 
---@class GetStringChar : FGWiremodBuildable
GetStringChar = {}
--- 
---@class GetStringChar-Class : FGWiremodBuildable-Class
GetStringChar_Class = {}

--- Gets character from string at specified index
---@class Build_GetChar_C : GetStringChar
Build_GetChar_C = {}
--- Gets character from string at specified index
---@class Build_GetChar_C-Class : GetStringChar-Class
Build_GetChar_C_Class = {}

--- 
---@class GraphScreen : FGWiremodBuildable
GraphScreen = {}
--- 
---@class GraphScreen-Class : FGWiremodBuildable-Class
GraphScreen_Class = {}

--- 
---@class HexToColor : FGWiremodBuildable
HexToColor = {}
--- 
---@class HexToColor-Class : FGWiremodBuildable-Class
HexToColor_Class = {}

--- Converts hex string input (i.e. 001122FF) to color output
---@class Build_HexToColor_C : HexToColor
Build_HexToColor_C = {}
--- Converts hex string input (i.e. 001122FF) to color output
---@class Build_HexToColor_C-Class : HexToColor-Class
Build_HexToColor_C_Class = {}

--- 
---@class HttpRequestModule : FGWiremodBuildable
HttpRequestModule = {}
--- 
---@class HttpRequestModule-Class : FGWiremodBuildable-Class
HttpRequestModule_Class = {}

--- Allows to make HTTP requests via URL.
--- Returns response code, body, and headers.
--- 
--- URL - Url that should receive the request
--- Content - "body" string that will be sent with the request. Can be empty.
--- Timeout - how long in seconds should the module attempt to reach the URL.
--- Verb - verb to use (GET, POST, PUT, DELETE, PATCH)
--- 
--- You can set headers for the request by using custom structs.
--- Each STRING variable in the struct is a header, where its name is the header name and value is the header value.
---@class Build_NetworkRequestModule_C : HttpRequestModule
Build_NetworkRequestModule_C = {}
--- Allows to make HTTP requests via URL.
--- Returns response code, body, and headers.
--- 
--- URL - Url that should receive the request
--- Content - "body" string that will be sent with the request. Can be empty.
--- Timeout - how long in seconds should the module attempt to reach the URL.
--- Verb - verb to use (GET, POST, PUT, DELETE, PATCH)
--- 
--- You can set headers for the request by using custom structs.
--- Each STRING variable in the struct is a header, where its name is the header name and value is the header value.
---@class Build_NetworkRequestModule_C-Class : HttpRequestModule-Class
Build_NetworkRequestModule_C_Class = {}

--- 
---@class IncrementDecrement : FGWiremodBuildable
IncrementDecrement = {}
--- 
---@class IncrementDecrement-Class : FGWiremodBuildable-Class
IncrementDecrement_Class = {}

--- Increments or decrements the number.
---@class Build_IncrementDecrement_C : IncrementDecrement
Build_IncrementDecrement_C = {}
--- Increments or decrements the number.
---@class Build_IncrementDecrement_C-Class : IncrementDecrement-Class
Build_IncrementDecrement_C_Class = {}

--- 
---@class IntToBoolArray : FGWiremodBuildable
IntToBoolArray = {}
--- 
---@class IntToBoolArray-Class : FGWiremodBuildable-Class
IntToBoolArray_Class = {}

--- Converts int to bool array (element for each bit)
---@class Build_IntToBoolArray_C : IntToBoolArray
Build_IntToBoolArray_C = {}
--- Converts int to bool array (element for each bit)
---@class Build_IntToBoolArray_C-Class : IntToBoolArray-Class
Build_IntToBoolArray_C_Class = {}

--- 
---@class InverseNumber : FGWiremodBuildable
InverseNumber = {}
--- 
---@class InverseNumber-Class : FGWiremodBuildable-Class
InverseNumber_Class = {}

--- Returns 1 divided by input.
---@class Build_Inverse_C : InverseNumber
Build_Inverse_C = {}
--- Returns 1 divided by input.
---@class Build_Inverse_C-Class : InverseNumber-Class
Build_Inverse_C_Class = {}

--- 
---@class ItemBuffer : FGWiremodBuildable
ItemBuffer = {}
--- 
---@class ItemBuffer-Class : FGWiremodBuildable-Class
ItemBuffer_Class = {}

--- Allows to buffer items to output them in batches.
--- For example, if you're making a sushi belt you can set this buildable to collect 5 items and only then output them, to ensure uniform fill-up.
--- You can also set a filter to make it only collect specific item, and move everything else to the excess output (on the side).
---@class Build_ItemBuffer_C : ItemBuffer
Build_ItemBuffer_C = {}
--- Allows to buffer items to output them in batches.
--- For example, if you're making a sushi belt you can set this buildable to collect 5 items and only then output them, to ensure uniform fill-up.
--- You can also set a filter to make it only collect specific item, and move everything else to the excess output (on the side).
---@class Build_ItemBuffer_C-Class : ItemBuffer-Class
Build_ItemBuffer_C_Class = {}

--- 
---@class ItemHologram : FGWiremodBuildable
ItemHologram = {}
--- 
---@class ItemHologram-Class : FGWiremodBuildable-Class
ItemHologram_Class = {}

--- Accepts item descriptor and displays its model as it would appear on the ground, or on a conveyor.
--- Configurable position, rotation, and scale
---@class Build_ItemHologram_C : ItemHologram
Build_ItemHologram_C = {}
--- Accepts item descriptor and displays its model as it would appear on the ground, or on a conveyor.
--- Configurable position, rotation, and scale
---@class Build_ItemHologram_C-Class : ItemHologram-Class
Build_ItemHologram_C_Class = {}

--- 
---@class LerpNumber : FGWiremodBuildable
LerpNumber = {}
--- 
---@class LerpNumber-Class : FGWiremodBuildable-Class
LerpNumber_Class = {}

--- Linearly goes from value A to value B based on alpha.
--- Alpha is in a range 0-1, where 0 is value A, 0.5 is in the middle between A and B, and 1 is value B.
---@class Build_LerpNumber_C : LerpNumber
Build_LerpNumber_C = {}
--- Linearly goes from value A to value B based on alpha.
--- Alpha is in a range 0-1, where 0 is value A, 0.5 is in the middle between A and B, and 1 is value B.
---@class Build_LerpNumber_C-Class : LerpNumber-Class
Build_LerpNumber_C_Class = {}

--- 
---@class LightsColorEditor : FGWiremodBuildable
LightsColorEditor = {}
--- 
---@class LightsColorEditor-Class : FGWiremodBuildable-Class
LightsColorEditor_Class = {}

--- Allows to edit the color slots used for buildable lights.
--- Only modifies currently connected inputs.
--- Outputs an array of buildable light colors stored in the savefile.
---@class Build_ColorSlotEditor_C : LightsColorEditor
Build_ColorSlotEditor_C = {}
--- Allows to edit the color slots used for buildable lights.
--- Only modifies currently connected inputs.
--- Outputs an array of buildable light colors stored in the savefile.
---@class Build_ColorSlotEditor_C-Class : LightsColorEditor-Class
Build_ColorSlotEditor_C_Class = {}

--- 
---@class LinearInterpolation : FGWiremodBuildable
LinearInterpolation = {}
--- 
---@class LinearInterpolation-Class : FGWiremodBuildable-Class
LinearInterpolation_Class = {}

--- 
---@class LinearMotionAdapter : FGWiremodBuildable
LinearMotionAdapter = {}
--- 
---@class LinearMotionAdapter-Class : FGWiremodBuildable-Class
LinearMotionAdapter_Class = {}

--- Allows you to control linear motion lifts.
--- To interact with a lift, connect its "Lift" output to this adapter.
---@class Build_LinearMotionAdapter_C : LinearMotionAdapter
Build_LinearMotionAdapter_C = {}
--- Allows you to control linear motion lifts.
--- To interact with a lift, connect its "Lift" output to this adapter.
---@class Build_LinearMotionAdapter_C-Class : LinearMotionAdapter-Class
Build_LinearMotionAdapter_C_Class = {}

--- 
---@class MakeColor : FGWiremodBuildable
MakeColor = {}
--- 
---@class MakeColor-Class : FGWiremodBuildable-Class
MakeColor_Class = {}

--- Constructs color from HSVA values
---@class Build_MakeColor_C : MakeColor
Build_MakeColor_C = {}
--- Constructs color from HSVA values
---@class Build_MakeColor_C-Class : MakeColor-Class
Build_MakeColor_C_Class = {}

--- 
---@class MakeColorRGBA : FGWiremodBuildable
MakeColorRGBA = {}
--- 
---@class MakeColorRGBA-Class : FGWiremodBuildable-Class
MakeColorRGBA_Class = {}

--- Constructs color from RGBA values
---@class Build_MakeColorRGBA_C : MakeColorRGBA
Build_MakeColorRGBA_C = {}
--- Constructs color from RGBA values
---@class Build_MakeColorRGBA_C-Class : MakeColorRGBA-Class
Build_MakeColorRGBA_C_Class = {}

--- 
---@class CustomStructProcessor : FGWiremodBuildable
CustomStructProcessor = {}
--- 
---@class CustomStructProcessor-Class : FGWiremodBuildable-Class
CustomStructProcessor_Class = {}

--- Allows to create a structure with custom values that can be transferred as a singular connection.
---@class Build_CustomStructProcessor_C : CustomStructProcessor
Build_CustomStructProcessor_C = {}
--- Allows to create a structure with custom values that can be transferred as a singular connection.
---@class Build_CustomStructProcessor_C-Class : CustomStructProcessor-Class
Build_CustomStructProcessor_C_Class = {}

--- 
---@class MakeItemAmount : FGWiremodBuildable
MakeItemAmount = {}
--- 
---@class MakeItemAmount-Class : FGWiremodBuildable-Class
MakeItemAmount_Class = {}

--- Accepts item descriptor and amount, outputs constructed item amount.
---@class Build_MakeItemAmount_C : MakeItemAmount
Build_MakeItemAmount_C = {}
--- Accepts item descriptor and amount, outputs constructed item amount.
---@class Build_MakeItemAmount_C-Class : MakeItemAmount-Class
Build_MakeItemAmount_C_Class = {}

--- 
---@class MakeItemStack : FGWiremodBuildable
MakeItemStack = {}
--- 
---@class MakeItemStack-Class : FGWiremodBuildable-Class
MakeItemStack_Class = {}

--- Accepts item descriptor and item count, outputs constructed item stack.
---@class Build_MakeItemStack_C : MakeItemStack
Build_MakeItemStack_C = {}
--- Accepts item descriptor and item count, outputs constructed item stack.
---@class Build_MakeItemStack_C-Class : MakeItemStack-Class
Build_MakeItemStack_C_Class = {}

--- 
---@class MakeSplitterRule : FGWiremodBuildable
MakeSplitterRule = {}
--- 
---@class MakeSplitterRule-Class : FGWiremodBuildable-Class
MakeSplitterRule_Class = {}

--- Accepts descriptor and output index, outputs splitter rule made from that info.
--- 
--- You can get descriptor from "Break Item Stack" or "Break Item Amount" gates.
---@class Build_MakeSplitterRule_C : MakeSplitterRule
Build_MakeSplitterRule_C = {}
--- Accepts descriptor and output index, outputs splitter rule made from that info.
--- 
--- You can get descriptor from "Break Item Stack" or "Break Item Amount" gates.
---@class Build_MakeSplitterRule_C-Class : MakeSplitterRule-Class
Build_MakeSplitterRule_C_Class = {}

--- 
---@class MakeVector : FGWiremodBuildable
MakeVector = {}
--- 
---@class MakeVector-Class : FGWiremodBuildable-Class
MakeVector_Class = {}

--- Makes vector from number inputs
---@class Build_MakeVector_C : MakeVector
Build_MakeVector_C = {}
--- Makes vector from number inputs
---@class Build_MakeVector_C-Class : MakeVector-Class
Build_MakeVector_C_Class = {}

--- 
---@class ManagedSign : FGWiremodBuildable
ManagedSign = {}
--- 
---@class ManagedSign-Class : FGWiremodBuildable-Class
ManagedSign_Class = {}

--- 
---@class BP_ManagedSign_C : ManagedSign
BP_ManagedSign_C = {}
--- 
---@class BP_ManagedSign_C-Class : ManagedSign-Class
BP_ManagedSign_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla small billboard.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SmallBillboard_C : BP_ManagedSign_C
Build_ManagedSign_SmallBillboard_C = {}
--- Fully configurable sign sized to be similar to vanilla small billboard.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SmallBillboard_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_SmallBillboard_C_Class = {}

--- Allows to create an advanced sign with custom size.
--- 
--- <Orange>Avoid creating huge signs! Engine's systems were not designed to handle screens of this size, your game will lag a LOT</>
---@class Build_ManagedSign_CustomSize_C : BP_ManagedSign_C
Build_ManagedSign_CustomSize_C = {}
--- Allows to create an advanced sign with custom size.
--- 
--- <Orange>Avoid creating huge signs! Engine's systems were not designed to handle screens of this size, your game will lag a LOT</>
---@class Build_ManagedSign_CustomSize_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_CustomSize_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla square 0.5m sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SquareSmall_C : BP_ManagedSign_C
Build_ManagedSign_SquareSmall_C = {}
--- Fully configurable sign sized to be similar to vanilla square 0.5m sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SquareSmall_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_SquareSmall_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla portrait sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_Portrait_C : BP_ManagedSign_C
Build_ManagedSign_Portrait_C = {}
--- Fully configurable sign sized to be similar to vanilla portrait sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_Portrait_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_Portrait_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla square 2m sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SquareLarge_C : BP_ManagedSign_C
Build_ManagedSign_SquareLarge_C = {}
--- Fully configurable sign sized to be similar to vanilla square 2m sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SquareLarge_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_SquareLarge_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla billboard.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_BigBillboard_C : BP_ManagedSign_C
Build_ManagedSign_BigBillboard_C = {}
--- Fully configurable sign sized to be similar to vanilla billboard.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_BigBillboard_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_BigBillboard_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla square 1m sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SquareMedium_C : BP_ManagedSign_C
Build_ManagedSign_SquareMedium_C = {}
--- Fully configurable sign sized to be similar to vanilla square 1m sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_SquareMedium_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_SquareMedium_C_Class = {}

--- Fully configurable sign sized to be similar to vanilla display sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_Display_C : BP_ManagedSign_C
Build_ManagedSign_Display_C = {}
--- Fully configurable sign sized to be similar to vanilla display sign.
--- Uses components for displaying information.
--- Components include text, images, "progress bars", graphs, etc.
---@class Build_ManagedSign_Display_C-Class : BP_ManagedSign_C-Class
Build_ManagedSign_Display_C_Class = {}

--- 
---@class MathExpressionEvaluator : FGWiremodBuildable
MathExpressionEvaluator = {}
--- 
---@class MathExpressionEvaluator-Class : FGWiremodBuildable-Class
MathExpressionEvaluator_Class = {}

--- Evaluates input string as a math expression.
--- The evaluation logic is the same as in quick search bar.
---@class Build_MathExpEvaluator_C : MathExpressionEvaluator
Build_MathExpEvaluator_C = {}
--- Evaluates input string as a math expression.
--- The evaluation logic is the same as in quick search bar.
---@class Build_MathExpEvaluator_C-Class : MathExpressionEvaluator-Class
Build_MathExpEvaluator_C_Class = {}

--- 
---@class ModifyCustomStruct : FGWiremodBuildable
ModifyCustomStruct = {}
--- 
---@class ModifyCustomStruct-Class : FGWiremodBuildable-Class
ModifyCustomStruct_Class = {}

--- Accepts custom struct, and duplicates it.
--- Once the struct is connected, this gate gets more inputs for struct's values. You can input a value into those inputs to modify the struct in some way.
--- <Orange>Disconnected inputs won't modify struct's values, so if you want to modify a specific entry you don't need to fill out the rest</>
---@class Build_ModifyCustomStruct_C : ModifyCustomStruct
Build_ModifyCustomStruct_C = {}
--- Accepts custom struct, and duplicates it.
--- Once the struct is connected, this gate gets more inputs for struct's values. You can input a value into those inputs to modify the struct in some way.
--- <Orange>Disconnected inputs won't modify struct's values, so if you want to modify a specific entry you don't need to fill out the rest</>
---@class Build_ModifyCustomStruct_C-Class : ModifyCustomStruct-Class
Build_ModifyCustomStruct_C_Class = {}

--- 
---@class Multiplexer : FGWiremodBuildable
Multiplexer = {}
--- 
---@class Multiplexer-Class : FGWiremodBuildable-Class
Multiplexer_Class = {}

--- Allows to select a specific value out of many using a bool.
--- If there are multiple values and multiple values are selected at once, prioritizes the first one in the list.
---@class Build_Multiplexer_C : Multiplexer
Build_Multiplexer_C = {}
--- Allows to select a specific value out of many using a bool.
--- If there are multiple values and multiple values are selected at once, prioritizes the first one in the list.
---@class Build_Multiplexer_C-Class : Multiplexer-Class
Build_Multiplexer_C_Class = {}

--- 
---@class NegateNumber : FGWiremodBuildable
NegateNumber = {}
--- 
---@class NegateNumber-Class : FGWiremodBuildable-Class
NegateNumber_Class = {}

--- Negates the input (20 -> -20 and -20 -> 20)
---@class Build_NegateNumber_C : NegateNumber
Build_NegateNumber_C = {}
--- Negates the input (20 -> -20 and -20 -> 20)
---@class Build_NegateNumber_C-Class : NegateNumber-Class
Build_NegateNumber_C_Class = {}

--- 
---@class NormalizeNumber : FGWiremodBuildable
NormalizeNumber = {}
--- 
---@class NormalizeNumber-Class : FGWiremodBuildable-Class
NormalizeNumber_Class = {}

--- Normalizes the value to a range.
--- e.g. 20 normalized to a range 0->50 would be 0.4.
---@class Build_Percent_C : NormalizeNumber
Build_Percent_C = {}
--- Normalizes the value to a range.
--- e.g. 20 normalized to a range 0->50 would be 0.4.
---@class Build_Percent_C-Class : NormalizeNumber-Class
Build_Percent_C_Class = {}

--- 
---@class NOT : FGWiremodBuildable
NOT = {}
--- 
---@class NOT-Class : FGWiremodBuildable-Class
NOT_Class = {}

--- Inverts the input.
---@class Build_NOT_Gate_C : NOT
Build_NOT_Gate_C = {}
--- Inverts the input.
---@class Build_NOT_Gate_C-Class : NOT-Class
Build_NOT_Gate_C_Class = {}

--- 
---@class Notificator : FGWiremodBuildable
Notificator = {}
--- 
---@class Notificator-Class : FGWiremodBuildable-Class
Notificator_Class = {}

--- Sends a notification to all players.
---@class Build_Notificator_C : Notificator
Build_Notificator_C = {}
--- Sends a notification to all players.
---@class Build_Notificator_C-Class : Notificator-Class
Build_Notificator_C_Class = {}

--- 
---@class NumberCeil : FGWiremodBuildable
NumberCeil = {}
--- 
---@class NumberCeil-Class : FGWiremodBuildable-Class
NumberCeil_Class = {}

--- Rounds the number up towards positive infinity (e.g. -1.6 -> -1 and 1.6 -> 2)
---@class Build_NumberRoundUp_C : NumberCeil
Build_NumberRoundUp_C = {}
--- Rounds the number up towards positive infinity (e.g. -1.6 -> -1 and 1.6 -> 2)
---@class Build_NumberRoundUp_C-Class : NumberCeil-Class
Build_NumberRoundUp_C_Class = {}

--- 
---@class NumberEquals : FGWiremodBuildable
NumberEquals = {}
--- 
---@class NumberEquals-Class : FGWiremodBuildable-Class
NumberEquals_Class = {}

--- Returns true if inputs are equal
---@class Build_NumberEquals_C : NumberEquals
Build_NumberEquals_C = {}
--- Returns true if inputs are equal
---@class Build_NumberEquals_C-Class : NumberEquals-Class
Build_NumberEquals_C_Class = {}

--- 
---@class NumberExponent : FGWiremodBuildable
NumberExponent = {}
--- 
---@class NumberExponent-Class : FGWiremodBuildable-Class
NumberExponent_Class = {}

--- Returns exponential function of input number
---@class Build_ExpNumber_C : NumberExponent
Build_ExpNumber_C = {}
--- Returns exponential function of input number
---@class Build_ExpNumber_C-Class : NumberExponent-Class
Build_ExpNumber_C_Class = {}

--- 
---@class NumberFloor : FGWiremodBuildable
NumberFloor = {}
--- 
---@class NumberFloor-Class : FGWiremodBuildable-Class
NumberFloor_Class = {}

--- Rounds the number down towards negative infinity (e.g. -1.6 -> -2 and 1.6 -> 1)
---@class Build_NumberRoundDown_C : NumberFloor
Build_NumberRoundDown_C = {}
--- Rounds the number down towards negative infinity (e.g. -1.6 -> -2 and 1.6 -> 1)
---@class Build_NumberRoundDown_C-Class : NumberFloor-Class
Build_NumberRoundDown_C_Class = {}

--- 
---@class NumberFractional : FGWiremodBuildable
NumberFractional = {}
--- 
---@class NumberFractional-Class : FGWiremodBuildable-Class
NumberFractional_Class = {}

--- Returns fractional part of input number.
--- 
--- I.e. if input is 69.420, the gate will return 0.420
---@class Build_NumberFractional_C : NumberFractional
Build_NumberFractional_C = {}
--- Returns fractional part of input number.
--- 
--- I.e. if input is 69.420, the gate will return 0.420
---@class Build_NumberFractional_C-Class : NumberFractional-Class
Build_NumberFractional_C_Class = {}

--- 
---@class NumberGreater : FGWiremodBuildable
NumberGreater = {}
--- 
---@class NumberGreater-Class : FGWiremodBuildable-Class
NumberGreater_Class = {}

--- Returns true if A is greater than B (A > B)
---@class Build_NumberGreater_C : NumberGreater
Build_NumberGreater_C = {}
--- Returns true if A is greater than B (A > B)
---@class Build_NumberGreater_C-Class : NumberGreater-Class
Build_NumberGreater_C_Class = {}

--- 
---@class NumberGreaterOrEqual : FGWiremodBuildable
NumberGreaterOrEqual = {}
--- 
---@class NumberGreaterOrEqual-Class : FGWiremodBuildable-Class
NumberGreaterOrEqual_Class = {}

--- Returns true if A is greater or equal to B (A >= B)
---@class Build_NumberGreaterOrEqual_C : NumberGreaterOrEqual
Build_NumberGreaterOrEqual_C = {}
--- Returns true if A is greater or equal to B (A >= B)
---@class Build_NumberGreaterOrEqual_C-Class : NumberGreaterOrEqual-Class
Build_NumberGreaterOrEqual_C_Class = {}

--- 
---@class NumberIsInRange : FGWiremodBuildable
NumberIsInRange = {}
--- 
---@class NumberIsInRange-Class : FGWiremodBuildable-Class
NumberIsInRange_Class = {}

--- Checks if the number is in range (exclusive by default)
--- 
--- "Below" is true when number is lesser than min
--- "Above" is true when number is greater than max
---@class Build_NumberIsInRange_C : NumberIsInRange
Build_NumberIsInRange_C = {}
--- Checks if the number is in range (exclusive by default)
--- 
--- "Below" is true when number is lesser than min
--- "Above" is true when number is greater than max
---@class Build_NumberIsInRange_C-Class : NumberIsInRange-Class
Build_NumberIsInRange_C_Class = {}

--- 
---@class NumberLesser : FGWiremodBuildable
NumberLesser = {}
--- 
---@class NumberLesser-Class : FGWiremodBuildable-Class
NumberLesser_Class = {}

--- Returns true if A is less than B (A < B)
---@class Build_NumberLesser_C : NumberLesser
Build_NumberLesser_C = {}
--- Returns true if A is less than B (A < B)
---@class Build_NumberLesser_C-Class : NumberLesser-Class
Build_NumberLesser_C_Class = {}

--- 
---@class NumberLesserOrEqual : FGWiremodBuildable
NumberLesserOrEqual = {}
--- 
---@class NumberLesserOrEqual-Class : FGWiremodBuildable-Class
NumberLesserOrEqual_Class = {}

--- Returns true if A is less or equal to B (A <= B)
---@class Build_NumberLessOrEqual_C : NumberLesserOrEqual
Build_NumberLessOrEqual_C = {}
--- Returns true if A is less or equal to B (A <= B)
---@class Build_NumberLessOrEqual_C-Class : NumberLesserOrEqual-Class
Build_NumberLessOrEqual_C_Class = {}

--- 
---@class NumberLog : FGWiremodBuildable
NumberLog = {}
--- 
---@class NumberLog-Class : FGWiremodBuildable-Class
NumberLog_Class = {}

--- Logarithm
---@class Build_NumberLog_C : NumberLog
Build_NumberLog_C = {}
--- Logarithm
---@class Build_NumberLog_C-Class : NumberLog-Class
Build_NumberLog_C_Class = {}

--- 
---@class NumberLog10 : FGWiremodBuildable
NumberLog10 = {}
--- 
---@class NumberLog10-Class : FGWiremodBuildable-Class
NumberLog10_Class = {}

--- Log e(X)
---@class Build_NumberLog10_C : NumberLog10
Build_NumberLog10_C = {}
--- Log e(X)
---@class Build_NumberLog10_C-Class : NumberLog10-Class
Build_NumberLog10_C_Class = {}

--- 
---@class NumberModulo : FGWiremodBuildable
NumberModulo = {}
--- 
---@class NumberModulo-Class : FGWiremodBuildable-Class
NumberModulo_Class = {}

--- A%B
---@class Build_NumberModulo_C : NumberModulo
Build_NumberModulo_C = {}
--- A%B
---@class Build_NumberModulo_C-Class : NumberModulo-Class
Build_NumberModulo_C_Class = {}

--- 
---@class NumberPower : FGWiremodBuildable
NumberPower = {}
--- 
---@class NumberPower-Class : FGWiremodBuildable-Class
NumberPower_Class = {}

--- A^B
---@class Build_PowerNumber_C : NumberPower
Build_PowerNumber_C = {}
--- A^B
---@class Build_PowerNumber_C-Class : NumberPower-Class
Build_PowerNumber_C_Class = {}

--- 
---@class NumberRound : FGWiremodBuildable
NumberRound = {}
--- 
---@class NumberRound-Class : FGWiremodBuildable-Class
NumberRound_Class = {}

--- Rounds input to nearest integer
---@class Build_Round_C : NumberRound
Build_Round_C = {}
--- Rounds input to nearest integer
---@class Build_Round_C-Class : NumberRound-Class
Build_Round_C_Class = {}

--- 
---@class NumberSign : FGWiremodBuildable
NumberSign = {}
--- 
---@class NumberSign-Class : FGWiremodBuildable-Class
NumberSign_Class = {}

--- Returns -1 if A < 0, 0 if A is zero, and 1 if A > 0
---@class Build_Sign_C : NumberSign
Build_Sign_C = {}
--- Returns -1 if A < 0, 0 if A is zero, and 1 if A > 0
---@class Build_Sign_C-Class : NumberSign-Class
Build_Sign_C_Class = {}

--- 
---@class NumberSquareRoot : FGWiremodBuildable
NumberSquareRoot = {}
--- 
---@class NumberSquareRoot-Class : FGWiremodBuildable-Class
NumberSquareRoot_Class = {}

--- Returns square root of input
---@class Build_SquareRoot_C : NumberSquareRoot
Build_SquareRoot_C = {}
--- Returns square root of input
---@class Build_SquareRoot_C-Class : NumberSquareRoot-Class
Build_SquareRoot_C_Class = {}

--- 
---@class NumberToBool : FGWiremodBuildable
NumberToBool = {}
--- 
---@class NumberToBool-Class : FGWiremodBuildable-Class
NumberToBool_Class = {}

--- Converts number input to bool output.
--- If input is greater than or equal to 1 returns true, else returns false.
---@class Build_NumberToBool_C : NumberToBool
Build_NumberToBool_C = {}
--- Converts number input to bool output.
--- If input is greater than or equal to 1 returns true, else returns false.
---@class Build_NumberToBool_C-Class : NumberToBool-Class
Build_NumberToBool_C_Class = {}

--- 
---@class NumberToHexString : FGWiremodBuildable
NumberToHexString = {}
--- 
---@class NumberToHexString-Class : FGWiremodBuildable-Class
NumberToHexString_Class = {}

--- Converts number to hex string
---@class Build_NumberToHex_C : NumberToHexString
Build_NumberToHex_C = {}
--- Converts number to hex string
---@class Build_NumberToHex_C-Class : NumberToHexString-Class
Build_NumberToHex_C_Class = {}

--- 
---@class NumberToTime : FGWiremodBuildable
NumberToTime = {}
--- 
---@class NumberToTime-Class : FGWiremodBuildable-Class
NumberToTime_Class = {}

--- Converts input number to string that looks like a timer (HH:MM:SS)
---@class Build_NumberToTimeString_C : NumberToTime
Build_NumberToTimeString_C = {}
--- Converts input number to string that looks like a timer (HH:MM:SS)
---@class Build_NumberToTimeString_C-Class : NumberToTime-Class
Build_NumberToTimeString_C_Class = {}

--- 
---@class NumberTruncate : FGWiremodBuildable
NumberTruncate = {}
--- 
---@class NumberTruncate-Class : FGWiremodBuildable-Class
NumberTruncate_Class = {}

--- Removes the fractional part of a number without rounding it.
---@class Build_TruncateNumber_C : NumberTruncate
Build_TruncateNumber_C = {}
--- Removes the fractional part of a number without rounding it.
---@class Build_TruncateNumber_C-Class : NumberTruncate-Class
Build_TruncateNumber_C_Class = {}

--- 
---@class Oscilloscope : FGWiremodBuildable
Oscilloscope = {}
--- 
---@class Oscilloscope-Class : FGWiremodBuildable-Class
Oscilloscope_Class = {}

--- 
---@class PerlinNoise1D : FGWiremodBuildable
PerlinNoise1D = {}
--- 
---@class PerlinNoise1D-Class : FGWiremodBuildable-Class
PerlinNoise1D_Class = {}

--- Calculates output using perlin noise function.
---@class Build_PerlinNoise1D_C : PerlinNoise1D
Build_PerlinNoise1D_C = {}
--- Calculates output using perlin noise function.
---@class Build_PerlinNoise1D_C-Class : PerlinNoise1D-Class
Build_PerlinNoise1D_C_Class = {}

--- 
---@class PerlinNoise3D : FGWiremodBuildable
PerlinNoise3D = {}
--- 
---@class PerlinNoise3D-Class : FGWiremodBuildable-Class
PerlinNoise3D_Class = {}

--- Calculates output using perlin noise function but 3 times.
---@class Build_PerlinNoise3D_C : PerlinNoise3D
Build_PerlinNoise3D_C = {}
--- Calculates output using perlin noise function but 3 times.
---@class Build_PerlinNoise3D_C-Class : PerlinNoise3D-Class
Build_PerlinNoise3D_C_Class = {}

--- 
---@class Pi : FGWiremodBuildable
Pi = {}
--- 
---@class Pi-Class : FGWiremodBuildable-Class
Pi_Class = {}

--- Returns PI constant
---@class Build_PI_C : Pi
Build_PI_C = {}
--- Returns PI constant
---@class Build_PI_C-Class : Pi-Class
Build_PI_C_Class = {}

--- 
---@class Pixel : FGWiremodBuildable
Pixel = {}
--- 
---@class Pixel-Class : FGWiremodBuildable-Class
Pixel_Class = {}

--- Indicator light. Color and glow can be changed.
---@class Build_Pixel_C : Pixel
Build_Pixel_C = {}
--- Indicator light. Color and glow can be changed.
---@class Build_Pixel_C-Class : Pixel-Class
Build_Pixel_C_Class = {}

--- 
---@class BoolPixel : FGWiremodBuildable
BoolPixel = {}
--- 
---@class BoolPixel-Class : FGWiremodBuildable-Class
BoolPixel_Class = {}

--- Based on bool value, switches between 2 configurable colors.
---@class Build_BoolPixel_C : BoolPixel
Build_BoolPixel_C = {}
--- Based on bool value, switches between 2 configurable colors.
---@class Build_BoolPixel_C-Class : BoolPixel-Class
Build_BoolPixel_C_Class = {}

--- 
---@class PixelArtManager : FGWiremodBuildable
PixelArtManager = {}
--- 
---@class PixelArtManager-Class : FGWiremodBuildable-Class
PixelArtManager_Class = {}

--- Allows the player to draw pixel art with basic tools such as pencil, fill bucket, and eraser.
--- The drawing can be used to be displayed somewhere else (i.e. notificator custom image, texture renderer, or as an advanced sign image).
---@class Build_PixelArtManager_C : PixelArtManager
Build_PixelArtManager_C = {}
--- Allows the player to draw pixel art with basic tools such as pencil, fill bucket, and eraser.
--- The drawing can be used to be displayed somewhere else (i.e. notificator custom image, texture renderer, or as an advanced sign image).
---@class Build_PixelArtManager_C-Class : PixelArtManager-Class
Build_PixelArtManager_C_Class = {}

--- 
---@class PlayerSensor : FGWiremodBuildable
PlayerSensor = {}
--- 
---@class PlayerSensor-Class : FGWiremodBuildable-Class
PlayerSensor_Class = {}

--- Allows the user to select a player that the gate will output as an entity.
---@class Build_PlayerSensor_C : PlayerSensor
Build_PlayerSensor_C = {}
--- Allows the user to select a player that the gate will output as an entity.
---@class Build_PlayerSensor_C-Class : PlayerSensor-Class
Build_PlayerSensor_C_Class = {}

--- 
---@class ProximitySensor : FGWiremodBuildable
ProximitySensor = {}
--- 
---@class ProximitySensor-Class : FGWiremodBuildable-Class
ProximitySensor_Class = {}

--- Creates a field that captures any creatures or vehicles in its radius and outputs a list of entities.
--- Detects all entities (players, enemies, doggos, etc.) by default.
---@class Build_Proximity_C : ProximitySensor
Build_Proximity_C = {}
--- Creates a field that captures any creatures or vehicles in its radius and outputs a list of entities.
--- Detects all entities (players, enemies, doggos, etc.) by default.
---@class Build_Proximity_C-Class : ProximitySensor-Class
Build_Proximity_C_Class = {}

--- 
---@class QuadraticFormula : FGWiremodBuildable
QuadraticFormula = {}
--- 
---@class QuadraticFormula-Class : FGWiremodBuildable-Class
QuadraticFormula_Class = {}

--- You don't want to know what's going on inside of it.
---@class Build_QuadraticFormula_C : QuadraticFormula
Build_QuadraticFormula_C = {}
--- You don't want to know what's going on inside of it.
---@class Build_QuadraticFormula_C-Class : QuadraticFormula-Class
Build_QuadraticFormula_C_Class = {}

--- 
---@class RadiansToDegrees : FGWiremodBuildable
RadiansToDegrees = {}
--- 
---@class RadiansToDegrees-Class : FGWiremodBuildable-Class
RadiansToDegrees_Class = {}

--- Converts radians input to degrees
---@class Build_RadToDeg_C : RadiansToDegrees
Build_RadToDeg_C = {}
--- Converts radians input to degrees
---@class Build_RadToDeg_C-Class : RadiansToDegrees-Class
Build_RadToDeg_C_Class = {}

--- 
---@class RadiationSensor : FGWiremodBuildable
RadiationSensor = {}
--- 
---@class RadiationSensor-Class : FGWiremodBuildable-Class
RadiationSensor_Class = {}

--- Measures the radiation level in surrounding area.
--- Will detect radiation from inventories as well.
---@class Build_RadiationSensor_C : RadiationSensor
Build_RadiationSensor_C = {}
--- Measures the radiation level in surrounding area.
--- Will detect radiation from inventories as well.
---@class Build_RadiationSensor_C-Class : RadiationSensor-Class
Build_RadiationSensor_C_Class = {}

--- 
---@class RadioReceiver : FGWiremodBuildable
RadioReceiver = {}
--- 
---@class RadioReceiver-Class : FGWiremodBuildable-Class
RadioReceiver_Class = {}

--- Receives data sent by radio transmitters.
---@class Build_Radio_Receive_C : RadioReceiver
Build_Radio_Receive_C = {}
--- Receives data sent by radio transmitters.
---@class Build_Radio_Receive_C-Class : RadioReceiver-Class
Build_Radio_Receive_C_Class = {}

--- 
---@class RadioTransmitter : FGWiremodBuildable
RadioTransmitter = {}
--- 
---@class RadioTransmitter-Class : FGWiremodBuildable-Class
RadioTransmitter_Class = {}

--- Accepts any type and transmits it through the entire world.
--- Radio receivers can receive that data and use it.
---@class Build_Radio_Transmit_C : RadioTransmitter
Build_Radio_Transmit_C = {}
--- Accepts any type and transmits it through the entire world.
--- Radio receivers can receive that data and use it.
---@class Build_Radio_Transmit_C-Class : RadioTransmitter-Class
Build_Radio_Transmit_C_Class = {}

--- 
---@class RandomNumber : FGWiremodBuildable
RandomNumber = {}
--- 
---@class RandomNumber-Class : FGWiremodBuildable-Class
RandomNumber_Class = {}

--- Returns random number in range
---@class Build_RandomNumber_C : RandomNumber
Build_RandomNumber_C = {}
--- Returns random number in range
---@class Build_RandomNumber_C-Class : RandomNumber-Class
Build_RandomNumber_C_Class = {}

--- 
---@class RangerSensor : FGWiremodBuildable
RangerSensor = {}
--- 
---@class RangerSensor-Class : FGWiremodBuildable-Class
RangerSensor_Class = {}

--- Creates a laser that detects anything in it's way.
---@class Build_Ranger_C : RangerSensor
Build_Ranger_C = {}
--- Creates a laser that detects anything in it's way.
---@class Build_Ranger_C-Class : RangerSensor-Class
Build_Ranger_C_Class = {}

--- 
---@class RemapNumber : FGWiremodBuildable
RemapNumber = {}
--- 
---@class RemapNumber-Class : FGWiremodBuildable-Class
RemapNumber_Class = {}

--- Remaps number to a new range.
--- For example:
--- If input range is 0-1, and output range is 0-100, value 0.9 will become 90.
---@class Build_RemapValue_C : RemapNumber
Build_RemapValue_C = {}
--- Remaps number to a new range.
--- For example:
--- If input range is 0-1, and output range is 0-100, value 0.9 will become 90.
---@class Build_RemapValue_C-Class : RemapNumber-Class
Build_RemapValue_C_Class = {}

--- 
---@class RemoteControlReceiver : FGWiremodBuildable
RemoteControlReceiver = {}
--- 
---@class RemoteControlReceiver-Class : FGWiremodBuildable-Class
RemoteControlReceiver_Class = {}

--- Paired with remote control tool, allows the user to control their circuits from any distance.
---@class Build_RemoteControlReceiver_C : RemoteControlReceiver
Build_RemoteControlReceiver_C = {}
--- Paired with remote control tool, allows the user to control their circuits from any distance.
---@class Build_RemoteControlReceiver_C-Class : RemoteControlReceiver-Class
Build_RemoteControlReceiver_C_Class = {}

--- 
---@class RepeatString : FGWiremodBuildable
RepeatString = {}
--- 
---@class RepeatString-Class : FGWiremodBuildable-Class
RepeatString_Class = {}

--- Repeats input string <Num> times
---@class Build_RepeatString_C : RepeatString
Build_RepeatString_C = {}
--- Repeats input string <Num> times
---@class Build_RepeatString_C-Class : RepeatString-Class
Build_RepeatString_C_Class = {}

--- 
---@class ReplaceString : FGWiremodBuildable
ReplaceString = {}
--- 
---@class ReplaceString-Class : FGWiremodBuildable-Class
ReplaceString_Class = {}

--- Returns the string with replaced text.
---@class Build_Replace_C : ReplaceString
Build_Replace_C = {}
--- Returns the string with replaced text.
---@class Build_Replace_C-Class : ReplaceString-Class
Build_Replace_C_Class = {}

--- 
---@class ResourceSinkInfo : FGWiremodBuildable
ResourceSinkInfo = {}
--- 
---@class ResourceSinkInfo-Class : FGWiremodBuildable-Class
ResourceSinkInfo_Class = {}

--- Outputs available info about resource sink.
---@class Build_ResourceSinkInfo_C : ResourceSinkInfo
Build_ResourceSinkInfo_C = {}
--- Outputs available info about resource sink.
---@class Build_ResourceSinkInfo_C-Class : ResourceSinkInfo-Class
Build_ResourceSinkInfo_C_Class = {}

--- 
---@class ReverseString : FGWiremodBuildable
ReverseString = {}
--- 
---@class ReverseString-Class : FGWiremodBuildable-Class
ReverseString_Class = {}

--- Reverses the input string
---@class Build_ReverseString_C : ReverseString
Build_ReverseString_C = {}
--- Reverses the input string
---@class Build_ReverseString_C-Class : ReverseString-Class
Build_ReverseString_C_Class = {}

--- 
---@class RisingEdgeDelay : FGWiremodBuildable
RisingEdgeDelay = {}
--- 
---@class RisingEdgeDelay-Class : FGWiremodBuildable-Class
RisingEdgeDelay_Class = {}

--- When bool value goes from false to true, this gate will delay that by X seconds.
--- If the value goes to false while the delay is ongoing, the timer will be reset.
---@class Build_RisingEdgeDelay_C : RisingEdgeDelay
Build_RisingEdgeDelay_C = {}
--- When bool value goes from false to true, this gate will delay that by X seconds.
--- If the value goes to false while the delay is ongoing, the timer will be reset.
---@class Build_RisingEdgeDelay_C-Class : RisingEdgeDelay-Class
Build_RisingEdgeDelay_C_Class = {}

--- 
---@class RisingEdgeDetector : FGWiremodBuildable
RisingEdgeDetector = {}
--- 
---@class RisingEdgeDetector-Class : FGWiremodBuildable-Class
RisingEdgeDetector_Class = {}

--- Detects when input goes from low to high and outputs a signal for a brief moment
---@class Build_RisingEdgeDetector_C : RisingEdgeDetector
Build_RisingEdgeDetector_C = {}
--- Detects when input goes from low to high and outputs a signal for a brief moment
---@class Build_RisingEdgeDetector_C-Class : RisingEdgeDetector-Class
Build_RisingEdgeDetector_C_Class = {}

--- 
---@class SignalSelector : FGWiremodBuildable
SignalSelector = {}
--- 
---@class SignalSelector-Class : FGWiremodBuildable-Class
SignalSelector_Class = {}

--- Accepts a number that determines how many outputs the gate should have, and another number that sets the output at that index to <Orange>true</>
---@class Build_SignalSelector_C : SignalSelector
Build_SignalSelector_C = {}
--- Accepts a number that determines how many outputs the gate should have, and another number that sets the output at that index to <Orange>true</>
---@class Build_SignalSelector_C-Class : SignalSelector-Class
Build_SignalSelector_C_Class = {}

--- 
---@class SoundEmitter : FGWiremodBuildable
SoundEmitter = {}
--- 
---@class SoundEmitter-Class : FGWiremodBuildable-Class
SoundEmitter_Class = {}

--- Generates sine wave noise
---@class Build_SoundEmitter_C : SoundEmitter
Build_SoundEmitter_C = {}
--- Generates sine wave noise
---@class Build_SoundEmitter_C-Class : SoundEmitter-Class
Build_SoundEmitter_C_Class = {}

--- 
---@class SplitString : FGWiremodBuildable
SplitString = {}
--- 
---@class SplitString-Class : FGWiremodBuildable-Class
SplitString_Class = {}

--- Splits string to an array of strings based on the separator.
---@class Build_SplitString_C : SplitString
Build_SplitString_C = {}
--- Splits string to an array of strings based on the separator.
---@class Build_SplitString_C-Class : SplitString-Class
Build_SplitString_C_Class = {}

--- 
---@class SRLatch : FGWiremodBuildable
SRLatch = {}
--- 
---@class SRLatch-Class : FGWiremodBuildable-Class
SRLatch_Class = {}

--- If S was set to true then Out is set to true and ~Out is set to false.
--- If R was set to true then Out is set to false and ~Out is set to true. 
--- If both inputs are true both outputs are false.
---@class Build_SR_Latch_C : SRLatch
Build_SR_Latch_C = {}
--- If S was set to true then Out is set to true and ~Out is set to false.
--- If R was set to true then Out is set to false and ~Out is set to true. 
--- If both inputs are true both outputs are false.
---@class Build_SR_Latch_C-Class : SRLatch-Class
Build_SR_Latch_C_Class = {}

--- 
---@class SRLatchWithEnable : FGWiremodBuildable
SRLatchWithEnable = {}
--- 
---@class SRLatchWithEnable-Class : FGWiremodBuildable-Class
SRLatchWithEnable_Class = {}

--- When "EN" is true, the gate processes inputs:
--- If S was set to true then Out is set to true and ~Out is set to false.
--- If R was set to true then Out is set to false and ~Out is set to true. 
--- If both inputs are true both outputs are false.
---@class Build_SR_Latch_EN_C : SRLatchWithEnable
Build_SR_Latch_EN_C = {}
--- When "EN" is true, the gate processes inputs:
--- If S was set to true then Out is set to true and ~Out is set to false.
--- If R was set to true then Out is set to false and ~Out is set to true. 
--- If both inputs are true both outputs are false.
---@class Build_SR_Latch_EN_C-Class : SRLatchWithEnable-Class
Build_SR_Latch_EN_C_Class = {}

--- 
---@class StepInterpolation : FGWiremodBuildable
StepInterpolation = {}
--- 
---@class StepInterpolation-Class : FGWiremodBuildable-Class
StepInterpolation_Class = {}

--- Simple step interpolation based on alpha.
--- Alpha is in a range 0-1, where 0 is value A, 0.5 is in the middle between A and B, and 1 is value B.
---@class Build_StepInterpolation_C : StepInterpolation
Build_StepInterpolation_C = {}
--- Simple step interpolation based on alpha.
--- Alpha is in a range 0-1, where 0 is value A, 0.5 is in the middle between A and B, and 1 is value B.
---@class Build_StepInterpolation_C-Class : StepInterpolation-Class
Build_StepInterpolation_C_Class = {}

--- 
---@class StringByte : FGWiremodBuildable
StringByte = {}
--- 
---@class StringByte-Class : FGWiremodBuildable-Class
StringByte_Class = {}

--- Gets byte representation of input char.
---@class Build_ToByte_C : StringByte
Build_ToByte_C = {}
--- Gets byte representation of input char.
---@class Build_ToByte_C-Class : StringByte-Class
Build_ToByte_C_Class = {}

--- 
---@class StringEquals : FGWiremodBuildable
StringEquals = {}
--- 
---@class StringEquals-Class : FGWiremodBuildable-Class
StringEquals_Class = {}

--- Returns true if input strings are equal
---@class Build_EqualString_C : StringEquals
Build_EqualString_C = {}
--- Returns true if input strings are equal
---@class Build_EqualString_C-Class : StringEquals-Class
Build_EqualString_C_Class = {}

--- 
---@class StringLength : FGWiremodBuildable
StringLength = {}
--- 
---@class StringLength-Class : FGWiremodBuildable-Class
StringLength_Class = {}

--- Returns string's length.
---@class Build_StringLength_C : StringLength
Build_StringLength_C = {}
--- Returns string's length.
---@class Build_StringLength_C-Class : StringLength-Class
Build_StringLength_C_Class = {}

--- 
---@class StringToBool : FGWiremodBuildable
StringToBool = {}
--- 
---@class StringToBool-Class : FGWiremodBuildable-Class
StringToBool_Class = {}

--- Converts string to bool.
--- If the input is equal to "true", "yes", "1" (case insensitive) - returns true.
--- Else returns false.
---@class Build_StringToBool_C : StringToBool
Build_StringToBool_C = {}
--- Converts string to bool.
--- If the input is equal to "true", "yes", "1" (case insensitive) - returns true.
--- Else returns false.
---@class Build_StringToBool_C-Class : StringToBool-Class
Build_StringToBool_C_Class = {}

--- 
---@class StringToColor : FGWiremodBuildable
StringToColor = {}
--- 
---@class StringToColor-Class : FGWiremodBuildable-Class
StringToColor_Class = {}

--- Converts string input to color output
---@class Build_StringToColor_C : StringToColor
Build_StringToColor_C = {}
--- Converts string input to color output
---@class Build_StringToColor_C-Class : StringToColor-Class
Build_StringToColor_C_Class = {}

--- 
---@class StringToNumber : FGWiremodBuildable
StringToNumber = {}
--- 
---@class StringToNumber-Class : FGWiremodBuildable-Class
StringToNumber_Class = {}

--- Converts string input to number output
---@class Build_StringToNumber_C : StringToNumber
Build_StringToNumber_C = {}
--- Converts string input to number output
---@class Build_StringToNumber_C-Class : StringToNumber-Class
Build_StringToNumber_C_Class = {}

--- 
---@class StringToVector : FGWiremodBuildable
StringToVector = {}
--- 
---@class StringToVector-Class : FGWiremodBuildable-Class
StringToVector_Class = {}

--- Converts string input to vector
---@class Build_StringToVector_C : StringToVector
Build_StringToVector_C = {}
--- Converts string input to vector
---@class Build_StringToVector_C-Class : StringToVector-Class
Build_StringToVector_C_Class = {}

--- 
---@class Substring : FGWiremodBuildable
Substring = {}
--- 
---@class Substring-Class : FGWiremodBuildable-Class
Substring_Class = {}

--- Returns the substring of input string.
---@class Build_Substring_C : Substring
Build_Substring_C = {}
--- Returns the substring of input string.
---@class Build_Substring_C-Class : Substring-Class
Build_Substring_C_Class = {}

--- 
---@class SwatchController : FGWiremodBuildable
SwatchController = {}
--- 
---@class SwatchController-Class : FGWiremodBuildable-Class
SwatchController_Class = {}

--- Allows to change colors in customization swatches used for buildables and equipment.
--- 
--- WARNING: Slot, Primary Color and Secondary Color must be connected, otherwise the changes won't apply!
---@class Build_GlobalColorSwatchController_C : SwatchController
Build_GlobalColorSwatchController_C = {}
--- Allows to change colors in customization swatches used for buildables and equipment.
--- 
--- WARNING: Slot, Primary Color and Secondary Color must be connected, otherwise the changes won't apply!
---@class Build_GlobalColorSwatchController_C-Class : SwatchController-Class
Build_GlobalColorSwatchController_C_Class = {}

--- 
---@class CustomSwatchController : FGWiremodBuildable
CustomSwatchController = {}
--- 
---@class CustomSwatchController-Class : FGWiremodBuildable-Class
CustomSwatchController_Class = {}

--- Allows to change the "Custom" swatch colors for each player.
--- 
--- WARNING: Player, Primary Color and Secondary Color must be connected, otherwise the changes won't apply!
---@class Build_CustomColorSwatchController_C : CustomSwatchController
Build_CustomColorSwatchController_C = {}
--- Allows to change the "Custom" swatch colors for each player.
--- 
--- WARNING: Player, Primary Color and Secondary Color must be connected, otherwise the changes won't apply!
---@class Build_CustomColorSwatchController_C-Class : CustomSwatchController-Class
Build_CustomColorSwatchController_C_Class = {}

--- 
---@class TextureRenderer : FGWiremodBuildable
TextureRenderer = {}
--- 
---@class TextureRenderer-Class : FGWiremodBuildable-Class
TextureRenderer_Class = {}

--- Accepts texture, displays it in the world with configurable position, rotation, and scale.
---@class Build_ImageRenderer_C : TextureRenderer
Build_ImageRenderer_C = {}
--- Accepts texture, displays it in the world with configurable position, rotation, and scale.
---@class Build_ImageRenderer_C-Class : TextureRenderer-Class
Build_ImageRenderer_C_Class = {}

--- 
---@class TFlipFlop : FGWiremodBuildable
TFlipFlop = {}
--- 
---@class TFlipFlop-Class : FGWiremodBuildable-Class
TFlipFlop_Class = {}

--- When CLK (clock type signal) is true, and T is true, inverts the output.
---@class Build_T_FlipFlop_C : TFlipFlop
Build_T_FlipFlop_C = {}
--- When CLK (clock type signal) is true, and T is true, inverts the output.
---@class Build_T_FlipFlop_C-Class : TFlipFlop-Class
Build_T_FlipFlop_C_Class = {}

--- 
---@class Timer : FGWiremodBuildable
Timer = {}
--- 
---@class Timer-Class : FGWiremodBuildable-Class
Timer_Class = {}

--- Timer can be used to trigger something after a delay or used as a clock.
---@class Build_Timer_C : Timer
Build_Timer_C = {}
--- Timer can be used to trigger something after a delay or used as a clock.
---@class Build_Timer_C-Class : Timer-Class
Build_Timer_C_Class = {}

--- 
---@class Transistor : FGWiremodBuildable
Transistor = {}
--- 
---@class Transistor-Class : FGWiremodBuildable-Class
Transistor_Class = {}

--- Saves the input value of any type if "Accept Value" is true, changes the output type accordingly.
--- 
--- WARNING: CANNOT STORE INVENTORY OR POWER GRID!
--- 
---@class Build_Transistor_C : Transistor
Build_Transistor_C = {}
--- Saves the input value of any type if "Accept Value" is true, changes the output type accordingly.
--- 
--- WARNING: CANNOT STORE INVENTORY OR POWER GRID!
--- 
---@class Build_Transistor_C-Class : Transistor-Class
Build_Transistor_C_Class = {}

--- 
---@class TrimString : FGWiremodBuildable
TrimString = {}
--- 
---@class TrimString-Class : FGWiremodBuildable-Class
TrimString_Class = {}

--- Trims the whitespace characters at the start and end of a string
---@class Build_TrimString_C : TrimString
Build_TrimString_C = {}
--- Trims the whitespace characters at the start and end of a string
---@class Build_TrimString_C-Class : TrimString-Class
Build_TrimString_C_Class = {}

--- 
---@class VectorAdd : FGWiremodBuildable
VectorAdd = {}
--- 
---@class VectorAdd-Class : FGWiremodBuildable-Class
VectorAdd_Class = {}

--- Adds two vectors together
---@class Build_VectorAdd_C : VectorAdd
Build_VectorAdd_C = {}
--- Adds two vectors together
---@class Build_VectorAdd_C-Class : VectorAdd-Class
Build_VectorAdd_C_Class = {}

--- 
---@class VectorCrossProduct : FGWiremodBuildable
VectorCrossProduct = {}
--- 
---@class VectorCrossProduct-Class : FGWiremodBuildable-Class
VectorCrossProduct_Class = {}

--- Returns cross product of 2 vectors
---@class Build_CrossProduct_C : VectorCrossProduct
Build_CrossProduct_C = {}
--- Returns cross product of 2 vectors
---@class Build_CrossProduct_C-Class : VectorCrossProduct-Class
Build_CrossProduct_C_Class = {}

--- 
---@class VectorDistance : FGWiremodBuildable
VectorDistance = {}
--- 
---@class VectorDistance-Class : FGWiremodBuildable-Class
VectorDistance_Class = {}

--- Returns the distance between two vectors
---@class Build_VectorDistance_C : VectorDistance
Build_VectorDistance_C = {}
--- Returns the distance between two vectors
---@class Build_VectorDistance_C-Class : VectorDistance-Class
Build_VectorDistance_C_Class = {}

--- 
---@class VectorDivide : FGWiremodBuildable
VectorDivide = {}
--- 
---@class VectorDivide-Class : FGWiremodBuildable-Class
VectorDivide_Class = {}

--- Divides vector A by vector B
--- X1/X2 -> X
--- Y1/Y2 -> Y
--- Z1/Z2 -> Z
---@class Build_VectorDivide_C : VectorDivide
Build_VectorDivide_C = {}
--- Divides vector A by vector B
--- X1/X2 -> X
--- Y1/Y2 -> Y
--- Z1/Z2 -> Z
---@class Build_VectorDivide_C-Class : VectorDivide-Class
Build_VectorDivide_C_Class = {}

--- 
---@class VectorDotProduct : FGWiremodBuildable
VectorDotProduct = {}
--- 
---@class VectorDotProduct-Class : FGWiremodBuildable-Class
VectorDotProduct_Class = {}

--- Returns dot product of 2 vectors
---@class Build_DotProduct_C : VectorDotProduct
Build_DotProduct_C = {}
--- Returns dot product of 2 vectors
---@class Build_DotProduct_C-Class : VectorDotProduct-Class
Build_DotProduct_C_Class = {}

--- 
---@class VectorEquals : FGWiremodBuildable
VectorEquals = {}
--- 
---@class VectorEquals-Class : FGWiremodBuildable-Class
VectorEquals_Class = {}

--- Checks if 2 vectors are equal (error tolerance is 0.0 by default)
---@class Build_VectorEqual_C : VectorEquals
Build_VectorEqual_C = {}
--- Checks if 2 vectors are equal (error tolerance is 0.0 by default)
---@class Build_VectorEqual_C-Class : VectorEquals-Class
Build_VectorEqual_C_Class = {}

--- 
---@class VectorGridSnap : FGWiremodBuildable
VectorGridSnap = {}
--- 
---@class VectorGridSnap-Class : FGWiremodBuildable-Class
VectorGridSnap_Class = {}

--- Snaps input vector to a specified grid size. 
--- 
--- I.e. if input vector is 21, 23.4, 25 and grid size is 5, output vector will be 20, 25, 25.
---@class Build_VectorGridSnap_C : VectorGridSnap
Build_VectorGridSnap_C = {}
--- Snaps input vector to a specified grid size. 
--- 
--- I.e. if input vector is 21, 23.4, 25 and grid size is 5, output vector will be 20, 25, 25.
---@class Build_VectorGridSnap_C-Class : VectorGridSnap-Class
Build_VectorGridSnap_C_Class = {}

--- 
---@class VectorMultiply : FGWiremodBuildable
VectorMultiply = {}
--- 
---@class VectorMultiply-Class : FGWiremodBuildable-Class
VectorMultiply_Class = {}

--- Multiplies 2 vectors together.
--- X1 * X2 -> X
--- Y1 * Y2 -> Y
--- Z1 * Z2 -> Z
---@class Build_VectorMultiply_C : VectorMultiply
Build_VectorMultiply_C = {}
--- Multiplies 2 vectors together.
--- X1 * X2 -> X
--- Y1 * Y2 -> Y
--- Z1 * Z2 -> Z
---@class Build_VectorMultiply_C-Class : VectorMultiply-Class
Build_VectorMultiply_C_Class = {}

--- 
---@class VectorNumberDivide : FGWiremodBuildable
VectorNumberDivide = {}
--- 
---@class VectorNumberDivide-Class : FGWiremodBuildable-Class
VectorNumberDivide_Class = {}

--- Divides vector A by number B
--- X / B -> X
--- Y / B -> Y
--- Z / B -> Z
---@class Build_VectorNumberDivide_C : VectorNumberDivide
Build_VectorNumberDivide_C = {}
--- Divides vector A by number B
--- X / B -> X
--- Y / B -> Y
--- Z / B -> Z
---@class Build_VectorNumberDivide_C-Class : VectorNumberDivide-Class
Build_VectorNumberDivide_C_Class = {}

--- 
---@class VectorNumberMultiply : FGWiremodBuildable
VectorNumberMultiply = {}
--- 
---@class VectorNumberMultiply-Class : FGWiremodBuildable-Class
VectorNumberMultiply_Class = {}

--- Multiplies vector A by number B
--- X * B -> X
--- Y * B -> Y
--- Z * B -> Z
---@class Build_VectorNumberMultiply_C : VectorNumberMultiply
Build_VectorNumberMultiply_C = {}
--- Multiplies vector A by number B
--- X * B -> X
--- Y * B -> Y
--- Z * B -> Z
---@class Build_VectorNumberMultiply_C-Class : VectorNumberMultiply-Class
Build_VectorNumberMultiply_C_Class = {}

--- 
---@class VectorSubtract : FGWiremodBuildable
VectorSubtract = {}
--- 
---@class VectorSubtract-Class : FGWiremodBuildable-Class
VectorSubtract_Class = {}

--- Subtracts vectors
---@class Build_VectorSubtract_C : VectorSubtract
Build_VectorSubtract_C = {}
--- Subtracts vectors
---@class Build_VectorSubtract_C-Class : VectorSubtract-Class
Build_VectorSubtract_C_Class = {}

--- 
---@class VectorToColor : FGWiremodBuildable
VectorToColor = {}
--- 
---@class VectorToColor-Class : FGWiremodBuildable-Class
VectorToColor_Class = {}

--- Converts vector input to color output
---@class Build_VectorToColor_C : VectorToColor
Build_VectorToColor_C = {}
--- Converts vector input to color output
---@class Build_VectorToColor_C-Class : VectorToColor-Class
Build_VectorToColor_C_Class = {}

--- 
---@class ButtonBase_C : FGWiremodBuildable
ButtonBase_C = {}
--- 
---@class ButtonBase_C-Class : FGWiremodBuildable-Class
ButtonBase_C_Class = {}

--- Outputs true as long as the user is holding the Use key.
---@class Build_Button_C : ButtonBase_C
Build_Button_C = {}
--- Outputs true as long as the user is holding the Use key.
---@class Build_Button_C-Class : ButtonBase_C-Class
Build_Button_C_Class = {}

--- Switches output value on interact
---@class Build_ButtonToggle_C : ButtonBase_C
Build_ButtonToggle_C = {}
--- Switches output value on interact
---@class Build_ButtonToggle_C-Class : ButtonBase_C-Class
Build_ButtonToggle_C_Class = {}

--- Allows any user to input text, outputs a signal if the text matches one of the texts set by keyboard owner.
---@class Build_Keyboard_C : FGWiremodBuildable
Build_Keyboard_C = {}
--- Allows any user to input text, outputs a signal if the text matches one of the texts set by keyboard owner.
---@class Build_Keyboard_C-Class : FGWiremodBuildable-Class
Build_Keyboard_C_Class = {}

--- Allows the user to enter a numeric code. 
--- Keypad owner can change the password.
---@class Build_Keypad_C : FGWiremodBuildable
Build_Keypad_C = {}
--- Allows the user to enter a numeric code. 
--- Keypad owner can change the password.
---@class Build_Keypad_C-Class : FGWiremodBuildable-Class
Build_Keypad_C_Class = {}

--- Slider with adjustable min and max values.
---@class Build_AdjustableSlider_C : FGWiremodBuildable
Build_AdjustableSlider_C = {}
--- Slider with adjustable min and max values.
---@class Build_AdjustableSlider_C-Class : FGWiremodBuildable-Class
Build_AdjustableSlider_C_Class = {}

--- Accepts URL string, attempts to download image from it.
--- Works with local files as well - use file:/// protocol.
--- Only works if the image is png, jpg, or bmp!
---@class Build_TextureDownloader_C : FGWiremodBuildable
Build_TextureDownloader_C = {}
--- Accepts URL string, attempts to download image from it.
--- Works with local files as well - use file:/// protocol.
--- Only works if the image is png, jpg, or bmp!
---@class Build_TextureDownloader_C-Class : FGWiremodBuildable-Class
Build_TextureDownloader_C_Class = {}

--- Outputs time and date (local time) from your computer.
---@class Build_OSTimeDate_C : FGWiremodBuildable
Build_OSTimeDate_C = {}
--- Outputs time and date (local time) from your computer.
---@class Build_OSTimeDate_C-Class : FGWiremodBuildable-Class
Build_OSTimeDate_C_Class = {}

--- Detects any damage dealt by a player or creature.
---@class Build_HitDetector_C : FGWiremodBuildable
Build_HitDetector_C = {}
--- Detects any damage dealt by a player or creature.
---@class Build_HitDetector_C-Class : FGWiremodBuildable-Class
Build_HitDetector_C_Class = {}

--- Outputs info about the HUB
---@class Build_HUBInfo_C : FGWiremodBuildable
Build_HUBInfo_C = {}
--- Outputs info about the HUB
---@class Build_HUBInfo_C-Class : FGWiremodBuildable-Class
Build_HUBInfo_C_Class = {}

--- Outputs available info about MAM research.
---@class Build_MAMResearchInfo_C : FGWiremodBuildable
Build_MAMResearchInfo_C = {}
--- Outputs available info about MAM research.
---@class Build_MAMResearchInfo_C-Class : FGWiremodBuildable-Class
Build_MAMResearchInfo_C_Class = {}

--- Outputs information about world weather.
---@class Build_GameWeather_C : FGWiremodBuildable
Build_GameWeather_C = {}
--- Outputs information about world weather.
---@class Build_GameWeather_C-Class : FGWiremodBuildable-Class
Build_GameWeather_C_Class = {}

--- 
---@class CircuitryBlueprintConnectionProxy : Buildable
CircuitryBlueprintConnectionProxy = {}
--- 
---@class CircuitryBlueprintConnectionProxy-Class : Buildable-Class
CircuitryBlueprintConnectionProxy_Class = {}

--- This Pole allows you to connect multiple network components to it via the network cables.
--- 
--- This is a essential building for spreading your computer network into the whole landscape.
--- 
--- It basically allows you to digitalize the world!
---@class Build_NetworkPole_C : Buildable
Build_NetworkPole_C = {}
--- This Pole allows you to connect multiple network components to it via the network cables.
--- 
--- This is a essential building for spreading your computer network into the whole landscape.
--- 
--- It basically allows you to digitalize the world!
---@class Build_NetworkPole_C-Class : Buildable-Class
Build_NetworkPole_C_Class = {}

--- This FicsIt-Networks Wall Plug allows you to distribute a network circuit more easily near buildings and indoors.
---@class Build_NetworkWallPlug_C : Buildable
Build_NetworkWallPlug_C = {}
--- This FicsIt-Networks Wall Plug allows you to distribute a network circuit more easily near buildings and indoors.
---@class Build_NetworkWallPlug_C-Class : Buildable-Class
Build_NetworkWallPlug_C_Class = {}

--- This FicsIt-Networks Small Wall Plug allows you to connect the thin network cable only usable with MCH panels and other small components.
--- 
--- You can then connect Normal/Large Network Cables to those Small Network Plugs to be able to connect your MCP Panels and such to a computer.
---@class Build_SmallNetworkWallPlug_C : Buildable
Build_SmallNetworkWallPlug_C = {}
--- This FicsIt-Networks Small Wall Plug allows you to connect the thin network cable only usable with MCH panels and other small components.
--- 
--- You can then connect Normal/Large Network Cables to those Small Network Plugs to be able to connect your MCP Panels and such to a computer.
---@class Build_SmallNetworkWallPlug_C-Class : Buildable-Class
Build_SmallNetworkWallPlug_C_Class = {}

--- Attaches to Walls.
--- Useful for routing Conveyor Belts more precisely and over long distances.
---@class Build_ConveyorPoleWall_C : Buildable
Build_ConveyorPoleWall_C = {}
--- Attaches to Walls.
--- Useful for routing Conveyor Belts more precisely and over long distances.
---@class Build_ConveyorPoleWall_C-Class : Buildable-Class
Build_ConveyorPoleWall_C_Class = {}

--- See Display Name
---@class Build_Blueprint_C : Buildable
Build_Blueprint_C = {}
--- See Display Name
---@class Build_Blueprint_C-Class : Buildable-Class
Build_Blueprint_C_Class = {}

--- Allows you to manually craft a wide range of different parts. 
--- These parts can then be used to construct various factory buildings, vehicles, and equipment.
---@class Build_WorkBenchIntegrated_C : Buildable
Build_WorkBenchIntegrated_C = {}
--- Allows you to manually craft a wide range of different parts. 
--- These parts can then be used to construct various factory buildings, vehicles, and equipment.
---@class Build_WorkBenchIntegrated_C-Class : Buildable-Class
Build_WorkBenchIntegrated_C_Class = {}

--- This FicsIt-Networks Wall Plug allows you to pass a network circuit through a wall, allowing for more ease of use of the network cables.
---@class Build_NetworkWallPlug_Double_C : Buildable
Build_NetworkWallPlug_Double_C = {}
--- This FicsIt-Networks Wall Plug allows you to pass a network circuit through a wall, allowing for more ease of use of the network cables.
---@class Build_NetworkWallPlug_Double_C-Class : Buildable-Class
Build_NetworkWallPlug_Double_C_Class = {}

--- This large modular I/O control panel allows you to attach multiple different modules on to it and use them as I/O to control you programms.
--- 
--- You can connect it to the FicsIt-Network.
--- 
--- Important to note is that every module is it's own component, that means if you want to listen to the signals, you will need to listen to each of them individually.
---@class LargeControlPanel : Buildable
LargeControlPanel = {}
--- Returns all modules placed on the panel.
---@return Object[] modules All the modules placed on the panel.
---@type (fun(self:LargeControlPanel):(modules:Object[]))|ReflectionFunction
function LargeControlPanel:getModules() end
--- Returns the module placed at the given location on the panel.
---@param x integer The x location of the module on the panel. (0 = left)
---@param y integer The y location of the module on the panel. (0 = bottom)
---@return Actor module The module you want to get. Null if no module was placed.
---@type (fun(self:LargeControlPanel,x:integer,y:integer):(module:Actor))|ReflectionFunction
function LargeControlPanel:getModule(x, y) end
--- This large modular I/O control panel allows you to attach multiple different modules on to it and use them as I/O to control you programms.
--- 
--- You can connect it to the FicsIt-Network.
--- 
--- Important to note is that every module is it's own component, that means if you want to listen to the signals, you will need to listen to each of them individually.
---@class LargeControlPanel-Class : Buildable-Class
LargeControlPanel_Class = {}

--- Enclosure for 1 command points
---@class ModulePanel : Buildable
ModulePanel = {}
--- 
---@param Y integer 
---@return Actor Module 
---@type (fun(self:ModulePanel,Y:integer):(Module:Actor))|ReflectionFunction
function ModulePanel:getYModule(Y) end
--- 
---@param X integer 
---@return Actor Module 
---@type (fun(self:ModulePanel,X:integer):(Module:Actor))|ReflectionFunction
function ModulePanel:getXModule(X) end
--- Returns all modules placed on the panel.
---@return Object[] modules All the modules placed on the panel.
---@type (fun(self:ModulePanel):(modules:Object[]))|ReflectionFunction
function ModulePanel:getModules() end
--- Returns the module placed at the given location on the panel.
---@param x integer The x position of the command point, starting from the non-cable end. Indexing starts at 0.
---@param y integer The y position  of the command point, starting from the non-cable end. Indexing starts at 0.
---@return Actor module The module you want to get. Null if no module was placed.
---@type (fun(self:ModulePanel,x:integer,y:integer):(module:Actor))|ReflectionFunction
function ModulePanel:getModule(x, y) end
--- Enclosure for 1 command points
---@class ModulePanel-Class : Buildable-Class
ModulePanel_Class = {}

--- Micro Control Panel for 1 command point, center placement.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel1_Center_C : ModulePanel
Build_MicroPanel1_Center_C = {}
--- Micro Control Panel for 1 command point, center placement.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel1_Center_C-Class : ModulePanel-Class
Build_MicroPanel1_Center_C_Class = {}

--- Enclosure for 6 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel6_C : ModulePanel
Build_MicroPanel6_C = {}
--- Enclosure for 6 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel6_C-Class : ModulePanel-Class
Build_MicroPanel6_C_Class = {}

--- Enclosure for 1 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel1_C : ModulePanel
Build_MicroPanel1_C = {}
--- Enclosure for 1 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel1_C-Class : ModulePanel-Class
Build_MicroPanel1_C_Class = {}

--- Enclosure for 2 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel2_C : ModulePanel
Build_MicroPanel2_C = {}
--- Enclosure for 2 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel2_C-Class : ModulePanel-Class
Build_MicroPanel2_C_Class = {}

--- Enclosure for 3 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel3_C : ModulePanel
Build_MicroPanel3_C = {}
--- Enclosure for 3 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class Build_MicroPanel3_C-Class : ModulePanel-Class
Build_MicroPanel3_C_Class = {}

--- This large vertical modular I/O control panel allows you to attach multiple different modules on to it and use them as I/O to control your programms.
--- 
--- You can connect it to the FicsIt-Network.
--- 
--- Important to note is that every module is it's own component, that means if you want to listen to the signals, you will need to listen to each of them individually.
---@class LargeVerticalControlPanel : Buildable
LargeVerticalControlPanel = {}
--- Returns all modules placed on the panels.
---@return Object[] modules All the modules placed on the panels.
---@type (fun(self:LargeVerticalControlPanel):(modules:Object[]))|ReflectionFunction
function LargeVerticalControlPanel:getModules() end
--- Returns the module placed at the given location on the given panel.
---@param x integer The x location of the module on the panel. (0 = left)
---@param y integer The y location of the module on the panel. (0 = bottom)
---@param panel integer The panel you want to get the module from.
---@return Actor module The module you want to get. Null if no module was placed.
---@type (fun(self:LargeVerticalControlPanel,x:integer,y:integer,panel:integer):(module:Actor))|ReflectionFunction
function LargeVerticalControlPanel:getModule(x, y, panel) end
--- This large vertical modular I/O control panel allows you to attach multiple different modules on to it and use them as I/O to control your programms.
--- 
--- You can connect it to the FicsIt-Network.
--- 
--- Important to note is that every module is it's own component, that means if you want to listen to the signals, you will need to listen to each of them individually.
---@class LargeVerticalControlPanel-Class : Buildable-Class
LargeVerticalControlPanel_Class = {}

--- Attaches to Walls, allowing Hypertubes to pass through.
---@class Build_HyperTubeWallHole_C : Buildable
Build_HyperTubeWallHole_C = {}
--- Attaches to Walls, allowing Hypertubes to pass through.
---@class Build_HyperTubeWallHole_C-Class : Buildable-Class
Build_HyperTubeWallHole_C_Class = {}

--- Attaches to Walls.
--- Supports Hypertubes, allowing them to stretch over longer distances.
---@class Build_HyperTubeWallSupport_C : Buildable
Build_HyperTubeWallSupport_C = {}
--- Attaches to Walls.
--- Supports Hypertubes, allowing them to stretch over longer distances.
---@class Build_HyperTubeWallSupport_C-Class : Buildable-Class
Build_HyperTubeWallSupport_C_Class = {}

--- Provides a good vantage point to facilitate factory construction.
---@class Build_LookoutTower_C : Buildable
Build_LookoutTower_C = {}
--- Provides a good vantage point to facilitate factory construction.
---@class Build_LookoutTower_C-Class : Buildable-Class
Build_LookoutTower_C_Class = {}

--- Attaches to Walls.
--- Used to connect Pipelines over longer distances.
---@class Build_PipelineSupportWall_C : Buildable
Build_PipelineSupportWall_C = {}
--- Attaches to Walls.
--- Used to connect Pipelines over longer distances.
---@class Build_PipelineSupportWall_C-Class : Buildable-Class
Build_PipelineSupportWall_C_Class = {}

--- Attaches to Walls, allowing Pipelines to pass through.
---@class Build_PipelineSupportWallHole_C : Buildable
Build_PipelineSupportWallHole_C = {}
--- Attaches to Walls, allowing Pipelines to pass through.
---@class Build_PipelineSupportWallHole_C-Class : Buildable-Class
Build_PipelineSupportWallHole_C_Class = {}

--- Allows you to manually craft a wide range of different parts. 
--- These parts can then be used to construct various factory buildings, vehicles, and equipment.
---@class Build_WorkBench_C : Buildable
Build_WorkBench_C = {}
--- Allows you to manually craft a wide range of different parts. 
--- These parts can then be used to construct various factory buildings, vehicles, and equipment.
---@class Build_WorkBench_C-Class : Buildable-Class
Build_WorkBench_C_Class = {}

--- Used to manually craft equipment.
---@class Build_Workshop_C : Buildable
Build_Workshop_C = {}
--- Used to manually craft equipment.
---@class Build_Workshop_C-Class : Buildable-Class
Build_Workshop_C_Class = {}

--- This special-delivery gigantic FICSMAS Tree can be decorated by progressing through the FICSMAS Holiday Event Tree in the MAM.
---@class Build_XmassTree_C : Buildable
Build_XmassTree_C = {}
--- This special-delivery gigantic FICSMAS Tree can be decorated by progressing through the FICSMAS Holiday Event Tree in the MAM.
---@class Build_XmassTree_C-Class : Buildable-Class
Build_XmassTree_C_Class = {}

--- Can be attached to Walls. Pretty.
---@class Build_WreathDecor_C : Buildable
Build_WreathDecor_C = {}
--- Can be attached to Walls. Pretty.
---@class Build_WreathDecor_C-Class : Buildable-Class
Build_WreathDecor_C_Class = {}

--- 
---@class Build_TetrominoGame_Computer_C : Buildable
Build_TetrominoGame_Computer_C = {}
--- 
---@class Build_TetrominoGame_Computer_C-Class : Buildable-Class
Build_TetrominoGame_Computer_C_Class = {}

--- This class holds information and references about a trains (a collection of multiple railroad vehicles) and its timetable f.e.
---@class Train : Actor
---@field public isPlayerDriven boolean True if the train is currently player driven.
---@field public isSelfDriving boolean True if the train is currently self driving.
---@field public selfDrivingError integer The last self driving error.<br>0 = No Error<br>1 = No Power<br>2 = No Time Table<br>3 = Invalid Next Stop<br>4 = Invalid Locomotive Placement<br>5 = No Path
---@field public hasTimeTable boolean True if the train has currently a time table.
---@field public dockState integer The current docking state of the train.
---@field public isDocked boolean True if the train is currently docked.
Train = {}
--- Returns the name of this train.
---@return string name The name of this train.
---@type (fun(self:Train):(name:string))|ReflectionFunction
function Train:getName() end
--- Allows to set the name of this train.
---@param name string The new name of this trian.
---@type (fun(self:Train,name:string))|ReflectionFunction
function Train:setName(name) end
--- Returns the track graph of which this train is part of.
---@return TrackGraph track The track graph of which this train is part of.
---@type (fun(self:Train):(track:TrackGraph))|ReflectionFunction
function Train:getTrackGraph() end
--- Allows to set if the train should be self driving or not.
---@param selfDriving boolean True if the train should be self driving.
---@return Future_Train_setSelfDriving
---@type (fun(self:Train,selfDriving:boolean))|ReflectionFunction
function Train:setSelfDriving(selfDriving) end
---@class Future_Train_setSelfDriving : Future
Future_Train_setSelfDriving = {}
---@type fun(self:Future_Train_setSelfDriving)
function Future_Train_setSelfDriving:await() end
---@type fun(self:Future_Train_setSelfDriving)
function Future_Train_setSelfDriving:get() end
---@type fun(self:Future_Train_setSelfDriving):boolean
function Future_Train_setSelfDriving:canGet() end
--- Returns the master locomotive that is part of this train.
---@return RailroadVehicle master The master locomotive of this train.
---@type (fun(self:Train):(master:RailroadVehicle))|ReflectionFunction
function Train:getMaster() end
--- Returns the timetable of this train.
---@return TimeTable timeTable The timetable of this train.
---@type (fun(self:Train):(timeTable:TimeTable))|ReflectionFunction
function Train:getTimeTable() end
--- Creates and returns a new timetable for this train.
---@return Future_Train_newTimeTable
---@type (fun(self:Train):(Future_Train_newTimeTable))|ReflectionFunction
function Train:newTimeTable() end
---@class Future_Train_newTimeTable : Future
Future_Train_newTimeTable = {}
---@type fun(self:Future_Train_newTimeTable):(timeTable:TimeTable)
function Future_Train_newTimeTable:await() end
---@type fun(self:Future_Train_newTimeTable):(timeTable:TimeTable)
function Future_Train_newTimeTable:get() end
---@type fun(self:Future_Train_newTimeTable):boolean
function Future_Train_newTimeTable:canGet() end
--- Returns the first railroad vehicle that is part of this train.
---@return RailroadVehicle first The first railroad vehicle that is part of this train.
---@type (fun(self:Train):(first:RailroadVehicle))|ReflectionFunction
function Train:getFirst() end
--- Returns the last railroad vehicle that is part of this train.
---@return RailroadVehicle last The last railroad vehicle that is part of this train.
---@type (fun(self:Train):(last:RailroadVehicle))|ReflectionFunction
function Train:getLast() end
--- Trys to dock the train to the station it is currently at.
---@type (fun(self:Train))|ReflectionFunction
function Train:dock() end
--- Returns a list of all the vehicles this train has.
---@return RailroadVehicle[] vehicles A list of all the vehicles this train has.
---@type (fun(self:Train):(vehicles:RailroadVehicle[]))|ReflectionFunction
function Train:getVehicles() end
--- This class holds information and references about a trains (a collection of multiple railroad vehicles) and its timetable f.e.
---@class Train-Class : Actor-Class
Train_Class = {}

--- A Object that represents a whole power circuit.
---@class PowerCircuit : Object
---@field public production number The amount of power produced by the whole circuit in the last tick.
---@field public consumption number The power consumption of the whole circuit in thge last tick.
---@field public capacity number The power capacity of the whole network in the last tick. (The max amount of power available in the last tick)
---@field public batteryInput number The power that gone into batteries in the last tick.
---@field public maxPowerConsumption number The maximum consumption of power in the last tick.
---@field public isFuesed boolean True if the fuse in the network triggered.
---@field public hasBatteries boolean True if the power circuit has batteries connected to it.
---@field public batteryCapacity number The energy capacity all batteries of the network combined provide.
---@field public batteryStore number The amount of energy currently stored in all battereies of the network combined.
---@field public batteryStorePercent number The fill status in percent of all battereies of the network combined.
---@field public batteryTimeUntilFull number The time in seconds until every battery in the network is filled.
---@field public batteryTimeUntilEmpty number The time in seconds until every battery in the network is empty.
---@field public batteryIn number The amount of energy that currently gets stored in every battery of the whole network.
---@field public batteryOut number The amount of energy that currently discharges from every battery in the whole network.
PowerCircuit = {}
--- A Object that represents a whole power circuit.
---@class PowerCircuit-Class : Object-Class
PowerCircuit_Class = {}

--- Contains the time table information of train.
---@class TimeTable : Actor
---@field public numStops integer The current number of stops in the time table.
TimeTable = {}
--- Adds a stop to the time table.
---@param index integer The zero-based index at which the stop should get added.
---@param station RailroadStation The railroad station at which the stop should happen.
---@param ruleSet TrainDockingRuleSet The docking rule set that descibes when the train will depart from the station.
---@return boolean added True if the stop got sucessfully added to the time table.
---@type (fun(self:TimeTable,index:integer,station:RailroadStation,ruleSet:TrainDockingRuleSet):(added:boolean))|ReflectionFunction
function TimeTable:addStop(index, station, ruleSet) end
--- Removes the stop with the given index from the time table.
---@param index integer The zero-based index at which the stop should get added.
---@type (fun(self:TimeTable,index:integer))|ReflectionFunction
function TimeTable:removeStop(index) end
--- Returns a list of all the stops this time table has
---@return TimeTableStop[] stops A list of time table stops this time table has.
---@type (fun(self:TimeTable):(stops:TimeTableStop[]))|ReflectionFunction
function TimeTable:getStops() end
--- Allows to empty and fill the stops of this time table with the given list of new stops.
---@param stops TimeTableStop[] The new time table stops.
---@return boolean gotSet True if the stops got sucessfully set.
---@type (fun(self:TimeTable,stops:TimeTableStop[]):(gotSet:boolean))|ReflectionFunction
function TimeTable:setStops(stops) end
--- Allows to check if the given stop index is valid.
---@param index integer The zero-based stop index you want to check its validity.
---@return boolean valid True if the stop index is valid.
---@type (fun(self:TimeTable,index:integer):(valid:boolean))|ReflectionFunction
function TimeTable:isValidStop(index) end
--- Returns the stop at the given index.
---@param index integer The zero-based index of the stop you want to get.
---@return TimeTableStop stop The time table stop at the given index.
---@type (fun(self:TimeTable,index:integer):(stop:TimeTableStop))|ReflectionFunction
function TimeTable:getStop(index) end
--- Allows to override a stop already in the time table.
---@param index integer The zero-based index of the stop you want to override.
---@param stop TimeTableStop The time table stop you want to override with.
---@return boolean success True if setting was successful, false if not, f.e. invalid index.
---@type (fun(self:TimeTable,index:integer,stop:TimeTableStop):(success:boolean))|ReflectionFunction
function TimeTable:setStop(index, stop) end
--- Sets the stop, to which the train trys to drive to right now.
---@param index integer The zero-based index of the stop the train should drive to right now.
---@type (fun(self:TimeTable,index:integer))|ReflectionFunction
function TimeTable:setCurrentStop(index) end
--- Sets the current stop to the next stop in the time table.
---@type (fun(self:TimeTable))|ReflectionFunction
function TimeTable:incrementCurrentStop() end
--- Returns the index of the stop the train drives to right now.
---@return integer index The zero-based index of the stop the train tries to drive to right now.
---@type (fun(self:TimeTable):(index:integer))|ReflectionFunction
function TimeTable:getCurrentStop() end
--- Contains the time table information of train.
---@class TimeTable-Class : Actor-Class
TimeTable_Class = {}

--- The list of targets/path-waypoints a autonomous vehicle can drive
---@class TargetList : Actor
TargetList = {}
--- Returns the target struct at with the given index in the target list.
---@return TargetPoint target The TargetPoint-Struct with the given index in the target list.
---@type (fun(self:TargetList):(target:TargetPoint))|ReflectionFunction
function TargetList:getTarget() end
--- Removes the target with the given index from the target list.
---@param index integer The index of the target point you want to remove from the target list.
---@type (fun(self:TargetList,index:integer))|ReflectionFunction
function TargetList:removeTarget(index) end
--- Adds the given target point struct at the end of the target list.
---@param target TargetPoint The target point you want to add.
---@type (fun(self:TargetList,target:TargetPoint))|ReflectionFunction
function TargetList:addTarget(target) end
--- Allows to set the target at the given index to the given target point struct.
---@param index integer The index of the target point you want to update with the given target point struct.
---@param target TargetPoint The new target point struct for the given index.
---@type (fun(self:TargetList,index:integer,target:TargetPoint))|ReflectionFunction
function TargetList:setTarget(index, target) end
--- Returns a list of target point structs of all the targets in the target point list.
---@return TargetPoint[] targets A list of target point structs containing all the targets of the target point list.
---@type (fun(self:TargetList):(targets:TargetPoint[]))|ReflectionFunction
function TargetList:getTargets() end
--- Removes all targets from the target point list and adds the given array of target point structs to the empty target point list.
---@param targets TargetPoint[] A list of target point structs you want to place into the empty target point list.
---@return Future_TargetList_setTargets
---@type (fun(self:TargetList,targets:TargetPoint[]))|ReflectionFunction
function TargetList:setTargets(targets) end
---@class Future_TargetList_setTargets : Future
Future_TargetList_setTargets = {}
---@type fun(self:Future_TargetList_setTargets)
function Future_TargetList_setTargets:await() end
---@type fun(self:Future_TargetList_setTargets)
function Future_TargetList_setTargets:get() end
---@type fun(self:Future_TargetList_setTargets):boolean
function Future_TargetList_setTargets:canGet() end
--- The list of targets/path-waypoints a autonomous vehicle can drive
---@class TargetList-Class : Actor-Class
TargetList_Class = {}

--- The dimensional depot, remote storage or also known as central storage.
---@class DimensionalDepot : Actor
---@field public centralStorageItemStackLimit integer The stack limit of the central storage.
---@field public centralStorageTimeToUpload number The amount of time it takes to upload an item to the central storage.
DimensionalDepot = {}
--- Returns the number of items of a given type that is stored within the central storage.
---@param itemType ItemType-Class The type of the item you want to get the number of items in the central storage from.
---@return integer number The number of items in the central storage.
---@type (fun(self:DimensionalDepot,itemType:ItemType-Class):(number:integer))|ReflectionFunction
function DimensionalDepot:getItemCountFromCentralStorage(itemType) end
--- Return a list of all items the central storage currently contains.
---@return ItemAmount[] items The list of items that the central storage currently contains.
---@type (fun(self:DimensionalDepot):(items:ItemAmount[]))|ReflectionFunction
function DimensionalDepot:getAllItemsFromCentralStorage() end
--- Returns true if any items of the given type can be uploaded to the central storage.
---@param itemType ItemType-Class The type of the item you want to check if it can be uploaded.
---@return boolean canUpload True if the given item type can be uploaded to the central storage.
---@type (fun(self:DimensionalDepot,itemType:ItemType-Class):(canUpload:boolean))|ReflectionFunction
function DimensionalDepot:canUploadItemsToCentralStorage(itemType) end
--- Returns the maxiumum number of items of a given type you can upload to the central storage.
---@param itemType ItemType-Class The type of the item you want to check if it can be uploaded.
---@return integer number The maximum number of items you can upload.
---@type (fun(self:DimensionalDepot,itemType:ItemType-Class):(number:integer))|ReflectionFunction
function DimensionalDepot:getCentralStorageItemLimit(itemType) end
--- The dimensional depot, remote storage or also known as central storage.
---@class DimensionalDepot-Class : Actor-Class
DimensionalDepot_Class = {}

--- The type of an item (iron plate, iron rod, leaves)
---@class ItemType : Object
ItemType = {}
--- The type of an item (iron plate, iron rod, leaves)
---@class ItemType-Class : Object-Class
---@field public form integer The matter state of this resource.<br>1: Solid<br>2: Liquid<br>3: Gas<br>4: Heat
---@field public energy number How much energy this resource provides if used as fuel.
---@field public radioactiveDecay number The amount of radiation this item radiates.
---@field public name string The name of the item.
---@field public description string The description of this item.
---@field public max integer The maximum stack size of this item.
---@field public canBeDiscarded boolean True if this item can be discarded.
---@field public category ItemCategory-Class The category in which this item is in.
---@field public fluidColor Color The color of this fluid.
ItemType_Class = {}

--- 
---@class FINMediaSubsystem : Actor
FINMediaSubsystem = {}
--- 
---@param TextureReference string 
---@type (fun(self:FINMediaSubsystem,TextureReference:string))|ReflectionFunction
function FINMediaSubsystem:loadTexture(TextureReference) end
--- 
---@param TextureReference string 
---@return boolean ReturnValue 
---@type (fun(self:FINMediaSubsystem,TextureReference:string):(ReturnValue:boolean))|ReflectionFunction
function FINMediaSubsystem:isTextureLoading(TextureReference) end
--- 
---@param TextureReference string 
---@return boolean ReturnValue 
---@type (fun(self:FINMediaSubsystem,TextureReference:string):(ReturnValue:boolean))|ReflectionFunction
function FINMediaSubsystem:isTextureLoaded(TextureReference) end
--- 
---@param PageSize integer 
---@param Page integer 
---@return IconData[] ReturnValue 
---@type (fun(self:FINMediaSubsystem,PageSize:integer,Page:integer):(ReturnValue:IconData[]))|ReflectionFunction
function FINMediaSubsystem:getGameIcons(PageSize, Page) end
--- Tries to find an game icon like the ones you use for signs.
---@param IconName string 
---@return IconData ReturnValue 
---@type (fun(self:FINMediaSubsystem,IconName:string):(ReturnValue:IconData))|ReflectionFunction
function FINMediaSubsystem:findGameIcon(IconName) end
--- 
---@class FINMediaSubsystem-Class : Actor-Class
FINMediaSubsystem_Class = {}

--- The category of some items.
---@class ItemCategory : Object
ItemCategory = {}
--- The category of some items.
---@class ItemCategory-Class : Object-Class
---@field public name string The name of the category.
ItemCategory_Class = {}

--- A struct that holds information about a recipe in its class. Means don't use it as object, use it as class type!
---@class Recipe : Object
Recipe = {}
--- A struct that holds information about a recipe in its class. Means don't use it as object, use it as class type!
---@class Recipe-Class : Object-Class
---@field public name string The name of this recipe.
---@field public duration number The duration how much time it takes to cycle the recipe once.
Recipe_Class = {}
--- Returns a array of item amounts, this recipe returns (outputs) when the recipe is processed once.
---@return ItemAmount[] products The products of this recipe.
---@type (fun(self:Recipe-Class):(products:ItemAmount[]))|ReflectionFunction
function Recipe_Class:getProducts() end
--- Returns a array of item amounts, this recipe needs (input) so the recipe can be processed.
---@return ItemAmount[] ingredients The ingredients of this recipe.
---@type (fun(self:Recipe-Class):(ingredients:ItemAmount[]))|ReflectionFunction
function Recipe_Class:getIngredients() end

--- Describes the type of a sign.
---@class SignType : Object
SignType = {}
--- Describes the type of a sign.
---@class SignType-Class : Object-Class
---@field public dimensions Vector2D The canvas dimensions of this sign.
SignType_Class = {}
--- Returns the default foreground/background/auxiliary colors of this sign type.
---@return Color foreground The foreground color
---@return Color background The background color
---@return Color auxiliary The auxiliary color
---@type (fun(self:SignType-Class):(foreground:Color,background:Color,auxiliary:Color))|ReflectionFunction
function SignType_Class:getColors() end
--- Returns a list of all sign prefabs this sign can use.
---@return SignPrefab-Class[] prefabs The sign prefabs this sign can use
---@type (fun(self:SignType-Class):(prefabs:SignPrefab-Class[]))|ReflectionFunction
function SignType_Class:getPrefabs() end
--- Returns a list of element names and their default text values.
---@return string[] textElementsDefaultValues A list of default values for the text elements of this type.
---@type (fun(self:SignType-Class):(textElementsDefaultValues:string[]))|ReflectionFunction
function SignType_Class:getTextElements() end
--- Returns a list of element names and their default icon values.
---@return Object[] iconElementsDefaultValues A list of default values for the icon elements of this type.
---@type (fun(self:SignType-Class):(iconElementsDefaultValues:Object[]))|ReflectionFunction
function SignType_Class:getIconElements() end

--- The base class for all things of the reflection system.
---@class ReflectionBase : Object
---@field public name string The internal name.
---@field public displayName string The display name used in UI which might be localized.
---@field public description string The description of this base.
ReflectionBase = {}
--- The base class for all things of the reflection system.
---@class ReflectionBase-Class : Object-Class
ReflectionBase_Class = {}

--- A Reflection object that holds information about properties and parameters.
---@class Property : ReflectionBase
---@field public dataType integer The data type of this property.<br>0: nil, 1: bool, 2: int, 3: float, 4: str, 5: object, 6: class, 7: trace, 8: struct, 9: array, 10: anything
---@field public flags integer The property bit flag register defining some behaviour of it.<br><br>Bits and their meaing (least significant bit first):<br>Is this property a member attribute.<br>Is this property read only.<br>Is this property a parameter.<br>Is this property a output paramter.<br>Is this property a return value.<br>Can this property get accessed in syncrounus runtime.<br>Can this property can get accessed in parallel runtime.<br>Can this property get accessed in asynchronus runtime.<br>This property is a class attribute.
Property = {}
--- A Reflection object that holds information about properties and parameters.
---@class Property-Class : ReflectionBase-Class
Property_Class = {}

--- A reflection object representing a array property.
---@class ArrayProperty : Property
ArrayProperty = {}
--- Returns the inner type of this array.
---@return Property inner The inner type of this array.
---@type (fun(self:ArrayProperty):(inner:Property))|ReflectionFunction
function ArrayProperty:getInner() end
--- A reflection object representing a array property.
---@class ArrayProperty-Class : Property-Class
ArrayProperty_Class = {}

--- A reflection object representing a class property.
---@class ClassProperty : Property
ClassProperty = {}
--- Returns the subclass type of this class. Meaning, the stored classes need to be of this type.
---@return Class subclass The subclass of this class property.
---@type (fun(self:ClassProperty):(subclass:Class))|ReflectionFunction
function ClassProperty:getSubclass() end
--- A reflection object representing a class property.
---@class ClassProperty-Class : Property-Class
ClassProperty_Class = {}

--- A reflection object representing a object property.
---@class ObjectProperty : Property
ObjectProperty = {}
--- Returns the subclass type of this object. Meaning, the stored objects need to be of this type.
---@return Class subclass The subclass of this object.
---@type (fun(self:ObjectProperty):(subclass:Class))|ReflectionFunction
function ObjectProperty:getSubclass() end
--- A reflection object representing a object property.
---@class ObjectProperty-Class : Property-Class
ObjectProperty_Class = {}

--- A reflection object representing a struct property.
---@class StructProperty : Property
StructProperty = {}
--- Returns the subclass type of this struct. Meaning, the stored structs need to be of this type.
---@return Struct subclass The subclass of this struct.
---@type (fun(self:StructProperty):(subclass:Struct))|ReflectionFunction
function StructProperty:getSubclass() end
--- A reflection object representing a struct property.
---@class StructProperty-Class : Property-Class
StructProperty_Class = {}

--- A reflection object representing a trace property.
---@class TraceProperty : Property
TraceProperty = {}
--- Returns the subclass type of this trace. Meaning, the stored traces need to be of this type.
---@return Class subclass The subclass of this trace.
---@type (fun(self:TraceProperty):(subclass:Class))|ReflectionFunction
function TraceProperty:getSubclass() end
--- A reflection object representing a trace property.
---@class TraceProperty-Class : Property-Class
TraceProperty_Class = {}

--- Reflection Object that holds information about structures.
---@class Struct : ReflectionBase
---@field public isConstructable boolean True if this struct can be constructed by the user directly.
Struct = {}
--- Returns the parent type of this type.
---@return Future_Struct_getParent
---@type (fun(self:Struct):(Future_Struct_getParent))|ReflectionFunction
function Struct:getParent() end
---@class Future_Struct_getParent : Future
Future_Struct_getParent = {}
---@type fun(self:Future_Struct_getParent):(parent:Class)
function Future_Struct_getParent:await() end
---@type fun(self:Future_Struct_getParent):(parent:Class)
function Future_Struct_getParent:get() end
---@type fun(self:Future_Struct_getParent):boolean
function Future_Struct_getParent:canGet() end
--- Returns all the properties of this type.
---@return Property[] properties The properties this specific type implements (excluding properties from parent types).
---@type (fun(self:Struct):(properties:Property[]))|ReflectionFunction
function Struct:getProperties() end
--- Returns all the properties of this and parent types.
---@return Property[] properties The properties this type implements including properties from parent types.
---@type (fun(self:Struct):(properties:Property[]))|ReflectionFunction
function Struct:getAllProperties() end
--- Returns all the functions of this type.
---@return Function[] functions The functions this specific type implements (excluding properties from parent types).
---@type (fun(self:Struct):(functions:Function[]))|ReflectionFunction
function Struct:getFunctions() end
--- Returns all the functions of this and parent types.
---@return Property[] functions The functions this type implements including functions from parent types.
---@type (fun(self:Struct):(functions:Property[]))|ReflectionFunction
function Struct:getAllFunctions() end
--- Allows to check if this struct is a child struct of the given struct or the given struct it self.
---@param parent Struct The parent struct you want to check if this struct is a child of.
---@return boolean isChild True if this struct is a child of parent.
---@type (fun(self:Struct,parent:Struct):(isChild:boolean))|ReflectionFunction
function Struct:isChildOf(parent) end
--- Reflection Object that holds information about structures.
---@class Struct-Class : ReflectionBase-Class
Struct_Class = {}

--- Object that contains all information about a type.
---@class Class : Struct
Class = {}
--- Returns all the signals of this type.
---@return Signal[] signals The signals this specific type implements (excluding properties from parent types).
---@type (fun(self:Class):(signals:Signal[]))|ReflectionFunction
function Class:getSignals() end
--- Returns all the signals of this and its parent types.
---@return Signal[] signals The signals this type and all it parents implement.
---@type (fun(self:Class):(signals:Signal[]))|ReflectionFunction
function Class:getAllSignals() end
--- Object that contains all information about a type.
---@class Class-Class : Struct-Class
Class_Class = {}

--- A reflection object representing a function.
---@class Function : ReflectionBase
---@field public flags integer The function bit flag register defining some behaviour of it.<br><br>Bits and their meaing (least significant bit first):<br>Is this function has a variable amount of input parameters.<br>Can this function get called in syncrounus runtime.<br>Can this function can get called in parallel runtime.<br>Can this function get called in asynchronus runtime.<br>Is this function a member function.<br>The function is a class function.<br>The function is a static function.<br>The function has a variable amount of return values.
Function = {}
--- Returns all the parameters of this function.
---@return Property[] parameters The parameters this function.
---@type (fun(self:Function):(parameters:Property[]))|ReflectionFunction
function Function:getParameters() end
--- A reflection object representing a function.
---@class Function-Class : ReflectionBase-Class
Function_Class = {}

--- A reflection object representing a signal.
---@class Signal : ReflectionBase
---@field public isVarArgs boolean True if this signal has a variable amount of arguments.
Signal = {}
--- Returns all the parameters of this signal.
---@return Property[] parameters The parameters this signal.
---@type (fun(self:Signal):(parameters:Property[]))|ReflectionFunction
function Signal:getParameters() end
--- A reflection object representing a signal.
---@class Signal-Class : ReflectionBase-Class
Signal_Class = {}

--- 
---@class FGBuildableDecor : Buildable
FGBuildableDecor = {}
--- 
---@class FGBuildableDecor-Class : Buildable-Class
FGBuildableDecor_Class = {}

--- 
---@class FGBuildableSpeedSign : Buildable
FGBuildableSpeedSign = {}
--- 
---@class FGBuildableSpeedSign-Class : Buildable-Class
FGBuildableSpeedSign_Class = {}

--- 
---@class FGBuildableWindTurbine : Factory
FGBuildableWindTurbine = {}
--- 
---@class FGBuildableWindTurbine-Class : Factory-Class
FGBuildableWindTurbine_Class = {}

--- Contains three cordinates (X, Y, Z) to describe a position or movement vector in 3D Space
---@class Vector
---@field public x number The X coordinate component
---@field public y number The Y coordinate component
---@field public z number The Z coordinate component
---@operator add(Vector):Vector
---@operator sub(Vector):Vector
---@operator unm():Vector
---@operator mul(Vector):Vector
---@operator mul(number):Vector
Vector = {}
--- Contains three cordinates (X, Y, Z) to describe a position or movement vector in 3D Space
---@class Vector-Class
Vector_Class = {}

--- Contains two cordinates (X, Y) to describe a position or movement vector in 2D Space
---@class Vector2D
---@field public x number The X coordinate component
---@field public y number The Y coordinate component
---@operator add(Vector2D):Vector2D
---@operator sub(Vector2D):Vector2D
---@operator unm():Vector2D
---@operator mul(Vector2D):number
---@operator mul(number):Vector2D
Vector2D = {}
--- Contains two cordinates (X, Y) to describe a position or movement vector in 2D Space
---@class Vector2D-Class
Vector2D_Class = {}

--- A structure that holds a rgba color value
---@class Color
---@field public r number The red portion of the color.
---@field public g number The green portion of the color.
---@field public b number The blue portion of the color.
---@field public a number The alpha (opacity) portion of the color.
---@operator add(Color):Color
---@operator unm():Color
---@operator sub(Color):Color
---@operator mul(number):Vector
---@operator div(number):Vector
Color = {}
--- A structure that holds a rgba color value
---@class Color-Class
Color_Class = {}

--- Contains rotation information about a object in 3D spaces using 3 rotation axis in a gimble.
---@class Rotator
---@field public pitch number The pitch component
---@field public yaw number The yaw component
---@field public roll number The roll component
---@operator add(Rotator):Rotator
---@operator sub(Rotator):Rotator
Rotator = {}
--- Contains rotation information about a object in 3D spaces using 3 rotation axis in a gimble.
---@class Rotator-Class
Rotator_Class = {}

--- A Vector containing four values.
---@class Vector4
---@field public x number The first value in the Vector4.
---@field public y number The second value in the Vector4.
---@field public z number The third value in the Vector4.
---@field public w number The fourth value in the Vector4.
Vector4 = {}
--- A Vector containing four values.
---@class Vector4-Class
Vector4_Class = {}

--- A struct containing four floats that describe a margin around a box (like a 9-patch).
---@class Margin
---@field public left number The left edge of the rectangle.
---@field public right number The right edge of the rectangle.
---@field public top number The top edge of the rectangle.
---@field public bottom number The bottom edge of the rectangle.
Margin = {}
--- A struct containing four floats that describe a margin around a box (like a 9-patch).
---@class Margin-Class
Margin_Class = {}

--- A structure that holds item information.
---@class Item
---@field public type ItemType-Class The type of the item.
Item = {}
--- A structure that holds item information.
---@class Item-Class
Item_Class = {}

--- A structure that holds item information and item amount to represent an item stack.
---@class ItemStack
---@field public count integer The count of items.
---@field public item Item The item information of this stack.
ItemStack = {}
--- A structure that holds item information and item amount to represent an item stack.
---@class ItemStack-Class
ItemStack_Class = {}

--- A struct that holds a pair of amount and item type.
---@class ItemAmount
---@field public amount integer The amount of items.
---@field public type ItemType-Class The type of the items.
ItemAmount = {}
--- A struct that holds a pair of amount and item type.
---@class ItemAmount-Class
ItemAmount_Class = {}

--- A struct containing information about a game icon (used in f.e. signs).
---@class IconData
---@field public isValid boolean True if the icon data refers to an valid icon
---@field public id integer The icon ID.
---@field public ref string The media reference of this icon.
---@field public animated boolean True if the icon is animated.
---@field public iconName string The name of the icon.
---@field public iconType string The type of the icon.<br>0 = Building<br>1 = Part<br>2 = Equipment<br>3 = Monochrome<br>4 = Material<br>5 = Custom<br>6 = Map Stamp
---@field public hidden boolean True if the icon is hidden in the selection.
---@field public searchOnly boolean True if the icon will be shown in selection only if searched for directly by name.
IconData = {}
--- A struct containing information about a game icon (used in f.e. signs).
---@class IconData-Class
IconData_Class = {}

--- Contains infromation about the rules that descibe when a trian should depart from a station
---@class TrainDockingRuleSet
---@field public definition integer 0 = Load/Unload Once, 1 = Fully Load/Unload
---@field public duration number The amount of time the train will dock at least.
---@field public isDurationAndRule boolean True if the duration of the train stop and the other rules have to be applied.
TrainDockingRuleSet = {}
--- Returns the types of items that will be loaded.
---@return ItemType-Class[] filters The item filter array
---@type (fun(self:TrainDockingRuleSet):(filters:ItemType-Class[]))|ReflectionFunction
function TrainDockingRuleSet:getLoadFilters() end
--- Sets the types of items that will be loaded.
---@param filters ItemType-Class[] The item filter array
---@type (fun(self:TrainDockingRuleSet,filters:ItemType-Class[]))|ReflectionFunction
function TrainDockingRuleSet:setLoadFilters(filters) end
--- Returns the types of items that will be unloaded.
---@return ItemType-Class[] filters The item filter array
---@type (fun(self:TrainDockingRuleSet):(filters:ItemType-Class[]))|ReflectionFunction
function TrainDockingRuleSet:getUnloadFilters() end
--- Sets the types of items that will be loaded.
---@param filters ItemType-Class[] The item filter array
---@type (fun(self:TrainDockingRuleSet,filters:ItemType-Class[]))|ReflectionFunction
function TrainDockingRuleSet:setUnloadFilters(filters) end
--- Contains infromation about the rules that descibe when a trian should depart from a station
---@class TrainDockingRuleSet-Class
TrainDockingRuleSet_Class = {}

--- This structure stores all data that defines what a sign displays.
---@class PrefabSignData
---@field public layout Object-Class The object that actually displayes the layout
---@field public foreground Color The foreground Color.
---@field public background Color The background Color.
---@field public emissive number The emissiveness of the sign.
---@field public auxiliary Color The auxiliary Color.
---@field public signType SignType-Class The type of sign this prefab fits to.
PrefabSignData = {}
--- Returns all text elements and their values.
---@return string[] textElements The element names for all text elements.
---@return string[] textElementValues The values for all text elements.
---@type (fun(self:PrefabSignData):(textElements:string[],textElementValues:string[]))|ReflectionFunction
function PrefabSignData:getTextElements() end
--- Returns all icon elements and their values.
---@return string[] iconElements The element names for all icon elements.
---@return integer[] iconElementValues The values for all icon elements.
---@type (fun(self:PrefabSignData):(iconElements:string[],iconElementValues:integer[]))|ReflectionFunction
function PrefabSignData:getIconElements() end
--- Sets all text elements and their values.
---@param textElements string[] The element names for all text elements.
---@param textElementValues string[] The values for all text elements.
---@type (fun(self:PrefabSignData,textElements:string[],textElementValues:string[]))|ReflectionFunction
function PrefabSignData:setTextElements(textElements, textElementValues) end
--- Sets all icon elements and their values.
---@param iconElements string[] The element names for all icon elements.
---@param iconElementValues integer[] The values for all icon elements.
---@type (fun(self:PrefabSignData,iconElements:string[],iconElementValues:integer[]))|ReflectionFunction
function PrefabSignData:setIconElements(iconElements, iconElementValues) end
--- Sets a text element with the given element name.
---@param elementName string The name of the text element
---@param value string The value of the text element
---@type (fun(self:PrefabSignData,elementName:string,value:string))|ReflectionFunction
function PrefabSignData:setTextElement(elementName, value) end
--- Sets a icon element with the given element name.
---@param elementName string The name of the icon element
---@param value integer The value of the icon element
---@type (fun(self:PrefabSignData,elementName:string,value:integer))|ReflectionFunction
function PrefabSignData:setIconElement(elementName, value) end
--- Gets a text element with the given element name.
---@param elementName string The name of the text element
---@return integer value The value of the text element
---@type (fun(self:PrefabSignData,elementName:string):(value:integer))|ReflectionFunction
function PrefabSignData:getTextElement(elementName) end
--- Gets a icon element with the given element name.
---@param elementName string The name of the icon element
---@return integer value The value of the icon element
---@type (fun(self:PrefabSignData,elementName:string):(value:integer))|ReflectionFunction
function PrefabSignData:getIconElement(elementName) end
--- This structure stores all data that defines what a sign displays.
---@class PrefabSignData-Class
PrefabSignData_Class = {}

--- An entry in the Computer Log.
---@class LogEntry
---@field public content string The Message-Content contained within the log entry.
---@field public timestamp string The timestamp at which the log entry got logged.
---@field public verbosity integer The verbosity of the log entry.
LogEntry = {}
--- Creates a formatted string representation of this log entry.
---@return string result The resulting formatted string
---@type (fun(self:LogEntry):(result:string))|ReflectionFunction
function LogEntry:format() end
--- An entry in the Computer Log.
---@class LogEntry-Class
LogEntry_Class = {}

--- A track section that combines the area between multiple signals.
---@class RailroadSignalBlock
---@field public isValid boolean Is true if this signal block reference is valid.
---@field public isBlockOccupied boolean True if the block this signal is observing is currently occupied by a vehicle.
---@field public isPathBlock boolean True if the block this signal is observing is a path-block.
---@field public blockValidation integer Returns the blocks validation status.
RailroadSignalBlock = {}
--- Allows you to check if this block is occupied by a given train.
---@param train Train The train you want to check if it occupies this block
---@return boolean isOccupied True if the given train occupies this block.
---@type (fun(self:RailroadSignalBlock,train:Train):(isOccupied:boolean))|ReflectionFunction
function RailroadSignalBlock:isOccupiedBy(train) end
--- Returns a list of trains that currently occupate the block.
---@return Train[] occupation A list of trains occupying the block.
---@type (fun(self:RailroadSignalBlock):(occupation:Train[]))|ReflectionFunction
function RailroadSignalBlock:getOccupation() end
--- Returns a list of trains that try to reserve this block and wait for approval.
---@return Train[] reservations A list of trains that try to reserve this block and wait for approval.
---@type (fun(self:RailroadSignalBlock):(reservations:Train[]))|ReflectionFunction
function RailroadSignalBlock:getQueuedReservations() end
--- Returns a list of trains that are approved by this block.
---@return Train[] reservations A list of trains that are approved by this block.
---@type (fun(self:RailroadSignalBlock):(reservations:Train[]))|ReflectionFunction
function RailroadSignalBlock:getApprovedReservations() end
--- A track section that combines the area between multiple signals.
---@class RailroadSignalBlock-Class
RailroadSignalBlock_Class = {}

--- Target Point in the waypoint list of a wheeled vehicle.
---@class TargetPoint
---@field public pos Vector The position of the target point in the world.
---@field public rot Rotator The rotation of the target point in the world.
---@field public speed number The speed at which the vehicle should pass the target point.
---@field public wait number The amount of time which needs to pass till the vehicle will continue to the next target point.
TargetPoint = {}
--- Target Point in the waypoint list of a wheeled vehicle.
---@class TargetPoint-Class
TargetPoint_Class = {}

--- Information about a train stop in a time table.
---@class TimeTableStop
---@field public station RailroadStation The station at which the train should stop
TimeTableStop = {}
--- Returns The rule set wich describe when the train will depart from the train station.
---@return TrainDockingRuleSet ruleset The rule set of this time table stop.
---@type (fun(self:TimeTableStop):(ruleset:TrainDockingRuleSet))|ReflectionFunction
function TimeTableStop:getRuleSet() end
--- Allows you to change the Rule Set of this time table stop.
---@param ruleset TrainDockingRuleSet The rule set you want to use instead.
---@type (fun(self:TimeTableStop,ruleset:TrainDockingRuleSet))|ReflectionFunction
function TimeTableStop:setRuleSet(ruleset) end
--- Information about a train stop in a time table.
---@class TimeTableStop-Class
TimeTableStop_Class = {}

--- Struct that holds a cache of a whole train/rail network.
---@class TrackGraph
TrackGraph = {}
--- Returns a list of all trains in the network.
---@return Train[] trains The list of trains in the network.
---@type (fun(self:TrackGraph):(trains:Train[]))|ReflectionFunction
function TrackGraph:getTrains() end
--- Returns a list of all trainstations in the network.
---@return RailroadStation[] stations The list of trainstations in the network.
---@type (fun(self:TrackGraph):(stations:RailroadStation[]))|ReflectionFunction
function TrackGraph:getStations() end
--- Struct that holds a cache of a whole train/rail network.
---@class TrackGraph-Class
TrackGraph_Class = {}

--- A structure that can hold a buffer of characters and colors that can be displayed with a gpu
---@class GPUT1Buffer
GPUT1Buffer = {}
--- Allows to get the dimensions of the buffer.
---@return number width The width of this buffer
---@return number height The height of this buffer
---@type (fun(self:GPUT1Buffer):(width:number,height:number))|ReflectionFunction
function GPUT1Buffer:getSize() end
--- Allows to set the dimensions of the buffer.
---@param width number The width this buffer should now have
---@param height number The height this buffer now have
---@type (fun(self:GPUT1Buffer,width:number,height:number))|ReflectionFunction
function GPUT1Buffer:setSize(width, height) end
--- Allows to get a single pixel from the buffer at the given position
---@param x integer The x position of the character you want to get
---@param y integer The y position of the character you want to get
---@return string c The character at the given position
---@return Color foreground The foreground color of the pixel at the given position
---@return Color background The background color of the pixel at the given position
---@type (fun(self:GPUT1Buffer,x:integer,y:integer):(c:string,foreground:Color,background:Color))|ReflectionFunction
function GPUT1Buffer:get(x, y) end
--- Allows to set a single pixel of the buffer at the given position
---@param x integer The x position of the character you want to set
---@param y integer The y position of the character you want to set
---@param c string The character the pixel should have
---@param foreground Color The foreground color the pixel at the given position should have
---@param background Color The background color the pixel at the given position should have
---@return boolean done True if the pixel got set successfully
---@type (fun(self:GPUT1Buffer,x:integer,y:integer,c:string,foreground:Color,background:Color):(done:boolean))|ReflectionFunction
function GPUT1Buffer:set(x, y, c, foreground, background) end
--- Copies the given buffer at the given offset of the upper left corner into this buffer.
---@param x integer The x offset of the upper left corner of the buffer relative to this buffer
---@param y integer The y offset of the upper left corener of the buffer relative to this buffer
---@param buffer GPUT1Buffer The buffer from wich you want to copy from
---@param textBlendMode integer The blend mode that is used for the text.<br>0 = Overwrite this with the content of the given buffer<br>1 = Overwrite with only characters that are not ' '<br>2 = Overwrite only were this characters are ' '<br>3 = Keep this buffer
---@param foregroundBlendMode integer The blend mode that is used for the foreground color.<br>0 = Overwrite with the given color<br>1 = Normal alpha composition<br>2 = Multiply<br>3 = Divide<br>4 = Addition<br>5 = Subtraction<br>6 = Difference<br>7 = Darken Only<br>8 = Lighten Only<br>9 = None
---@param backgroundBlendMode integer The blend mode that is used for the background color.<br>0 = Overwrite with the given color<br>1 = Normal alpha composition<br>2 = Multiply<br>3 = Divide<br>4 = Addition<br>5 = Subtraction<br>6 = Difference<br>7 = Darken Only<br>8 = Lighten Only<br>9 = None
---@type (fun(self:GPUT1Buffer,x:integer,y:integer,buffer:GPUT1Buffer,textBlendMode:integer,foregroundBlendMode:integer,backgroundBlendMode:integer))|ReflectionFunction
function GPUT1Buffer:copy(x, y, buffer, textBlendMode, foregroundBlendMode, backgroundBlendMode) end
--- Allows to write the given text onto the buffer and with the given offset.
---@param x integer The X Position at which the text should begin to get written.
---@param y integer The Y Position at which the text should begin to get written.
---@param text string The text that should get written.
---@param foreground Color The foreground color which will be used to write the text.
---@param background Color The background color which will be used to write the text.
---@type (fun(self:GPUT1Buffer,x:integer,y:integer,text:string,foreground:Color,background:Color))|ReflectionFunction
function GPUT1Buffer:setText(x, y, text, foreground, background) end
--- Draws the given character at all given positions in the given rectangle on-to the hidden screen buffer.
---@param x integer The x coordinate at which the rectangle should get drawn. (upper-left corner)
---@param y integer The y coordinate at which the rectangle should get drawn. (upper-left corner)
---@param width integer The width of the rectangle.
---@param height integer The height of the rectangle.
---@param character string A string with a single character that will be used for each pixel in the range you want to fill.
---@param foreground Color The foreground color which will be used to fill the rectangle.
---@param background Color The background color which will be used to fill the rectangle.
---@type (fun(self:GPUT1Buffer,x:integer,y:integer,width:integer,height:integer,character:string,foreground:Color,background:Color))|ReflectionFunction
function GPUT1Buffer:fill(x, y, width, height, character, foreground, background) end
--- Allows to set the internal data of the buffer more directly.
---@param characters string The characters you want to draw with a length of exactly width*height.
---@param foreground number[] The values of the foreground color slots for each character were a group of four values give one color. so the length has to be exactly width*height*4.
---@param background number[] The values of the background color slots for each character were a group of four values give one color. so the length has to be exactly width*height*4.
---@return boolean success True if the raw data was successfully written
---@type (fun(self:GPUT1Buffer,characters:string,foreground:number[],background:number[]):(success:boolean))|ReflectionFunction
function GPUT1Buffer:setRaw(characters, foreground, background) end
--- Clones this buffer into a new struct
---@return GPUT1Buffer buffer The clone of this buffer
---@type (fun(self:GPUT1Buffer):(buffer:GPUT1Buffer))|ReflectionFunction
function GPUT1Buffer:clone() end
--- A structure that can hold a buffer of characters and colors that can be displayed with a gpu
---@class GPUT1Buffer-Class
GPUT1Buffer_Class = {}

--- This struct contains the necessary information to draw a box onto the GPU T2.
---@class GPUT2DrawCallBox
---@field public position Vector2D The drawn local position of the rectangle.
---@field public size Vector2D The drawn size of the rectangle.
---@field public rotation number The draw rotation of the rectangle.
---@field public color Color The fill color of the rectangle, or the tint of the image drawn.
---@field public image string If not empty, should be a image reference to the image that should be drawn inside the rectangle.
---@field public imageSize Vector2D The size of the internal image drawn, necessary for proper scaling, antialising and tiling.
---@field public hasCenteredOrigin boolean If set to false, the position will give the left upper corner of the box and rotation will happen around this point. If set to true, the position will give the center point of box and the rotation will happen around this center point.
---@field public horizontalTiling boolean True if the image should be tiled horizontally.
---@field public verticalTiling boolean True if the image should be tiled vertically.
---@field public isBorder boolean If true, the margin values provide a way to specify a fixed sized border thicknesses the boxes images will use (use the image as 9-patch).
---@field public margin Margin The margin values of the 9-patch (border).
---@field public isRounded boolean True if the box can have rounded borders.
---@field public radii Vector4 The rounded border radii used if isRounded is set to true.<br>The Vector4 corner mapping in order: Top Left, Top Right, Bottom Right & Bottom Left.
---@field public hasOutline boolean True if the box has a colorful (inward) outline.
---@field public outlineThickness number The uniform thickness of the outline around the box.
---@field public outlineColor Color The color of the outline around the box.
GPUT2DrawCallBox = {}
--- This struct contains the necessary information to draw a box onto the GPU T2.
---@class GPUT2DrawCallBox-Class
GPUT2DrawCallBox_Class = {}

--- This struct contains filter settings so you can evaluate if a sent signal matches the filter or not.
---@class EventFilter
---@operator mul(EventFilter):EventFilter
---@operator band(EventFilter):EventFilter
---@operator add(EventFilter):EventFilter
---@operator bor(EventFilter):EventFilter
---@operator unm():EventFilter
---@operator bnot():EventFilter
EventFilter = {}
--- Returns true if the given signal data matches this event filter.
---@param name string The (internal) name of the signal.
---@param sender Object The sender of the signal
---@param ... any
---@return boolean matches True if the given signal matches the filter
---@type (fun(self:EventFilter,name:string,sender:Object,...:any):(matches:boolean))|ReflectionFunction
function EventFilter:matches(name, sender, ...) end
--- This struct contains filter settings so you can evaluate if a sent signal matches the filter or not.
---@class EventFilter-Class
EventFilter_Class = {}

