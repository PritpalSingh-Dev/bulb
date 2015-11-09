class Idea < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable
  acts_as_votable
  mount_uploader :attachment, AttachmentUploader

  scope :top_5, -> { order(:cached_votes_score).reverse.take(5) }

  def votes_for_pie_chart
    {
      'no' => number_of_people_in_company - number_of_votes,
      'yes' => number_of_votes
    }  
  end

  def number_of_votes
    get_upvotes.count
  end

  def number_of_people_in_company
    user.company.users.count
  end
end
