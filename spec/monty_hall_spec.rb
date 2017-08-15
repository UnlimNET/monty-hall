require 'monty_hall'

describe MontyHall do
  describe 'Simulate Monty paradox' do
    monty = MontyHall.new(100)
    monty.simulate_paradox

    context 'Check hash result key: staying' do
      subject { monty.table_values.first }
      it 'Return hash has staying values' do
         should have_key(:staying)
      end
    end

    context 'Check hash result key: switching' do
      subject { monty.table_values.last }
      it 'Return hash has switching values' do
        should have_key(:switching)
      end
    end

    context 'Statistic' do
      subject { monty.statistics.length }
      it 'Statistic should be an array and count elements should be more than 0' do
        should > 0
      end
    end

    it 'Output for statistic should be present every time' do
      expect { monty.print_results }.to output(nil).to_stdout
    end
  end
end
