
module EligibilityChecker
  def self.imf_loan_eligible?(country)
    country.development_status == 'developing' && country.gdp < 1_000_000_000_000
  end

  def self.un_security_council_eligible?(country)
    country.population > 100 && country.gdp > 2_000_000_000_000
  end

  def self.can_win_war?(country1, country2) 
    country1.army_strength > country2.army_strength
  end
end

class CountryData
  attr_accessor :name, :population, :gdp, :states, :army_strength, :development_status
  def initialize(name, population, gdp, states, army_strength, development_status)
    @name = name
    @population = population
    @gdp = gdp
    @states = states
    @army_strength = army_strength
    @development_status = development_status
  end

end

class Countries
  def initialize
    @country_data = [
      CountryData.new('India', 1_400_000_000, 3_500_000_000_000, 28, 1_400_000, 'developing'),
      CountryData.new('USA', 331_000_000, 25_300_000_000_000, 50, 1_500_000, 'developed'),
      CountryData.new('China', 1_410_000_000, 19_600_000_000_000, 23, 2_000_000, 'developing'),
      CountryData.new('Russia', 145_000_000, 2_200_000_000_000, 85, 1_000_000, 'developing')
    ]
  end

  def find_country(name)
    @country_data.find { |country| country.name.downcase == name.downcase }
  end

  def start
    puts 'Enter the name of the country:'
    country_name = gets.chomp
    country = find_country(country_name)

    return puts 'Country not found in the database' unless country
    puts 'Eligibility check:'
    puts "IMF loan: #{EligibilityChecker.imf_loan_eligible?(country) ? 'Eligible' : 'Not Eligible'}"
    puts "UN Security Council: #{EligibilityChecker.un_security_council_eligible?(country) ? 'Eligible' : 'Not Eligible'}"

    puts 'Compare war Capability'
    puts 'Enter the name of the second country: '
    second_country_name = gets.chomp
    second_country = find_country(second_country_name)
    return puts 'Second country not found in database' unless second_country
    
    return puts "#{country.name} is likely to win war against #{second_country.name}" if EligibilityChecker.can_win_war?(country, second_country)
    
    return puts "#{country.name} is unlikely to win war against #{second_country.name}"
    
  end
end

Countries.new.start

