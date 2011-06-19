# coding: utf-8
module SpecsHelper
	
	def paste_obrab spec
		@val = '';		
		@val += 'Бр ' if spec.bronza # != nil && @spec.bronza
		@val += 'Сч ' if spec.chugun
		@val += 'м/о ' if spec.meh_yes
		@val += 'без_м/о ' if spec.meh_no
		@val += 'м/о_чертеж' if spec.cher_yes
		return @val
	end
	
	def paste_file_url spec
		if spec.calcs == nil || spec.calcs.last == nil
			'отсутствует'
		else						
			spec.calcs.last.file.url == '/files/original/missing.png' ? 'отсутствует' : ( 
			@list = '';
			spec.calcs.each do |c|
				@list += "<a href='#{c.file.url}'>#{c.created_at.strftime("%d.%m.%y %H:%M")}</a><br/>"
			end
			"<a href='#{spec.calcs.last.file.url}'>расчет</a><br/><a href='#' class='filetip'>&lt&lt&lt</a><div class='fileTable' id='list_#{spec.id}'>#{@list}</div>"
			)
		end
	end

end
