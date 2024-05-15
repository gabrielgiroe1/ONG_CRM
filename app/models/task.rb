class Task < ApplicationRecord
  belongs_to :user, optional: true
  enum status: {Next_up: "Next up", In_progress: "In progress", Finish: "Finish"}

end
