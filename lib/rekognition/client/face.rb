module Rekognition
  module Client
    module Face
      def face_detect(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64)
        opts.assert_required_keys([:urls, :base64])
        compile_jobs_string_and_make_request("face", opts)
      end

      def face_add(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64, :user_id, :tag)
        opts.assert_required_keys([:urls, :base64])
        compile_jobs_string_and_make_request("face_add", opts)
      end
      

      def face_train(opts={})
        opts.assert_valid_keys(:jobs, :user_id, :tags)
        # if they have tags we call the sync method because they must be trying to train just those tags
        if opts[:tags]
          compile_jobs_string_and_make_request("face_train_sync", opts)
        else
          compile_jobs_string_and_make_request("face_train", opts)
        end
      end

      def face_train_sync(opts={})
        opts.assert_valid_keys(:jobs, :user_id, :tags)
        opts.assert_required_keys(:tags)
        compile_jobs_string_and_make_request("face_train_sync", opts)
      end


      def face_cluster(opts={})
        opts.assert_valid_keys(:jobs, :user_id, :aggressiveness)
        compile_jobs_string_and_make_request("face_cluster", opts)
      end
      

      def face_crawl(opts={})
        opts.assert_valid_keys(:jobs, :fb_id, :access_token, :user_id)
        opts.assert_required_keys(:fb_id, :access_token)
        compile_jobs_string_and_make_request("face_crawl", opts)
      end
      
      def face_recognize(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64, :user_id, :num_return, :tags)
        opts.assert_required_keys([:urls, :base64])
        compile_jobs_string_and_make_request("face_recognize", opts)
      end

      def face_visualize(opts={})
        opts.assert_valid_keys(:jobs, :user_id, :tags, :num_tag_return, :num_img_return_pertag)
        compile_jobs_string_and_make_request("face_vizualize", opts)
      end
      
      def face_search(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64, :user_id, :num_return)
        opts.assert_required_keys([:urls, :base64])
        compile_jobs_string_and_make_request("face_search", opts)
      end
      
      def face_delete(opts={})
        opts.assert_valid_keys(:jobs, :user_id, :tag, :img_index)
        compile_jobs_string_and_make_request("face_delete", opts)
      end
      
      def face_rename(opts={})
        opts.assert_valid_keys(:jobs, :tag, :new_tag, :user_id, :img_index)
        opts.assert_required_keys(:tag, :new_tag, :user_id)
        compile_jobs_string_and_make_request("face_rename", opts)
      end
      
      def face_stats(opts={})
        opts.assert_valid_keys(:jobs)
        compile_jobs_string_and_make_request("face_name_space_stats", opts)
      end
      
      private
      def compile_jobs_string_and_make_request(method_name, opts)
        Rails.logger "BOOM!!!"
        p "STUFF!"
        jobs_string = method_name
        if opts[:jobs]
          opts[:jobs].delete(method_name)
          opts[:jobs].prepend(method_name)
          jobs_string << opts[:jobs].join("_")
          opts[:jobs] = jobs_string
        else
          opts = opts.merge(:jobs => method_name)
        end
        if opts[:tags].is_a?(Array) # this doesn't appear to be working for some reason
          opts[:tags] = opts[:tags].join(";")
        end
        make_request(opts)
      end
    end
  end
end