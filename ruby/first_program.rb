#!/usr/bin/ruby -w


def hello
    str = "hello"
    puts str
    return str
end

hello
print <<EOF
    This is a multi-line string
    which can span as many lines as I want
    until my special string appears
EOF