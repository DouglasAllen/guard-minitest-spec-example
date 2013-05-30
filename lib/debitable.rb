#!/usr/bin/env ruby

class Consultation
  attr_accessor :start_day, :start_hour, :end_day, :end_hour

  START = 8
  STOP = 17

  def initialize(start_day: nil, start_hour: nil, end_day: nil, end_hour: nil)
    @start_day  = start_day
    @start_hour = start_hour
    @end_day    = end_day
    @end_hour   = end_hour
  end
  def debitable
    debit = [STOP - @start_hour]
    (@start_day + 1).upto(@end_day - 1) { |n| debit << 8 }
    debit << @end_hour - START
  end
end

if __FILE__ === $0
  Signal.trap("SIGINT") do
    puts
    puts 'Good bye..'
    exit
  end

  def receive(desc)
    print "#{desc}: "
    gets.chomp.to_i
  end

  def tell(debitable)
    puts
    puts "Debitable:   #{debitable}"
    puts "Total hours: #{debitable.inject(&:+)}"
    puts
  end

  loop do
    @consultation = Consultation.new
    @consultation.start_day  = receive('Start day ')
    @consultation.start_hour = receive('Start hour')
    @consultation.end_day    = receive('End day   ')
    @consultation.end_hour   = receive('End hour  ')
    tell @consultation.debitable
  end
end
