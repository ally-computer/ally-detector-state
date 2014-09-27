require 'spec_helper'

require_relative '../lib/ally/detector/state'

describe Ally::Detector::State do
  context 'detect a state' do
    it 'by itself' do
      subject.inquiry('MA').detect.should == ['Massachusetts']
    end

    it 'when theres a fake state' do
      subject.inquiry('my fake handle is new york88')
        .detect.should == nil
    end

    it 'in a sentence' do
      subject.inquiry('Boston is a great city in Massachusetts!')
        .detect.should == ['Massachusetts']
    end

    it 'when multiple exist' do
      subject.inquiry('Wyoming and New Jersey are states as well, but new cake jersey isnt')
        .detect.should == ['New Jersey', 'Wyoming']
    end

    it 'when none exist' do
      subject.inquiry('Oh well, there are no states here, def not any near the greak lakes')
        .detect.should == nil
    end
  end
end
