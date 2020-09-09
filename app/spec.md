# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
        A User has_many comments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        A Review belongs_to a Town
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        User has_many Towns through Reviews, Town has_many Users through Reviews
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items     through Ingredients, Item has_many Recipes through Ingredients)
        User has_many Towns through Reviews, Town has_many Users through Reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        Review submits content 'the review'
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
        bcrypt
- [x] Include login (how e.g. Devise)
        bcrypt
- [x] Include logout (how e.g. Devise)
        destroy action in sessions controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        Google/omniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
        index, reviews/8/comments 
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        new, /towns/9/reviews/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        /reviews/new

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate