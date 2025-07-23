__BFFILE = arg[#arg]
__BFCOMMANDS = {
	["+"] = BFAdder,
	["-"] = BFSubtractor,
	["<"] = BFRight,
	[">"] = BFLeft,
	["."] = io.write,
	[","] = io.read,
	["["] = nil,
	["]"] = nil,
}
__POINTER = 1
__BFSTACK = {0}

function BFFileToTable()
	local ProcessedFile = io.open(__BFFILE, "r")
	ProcessedFile:read("*all")
	local ParsingTable = {}
	for Position = 1, string.len(ProcessedFile) do
		table.insert(ParsingTable, ProcessedFile:sub(Position,Position))
	end
	return ParsingTable
end

function BFAdder(Cell)
	Cell = Cell + 1
	if Cell > 255 then
		Cell = 0
	end
end

function BFSubtractor(Cell)
	Cell = Cell - 1
	if Cell < 0 then
		Cell = 255
	end
end

function BFRight()
	__POINTER = __POINTER + 1
end

function BFLeft()
	__POINTER = __POINTER - 1
end

function BFLooper(Cell)
	while Cell > 0 do
		-- pending
	end
end

function BFMain()
	local Cell = __BFSTACK[__POINTER]
end


if #arg ~= 1 then
	error("Expected 1 file input, instead got "..#arg)
end