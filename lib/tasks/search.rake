=begin
namespace :search do
  include AlgoliaSearch

  def add_one_to_search_index(klass, id)
    obj = klass.find(id)
    obj.index! if obj.respond_to?(:index!)
  end

  def remove_one_from_search_index(klass, id)
    obj = klass.find(id)
    obj.remove_from_index! if obj.respond_to?(:remove_from_index!)
  end

  # rake 'search:add_all_posts'
  desc 'index all posts'
  task :add_all_posts => :environment do |task, args|
    Post.all.each do |p|
      if p.is_validates?
        add_one_to_search_index("Post".classify.constantize, p.id.to_s)
      end
    end
  end

  #rake 'search:add_one[Post, 10]'
  desc 'index one record'
  task :add_one, [:model, :id] => :environment do |task, args|
    add_one_to_search_index(args.model.classify.constantize, args.id)
  end

  desc 'remove one record'
  task :remove_one, [:model, :id] => :environment do |task, args|
    remove_one_from_search_index(args.model.classify.constantize, args.id)
  end
end
=end