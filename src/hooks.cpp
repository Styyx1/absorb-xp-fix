#include "hooks.h"



namespace Hooks 
{
	void Install() {
		AbsorbSpells::Install();
	}
	void AbsorbSpells::Install()
	{
		func = REL::Relocation<uintptr_t>{ RE::AbsorbEffect::VTABLE[0] }.write_vfunc(21, AbsorbSpellUpdate);
		logs::info("Hook Installed <{}>", typeid(AbsorbSpells).name());
	}
	void AbsorbSpells::AbsorbSpellUpdate(RE::AbsorbEffect* a_this, float a_delta)
	{		
		if (a_this->spell->GetCastingType() == RE::MagicSystem::CastingType::kConcentration) {
			if (a_this->spell->GetCostliestEffectItem()->baseEffect->HasArchetype(RE::EffectSetting::Archetype::kAbsorb)) {
				// Credits: https://github.com/shad0wshayd3-TES5/BakaBloodMagic/blob/4fbfc17ed2c5309af3d22abd48d3c2f10056e9e4/src/BloodMagic/ActorMagicCaster.h#L507
				RE::MagicItem::SkillUsageData SkillUsageData{};
				if (a_this->spell->GetSkillUsageData(SkillUsageData)) {
					if (!SkillUsageData.custom)
					{
						a_this->caster.get()->UseSkill(
							SkillUsageData.skill,
							std::clamp(std::clamp(std::pow(SkillUsageData.magnitude, 2), 0.0, 100.0) * a_delta, 0.0, 10.0),
							nullptr);
					}
				}				
			}
		}
		func(a_this, a_delta);
	}
}

