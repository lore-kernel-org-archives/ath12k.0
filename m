Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F2CD8CAD
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jatAUw/1NGWDtBvD8Q3ONOTzW1+TsMGSslAua/EGDg8=; b=vOnuer8cbAeyV2BlxNYFO817zU
	t02yqT0lrchL2gV8g/gGnXCM194HsHtriq4CwINFEe9O/ljUvKc+J6ZIN2nSh4hSkkHp2FhcreKFZ
	lBzSyzre5aJnW24kmvDgkokdl4g0jv+lSADX+BplHc55KwtmFEg3hwtgNRP4lYVBOIiYjKY62JxWJ
	pwjfuPtyPk83efzWPQvacPVVZWSqcZ4ivfHFzIVcAjo4Fh/Xeyjt82yopPwriNP3zVga6CniZ6qck
	+XeWfbJzkU2BbPvwPmXPfXIBjz0DjcBor5kH0uR5mp0I4yhL7BIU9Vwyl4rlbNtKQ5dTXobB1eJdV
	JjoxYGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqGo-00000004uOc-0iuY;
	Tue, 09 Jun 2026 06:49:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqGm-00000004uNo-2JE6
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 06:49:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wdNl1498224;
	Tue, 9 Jun 2026 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jatAUw/1NGW
	DtBvD8Q3ONOTzW1+TsMGSslAua/EGDg8=; b=D91sKrMJOA1GwBmIphuHcj8g9H5
	fLwG9YojxCEZHflvyi8blmwitosldye8XgYpgZuWiLh8LQaBB9hkUNC0QQPZ4dXc
	VUWxV7mmVyQhKVGJVr3x9OLLKq70ew07snyIzzxQ/XSAvSR2kRXVSLf60sY/M92n
	wJ2MxlUNno4N5GNb39N4RwiThIk8QhbHxUrShSwqiPnHBHTN4ikuM7MC0CrIadaU
	9xGJRRT+oV7VDNTUJgni6VKgnDp27vc0+H5V7cezK4ctserhP9HARd+oyASMXcTS
	595XDws+DZ58PHeXH1qgJzHw3NwkPm1u7mhwrxYEDAPPazN2Fo2jXBEFnSg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8mvr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:49:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6596mxDT031245;
	Tue, 9 Jun 2026 06:48:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4emcmj9c11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:48:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6596mxtY031230;
	Tue, 9 Jun 2026 06:48:59 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-sbutta-blr.qualcomm.com [10.190.109.146])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6596mxoV031225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:48:59 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4181700)
	id 62755414EA; Tue,  9 Jun 2026 12:18:58 +0530 (+0530)
From: Sushant Butta <sushant.butta@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sushant Butta <sushant.butta@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Skip peer link info update in rx_status for monitor MSDUs
Date: Tue,  9 Jun 2026 12:18:56 +0530
Message-Id: <20260609064856.547032-3-sushant.butta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
References: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MiBTYWx0ZWRfX7In9D/7wLPF9
 U8fnRxmhMuNk+rgYJAJxDOWj9IC6c81zXscTgFlPlcobeLpv4USQjSpPerkZpsfj3Afjul0xila
 WtnOXN96kytlDVD7t4rSJCd2wRv2SmHV3Ih/E8/8uF314n1N5istAxU1pVKUQ15wbvmJATiuyWH
 wUi1mmvwTBTyVsqSdao6P4Mwghn1qlbvCfUnoLQ8p5NupHtOiACUQNwfCbxrakrVr8c1IFAaJfs
 +50zfBdOjqkOSbHZ5Lxz+nQHqZVEknDHC9zkFOcCMznlqXT3E2cybqv3UNZBvHfMC1VQqzczocz
 U04vsAWFF18VnIJfz3z0Kh8WIf7u+cCpCkUyzSMM749fQwiDX35tRXHJ1mc8N+6LscPki8429cy
 zS+LLKK5VONGovA2ploAOwOMjqnJp5lNaypeyOaNECUsZFMwaZkec7ER4CzRXohYuJNXMVJ3SGo
 Xlz/BPw33LGFDl6DAmA==
X-Proofpoint-ORIG-GUID: zQYSqeObi-IjGxoBdJ1ZFsd2Da9-bwh5
X-Proofpoint-GUID: zQYSqeObi-IjGxoBdJ1ZFsd2Da9-bwh5
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27b75f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=7jyWIYE-e2cRCeo_cVsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_234904_706986_7443C43C 
X-CRM114-Status: GOOD (  13.19  )
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

