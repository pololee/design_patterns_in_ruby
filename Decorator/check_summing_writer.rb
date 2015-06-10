require_relative "simple_writer"
require_relative "writer_decorator"

class CheckSummingWriter < WriterDecorator
	attr_reader :check_sum

	def initialize(real_writer)
		@real_writer = real_writer
		@check_sum = 0
	end

	def write_line(line)
		line.each_byte {|byte| @check_sum = (@check_sum + byte) % 256}
		@check_sum += "\n".ord % 256
		@real_writer.write_line(line)
	end
end

writer = CheckSummingWriter.new(SimpleWriter.new('final.txt'))
writer.write_line('A line with checksum')