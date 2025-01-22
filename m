Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0C0C02182
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 01:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoVw3qXeyMxSN4s8IUuHHuTq6sJPSHrTeNIp1E50hYc=; b=zJjxkPh6g5iAoFylHj73GkyleQ
	z9MlIyCFfwAhZS7knOefvxfeK9SkAtLjUrmU2lVaLTWVpIuT6bii6JltkiEf/gKEoo29ajPZJcJTi
	qLu5tvO71recXMem8+8F1AN2Tw/0Db/TyTE6jF5Ro+rIFSgXE4V4OISp3QP6QGDtI/y6EuaIlJCdz
	Z3HaS2FaWyaAaL5+/moFgTprQ1ml1eaWtbrYELdofGn+FzzRbI6K1j7AWhz+T7S3NL9dm47SwjBJN
	syaDvJrLCArbKvg06s/wXGZQzO9uBaI7eR9zknrhXoJEoehjfdd3Xutt+RDczASdclLhG6v98xyzD
	FbY2BZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taPj2-00000009BNs-46GG
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 01:40:12 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taPiz-00000009BN9-3xjn
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 01:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737510010; x=1769046010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8svDz7HtPQcW44cGU47R6oNOze1fOKboudbN+MY4wY=;
  b=BzUAg47AUoSSacEv4GFs/89Xl7h1Hy9RVHINAjnpAPZK4nUxYBuAX7/0
   vdnIj0VgALWMvtYHORRdTjgqznyfUA4WHntVWw4CXbgO+SAZZ2HGSRT/7
   3Xgg9ZtBIhlxS4ioi1iwA6xSRvXURc+vWVXMqkyExEsANqmQoz3EhteyB
   NXwSd/7wYqsb/l1SF2RtThh3/DvIMzx5Pln0xMz1vLtTVGGhfy3RostFk
   rw3MBQupIm6wxFv50y/1FoPSiA+8W12kvTBXK8MY7NVyuqtsFcS2KCaUx
   GXL5JB3vayqNBN8MaLUEsdFDri6PKG0f6yA5XZzRkzI08e5qPeW74tmJZ
   Q==;
X-CSE-ConnectionGUID: V+W7DOYWRDixD809ydcDoA==
X-CSE-MsgGUID: J5aGDjQ8Tkiss58/B6ZcVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49366759"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49366759"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:40:04 -0800
X-CSE-ConnectionGUID: wuHn2nd+Rk+Hj1FK4AmuRw==
X-CSE-MsgGUID: PWNJUa90RTefNNVdM3knSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="106900654"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2025 17:40:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taPip-000ZGJ-2h;
	Wed, 22 Jan 2025 01:39:59 +0000
Date: Wed, 22 Jan 2025 09:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
	ath12k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Rajat Soni <rajat.soni@oss.qualcomm.com>,
	Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Subject: Re: [PATCH v3] wifi: ath12k: Add WMI control path stats infra
Message-ID: <202501220916.o70hNSkA-lkp@intel.com>
References: <20250120184447.658660-1-ramya.gnanasekar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120184447.658660-1-ramya.gnanasekar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_174010_036966_0D12DBEB 
X-CRM114-Status: GOOD (  16.03  )
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

Hi Ramya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7bef42fc98f2d8f67546d1ea1a3f2c2932fd72b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramya-Gnanasekar/wifi-ath12k-Add-WMI-control-path-stats-infra/20250121-024618
base:   d7bef42fc98f2d8f67546d1ea1a3f2c2932fd72b
patch link:    https://lore.kernel.org/r/20250120184447.658660-1-ramya.gnanasekar%40oss.qualcomm.com
patch subject: [PATCH v3] wifi: ath12k: Add WMI control path stats infra
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250122/202501220916.o70hNSkA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220916.o70hNSkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220916.o70hNSkA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/wmi.c:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ath/ath12k/wmi.c:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ath/ath12k/wmi.c:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath12k/wmi.c:7504:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    7504 |         case WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/wmi.c:7518:9: note: uninitialized use occurs here
    7518 |         return ret;
         |                ^~~
   drivers/net/wireless/ath/ath12k/wmi.c:7501:9: note: initialize the variable 'ret' to silence this warning
    7501 |         int ret;
         |                ^
         |                 = 0
>> drivers/net/wireless/ath/ath12k/wmi.c:7597:7: warning: variable 'ar' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    7597 |                 if (!param.ar)
         |                     ^~~~~~~~~
   drivers/net/wireless/ath/ath12k/wmi.c:7638:16: note: uninitialized use occurs here
    7638 |         spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
         |                       ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7597:3: note: remove the 'if' if its condition is always true
    7597 |                 if (!param.ar)
         |                 ^~~~~~~~~~~~~~
    7598 |                         return;
   drivers/net/wireless/ath/ath12k/wmi.c:7562:19: note: initialize the variable 'ar' to silence this warning
    7562 |         struct ath12k *ar;
         |                          ^
         |                           = NULL
   14 warnings generated.


