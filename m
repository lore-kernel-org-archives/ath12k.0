Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7221AD41C39
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BUguiEsKty8NBQsPtLNM86+s+RXB5XfSigpFw67qGIo=; b=KW4L5VmRPJp0z5RB5Kr9oBMgdD
	FMgP3LmuN9GcuBLnH7j9+6KN6GyVio3nfiM+j9JY3bDVTNH9b0Q/dtwIVQAAlIOF7pOXNrCyq/9lr
	xoDz8W99zirut2K3Rxq3QrQsPt+b7Awpnq7X2Ye/7zdvuiRD1AQ+O8vyVxU08IuBieafUaNtOHl2d
	G75wJZ7kzy3VNfgIYKh6U+6cdi2OzIs16LRBioYEEbPgbuvLoPGB05fo5twsyx5zmNPRA98JVSZlz
	gvN98ipbupwgvh8wZu63Q7VnHixWeKm28Kwr2JWRjoGG4RDxrsDYvyBrIcX1+LPuojGRNeHz9M4Xf
	RlY32T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBM0-00000006Z6K-0Ut6
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 11:16:08 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLv-00000006Z47-3Fe0
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 11:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731496564; x=1763032564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=diY/pa70AYlls1nZc/Hg0UwfYbn36JZv1N1XdbXU3Dw=;
  b=XEtrIthlT92KnMSxaL6WBao5vgXVLzwOTdkhXAJdHPvTRUufBt46/HeZ
   vqHp0llN/gaLPBcjkLLEUZwE2alOy8M0KDS+yOPj0XHoZCj34fdEKS2CQ
   kA2kuujShDJUh5r4+k04px50YUClKdaXnDqn4wXBx4Wyg9JFgqS+tNwIa
   30nF5q+g4HTWNK+OmBQtBs/h5ZNAD5dTNPnhXuqmtVg+kEEf4Ja7VEYca
   PzXqvwtf1Y2CGujQCw3wMYEr5fNMyElgnAVNIQlL0OlKdldpuZtpf4Fot
   Y5dGK0ti5gLKwEfAZ56m0AFtJ1Nr7Fs1CpU1vkMTJcz7GP4poR6oa2Nyk
   Q==;
X-CSE-ConnectionGUID: +zRSw9DWSBakygISTO5Euw==
X-CSE-MsgGUID: ev96kZIlR2mUkkOAcyNDkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41944526"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41944526"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:16:03 -0800
X-CSE-ConnectionGUID: 9CYl8/6eRvyC2ClO+gtfOw==
X-CSE-MsgGUID: Ni6+Qz2zQ3WMHNA7Hswx/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92774446"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2024 03:16:01 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBBLq-0000I7-06;
	Wed, 13 Nov 2024 11:15:58 +0000
Date: Wed, 13 Nov 2024 19:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [ath:master 2/4] drivers/net/ethernet/intel/ice/ice_ptp.c:165:8:
 error: call to undeclared function 'ice_read_sma_ctrl'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202411131901.ZSs0uLgF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031603_985592_EDC2F650 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   fc6f018eda7f9054e427f731db1e8b200f22873c
commit: 33e2bcda33620fc43cc948627be525ddb342c446 [2/4] Merge branch 'ath-current'
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241113/202411131901.ZSs0uLgF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131901.ZSs0uLgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131901.ZSs0uLgF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_ptp.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/ethernet/intel/ice/ice_ptp.c:165:8: error: call to undeclared function 'ice_read_sma_ctrl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     165 |         err = ice_read_sma_ctrl(&pf->hw, &data);
         |               ^
   drivers/net/ethernet/intel/ice/ice_ptp.c:165:8: note: did you mean 'ice_read_sr_word'?
   drivers/net/ethernet/intel/ice/ice_nvm.h:32:5: note: 'ice_read_sr_word' declared here
      32 | int ice_read_sr_word(struct ice_hw *hw, u16 offset, u16 *data);
         |     ^
>> drivers/net/ethernet/intel/ice/ice_ptp.c:187:9: error: call to undeclared function 'ice_write_sma_ctrl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     187 |         return ice_write_sma_ctrl(&pf->hw, data);
         |                ^
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2556:8: error: call to undeclared function 'ice_ptp_read_sdp_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2556 |         err = ice_ptp_read_sdp_ac(&pf->hw, entries, &num_entries);
         |               ^
   16 warnings and 3 errors generated.
--
   In file included from drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/intel/ice/ice_ptp_hw.c:6:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5250:5: warning: no previous prototype for function 'ice_read_sma_ctrl' [-Wmissing-prototypes]
    5250 | int ice_read_sma_ctrl(struct ice_hw *hw, u8 *data)
         |     ^
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5250 | int ice_read_sma_ctrl(struct ice_hw *hw, u8 *data)
         | ^
         | static 
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5283:5: warning: no previous prototype for function 'ice_write_sma_ctrl' [-Wmissing-prototypes]
    5283 | int ice_write_sma_ctrl(struct ice_hw *hw, u8 data)
         |     ^
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5283 | int ice_write_sma_ctrl(struct ice_hw *hw, u8 data)
         | ^
         | static 
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5314:5: warning: no previous prototype for function 'ice_read_pca9575_reg' [-Wmissing-prototypes]
    5314 | int ice_read_pca9575_reg(struct ice_hw *hw, u8 offset, u8 *data)
         |     ^
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5314:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5314 | int ice_read_pca9575_reg(struct ice_hw *hw, u8 offset, u8 *data)
         | ^
         | static 
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5346:5: warning: no previous prototype for function 'ice_ptp_read_sdp_ac' [-Wmissing-prototypes]
    5346 | int ice_ptp_read_sdp_ac(struct ice_hw *hw, __le16 *entries, uint *num_entries)
         |     ^
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5346:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5346 | int ice_ptp_read_sdp_ac(struct ice_hw *hw, __le16 *entries, uint *num_entries)
         | ^
         | static 
   20 warnings generated.
