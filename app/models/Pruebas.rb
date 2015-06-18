	def valid_phone?
		phone = "(456) 435-3456 x4657"
		count = 0
		for i in 0...phone.length
			if phone[i]=~ /\d/
				puts "entramos"
				count += 1
			end
		end
		if count < 9
			puts "no tiene suficientes digitos"
#			errors.add(:phone, "does not contain enough digits")
		end
	end

	puts valid_phone?