Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB2EC369D1
	for <ath12k@archiver.kernel.org>; Tue, 22 Apr 2025 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8exERwx92AIA6DdixDNKl+VDmzaZsR1jOZW3hzkgF4=; b=uU9iDf2LGFg25vM6hfzClY+dUS
	+odt97IWyYAEdmKq5TETpC5NG0TNJxfRpM9kEGFgQusVqeWqeHSYLgY8naKawKXQg3Z0rYN1LNQPB
	lG7ttgNSU7rwWRLlub7HNlkytxXK6rmw/prCY6G6xSVgGD0rdiWDMf49hUbaoDiKJNnoaDXSS4uuv
	E65KtL9YZuG91DAzXvlXESZ7U/gSsedFyajKVtQN0tpBdxEIKmbclri+2z5/lYI/ZxbOMqEmzp6sP
	cqKmn80MTsChCgrd07s1ZwiCyBSnZGk+XJiYexjKjJ0cJUJy09sCMgxVeLd/cOwmrBZTpugB2NvAb
	oSgGPaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AsG-00000006lyd-0762;
	Tue, 22 Apr 2025 10:29:08 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AEe-00000006cOv-1V1d
	for ath12k@lists.infradead.org;
	Tue, 22 Apr 2025 09:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745315292; x=1776851292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYgcJT5Nn1Z24L2XGwZWRQStHBHOHtqDcH0DTU4ywP0=;
  b=iHqwrdM6jxbWPuEKE4I2FMAjHANYvvErRu1N8/aPvyo9gnDMxGhosbsf
   Ro5VyXdqz5bvQSZrXPA/e6gFBIRpaICfTQlpyW3zU8CJQGlT0fQEDBAJ2
   HRu1+3/zavHK6mnIIntxJEaxdrXwoPMzpeUCj1/4xR9YeiPlANXXlUEgI
   jRMODbssGSdAx7h7jauz5psVpQ5LLzQbzo4C4RPeXiWE98JKJm6tpI6GI
   03/+AdZLHo9kj3yqud55buwi+Oy8AMDPF073hq2i0K5hbnBNGZyH5nte9
   M9AwA+G2s1L6RE4FTxkRaJN9mntXsqMK8DpnkiHA7RF1xFj9UGTj4lSEh
   w==;
X-CSE-ConnectionGUID: nROIT1tQRrufPWCNTubo7g==
X-CSE-MsgGUID: nJxMxju4SAWydQBJcQpZhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="49528537"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="49528537"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 02:48:11 -0700
X-CSE-ConnectionGUID: 22ESS+U1QwuT3a+nq36+0g==
X-CSE-MsgGUID: gfeg5WDmTJKPXxDrowJbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="169165208"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 02:48:10 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7AEZ-0000oV-2D;
	Tue, 22 Apr 2025 09:48:07 +0000
Date: Tue, 22 Apr 2025 17:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
	ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to
 be installed in hardware
Message-ID: <202504221714.6bYFTiB1-lkp@intel.com>
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_024812_415480_6E51C2D3 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Karthikeyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on d33705bb41ff786b537f8ed50a187a474db111c1]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Kathirvel/wifi-ath12k-allow-beacon-protection-keys-to-be-installed-in-hardware/20250421-194813
base:   d33705bb41ff786b537f8ed50a187a474db111c1
patch link:    https://lore.kernel.org/r/20250421114711.3660911-1-karthikeyan.kathirvel%40oss.qualcomm.com
patch subject: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be installed in hardware
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250422/202504221714.6bYFTiB1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504221714.6bYFTiB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504221714.6bYFTiB1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_set_arvif_ies':
>> drivers/net/wireless/ath/ath12k/mac.c:1474:37: error: 'WLAN_EXT_CAPA11_BCN_PROTECT' undeclared (first use in this function); did you mean 'WLAN_EXT_CAPA11_EMA_SUPPORT'?
    1474 |             (ext_cap_ie->data[10] & WLAN_EXT_CAPA11_BCN_PROTECT))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     WLAN_EXT_CAPA11_EMA_SUPPORT
   drivers/net/wireless/ath/ath12k/mac.c:1474:37: note: each undeclared identifier is reported only once for each function it appears in


