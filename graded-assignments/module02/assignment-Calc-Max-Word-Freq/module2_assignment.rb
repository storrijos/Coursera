#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer

  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency
  end

  def calculate_word_frequency()
      words = content.split(' ')
      frequencyHash = Hash.new(0)

      words.each do |w| 
          frequencyHash[w.downcase] += 1
      end
      
      #Select the most popular word count 
      @highest_wf_count = frequencyHash.values.max

      #Select the most popular words 
      @highest_wf_words = frequencyHash.select {|key, value| value == @highest_wf_count }.keys

  end
  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
end

#  Implement a class called Solution. 
class Solution

  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  #analyzers - an array that will hold a LineAnalyzer for each line of the input text file
  #• highest_count_across_lines - a number with the value of the highest frequency of a word
  #• highest_count_words_across_lines - an array of LineAnalyzers with the words with the highest frequency

  def initialize()
    @analyzers = Array.new()
  end

  def analyze_file()

    text_lines = []

    File.foreach('test.txt') do |line|

      text_lines << line

    end

    text_lines.each_with_index do |item, index| 
      @analyzers << LineAnalyzer.new(item, index)
    end

  end    

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  def calculate_line_with_highest_frequency()
    #Initialize to compare with integers

    @highest_count_across_lines = 0
    @highest_count_words_across_lines = Array.new()

    #maximum value for highest_wf_count contained by the LineAnalyzer objects

    @analyzers.each do |item|
        if item.highest_wf_count > @highest_count_across_lines
          @highest_count_across_lines = item.highest_wf_count
        end
    end

    @analyzers.each do |item|
        if item.highest_wf_count == @highest_count_across_lines
          @highest_count_words_across_lines << item
        end  
    end

  end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format

  def print_highest_word_frequency_across_lines()

    #Format: 
    #The following words have the highest word frequency per line:
    #["word1"] (appears in line #)
    #["word2", "word3"] (appears in line #)

    @highest_count_words_across_lines.each do |item| 
      puts "The following words have the highest word frequency per line:"
      puts "#{item.highest_wf_words} (appears in line #{item.line_number})"
    end

  end  

end