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
	{ 0x465cab34, __VMLINUX_SYMBOL_STR(secure_ipv6_port_ephemeral) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0x4740fe2a, __VMLINUX_SYMBOL_STR(nf_ct_kill_acct) },
	{ 0x55f6dde4, __VMLINUX_SYMBOL_STR(dst_release) },
	{ 0xf7802486, __VMLINUX_SYMBOL_STR(__aeabi_uidivmod) },
	{ 0xdd72dd15, __VMLINUX_SYMBOL_STR(nf_nat_used_tuple) },
	{ 0xb1ad28e0, __VMLINUX_SYMBOL_STR(__gnu_mcount_nc) },
	{ 0x141337e, __VMLINUX_SYMBOL_STR(nf_nat_l4proto_register) },
	{ 0xedd80950, __VMLINUX_SYMBOL_STR(inet_proto_csum_replace4) },
	{ 0x316becd3, __VMLINUX_SYMBOL_STR(inet_proto_csum_replace16) },
	{ 0xf1db1704, __VMLINUX_SYMBOL_STR(nla_memcpy) },
	{ 0xfd934f04, __VMLINUX_SYMBOL_STR(skb_checksum) },
	{ 0x71c90087, __VMLINUX_SYMBOL_STR(memcmp) },
	{ 0xd9bae4b, __VMLINUX_SYMBOL_STR(nf_nat_l4proto_nlattr_to_range) },
	{ 0x16305289, __VMLINUX_SYMBOL_STR(warn_slowpath_null) },
	{ 0x9c5867ac, __VMLINUX_SYMBOL_STR(nf_nat_l4proto_unregister) },
	{ 0x14b4110, __VMLINUX_SYMBOL_STR(nf_xfrm_me_harder) },
	{ 0x820db2a5, __VMLINUX_SYMBOL_STR(ipv6_skip_exthdr) },
	{ 0xfec84e35, __VMLINUX_SYMBOL_STR(nf_nat_packet) },
	{ 0x220b2604, __VMLINUX_SYMBOL_STR(ip6_route_me_harder) },
	{ 0x44da5d0f, __VMLINUX_SYMBOL_STR(__csum_ipv6_magic) },
	{ 0xfddb030f, __VMLINUX_SYMBOL_STR(skb_make_writable) },
	{ 0x6f3a77c, __VMLINUX_SYMBOL_STR(nf_nat_l3proto_unregister) },
	{ 0x14a62ec8, __VMLINUX_SYMBOL_STR(nf_nat_l3proto_register) },
	{ 0x1f9ccbda, __VMLINUX_SYMBOL_STR(__nf_nat_l4proto_find) },
	{ 0xdc6b0ab, __VMLINUX_SYMBOL_STR(nf_nat_alloc_null_binding) },
	{ 0xf4a88c6b, __VMLINUX_SYMBOL_STR(nf_ip6_checksum) },
	{ 0x90ff6c9f, __VMLINUX_SYMBOL_STR(nf_ct_invert_tuplepr) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=nf_conntrack,nf_nat,ipv6";


MODULE_INFO(srcversion, "F7F1EA1021969AD6CA2C8F5");
