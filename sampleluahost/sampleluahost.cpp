#include <iostream>
#include <lua.hpp>

extern "C" {
	static int l_cppfunction(lua_State *L) {
    double arg = luaL_checknumber(L, 1);
    lua_pushnumber(L, arg * 0.5);
    return 1;
	}
}

using namespace std;
int main() {
  cout << "Test Lua embedding..." << endl;
  lua_State *L;
  L = luaL_newstate();
  luaL_openlibs(L);

  if (luaL_loadfile(L, "luascript.lua")) {
    cerr << "Oops, file cant load." << endl;
    lua_pop(L, 1);
  }

  lua_pushnumber(L, 1.1);
  lua_setglobal(L, "cppvar");

  if (lua_pcall(L, 0, LUA_MULTRET, 0)) {
    cerr << "Oops on LUA_MULTRET pcall" << endl;
    lua_pop(L, 1);
  }

  lua_getglobal(L, "luavar");
  double luavar = lua_tonumber(L, -1);
  lua_pop(L, 1);

  lua_getglobal(L, "myluafunction");
  lua_pushnumber(L, 5);
  lua_pcall(L, 1, 1, 0);
  lua_pop(L, 1);

  lua_pushcfunction(L, l_cppfunction);
  lua_setglobal(L, "cppfunction");

  lua_getglobal(L, "myfunction");
  lua_pushnumber(L, 5);
  lua_pcall(L, 1, 1, 0);
  lua_pop(L, 1);

  lua_close(L);
}
