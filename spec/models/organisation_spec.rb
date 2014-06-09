require 'spec_helper'

describe Organisation do
  
  it { should have_many(:animals) }

end
