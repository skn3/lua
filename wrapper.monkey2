Namespace lua.wrapper

Using lua

Class LuaState
	'fields	
	Private
	Field state:lua_State Ptr

	Public
	'constructor
	Method New(libs:Bool = True)', metaTables:Bool = True)
		'create the lua state
		Self.state = luaL_newstate()
		
		'open base libs
		If libs
			luaL_openlibs(Self.state)
		Endif
		
		'create meta tables
'		If metaTables
'			luaL_newmetatable(Self.state, "Object")
'			lua_pushcfunction(Self.state, Object_Index)
'			lua_setfield(Self.state, -2, "__index")
'			lua_pushcfunction(Self.state, Object_NewIndex)
'			lua_setfield(Self.state, -2, "__newindex")
'			lua_pop(Self.state, 1)
'
'			luaL_newmetatable(Self.state, "Struct")
'			lua_pushcfunction(Self.state, Struct_Index)
'			lua_setfield(Self.state, -2, "__index")
'			lua_pushcfunction(Self.state, Struct_NewIndex)
'			lua_setfield(Self.state, -2, "__newindex")
'			lua_pop(Self.state, 1)
'		End
	End

	Method New(state:lua_State Ptr)
		Self.state = state
	End

	'properties
	Property Pointer:lua_State Ptr()
		Return Self.state
	End
	
	'main api
	Method AbsIndex:Int(index:Int)
		Return lua_absindex(Self.state, index)
	End

	Method Arith:Void(op:Int)
		lua_arith(Self.state, op)
	End

	Method AtPanic:lua_CFunction(panicFuncPtr:lua_CFunction)
		Return lua_atpanic(Self.state, panicFuncPtr)
	End

	Method Call:Void(argCount:Int, resultCount:Int)
		lua_call(Self.state, argCount, resultCount)
	End

	Method CallK:Void(argCount:Int, resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
		lua_callk(Self.state, argCount, resultCount, context, kFuncPtr)
	End

	Method Close:Void()
		lua_close(Self.state)
	End

	Method CheckStack:Bool(n:Int)
		Return lua_checkstack(Self.state, n)
	End

	Method Compare:Bool(index1:Int, index2:Int, op:Int)
		Return lua_compare(Self.state, index1, index2, op)
	End

	Method Concat:Void(n:Int)
		lua_concat(Self.state, n)
	End

	Method Copy:Void(fromIndex:Int, toIndex:Int)
		lua_copy(Self.state, fromIndex, toIndex)
	End

	Method CreateTable:Void(arrayHint:Int, mapHint:Int)
		lua_createtable(Self.state, arrayHint, mapHint)
	End

	Method Error:Int()
		Return lua_error(Self.state)
	End

	Method GC:Int(what:Int, data:Int)
		Return lua_gc(Self.state, what, data)
	End

	Method GetField:Int(index:Int, key:String)
		Return lua_getfield(Self.state, index, key)
	End

	Method GetExtraSpace:Void Ptr()
		Return lua_getextraspace(Self.state)
	End

	Method GetGlobal:Int(name:String)
		Return lua_getglobal(Self.state, name)
	End

	Method GetI:Int(index:Int, i:Int)
		Return lua_geti(Self.state, index, i)
	End

	Method GetMetaTable:Bool(index:Int)
		Return lua_getmetatable(Self.state, index)
	End

	Method GetTable:Int(index:Int)
		Return lua_gettable(Self.state, index)
	End

	Method GetTop:Int()
		Return lua_gettop(Self.state)
	End

	Method GetUserValue:Int(index:Int)
		Return lua_getuservalue(Self.state, index)
	End

	Method Insert:Void(index:Int)
		lua_insert(Self.state, index)
	End

	Method IsBoolean:Bool(index:Int)
		Return lua_isboolean(Self.state, index)
	End

	Method IsCFunction:Bool(index:Int)
		Return lua_iscfunction(Self.state, index)
	End

	Method IsFunction:Bool(index:Int)
		Return lua_isfunction(Self.state, index)
	End

	Method IsInteger:Bool(index:Int)
		Return lua_isinteger(Self.state, index)
	End

	Method IsLightUserdata:Bool(index:Int)
		Return lua_islightuserdata(Self.state, index)
	End

	Method IsNil:Bool(index:Int)
		Return lua_isnil(Self.state, index)
	End

	Method IsNone:Bool(index:Int)
		Return lua_isnone(Self.state, index)
	End

	Method IsNoneOrNil:Bool(index:Int)
		Return lua_isnoneornil(Self.state, index)
	End

	Method IsNumber:Bool(index:Int)
		Return lua_isnumber(Self.state, index)
	End

	Method IsString:Bool(index:Int)
		Return lua_isstring(Self.state, index)
	End

	Method IsTable:Bool(index:Int)
		Return lua_istable(Self.state, index)
	End

	Method IsThread:Bool(index:Int)
		Return lua_isthread(Self.state, index)
	End

	Method IsUserdata:Bool(index:Int)
		Return lua_isuserdata(Self.state, index)
	End

	Method IsYieldable:Bool()
		Return lua_isyieldable(Self.state)
	End

	Method Len:Void(index:Int)
		lua_len(Self.state, index)
	End

	Method NewTable:Void()
		lua_newtable(Self.state)
	End

	Method NewThread:LuaState()
		Return New LuaState(lua_newthread(Self.state))
	End

	Method NextElement:Int(index:Int)
		Return lua_next(Self.state, index)
	End

	Method NumberToInteger:Bool(floatValue:Float, intPointer:lua_Integer Ptr)
		Return lua_numbertointeger(floatValue, intPointer)
	End

	Method PCall:Int(argCount:Int=0, resultCount:Int=LUA_MULTRET, msgh:Int=0)
		Return lua_pcall(Self.state, argCount, resultCount, msgh)
	End

	Method PCallK:Int(argCount:Int=0, resultCount:Int=LUA_MULTRET, msgh:Int=0, context:lua_KContext=null, kFuncPtr:lua_KFunction=null)		
		Return lua_pcallk(Self.state, argCount, resultCount, msgh, context, kFuncPtr)
	End

	Method Pop:Void(count:Int)
		lua_pop(Self.state, count)
	End

	Method PushBoolean:Void(value:Bool)
		lua_pushboolean(Self.state, value)
	End

	Method PushCClosure:Void(funcPtr:lua_CFunction, valueCount:Int)
		lua_pushcclosure(Self.state, funcPtr, valueCount)
	End

	Method PushCFunction:Void(funcPtr:lua_CFunction)
		lua_pushcfunction(Self.state, funcPtr)
	End

	Method PushGlobalTable:Void()
		lua_pushglobaltable(Self.state)
	End

	Method PushInteger:Void(value:Int)
		lua_pushinteger(Self.state, value)
	End

	Method PushLightUserdata:Void(address:Void Ptr)
		lua_pushlightuserdata(Self.state, address)
	End

	Method PushLString:String(str:String, length:Int)
		Return lua_pushlstring(Self.state, str, length)
	End

	Method PushNil:Void()
		lua_pushnil(Self.state)
	End

	Method PushNumber:Void(value:Float)
		lua_pushnumber(Self.state, value)
	End

	Method PushString:String(str:String)
		Return lua_pushstring(Self.state, str)
	End

	Method PushThread:Int()
		Return lua_pushthread(Self.state)
	End

	Method PushValue:Void(index:Int)
		lua_pushvalue(Self.state, index)
	End

	Method RawEqual:Bool(index1:Int, index2:Int)
		Return lua_rawequal(Self.state, index1, index2)
	End

	Method RawGet:Int(index:Int)
		Return lua_rawget(Self.state, index)
	End

	Method RawGetI:Int(index:Int, i:lua_Integer)
		Return lua_rawgeti(Self.state, index, i)
	End

	Method RawGetP:Int(index:Int, p:Void Ptr)
		Return lua_rawgetp(Self.state, index, p)
	End

	Method RawLen:Int(index:Int)
		Return lua_rawlen(Self.state, index)
	End

	Method RawSet:Void(index:Int)
		lua_rawset(Self.state, index)
	End

	Method RawSetI:Void(index:Int, i:Int)
		lua_rawseti(Self.state, index, i)
	End

	Method RawSetP:Void(index:int, p:Void Ptr)
		lua_rawsetp(Self.state, index, p)
	End

	Method Register:Void(name:String, funcPtr:lua_CFunction)
		lua_register(Self.state, name, funcPtr)
	End

	Method Remove:Void(index:Int)
		lua_remove(Self.state, index)
	End

	Method Replace:Void(index:Int)
		lua_replace(Self.state, index)
	End

	Method Resume:Int(fromState:lua_State Ptr, argCount:Int)
		Return lua_resume(Self.state, fromState, argCount)
	End

	Method Rotate:Void(index:Int, count:Int)
		lua_rotate(Self.state, index, count)
	End

	Method SetField:Void(index:Int, key:String)
		lua_setfield(Self.state, index, key)
	End

	Method SetGlobal:Void(name:String)
		lua_setglobal(Self.state, name)
	End

	Method SetI:Void(index:Int, n:Int)
		lua_seti(Self.state, index, n)
	End

	Method SetMetatable:Void(index:Int)
		lua_setmetatable(Self.state, index)
	End

	Method SetTable:Void(index:Int)
		lua_settable(Self.state, index)
	End

	Method SetTop:Void(index:Int)
		lua_settop(Self.state, index)
	End

	Method SetUserValue:Void(index:Int)
		lua_setuservalue(Self.state, index)
	End

	Method Status:Void()
		lua_status(Self.state)
	End

	Method StringToNumber:Int(str:String)
		Return lua_stringtonumber(Self.state, str)
	End

	Method ToBoolean:Bool(index:Int)
		Return lua_toboolean(Self.state, index)
	End

	Method ToCFunction:lua_CFunction(index:Int)
		Return lua_tocfunction(Self.state, index)
	End

	Method ToInteger:Int(index:Int)
		Return lua_tointeger(Self.state, index)
	End

	Method ToIntegerX:Int(index:Int, isInt:Int Ptr)
		Return lua_tointegerx(Self.state, index, isInt)
	End

	Method ToLString:String(index:Int, length:Int Ptr)
		Return lua_tolstring(Self.state, index, length)
	End

	Method ToNumber:Float(index:Int)
		Return lua_tonumber(Self.state, index)
	End

	Method ToNumberX:Float(index:Int, isNumber:Int Ptr)
		Return lua_tonumberx(Self.state, index, isNumber)
	End

	Method ToPointer:Void Ptr(index:Int)
		Return Null'lua_topointer(Self.state, index)
	End

	Method ToString:String(index:Int)
		Return lua_tostring(Self.state, index)
	End

	Method ToThread:lua_State Ptr(index:Int)
		Return lua_tothread(Self.state, index)
	End

	Method ToUserdata:Void Ptr(index:Int)
		Return lua_touserdata(Self.state, index)
	End

	Method Type:Int(index:Int)
		Return lua_type(Self.state, index)
	End

	Method TypeName:String(type:Int)
		Return lua_typename(Self.state, type)
	End

	Function UpValueIndex:Int(i:Int)
		Return lua_upvalueindex(i)
	End

	Method Version:lua_Number()
		Return lua_version(Self.state)[0]
	End

	Function XMove:Void(fromState:lua_State Ptr, toState:lua_State Ptr, count:Int)
		lua_xmove(fromState, toState, count)
	End

	Method Yield:Int(resultCount:Int)
		Return lua_yield(Self.state, resultCount)
	End

	Method YieldK:Int(resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
		Return lua_yieldk(Self.state, resultCount, context, kFuncPtr)
	End

	'aux api
	Method ArgCheck:Void(cond:Int, arg:Int, extraMessage:String)
		luaL_argcheck(Self.state, cond, arg, extraMessage)
	End

	Method ArgError:Void(arg:Int, extraMessage:String)
		luaL_argerror(Self.state, arg, extraMessage)
	End

	Method CallMeta:Int(obj:Int, e:String)
		Return luaL_callmeta(Self.state, obj, e)
	End

	Method CheckAny:Void(arg:Int)
		luaL_checkany(Self.state, arg)
	End

	Method CheckInteger:Int(arg:Int)
		Return luaL_checkinteger(Self.state, arg)
	End

	Method CheckLString:String(arg:Int, length:Int Ptr)
		Return luaL_checklstring(Self.state, arg, length)
	End

	Method CheckNumber:Float(arg:Int)
		Return luaL_checknumber(Self.state, arg)
	End

	Method CheckStack:Void(size:Int, message:String)
		luaL_checkstack(Self.state, size, message)
	End

	Method CheckString:String(arg:Int)
		Return luaL_checkstring(Self.state, arg)
	End

	Method CheckType:Void(arg:Int, type:Int)
		luaL_checktype(Self.state, arg, type)
	End

	Method CheckUData:Void Ptr(arg:Int, tableName:String)
		Return luaL_checkudata(Self.state, arg, tableName)
	End

	Method CheckVersion:Void()
		luaL_checkversion(Self.state)
	End

	Method DoFile:Bool(filename:String)
		Return luaL_dofile(Self.state, filename)
	End

	Method DoString:Bool(str:String)
		Return luaL_dostring(Self.state, str)
	End

	Method ExecResult:Int(stat:Int)
		Return luaL_execresult(Self.state, stat)
	End

	Method FileResult:Int(stat:Int, filename:String)
		Return luaL_fileresult(Self.state, stat, filename)
	End

	Method GetMetaField:Int(obj:Int, e:String)
		Return luaL_getmetafield(Self.state, obj, e)
	End

	Method GetMetatable:Int(tableName:String)
		Return luaL_getmetatable(Self.state, tableName)
	End

	Method GetSubTable:Bool(index:Int, fieldName:String)
		Return luaL_getsubtable(Self.state, index, fieldName)
	End

	Method GSub:String(source:String, find:String, replace:String)
		Return luaL_gsub(Self.state, source, find, replace)
	End

	Method LenAtIndex:Int(index:Int)
		Return luaL_len(Self.state, index)
	End

	Method LoadFile:Bool(filename:String)
		Local result := luaL_loadfile(Self.state, filename)
		If result <> LUA_OK
			Return False
		Endif
		
		Return True
	End

	Method LoadFile:Bool(filename:String, mode:String)
		Local result := luaL_loadfilex(Self.state, filename, mode)
		If result <> LUA_OK
			Return False
		Endif
		
		Return True
	End

	Method LoadString:Int(str:String)
		Return luaL_loadstring(Self.state, str)
	End

	Method NewLib:Void(library:luaL_Reg[])
		' TODO
	End

	Method NewLibTable:Void(library:luaL_Reg[])
		' TODO
	End

	Method NewMetatable:Int(tableName:String)
		Return luaL_newmetatable(Self.state, tableName)
	End

	Method OpenLibs:Void()
		luaL_openlibs(Self.state)
	End

	Method OptInteger:lua_Integer(arg:Int, def:Int)
		Return luaL_optinteger(Self.state, arg, def)
	End

	Method OptLString:String(arg:Int, def:String, len:Int Ptr)
		Return luaL_optlstring(Self.state, arg, def, len)
	End

	Method OptNumber:lua_Number(arg:Int, def:Float)
		Return luaL_optnumber(Self.state, arg, def)
	End

	Method OptString:String(arg:Int, def:String)
		Return luaL_optstring(Self.state, arg, def)
	End

	Method Ref:Int(t:Int)
		Return luaL_ref(Self.state, t)
	End

	Method RequireF:Void(moduleName:String, openFunc:lua_CFunction, glb:Int)
		luaL_requiref(Self.state, moduleName, openFunc, glb)
	End

	Method SetFuncs:Void(l:luaL_Reg Ptr, nup:Int)
		luaL_setfuncs(Self.state, l, nup)
	End

	Method SetMetatable:Void(tableName:String)
		luaL_setmetatable(Self.state, tableName)
	End

	Method TestUData:Void Ptr(arg:Int, tableName:String)
		Return luaL_testudata(Self.state, arg, tableName)
	End

	Method ToLStringAtIndex:String(index:Int, len:Int Ptr)
		Return luaL_tolstring(Self.state, index, len)
	End

	Method Traceback:Void(L1:lua_State Ptr, message:String, level:Int)
		luaL_traceback(Self.state, L1, message, level)
	End

	Method TypeNameAtIndex:String(index:Int)
		Return luaL_typename(Self.state, index)
	End

	Method Unref:Void(t:Int, ref:Int)
		luaL_unref(Self.state, t, ref)
	End

	Method WhereControl:Void(level:Int)
		luaL_where(Self.state, level)
	End
	
	'custom api
	Method PopBool:Bool()
		Local result := Self.ToBoolean(-1)
		Self.Pop(1)
		Return result
	End
	
	Method PopInteger:lua_Integer()
		Local result := Self.ToInteger(-1)
		Self.Pop(1)
		Return result
	End
	
	Method PopNumber:lua_Number()
		Local result := Self.ToNumber(-1)
		Self.Pop(1)
		Return result
	End
	
	Method PopString:String()
		Local result := Self.ToString(-1)
		Self.Pop(1)
		Return result
	End
	
	Method GlobalBool:Bool(name:String)
		Self.GetGlobal(name)
		Local result:= Self.ToBoolean(-1)
		Self.Pop(1)
		Return result
	End
	
	Method GlobalInteger:lua_Integer(name:String)
		Self.GetGlobal(name)
		Local result:= Self.ToInteger(-1)
		Self.Pop(1)
		Return result
	End
	
	Method GlobalNumber:lua_Number(name:String)
		Self.GetGlobal(name)
		Local result:= Self.ToNumber(-1)
		Self.Pop(1)
		Return result
	End
	
	Method GlobalString:String(name:String)
		Self.GetGlobal(name)
		Local result:= Self.ToString(-1)
		Self.Pop(1)
		Return result
	End
End