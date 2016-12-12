class ExperimentsController < ApplicationController
  include  HTTParty
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]

  # GET /experiments
  # GET /experiments.json

  def index

      if $glibrary_response == nil
        puts "No token for gLibrary. Getting a glibrary token with " + ENV["GLIBRARY_USERNAME"].to_s
        Glibrary.get_token(ENV["GLIBRARY_USERNAME"],ENV["GLIBRARY_PASSWORD"])
        # The token is alive for two weeks.
        created = $glibrary_response['created']
        puts "token created at " + created.to_s
        token_created = Time.parse($glibrary_response['created']).to_i
        time_remaining = $token_expires - (Time.now.to_i)
      # token_created = DateTime.rfc3339($glibrary_response['created']).to_time.to_i
    elsif ($token_expires.to_i - Time.now.to_i < 100) || $token_expires == nil
        puts "the time remaining is less than 10 seconds - refreshing the token"
        Glibrary.get_token(ENV["GLIBRARY_USERNAME"],ENV["GLIBRARY_PASSWORD"])
        created = $glibrary_response['created']
        puts "token created at " + created.to_s + " and expires at " + $token_expires.to_s
      end

      puts "We have a token and TTL is still ok."
      p $token_expires.to_i - Time.now.to_i

      @experiments = Experiment.all
      @collections = Glibrary.collections

  end

  def collections(token)
    @collections = Glibrary.collections
  end
  # GET /experiments/1
  # GET /experiments/1.json
  def show
  end

  # GET /experiments/new
  def new
    @experiment = Experiment.new
  end

  # GET /experiments/1/edit
  def edit
  end

  # POST /experiments
  # POST /experiments.json
  def create
    @experiment = Experiment.new(experiment_params)

    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment, notice: 'Experiment was successfully created.' }
        format.json { render :show, status: :created, location: @experiment }
      else
        format.html { render :new }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
    self.SaveToGlibrary
  end

  def SaveToGlibrary
    p  $glibrary_response
    post()
  end

  # PATCH/PUT /experiments/1
  # PATCH/PUT /experiments/1.json
  def update
    respond_to do |format|
      if @experiment.update(experiment_params)
        format.html { redirect_to @experiment, notice: 'Experiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @experiment }
      else
        format.html { render :edit }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments/1
  # DELETE /experiments/1.json
  def destroy
    @experiment.destroy
    respond_to do |format|
      format.html { redirect_to experiments_url, notice: 'Experiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiment
      @experiment = Experiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experiment_params
      params.require(:experiment).permit(:language, :primary, :configuration)
    end
end
