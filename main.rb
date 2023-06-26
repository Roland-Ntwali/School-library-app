require_relative 'app'

# Main
def main
  app = App.new
  app.load_data
  loop do
    app.run
    puts
  end
end

main
