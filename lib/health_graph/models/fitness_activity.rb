module HealthGraph
  class FitnessActivity
    include Model
    
    hash_attr_accessor :uri, :userID, :type, :start_time, :total_distance, :distance, :duration, :heart_rate, :calories, :total_climb, :path, :source, 
    
    # class Path
    #   include Model      
      
    #   # hash_attr_accessor :type, :start_time, :total_distance, :duration, :uri
      
    #   def initialize(hash) 
    #     populate_from_hash! hash
    #   end
    # end
                      
    def initialize(access_token, path, params = {})
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:fitness_activity], params
      self.body = response.body
      populate_from_hash! self.body
    end                           
  end
end

# application/vnd.com.runkeeper.FitnessActivity+json