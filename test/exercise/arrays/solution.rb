module Exercise
  module Arrays
    class << self
      def replace(array)
        for i in 0..(array.length - 1)
          array[i] = array.max if array[i] > 0
        end
        array
      end

      def search(array, query)
        return -1 if array.empty?
        if array.length == 1
          return -1 unless array[0] == query
          return 0
        end

        right = array.length - 1
        left = 0

        while right >= left
          if right == left
            return -1 unless array[right] == query
            return right
          end
          center = (right + left).div 2
          return center if array[center] == query
          if array[center] > query
            right = center - 1
          else
            left = center + 1
          end
        end
      end
    end
  end
end
