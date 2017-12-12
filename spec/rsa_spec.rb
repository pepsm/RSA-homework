require_relative '../lib/rsa_crypt.rb'


RSpec.describe RSA do
	new_rsa = RSA.new(250,604,213)
	tester = RSA.new(3233,17,413)
    it "should return n" do
        expect(new_rsa.n).to eq 250
    end
    it "should return e" do
        expect(new_rsa.e).to eq 604
    end
    it "should return d" do
        expect(new_rsa.d).to eq 213
    end
	it "should encrpyt and decrypt correctly" do 
		expect(tester.decrypt tester.encrypt "It works!").to eq "It works!"
	end
	it "should encrpyt and decrypt complex sentence correctly with hardcoded keys" do 
		expect(tester.decrypt tester.encrypt "Don't cry because it's over, smile because it happened.").to eq "Don't cry because it's over, smile because it happened."
	end
	it "should return array new_key" do 
		expect(rsa.new_key.kind_of?(Array)).to eq true
	end
	it "should return correct lenght array from new_key" do 
		expect(rsa.new_key.length).to eq 3
	end
end