--
   In file included from drivers/net/ethernet/intel/ice/ice_gnss.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/ice/ice_gnss.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_gnss.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_gnss.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/ethernet/intel/ice/ice_gnss.c:400:9: error: call to undeclared function 'ice_read_pca9575_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     400 |                 err = ice_read_pca9575_reg(hw, ICE_PCA9575_P0_IN, &data);
         |                       ^
   drivers/net/ethernet/intel/ice/ice_gnss.c:400:9: note: did you mean 'ice_read_pca9575_reg_e810t'?
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:407:5: note: 'ice_read_pca9575_reg_e810t' declared here
     407 | int ice_read_pca9575_reg_e810t(struct ice_hw *hw, u8 offset, u8 *data);
         |     ^
   16 warnings and 1 error generated.


vim +/ice_read_sma_ctrl +165 drivers/net/ethernet/intel/ice/ice_ptp.c

325b2064d00a88 Maciej Machnikowski 2021-08-17  149  
325b2064d00a88 Maciej Machnikowski 2021-08-17  150  /**
e4291b64e11889 Karol Kolacinski    2024-08-30  151   * ice_ptp_set_sma_cfg - set the configuration of the SMA control logic
e4291b64e11889 Karol Kolacinski    2024-08-30  152   * @pf: Board private structure
325b2064d00a88 Maciej Machnikowski 2021-08-17  153   *
e4291b64e11889 Karol Kolacinski    2024-08-30  154   * Return: 0 on success, negative error code otherwise
325b2064d00a88 Maciej Machnikowski 2021-08-17  155   */
e4291b64e11889 Karol Kolacinski    2024-08-30  156  static int ice_ptp_set_sma_cfg(struct ice_pf *pf)
325b2064d00a88 Maciej Machnikowski 2021-08-17  157  {
e4291b64e11889 Karol Kolacinski    2024-08-30  158  	const struct ice_ptp_pin_desc *ice_pins = pf->ptp.ice_pin_desc;
e4291b64e11889 Karol Kolacinski    2024-08-30  159  	struct ptp_pin_desc *pins = pf->ptp.pin_desc;
e4291b64e11889 Karol Kolacinski    2024-08-30  160  	unsigned int sma_pins[ICE_SMA_PINS_NUM] = {};
e4291b64e11889 Karol Kolacinski    2024-08-30  161  	int err;
325b2064d00a88 Maciej Machnikowski 2021-08-17  162  	u8 data;
325b2064d00a88 Maciej Machnikowski 2021-08-17  163  
325b2064d00a88 Maciej Machnikowski 2021-08-17  164  	/* Read initial pin state value */
e4291b64e11889 Karol Kolacinski    2024-08-30 @165  	err = ice_read_sma_ctrl(&pf->hw, &data);
325b2064d00a88 Maciej Machnikowski 2021-08-17  166  	if (err)
325b2064d00a88 Maciej Machnikowski 2021-08-17  167  		return err;
325b2064d00a88 Maciej Machnikowski 2021-08-17  168  
e4291b64e11889 Karol Kolacinski    2024-08-30  169  	/* Get SMA/U.FL pins states */
e4291b64e11889 Karol Kolacinski    2024-08-30  170  	for (int i = 0; i < pf->ptp.info.n_pins; i++)
e4291b64e11889 Karol Kolacinski    2024-08-30  171  		if (pins[i].func) {
e4291b64e11889 Karol Kolacinski    2024-08-30  172  			int name_idx = ice_pins[i].name_idx;
e4291b64e11889 Karol Kolacinski    2024-08-30  173  
e4291b64e11889 Karol Kolacinski    2024-08-30  174  			switch (name_idx) {
e4291b64e11889 Karol Kolacinski    2024-08-30  175  			case SMA1:
e4291b64e11889 Karol Kolacinski    2024-08-30  176  			case UFL1:
e4291b64e11889 Karol Kolacinski    2024-08-30  177  			case SMA2:
e4291b64e11889 Karol Kolacinski    2024-08-30  178  			case UFL2:
e4291b64e11889 Karol Kolacinski    2024-08-30  179  				sma_pins[name_idx - 1] = pins[i].func;
325b2064d00a88 Maciej Machnikowski 2021-08-17  180  				break;
e4291b64e11889 Karol Kolacinski    2024-08-30  181  			default:
e4291b64e11889 Karol Kolacinski    2024-08-30  182  				continue;
e4291b64e11889 Karol Kolacinski    2024-08-30  183  			}
325b2064d00a88 Maciej Machnikowski 2021-08-17  184  		}
325b2064d00a88 Maciej Machnikowski 2021-08-17  185  
e4291b64e11889 Karol Kolacinski    2024-08-30  186  	ice_ptp_update_sma_data(pf, sma_pins, &data);
e4291b64e11889 Karol Kolacinski    2024-08-30 @187  	return ice_write_sma_ctrl(&pf->hw, data);
325b2064d00a88 Maciej Machnikowski 2021-08-17  188  }
325b2064d00a88 Maciej Machnikowski 2021-08-17  189  

:::::: The code at line 165 was first introduced by commit
:::::: e4291b64e11889c73fa9c75e74115721758a3fb4 ice: Align E810T GPIO to other products

:::::: TO: Karol Kolacinski <karol.kolacinski@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

