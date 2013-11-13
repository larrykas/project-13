require 'mysql'
class Account
  def initialize(account_number, name, job, gender, balance)
    @account_number = account_number
    @name = name
    @job = job
    @gender = gender
    @balance = balance
    
    @con = Mysql.new 'localhost', 'root', '**********', 'banking_system'
    con.query("INSERT INTO clients(account_number, name, job, gender, balance)VALUES(?, ?, ?, ?)")  
  end
  def deposit(money)
      bal = balance()
      num = bal.to_f
      num += money
      st = @db.query("UPDATE accounts SET balance = '#{@balance}'  WHERE name = '#{@name}'")
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


############################################################################################
code with a new message, it looks like the new account was sucessfully created
############################################################################################
Larry$ irb
irb(main):001:0> load './atm.rb'
=> true
irb(main):002:0> a = Account.new(11238, "Larry", "CIO", "Male", 3400)
=> #<Account:0x007faadd9e7e08 @account_number=11238, @name="Larry", @job="CIO", @gender="Male", @balance=3400, @con=#<Mysql:0x007faadd9e7c50 @fields=nil, @protocol=#<Mysql::Protocol:0x007faadd9e7b88 @insert_id=0, @warning_count=0, @gc_stmt_queue=[], @state=:READY, @read_timeout=nil, @write_timeout=nil, @sock=#<UNIXSocket:fd 7>, @authinfo=["root", "**********", "banking_system", 0, nil], @seq=3, @sqlstate="00000", @server_info="5.6.13", @server_version=50613, @thread_id=56, @charset=#<Mysql::Charset:0x007faadc048a60 @csname="utf8_general_ci", @name="utf8", @number=33, @unsafe=false>>, @charset=#<Mysql::Charset:0x007faadc048a60 @csname="utf8_general_ci", @name="utf8", @number=33, @unsafe=false>, @connect_timeout=nil, @read_timeout=nil, @write_timeout=nil, @init_command=nil, @sqlstate="00000", @query_with_result=true, @host_info="Localhost via UNIX socket", @last_error=nil, @result_exist=false, @local_infile=nil>>
