Factory.define :invalid_language, :class => Language do |f|
end

Factory.define :language do |f|
  f.sequence(:abbreviation) do |n|
    r = ""
    n += 26
    while n > 0
      r += (?a + (n % 26)).chr
      n /= 26
    end
    r
  end
  f.name { |l| l.abbreviation }
end
