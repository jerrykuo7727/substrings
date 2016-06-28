def substrings(text, words)
	matches = Hash.new(0)
	words.each do |word|
		if text.include? word
			matches[word] = text.scan(/#{word}/).length
		end
	end
	return matches
end

puts "********************************************"
puts "* Please enter a text and a list of words  *"
puts "* to show times a word appear in the text. *"
puts "********************************************"
puts "Please enter a text: "
#text = gets.chomp.downcase
text = "Howdy partner, sit down! How's it going?".downcase
puts "Please enter a list of words:"
#words = gets.chomp.downcase.scan(/\w+/)
words = "below down go going horn how howdy it i low own part partner sit".downcase.scan(/\w+/)
length = words.map(&:size).max + 2
matches = substrings(text, words)
max_time = matches.max_by{|k,v| v}[1].to_s.length
p max_time
matches.each do |word, time|
	puts "#{("\""<<word<<"\"").ljust(length)} was found #{time.to_s.rjust(max_time)} times."
end