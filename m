Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D0BCD5BD0
	for <ath12k@archiver.kernel.org>; Mon, 25 May 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqc/W7sSJ7k70czOoAGaHPWxXALZAmD3YgXV1Zheg4U=; b=CNVYzfmIyKBSv/BkzNw6PSyZ+2
	g6a15Q5gSS3uxNttz0oBitqGNwm6B0hP6BNeQXFMrPixpfLZt/o6NLfFmmT//QRRpX25kphlfC1ia
	eCcywbPOsbPn++k5xJSfQHxhWW9rf1I9MGeHuronhImo0tr+8JPJK78X6IxeZUTO7xaFVe8ARY+Wp
	Gwzv/YdNST39/vs6CIOG+3sdz+mG8ML57ju8aY+TDjI7mK9AjVt+fjNUhaJEjFSQWRumKZFi5EUhQ
	hdhWVByTlOd/zh+/0fyasIGc2xmMoJw8I198rPdZ04G0mBaTcerqbddZfSj4/oWSeeTCFJz1p2wgB
	NvhwHpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTCG-0000000H21B-3pIj;
	Mon, 25 May 2026 11:10:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTCE-0000000H1zU-2jmJ
	for ath12k@lists.infradead.org;
	Mon, 25 May 2026 11:10:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ceqU1802358;
	Mon, 25 May 2026 11:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iqc/W7sSJ7k
	70czOoAGaHPWxXALZAmD3YgXV1Zheg4U=; b=IAgdrtAULh90oVuv/8sc8QY5iN0
	Do17bLhdh4tqg29N8mcGvL1nikFbMmFXr0eyYxZd6sElWTfiOId5Rb1J/8X1Erk1
	GfVr0BD6O68Hort09cm6jFInxCBa3yE43288wlctrObkVFbCLMrHE0TzTYmj3APf
	DaygQiNQFu9KZ6x/ASFAKXRd6S9xIm6CMd6/Yn7Ph5l9V1kAqNb2GynpTyBL8aU6
	0KzZlK0UP85je1kgckO5wAcvqhuj1su6WD7Bqj8BD+zatAre9LRtV5TqV8lezdkI
	sb/rl0f/BoNgi8wfaZ+cEgfbwJbswj5dIGDJPA75jluzvbS3Dhhvhzb6GlQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqg9vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64PBA6Or026072;
	Mon, 25 May 2026 11:10:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4eb5ajfc2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:06 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64PBA5e3026037;
	Mon, 25 May 2026 11:10:05 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64PBA5al026033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:05 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id ECC084195D; Mon, 25 May 2026 16:40:04 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Subject: [PATCH ath-next 1/6] wifi: ath12k: Set WDS vdev parameter for 4-address station interface
Date: Mon, 25 May 2026 16:39:37 +0530
Message-Id: <20260525110942.2890212-2-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a142e11 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=zWARB4F9Om_0pLQhUroA:9
X-Proofpoint-ORIG-GUID: yUYwtB6KN4viLoQwps91tL78UOlrRgqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfXxRioKVp8PlqN
 rzfcVOTO6jfBeSjhVU6BKdrOBd8izGlhc03n87YfgcMJU7gxM4DTmuZuGrmDAarNASU0fKCetSc
 gM3br+IyPZICdrMyN0ryFRGeqruyHnwUgrfRbC3b9RUelhso9si+hfDn6198YsS0Du4NLrbL6Ul
 tMHAQxG0gWl0D141OQnQA0QUR+ZUtFt7fLO/FqqpnY7Q7Lit4nLoldNicaGvIcYl6dXqwt16TTf
 WNUSDi6uygh9y/l5rH98fMVGG0Kc/eK5GS30f/trW9kWwniKTn5WNTWe7SUp85LkLKdpTD0bB0p
 LvZRHJdKOi9LeXwvTtEOoNWIp1gDxjH0H4jWMC5W0TuYgwKE2YeR7qhkOLwz1x6pStXW/xIRaPc
 vyUDk7Dlkd7YOtGaGd0Zr8hGCU1fRn8Qm+gQ23Hm/nA7F0K/eW7lhvvSi/24aBBt74KleQfX940
 JhXaF6oqwyFGuxzmgRw==
X-Proofpoint-GUID: yUYwtB6KN4viLoQwps91tL78UOlrRgqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041010_807132_698ADBA2 
X-CRM114-Status: GOOD (  11.72  )
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

Set WDS vdev parameter during station interface creation to enable
4-address mode. Unlike AP interfaces that set peer-specific 4-address
mode parameters after receiving 4-address frames from stations, station
interfaces must send all data frames in 4-address mode immediately after
association, including 4-address NULL frames.

Firmware requires 4-address notification for station interfaces during
vdev creation. Configure the WDS vdev parameter for station interfaces.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 54081beb9a5f..2d02a6a8d54f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10231,6 +10231,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	struct ieee80211_hw *hw = ah->hw;
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
+	struct wireless_dev *wdev = ieee80211_vif_to_wdev(vif);
 	struct ath12k_wmi_vdev_create_arg vdev_arg = {};
 	struct ath12k_wmi_peer_create_arg peer_param = {};
 	struct ieee80211_bss_conf *link_conf = NULL;
@@ -10399,6 +10400,25 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 			goto err_peer_del;
 		}
 
+		/*
+		 * There could be race condition in firmware for the station
+		 * interface between enabling 4-address peer WMI param and
+		 * sending 4-address frame (NULL or EAPOL via TCL).
+		 * Make the station as WDS while bringup itself
+		 * to avoid the race condition
+		 */
+		if (vif->type == NL80211_IFTYPE_STATION &&
+		    (wdev && wdev->use_4addr)) {
+			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+							    WMI_VDEV_PARAM_WDS,
+							    1);
+			if (ret) {
+				ath12k_warn(ar->ab, "failed to set WDS vdev param: %d\n",
+					    ret);
+				goto err_peer_del;
+			}
+		}
+
 		if (test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ab->wmi_ab.svc_map) &&
 		    ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
 		    ahvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE) {
-- 
2.34.1


