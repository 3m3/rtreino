class ActiveRecord::Base

  def self.log_model_actions
    define_method "log_create" do
      log_action 'create'
    end

    define_method "log_update" do
      log_action 'update'
    end

    after_create :log_create
    after_update :log_update
  end

  def log_action(action)
    log = LogModel.new
    log.loggable_id = id
    log.loggable_type = self.class.class_name
    log.action = action
    log.save
  end
end
