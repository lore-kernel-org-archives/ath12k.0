Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF2C282EC
	for <ath12k@archiver.kernel.org>; Sat, 15 Mar 2025 02:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=41teP4V4LfVrD90HnWTLZvNpbBnLdrE6r4nucRHc0j0=; b=JcMhcrcNHOtXMKnR2JbnVoo2QQ
	sarRBY89M6URORIE3p1Rfke07zAnP1SIa1QMCe5K0+huUa1ub+c1VRmtlAyXl58yADcQe87AWNfzt
	KaxNFljS29o7ffDAlxsG9vWVNgvpep0L9XOEZzVUJunjpUTOnTSt3RkxHN+KuvIMT8cagNyGtoODZ
	NpWwEbNnaSKHWzdMzsk0H0qeI2YT39Nv8+p9RpST8UYsfyacrRG53E0dKeIhvEa8ENw08Ob40X8Bx
	bvoesjf7mOmCJSpno/DJfypqRnl1laXlK2zQ9gTs7zBT4lRA0//8x9j2zIeWTguxIz/KWZD1pAHg5
	rpzCEQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttH0P-0000000FgL3-05Kv
	for ath12k@archiver.kernel.org;
	Sat, 15 Mar 2025 02:12:05 +0000
Received: from [198.175.65.11] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttH0M-0000000FgKk-1iKh
	for ath12k@lists.infradead.org;
	Sat, 15 Mar 2025 02:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742004723; x=1773540723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dGZby3NcTG5d1ppp+jOKH36+9Gbk0rBnUPVsdgiPNo=;
  b=lybVB4+dWuv54uXOZfrtFpjS4IdcGGcPR53ZPAGSRus9zkFZn4G6YW41
   8PDQJSzTPIfx6DMI1uSje/OIWhW/3r5xpW/blIj+7odt/AuqQNm0/Ykls
   x93H7aPpyDvqVlc5QwGoUMZaMLmBd8O5LMl4ps1qZGqOFJlQggMn8uFBb
   MKQ7KowAoMpdLZR/Yh9dKA3STC0gTqkbgcK7KnbZcApC01482K+RH3qr9
   TCjq1CZnrl4/KRHW0z+y9mXcaQOQWMfOlDXs/dUSJZv/ObE+adHaTWa5E
   xsPGpVpiLYU1ao7lX88HAU8Ej2tqEXwLry0jC8Tftchm+9qzvVJwv5YIP
   A==;
X-CSE-ConnectionGUID: 4OK+O8jwRtyLELmPFvb7ag==
X-CSE-MsgGUID: jjrH0tIVSaif9eIBkI7GcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53380631"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53380631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 19:11:58 -0700
X-CSE-ConnectionGUID: xujijOMGRVG99iFMYwJrUw==
X-CSE-MsgGUID: I8vAgwIQSsuRZEw9V/dsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121938833"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2025 19:11:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttH0C-000AzG-2d;
	Sat, 15 Mar 2025 02:11:52 +0000
Date: Sat, 15 Mar 2025 10:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:ath12k-split-phy 144/158]
 drivers/net/wireless/mediatek/mt76/mt792x_core.c:574:9: error: no member
 named 'ack_signal' in 'struct station_info'
