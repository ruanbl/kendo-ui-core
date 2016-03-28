module CodeGen::Java

    class CompositeOption < CodeGen::CompositeOption
        include Options

        def tag_name
            @owner.tag_name + '-' + @name
        end

        def namespace
            @owner.namespace
        end

        def tag_class
            name = @name.pascalize

            return name + 'Tag' if @owner.instance_of?(component_class)

            @owner.tag_class.sub('Tag', '') + name + 'Tag'
        end

        def events
            composite = composite_options
            @options.find_all { |option| option.type.include?('Function') && !composite.any? { |o| o.name == option.name } }
                    .map { |option | event_class.new(:name => option.name, :owner => self, :description => option.description) }
        end
    end

end