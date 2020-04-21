defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Get a value from bucket
  """
  def get(bucket, key) do
    # Agent.get(bucket, fn bucket -> Map.get(bucket, key) end)
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Put a value in the bucket
  """
  def put(bucket, key, value) do
    # Agent.update(bucket, fn bucket -> Map.put(bucket, key, value) end)
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Delete a value from the bucket
  """
  def delete(bucket, key) do
    # Agent.get_and_update(bucket, &Map.pop(&1, key))
    Agent.get_and_update(bucket, fn bucket ->
      Map.pop(bucket, key)
    end)
  end
end
