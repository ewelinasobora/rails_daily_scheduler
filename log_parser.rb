# This tool reads a log file and outputs a summary of the log data

log_file = ARGV[0]

# Define a hash to store the log data
log_data = {}

# Open the log file and iterate over each line
File.foreach(log_file) do |line|
	# Extract the date, status code, and message from the log line
	_date, status_code, message = line.split('|')
	
	# Check if the status code is already in the log data hash
	if log_data[status_code]
		# If it is, increment the count for that status code
		log_data[status_code][:count] += 1
	else
		# If it's not, add a new entry to the log data hash
		log_data[status_code] = { count: 1, messages: [] }
	end
	
	# Add the message to the messages array for the status code
	log_data[status_code][:messages] << message.chomp
end

# Print the summary of the log data
puts "Log file summary:\n\n"

log_data.each do |status_code, data|
	puts "Status code: #{status_code}"
	puts "Count: #{data[:count]}"
	puts "Messages:"
	
	data[:messages].each do |message|
		puts "- #{message}"
	end
	
	puts "\n"
end
