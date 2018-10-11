class BankruptcyRating
  attr_accessor :data,
                :drop,
                :drop_class,
                :color,
                :text,
                :previous_credit_classes,
                :previous_financial_stress_classes,
                :stable,
                :stable_class

  FIELD_TO_SCORES = [{ field: :financial_stress_score_class, value: 5 },
                     { field: :credit_score_class, value: 5 },
                     { field: :financial_stress_score_class, value: 4 },
                     { field: :credit_score_class, value: 4 }]

  def initialize(data)
    @data = data
    @previous_financial_stress_classes = []
    @previous_credit_classes = []
    determine_rating
  end

  def determine_rating
    if all_data_available?
      initialize_variables
      process_classes
    end
    set_green_rating
    set_gray_rating || set_red_rating || set_orange_rating
    self
  end

  def initialize_variables
    data.each do |row|
      previous_financial_stress_classes.push(row.financial_stress_score_class)
      previous_credit_classes.push(row.credit_score_class)
    end
  end

  def process_classes
    FIELD_TO_SCORES.each do |row|
      score_class = row[:value]
      case row[:field]
      when :financial_stress_score_class
        determine_stability(previous_financial_stress_classes, score_class)
      when :credit_score_class
        determine_stability(previous_credit_classes, score_class)
      end
    end
  end

  def process_data(&block)
    FIELD_TO_SCORES.map do |f2s|
      block.call(f2s) if block_given?
    end
  end

  private

  def all_data_available?
    !data.empty? && process_data { |f2s| find_missing_fields(f2s) }.flatten.empty?
  end

  def current_class?(current_class, score_class)
    current_class == score_class
  end

  def determine_stability(array, score_class)
    max = array.max
    current_class = array[0]
    is_current = current_class?(current_class, score_class)
    if (max == current_class) && is_current
      @stable = true
      @stable_class = current_class
    elsif (max > current_class) && is_current
      @drop = true
      @drop_class = current_class
    end
  end

  def find_missing_fields(f2s)
    data.reject { |record| record.send(f2s[:field]) }
  end

  def set_gray_rating
    return if all_data_available?
    set_rating('gray', 'N/A')
  end

  def set_green_rating
    set_rating('green', I18n.t('bankruptcy.green'))
  end

  def set_orange_rating
    return if drop_class != 4 && !drop
    set_rating('orange', I18n.t('bankruptcy.orange'))
  end

  def set_rating(color, text)
    @color = color
    @text = text
    true
  end

  def set_red_rating
    return if stable_class != 5 && !stable
    set_rating('red', I18n.t('bankruptcy.red'))
  end
end
