def get_line_from_file(path, line)
    result = nil
    File.open(path, "r") do |f|
        while line > 0
            line -= 1
            result = f.gets
        end
    end
    return result
end

def get_random_noun
    count = %x{wc -l #{"words/nouns.txt"}}.split.first.to_i
    randomNum = rand 1..count
    return get_line_from_file("words/nouns.txt", randomNum).chop
end

def get_random_adjective
    count = %x{wc -l #{"words/adjectives.txt"}}.split.first.to_i
    randomNum = rand 1..count
    return get_line_from_file("words/adjectives.txt", randomNum).chop
end

def generate_infobox
    infobox = "{{Item infobox|type=Broadsword|damagetype=Melee|"
    infobox += "auto=#{["yes","no",].sample}|"
    infobox += "damage=#{rand 100..100000}|"
    infobox += "knockback=#{rand 1..10}|"
    infobox += "critical=#{rand 0..100}%|"
    infobox += "use=#{rand 10..50}|"
    infobox += "name=#{$itemName}}}"

    return infobox
end

def generate_page_body
    body = "#{$itemName} is a #{get_random_adjective} broadsword "
    body += "that is dropped by #{$bossName}. "
    body += "It is #{get_random_adjective}, #{get_random_adjective}, "
    body += "and #{get_random_adjective} due to "
    body += "its #{["low","decent","high"].sample} use time, "
    body += "#{["low","decent","high"].sample} damage, and " 
    body += "#{["low","decent","high"].sample} knockback."

    return body
end

puts "And God said 'let there be light'."
puts "Your page is being generated."
puts "..."

$itemName = get_random_adjective.capitalize+" "+get_random_noun.capitalize
$bossName = get_random_adjective.capitalize+" "+get_random_noun.capitalize
output = File.new("output.txt", "w+");
output.syswrite("PAGE NAME: #{$itemName}\n\n#{generate_infobox}\n\n#{generate_page_body}")

puts "Done. Look for output.txt"