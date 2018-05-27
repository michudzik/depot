module StoreHelper
  def number_to_pln_currency(value)
    number_to_currency value, unit: 'zł', format: '%n %u'
  end
end
