__BFFILE = arg[#arg]
__BFCOMMANDS = {
	["+"] = BFAdder,
	["-"] = BFSubtractor,
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

function BFSubtractor(Cell)
	Cell = Cell - 1
	if Cell < 0 then
		Cell = 255
	end
end


if #arg ~= 1 then
	error("Expected 1 file input, instead got "..#arg)
end