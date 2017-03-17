
dic_w = {}

File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    dic_w[line.strip] = true
  end
end

LETTERS = {
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

    input = gets.chomp
    digits = input.to_s.split ''
    # Total number of combinations
    n = digits.inject(1) { |a,b| a * LETTERS[b].size }

    words = []
    0.upto n-1 do |q|
      word = []
      digits.reverse.each do |digit|
        q, r = q.divmod LETTERS[digit].size
        word.unshift LETTERS[digit][r]
      end
      words << word.join
    end

    hash_value = []
    words.each do |a|
      for n in 2..a.size
        if a[0..n].split('').size >=3 && (dic_w[a[0..n]] && dic_w[a[(n+1)..a.size]] )
          if a[(n+1)..a.size].present? && a[(n+1)..a.size].size >= 3
            hash_value << [a[0..n], a[(n+1)..a.size]]
          end
        elsif a[0..n].split('').size == 10 && dic_w[a[0..n]]
          hash_value << [a[0..n]]
        end
      end
    end
    p hash_value
