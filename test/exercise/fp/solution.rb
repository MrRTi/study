module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selection=array.map do |element|
          if element["country"].to_s.include? ','
            element["rating_kinopoisk"].to_f
          end
        end
        av_rate=selection.compact.delete_if{|element| element == 0}
        av_rate.reduce(:+)/av_rate.size
      end

      def chars_count(films, threshold)
        selection=films.map do |element|
            if element["rating_kinopoisk"].to_f >= threshold
              element["name"]
            end
        end
        a=selection.compact.to_s.count "и"
      end
    end
  end
end
