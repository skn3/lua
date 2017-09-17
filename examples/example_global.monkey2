Namespace demo

#Import "<lua>"
#Import "<std>"

#Import "assets/example_global.lua"

Using lua..
Using std..

Const filename:String = AssetsDir()+"example_global.lua"

Function Main()
    Local state := luaL_newstate()
    
    'standard libs
    luaL_openlibs(state)
    
    'load the script
    Local result := luaL_loadfile(state, filename)
    
    if result <> LUA_OK
		print_error(state)
		Return
	Endif
	
	'execute the script
	result = lua_pcall(state, 0, LUA_MULTRET, 0)
	
	If result <> LUA_OK
		print_error(state)
		Return
	Endif
	
	'lets get a global from the script
	lua_getglobal(state, "myGlobal1")
	Local myGlobal:Float = lua_tonumber(state, -1)
	
	Local myInt:Int
	lua_numbertointeger(myGlobal, Varptr myInt)
	
	Print "myGlobal1 = "+myGlobal
	Print "myInt = "+myInt
	
	Print "done!"
End

Function print_error(state:lua_State ptr)
	'The error message is on top of the stack.
	'Fetch it, print it and then pop it off the stack.
	Local message := lua_tostring(state, -1)
	Print message
	lua_pop(state, 1)
End