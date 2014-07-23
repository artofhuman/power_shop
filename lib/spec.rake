namespace :power_shop do
  namespace :spec do
    task :prepare do
      Rake::Task['app:log:clear'].invoke
      Rake::Task['app:db:abort_if_pending_migrations'].clear
      Rake::Task['app:db:test:prepare'].invoke
      Rake::Task['app:db:migrate'].invoke
    end
  end

  desc 'Run all tulip engine specs'
  task :spec => 'spec:prepare' do
    exec 'rspec'
  end
end
