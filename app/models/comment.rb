class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, class_name: "State"

  attr_accessor :tag_names

  validates :text, presence: true

  before_create :set_previous_state
  after_create :set_ticket_state
  after_create :associate_tags_with_ticket
  after_create :creator_watches_ticket

  delegate :project, to: :ticket

  private

    def set_previous_state
      self.previous_state = ticket.state
    end

    def associate_tags_with_ticket
      if tag_names
        tags = tag_names.split(" ").map do |name|
          Tag.find_or_create_by(name: name)
        end
        self.ticket.tags += tags
        self.ticket.save
      end
    end

    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end

    def creator_watches_ticket
      ticket.watchers << user
    end
end
