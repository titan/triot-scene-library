defmodule Scene.Entity do
  @moduledoc """
  场景图实体对象

  |字段|类型|说明|
  |---|---|---|
  |sid|uuid|场景 ID|
  |name|string|场景名称|
  |image|string|场景图 URL|
  |width|boolean|场景图宽度(像素)|
  |height|string|场景图高度(像素)|
  |devices|[%{atom => string|int}]|设备列表|
  """
  defstruct sid: nil, name: nil, image: nil, width: 0, height: 0, devices: []
  @type t :: %Scene.Entity{ sid: String.t, name: String.t, image: String.t, width: non_neg_integer, height: non_neg_integer, devices: [%{atom => String.t | non_neg_integer}] }
end
