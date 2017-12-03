class PostingController < ApplicationController
  before_action :set_languages, only: %i[new edit create index]
  before_action :set_categories, only: %i[new edit create index]
  before_action :authenticate_user!
end
