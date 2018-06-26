class Employee
  
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
  @name = name
  @title = title
  @salary = salary
  @boss = boss
  @boss.sub_employees << self if !boss.nil?
  end
  
  def bonus(multiplier)
    bonus = salary * multiplier
  end
  
end

class Manager < Employee
  attr_accessor :sub_employees

  def initialize(name, title, salary, boss, sub_employees = [])
    super(name, title, salary, boss)
    @sub_employees = sub_employees
  end
  
  def bonus(multiplier)
    queue = sub_employees.dup
    total_salary = 0
    
    until queue.empty?
      subordinate = queue.shift
      total_salary += subordinate.salary
      subordinate.sub_employees.each{ |emp| queue << emp } if subordinate.is_a?(Manager)
    end
    total_salary * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new('Ned', 'Founder', 1000000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78000, ned)
  shawna = Employee.new('Shawna', 'TA', 12000, darren)
  david = Employee.new('David', 'TA', 10000, darren)
  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)
end

