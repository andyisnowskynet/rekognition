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
      
      def face_verification(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64, :urls_compare, :base64_compare)
        opts.assert_required_keys([:urls, :base64], [:urls_compare, :base64_compare])
        compile_jobs_string_and_make_request("face_compare", opts)
      end
      
      def face_search(opts={})
        opts.assert_valid_keys(:jobs, :urls, :base64, :user_id, :num_return, :tags)
        opts.assert_required_keys([:urls, :base64])
        method_name = "face_search"
        if opts[:tags]
          method_name = "face_search[#{opts[:tags].join(';')}]"
        end
        opts.delete(opts[:tags])
        compile_jobs_string_and_make_request(method_name, opts)
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
    end
  end
end