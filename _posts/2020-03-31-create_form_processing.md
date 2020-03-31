## Main Steps

1. Instantiate a new object using form parameters.
1. Save the object.
    1. If save succeeds, redirect to index action.
    1. If save fails, redisplay the form.

## Failing Code (ActiveModel::ForbiddenAttributesError)

```ruby
# subjects_controller.rb
class SubjectsController < ApplicationController

  def create
    # Instantiate a new object using form parameters.
    @subject = Subject.new(params[:subject])

    # Save the object.
    if @subject.save
      # If save succeeds, redirect to index action.
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form.
      render('new')
    end
  end

end

```

## Steps To Fix the Code

### Mass Assignment

> The act of passing a Hash of values to an Object to be assigned as attributes.

### Primary methods that use Mass Assignment

```ruby
Subject.new(params[:subject])
Subject.create(params[:subject])
@subject.update_attributes(params[:subject])
```

### Security Flaw of Mass Assignment

Because Rails applies all the attributes in `params[:subject]`, extra parameters could be injected into the Hash.

#### Example

```ruby
# Valid PATCH
@user.update_attributes({username: 'kskoglund'})

## Hacked PATCH
@user.update_attributes({username: 'kskoglund', password: 'notverysecretanymore', admin: true})
```

### Strong Parameters, i.e. Whitelisting

`params` permit method

```ruby
params = ActionController::Parameters.new(user: { name: "Francesco", age: 22, role: "admin" })
permitted = params.require(:user).permit(:name, :age)
permitted.permitted?      # => true
permitted.has_key?(:name) # => true
permitted.has_key?(:age)  # => true
permitted.has_key?(:role) # => false
```



```ruby
# Strong Parameters
params.permit
```

### Passing Code

```ruby
# Code that works goes here
```

