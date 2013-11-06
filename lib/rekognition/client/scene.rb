module Rekognition
  module Client
    module Scene
      def scene_understanding(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64)
        opts.assert_required_keys([:urls, :base64])
        compile_jobs_string_and_make_request("scene", opts)
      end      
    end
  end
end