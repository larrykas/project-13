require 'mysql'

class Account
  def initialize(balance, name, job, account_number)
    @balance = balance
    @name = name
    @job = job
    @account_number = account_number
    
    @con = Mysql.new 'localhost', 'root', '**********', 'banking_system'
   
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
code with a new message, it looks like the new account was sucessfully created
############################################################################################
Larry$ irb
irb(main):001:0> load './atm.rb'
=> true
irb(main):002:0> a = Account.new(3500, "Larry", "CEO", 11238)
=> #<Account:0x007fc3b1ab8fc0 @balance=3500, @name="Larry", @job="CEO", @account_number=11238, @con=#<Mysql:0x007fc3b1ab8e08 @fields=nil, @protocol=#<Mysql::Protocol:0x007fc3b1ab8cf0 @insert_id=0, @warning_count=0, @gc_stmt_queue=[], @state=:READY, @read_timeout=nil, @write_timeout=nil, @sock=#<UNIXSocket:fd 7>, @authinfo=["root", "vanniekerk", "banking_system", 0, nil], @seq=3, @sqlstate="00000", @server_info="5.6.13", @server_version=50613, @thread_id=50, @charset=#<Mysql::Charset:0x007fc3b184aea0 @csname="utf8_general_ci", @name="utf8", @number=33, @unsafe=false>>, @charset=#<Mysql::Charset:0x007fc3b184aea0 @csname="utf8_general_ci", @name="utf8", @number=33, @unsafe=false>, @connect_timeout=nil, @read_timeout=nil, @write_timeout=nil, @init_command=nil, @sqlstate="00000", @query_with_result=true, @host_info="Localhost via UNIX socket", @last_error=nil, @result_exist=false, @local_infile=nil>>
