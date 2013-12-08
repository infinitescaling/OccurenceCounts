require 'csv'

if(ARGV.length != 2)
    puts "usage: ruby occurence.rb <inputfile> <wordlist>\n"
end

$wordList = []
$unique = Hash.new
$total = Hash.new


def getWordList()
    File.open(ARGV[1],'r') do |f1|
        while line = f1.gets
            line.chomp
            $wordList << line
            end
    end
end


def start()
    File.open(ARGV[0], 'r') do |row|
      while @line = row.gets
           @line.chomp!
           @parts = @line.split(';')

		   #unique value
		   if(@parts.length == 2)
				@parts[1].strip!
				
				#create hash value if it does not exist
				$unique[@parts[1]] = 0 if $unique[@parts[1]] == nil

				#increment count for unique hash
				@count = $unique[@parts[1]]
				@count = @count+1
				$unique[@parts[1]] = @count
				
				#create hash value if it does not exist
				$total[@parts[1]] = 0 if $total[@parts[1]] == nil
				
				#increment count for total hash
				@count = $total[@parts[1]]
				@count = @count+1
				$total[@parts[1]] = @count
		   
				#nonunique value
		   elsif(@parts.length > 2)
			   @parts.each do | i| 
					
					#create hash value and then increment
					$total[i] = 0 if $total[i] == nil
					@count = $total[i]
					@count = @count+1
					$total[i] = @count
			   end
		   end
		end
    end
end

def outputstats
    $wordList.each do |key|
        key.strip!
        if($total[key] != "")
            $unique[key] = 0 if $unique[key] == nil
            $total[key] =  0 if $total[key] == nil
            #puts key
            #puts $unique[key]
            #puts $total[key]
            @tempstring = key + "|" + $total[key].to_s +  "|" +  $unique[key].to_s
            #puts "%s|%s|%s" %s [key,$total[key],$total[key]]
            puts @tempstring
            
        else
            puts "#{key}|0|0\n"
        end
   
    end
end



getWordList()
start()
outputstats()
