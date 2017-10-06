module LanguageHelper
  def select_levels
    [
      [t('begginer'), 'begginer'],
      [t('upper_begginer'), 'upper_begginer'],
      [t('intermediate'), 'intermediate'],
      [t('upper_intermediate'), 'upper_intermediate'],
      [t('advanced'), 'advanced'],
      [t('upper_advanced'), 'upper_advanced'],
      [t('native'), 'native']
    ]
  end
end
