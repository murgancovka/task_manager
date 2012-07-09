module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :show_today => true,
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      
      :width => nil,
      :height => 600, 
      :day_names_height => 30,
      :day_nums_height => 20,
      :event_height => 18,
      :event_margin => 1,
      :event_padding_top => 1,
    
      :use_all_day => false,
      :use_javascript => true,
      :link_to_day_action => false
  
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/tasks/#{event.id}" title="#{h(event.name)}">#{h(event.name)}</a>)
    end
  end
end
