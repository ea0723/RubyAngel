inputs = %w[
  CollectionSelectInput
  DateTimeInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  RangeInput
  StringInput
  TextInput
]

inputs.each do |input_type|
  simpleclass = "SimpleForm::Inputs::#{input_type}".constantize

  new_class = Class.new(simpleclass) do
    def input_html_classes
      super.push('form-control')
    end
  end

  Object.const_set(input_type, new_class)
end