# frozen_string_literal: true

guitars = [
  { is_available: true, model: 'Gibson SG', year: 1997 },
  { is_available: true, model: 'Fender Stratocaster', year: 2010 },
  { is_available: true, model: 'Jackson Soloist', year: 2000 }
]

Guitar.create(guitars)
