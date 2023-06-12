# frozen_string_literal: true

class ExportDbJobController < ApplicationController
  def job_done; end

  def trigger_job
    HelloWorldJob.perform_later
    redirect_to export_db_job_job_done_path
  end
end
