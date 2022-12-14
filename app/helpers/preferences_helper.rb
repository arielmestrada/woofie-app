module PreferencesHelper
  def fetch_preferences(params)
    count = []
    user_preference = current_user.user_preferences
    new_preferences = params.select { |key, value| key if value == 'true' }
    new_preferences.each do |key, _value|
      next if user_preference.include? key

      user_preference << key
      count << key
    end
    current_user.save
    count.length
  end

  def hide_preferences(breed)
    breed.select { |item| item unless current_user.user_preferences.include? item[:name] }
  end

  def preferred?(dog_name, user = current_user)
    user.user_preferences.include?(dog_name)
  end
end
