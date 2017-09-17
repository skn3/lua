Namespace lua

#Import "glue.h"

#Import "lib/lua-5.3.4/src/lapi.c"
#Import "lib/lua-5.3.4/src/lauxlib.c"
#Import "lib/lua-5.3.4/src/lbaselib.c"
#Import "lib/lua-5.3.4/src/lbitlib.c"
#Import "lib/lua-5.3.4/src/lcode.c"
#Import "lib/lua-5.3.4/src/lcorolib.c"
#Import "lib/lua-5.3.4/src/lctype.c"
#Import "lib/lua-5.3.4/src/ldblib.c"
#Import "lib/lua-5.3.4/src/ldebug.c"
#Import "lib/lua-5.3.4/src/ldo.c"
#Import "lib/lua-5.3.4/src/ldump.c"
#Import "lib/lua-5.3.4/src/lfunc.c"
#Import "lib/lua-5.3.4/src/lgc.c"
#Import "lib/lua-5.3.4/src/linit.c"
#Import "lib/lua-5.3.4/src/liolib.c"
#Import "lib/lua-5.3.4/src/llex.c"
#Import "lib/lua-5.3.4/src/lmathlib.c"
#Import "lib/lua-5.3.4/src/lmem.c"
#Import "lib/lua-5.3.4/src/loadlib.c"
#Import "lib/lua-5.3.4/src/lobject.c"
#Import "lib/lua-5.3.4/src/lopcodes.c"
#Import "lib/lua-5.3.4/src/loslib.c"
#Import "lib/lua-5.3.4/src/lparser.c"
#Import "lib/lua-5.3.4/src/lstate.c"
#Import "lib/lua-5.3.4/src/lstring.c"
#Import "lib/lua-5.3.4/src/lstrlib.c"
#Import "lib/lua-5.3.4/src/ltable.c"
#Import "lib/lua-5.3.4/src/ltablib.c"
#Import "lib/lua-5.3.4/src/ltm.c"
#Import "lib/lua-5.3.4/src/lundump.c"
#Import "lib/lua-5.3.4/src/lutf8lib.c"
#Import "lib/lua-5.3.4/src/lvm.c"
#Import "lib/lua-5.3.4/src/lzio.c"

'external
Extern

' consts
Const LUA_OK:Int
Const LUA_YIELD:Int
Const LUA_ERRRUN:Int
Const LUA_ERRSYNTAX:Int
Const LUA_ERRMEM:Int
Const LUA_ERRGCMM:Int
Const LUA_ERRERR:Int

Const LUA_MULTRET:Int

Alias LuaType:Int
Alias lua_Number:Float
Alias lua_Integer:Long

Const LUA_TNONE:LuaType
Const LUA_TNIL:LuaType
Const LUA_TBOOLEAN:LuaType
Const LUA_TLIGHTUSERDATA:LuaType
Const LUA_TNUMBER:LuaType
Const LUA_TSTRING:LuaType
Const LUA_TTABLE:LuaType
Const LUA_TFUNCTION:LuaType
Const LUA_TUSERDATA:LuaType
Const LUA_TTHREAD:LuaType

' types
Struct lua_Unsigned
End
Struct lua_KContext
End
Struct lua_State
End
Struct lua_Debug
End
Struct luaL_Reg
End
Struct luaL_Stream
End
Struct luaL_Buffer
End

Alias lua_Alloc:Void Ptr(ud:Void Ptr, pt:Void Ptr, osize:Int, nsize:Int)
Alias lua_CFunction:Int(L:lua_State Ptr)
Alias lua_KFunction:Int(L:lua_State Ptr, status:Int, ctx:lua_KContext)
Alias lua_Reader:CString(L:lua_State Ptr, data:Void Ptr, size:Int Ptr)
Alias lua_Writer:Int(L:lua_State Ptr, p:Void Ptr, sz:Int, ud:Void Ptr)
Alias lua_Hook:Void(L:lua_State Ptr, ar:lua_Debug Ptr)

