namespace :export do
  desc "Prints Country.all in a seeds.rb way."
  task :seeds_format, [:model] => :environment do |t, args|
    excluded_fields = %w(created_at updated_at id birth_date reset_password_sent_at remember_created_at current_sign_in_at last_sign_in_at avatar_updated_at)
    if args[:model].present?
      klass = args[:model].constantize
      klass.order(:id).all.each do |i|
        fields = i.serializable_hash.delete_if {|key, value| excluded_fields.include?(key)}.to_s.gsub(/[{}]/,'')
        puts "#{klass}.find_or_create_by(#{fields})"
      end
    else
      Rails.application.eager_load!
      klasses = ApplicationRecord.descendants

      klasses.each do |klass|
        klass.order(:id).all.each do |i|
            fields = i.serializable_hash.delete_if {|key, value| excluded_fields.include?(key)}.to_s.gsub(/[{}]/,'')
            puts "#{klass}.find_or_create_by(#{fields})"
        end
      end
    end
  end
end
