=begin

separator for words: ' '
separator for paragraphs: /\n\n/
separator for /\n/


=end

class TextAnalyzer
  def process
    text = File.open("sample_text.txt")
    yield(text.read)
    text.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |t| puts "#{t.split(/\n\n/).size} paragraphs"}
analyzer.process { |t| puts "#{t.split(/\n/).size} lines"}
analyzer.process { |t| puts "#{t.split(' ').size} words"}
