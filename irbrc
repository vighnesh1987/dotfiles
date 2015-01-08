#require 'rubygems' unless defined? Gem
#require 'hirb'
#require 'interactive_editor'
#require 'fancy_irb'

#FancyIrb.start :colorize => {
  #:rocket_prompt => [:blue],
  #:result_prompt => [:blue],
  #:input_prompt  => nil,
  #:irb_errors    => [:red],
  #:stderr        => [:red, :bright],
  #:stdout        => [:white],
  #:input         => nil,
  #:output        => true,
#}

#Hirb.enable

#def quick(repetitions=100, &block)
  #require 'benchmark'
  #Benchmark.bmbm do |b|
    #b.report {repetitions.times &block} 
  #end
  #nil
#end
