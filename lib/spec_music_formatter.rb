require 'spec/runner/formatter/progress_bar_formatter'


class SpecMusicFormatter < Spec::Runner::Formatter::ProgressBarFormatter
  
  SOUNDS_PATH = File.expand_path("#{File.dirname(__FILE__)}/../sounds")
  puts SOUNDS_PATH

  def example_failed(example, counter, failure)
    super
  end

  def example_passed(example)
    @count ||= 0
    system("/usr/bin/afplay #{SOUNDS_PATH}/#{@count % 3}.aif")
    super
    @count += 1
  end

  def example_pending(example, message, deprecated_pending_location=nil)
    super
  end
  
end