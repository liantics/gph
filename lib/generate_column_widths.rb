module GenerateColumnWidths
  def generate_widths(new_columns, total_grid_columns: 12, existing_columns: 0, min_column_span: 3, max_column_span: 12)

    columns_in_row = new_columns + existing_columns
    span = (total_grid_columns / columns_in_row).floor

    if span < min_column_span
      span = min_column_span
    elsif span > max_column_span
      span = max_column_span
    end

    span
  end
end
