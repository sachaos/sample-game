class LuaBase
  attr_reader :state, :global_variables

  delegate :eval, to: :state

  def initialize
    raise NotImplementedError if self.class == LuaBase

    @state = Rufus::Lua::State.new
    @lua_script = File.read("lib/#{self.class.name.underscore}.lua")
    @state.eval(@lua_script)
    @global_variables = @state.eval("return _G").to_ruby.symbolize_keys
  end

  def method_missing(method_name, *args)
    rufus_object = @global_variables[method_name]
    if rufus_object.is_a?(Rufus::Lua::Function)
      return rufus_object.call(*args)
    end
    super
  end
end
