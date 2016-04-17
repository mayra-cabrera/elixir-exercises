defmodule Pipeline do

  def process_messages(user_id) do
    find_by_user_id(user_id) 
    |> fetch_by_key(:messages)
    |> get_important_messages
    |> Enum.each(&save_message(&1))
  end

  def process_messages(user_id) do
    val = find_by_user_id(user_id)    
    Enum.each(
      get_important_messages(
        fetch_by_key(find_by_user_id(user_id), :messages)
      ), &save_message(&1))    
  end

  

  def find_by_user_id(_user_id) do
    %{user: 1234, messages: ["msg1", "msg2", "hee"], foo: "bar"}
  end

  def fetch_by_key(user, key) do
    case Map.fetch(user, key) do
      {:ok, value} -> value
      _ -> :fail
    end
  end

  def get_important_messages(messages) do
    messages |> Enum.filter(fn val -> String.starts_with?(val, "msg")  end)
  end

  def save_message(message) do
    IO.puts "saving message '#{message}!'"
  end
end


Pipeline.process_messages("")