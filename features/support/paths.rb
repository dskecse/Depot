module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the store catalog/
      root_path
    when /the new order page/
      new_order_path
    else
      raise "Can't find mapping from \"#{ page_name }\" to a path."
    end
  end
end

World(NavigationHelpers)
