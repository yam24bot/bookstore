#Job statuses
In the job.rb model, eight statuses with such parameters are responsible for the work:
```ruby
    state :draft, initial: true
    state :published
    state :accepted
    state :in_progress
    state :finished
    state :invoiced
    state :closed
    state :cancelled
```
