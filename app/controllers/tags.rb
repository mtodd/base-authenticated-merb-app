class Tags < Application
  # provides :xml, :yaml, :js

  def index
    @tags = Tag.all
    display @tags
  end

  def show(id)
    @tag = Tag.get(id)
    raise NotFound unless @tag
    display @tag
  end

  def new
    only_provides :html
    @tag = Tag.new
    display Tag
  end

  def edit(id)
    only_provides :html
    @tag = Tag.get(id)
    raise NotFound unless @tag
    display @tag
  end

  def create(tag)
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect resource(@tag), :message => {:notice => "Tag was successfully created"}
    else
      render :new
    end
  end

  def update(tag)
    @tag = Tag.get(tag[:id] )
    raise NotFound unless @tag
    if @tag.update_attributes(tag)
       redirect resource(@tag)
    else
      display @tag, :edit
    end
  end

  def destroy(id)
    @tag = Tag.get(id)
    raise NotFound unless @tag
    if @tag.destroy
      redirect resource(@tags)
    else
      raise InternalServerError
    end
  end

end # Tags
