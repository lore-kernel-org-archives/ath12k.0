Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B4BC36010
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 02:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K49ClcNJNOENscp7xtR/Zw7NBYHdUaiSNDgj+lzTJ1c=; b=CNFZQlE4QDTCTflGQmyIg265mR
	3W12xChLpuhCQtJvd1mVCkkO6cTk9a/B0SlEt1F+j3xRqJbcR711P0ieJXEgNlxIBIu+j2ipD6t7P
	jQxyGhEfMrogk9OJ+6Ih0lCu2gj1qbVxJ5DXdyR30ZaQkTMOClCaA3Xm/HMxRlBdwFbsJx2BuGxAt
	37SXITKq9T7WukZ4W/p4/OXKUJBSSbHPQLsgmZg6X/M1UQLpiqVL57mbeKwOu6JZTIh1yJHxpRIzQ
	8tPRs2m4hcEKn6buPAgcqRWz/OB+XbVqiuOlEz+Lx9tcJfohYGxRB4D1asP+BTVRz4gC4H45WhgHv
	L0KaJk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L9x-00000005vQh-3zrQ
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 02:27:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L9v-00000005vPQ-1rUS
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 02:27:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYnaE004675;
	Wed, 9 Apr 2025 02:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K49ClcNJNOENscp7xtR/Zw7NBYHdUaiSNDgj+lzTJ1c=; b=F92APzmOcCqMMX6c
	tvzZL2PcnjBf2TS4oj2LO2pnkQRNE4mgBwUZNRqUXytXlxLkuH/c9G/Zb1I3Fqm6
	p1aU09AkhEKZcWVRSYJqTt+d3sFT4+vT82HA+z+2/y9buvEjJVHe0bDuNem5kdD+
	6ZsWb/EZnZrcvqDNJojzNDqgvdzQkFgmxg7Ki+OhpVAlV1CYLDrO93mdY+ZqbNXA
	FqMU3V+F4yWkTij0n5YNQQPye37EgxiIJMDC6D5IHk2bWJnjTPNR7abQmu0SUS5t
	M8GaWHNNkXb4e065ckX1HNX3rSZl08WNBtQ0PSFCtI/65lRtka5e/6U3QzOpv04W
	Ds4rsA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb1vby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 02:27:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5392RLFL006654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 02:27:21 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 19:27:19 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 9 Apr 2025 10:26:38 +0800
Subject: [PATCH ath-next v2 5/9] wifi: ath12k: make assoc link associate
 first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250409-ath12k-wcn7850-mlo-support-v2-5-3801132ca2c3@quicinc.com>
References: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
In-Reply-To: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q5iWOIK8QivH7yHxZc6I0lXZRV64jn5O
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f5db09 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EtMFwaiasCmdoeVE0uMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q5iWOIK8QivH7yHxZc6I0lXZRV64jn5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_192723_521917_C9AF9A38 
X-CRM114-Status: GOOD (  12.47  )
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

In MLO scenario WCN7850 firmware requests the assoc link to associate
before any other links. However currently in
ath12k_mac_op_vif_cfg_changed() we are doing association in an ascending
order of link id. If the assoc link does not get assigned the smallest
id, a non-assoc link gets associated first and firmware crashes.

Change to do association for the assoc link first.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 316df6e36c6bac00eef4d98a03c1335f5c0cca4a..699772a471f5f81c42009b529e756fa75bca0779 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3611,6 +3611,8 @@ static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
 	unsigned long links = ahvif->links_map;
 	struct ieee80211_bss_conf *info;
 	struct ath12k_link_vif *arvif;
+	struct ieee80211_sta *sta;
+	struct ath12k_sta *ahsta;
 	struct ath12k *ar;
 	u8 link_id;
 
@@ -3623,6 +3625,35 @@ static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_ASSOC) {
+		if (vif->cfg.assoc) {
+			/* only in station mode we can get here, so it's safe
+			 * to use ap_addr
+			 */
+			rcu_read_lock();
+			sta = ieee80211_find_sta(vif, vif->cfg.ap_addr);
+			if (!sta) {
+				rcu_read_unlock();
+				WARN_ONCE(1, "failed to find sta with addr %pM\n",
+					  vif->cfg.ap_addr);
+				return;
+			}
+
+			ahsta = ath12k_sta_to_ahsta(sta);
+			arvif = wiphy_dereference(hw->wiphy,
+						  ahvif->link[ahsta->assoc_link_id]);
+			rcu_read_unlock();
+
+			ar = arvif->ar;
+			/* there is no reason for which an assoc link's
+			 * bss info does not exist
+			 */
+			info = ath12k_mac_get_link_bss_conf(arvif);
+			ath12k_bss_assoc(ar, arvif, info);
+
+			/* exclude assoc link as it is done above */
+			links &= ~BIT(ahsta->assoc_link_id);
+		}
+
 		for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
 			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
 			if (!arvif || !arvif->ar)

-- 
2.25.1


