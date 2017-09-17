#Import "<lua>"
#Import "<std>"

#Import "assets/example_global.lua"

Using lua.wrapper
Using std..

Const filename:String = AssetsDir()+"example_global.lua"

Function Main()
    Local state := New LuaState()
    
    If Not state.LoadFile(filename)
	    Print state.PopString()
	    Return
	Endif
    
	'execute the script
	If Not state.PCall()
		Print state.PopString()
		Return
	Endif
	
	'lets get a global from the script
	Local myGlobal:Float = state.GlobalNumber("myGlobal1")
	
	Local myInt:Int
	'lua_numbertointeger(myGlobal, Varptr myInt)
	
	Print "myGlobal1 = "+myGlobal
	Print "myInt = "+myInt
	
	Print "done!"
End