Do not populate peer and link_id in ieee80211_rx_status for monitor
MSDUs.

The monitor RX path is handled differently in mac80211 when
RX_FLAG_ONLY_MONITOR is set, and does not consume peer/link metadata.
As such, looking up the peer and updating link_id here is unnecessary.

Additionally, this metadata is not required for monitor mode delivery,
and performing the lookup/update introduces redundant work and the
potential for inconsistent rx_status state if multiple paths modify it.
Hence, remove the peer lookup and link_id update from the monitor MSDU
delivery path.

This also removes the per-MSDU debug logging in the monitor path,
slightly reducing debuggability, but avoids unnecessary overhead in the
monitor RX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sushant Butta <sushant.butta@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 54 +-----------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index cfcfa93eeb44..7d5be77b081f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -495,8 +495,6 @@ void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 				   struct sk_buff *msdu,
 				   struct ieee80211_rx_status *status)
 {
-	struct ath12k_dp *dp = dp_pdev->dp;
-	struct ath12k_base *ab = dp->ab;
 	static const struct ieee80211_radiotap_he known = {
 		.data1 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_DATA_MCS_KNOWN |
 				     IEEE80211_RADIOTAP_HE_DATA1_BW_RU_ALLOC_KNOWN),
@@ -504,13 +502,6 @@ void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 	};
 	struct ieee80211_rx_status *rx_status;
 	struct ieee80211_radiotap_he *he = NULL;
-	struct ieee80211_sta *pubsta = NULL;
-	struct ath12k_dp_link_peer *peer;
-	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct hal_rx_desc_data rx_info;
-	bool is_mcbc = rxcb->is_mcbc;
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)msdu->data;
-	u8 addr[ETH_ALEN] = {};
 
 	status->link_valid = 0;
 
@@ -521,53 +512,10 @@ void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 		status->flag |= RX_FLAG_RADIOTAP_HE;
 	}
 
-	ath12k_dp_extract_rx_desc_data(dp->hal, &rx_info, rx_desc, rx_desc);
-
-	rcu_read_lock();
-	spin_lock_bh(&dp->dp_lock);
-	peer = ath12k_dp_rx_h_find_link_peer(dp_pdev, msdu, &rx_info);
-	if (peer && peer->sta) {
-		pubsta = peer->sta;
-		memcpy(addr, peer->addr, ETH_ALEN);
-		if (pubsta->valid_links) {
-			status->link_valid = 1;
-			status->link_id = peer->link_id;
-		}
-	}
-
-	spin_unlock_bh(&dp->dp_lock);
-	rcu_read_unlock();
-
-	ath12k_dbg(ab, ATH12K_DBG_DATA,
-		   "rx skb %p len %u peer %pM %u %s %s%s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
-		   msdu,
-		   msdu->len,
-		   addr,
-		   rxcb->tid,
-		   (is_mcbc) ? "mcast" : "ucast",
-		   (status->encoding == RX_ENC_LEGACY) ? "legacy" : "",
-		   (status->encoding == RX_ENC_HT) ? "ht" : "",
-		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
-		   (status->encoding == RX_ENC_HE) ? "he" : "",
-		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
-		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
-		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
-		   (status->bw == RATE_INFO_BW_320) ? "320" : "",
-		   status->enc_flags & RX_ENC_FLAG_SHORT_GI ? "sgi " : "",
-		   status->rate_idx,
-		   status->nss,
-		   status->freq,
-		   status->band, status->flag,
-		   !!(status->flag & RX_FLAG_FAILED_FCS_CRC),
-		   !!(status->flag & RX_FLAG_MMIC_ERROR),
-		   !!(status->flag & RX_FLAG_AMSDU_MORE));
-
-	ath12k_dbg_dump(ab, ATH12K_DBG_DP_RX, NULL, "dp rx msdu: ",
-			msdu->data, msdu->len);
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
 
-	ieee80211_rx_napi(ath12k_pdev_dp_to_hw(dp_pdev), pubsta, msdu, napi);
+	ieee80211_rx_napi(ath12k_pdev_dp_to_hw(dp_pdev), NULL, msdu, napi);
 }
 EXPORT_SYMBOL(ath12k_dp_mon_rx_deliver_msdu);
 
-- 
2.34.1


