module TaskinatorUi
  class ProcessesController < ApplicationController
    layout false, only: [:children]

    def index
      @processes = Taskinator::Api::Processes.new.each.to_a.sort_by(&:created_at).reverse
    end

    def show
      @process = Taskinator::Process.fetch(params[:id])
    end

    def children
      @process = Taskinator::Process.fetch(params[:process_id])
    end

    def destroy
      @process = Taskinator::Process.fetch(params[:id])
      @process.cleanup
      redirect_to processes_path
    end
  end
end
