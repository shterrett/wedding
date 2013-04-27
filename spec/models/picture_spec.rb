require 'spec_helper'

Source = Struct.new(:src)
Entry = Struct.new(:content, :title)

  # stand in for RSS object from Picasa
  

describe Picture do
  let (:entry) do
    source = Source.new "google.com"
    entry = Entry.new source, "google"
  end
  let(:picture) { Picture.new(entry) }

  subject { picture }
  
  [:url, :title].each do |attr|
    it { should respond_to attr }
  end
end
