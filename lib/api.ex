defmodule Scene.Api do
  alias Scene.Entity
  alias Domain.Caller

  @typedoc """
  Integer 类型的错误状态编码
  """
  @type code :: integer

  @typedoc """
  错误发生的原因
  """
  @type reason :: String.t

  @typedoc """
  UUID 的 String 表达

  ## 例子
  ```elixir
  "60c0b63f-99f0-5fb1-9f34-46a86acd37fa"
  ```
  """
  @type uuid :: String.t

  @doc """
  创建场景

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |name|string|名字|
  |image|string|场景图 URL|
  |width|int|场景图宽度（像素）|
  |height|int|场景图高度（像素）|

  ## 结果

  ### 成功

  ```elixir
  {:ok, uuid}
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec create(Caller.t, String.t, String.t, non_neg_integer, non_neg_integer) :: {:ok, uuid} | {:error, code, reason}
  def create(caller, name, image, width, height) do
    remote_call(:create, [caller, name, image, width, height])
  end

  @doc """
  修改场景

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |sid|uuid|场景图 ID|
  |name|string|名字|
  |image|string|场景图 URL|
  |width|int|场景图宽度（像素）|
  |height|int|场景图高度（像素）|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|场景图不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec modify(Caller.t, uuid, String.t, String.t, non_neg_integer, non_neg_integer) :: :ok | {:error, code, reason}
  def modify(caller, sid, name, image, width, height) do
    remote_call(:modify, [caller, sid, name, image, width, height])
  end

  @doc """
  删除场景图

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |sid|uuid|场景图 ID|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|场景图不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec delete(Caller.t, uuid) :: :ok | {:error, code, reason}
  def delete(caller, sid) do
    remote_call(:delete, [caller, sid])
  end

  @doc """
  场景图列表

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |offset|int|偏移量|
  |limit|int|显示数量|

  ## 结果

  ### 成功

  ```elixir
  {:ok, [Entity.t]}
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec list(Caller.t, non_neg_integer, non_neg_integer) :: {:ok, [Entity.t]} | {:error, code, reason}
  def list(caller, offset, limit) do
    remote_call(:list, [caller, offset, limit])
  end

  @doc """
  获取场景图

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |sid|uuid|场景图 ID|

  ## 结果

  ### 成功

  ```elixir
  {:ok, Entity.t}
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|场景图不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec get(Caller.t, uuid) :: {:ok, Entity.t} | {:error, code, reason}
  def get(caller, sid) do
    remote_call(:get, [caller, sid])
  end

  @doc """
  添加设备到场景图

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |sid|uuid|场景图 ID|
  |did|uuid|设备 ID|
  |x|int|设备在场景图中的 x 坐标|
  |y|int|设备在场景图中的 y 坐标|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|场景图不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec add_device(Caller.t, uuid, uuid, non_neg_integer, non_neg_integer) :: :ok | {:error, code, reason}
  def add_device(caller, sid, did, x, y) do
    remote_call(:add_device, [caller, sid, did, x, y])
  end

  @doc """
  从场景图中修改设备

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |sid|uuid|场景图 ID|
  |did|uuid|设备 ID|
  |x|int|设备在场景图中的 x 坐标|
  |y|int|设备在场景图中的 y 坐标|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|场景图不存在|
  |444|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec modify_device(Caller.t, uuid, uuid, non_neg_integer, non_neg_integer) :: :ok | {:error, code, reason}
  def modify_device(caller, sid, did, x, y) do
    remote_call(:modify_device, [caller, sid, did, x, y])
  end

  @doc """
  从场景图中删除设备

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |sid|uuid|场景图 ID|
  |did|uuid|设备 ID|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|场景图不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec remove_device(Caller.t, uuid, uuid) :: :ok | {:error, code, reason}
  def remove_device(caller, sid, did) do
    remote_call(:remove_device, [caller, sid, did])
  end

  @spec remote_call(atom, [integer | String.t]) :: :ok | {:ok, Entity.t} | {:ok, [Entity.t]} | {:error, code, reason}
  defp remote_call(cmd, args) when is_atom(cmd) and is_list(args) do
    :resource_discovery.rpc_call(:scene_service, Scene.Service, cmd, args)
  end

end
