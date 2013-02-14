class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def next_if
    render :partial => "next_if"
  end

  def pmap
    @users = User.all
    render :partial => "pmap"
  end

##--------------------------------------------------------------------##  
  def isrunning
    pids = `ps -e | awk '{print $1}'`
    pid_arr = Array.new
    pids.each_line{|s| pid_arr << s.chomp}
    if pid_arr.include?(@@pid)
      return true
    else
      return false  
    end
  end
  
  def clone
    lock_file = "assets/robots.txt"
    if(File.exist?(lock_file))
      @@pid = File.open(lock_file,"r").read
      if self.isrunning
        puts "pid #{@@pid} is already running"
        
        return false
      else
        puts "Previous job died"
      end
    end  
    newpid = Process.pid
    file = File.open(lock_file,"w")
    file.write("#{newpid}")
    file.close
    puts "pid #{newpid} processing the job..."
    return newpid
    #render :text=>'<pre>'+newpid.to_yaml and return true
   end
  
  def unlock
    lock_file = "public/robots.txt"
    if File.exist?(lock_file)
      File.delete(lock_file)
      return true
    end
  end  
  
end
