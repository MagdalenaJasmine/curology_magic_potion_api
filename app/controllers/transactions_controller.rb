class TransactionsController < ApplicationController
    def create
        ccNum = params[:payment][:ccNum]
        exp = params[:payment][:exp]
        user = User.new(email: params[:email])
        user.save!
        payment = Payment.new(user: user, ccNum: ccNum, exp: exp )
        payment.save!
        transaction = Transaction.new(quantity: params[:qty], total: params[:total], user: user, payment: payment )
        transaction.save!
        p params
    end 

end
