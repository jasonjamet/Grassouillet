# -*- encoding : utf-8 -*-
module UsersHelper

  def bool2String b
    if b
      return "Oui"
    else
      return "Non"
    end
  end

  def getIMC user
    if user.size.present? && user.actual_weight.present?
      res = (((user.actual_weight+0.00)/(user.size*user.size))*10000).round()
      return res
    else
      return 0
    end
  end

  def getWeightByImcCategory min, max
    @users=User.all
    array=[]
    @users.each do |user|
      imc=getIMC user
      if(imc >= min && imc <= max)
        array << imc
      end
    end
      return array
  end

  def getCurrentsWeight
    @users=User.all
    array=[]
    @users.each do |user|
      array << user.actual_weight
    end
    return array
  end

  def getIdealsWeight
    @users=User.all
    array=[]
    @users.each do |user|
      array << user.ideal_weight
    end
    return array
  end


  def getArrayForBoxPlot list
    puts "maliste:"
    puts list
    if list.count == 0
      return [0, 0,  0, 0  ,0]
    end
    if list.count == 1
      return [list[0], (excel_lower_quartile list),  (median list), (excel_upper_quartile list)  ,list[0]]
    end
    if list.count == 2
      return [0, 0,  0, 0  ,0]
    end
    if list.count > 2
      return [list.min, (excel_lower_quartile list),  (median list), (excel_upper_quartile list)  ,list.max]
    end
  end

  def median(array)
    sorted = array.sort
    len = sorted.length
    if len==0
      return 0
    else

      return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
  end

  def excel_quartile(array, quartile)
    # Returns nil if array is empty and covers the case of array.length == 1
    return array.first if array.length <= 1
    sorted = array.sort
    # The 4th quartile is always the last element in the sorted list.
    return sorted.last if quartile == 4
    # Source: http://mathworld.wolfram.com/Quartile.html
    quartile_position = 0.25 * (quartile*sorted.length + 4 - quartile)
    quartile_int = quartile_position.to_i
    lower = sorted[quartile_int - 1]
    upper = sorted[quartile_int]
    lower + (upper - lower) * (quartile_position - quartile_int)
  end

  def excel_lower_quartile(array)
    excel_quartile(array, 1)
  end

  def excel_upper_quartile(array)
    excel_quartile(array, 3)
  end

end
