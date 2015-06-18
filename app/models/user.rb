class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 

	validates :email, format: {with: /\A[a-zA-Z\.]+@[a-zA-Z\.]{2,}\.[a-zA-Z]+\z/}
	validates :email, uniqueness: true
	validates :age, numericality: {greater_than_or_equal_to: 18}
	validate :valid_phone?

	def valid_phone?
			count = 0
		for i in 0...phone.length
			if phone[i]=~ /\d/
				puts "entramos"
				count += 1
			end
		end
		if count < 9
			errors.add(:phone, "does not contain enough digits")
		end
	end


	def name
		first_name + " " + last_name
	end

	def age
		t = Time.now - birthday.to_time

		s = sec2dhms(t)
		years = s[0]/365
	end

	private
		def sec2dhms(secs)
		  time = secs.round          # Get rid of microseconds
		  sec = time % 60            # Extract seconds
		  time /= 60                 # Get rid of seconds
		  mins = time % 60           # Extract minutes
		  time /= 60                 # Get rid of minutes
		  hrs = time % 24            # Extract hours
		  time /= 24                 # Get rid of hours
		  days = time                # Days (final remainder)
		  [days, hrs, mins, sec]     # Return array [d,h,m,s]
		end
end

