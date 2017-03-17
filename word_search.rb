
dictionarywords = {}

File.open("./dictionary.txt") do |file|
  file.each do |line|
    dictionarywords[line.strip.downcase] = true
  end
end
# p dictionarywords
letters = {
     "1" => ["1"],
       "2" => ["a", "b", "c"],
       "3" => ["d", "e", "f"],
       "4" => ["g", "h", "i"],
       "5" => ["j", "k", "l"],
       "6" => ["m", "n", "o"],
       "7" => ["p", "q", "r", "s"],
       "8" => ["t", "u", "v"],
       "9" => ["w", "x", "y", "z"]
    }

  def start(number, dictionarywords, letters)
    digits = number.to_s.split ''
    # Total number of combinations
    n = digits.inject(1) { |a,b| a * letters[b].size }

    words = []
    0.upto n-1 do |q|
      word = []
      digits.reverse.each do |digit|
        q, r = q.divmod letters[digit].size
        word.unshift letters[digit][r]
      end
      words << word.join
    end

    hash_value = []
    words.each do |a|
      for n in 2..a.size
        if a[0..n].split('').size >=3 && (dictionarywords[a[0..n]] && dictionarywords[a[(n+1)..a.size]] )
          if a[(n+1)..a.size] && a[(n+1)..a.size].size >= 3
            hash_value << [a[0..n], a[(n+1)..a.size]]
          end
        elsif a[0..n].split('').size == 10 && dictionarywords[a[0..n]]
          hash_value << [a[0..n]]
        end
      end
    end
    p hash_value.uniq
  end
  p "Please Enter 10 Digit Phone Number ::"
  input = gets.chomp
  start(input , dictionarywords, letters)