' main library
Function lua_absindex:Int(L:lua_State Ptr, idx:Int)
Function lua_arith:Void(L:lua_State Ptr, op:Int)
Function lua_atpanic:lua_CFunction(L:lua_State Ptr, panicf:lua_CFunction)
Function lua_call:Void(L:lua_State Ptr, nargs:Int, nresults:Int)
Function lua_callk:Void(L:lua_State Ptr, nargs:Int, nresults:Int, ctx:lua_KContext, k:lua_KFunction)
Function lua_close:Void(L:lua_State Ptr)
Function lua_checkstack:Bool(L:lua_State Ptr, n:Int)
Function lua_compare:Bool(L:lua_State Ptr, index1:Int, index2:Int, op:Int)
Function lua_concat:Void(L:lua_State Ptr, n:Int)
Function lua_copy:Void(L:lua_State Ptr, fromidx:Int, toidx:Int)
Function lua_createtable:Void(L:lua_State Ptr, narr:Int, nrec:Int)
Function lua_dump:Int(L:lua_State Ptr, writer:lua_Writer, data:Void Ptr, strip:Int)
Function lua_error:Int(L:lua_State Ptr)
Function lua_gc:Int(L:lua_State Ptr, what:Int, data:Int)
Function lua_getallocf:lua_Alloc(L:lua_State Ptr, ud:Void Ptr Ptr)
Function lua_getfield:Int(L:lua_State Ptr, index:Int, k:CString)
Function lua_getextraspace:Void Ptr(L:lua_State Ptr)
Function lua_getglobal:Int(L:lua_State Ptr, name:CString)
Function lua_geti:Int(L:lua_State Ptr, index:Int, i:Int)
Function lua_getmetatable:Bool(L:lua_State Ptr, index:Int)
Function lua_gettable:Int(L:lua_State Ptr, index:Int)
Function lua_gettop:Int(L:lua_State Ptr)
Function lua_getuservalue:Int(L:lua_State Ptr, index:Int)
Function lua_insert:Void(L:lua_State Ptr, index:Int)
Function lua_isboolean:Bool(L:lua_State Ptr, index:Int)
Function lua_iscfunction:Bool(L:lua_State Ptr, index:Int)
Function lua_isfunction:Bool(L:lua_State Ptr, index:Int)
Function lua_isinteger:Bool(L:lua_State Ptr, index:Int)
Function lua_islightuserdata:Bool(L:lua_State Ptr, index:Int)
Function lua_isnil:Bool(L:lua_State Ptr, index:Int)
Function lua_isnone:Bool(L:lua_State Ptr, index:Int)
Function lua_isnoneornil:Bool(L:lua_State Ptr, index:Int)
Function lua_isnumber:Bool(L:lua_State Ptr, index:Int)
Function lua_isstring:Bool(L:lua_State Ptr, index:Int)
Function lua_istable:Bool(L:lua_State Ptr, index:Int)
Function lua_isthread:Bool(L:lua_State Ptr, index:Int)
Function lua_isuserdata:Bool(L:lua_State Ptr, index:Int)
Function lua_isyieldable:Bool(L:lua_State Ptr)
Function lua_len:Void(L:lua_State Ptr, index:Int)
'Function lua_load:Int(L:lua_State Ptr, reader:lua_Reader, data:Void Ptr, chunkname:CString, mode:CString)
Function lua_newstate:lua_State Ptr(f:lua_Alloc, ud:Void Ptr)
Function lua_newtable:Void(L:lua_State Ptr)
Function lua_newthread:lua_State Ptr(L:lua_State Ptr)
Function lua_newuserdata:Void Ptr(L:lua_State Ptr, size:Int)
Function lua_next:Int(L:lua_State Ptr, index:Int)
Function lua_numbertointeger:Int(n:Float, i:Int Ptr)
Function lua_pcall:Int(L:lua_State Ptr, nargs:Int, nresults:Int, msgh:Int)
Function lua_pcallk:Int(L:lua_State Ptr, nargs:Int, nresults:Int, msgh:Int, ctx:lua_KContext, k:lua_KFunction)
Function lua_pop:Void(L:lua_State Ptr, n:Int)
Function lua_pushboolean:Void(L:lua_State Ptr, b:Bool)
Function lua_pushcclosure:Void(L:lua_State Ptr, fn:lua_CFunction, n:Int)
Function lua_pushcfunction:Void(L:lua_State Ptr, f:lua_CFunction)
'varargs lua_pushfstring
Function lua_pushglobaltable:Void(L:lua_State Ptr)
Function lua_pushinteger:Void(L:lua_State Ptr, n:Int)
Function lua_pushlightuserdata:Void(L:lua_State Ptr, p:Void Ptr)
Function lua_pushlstring:CString(L:lua_State Ptr, s:CString, len:Int)
Function lua_pushnil:Void(L:lua_State Ptr)
Function lua_pushnumber:Void(L:lua_State Ptr, n:Float)
Function lua_pushstring:CString(L:lua_State Ptr, s:CString)
Function lua_pushthread:Int(L:lua_State Ptr)
Function lua_pushvalue:Void(L:lua_State Ptr, index:Int)
'va_list lua_pushvfstring
Function lua_rawequal:Bool(L:lua_State Ptr, index1:Int, index2:Int)
Function lua_rawget:Int(L:lua_State Ptr, index:Int)
Function lua_rawgeti:Void(L:lua_State Ptr, index:Int, n:Int)
Function lua_rawgetp:Int(L:lua_State Ptr, index:Int, p:Void Ptr)
Function lua_rawlen:Int(L:lua_State Ptr, index:Int)
Function lua_rawset:Void(L:lua_State Ptr, index:Int)
Function lua_rawseti:Void(L:lua_State Ptr, index:Int, i:Int)
Function lua_rawsetp:Void(L:lua_State Ptr, index:Int, p:Void Ptr)
Function lua_register:Void(L:lua_State Ptr, name:CString, f:lua_CFunction)
Function lua_remove:Void(L:lua_State Ptr, index:Int)
Function lua_replace:Void(L:lua_State Ptr, index:Int)
Function lua_resume:Int(L:lua_State Ptr, from:lua_State Ptr, nargs:Int)
Function lua_rotate:Void(L:lua_State Ptr, idx:Int, n:Int)
Function lua_setallocf:Void(L:lua_State Ptr, f:lua_Alloc, ud:Void Ptr)
Function lua_setfield:Void(L:lua_State Ptr, index:Int, k:CString)
Function lua_setglobal:Void(L:lua_State Ptr, name:CString)
Function lua_seti:Void(L:lua_State Ptr, index:Int, n:Int)
Function lua_setmetatable:Void(L:lua_State Ptr, index:Int)
Function lua_settable:Void(L:lua_State Ptr, index:Int)
Function lua_settop:Void(L:lua_State Ptr, index:Int)
Function lua_setuservalue:Void(L:lua_State Ptr, index:Int)
Function lua_status:Void(L:lua_State Ptr)
Function lua_stringtonumber:Int(L:lua_State Ptr, s:CString)
Function lua_toboolean:Bool(L:lua_State Ptr, index:Int)
Function lua_tocfunction:lua_CFunction(L:lua_State Ptr, index:Int)
Function lua_tointeger:Int(L:lua_State Ptr, index:Int)
Function lua_tointegerx:Int(L:lua_State Ptr, index:Int, isnum:Bool Ptr)
Function lua_tolstring:CString(L:lua_State Ptr, index:Int, len:Int Ptr)
Function lua_tonumber:Float(L:lua_State Ptr, index:Int)
Function lua_tonumberx:Float(L:lua_State Ptr, index:Int, isnum:Bool Ptr)
Function lua_topointer:Void Ptr(L:lua_State Ptr, index:Int)
Function lua_tostring:CString(L:lua_State Ptr, index:Int)
Function lua_tothread:lua_State Ptr(L:lua_State Ptr, index:Int)
Function lua_touserdata:Void Ptr(L:lua_State Ptr, index:Int)
Function lua_type:Int(L:lua_State Ptr, index:Int)
Function lua_typename:CString(L:lua_State Ptr, tp:Int)
Function lua_upvalueindex:Int(i:Int)
Function lua_version:Float(L:lua_State Ptr)
Function lua_xmove:Void(from:lua_State Ptr, _to:lua_State Ptr, n:Int)
Function lua_yield:Int(L:lua_State Ptr, nresults:Int)
Function lua_yieldk:Int(L:lua_State Ptr, nresults:Int, ctx:lua_KContext, k:lua_KFunction)

