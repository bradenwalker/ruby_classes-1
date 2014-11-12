class Bank
#Create getter/setter access for all instance variables so they can be accessed from other methods and classes
  attr_accessor :bank_name
  attr_accessor :accounts
  attr_accessor :individual_account
  attr_accessor :account_balance
  attr_accessor :person
  attr_accessor :deposit_amount
  attr_accessor :total_cash


  def initialize(bank_name)
    @bank_name = bank_name
#Initialize total_cash at 0 so it can be added to and subtracted from later on
    @total_cash = 0
#Initialize an empty array of accounts
    @accounts = []
    puts @bank_name + " bank was just created."
  end

  def open_account(person)
#My idea here was to create an array (@accounts) of hashes, but I had trouble trying to access the keys/values.
    @individual_account = {:account_name => person.customer_name, :account_balance => 0}
    @accounts.push(individual_account)
    puts person.customer_name + ", thanks for opening an account at " + bank_name + "!"
  end

  def deposit(person, deposit_amount)
    @person = person
    @deposit_amount = deposit_amount
#Check to see if the person has enough cash to make the deposit
    if person.cash >= deposit_amount
	    person.cash -= deposit_amount
	#This was my solution to the above problem accessing the keys/values in the @individual_account hash. For each method I checked the bank name and deposited or withdrew from the person's appropriate balance. I realize that this creates problems, though. This doesn't allow for the creation of new Banks and/or Banks with different name spellings. So this is a temporary solution at best. It would be great to learn how to refactor this to work for more test cases!
	    if bank_name == "Wells Fargo"
	#If the bank we're depositing is Wells Fargo, add the deposit amount to the person's Wells Fargo balance.
	      person.wf_balance += deposit_amount
	#Convert the integer values to strings so they can be printed
	      puts person.customer_name + " deposited $" + deposit_amount.to_s + " to " + bank_name + ". " + person.customer_name + " has $" + person.cash.to_s + ". " + person.customer_name + "'s acccount has $" + person.wf_balance.to_s + "."
	    else
	#In this setup, "else" assumes the only other value for bank_name is "Chase." Proceed as before but add the amount of the deposit to the person's Chase balance.
	      person.chase_balance += deposit_amount
	      puts person.customer_name + " deposited $" + deposit_amount.to_s + " to " + bank_name + ". " + person.customer_name + " has $" + person.cash.to_s + ". " + person.customer_name + "'s acccount has $" + person.chase_balance.to_s + "."
	    end
	#If the person doesn't have enough cash to make the deposit, display this message:
	else puts person.customer_name + " does not have enough cash to deposit $" + deposit_amount.to_s + "."
	end
	#Add the amount of the deposit to the bank's total cash.
	@total_cash += deposit_amount
  end


#The withdraw method is very similar to the deposit method. Here though we're checking to see if the person's account has enough funds to cover the withdrawal. If so, check the bank_name and withdraw from the person's appropriate balance. 
  def withdraw(person, withdrawal_amount)
    @person = person
    @withdrawal_amount = withdrawal_amount
    person.cash += withdrawal_amount
    if bank_name == "Wells Fargo"
      if person.wf_balance >= withdrawal_amount
	      person.wf_balance -= withdrawal_amount
	      puts person.customer_name + " withdrew $" + withdrawal_amount.to_s + " from " + bank_name + ". " + person.customer_name + " has $" + person.cash.to_s + ". " + person.customer_name + "'s acccount has $" + person.wf_balance.to_s + "."
	  else puts person.customer_name + " does not have enough money in the account to withdraw $" + withdrawal_amount.to_s + "."
	  end
    else
      if person.chase_balance >= withdrawal_amount
	      person.chase_balance -= withdrawal_amount
	      puts person.customer_name + " withdrew $" + withdrawal_amount.to_s + " from " + bank_name + ". " + person.customer_name + " has $" + person.cash.to_s + ". " + person.customer_name + "'s acccount has $" + person.chase_balance.to_s + "."
#	If the amount of the withdrawal is greater than the customer's balance, display a message stating the customer doesn't have enough funds.
	  else puts person.customer_name + " does not have enough money in the account to withdraw $" + withdrawal_amount.to_s + "."
	  end
    end
    #Subtract the withdrawal amount from the bank's total cash.
    @total_cash -= withdrawal_amount
  end  

  def transfer(person, transfer_bank, transfer_amount)
    @person = person
    @transfer_bank = transfer_bank
    @transfer_amount = transfer_amount
    if transfer_bank.bank_name == "Chase"
#if the bank we're transferring to is named "Chase", subtract the transfer amount from the person's Wells Fargo balance and add it to their Chase balance.
	  person.wf_balance -= transfer_amount
	  person.chase_balance += transfer_amount 
	  puts person.customer_name + " transfered $"+ transfer_amount.to_s + " from the " + bank_name + " account to the " + transfer_bank.bank_name + " account. The " + bank_name +  " account has $" + person.wf_balance.to_s + " and the " + transfer_bank.bank_name + " account has $" + person.chase_balance.to_s + "."
	else
#If the transfer_bank is not chase, this assumes it is wells_fargo. Subtract transfer_amount from their Chase balance and add it to their Wells Fargo balance.
      person.chase_balance -= transfer_amount
      person.wf_balance += transfer_amount 
	  puts person.customer_name + " transfered $"+ transfer_amount.to_s + " from the " + bank_name + " account to the " + transfer_bank.bank_name + " account. The " + bank_name +  " account has $" + person.chase_balance.to_s + " and the " + transfer_bank.bank_name + " account has $" + person.wf_balance.to_s + "."
    end
#Subtract the transfer amount from the bank's total cash ...
    @total_cash -= transfer_amount
#... And add it to the total cash of the bank we are transferring to.
    transfer_bank.total_cash += transfer_amount
  end

  def total_cash_in_bank
    puts bank_name + " has $" + total_cash.to_s + " in the bank."
  end

end


class Person
  attr_accessor :customer_name
  attr_accessor :cash
  attr_accessor :wf_balance
  attr_accessor :chase_balance

  def initialize(customer_name, cash)
    @customer_name = customer_name
    @cash = cash
    @wf_balance = 0
    @chase_balance = 0
    puts "Hi, " + customer_name + ". You have $" + cash.to_s + "!" 
  end

end



# Test code:
chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)

chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)

chase.transfer(me, wells_fargo, 100)
chase.deposit(me, 5000)
chase.withdraw(me, 5000)

puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank