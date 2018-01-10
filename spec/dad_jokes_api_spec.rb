require 'spec_helper'

describe 'Testing dad jokes api' do
  before(:all) do
    @test = DadJokesWebsite.new.get_dad_jokes_by_search
    @test.get_dad_joke
  end

  it "Should returen with a status code of 200" do
    expect(@test.get_status).to eq(200)
  end

  it "The api should return as a HASH" do
    expect(@test.dad_joke).to be_kind_of(Hash)
  end

  it 'The api data should return a total of 9 values (excluding nested values)' do
    expect(@test.get_dad_joke_length).to eq(9)
  end

  it "The results hash should return a total of 20 dad jokes" do
    expect(@test.get_results_hash_length).to eq(20)
  end

  it 'The jokes should always have a limit between 20 and 30' do
    expect(@test.get_limit).to be_between(20,30)
  end

  it "The limit should always return as integer" do
    expect(@test.get_limit).to be_kind_of(Integer)
  end

  it 'current page should always start at 1' do
    expect(@test.get_current_page).to eq(1)
  end

  it 'next page should be 2' do
    expect(@test.get_next_page).to eq(2)
  end

  it "The value 'id' and 'joke' inside results should be a string'" do
    @test.get_results.each do |key|
      expect(key["joke"]).to be_kind_of(String)
      expect(key["id"]).to be_kind_of(String)
    end
  end

  it "the results hash should contain two values in each 'joke' and 'id'" do
    expect(@test.get_results[0].length).to eq(2)
  end

  it "In the results hash there should include an id of '0189hNRf2g' with the corresponding jokes 'I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.'" do
    expect(@test.get_results[0]["id"]).to eq("0189hNRf2g")
    expect(@test.get_results[0]["joke"]).to eq("I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.")
  end

  it "total jokes across all 15 pages should be 307" do
    expect(@test.get_total_jokes).to eq(398)
  end

  it "There should be a total of 19 pages" do
    expect(@test.get_total_pages).to eq(19)
  end

end
