feature 'it works' do
  scenario 'hello world' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end