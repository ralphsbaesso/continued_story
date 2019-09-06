class Share::SaveModel < AStrategy

  def process
    if status == :green
      model.save

      if model.errors.present?
        model.errors.full_messages.each do |error|
          messages << error
        end
        set_status :red
      end
      true
    else
      set_status :red
    end

  end
end