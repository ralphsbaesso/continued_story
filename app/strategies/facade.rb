class Facade
  attr_reader :transporter

  def initialize(user)
    @transporter = Transporter.new(user)
  end

  def insert(model, **args)
    class_name = check_model(model)
    steps << "{ Method: #{__method__}, model: #{class_name}, args: #{args} }"

    transporter.model = model
    transporter.bucket = args
    strategies = class_name.rules_of_insert.map { |strategy| strategy.new(transporter) }
    execute strategies
    transporter
  end
   
  def select(model, **args)
    class_name = check_model(model)
    steps << "{ Method: #{__method__}, model: #{class_name}, args: #{args} }"

    transporter.model = model
    transporter.bucket = args
    strategies = class_name.rules_of_list.map { |strategy| strategy.new(transporter) }
    execute strategies
    transporter
  end

  def update(model, **args)
    class_name = check_model(model)
    steps << "{ Method: #{__method__}, model: #{class_name}, args: #{args} }"

    transporter.model = model
    transporter.bucket = args
    strategies = class_name.rules_of_update.map { |strategy| strategy.new(transporter) }
    execute strategies
    transporter
  end

  def delete(model, **args)
    class_name = check_model(model)
    steps << "{ Method: #{__method__}, model: #{class_name}, args: #{args} }"

    transporter.model = model
    transporter.bucket = args
    strategies = class_name.rules_of_destroy.map { |strategy| strategy.new(transporter) }
    execute strategies
    transporter
  end


  private

  def execute(strategies)
    steps << "Quantidade de estrategias #{strategies.count}"

    strategies.each do |strategy|
      steps << "Executando Strategy: #{strategy.class.name}."

      break unless strategy.process
    end

  rescue Exception => e
    # Event.application(
    #   'Erro na execução do FACADE',
    #   nil, nil,
    #   transporter: transporter.as_json,
    #   steps: steps,
    #   error: e.message,
    #   backtrace: e.backtrace
    # )
    p e
    transporter.add_error_message 'Um erro inesperado aconteceu, tente novamente. Se persistir, entre em contato com o Adminstrador.'
    transporter.status = :red
  end

  def check_attributes
    attributes = transporter.bucket[:attributes]
    if attributes.present?
      model = transporter.model

      attributes.each do |key, value|
        model[key] = value if model.respond_to? key
      end

    end
  end

  def check_model(model)
    if model.is_a?(Symbol)
      model.to_s.camelize.constantize
    else
      model.class.name.constantize
    end
  end

  def steps
    @steps ||= []
  end

end