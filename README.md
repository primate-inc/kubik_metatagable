# KubikMetatagable
Manage meta tags to for app/models.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'kubik_metatagable'
```

And then execute:
```bash
$ bundle
```

Finally, run the generator to add the necessary migrations, routes, and add metatags to application.html.erb:
```bash
$ bundle exec rails g kubik_metatagable:install
```

Or install it yourself as:
```bash
$ gem install kubik_metatagable
```

## Usage
You can quickly add the ability to include meta tags to your models in Kubik.

Below is an example of how to add meta tags to an example Blog model and how
to permit the params in Active Admin.

### App

You can manage the site-wide meta tag details at the path `/kubik/meta_tag_defaults/edit`

These will be the fallbacks for metatags accross your site.

### Model

```ruby
class Blog < ApplicationRecord
  include Kubik::Metatagable

  ...
end
```

You can set the fields to be as defaults for title and description
by adding defaults to your model by telling what attribute you want
to use.

```ruby
  kubik_metatagable(
    defaults: true,
    title: :blog_title,
    description: :blog_description
  )
```
Now when you update the resource, it will save empty fields as the
defaults, or update them only if they are the same. This way you can
you create overrides when necessary.

### Controller

```ruby
class BlogsController < ApplicationController
  ...

  def show
    @blog = Blog.find(params[:id])
    insert_kubik_meta_tags(@blog)
  end

  ...
end
```

### Active Admin

```ruby
ActiveAdmin.register Blog do
  permit_params do
    params = [
      :title, ...
    ]
    Kubik::MetaTagParams.push_to_params(Blog, params)
    params
  end

  ...

  form do |f|
    tabs do
      tab 'Content' do
        inputs do
          ...
        end
      end
      tab 'Meta Tags' do
        render partial: 'kubik/metatagable', f: f
      end
    end
    actions
  end

  ...
end
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
