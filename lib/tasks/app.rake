namespace :app do
  namespace :db do
    desc 'Get database from Heroku'

    task :production do
      Bundler.with_clean_env do
        sh 'heroku pg:backups capture --app associationpaupiette'
        sh 'curl -o db/latest.dump `heroku pg:backups public-url --app associationpaupiette`'
        sh 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop'
        sh 'bundle exec rails db:create'
        begin
          sh 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d extranet2_development db/latest.dump'
        rescue
          'There were some warnings or errors while restoring'
        end

      end
    end
  end
end
