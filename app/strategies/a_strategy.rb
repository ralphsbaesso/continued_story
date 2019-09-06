class AStrategy

  def initialize(transporter)
    raise 'Deve inicializar com objeto do tipo "Transporter"' unless transporter.is_a? Transporter
    @transporter = transporter
  end

  def process
    raise 'Must implement this method'
  end

  def messages
    @transporter.messages
  end

  def model
    @transporter.model
  end

  def bucket
    @transporter.bucket
  end

  def current_user
    @transporter.current_user
  end

  def status
    @transporter.status
  end

  def set_status(s)
    @transporter.status = s
    s != :red
  end

  def add_message(msg)
    @transporter.add_message msg
  end

  def add_error_message(msg)
    @transporter.add_error_message(msg)
  end

end