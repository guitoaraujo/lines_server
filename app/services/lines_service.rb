class LinesService
  def initialize(id)
    @id = id.to_i
  end

  def call
    file = IO.readlines('lines.txt', chomp: true)
    return if @id > file.size

    result = nil
    file.each_with_index do |line, index|
      if index == @id
        result = line
        break
      end
    end

    result
  end
end
