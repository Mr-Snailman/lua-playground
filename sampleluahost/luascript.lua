print("Hello world, says Lua")
print("success from c++", cppvar)
luavar = cppvar * 3

function myluafunction(times)
  return string.rep("(-)", times)
end

function myfunction(arg)
  return cppfunction(arg)
end

