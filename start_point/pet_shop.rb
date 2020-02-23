def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop,breed)
  pets = []
  for pet in pet_shop[:pets]
    if(pet[:breed] == breed)
      pets.push(pet)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop,name)
  pet_by_name = pet_shop[:pets].find {|pet| pet[:name] == name}
  return pet_by_name
end

def remove_pet_by_name(pet_shop,name)
  pet = find_pet_by_name(pet_shop,name)
  if(pet!=nil)
    pet_shop[:pets].delete(pet)
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  if(customer[:cash] >= amount)
    customer[:cash] -= amount
    return true
  else
    return false
  end
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if(customer[:cash] >= new_pet[:price])
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if (pet!= nil)
    if( remove_customer_cash(customer, pet[:price]))
      remove_pet_by_name(pet_shop,pet[:name])
      increase_pets_sold(pet_shop,1)
      add_or_remove_cash(pet_shop,pet[:price])
      add_pet_to_customer(customer, pet)
    end
  end
end
