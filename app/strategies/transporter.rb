class Transporter
  attr_accessor :messages, :model, :bucket, :current_user, :current_account, :status

  def initialize(user)
    @current_user = user
    @messages = []
    @status = :green
    @bucket = {}
  end

  def item
    @model
  end

  def add_message(msg)
    if msg.is_a? Array
      @messages += msg
    else
      @messages << msg
    end
  end

  def add_error_message(msg)
    @messages = [msg]
    @status = :red
  end

  def as_json(options = {})
    item = model.as_json
    # item.delete(:id) if model && !model.try(:persisted?) # por causa do mongoid que retorna id para objetos não salvos
    data = self.bucket
    data[:item] = item
    data[:status] = self.status
    data[:messages] = self.messages if self.messages.present?
    data
  end

end