class Account
  def initialize(balance, name, account_number, con)
    @balance = balance
    @name = name
    @account_number = account_number
    
    @con = Mysql.new 'localhost', 'root', 'vanniekerk', 'banking_system'
    @co = con.prepare("INSERT INTO clients(account_number, name, job, gender, balance)")  
  end
  def deposit(money)
      bal = balance()
      num = bal.to_f
      num += money
      st = @db.query("UPDATE accounts SET balance = '#{balance}'  WHERE name = '#{name}'")
      puts bal
  end

end

# I can't get Just this little code to work.
