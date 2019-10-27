require_relative 'dish'

class Restaurant
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def create_dish(name,price,dish = Dish)
    @dishes << dish.new(name, price)
  end

  def availabilty_checker
    @dishes.delete_if do |dish|
      dish.remaining_portions == 0
    end
  end

  def hold_portion_of_requested_dish(dish_name)

    @dishes.each do |dish|
      if dish.name == dish_name
        dish.remove_portion
        return {dish.name.to_sym => dish.price}
      end
    end


  end



end