local a={}function a.new(b,c)if type(c)~="table"then error("Table expected, got "..type(c))end;if type(b)~="function"then error("Function expected, got "..type(c))end;local d={}function d.start()spawn(function()b(table.unpack(c))end)end;return d end
