class Expenditures < Application
  # provides :xml, :yaml, :js

  def index
    @expenditures = Expenditure.all
    display @expenditures
  end

  def show(id)
    @expenditure = Expenditure.get(id)
    raise NotFound unless @expenditure
    display @expenditure
  end

  def new
    only_provides :html
    @expenditure = Expenditure.new
    display Expenditure
  end

  def edit(id)
    only_provides :html
    @expenditure = Expenditure.get(id)
    raise NotFound unless @expenditure
    display @expenditure
  end

  def create(expenditure)
    @expenditure = Expenditure.new(params[:expenditure])
    if @expenditure.save
      redirect resource(@expenditure), :message => {:notice => "Expenditure was successfully created"}
    else
      render :new
    end
  end

  def update(expenditure)
    @expenditure = Expenditure.get(expenditure[:id] )
    raise NotFound unless @expenditure
    if @expenditure.update_attributes(expenditure)
       redirect resource(@expenditure)
    else
      display @expenditure, :edit
    end
  end

  def destroy(id)
    @expenditure = Expenditure.get(id)
    raise NotFound unless @expenditure
    if @expenditure.destroy
      redirect resource(@expenditures)
    else
      raise InternalServerError
    end
  end

end # Expenditures
