Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C686C021B2
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8apvWz6Ub5FSWqusYdXzM8qsdtvI55uAEx4cvGxVnYA=; b=suR2hUHperFxi46pBbYhHCZQFl
	qd6bqnVFIrosb8idnItC0SFY7jVZs3Ca3FcekHZ59aO7GjeWkMs6FKYfywj2tjrLTSI1pQHtP5X/L
	Yt7L38P58bN1R5KBnjH2515ce+vyY+NjasqK1uKLow53Cw4HOJyLlzXI8xTx5ezgGQIN5E5fn7veC
	0+ye3hc5AjGP7adxgdy5auSZ0xnjZ7B4DLIayMLiTMtlceG2ukeyAy9zE92jJfBm/WD63NsgxQqQR
	ES0yIJvVQBTcfwZCCTDQbVAVEpFqYcGt/yAPzhkhe6pjg4l2tjOpwGR8q9TI1opAUcQLRK3G4wDRo
	tmiOVeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqQw-000000089nj-48ox
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 14:24:46 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqQu-000000089nJ-0Y8W
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 14:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740234284; x=1771770284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BlSecQzD4quBgRcygAk/JGcmi2xjLYuIZzuQ5zWKthE=;
  b=TYqaakQqUlj4JAcMClVbZTZ4FcpkrzhhaLVJjrpVgJkYPKMPaVkczJ14
   ZvJbFXLLDxj+1IHO4hm0PbjRB5ltEDHUBTtUh41bFyEZukpcLNNCue46K
   BEjdgiBlSzy3I8Lu1+rA6Tc9whKW6i2KTZXAAQroFIlp7sh0jXpXdYUAZ
   8pMbiRvkJnvsKXs8wYYWiYcw3+eYtg+Kw0paLtxUfyh5l0MYT9XtF9qVC
   dtpK6GiE5gScz4THfzjoNuDydW4vQK64mVx/YFFdL9kHRgoF6Vo9A0TLw
   4Lr/koVW4u3FY5TepDtyQMyWDSOh2x/KJqiMKLaUwTJ45ej96Dktq9Olc
   Q==;
X-CSE-ConnectionGUID: P6/VQq43SYi7wCRH7pqBGA==
X-CSE-MsgGUID: G+dA6QOcS/uyhuwRjUDnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51667822"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51667822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 06:24:43 -0800
X-CSE-ConnectionGUID: Cj4UhfeHQwCIzwuybq2UQQ==
X-CSE-MsgGUID: 5jBFcOxDSySqQVKS98r8UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116548353"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2025 06:24:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlqQp-0006dn-12;
	Sat, 22 Feb 2025 14:24:39 +0000
Date: Sat, 22 Feb 2025 22:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net,
	Sarika Sharma <quic_sarishar@quicinc.com>
Subject: Re: [PATCH v2 3/5] wifi: ath12k: add EHT support for TX rate
Message-ID: <202502222240.pXNQqv36-lkp@intel.com>
References: <20250213173206.1665731-4-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213173206.1665731-4-quic_sarishar@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_062444_219266_CE0A5418 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Sarika,

kernel test robot noticed the following build errors:

[auto build test ERROR on 704a2d7237043317ed1b0f8a08203e9ddde70097]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-mac80211-correct-RX-stats-packet-increment-for-multi-link/20250214-014020
base:   704a2d7237043317ed1b0f8a08203e9ddde70097
patch link:    https://lore.kernel.org/r/20250213173206.1665731-4-quic_sarishar%40quicinc.com
patch subject: [PATCH v2 3/5] wifi: ath12k: add EHT support for TX rate
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250222/202502222240.pXNQqv36-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222240.pXNQqv36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222240.pXNQqv36-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/dp_rx.c: In function 'ath12k_update_per_peer_tx_stats':
>> drivers/net/wireless/ath/ath12k/dp_rx.c:1488:40: error: implicit declaration of function 'ath12k_eht_gi_to_nl80211_eht_gi'; did you mean 'ath12k_he_gi_to_nl80211_he_gi'? [-Wimplicit-function-declaration]
    1488 |                 arsta->txrate.eht_gi = ath12k_eht_gi_to_nl80211_eht_gi(sgi);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        ath12k_he_gi_to_nl80211_he_gi
   drivers/net/wireless/ath/ath12k/dp_rx.c:1364:31: warning: variable 'sta' set but not used [-Wunused-but-set-variable]
    1364 |         struct ieee80211_sta *sta;
         |                               ^~~


