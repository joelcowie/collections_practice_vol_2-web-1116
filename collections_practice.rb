def begins_with_r(tools)
  tools.all? do |tool|
    tool.start_with?("r")
  end
end

def contain_a(array)
  array.select do |element|
    element.include?("a")
  end
end

def first_wa(array)
  array.find do |element|
    element.to_s.start_with?("wa")
  end
end

def remove_non_strings(array)
  array.delete_if do |element|
    !(element.kind_of?(String))
  end
end

def count_elements(array)
  array.group_by(&:itself).map{|k, v| k.merge(count: v.length)}
  #ok, I found this solution by searching around on stackexchange, but it's actually pretty awesome.
  #.group_by(&:itself) puts all the identical values together under the same key, which we count with v.length.
  #map applies that code to everything in the hash, and merge combines them into one.
end

def merge_data(keys, data)
  array = []
  count = 0
  data.each do |person|
    person.each do |name, data|
      array.push({:first_name => name})
      data.each do |trait, value|
        array[count][trait] = value
      end
      count += 1
    end
  end
  return array
end

def find_cool(hash)
  array = []
  hash.each do |info|
    info.each do |key, value|
      if value == "cool"
        array.push(info)
      end
    end
  end
  array
end

def organize_schools(hash)
  final = {}
  hash.each do |school, location|
    location.each do |key, city|
      final[city] = [] if final[city] == nil
      final[city] << school
    end
  end
  return final
end