vim +/ret +7504 drivers/net/wireless/ath/ath12k/wmi.c

  7496	
  7497	static int ath12k_wmi_ctrl_stats_subtlv_parser(struct ath12k_base *ab,
  7498						       u16 tag, u16 len,
  7499						       const void *ptr, void *data)
  7500	{
  7501		int ret;
  7502	
  7503		switch (tag) {
> 7504		case WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM:
  7505			break;
  7506		case WMI_TAG_CTRL_PATH_PDEV_STATS:
  7507			ret = wmi_pull_ctrl_path_pdev_tx_stats_tlv(ab, len, ptr, data);
  7508			break;
  7509			/* Add case for newly wmi ctrl path added stats here */
  7510		default:
  7511			ath12k_warn(ab,
  7512				    "Received invalid tag for wmi ctrl path stats in subtlvs, tag : 0x%x\n",
  7513				    tag);
  7514			ret = -EINVAL;
  7515			break;
  7516		}
  7517	
  7518		return ret;
  7519	}
  7520	
  7521	static int ath12k_wmi_ctrl_stats_event_parser(struct ath12k_base *ab,
  7522						      u16 tag, u16 len,
  7523						      const void *ptr, void *data)
  7524	{
  7525		int ret;
  7526	
  7527		ath12k_dbg(ab, ATH12K_DBG_WMI, "wmi ctrl path stats tag 0x%x of len %d rcvd\n",
  7528			   tag, len);
  7529	
  7530		switch (tag) {
  7531		case WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM:
  7532			/* Fixed param is already processed*/
  7533			ret = 0;
  7534			break;
  7535		case WMI_TAG_ARRAY_STRUCT:
  7536			/* len 0 is expected for array of struct when there
  7537			 * is no content of that type to pack inside that tlv
  7538			 */
  7539			if (len == 0)
  7540				return 0;
  7541	
  7542			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
  7543						  ath12k_wmi_ctrl_stats_subtlv_parser,
  7544						  data);
  7545			break;
  7546		default:
  7547			ath12k_warn(ab, "Received invalid tag for wmi ctrl path stats\n");
  7548			ret = -EINVAL;
  7549			break;
  7550		}
  7551	
  7552		return ret;
  7553	}
  7554	
  7555	static void ath12k_wmi_ctrl_path_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
  7556	{
  7557		struct wmi_ctrl_path_stats_event *fixed_param;
  7558		struct ath12k_wmi_ctrl_path_stats_list param = {0};
  7559		struct ath12k_wmi_ctrl_path_stats_list *stats;
  7560		const struct wmi_tlv *tlv;
  7561		struct list_head *src, *dst;
  7562		struct ath12k *ar;
  7563		void *ptr = skb->data;
  7564		u16 tlv_tag, tag_id;
  7565		u32 more;
  7566		int ret;
  7567	
  7568		if (!skb->data) {
  7569			ath12k_warn(ab, "No data present in wmi ctrl stats event\n");
  7570			return;
  7571		}
  7572	
  7573		if (skb->len < (sizeof(*fixed_param) + TLV_HDR_SIZE)) {
  7574			ath12k_warn(ab, "wmi ctrl stats event size invalid\n");
  7575			return;
  7576		}
  7577	
  7578		param.ar = NULL;
  7579	
  7580		tlv = ptr;
  7581		tlv_tag = le32_get_bits(tlv->header, WMI_TLV_TAG);
  7582		ptr += sizeof(*tlv);
  7583	
  7584		if (tlv_tag != WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM) {
  7585			ath12k_warn(ab, "wmi ctrl stats without fixed param tlv at start\n");
  7586			return;
  7587		}
  7588	
  7589		INIT_LIST_HEAD(&param.pdev_stats);
  7590	
  7591		fixed_param = ptr;
  7592		ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
  7593					  ath12k_wmi_ctrl_stats_event_parser,
  7594					  &param);
  7595		if (ret) {
  7596			ath12k_warn(ab, "failed to parse wmi_ctrl_path_stats tlv: %d\n", ret);
> 7597			if (!param.ar)
  7598				return;
  7599			goto free;
  7600		}
  7601	
  7602		ar = param.ar;
  7603		if (!ar)
  7604			return;
  7605	
  7606		tag_id = ar->debug.wmi_ctrl_path_stats_tagid;
  7607		stats = &ar->debug.wmi_ctrl_path_stats;
  7608		more = __le32_to_cpu(fixed_param->more);
  7609	
  7610		switch (tag_id) {
  7611		case WMI_TAG_CTRL_PATH_PDEV_STATS:
  7612			src = &param.pdev_stats;
  7613			dst = &stats->pdev_stats;
  7614			break;
  7615		default:
  7616			goto free;
  7617		}
  7618	
  7619		spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
  7620		if (!more) {
  7621			if (!ar->debug.wmi_ctrl_path_stats_more_enabled)
  7622				ath12k_wmi_ctrl_path_stats_list_free(stats);
  7623			else
  7624				ar->debug.wmi_ctrl_path_stats_more_enabled = false;
  7625	
  7626			list_splice_tail_init(src, dst);
  7627			complete(&ar->debug.wmi_ctrl_path_stats_rcvd);
  7628		} else {
  7629			if (!ar->debug.wmi_ctrl_path_stats_more_enabled) {
  7630				ath12k_wmi_ctrl_path_stats_list_free(stats);
  7631				ar->debug.wmi_ctrl_path_stats_more_enabled = true;
  7632			}
  7633			list_splice_tail_init(src, dst);
  7634		}
  7635		spin_unlock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
  7636		return;
  7637	free:
  7638		spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
  7639		ath12k_wmi_ctrl_path_stats_list_free(&param);
  7640		spin_unlock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
  7641	}
  7642	#else
  7643	static void ath12k_wmi_ctrl_path_stats_event(struct ath12k_base *ab,
  7644						     struct sk_buff *skb)
  7645	{
  7646	}
  7647	#endif /* CONFIG_ATH12K_DEBUGFS */
  7648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

