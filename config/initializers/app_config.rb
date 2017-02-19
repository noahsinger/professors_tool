# APP_CONFIG = YAML.load_file("#{Rails.root}/config/app_config.yml")[Rails.env]

class APP_CONFIG
  def self.instance
    values = {
      site_name: "Threesuns",
      ted_username: ENV['ted_username'],
      ted_password: ENV['ted_password']
    }

    if Rails.env.development?
      values[:owner_email] = "professorsinger@threesuns.org"
      values[:site_url] = "http://localhost:3000"
      values[:host] = "localhost:3000"
    elsif Rails.env.production?
      values[:owner_email] = "professorsinger@threesuns.org"
      values[:site_url] = "http://threesuns.org"
      values[:host] = "threesuns.org"
    else
      values[:owner_email] = "noah@threesuns.org"
      values[:host] = "localhost:3000"
      values[:site_url] = "http://localhost:3000"
    end

    values
  end

  def self.[](key)
    self.instance[key.to_sym]
  end
end
