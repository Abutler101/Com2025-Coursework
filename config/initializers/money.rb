MoneyRails.configure do |config|
  # set the default currency
  config.default_currency = :gbp
  Money.locale_backend = :currency
  Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
end
