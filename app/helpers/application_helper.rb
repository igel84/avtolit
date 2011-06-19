# coding: utf-8
module ApplicationHelper

	def paste_current_page page
		case page
			when nil 
				'&nbsp'
			when :spec
				'Единая база заявок'
			when :user
				'Настройки'
			when :session
				'Вход'
		end
	end

end
