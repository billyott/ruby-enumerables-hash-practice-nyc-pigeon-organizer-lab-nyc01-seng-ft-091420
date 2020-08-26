def nyc_pigeon_organizer(data)
  # write your code here!
  new_data = {}
  pigeon_names = []
  attributes = {}
  #get the unique names in a single array
  #fill 'attrbutes' with all possible attributes and qualifiers for those attributes
  data.each do |attribute,qualifiers|
    attributes[attribute] = []
    qualifiers.each do |qualifier,names|
      pigeon_names << names
      qualifier = qualifier.to_s
      attributes[attribute] << qualifier
    end
  end
  #structure 'new data'
  pigeon_names = pigeon_names.flatten.uniq
  pigeon_names.each do |name|
    new_data[name] = {}
    attributes.each do |attribute, qualifiers|
      new_data[name][attribute] = []
    end
  end
  # fill 'new data'
  pigeon_names.each do |name|
    attributes.each do |attribute,qualifiers|
      qualifiers.each do |qualifier|
        if data[attribute][qualifier] == nil
          qualifier = qualifier.to_sym
          if data[attribute][qualifier].include?(name)
            new_data[name][attribute] << qualifier.to_s
          end
        elsif data[attribute][qualifier].include?(name)
            new_data[name][attribute] << qualifier.to_s
        end
      end
    end
  end
  return new_data
end
