require 'rails_helper'

RSpec.describe Person, :type => :model do

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :company }

end