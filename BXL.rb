module BXL
    def self.interprete(x)
        x.each_line{|line|
            a = line.gsub("\n","").gsub("\t","").gsub("\r","").split(" ")
            command = a.shift
            args = a
            case command
            when "outln"
                print "#{args[0]}\n"
            when "ln"
                print "\n"*args[0].to_i
            when "chprint"
                print "#{args[0]}"*args[1].to_i
            when "pause"
                $stdin.gets
            when "end"
                exit
            when "wait"
                sleep args[1].to_f
            else
                raise("ERROR")
            end
        }
    end

    def self.interprete_file(x)
        data = lambda{File.open(x,'rb'){|f|return f.read}}.call
        BXL.interprete(data)
    end
end

begin
    BXL.interprete_file(ARGV[0].to_s)
end