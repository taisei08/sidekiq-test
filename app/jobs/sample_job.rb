# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Message.find_each do |message|
      message.update(sidekiq_executed_time: DateTime.current)
    end
  end
end
