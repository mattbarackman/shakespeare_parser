module ApplicationHelper

  def format_percentage(percentage)
    "#{percentage} %"
  end

  def display_longest_speech(role)
    output = ""
    output += "("
    output += pluralize(role.longest_speech_length, 'line')
    output += ") "
    output += truncate(role.longest_speech.display, length: 40)
  end

end
