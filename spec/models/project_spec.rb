require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to belong_to(:projectable) }
end
