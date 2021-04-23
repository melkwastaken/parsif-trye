local a = 'wow potato'



local function TableClone(t)
	local nt = {}
	for i,v in next,t do
		nt[i] = v
	end
	return nt
end

local function GetIdFromLetterInHeiarchy(hi,let)
	local res
	
	for i,a in next,hi do
		local cres
		
		if type(a.Char)=='table'then
			cres = GetIdFromLetterInHeiarchy(a.Char,let)
			if cres then 
			end
		elseif a.Char==let then
			cres = ''
		end
		
		if not cres then continue end
		res = tostring(i - 1) ..  cres
		break
	end
	
	return res
end



local function HuffmanCompress(str)
	local res_dict = {}
	local res_str = ''
	
	local char_freq = {}
	local LeastArray = {}
	for p = 1,#str do
		local char = str:sub(p,p)
		
		if not char_freq[char]then
			char_freq[char] = 0
		end
		char_freq[char] += 1
	end
	
	for char,freq in next,char_freq do
		table.insert(LeastArray,{Char = char,Frequency = freq})
	end
	while #LeastArray>1 do 
		if workspace:FindFirstChild('Stop')then break end
		
		table.sort(LeastArray,function(a,b)
			return a.Frequency<b.Frequency
		end)
		
		local set1 = LeastArray[1]
		local set2 = LeastArray[2]
		
		table.remove(LeastArray,2)
		
		local newset = {}
		newset.Char = {set1,set2}
		newset.Frequency = set1.Frequency + set2.Frequency
		LeastArray[1] = newset
	end
	
	local res_dict = {}
	
	for p = 1,#str do
		local let = str:sub(p,p)
		local id = res_dict[let]
		if not id then
			res_dict[let] = GetIdFromLetterInHeiarchy(LeastArray,let):sub(2)
			id = res_dict[let]
		end
		res_str ..= id 
	end
	
	local inv_dict = {}
	for i,v in next,res_dict do
		inv_dict[v] = i
	end
	
	res_dict = inv_dict
	
	return res_dict,res_str
end

local function HuffmanDecompress(tab,str)
	local res = ''
	
	local curr_index = 1
	for p = 1,#str do
		local section = str:sub(curr_index,p)
		local let = tab[section]
		if not let then continue end
		res ..= let
		curr_index = p + 1
	end

	return res
end

local tab,str = HuffmanCompress(a)

print(tab,str)
print(HuffmanDecompress(tab,str))
