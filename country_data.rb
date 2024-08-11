# frozen_string_literal: true

module GlobalConstants
  IMF_DEVELOPMENT_STATUS = 'developing'
  IMF_GDP_THRESHOLD = 1_000_000_000_000
  UN_SECURITY_COUNCIL_POPULATION_THRESHOLD = 100
  UN_SECURITY_COUNCIL_GDP_THRESHOLD = 2_000_000_000_000
  ELIGIBILE = 'Eligible'
  NOT_ELIGIBLE = 'Non Eligible'
end

module EligibilityChecker
  include GlobalConstants

  def imf_loan_eligible?
    development_status == IMF_DEVELOPMENT_STATUS && gdp < IMF_GDP_THRESHOLD
  end

  def un_security_council_eligible?
    population > UN_SECURITY_COUNCIL_POPULATION_THRESHOLD &&
      gdp > UN_SECURITY_COUNCIL_GDP_THRESHOLD
  end

  def can_win_war?(second_country)
    army_strength > second_country.army_strength
  end
end

class Country
  include EligibilityChecker
  attr_accessor :name, :population, :gdp, :states, :army_strength, :development_status

  def initialize(name, population, gdp, states, army_strength, development_status)
    @name = name
    @population = population
    @gdp = gdp
    @states = states
    @army_strength = army_strength
    @development_status = development_status
  end

  def display_eligibility_check
    puts 'Eligibility check:'
    puts "IMF loan: #{imf_loan_eligible? ? ELIGIBILE : NOT_ELIGIBLE}"
    puts "UN Security Council: #{un_security_council_eligible? ? ELIGIBILE : NOT_ELIGIBLE}"
  end

  def compare_war_capability(other_country)
    if can_win_war?(other_country)
      return "#{name} is likely to win war against #{other_country.name}"
    end
    puts "#{name} is unlikely to win war against #{other_country.name}"
  end
end

class Application
  include GlobalConstants

  def initialize
    @country_data = {
      'india' => Country.new('India', 1_400_000_000, 3_500_000_000_000, 28, 1_400_000, 'developing'),
      'usa' => Country.new('USA', 331_000_000, 25_300_000_000_000, 50, 1_500_000, 'developed'),
      'china' => Country.new('China', 1_410_000_000, 19_600_000_000_000, 23, 2_000_000, 'developing'),
      'russia' => Country.new('Russia', 145_000_000, 2_200_000_000_000, 85, 1_000_000, 'developing')
    }
  end

  def find_country(name)
    @country_data[name.downcase]
  end

  def start
    puts 'Enter the name of the country:'
    country_name = gets.chomp
    country = find_country(country_name)
    return puts 'Country not found in the database' unless country

    country.display_eligibility_check

    puts 'Compare war Capability:'
    puts 'Enter the name of the second country: '
    second_country_name = gets.chomp
    second_country = find_country(second_country_name)
    return puts 'Second country not found in database' unless second_country

    puts country.compare_war_capability(second_country)
  end
end

Application.new.start
