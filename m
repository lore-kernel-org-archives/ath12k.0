Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B0CF34BE
	for <ath12k@archiver.kernel.org>; Thu,  3 Oct 2024 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EW4WtxaWSttumFYKiQecXmgzmIMf1MRnGGLxJbzspgE=; b=TLAYo9IkcrILfJfbbIz0UC/wa8
	Vvb3yAzB2FKYcmZbCtu6N7XasIdwRMJb4Y9JGKNQlZmJ95xDpqtRERn+soEThHewSPdgJ3kmUc4/r
	Hw7ipe5dtwQa0CeIMO0SJFttXXelR6xi5OouRmQizKLCnMFq4htpx1Zp3QPwm/Su3YqjXUBqlJ7IF
	SVqSM1B9izR9xKmj59jHhxPfru5TXrVa5pkUxBL9D69XYHV7o2XR6FhB7b7KBI4DThv2MAzDO+kAh
	emWck4mUdNfLo1kL8/bGDeQjjnSVjbJpinTfXOnM6rp5O0rlnPvn7R1H3se5wnAHIrvNkCDKDQvFB
	m7nMz14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swQjy-0000000A6E9-2ov4
	for ath12k@archiver.kernel.org;
	Thu, 03 Oct 2024 18:39:54 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swQj4-0000000A67o-0mxo
	for ath12k@lists.infradead.org;
	Thu, 03 Oct 2024 18:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727980738; x=1759516738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXZlm7Iex7FcxNs5TcQY2ZFjLwy8SauxSHbdkQuxXvM=;
  b=RetbE2b13Qv/YEmljsU47DgPF6ICxwvxLICUK7VOpq4D/JQYsvpERcTz
   EjYTqV6d2qesDziJgLzz17MOa8LOeZKrZvdobMqO/VospoA4iUgmncDoB
   k62LAmhfi+PoJmp90+j1TWU/BukxFDzA9DklPStCPeq43ZAbYjcLI8oCK
   6PMcb8WrevASFPKCa1VzQUJxrKXc38amcRhXhaRQQPf0SuzqXG9f8+iat
   LTeCYBc1wKRuFXCJeB0JJu/GRnQ3IvzClVsuwZkPtu9phkb/vE3/Ve0Hh
   bmRf+Ltj8SXGczI8nKK+hGF70a62gGPAm2pzulxgBtQF/e9DqvPx8z/Jz
   Q==;
X-CSE-ConnectionGUID: zaEXooSRSbqNKYE626g1cw==
X-CSE-MsgGUID: NIWkb+CcSDuBx6jEqdzmyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44723900"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="44723900"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 11:38:49 -0700
X-CSE-ConnectionGUID: SnlFKVH6RfyCaqjrmtjuog==
X-CSE-MsgGUID: xut8bDtoSVKMsy4Fuoll2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111909309"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 11:38:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swQiq-0000mg-0F;
	Thu, 03 Oct 2024 18:38:44 +0000
Date: Fri, 4 Oct 2024 02:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rajat Soni <quic_rajson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [ath:pending 8/12]
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left
 shift count >= width of type
Message-ID: <202410040200.Mwb85JzQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_113858_308874_E6EB73AF 
X-CRM114-Status: UNSURE (   9.00  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
head:   08dd5d93509f962500dc983864b4effb2600831a
commit: f6a46bc3719cc6b445cb071a7dd6968891ffb169 [8/12] wifi: ath12k: Support DMAC Reset Stats
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dmac_reset_stats_tlv':
>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]
    2515 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
         |                                                                             ^~
   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2519:81: warning: left shift count >= width of type [-Wshift-count-overflow]
    2519 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
         |                                                                                 ^~
   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2523:78: warning: left shift count >= width of type [-Wshift-count-overflow]
    2523 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
         |                                                                              ^~


vim +2515 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c

  2498	
  2499	static void
  2500	ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
  2501					      struct debug_htt_stats_req *stats_req)
  2502	{
  2503		const struct ath12k_htt_dmac_reset_stats_tlv *htt_stats_buf = tag_buf;
  2504		u8 *buf = stats_req->buf;
  2505		u32 len = stats_req->buf_len;
  2506		u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
  2507		unsigned long time;
  2508	
  2509		if (tag_len < sizeof(*htt_stats_buf))
  2510			return;
  2511	
  2512		len += scnprintf(buf + len, buf_len - len, "HTT_DMAC_RESET_STATS_TLV:\n");
  2513		len += scnprintf(buf + len, buf_len - len, "reset_count = %u\n",
  2514				 le32_to_cpu(htt_stats_buf->reset_count));
> 2515		time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
  2516			le32_to_cpu(htt_stats_buf->reset_time_lo_ms);
  2517		len += scnprintf(buf + len, buf_len - len, "reset_time_ms = %ld\n", time);
  2518	
  2519		time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
  2520			le32_to_cpu(htt_stats_buf->disengage_time_lo_ms);
  2521		len += scnprintf(buf + len, buf_len - len, "disengage_time_ms = %ld\n", time);
  2522	
  2523		time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
  2524			le32_to_cpu(htt_stats_buf->engage_time_lo_ms);
  2525		len += scnprintf(buf + len, buf_len - len, "engage_time_ms = %ld\n", time);
  2526	
  2527		len += scnprintf(buf + len, buf_len - len, "disengage_count = %u\n",
  2528				 le32_to_cpu(htt_stats_buf->disengage_count));
  2529		len += scnprintf(buf + len, buf_len - len, "engage_count = %u\n",
  2530				 le32_to_cpu(htt_stats_buf->engage_count));
  2531		len += scnprintf(buf + len, buf_len - len, "drain_dest_ring_mask = 0x%x\n\n",
  2532				 le32_to_cpu(htt_stats_buf->drain_dest_ring_mask));
  2533	
  2534		stats_req->buf_len = len;
  2535	}
  2536	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

