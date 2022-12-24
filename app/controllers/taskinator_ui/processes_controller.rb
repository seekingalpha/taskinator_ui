module TaskinatorUi
  class ProcessesController < ApplicationController
    layout false, only: [:children]

    def index
      @processes = Taskinator::Api::Processes.new.each.to_a.sort_by(&:created_at).reverse
    end

    def show
      @process = Taskinator::Process.fetch(params[:id])
    end

    def run
      uuids = params[:uuids].to_set
      process = Taskinator::Process.fetch(params[:process_id])
      PartialRunner.new(process, uuids: uuids).call

      redirect_to action: :show, id: params[:process_id]
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
