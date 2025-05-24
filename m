Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B652DC54ED0
	for <ath12k@archiver.kernel.org>; Sat, 24 May 2025 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lmpZGOuofrjFwaXvyYBc0rBkaLKM5wxjGYP3ev1Axw8=; b=C+z3ZrJuPffYrY9Z2/No5m48zf
	+Tf+8z6bxoEZQIiBHdOKOrCMilKPL2m2qWyxfMY6QUFym33PvSV1B9uDeK/AUOcTK4+D+6VtWd0a7
	iPJnZFNN2o7v48qGHNILVJJhUdIXnjQhnAtOeObmmOacqi55kAcFnoSngA1TgaoamuF/Izrx0H0MB
	ILQOndXDtMfOeM1irttFtFDcsJVIxzCOX46FSa1k6DccXXgAyvskXcfBEuwh2uwS0MG+iSjsaTvJ0
	fkG+8hh6HKB0QfMXHIdNKpHWhFwLNnpJzDTn8gFPsvbN7CidNROVP9gQIMDP9u0oitsWqBG1U5vOt
	DN+0Xq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uId9A-000000058xU-1pMD;
	Sat, 24 May 2025 00:53:56 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uId98-000000058we-0iT4
	for ath12k@lists.infradead.org;
	Sat, 24 May 2025 00:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748048034; x=1779584034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1cxJPPIwoEPz4iSQ29vxrG/eK9hQ7u+enIyoPDRX1o=;
  b=lmFfQvsBr+KxNXpLx1YM5H5ayfK+qSb8/7Rve2V/MQmqSsi6nU/qypTZ
   HxNIzAqpECLlhMOu3JTiT9jFVIHL+VmPhm1z161/JmSOXk3akcR8ECXWS
   jsm5GOWflVJ4q3RjqOd49LbmLKEY1awektq3fPDmsSRCrEo0kbL2i2zZa
   yNADU1M4sha3YTubagdH+UtpEgwTUB7mNllohwA5Yqo6m7dVKcLgUGOS6
   2HVlx7KW4DqfoBgWmsXO/NQHq7lOOGuqCVnLriCbSiEGAdSN2dcRlb+z1
   bMh5y3c8w696Kq+jOXbBRRjeIVtjzuJLugXvQTJeKu0c20xeypiz5zcQE
   A==;
X-CSE-ConnectionGUID: eNOwWE9VSPyZUFAFRU832Q==
X-CSE-MsgGUID: jh8U/BeOQR6v7XQnXMXycg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67669955"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="67669955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:53:51 -0700
X-CSE-ConnectionGUID: g3rg5+F7ROG65laEO/jmMA==
X-CSE-MsgGUID: dDhu0YQoTZeSbdrUhxBUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142318426"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 17:53:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uId91-000QqI-0t;
	Sat, 24 May 2025 00:53:47 +0000
Date: Sat, 24 May 2025 08:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Ripan Deuri <quic_rdeuri@quicinc.com>
Subject: [ath:ath12k-ng 74/78]
 drivers/net/wireless/ath/ath12k/dp_htt.c:192:31: warning: variable 'sta' set
 but not used
