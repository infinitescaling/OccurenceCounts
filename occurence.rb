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
    CSV.foreach(ARGV[0], :quote_char =>"\'") do |row|
       @parts = row.join(';').split(';')
       $partscount = @parts

       #unique value
       if(@parts.length == 2)
            @parts[1].strip!

            $unique[@parts[1]] = 0 if $unique[@parts[1]] == nil
            @count = $unique[@parts[1]]
            @count = @count+1
            $unique[@parts[1]] = @count
            
            $unique[@parts[1]] = @count

            $total[@parts[1]] = 0 if $total[@parts[1]] == nil
            @count = $total[@parts[1]]
            @count = @count+1
            $total[@parts[1]] = @count
       
            #nonunique value
       elsif(@parts.length > 2)
           puts @parts
           @parts.each do | i| 
        
                $total[i] = 0 if $total[i] == nil
                @count = $total[i]
                @count = @count+1
                $total[i] = @count
           end
       end
    end
end

def outputstats
    $wordList.each_key{|key| 

        if($total[key] != "")
            if($unique[key] == 0)
                $unique[key] = "0"
            end
            puts "#{key}|#{$total[key]|$unique[key]"
        else
            puts "#{key}|0|0\n"
        end
    }

end



getWordList()
start()
