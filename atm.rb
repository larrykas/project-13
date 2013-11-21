require 'rubygems'
require 'mysql'

class Account
  def initialize(account_number, name, job, gender, balance)
    @account_number = account_number
    @name = name
    @job = job
    @gender = gender
    @balance = balance
    @con = Mysql.new('localhost', 'root', '**********', 'banking_system');
    begin 
      
      #con.query("CREATE TABLE IF NOT EXISTS \ Accounts(account_number INT PRIMARY KEY, name VARCHAR(50), job VARCHAR(25), gender VARCHAR(6), balance INT(25))");
      st = con.prepare("INSERT INTO Accounts(account_number, name, job, gender, balance)VALUES(?, ?, ?, ?, ?)")
      st.execute(11239, 'Larry', 'Pro', 'male', 3400)
      st.execute(11240, 'Sedy', 'Analyst', 'male', 2400)
      st.execute(11241, 'Cheryl', 'Accountant', 'female', 2400)
      st.close  
      con.commit
      rescue Exception => e
             puts e
             puts e.backtrace.join('\n')
         
      end
  end
   
  def insert(dto) 
    
  end
  
  def deposit(amount)
      bal = balance()
      num = bal.to_f
      num += money
      st = @db.query("UPDATE Accounts SET balance = '#{@balance}'  WHERE name = '#{@name}'")
      puts bal
  end

#########################################################################################


  def withdraw(amount)
    @balance -= amount
  end

  def balance
    puts "Name: " + @name
    puts "Account number: " + @account_number.to_s 
    puts "Balance: " + @balance.to_s
  end

  def transfer(amount, target_account)
    @balance -= amount
    target_account.deposit(amount)
  end

  def status
    return @balance
  end
end
