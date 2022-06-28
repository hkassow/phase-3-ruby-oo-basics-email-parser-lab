# Build a class EmailAddressParser that accepts a string of unformatted 
# emails. The parse method on the class should separate them into
# unique email addresses. The delimiters to support are commas (',')
# or whitespace (' ').


class EmailAddressParser 
    def initialize string
        @string = string
    end
    def parse 
        parsed = []
        if @string.match(/[,]/)
            split = @string.split(',').map {|word| word.strip}
            split.each do |word|
                if word.match(/\s/)
                    word.split(' ').each do |x|
                        parsed.push x
                    end
                else 
                    parsed.push word
                end
            end
        else
            parsed = @string.split(' ').map {|word| word.strip}
        end
        parsed = parsed & parsed
    end
end

emails = "avi@test.com, arel@test.com test@avi.com, test@arel.com"
puts EmailAddressParser.new(emails).parse