vim +1474 drivers/net/wireless/ath/ath12k/mac.c

  1447	
  1448	static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif,
  1449					     struct ath12k_link_vif *tx_arvif,
  1450						 struct sk_buff *bcn,
  1451					     u8 bssid_index, bool *nontx_profile_found)
  1452	{
  1453		struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
  1454		const struct element *elem, *nontx, *index, *nie, *ext_cap_ie;
  1455		const u8 *start, *tail;
  1456		u16 rem_len;
  1457		u8 i;
  1458	
  1459		start = bcn->data + ieee80211_get_hdrlen_from_skb(bcn) + sizeof(mgmt->u.beacon);
  1460		tail = skb_tail_pointer(bcn);
  1461		rem_len = tail - start;
  1462	
  1463		arvif->rsnie_present = false;
  1464		arvif->wpaie_present = false;
  1465	
  1466		if (cfg80211_find_ie(WLAN_EID_RSN, start, rem_len))
  1467			arvif->rsnie_present = true;
  1468		if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT, WLAN_OUI_TYPE_MICROSOFT_WPA,
  1469					    start, rem_len))
  1470			arvif->wpaie_present = true;
  1471	
  1472		ext_cap_ie = cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY, start, rem_len);
  1473		if (ext_cap_ie && ext_cap_ie->datalen >= 11 &&
> 1474		    (ext_cap_ie->data[10] & WLAN_EXT_CAPA11_BCN_PROTECT))
  1475			tx_arvif->beacon_prot = true;
  1476	
  1477		/* Return from here for the transmitted profile */
  1478		if (!bssid_index)
  1479			return;
  1480	
  1481		/* Initial rsnie_present for the nontransmitted profile is set to be same as that
  1482		 * of the transmitted profile. It will be changed if security configurations are
  1483		 * different.
  1484		 */
  1485		*nontx_profile_found = false;
  1486		for_each_element_id(elem, WLAN_EID_MULTIPLE_BSSID, start, rem_len) {
  1487			/* Fixed minimum MBSSID element length with at least one
  1488			 * nontransmitted BSSID profile is 12 bytes as given below;
  1489			 * 1 (max BSSID indicator) +
  1490			 * 2 (Nontransmitted BSSID profile: Subelement ID + length) +
  1491			 * 4 (Nontransmitted BSSID Capabilities: tag + length + info)
  1492			 * 2 (Nontransmitted BSSID SSID: tag + length)
  1493			 * 3 (Nontransmitted BSSID Index: tag + length + BSSID index
  1494			 */
  1495			if (elem->datalen < 12 || elem->data[0] < 1)
  1496				continue; /* Max BSSID indicator must be >=1 */
  1497	
  1498			for_each_element(nontx, elem->data + 1, elem->datalen - 1) {
  1499				start = nontx->data;
  1500	
  1501				if (nontx->id != 0 || nontx->datalen < 4)
  1502					continue; /* Invalid nontransmitted profile */
  1503	
  1504				if (nontx->data[0] != WLAN_EID_NON_TX_BSSID_CAP ||
  1505				    nontx->data[1] != 2) {
  1506					continue; /* Missing nontransmitted BSS capabilities */
  1507				}
  1508	
  1509				if (nontx->data[4] != WLAN_EID_SSID)
  1510					continue; /* Missing SSID for nontransmitted BSS */
  1511	
  1512				index = cfg80211_find_elem(WLAN_EID_MULTI_BSSID_IDX,
  1513							   start, nontx->datalen);
  1514				if (!index || index->datalen < 1 || index->data[0] == 0)
  1515					continue; /* Invalid MBSSID Index element */
  1516	
  1517				if (index->data[0] == bssid_index) {
  1518					*nontx_profile_found = true;
  1519	
  1520					/* Check if nontx BSS has beacon protection enabled */
  1521					if (!tx_arvif->beacon_prot) {
  1522						ext_cap_ie =
  1523						    cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY,
  1524								       nontx->data,
  1525								       nontx->datalen);
  1526						if (ext_cap_ie && ext_cap_ie->datalen >= 11 &&
  1527						    (ext_cap_ie->data[10] &
  1528						     WLAN_EXT_CAPA11_BCN_PROTECT))
  1529							tx_arvif->beacon_prot = true;
  1530					}
  1531	
  1532					if (cfg80211_find_ie(WLAN_EID_RSN,
  1533							     nontx->data,
  1534							     nontx->datalen)) {
  1535						arvif->rsnie_present = true;
  1536						return;
  1537					} else if (!arvif->rsnie_present) {
  1538						return; /* Both tx and nontx BSS are open */
  1539					}
  1540	
  1541					nie = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
  1542								     nontx->data,
  1543								     nontx->datalen);
  1544					if (!nie || nie->datalen < 2)
  1545						return; /* Invalid non-inheritance element */
  1546	
  1547					for (i = 1; i < nie->datalen - 1; i++) {
  1548						if (nie->data[i] == WLAN_EID_RSN) {
  1549							arvif->rsnie_present = false;
  1550							break;
  1551						}
  1552					}
  1553	
  1554					return;
  1555				}
  1556			}
  1557		}
  1558	}
  1559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

