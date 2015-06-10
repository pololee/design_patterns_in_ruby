require_relative "simple_writer"
require_relative "writer_decorator"

class TimeStampingWriter < WriterDecorator
	def write_line(line)
		@real_writer.write_line("#{Time.now}: #{line}")
	end
end

writer = TimeStampingWriter.new(SimpleWriter.new('final.txt'))
writer.write_line('with time stamp')