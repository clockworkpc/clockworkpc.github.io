---
layout: post
title:  "Mass Assignment"
date:   "Tue 31 Mar 10:28:19 AEDT 2020"
tags: [rails, security, crud]
---
## Security Flaw of Mass Assignment

```ruby
# Valid
@user.update_attributes({username: 'kskoglund'})

# Hacked
@user.update_attributes({username: '733thax0r', password: 'nososecretanymore', admin: true})
```

## Failing Code (ActiveModel::ForbiddenAttributesError)

```ruby
def create
    # Instantiate a new object using form parameters.
    @subject = Subject.new(params[:subject])
    params.permit

    # Save the object.
    if @subject.save
    # If save succeeds, redirect to index action.
    redirect_to(subjects_path)
    else
    # If save fails, redisplay the form.
    render('new')
    end
end
```

## Strong Parameters, i.e. Whitelisting

### [#permit](https://devdocs.io/rails~6.0/actioncontroller/parameters#method-i-permit):

> Returns a new ActionController::Parameters instance that includes only the given filters and sets the permitted attribute for the object to true. This is useful for limiting which attributes should be allowed for mass updating.

```ruby
params = ActionController::Parameters.new(user: { name: "Francesco", age: 22, role: "admin" })
permitted = params.require(:user).permit(:name, :age)
permitted.permitted?      # => true
permitted.has_key?(:name) # => true
permitted.has_key?(:age)  # => true
permitted.has_key?(:role) # => false
```

### [#require](https://devdocs.io/rails~6.0/actioncontroller/parameters#method-i-require)

```ruby
ActionController::Parameters.new(person: { name: "Francesco" }).require(:person)
# => <ActionController::Parameters {"name"=>"Francesco"} permitted: false>
```

### Example

```ruby
params[:user] = { name: 'John Smith', email: 'john.smith@me.com', admin: false }

@user = User.new(params[:user])
permitted = params[:user].require(:email).permit(:name)
```

## Passing Code

```ruby
class SubjectsController < ApplicationController

    def create
        @subject = Subject.new(subject_params)

        if @subject.save
            redirect_to(subjects_path)
        else
            render('new')
        end
    end

    private

    def subject_params
        params.require(:subject).permit(:name, :position, :visible)
    end
end
```
