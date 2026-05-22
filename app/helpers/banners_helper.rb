module BannersHelper
  
  def sortweights
    values = []
    -10.upto(10) do |val|
      values << [val, val]
    end
    values
  end
  
end
