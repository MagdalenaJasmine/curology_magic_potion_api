require 'rspec'

describe TransactionsController, :type => :request do
  context '#create' do
    let(:email) { "maggie@gmail.com" }
    let(:quantity) { 2 }
    let(:total) { 2 }
    let(:ccNum) {"1234123412341234"}
    let(:exp) { "01/22"}
    let(:payment) {
      {
        "ccNum": ccNum,
        "exp": exp
      }
    }
    let(:json_body) {
      {
        "email": email,
        "quantity": quantity,
        "total": total,
        "payment": payment
      }
    }
    let(:header) {
      { "ACCEPT" => "application/json" }
    }
    subject { post "/api/magic", params: json_body, headers: headers }
    it 'succeeds' do
      subject
      expect(response).to have_http_status(:created)
    end

    it 'fails when a user email already exists' do
      existing_user = User.create(email: email)
      subject
      expect(response).to have_http_status(:unprocessable_entity)
    end
    context "when credit card number is malformed" do
      let(:ccNum) {"potato"}
      it 'fails' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context "when expiration is malformed" do
      let(:exp) {"potato"}
      it 'fails' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end