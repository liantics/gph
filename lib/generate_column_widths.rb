module GenerateColumnWidths
  EXISTING_COLUMNS_IN_ROW = 0
  TOTAL_COLUMNS_IN_GRID = 12
  MIN_COL_SPAN = 3
  MAX_COL_SPAN = 12

  def generate_widths (new_columns, total_grid_columns: 12, existing_columns: 0, min_column_span: 3, max_column_span: 12)
    columns_in_grid = total_grid_columns || TOTAL_COLUMNS_IN_GRID
    columns_already_in_row = existing_columns || EXISTING_COLUMNS_IN_ROW
    minimum_columns_to_span = min_column_span || MIN_COL_SPAN
    maximum_columns_to_span = max_column_span || MAX_COL_SPAN

    columns_in_row = new_columns + columns_already_in_row
    span = (columns_in_grid / columns_in_row).floor

    if span < MIN_COL_SPAN
      span = MIN_COL_SPAN
    elsif span > MAX_COL_SPAN
      span = MAX_COL_SPAN
    end

   span
  end
end
