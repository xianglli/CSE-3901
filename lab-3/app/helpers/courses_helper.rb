module CoursesHelper
  def action
    if action_name == 'advanced_search'
      :post
    else
      :get
    end
  end

  def user_column_headers
    %i(title subject catalogNumber campus description).freeze
  end

  def user_column_fields
    %i(title subject catalogNumber campus description).freeze
  end

  def user_wants_distinct_results?
    params[:distinct].to_i == 1
  end

  def display_results_header(count)
      "Your #{pluralize(count, 'result')}"
  end

  def display_search_results(objects)
    objects.reduce(String.new) do |string, object|
      string << (tag.tr display_search_results_row(object))
    end
  end

  def display_search_results_row(object)
    user_column_fields.reduce(String.new) do |string, field|
      string << (tag.td object.send(field))
    end
  end
end
