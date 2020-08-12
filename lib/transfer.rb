class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if self.sender.valid? && self.sender.balance > self.amount && self.status != "complete"

      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
      
    else
       self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      
    end  
  end
  
end
