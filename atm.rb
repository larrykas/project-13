class Account
  def initialize(balance, name, account_number, con)
    @balance = balance
    @name = name
    @account_number = account_number
    
    @con = Mysql.new 'localhost', 'root', '**********', 'banking_system'
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

############################################################################################
code with error messages every time I cahnge something I get a differrent kind of error
############################################################################################
Larry$ irb
irb(main):001:0> load './atm.rb'
=> true
irb(main):002:0> a = Account.new(011238, "Larry", "CEO", "Male", 5000)
SyntaxError: (irb):2: Invalid octal digit
a = Account.new(011238, "Larry", "CEO", "Male", 5000)
                      ^
	from /Users/Larry/.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'
irb(main):003:0> a = Account.new(1238, "Larry", "CEO", "Male", 5000)
ArgumentError: wrong number of arguments (5 for 4)
	from /Users/Larry/Desktop/projects/ruby-project-13/atm.rb:2:in `initialize'
	from (irb):3:in `new'
	from (irb):3
	from /Users/Larry/.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'
irb(main):004:0> a = Account.new(1238, "Larry", "CEO", 5000)
NameError: uninitialized constant Account::Mysql
	from /Users/Larry/Desktop/projects/ruby-project-13/atm.rb:7:in `initialize'
	from (irb):4:in `new'
	from (irb):4
	from /Users/Larry/.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'
irb(main):005:0> 

