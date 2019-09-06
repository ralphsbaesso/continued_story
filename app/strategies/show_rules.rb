class ShowRules
  class << self

    def show
      list = []

      model_path = File.join(Rails.root, 'app', 'models')
      Dir.glob("#{model_path}/*.rb") do |path|
        name_file = path.split('/').last
        class_name = name_file.split('.').first.camelize.constantize
        list << class_name
      rescue Exception
        next
      end

      new_list = []
      list.each do |c|
        if c.respond_to? :rules_of_insert
          rules_of_insert = c.rules_of_insert
        end
        if c.respond_to? :rules_of_update
        rules_of_update = c.rules_of_update
        end

        if c.respond_to? :rules_of_list
          rules_of_list = c.rules_of_list
        end

        if c.respond_to? :rules_of_destroy
          rules_of_destroy = c.rules_of_destroy
        end

        new_list << {
            name: c,
            rules_of_insert: rules_of_insert,
            rules_of_update: rules_of_update,
            rules_of_list: rules_of_list,
            rules_of_destroy: rules_of_destroy
        }

      end
      new_list

    end
  end
end