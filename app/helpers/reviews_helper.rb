module ReviewsHelper
  def town_name_option(form_builder)
    if @town
      "Town: #{@town.formatted_name}"
    else
      render partial: "townform", locals: { f: form_builder }
    end
  end

  def check_if_empty
    if @reviews.empty?
      "There doesn't seem to be any reviews for #{@town.formatted_name}"
    end
  end
end
