#pragma once

namespace Hooks
{
	void Install();

	class AbsorbSpells {
	public: 
		static void Install();
	private:
		static void AbsorbSpellUpdate(RE::AbsorbEffect* a_this, float a_delta);
		static inline REL::Relocation<decltype(&AbsorbSpellUpdate)> func;
	};
}
