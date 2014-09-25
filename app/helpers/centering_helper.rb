module CenteringHelper
  def start_centering
    raw('<div class="outer_wrapper">
          <div class="centering_wrapper">
            <div class="center_element">'
       )
  end

  def end_centering
    raw( '    </div>
            </div>
          </div>')
  end
end
