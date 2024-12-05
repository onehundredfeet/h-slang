package slang;
#if hl

abstract ShaderProgram(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract Module(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract Device(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {
	@:hlNative("slang", "Device_loadModule1")
	public function loadModule(moduleName:String):slang.Module return cast(0, Module);
}
abstract ShaderProgram(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract Session(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract SessionPtr(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract Blob(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract BlobPtr(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract Window(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract WindowDesc(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}
abstract Application(idl.Types.Ref) from idl.Types.Ref to idl.Types.Ref {

}

#end
#if cpp

@:native("ShaderProgram") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class ShaderProgram {

}
@:native("Module") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class Module {

}
@:native("Device") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class Device {
	public function loadModule(moduleName:String):cpp.Star<Module>;
}
@:native("ShaderProgram") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class ShaderProgram {

}
@:native("Session") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class Session {

}
@:native("SessionPtr") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class SessionPtr {

}
@:native("Blob") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class Blob {

}
@:native("BlobPtr") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class BlobPtr {

}
@:native("Window") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class Window {

}
@:native("WindowDesc") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class WindowDesc {

}
@:native("Application") @:structAccess @:build(idl.macros.MacroTools.buildHXCPPIDLType("${SLANG_IDL_DIR}/slang.idl")) extern class Application {

}

#end
