if ENV['COVERAGE']
  SimpleCov.start 'rails' do
    merge_timeout 3600
    add_group "App", "app"
    add_group "Models", "app/models"
    add_group "Lib", "lib"
    add_group "Controllers", "app/controllers"
    add_group "Views", "app/views"
  end
end
