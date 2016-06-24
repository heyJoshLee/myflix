require "spec_helper"

describe "Create payment on successful charge" do
  let(:event_data) do
    {
      "id"=> "evt_18PoT0I8HOATFuBIXGI7Q76L",
      "object"=> "event",
      "api_version"=> "2016-03-07",
      "created"=> 1466752266,
      "data"=> {
        "object"=> {
          "id"=> "ch_18PoSzI8HOATFuBIbvJafHBU",
          "object"=> "charge",
          "amount"=> 999,
          "amount_refunded"=> 0,
          "application_fee"=> nil,
          "balance_transaction"=> "txn_18PoT0I8HOATFuBIZ2lJKVON",
          "captured"=> true,
          "created"=> 1466752265,
          "currency"=> "usd",
          "customer"=> "cus_8hCseAkppE3JFe",
          "description"=> nil,
          "destination"=> nil,
          "dispute"=> nil,
          "failure_code"=> nil,
          "failure_message"=> nil,
          "fraud_details"=> {},
          "invoice"=> "in_18PoSzI8HOATFuBIVh0pSzs0",
          "livemode"=> false,
          "metadata"=> {},
          "order"=> nil,
          "paid"=> true,
          "receipt_email"=> nil,
          "receipt_number"=> nil,
          "refunded"=> false,
          "refunds"=> {
            "object"=> "list",
            "data"=> [],
            "has_more"=> false,
            "total_count"=> 0,
            "url"=> "/v1/charges/ch_18PoSzI8HOATFuBIbvJafHBU/refunds"
          },
          "shipping"=> nil,
          "source"=> {
            "id"=> "card_18PoSwI8HOATFuBIDiJ7SNhW",
            "object"=> "card",
            "address_city"=> nil,
            "address_country"=> nil,
            "address_line1"=> nil,
            "address_line1_check"=> nil,
            "address_line2"=> nil,
            "address_state"=> nil,
            "address_zip"=> nil,
            "address_zip_check"=> nil,
            "brand"=> "Visa",
            "country"=> "US",
            "customer"=> "cus_8hCseAkppE3JFe",
            "cvc_check"=> "pass",
            "dynamic_last4"=> nil,
            "exp_month"=> 6,
            "exp_year"=> 2019,
            "fingerprint"=> "MQzk2nWyClMfPHmj",
            "funding"=> "credit",
            "last4"=> "4242",
            "metadata"=> {},
            "name"=> nil,
            "tokenization_method"=> nil
          },
          "source_transfer"=> nil,
          "statement_descriptor"=> nil,
          "status"=> "succeeded"
        }
      },
      "livemode"=> false,
      "pending_webhooks"=> 1,
      "request"=> "req_8hCsL0FMpklISY",
      "type"=> "charge.succeeded"
    }
  end

  it "creates a payment with the webhook from stripe for charge succeeded", :vcr do
    post "/stripe_events", event_data
    expect(Payment.count).to eq(1)
  end

  it "creates the payment associated with the user", :vcr do
    alice = Fabricate(:user, customer_token: "cus_8hCseAkppE3JFe")
    post "/stripe_events", event_data
    expect(Payment.first.user).to eq(alice)
  end

  it "creates the payment with the amount", :vcr do
    alice = Fabricate(:user, customer_token: "cus_8hCseAkppE3JFe")
    post "/stripe_events", event_data
    expect(Payment.first.amount).to eq(999)
  end

  it "creates a payment with reference id", :vcr do
    alice = Fabricate(:user, customer_token: "cus_8hCseAkppE3JFe")
    post "/stripe_events", event_data
    expect(Payment.first.reference_id).to eq("ch_18PoSzI8HOATFuBIbvJafHBU")

  end
end