Message-ID: <202503151013.F71WON7c-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_191202_539717_D97D97B6 
X-CRM114-Status: UNSURE (   7.30  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   b8fa5b81fe378ec2bf46db73a2ff7d43151121da
commit: 4ee62a717c5471caf9b50beb6eeefcf4ee0670a8 [144/158] wifi: cfg80211: reorg sinfo structure elements for MLO
config: powerpc-randconfig-003-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151013.F71WON7c-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151013.F71WON7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151013.F71WON7c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt792x_core.c:556:10: error: no member named 'txrate' in 'struct station_info'
     556 |                 sinfo->txrate.legacy = txrate->legacy;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:558:10: error: no member named 'txrate' in 'struct station_info'
     558 |                 sinfo->txrate.mcs = txrate->mcs;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:559:10: error: no member named 'txrate' in 'struct station_info'
     559 |                 sinfo->txrate.nss = txrate->nss;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:560:10: error: no member named 'txrate' in 'struct station_info'
     560 |                 sinfo->txrate.bw = txrate->bw;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:561:10: error: no member named 'txrate' in 'struct station_info'
     561 |                 sinfo->txrate.he_gi = txrate->he_gi;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:562:10: error: no member named 'txrate' in 'struct station_info'
     562 |                 sinfo->txrate.he_dcm = txrate->he_dcm;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:563:10: error: no member named 'txrate' in 'struct station_info'
     563 |                 sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:565:9: error: no member named 'tx_failed' in 'struct station_info'
     565 |         sinfo->tx_failed = msta->deflink.wcid.stats.tx_failed;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:568:9: error: no member named 'tx_retries' in 'struct station_info'
     568 |         sinfo->tx_retries = msta->deflink.wcid.stats.tx_retries;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:571:9: error: no member named 'txrate' in 'struct station_info'
     571 |         sinfo->txrate.flags = txrate->flags;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt792x_core.c:574:9: error: no member named 'ack_signal' in 'struct station_info'
     574 |         sinfo->ack_signal = (s8)msta->deflink.ack_signal;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt792x_core.c:577:9: error: no member named 'avg_ack_signal' in 'struct station_info'
     577 |         sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->deflink.avg_ack_signal);
         |         ~~~~~  ^
   12 errors generated.
--
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1159:10: error: no member named 'rxrate' in 'struct station_info'
    1159 |                 sinfo->rxrate = rxrate;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1165:11: error: no member named 'txrate' in 'struct station_info'
    1165 |                         sinfo->txrate.legacy = txrate->legacy;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1167:11: error: no member named 'txrate' in 'struct station_info'
    1167 |                         sinfo->txrate.mcs = txrate->mcs;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1168:11: error: no member named 'txrate' in 'struct station_info'
    1168 |                         sinfo->txrate.nss = txrate->nss;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1169:11: error: no member named 'txrate' in 'struct station_info'
    1169 |                         sinfo->txrate.bw = txrate->bw;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1170:11: error: no member named 'txrate' in 'struct station_info'
    1170 |                         sinfo->txrate.he_gi = txrate->he_gi;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1171:11: error: no member named 'txrate' in 'struct station_info'
    1171 |                         sinfo->txrate.he_dcm = txrate->he_dcm;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1172:11: error: no member named 'txrate' in 'struct station_info'
    1172 |                         sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1174:10: error: no member named 'txrate' in 'struct station_info'
    1174 |                 sinfo->txrate.flags = txrate->flags;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1182:10: error: no member named 'tx_bytes' in 'struct station_info'
    1182 |                 sinfo->tx_bytes = msta->wcid.stats.tx_bytes;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1186:11: error: no member named 'tx_packets' in 'struct station_info'
    1186 |                         sinfo->tx_packets = msta->wcid.stats.tx_packets;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1191:11: error: no member named 'rx_bytes' in 'struct station_info'
    1191 |                         sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1194:11: error: no member named 'rx_packets' in 'struct station_info'
    1194 |                         sinfo->rx_packets = msta->wcid.stats.rx_packets;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1199:9: error: no member named 'tx_failed' in 'struct station_info'
    1199 |         sinfo->tx_failed = msta->wcid.stats.tx_failed;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1202:9: error: no member named 'tx_retries' in 'struct station_info'
    1202 |         sinfo->tx_retries = msta->wcid.stats.tx_retries;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:1205:9: error: no member named 'ack_signal' in 'struct station_info'
    1205 |         sinfo->ack_signal = (s8)msta->ack_signal;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:1208:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    1208 |         sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->avg_ack_signal);
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:1797:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    1797 |         .sta_statistics = mt7915_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   18 errors generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:2180:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    2180 |         .sta_statistics = mt792x_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1152:11: error: no member named 'txrate' in 'struct station_info'
    1152 |                         sinfo->txrate.legacy = txrate->legacy;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1154:11: error: no member named 'txrate' in 'struct station_info'
    1154 |                         sinfo->txrate.mcs = txrate->mcs;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1155:11: error: no member named 'txrate' in 'struct station_info'
    1155 |                         sinfo->txrate.nss = txrate->nss;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1156:11: error: no member named 'txrate' in 'struct station_info'
    1156 |                         sinfo->txrate.bw = txrate->bw;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1157:11: error: no member named 'txrate' in 'struct station_info'
    1157 |                         sinfo->txrate.he_gi = txrate->he_gi;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1158:11: error: no member named 'txrate' in 'struct station_info'
    1158 |                         sinfo->txrate.he_dcm = txrate->he_dcm;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1159:11: error: no member named 'txrate' in 'struct station_info'
    1159 |                         sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1160:11: error: no member named 'txrate' in 'struct station_info'
    1160 |                         sinfo->txrate.eht_gi = txrate->eht_gi;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1162:10: error: no member named 'txrate' in 'struct station_info'
    1162 |                 sinfo->txrate.flags = txrate->flags;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1165:9: error: no member named 'txrate' in 'struct station_info'
    1165 |         sinfo->txrate.flags = txrate->flags;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1168:9: error: no member named 'tx_failed' in 'struct station_info'
    1168 |         sinfo->tx_failed = msta->wcid.stats.tx_failed;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1171:9: error: no member named 'tx_retries' in 'struct station_info'
    1171 |         sinfo->tx_retries = msta->wcid.stats.tx_retries;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1174:9: error: no member named 'ack_signal' in 'struct station_info'
    1174 |         sinfo->ack_signal = (s8)msta->ack_signal;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1177:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    1177 |         sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->avg_ack_signal);
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1181:10: error: no member named 'tx_bytes' in 'struct station_info'
    1181 |                 sinfo->tx_bytes = msta->wcid.stats.tx_bytes;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1184:10: error: no member named 'rx_bytes' in 'struct station_info'
    1184 |                 sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1187:10: error: no member named 'tx_packets' in 'struct station_info'
    1187 |                 sinfo->tx_packets = msta->wcid.stats.tx_packets;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1190:10: error: no member named 'rx_packets' in 'struct station_info'
    1190 |                 sinfo->rx_packets = msta->wcid.stats.rx_packets;
         |                 ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1667:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    1667 |         .sta_statistics = mt7996_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   19 errors generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7921/main.c:1547:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    1547 |         .sta_statistics = mt792x_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +574 drivers/net/wireless/mediatek/mt76/mt792x_core.c

