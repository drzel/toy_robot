require "spec_helper"

describe ToyRobot do
  it "has a version number" do
    expect(ToyRobot::VERSION).not_to be nil
  end
end

describe Robot do
  let(:robot) { build(:robot) }

  describe "#left" do
    it "sends turn(:left) to @position" do
      position = robot.position
      expect(position).to receive(:turn).with(:left)
      robot.left
    end
  end

  describe "#right" do
    it "sends turn(:right) to @position" do
      position = robot.position
      expect(position).to receive(:turn).with(:right)
      robot.right
    end
  end

  describe "#move" do
    it "sends move to @position" do
      position = robot.position
      expect(position).to receive :advance
      robot.move
    end
  end

  describe "#report" do
    it 'outputs "No position" to stdout' do
      expect { robot.report }.to output("No position\n").to_stdout
    end
  end
end

describe Arena do
  let(:arena) { build(:arena) }

  describe "#inbounds?" do
    context "when coordinates are inbounds" do
      it "returns true" do
        expect(arena.inbounds? 0, 0).to eq true
      end
    end

    context "when coordinates are out-of-bounds" do
      it "returns false" do
        expect(arena.inbounds? 10, 10).to eq false
      end
    end
  end
end

describe NullArena do
  let(:null_arena) { build(:null_arena) }

  describe "#inbounds?" do
    it "returns true" do
      expect(null_arena.inbounds? rand(100), rand(100)).to eq true
    end
  end
end

describe NullPosition do
  let(:null_position) { build(:null_position) }

  describe "#advance" do
    it "returns NullPosition" do
      expect(null_position.advance.class).to eq NullPosition
    end
  end

  describe "#turn" do
    it "returns NullPosition" do
      argument = [:left, :right].sample
      expect(null_position.turn(argument).class).to eq NullPosition
    end
  end

  describe "#to_s" do
    it 'returns "No position"' do
      expect(null_position.to_s).to eq "No position"
    end
  end
end
