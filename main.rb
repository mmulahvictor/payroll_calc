class Payroll
  attr_accessor :basic_salary, :benefits

  def initialize(basic_salary, benefits)
    @basic_salary = basic_salary
    @benefits = benefits
  end

  def gross_salary
    @basic_salary + @benefits
  end

  def payee 
    #payable tax. 
      first_deductions = 24000 * 0.1
      second_deductions = (self.gross_salary - 24000) * 0.25
      third_deductions = (self.gross_salary - 32333)  * 0.3
      personal_relief = 2400

      if self.gross_salary == 24000
        first_deductions - personal_relief
      elsif self.gross_salary > 24000 && self.gross_salary <= 32333
        first_deductions + second_deductions - personal_relief
      elsif self.gross_salary > 32333
        first_deductions + second_deductions + third_deductions -personal_relief
      else
        return "Enjoy yourself!"
      end   
  end

  def nhif_deductions
    if self.gross_salary >1000 && self.gross_salary <= 5999
        return 150
    elsif self.gross_salary > 5999 && self.gross_salary <= 29999 
        return 850 
    elsif self.gross_salary >29999 && self.gross_salary <= 44999
        return 1000
    elsif gross_salary >= 100000 
        return 1700
    else
        return 0 
    end 
  end

  def nssf_deductions
    nhif_deduction = self.gross_salary * 6/100
    if nhif_deduction > 1080
      return 1080
    else
      return nhif_deduction
    end
  end
  
  def net_salary
    self.gross_salary - self.payee - self.nhif_deductions - self.nssf_deductions
  end

  def print_salary

    
    puts "GROSS SALARY: #{self.gross_salary}"
    puts "PAYE: #{self.payee}"
    puts "NHIF: #{self.nhif_deductions}"
    puts "NSSF: #{self.nssf_deductions}"
    puts "SALARY: #{self.net_salary}"
    
    
  end
end

salary = Payroll.new(40000, 3000)
salary.print_salary
