require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @sample_text_file = File.open("sample_text.txt", "r")
    sample_text = @sample_text_file.read
    @text = Text.new(sample_text)
  end

  def test_swap
    new_text = @text.swap('a', 'e')
    expected = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected, new_text)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @sample_text_file.close
    # puts "File has been closed: #{@sample_text_file.closed?}"
  end
end
