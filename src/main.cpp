#include "hooks.h"

SKSEPluginLoad(const SKSE::LoadInterface* a_skse)
{
	SKSE::Init(a_skse);
    Hooks::Install();	

	return true;
}
