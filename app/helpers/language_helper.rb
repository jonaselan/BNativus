module LanguageHelper
  def select_levels(type)
    value = type == 'number' ? numbers_levels : string_levels
    [
      [t('begginer'), value[0]],
      [t('upper_begginer'), value[1].to_i],
      [t('intermediate'), value[2]],
      [t('upper_intermediate'), value[3]],
      [t('advanced'), value[4]],
      [t('upper_advanced'), value[5]],
      [t('native'), value[6]]
    ]
  end

  private

  def numbers_levels
    [0, 1, 2, 3, 4, 5, 6]
  end

  def string_levels
    ['begginer', 'upper_begginer', 'intermediate',
      'upper_intermediate', 'advanced', 'upper_advanced',
      'native']
  end
end
