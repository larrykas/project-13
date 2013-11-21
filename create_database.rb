require 'rubygems'
require 'mysql'
 
begin 
  
  con = Mysql.new('localhost', 'root', '**********', 'banking_system')
  st = con.prepare("INSERT INTO Accounts(account_number, name, job, gender, balance)VALUES(?, ?, ?, ?, ?)")
  st.close  
  con.commit
rescue Exception => e
  puts e
  puts e.backtrace.join('\n')
         
end
