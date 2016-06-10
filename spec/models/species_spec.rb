require 'rails_helper'

RSpec.describe Species, type: :model do
  it 'has a name' do
    new_species = Species.new
    new_species.name = 'Raccoon'
    expect(new_species.save).to be true
  end

  it 'must have a name' do
    new_species = Species.new
    expect(new_species.save).to be false
  end

  it 'has a unique name' do
    species1 = Species.create!(name:'Tiger')
    species2 = Species.new(name:'Tiger')
    expect(species2.save).to be false
  end
end
