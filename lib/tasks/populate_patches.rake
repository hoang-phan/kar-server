require 'csv'
require 'open-uri'

namespace :csv do
  desc 'import patches data from dropbox'
  task populate_patches: :environment do
    csv = CSV.parse(open(ENV['patches_url']).read, headers: true)
    Patch.delete_all
    patches = csv.map do |row|
      Patch.new(version: row['version'], link: row['link'])
    end
    Patch.import(patches)
  end
end