' debug interface
'Function lua_gethook:lua_Hook(L:lua_State Ptr)
'Function lua_gethookcount:Int(L:lua_State Ptr)
'Function lua_gethookmask:Int(L:lua_State Ptr)
'Function lua_getinfo:Int(L:lua_State Ptr, what:CString, ar:lua_Debug Ptr)
'Function lua_getlocal:CString(L:lua_State Ptr, ar:lua_Debug Ptr, n:Int)
'Function lua_getstack:Int(L:lua_State Ptr, level:Int, ar:lua_Debug Ptr)
'Function lua_getupvalue:CString(L:lua_State Ptr, funcindex:Int, n:Int)
'Function lua_sethook:Void(L:lua_State Ptr, f:lua_Hook, mask:Int, count:Int)
'Function lua_setlocal:CString(L:lua_State Ptr, ar:lua_Debug Ptr, n:Int)
'Function lua_setupvalue:CString(L:lua_State Ptr, funcindex:Int, n:Int)
'Function lua_upvalueid:Void Ptr(L:lua_State Ptr, funcindex:Int, n:Int)
'Function lua_upvaluejoin:Void(L:lua_State Ptr, funcindex1:Int, n1:Int, funcindex2:Int, n2:Int)

' auxiliary library
'Function luaL_addchar:Void(B:luaL_Buffer Ptr, c:Int)
'Function luaL_addlstring:Void(B:luaL_Buffer Ptr, s:CString, l:Int)
'Function luaL_addsize:Void(B:luaL_Buffer Ptr, n:Int)
'Function luaL_addstring:Void(B:luaL_Buffer Ptr, s:CString)
'Function luaL_addvalue:Void(B:luaL_Buffer Ptr)
Function luaL_argcheck:Void(L:lua_State Ptr, cond:Int, arg:Int, extramsg:CString)
Function luaL_argerror:Void(L:lua_State Ptr, arg:Int, extramsg:CString)
'Function luaL_buffinit:Void(L:lua_State Ptr, B:luaL_Buffer Ptr)
'Function luaL_buffinitsize:Int Ptr(L:lua_State Ptr, B:luaL_Buffer Ptr, sz:Int)
Function luaL_callmeta:Int(L:lua_State Ptr, obj:Int, e:CString)
Function luaL_checkany:Void(L:lua_State Ptr, arg:Int)
Function luaL_checkinteger:Int(L:lua_State Ptr, arg:Int)
Function luaL_checklstring:CString(L:lua_State Ptr, arg:Int, l:Int Ptr)
Function luaL_checknumber:Float(L:lua_State Ptr, arg:Int)
Function luaL_checkoption:Int(L:lua_State Ptr, arg:Int, def:CString, lst:CString[])
Function luaL_checkstack:Void(L:lua_State Ptr, sz:Int, msg:CString)
Function luaL_checkstring:CString(L:lua_State Ptr, arg:Int)
Function luaL_checktype:Void(L:lua_State Ptr, arg:Int, t:Int)
Function luaL_checkudata:Void Ptr(L:lua_State Ptr, arg:Int, tname:CString)
Function luaL_checkversion:Void(L:lua_State Ptr)
Function luaL_dofile:Bool(L:lua_State Ptr, filename:CString)
Function luaL_dostring:Bool(L:lua_State Ptr, str:CString)
'varargs Function luaL_error:Int(L:lua_State Ptr, )
Function luaL_execresult:Int(L:lua_State Ptr, stat:Int)
Function luaL_fileresult:Int(L:lua_State Ptr, stat:Int, filename:CString)
Function luaL_getmetafield:Int(L:lua_State Ptr, obj:Int, e:CString)
Function luaL_getmetatable:Int(L:lua_State Ptr, tname:CString)
Function luaL_getsubtable:Bool(L:lua_State Ptr, idx:Int, fname:CString)
Function luaL_gsub:CString(L:lua_State Ptr, s:CString, p:CString, r:CString)
Function luaL_len:Int(L:lua_State Ptr, index:Int)
'Function luaL_loadbuffer:Int(L:lua_State Ptr, buff:CString, sz:Int, name:CString)
'Function luaL_loadbufferx:Int(L:lua_State Ptr, buff:CString, sz:Int, name:CString, mode:CString)
Function luaL_loadfile:Int(L:lua_State Ptr, filename:CString)
Function luaL_loadfilex:Int(L:lua_State Ptr, filename:CString, mode:CString)
Function luaL_loadstring:Int(L:lua_State Ptr, s:CString)
Function luaL_newlib:Void(L:lua_State Ptr, l:luaL_Reg[])
Function luaL_newlibtable:Void(L:lua_State Ptr, l:luaL_Reg[])
Function luaL_newmetatable:Int(L:lua_State Ptr, tname:CString)
Function luaL_newstate:lua_State Ptr()
Function luaL_openlibs:Void(L:lua_State Ptr)
'macro Function luaL_opt
Function luaL_optinteger:Int(L:lua_State Ptr, arg:Int, d:Int)
Function luaL_optlstring:CString(L:lua_State Ptr, arg:Int, d:CString, l:Int Ptr)
Function luaL_optnumber:Float(L:lua_State Ptr, arg:Int, d:Float)
Function luaL_optstring:CString(L:lua_State Ptr, arg:Int, d:CString)
Function luaL_prepbuffer:Int Ptr(B:luaL_Buffer Ptr)
Function luaL_prepbuffsize:Int Ptr(B:luaL_Buffer Ptr, sz:Int)
Function luaL_pushresult:Void(B:luaL_Buffer Ptr)
Function luaL_pushresultsize:Void(B:luaL_Buffer Ptr, sz:Int)
Function luaL_ref:Int(L:lua_State Ptr, t:Int)
Function luaL_requiref:Void(L:lua_State Ptr, modname:CString, openf:lua_CFunction, glb:Int)
Function luaL_setfuncs:Void(L:lua_State Ptr, l:luaL_Reg Ptr, nup:Int)
Function luaL_setmetatable:Void(L:lua_State Ptr, tname:CString)
Function luaL_testudata:Void Ptr(L:lua_State Ptr, arg:Int, tname:CString)
Function luaL_tolstring:CString(L:lua_State Ptr, idx:Int, len:Int Ptr)
Function luaL_traceback:Void(L:lua_State Ptr, L1:lua_State Ptr, msg:CString, level:Int)
Function luaL_typename:CString(L:lua_State Ptr, index:Int)
Function luaL_unref:Void(L:lua_State Ptr, t:Int, ref:Int)
Function luaL_where:Void(L:lua_State Ptr, lvl:Int)

Function mx2lua_pushuserdata:Void Ptr(L:lua_State Ptr, pointer:Void Ptr, size:Int)
