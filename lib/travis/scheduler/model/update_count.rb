module Travis
  module Scheduler
    module Model
      class UpdateCount < Struct.new(:job, :redis)
        def count
          @count ||= redis.incr(key)
        end

        private

          def key
            "job:state_update_count:#{job.id}"
          end
      end
    end
  end
end
