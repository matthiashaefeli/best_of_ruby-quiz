class Lcd
  attr_accessor :size, :numbers, :digits

  def initialize(size, numbers)
    @size = size
    @numbers = numbers.to_i
    @digits = []
    convert_number
    show_digits
  end

  def convert_number
    @numbers.to_s.chars.each do |number|
      case number.to_i
      when 0
        @digits << cero()
      when 1
        @digits << one()
      when 2
        @digits << two()
      when 3
        @digits << three()
      when 4
        @digits << four()
      when 5
        @digits << five()
      when 6
        @digits << six()
      when 7
        @digits << seven()
      when 8
        @digits << eight()
      when 9
        @digits << nine()
      end
    end
  end

  def cero
    nu = [' - ', '| |', '   ', '| |', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def one
    nu = ['   ', '  |', '   ', '  |', '   ']
    return nu if @size == 1
    change_size(nu)
  end

  def two
    nu = [' - ', '  |', ' - ', '|  ', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def three
    nu = [' - ', '  |', ' - ', '  |', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def four
    nu = ['   ', '| |', ' - ', '  |', '   ']
    return nu if @size == 1
    change_size(nu)
  end

  def five
    nu = [' - ', '|  ', ' - ', '  |', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def six
    nu = [' - ', '|  ', ' - ', '| |', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def seven
    nu = [' - ', '  |', '   ', '  |', '   ']
    return nu if @size == 1
    change_size(nu)
  end

  def eight
    nu = [' - ', '| |', ' - ', '| |', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def nine
    nu = [' - ', '| |', ' - ', '  |', ' - ']
    return nu if @size == 1
    change_size(nu)
  end

  def change_size(nu)
    nu.map! do |n|
      if n.include?('-')
        n[n.index('-') + 1] = '-' * (@size - 1)
        n += ' '
        n
      elsif (n =~ /\A\s*\Z/) == 0
        n += ' ' * (@size - 1)
        n
      elsif n[0] == '|' && n[-1] == '|'
        n[1] = ' ' * @size
        n
      elsif n[0] == ' ' && n[-1] == '|'
        n[0] = ' ' * @size
        n
      elsif n[0] == '|' && n[-1] == ' '
        n[-1] = ' ' * @size
        n
      end
    end
    counter = @size
    until counter == 1
      nu.insert(2, nu[1])
      nu.insert(-2, nu[-2])
      counter -= 1
    end
    nu
  end

  def show_digits
    columns = []
    @digits.transpose.each do |array|
      string = ''
      counter = 0
      until counter == @digits.length do
        string += array[counter]
        string += ' '
        counter += 1
      end
      columns << [string]
    end
    columns.each { |c| p c }
  end

end
