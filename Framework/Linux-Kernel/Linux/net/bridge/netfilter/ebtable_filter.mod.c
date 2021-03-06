#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

#ifdef RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x13e75575, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0x8302795c, __VMLINUX_SYMBOL_STR(unregister_pernet_subsys) },
	{ 0xbe118033, __VMLINUX_SYMBOL_STR(register_pernet_subsys) },
	{ 0xf2802a02, __VMLINUX_SYMBOL_STR(ebt_register_table) },
	{ 0x8540ce3, __VMLINUX_SYMBOL_STR(ebt_do_table) },
	{ 0x36f882be, __VMLINUX_SYMBOL_STR(ebt_unregister_table) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0xb1ad28e0, __VMLINUX_SYMBOL_STR(__gnu_mcount_nc) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=ebtables";


MODULE_INFO(srcversion, "EFAC5B91225FC4E39E30A82");
