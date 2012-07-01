ActionController::Routing::Routes.draw do |map|
  map.resources :projects do |project|
    project.resources :milestones
  end

  map.resources :milestones, :collection => {
      :parent_project_changed => [:get],
      :subproject_changed => [:get],
      :recalculate_planned_end_date => [:post],
      :recalculate_start_date => [:post],
      :recalculate_actual_date => [:get]
  },:member => {:status_by => :post}
end