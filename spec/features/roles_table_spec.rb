require 'spec_helper'


feature "Interact with roles table", :js => true do

  let!(:doc) {
    file = File.open('spec/fixtures/test_play.xml')
    doc = Nokogiri::XML(file)
    tags = { play: "PLAY",
             title: "TITLE",
             act: "ACT",
             scene: "SCENE",
             speech: "SPEECH",
             line: "LINE",
             speaker: "SPEAKER"
           }
    Importer.parse_play(doc, tags)
  }

  scenario 'can see the list of plays' do

    visit root_path
    expect(page).to have_content "The Best Test Play Ever"

  end

  scenario 'can visit the roles table by clicking on the play name' do

    visit root_path
    click_link('The Best Test Play Ever')
    expect(page).to have_content "Role"

  end

  scenario 'roles should initially be sorted alphabetically ascending' do

    visit root_path
    click_link('The Best Test Play Ever')
    expect(first('tr:first-child > td:first-child').text).to eq "Amy B."

  end

  scenario 'roles should be sorted alphabetically descending after clicking the role header' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#alphabetical').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Roger C."

  end

  scenario 'roles should be sorted by number of lines descending after clicking the number of lines header' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#line_count').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Jessie B."

  end

  scenario 'roles should be sorted by number of lines ascending after clicking the number of lines header twice' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#line_count').click
    sleep(0.5)
    find('#line_count').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Phil B."

  end

  scenario 'roles should be sorted by longest speech descending after clicking the longest speech header' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#longest_speech').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Matt B."

  end

  scenario 'roles should be sorted by longest speech ascending after clicking the longest speech header twice' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#longest_speech').click
    sleep(0.5)
    find('#longest_speech').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Barb A."

  end

  scenario 'roles should be sorted by number_of_scenes descending after clicking the number_of_scenes header' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#scene_count').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Jessie B."

  end

  scenario 'roles should be sorted by number_of_scenes ascending after clicking the number_of_scenes header twice' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#scene_count').click
    sleep(0.5)
    find('#scene_count').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Deborah B."

  end

  scenario 'roles should be sorted by percentage of scenes descending after clicking the percentage of scenes header' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#scene_percentage').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Jessie B."

  end

  scenario 'roles should be sorted by percentage of scenes ascending after clicking the percentage of scenes header twice' do

    visit root_path
    click_link('The Best Test Play Ever')
    find('#scene_percentage').click
    sleep(0.5)
    find('#scene_percentage').click
    sleep(0.5)
    expect(first('tr:first-child > td:first-child').text).to eq "Deborah B."

  end

end