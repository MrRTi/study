module Exercise
  module Arrays
    class << self
      def replace(array)
        for i in 0..(array.length-1)
          if array[i]>0
            array[i] = array.max
          end
        end
        array
      end

      def search(array, query)
        return -1 if array.empty?
        if array.length == 1
          if array[0] == query
            return 0
          else return -1
          end
        end

        right = array.length-1
        left=0

        while right >= left
          if right == left
            if array[right] == query
              return right
            else return -1
            end
          end
          center = (right+left).div 2
          if array[center] == query
            return center
          elsif array[center] > query
            right = center - 1
          else
            left = center + 1
          end
        end
      end
    end
  end
end
