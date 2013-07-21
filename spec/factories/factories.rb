FactoryGirl.define do
  factory :play do
    title "Julius Caesar"
  end

  factory :role do
    name "Matt B."
  end

  factory :act do
    title "Act I. Blah, blah, blah."
    play_id 1
  end

  factory :scene do
    title "Scene I. Yada, yada, yada."
    act_id 1
  end

  factory :speech do
    scene_id 1
  end

  factory :line do
    content "what a wonderful line."
    speech_id 1
  end

end