c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  543  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  544  void mt792x_sta_statistics(struct ieee80211_hw *hw,
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  545  			   struct ieee80211_vif *vif,
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  546  			   struct ieee80211_sta *sta,
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  547  			   struct station_info *sinfo)
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  548  {
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  549  	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
4c28c0976ed83c3 Deren Wu         2024-06-12  550  	struct rate_info *txrate = &msta->deflink.wcid.rate;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  551  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  552  	if (!txrate->legacy && !txrate->flags)
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  553  		return;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  554  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  555  	if (txrate->legacy) {
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  556  		sinfo->txrate.legacy = txrate->legacy;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  557  	} else {
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  558  		sinfo->txrate.mcs = txrate->mcs;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  559  		sinfo->txrate.nss = txrate->nss;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  560  		sinfo->txrate.bw = txrate->bw;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  561  		sinfo->txrate.he_gi = txrate->he_gi;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  562  		sinfo->txrate.he_dcm = txrate->he_dcm;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  563  		sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  564  	}
4c28c0976ed83c3 Deren Wu         2024-06-12  565  	sinfo->tx_failed = msta->deflink.wcid.stats.tx_failed;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  566  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  567  
4c28c0976ed83c3 Deren Wu         2024-06-12  568  	sinfo->tx_retries = msta->deflink.wcid.stats.tx_retries;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  569  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  570  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  571  	sinfo->txrate.flags = txrate->flags;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  572  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  573  
4c28c0976ed83c3 Deren Wu         2024-06-12 @574  	sinfo->ack_signal = (s8)msta->deflink.ack_signal;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  575  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  576  
4c28c0976ed83c3 Deren Wu         2024-06-12 @577  	sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->deflink.avg_ack_signal);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  578  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL_AVG);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  579  }
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  580  EXPORT_SYMBOL_GPL(mt792x_sta_statistics);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  581  

:::::: The code at line 574 was first introduced by commit
:::::: 4c28c0976ed83c3e8240e80ea918c4d1a3f9c5bc wifi: mt76: mt792x: add struct mt792x_link_sta

:::::: TO: Deren Wu <deren.wu@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

