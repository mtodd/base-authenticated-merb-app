class Incomes < Application
  # provides :xml, :yaml, :js

  def index
    @incomes = Income.all
    display @incomes
  end

  def show(id)
    @income = Income.get(id)
    raise NotFound unless @income
    display @income
  end

  def new
    only_provides :html
    @income = Income.new
    display Income
  end

  def edit(id)
    only_provides :html
    @income = Income.get(id)
    raise NotFound unless @income
    display @income
  end

  def create(income)
    @income = Income.new(params[:income])
    if @income.save
      redirect resource(@income), :message => {:notice => "Income was successfully created"}
    else
      render :new
    end
  end

  def update(income)
    @income = Income.get(income[:id] )
    raise NotFound unless @income
    if @income.update_attributes(income)
       redirect resource(@income)
    else
      display @income, :edit
    end
  end

  def destroy(id)
    @income = Income.get(id)
    raise NotFound unless @income
    if @income.destroy
      redirect resource(@incomes)
    else
      raise InternalServerError
    end
  end

end # Incomes
