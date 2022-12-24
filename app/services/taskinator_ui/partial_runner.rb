module TaskinatorUi
  class PartialRunner
    class ProcessWrapper < SimpleDelegator
      def initialize(obj)
        obj = obj.__getobj__ if obj.is_a?(Delegator)
        super(obj)
      end

      def children
        case __getobj__
        when Taskinator::Task::Step, Taskinator::Task::Job
          []
        when Taskinator::Task::SubProcess
          [self.class.new(sub_process)]
        else
          tasks.map { |task| self.class.new(task) }
        end
      end

      def sequential?
        __getobj__.is_a?(Taskinator::Process::Sequential)
      end
    end

    def initialize(process, uuids:)
      @process = ProcessWrapper.new(process)
      @uuids = uuids
      @queue = []
    end

    def call
      traverse(@process)
      @queue.each(&:enqueue!)
    end

    private

    def traverse(process)
      found = @uuids.include?(process.uuid) # process found

      if found
        @queue << process if found # exactly this process must be enqueued
        return true
      else
        # check children if the needed process is there
        process.children.each do |child|
          if traverse(child)
            process.current_state = :processing unless found
            found = true
            return true if process.sequential?
          else
            process.deincr_pending_tasks
            child.current_state = :completed
          end
        end
      end

      found
    end
  end
end
