module AppointmentsHelper
	# Generates a random token from a set of easily readable characters, this token willl help for easy searching
	#in the future
	def appointment_token(size = 6)
  		charset = %w{ 2 3 4 6 7 9 A B C D E F G H I J K  L M N O P Q R S T V W X Y Z }
  		(0...size).map{ charset.to_a[rand(charset.size)] }.join
	end
end
