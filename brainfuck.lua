__BFFILE = arg[#arg]
__BFCOMMANDS = {
	["+"] = BFAdder,
	["-"] = -1,
	["<"] = 1,
	[">"] = -1,
	["."] = io.write,
	[","] = io.read,
	["["] = nil,
	["]"] = nil,
	
}

function BFAdder(Cell)
	Cell = Cell + 1
	if Cell > 255 then
		Cell = 0
	end



if #arg ~= 1 then
	error("Expected 1 file input, instead got "..#arg)
end