Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CD606A328
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A/snwZxB;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=noSGEbs+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9P+E53yKlDmqXM3P0gvNQJjIJEomFqG3poCHUiZ6Bi0=; b=A/snwZxBdfdkoV+5xtsw7JhLdp
	lWWzxS3bUy3HqV7eaWkj9n+X6x+qg6jzVBCZ2vTqhBVjq2pEGgsquR7DfaO58jcZdpwNuv2e1NH+q
	T3Y7/kdoCGej9o9Rj8D2MXtRsTVqQ4Qn6SxND561c8q4nPJauK8xckXExhHzTVKtpntAVeV0zR0Ip
	/2L0JBUibPjLZu/3rGSvERscsccYfKH9/ipSndBLgie19scq5i14ez2U+AR8ua4UfplojeCjoanys
	3OeqNHx5rPldyL2b7YKM+NPY6BMLIHCcPvNxO9STnT9ONrE3xaAsQi1wqSB9bbuR0Zhg0vu8uSRel
	NP0h9IDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKW0-00000003ZHA-3UIl;
	Tue, 03 Nov 2026 19:49:52 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKVy-00000003ZFz-0jgi
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 19:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793735390; x=1825271390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rCERoXWCfBu35r5RRg7xmnqKjETJErwBKzmm+LfUQgQ=;
  b=noSGEbs+Y+I+KUYJjrZnUQB0rMZJdWMQzWdcF2hT3ECZuSjF01EVQkuL
   3oVSBDxwhNp35rCTvmBEFxvaZRk9cXAtgMBiiaZT6dNLePes6dhS91kAg
   l6OE43BEZqeGrvsm8mvAdRdrChaJQffiq9n06o8mU9gOxndivYNKOmKAH
   qKcIls/bxsrLzbD0Rc5X/seHNSDt/BL0AAa8571hc0KFm+Q60E7ZgWn3u
   CHWN+zad/XtJZX6YsYwKhjhiJWZWjRrBV++O8oRAIYABYRVZPqdVL3Gya
   WVGaDS9DvaJuEkaLrUyGRv4JgOfVAWWsHwKH5Bc2MiUG8p+jBXJTFNnZf
   g==;
X-CSE-ConnectionGUID: 7cDVa1oqRTS4dz4DgAGUlg==
X-CSE-MsgGUID: 0Wl0v496Tmatwnbh0aGQng==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2568224"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2568224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:49:49 -0800
X-CSE-ConnectionGUID: +nzjp0bdSYCWNsVVsQUiqQ==
X-CSE-MsgGUID: M2Twv/xtSl6go+XODMWfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6364910"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2026 11:49:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOKVt-00000000jFH-18IU;
	Tue, 03 Nov 2026 19:49:45 +0000
Date: Wed, 4 Nov 2026 03:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	jjohnson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface
 Laptop 8th Edition
Message-ID: <202611040318.qlss0Yol-lkp@intel.com>
References: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_114950_250141_4A9BB5E6 
X-CRM114-Status: GOOD (  11.19  )
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gopikrishna,

kernel test robot noticed the following build errors:

[auto build test ERROR on ath/ath-next]
[also build test ERROR on wireless-next/main linus/master next-20261030]
[cannot apply to wireless/main v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gopikrishna-Garmidi/wifi-ath12k-skip-hardware-rfkill-setup-on-Surface-Laptop-8th-Edition/20261103-014024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20261103094024.1764151-1-gopikrishna.garmidi%40oss.qualcomm.com
patch subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040318.qlss0Yol-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/core.c:91:9: error: expected '}' before '{' token
      91 |         { /* Sentinel */ }
         |         ^
   drivers/net/wireless/ath/ath12k/core.c:86:39: note: to match this '{'
      86 | } ath12k_core_broken_rfkill_table[] = {
         |                                       ^


vim +91 drivers/net/wireless/ath/ath12k/core.c

defae535dd63b1 Aaradhana Sahu      2025-07-08  76  
5949d1910f13c2 François Roux       2026-10-06  77  /*
5949d1910f13c2 François Roux       2026-10-06  78   * On these machines the OS cannot control the WCN7850 hardware rfkill
5949d1910f13c2 François Roux       2026-10-06  79   * input, which reads as "radio off", so hardware rfkill must stay
5949d1910f13c2 François Roux       2026-10-06  80   * disabled. Ideally this would come from the connector node of the board
5949d1910f13c2 François Roux       2026-10-06  81   * DT, but that binding does not exist yet.
5949d1910f13c2 François Roux       2026-10-06  82   */
5949d1910f13c2 François Roux       2026-10-06  83  static const struct ath12k_core_broken_rfkill_table {
5949d1910f13c2 François Roux       2026-10-06  84  	enum ath12k_hw_rev hw_rev;
5949d1910f13c2 François Roux       2026-10-06  85  	const char *compatible;
5949d1910f13c2 François Roux       2026-10-06  86  } ath12k_core_broken_rfkill_table[] = {
5949d1910f13c2 François Roux       2026-10-06  87  	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
5949d1910f13c2 François Roux       2026-10-06  88  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
5949d1910f13c2 François Roux       2026-10-06  89  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
2d169d089ae8e1 Gopikrishna Garmidi 2026-11-03  90  	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" }
5949d1910f13c2 François Roux       2026-10-06 @91  	{ /* Sentinel */ }
5949d1910f13c2 François Roux       2026-10-06  92  };
5949d1910f13c2 François Roux       2026-10-06  93  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

