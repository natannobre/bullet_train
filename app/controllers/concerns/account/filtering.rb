module Account::Filtering
  extend ActiveSupport::Concern

  included do
    helper_method :available_filter_attributes

    def apply_filters
      scope = instance_variable_get("@#{controller_name}")

      if params[:filters].present?
        params[:filters].each do |key, value|
          if available_filter_attributes.include?(key) && value.present?
            scope = scope.where(scope.klass.arel_table[key].matches("%#{value}%"))
          end
        end
      end

      instance_variable_set("@#{controller_name}", scope)
    end
  end

  private

  def available_filter_attributes
    []
  end
end
