class LinesService
  def initialize(id)
    @id = id.to_i
  end

  def call
    file = IO.readlines('lines.txt', chomp: true)
    return nil if @id > file.size

    result = nil
    file.each.with_index(1) do |line, index|
      next unless index == @id

      result = line
      break
    end

    result
  end
end