Message-ID: <202505240842.3pOJN2OV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_175354_258308_2DF94E9A 
X-CRM114-Status: UNSURE (   9.36  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-ng
head:   5bac8411df2e147f11875a88c4d6c36fcedd27df
commit: afe9933912ff5b8120f20d922c62c0b44b8257e9 [74/78] wifi: ath12k: Move link stats from CP Object
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250524/202505240842.3pOJN2OV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240842.3pOJN2OV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240842.3pOJN2OV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/dp_htt.c: In function 'ath12k_update_per_peer_tx_stats':
>> drivers/net/wireless/ath/ath12k/dp_htt.c:192:31: warning: variable 'sta' set but not used [-Wunused-but-set-variable]
     192 |         struct ieee80211_sta *sta;
         |                               ^~~


vim +/sta +192 drivers/net/wireless/ath/ath12k/dp_htt.c

c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  184  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  185  static void
cdc69bd51a4340 Ripan Deuri         2025-05-16  186  ath12k_update_per_peer_tx_stats(struct ath12k_pdev_dp *dp_pdev,
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  187  				struct htt_ppdu_stats *ppdu_stats, u8 user)
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  188  {
e01af4e7193a9d Harsh Kumar Bijlani 2025-05-07  189  	struct ath12k_dp_link_peer *peer;
cdc69bd51a4340 Ripan Deuri         2025-05-16  190  	struct ath12k_dp *dp = dp_pdev->dp;
cdc69bd51a4340 Ripan Deuri         2025-05-16  191  	struct ath12k_base *ab = dp->ab;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16 @192  	struct ieee80211_sta *sta;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  193  	struct htt_ppdu_stats_user_rate *user_rate;
cdc69bd51a4340 Ripan Deuri         2025-05-16  194  	struct ath12k_per_peer_tx_stats *peer_stats = &dp_pdev->peer_tx_stats;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  195  	struct htt_ppdu_user_stats *usr_stats = &ppdu_stats->user_stats[user];
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  196  	struct htt_ppdu_stats_common *common = &ppdu_stats->common;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  197  	int ret;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  198  	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  199  	u32 v, succ_bytes = 0;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  200  	u16 tones, rate = 0, succ_pkts = 0;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  201  	u32 tx_duration = 0;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  202  	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  203  	bool is_ampdu = false;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  204  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  205  	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  206  		return;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  207  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  208  	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  209  		is_ampdu =
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  210  			HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  211  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  212  	if (usr_stats->tlv_flags &
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  213  	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  214  		succ_bytes = le32_to_cpu(usr_stats->ack_ba.success_bytes);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  215  		succ_pkts = le32_get_bits(usr_stats->ack_ba.info,
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  216  					  HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  217  		tid = le32_get_bits(usr_stats->ack_ba.info,
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  218  				    HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  219  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  220  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  221  	if (common->fes_duration_us)
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  222  		tx_duration = le32_to_cpu(common->fes_duration_us);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  223  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  224  	user_rate = &usr_stats->rate;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  225  	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  226  	bw = HTT_USR_RATE_BW(user_rate->rate_flags) - 2;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  227  	nss = HTT_USR_RATE_NSS(user_rate->rate_flags) + 1;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  228  	mcs = HTT_USR_RATE_MCS(user_rate->rate_flags);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  229  	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  230  	dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  231  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  232  	/* Note: If host configured fixed rates and in some other special
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  233  	 * cases, the broadcast/management frames are sent in different rates.
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  234  	 * Firmware rate's control to be skipped for this?
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  235  	 */
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  236  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  237  	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH12K_HE_MCS_MAX) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  238  		ath12k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  239  		return;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  240  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  241  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  242  	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > ATH12K_VHT_MCS_MAX) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  243  		ath12k_warn(ab, "Invalid VHT mcs %d peer stats",  mcs);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  244  		return;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  245  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  246  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  247  	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > ATH12K_HT_MCS_MAX || nss < 1)) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  248  		ath12k_warn(ab, "Invalid HT mcs %d nss %d peer stats",
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  249  			    mcs, nss);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  250  		return;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  251  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  252  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  253  	if (flags == WMI_RATE_PREAMBLE_CCK || flags == WMI_RATE_PREAMBLE_OFDM) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  254  		ret = ath12k_mac_hw_ratecode_to_legacy_rate(mcs,
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  255  							    flags,
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  256  							    &rate_idx,
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  257  							    &rate);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  258  		if (ret < 0)
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  259  			return;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  260  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  261  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  262  	rcu_read_lock();
629b3618ded69c Harsh Kumar Bijlani 2025-05-20  263  	spin_lock_bh(&dp->dp_lock);
629b3618ded69c Harsh Kumar Bijlani 2025-05-20  264  	peer = ath12k_dp_link_peer_find_by_id(dp, usr_stats->peer_id);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  265  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  266  	if (!peer || !peer->sta) {
629b3618ded69c Harsh Kumar Bijlani 2025-05-20  267  		spin_unlock_bh(&dp->dp_lock);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  268  		rcu_read_unlock();
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  269  		return;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  270  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  271  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  272  	sta = peer->sta;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  273  
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  274  	memset(&peer->txrate, 0, sizeof(peer->txrate));
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  275  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  276  	switch (flags) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  277  	case WMI_RATE_PREAMBLE_OFDM:
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  278  		peer->txrate.legacy = rate;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  279  		break;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  280  	case WMI_RATE_PREAMBLE_CCK:
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  281  		peer->txrate.legacy = rate;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  282  		break;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  283  	case WMI_RATE_PREAMBLE_HT:
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  284  		peer->txrate.mcs = mcs + 8 * (nss - 1);
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  285  		peer->txrate.flags = RATE_INFO_FLAGS_MCS;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  286  		if (sgi)
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  287  			peer->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  288  		break;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  289  	case WMI_RATE_PREAMBLE_VHT:
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  290  		peer->txrate.mcs = mcs;
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  291  		peer->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  292  		if (sgi)
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  293  			peer->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  294  		break;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  295  	case WMI_RATE_PREAMBLE_HE:
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  296  		peer->txrate.mcs = mcs;
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  297  		peer->txrate.flags = RATE_INFO_FLAGS_HE_MCS;
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  298  		peer->txrate.he_dcm = dcm;
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  299  		peer->txrate.he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  300  		tones = le16_to_cpu(user_rate->ru_end) -
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  301  			le16_to_cpu(user_rate->ru_start) + 1;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  302  		v = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  303  		peer->txrate.he_ru_alloc = v;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  304  		break;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  305  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  306  
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  307  	peer->txrate.nss = nss;
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  308  	peer->txrate.bw = ath12k_mac_bw_to_mac80211_bw(bw);
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  309  	peer->tx_duration += tx_duration;
afe9933912ff5b Harsh Kumar Bijlani 2025-05-12  310  	memcpy(&peer->last_txrate, &peer->txrate, sizeof(struct rate_info));
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  311  
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  312  	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  313  	 * So skip peer stats update for mgmt packets.
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  314  	 */
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  315  	if (tid < HTT_PPDU_STATS_NON_QOS_TID) {
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  316  		memset(peer_stats, 0, sizeof(*peer_stats));
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  317  		peer_stats->succ_pkts = succ_pkts;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  318  		peer_stats->succ_bytes = succ_bytes;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  319  		peer_stats->is_ampdu = is_ampdu;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  320  		peer_stats->duration = tx_duration;
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  321  		peer_stats->ba_fails =
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  322  			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  323  			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  324  	}
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  325  
629b3618ded69c Harsh Kumar Bijlani 2025-05-20  326  	spin_unlock_bh(&dp->dp_lock);
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  327  	rcu_read_unlock();
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  328  }
c62ffbef4c063e Harsh Kumar Bijlani 2025-05-16  329  

:::::: The code at line 192 was first introduced by commit
:::::: c62ffbef4c063e16a6c7a0bfcc9b446059d98448 wifi: ath12k: Move HTT Rx specific code to newly introduced files

:::::: TO: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
:::::: CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

