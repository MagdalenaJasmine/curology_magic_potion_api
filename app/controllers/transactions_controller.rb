class TransactionsController < ApplicationController
    def create
        ccNum = params[:payment][:ccNum]
        exp = params[:payment][:exp]
        email = params[:email]
        quantity = params[:quantity]
        total = params[:total]

        transaction = Transaction.new(quantity: quantity, total: total)

        ActiveRecord::Base.transaction do
            user = transaction.create_user!(email: email)
            payment = transaction.create_payment!(ccNum: ccNum, exp: exp, user: user)
            transaction.save!
        end
        render json: {"id": transaction.id}, status: 201
    rescue ActiveRecord::RecordInvalid => exception
        puts "Oops. We tried to do an invalid operation!"
        render json: {"error": exception.message}, status: 422
    end

end