vim +1488 drivers/net/wireless/ath/ath12k/dp_rx.c

  1357	
  1358	static void
  1359	ath12k_update_per_peer_tx_stats(struct ath12k *ar,
  1360					struct htt_ppdu_stats *ppdu_stats, u8 user)
  1361	{
  1362		struct ath12k_base *ab = ar->ab;
  1363		struct ath12k_peer *peer;
  1364		struct ieee80211_sta *sta;
  1365		struct ath12k_link_sta *arsta;
  1366		struct htt_ppdu_stats_user_rate *user_rate;
  1367		struct ath12k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
  1368		struct htt_ppdu_user_stats *usr_stats = &ppdu_stats->user_stats[user];
  1369		struct htt_ppdu_stats_common *common = &ppdu_stats->common;
  1370		int ret;
  1371		u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
  1372		u32 v, succ_bytes = 0;
  1373		u16 tones, rate = 0, succ_pkts = 0;
  1374		u32 tx_duration = 0;
  1375		u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
  1376		bool is_ampdu = false;
  1377	
  1378		if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
  1379			return;
  1380	
  1381		if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
  1382			is_ampdu =
  1383				HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
  1384	
  1385		if (usr_stats->tlv_flags &
  1386		    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
  1387			succ_bytes = le32_to_cpu(usr_stats->ack_ba.success_bytes);
  1388			succ_pkts = le32_get_bits(usr_stats->ack_ba.info,
  1389						  HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M);
  1390			tid = le32_get_bits(usr_stats->ack_ba.info,
  1391					    HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM);
  1392		}
  1393	
  1394		if (common->fes_duration_us)
  1395			tx_duration = le32_to_cpu(common->fes_duration_us);
  1396	
  1397		user_rate = &usr_stats->rate;
  1398		flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
  1399		bw = HTT_USR_RATE_BW(user_rate->rate_flags) - 2;
  1400		nss = HTT_USR_RATE_NSS(user_rate->rate_flags) + 1;
  1401		mcs = HTT_USR_RATE_MCS(user_rate->rate_flags);
  1402		sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
  1403		dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
  1404	
  1405		/* Note: If host configured fixed rates and in some other special
  1406		 * cases, the broadcast/management frames are sent in different rates.
  1407		 * Firmware rate's control to be skipped for this?
  1408		 */
  1409	
  1410		if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH12K_HE_MCS_MAX) {
  1411			ath12k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
  1412			return;
  1413		}
  1414	
  1415		if (flags == WMI_RATE_PREAMBLE_VHT && mcs > ATH12K_VHT_MCS_MAX) {
  1416			ath12k_warn(ab, "Invalid VHT mcs %d peer stats",  mcs);
  1417			return;
  1418		}
  1419	
  1420		if (flags == WMI_RATE_PREAMBLE_HT && (mcs > ATH12K_HT_MCS_MAX || nss < 1)) {
  1421			ath12k_warn(ab, "Invalid HT mcs %d nss %d peer stats",
  1422				    mcs, nss);
  1423			return;
  1424		}
  1425	
  1426		if (flags == WMI_RATE_PREAMBLE_CCK || flags == WMI_RATE_PREAMBLE_OFDM) {
  1427			ret = ath12k_mac_hw_ratecode_to_legacy_rate(mcs,
  1428								    flags,
  1429								    &rate_idx,
  1430								    &rate);
  1431			if (ret < 0)
  1432				return;
  1433		}
  1434	
  1435		rcu_read_lock();
  1436		spin_lock_bh(&ab->base_lock);
  1437		peer = ath12k_peer_find_by_id(ab, usr_stats->peer_id);
  1438	
  1439		if (!peer || !peer->sta) {
  1440			spin_unlock_bh(&ab->base_lock);
  1441			rcu_read_unlock();
  1442			return;
  1443		}
  1444	
  1445		sta = peer->sta;
  1446		arsta = ath12k_peer_get_link_sta(ab, peer);
  1447		if (!arsta) {
  1448			spin_unlock_bh(&ab->base_lock);
  1449			rcu_read_unlock();
  1450			return;
  1451		}
  1452	
  1453		memset(&arsta->txrate, 0, sizeof(arsta->txrate));
  1454	
  1455		switch (flags) {
  1456		case WMI_RATE_PREAMBLE_OFDM:
  1457			arsta->txrate.legacy = rate;
  1458			break;
  1459		case WMI_RATE_PREAMBLE_CCK:
  1460			arsta->txrate.legacy = rate;
  1461			break;
  1462		case WMI_RATE_PREAMBLE_HT:
  1463			arsta->txrate.mcs = mcs + 8 * (nss - 1);
  1464			arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
  1465			if (sgi)
  1466				arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
  1467			break;
  1468		case WMI_RATE_PREAMBLE_VHT:
  1469			arsta->txrate.mcs = mcs;
  1470			arsta->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
  1471			if (sgi)
  1472				arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
  1473			break;
  1474		case WMI_RATE_PREAMBLE_HE:
  1475			arsta->txrate.mcs = mcs;
  1476			arsta->txrate.flags = RATE_INFO_FLAGS_HE_MCS;
  1477			arsta->txrate.he_dcm = dcm;
  1478			arsta->txrate.he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
  1479			tones = le16_to_cpu(user_rate->ru_end) -
  1480				le16_to_cpu(user_rate->ru_start) + 1;
  1481			v = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
  1482			arsta->txrate.he_ru_alloc = v;
  1483			break;
  1484		case WMI_RATE_PREAMBLE_EHT:
  1485			arsta->txrate.mcs = mcs;
  1486			arsta->txrate.flags = RATE_INFO_FLAGS_EHT_MCS;
  1487			arsta->txrate.he_dcm = dcm;
> 1488			arsta->txrate.eht_gi = ath12k_eht_gi_to_nl80211_eht_gi(sgi);
  1489			tones = le16_to_cpu(user_rate->ru_end) -
  1490				le16_to_cpu(user_rate->ru_start) + 1;
  1491			v = ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(tones);
  1492			arsta->txrate.eht_ru_alloc = v;
  1493			break;
  1494		}
  1495	
  1496		arsta->txrate.nss = nss;
  1497		arsta->txrate.bw = ath12k_mac_bw_to_mac80211_bw(bw);
  1498		arsta->tx_duration += tx_duration;
  1499		memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
  1500	
  1501		/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
  1502		 * So skip peer stats update for mgmt packets.
  1503		 */
  1504		if (tid < HTT_PPDU_STATS_NON_QOS_TID) {
  1505			memset(peer_stats, 0, sizeof(*peer_stats));
  1506			peer_stats->succ_pkts = succ_pkts;
  1507			peer_stats->succ_bytes = succ_bytes;
  1508			peer_stats->is_ampdu = is_ampdu;
  1509			peer_stats->duration = tx_duration;
  1510			peer_stats->ba_fails =
  1511				HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
  1512				HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
  1513		}
  1514	
  1515		spin_unlock_bh(&ab->base_lock);
  1516		rcu_read_unlock();
  1517	}
  1518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

