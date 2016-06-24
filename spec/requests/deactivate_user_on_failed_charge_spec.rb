require "spec_helper"

describe "Deactivate user on failed charge" do
  let(:event_data) do
         {
      "id"=>"evt_18Pr5EI8HOATFuBIGfN950tJ",
      "object"=>"event",
      "api_version"=>"2016-03-07",
      "created"=>1466762324,
      "data"=>{
        "object"=>{
          "id"=>"ch_18Pr5DI8HOATFuBIijQWOBWY",
          "object"=>"charge",
          "amount"=>999,
          "amount_refunded"=>0,
          "application_fee"=>nil,
          "balance_transaction"=>nil,
          "captured"=>false,
          "created"=>1466762323,
          "currency"=>"usd",
          "customer"=>"cus_8hEMd54WdSadQk",
          "description"=>"payment to fail",
          "destination"=>nil,
          "dispute"=>nil,
          "failure_code"=>"card_declined",
          "failure_message"=>"Your card was declined.",
          "fraud_details"=>{},
          "invoice"=>nil,
          "livemode"=>false,
          "metadata"=>{},
          "order"=>nil,
          "paid"=>false,
          "receipt_email"=>nil,
          "receipt_number"=>nil,
          "refunded"=>false,
          "refunds"=>{
            "object"=>"list",
            "data"=>[],
            "has_more"=>false,
            "total_count"=>0,
            "url"=>"/v1/charges/ch_18Pr5DI8HOATFuBIijQWOBWY/refunds"
          },
          "shipping"=>nil,
          "source"=>{
            "id"=>"card_18Pr4hI8HOATFuBI6rt169pC",
            "object"=>"card",
            "address_city"=>nil,
            "address_country"=>nil,
            "address_line1"=>nil,
            "address_line1_check"=>nil,
            "address_line2"=>nil,
            "address_state"=>nil,
            "address_zip"=>nil,
            "address_zip_check"=>nil,
            "brand"=>"Visa",
            "country"=>"US",
            "customer"=>"cus_8hEMd54WdSadQk",
            "cvc_check"=>"pass",
            "dynamic_last4"=>nil,
            "exp_month"=>6,
            "exp_year"=>2018,
            "fingerprint"=>"OpNZNJEQflJpUMiP",
            "funding"=>"credit",
            "last4"=>"0341",
            "metadata"=>{},
            "name"=>nil,
            "tokenization_method"=>nil
          },
          "source_transfer"=>nil,
          "statement_descriptor"=>nil,
          "status"=>"failed"
        }
      },
      "livemode"=> false,
      "pending_webhooks"=> 1,
      "request"=> "req_8hFaUcOLFlUpOz",
      "type"=> "charge.failed"
    }
  end

  it "deactivates a user with the webhook data from stripe for a failed charge", :vcr do
    alice = Fabricate(:user, customer_token: "cus_8hEMd54WdSadQk")
    post "/stripe_events", event_data
    expect(alice.reload).not_to be_active
  end
end