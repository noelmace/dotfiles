local json = require("jsonlua.json") -- TODO: use luarocks

json.load = function(path)
  local contents = ""
  local myTable = {}
  local file = io.open( path, "r" )

  if file then
      -- read all contents of file into a string
      local contents = file:read( "*a" )
      myTable = json.decode(contents);
      io.close( file )
      return myTable
  end
  return nil
end

return json