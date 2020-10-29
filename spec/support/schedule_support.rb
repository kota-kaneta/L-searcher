module ScheduleRegistration
  def schedule_registration(user)
    sign_in(user)
    click_on('スケジュールを登録する')
    fill_in 'schedule[location]', with: '東京'
    expect do
      find('input[name="commit"]').click
    end.to change { Schedule.count }.by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content('マイページ')
  end
end
