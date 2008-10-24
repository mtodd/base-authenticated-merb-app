class Categories < Application
  # provides :xml, :yaml, :js

  def index
    @categories = Category.all
    display @categories
  end

  def show(id)
    @category = Category.get(id)
    raise NotFound unless @category
    display @category
  end

  def new
    only_provides :html
    @category = Category.new
    display Category
  end

  def edit(id)
    only_provides :html
    @category = Category.get(id)
    raise NotFound unless @category
    display @category
  end

  def create(category)
    @category = Category.new(params[:category])
    if @category.save
      redirect resource(@category), :message => {:notice => "Category was successfully created"}
    else
      render :new
    end
  end

  def update(category)
    @category = Category.get(category[:id] )
    raise NotFound unless @category
    if @category.update_attributes(category)
       redirect resource(@category)
    else
      display @category, :edit
    end
  end

  def destroy(id)
    @category = Category.get(id)
    raise NotFound unless @category
    if @category.destroy
      redirect resource(@categories)
    else
      raise InternalServerError
    end
  end

end # Categories
