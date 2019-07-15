module ApplicationHelper

    # adds the page name to the title followed by default 'SharetheRide'
    def full_title(page_title)
        base_title = 'TinyPost'
        if page_title.empty?
            base_title
        else
            page_title + ' | ' + base_title
        end
    end


end
