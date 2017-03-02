require 'spec_helper'
require_relative '../lib/lyricfind/command_line'

describe CommandLine do
  it 'has a verbose flag' do
    expect(CommandLine.run(['-v'])).to include (:verbose)
  end

  it 'has a file flag' do
    parse = CommandLine.parse(%w(-f filename))
    expect(parse[:file]).to eq 'filename'
  end

  it 'runs a file flag' do

    expect(CommandLine).to receive(:run).with(["-f", "filename"]).and_call_original
    expect(CommandLine).to receive(:do_something).with('filename')
    CommandLine.run(%w(-f filename))

  end

end
