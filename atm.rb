# "80% of the program is working fine, just need to include the find method"
require 'rubygems'
require 'mysql'

class Account
  def initialize(account_number, name, job, gender, balance)
    @account_number = account_number
    @name = name
    @job = job
    @gender = gender
    @balance = balance
    @con = Mysql.new('localhost', 'root', 'vanniekerk', 'banking_system');
    begin 
      # Hello World
      # Newbie
       
      st = @con.prepare("INSERT INTO Accounts(account_number, name, job, gender, balance)VALUES(?, ?, ?, ?, ?)")
      st.execute(account_number, name, job, gender, balance)
     
      st.close  
      con.commit
    rescue Exception => e
       puts e
       puts e.backtrace.join('\n')
      
    end
  end
   
  
  def deposit(amount)
      num = @balance.to_f
      num += amount
      update_balance(num)
  end

#########################################################################################

def find(name)
  #sql = ("SELECT * FROM Accounts WHERE name = ?")
  st = @con.query("SELECT * FROM Accounts WHERE name = '#{name}';")
  st.execute(name)
  #result = fetchResults(st)
  st.close
  con.commit
  #return result
end

#########################################################################################
# Got this from Sedy but I still can't get it to work correctly
#def find(name)
#    st = @con.query("SELECT * FROM Accounts WHERE name = '#{name}'")
#    st.each {|y| print y, " "}
#end

#########################################################################################



  def withdraw(amount)
    num = @balance.to_f
    num -= amount
    update_balance(num)
  end
  
  def update_balance(new_balance)
    @balance = new_balance
    st = @con.query("UPDATE Accounts SET balance = '#{new_balance}'  WHERE name = '#{@name}'")

  end

  def balance
    #st = SELECT * FROM Accounts WHERE name = Steve
    puts "Name: " + @name
    puts "Account number: " + @account_number.to_s 
    puts "Balance: " + @balance.to_s
    #return @balance
  end

  def transfer(amount, target_account)
    @balance -= amount
    target_account.deposit(amount)
  end

  def status
    return @balance
  end
end
