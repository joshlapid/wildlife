require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'I am on the title page' do
    Steps 'Visitng the title page' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I see the page title' do
        expect(page).to have_content('Wildlife Tracker')
      end
    end # of steps
  end # of context

  context 'Creating a species' do
    Steps 'Creating a species' do
      Given 'I am on the landing page' do
        visit '/'
      end
      And 'I create a species' do
        fill_in 'species', with: 'Raccoon'
        click_button 'Add Species'
      end
      Then 'I am redirected to a list of species' do
        expect(page).to have_content('All Species')
        expect(page).to have_content('Raccoon')
      end
    end # of step
    Steps 'Creating a species that already exists' do
      Given 'I try to create a species with a name that is taken' do
        Species.create!(name:'Raccoon')
        visit '/'
        fill_in 'species', with: 'Raccoon'
        click_button 'Add Species'
      end
      Then 'I am shown a messange saying the species already exists' do
        expect(page).to have_content('Wildlife Tracker')
        expect(page).to have_content('That species is already in the database.')
      end
    end
  end # of context
end # of feature
