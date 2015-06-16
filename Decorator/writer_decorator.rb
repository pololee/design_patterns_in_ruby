class WriterDecorator
	def initialize(real_writer)
		@real_writer = real_writer
	end

	def write_line(line)
		@real_writer.write_line(line)
	end

	def pos
		@real_writer.pos
	end

	def rewind
		@real_writer.rewind
	end

	def close
		@file.close
	end
end

=begin
A different version of writer_decorator

require 'forwardable'
class WriterDecorator
	extend Forwardable

	def_delegators :@real_writer, :write_line, :rewind, :pos, :close

	def initialize(real_writer)
		@real_writer = real_writer
	end
end
=end
