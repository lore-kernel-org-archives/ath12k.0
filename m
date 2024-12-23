Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE89E7718D
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxiF3GLS5OjBZJV0T+jJbED7JKPYbviS39caYHjQfi8=; b=GaZQHeQgimMdPazTVlFem+nn3r
	ZtiqYoOJge7Fg1EK2awk7EvuOj2j8D96dp9Hc8TK5jWdoerTwgPV3I5wRFkhaq5bxRrbPCwbZ+8m3
	XKDcIzxb23V6qu6mA0oQXWmFYW839FydIwMcIxvTQtFnKJOhQuW6Tnnm7OAPqUDBHUOzRMZwIdDE1
	N8RnySJ1/taetwtKy/VwDR+Hwk7rXrVnxu9t4PG5WvFX0lBBnKgP3vq77HgiG+f2Nye0z2BeLqR6b
	f89HOXiv3k9PXM4Rvsc+EjHoHcZChGcKzxIcBaxrB2gRapnpJjXDOgMiFqUDC8B5mJyexdeltMmMd
	f8sZQS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlGU-0000000AOQG-1Fxt
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 16:26:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlBt-0000000ANTU-13Cy
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 16:21:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCv059002415;
	Mon, 23 Dec 2024 16:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SxiF3GLS5OjBZJV0T+jJbED7JKPYbviS39caYHjQfi8=; b=oZk8WVUUwDMEmUtx
	QbC0WqHDKqnDogCIiCYvujHv/mEx1N5kzVHcRbfM8arwhw5fCM1CqNQyaXptNyLy
	eVFzYrroa+yRP9IbRgVZaF6RkgPCh66c4iWimyBeA5LqiuTKnxSd7XDhoNB4alVM
	kBUihz9P3rR93O9WAc56FYXzHjfgAUmoN3Uxu/dsCvu/Zls991br6P5OmiR/8MlH
	An4HUR5H4PZxO118DUk4O1xCOBlj+b7c78Wde4FHJA5HAnpcbiT/6zS4D41zAYUZ
	q7IyOfn0GY7xbNUgt3yQ2FIrfzxpLDYf6wEEpOm7dAbW+5L7pR45JqZ6j2GU8Ug6
	6/8AnA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8ah8tqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNGLrf2025213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:53 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 08:21:50 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Mon, 23 Dec 2024 21:51:37 +0530
Subject: [PATCH 2/4] wifi: ath12k: fix handling of CSA offsets in beacon
 template command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241223-ath12k_mlo_csa-v1-2-78b6d7515568@quicinc.com>
References: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
In-Reply-To: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C2X6Rc9bvwdPdkTuFHjXWyERXnAPa-Th
X-Proofpoint-ORIG-GUID: C2X6Rc9bvwdPdkTuFHjXWyERXnAPa-Th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082157_426452_536FF2C8 
X-CRM114-Status: GOOD (  16.55  )
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

The driver is informed of the counter offsets in the beacon during CSA
through the ieee80211_mutable_offsets structure. According to the
documentation for the cntdwn_counter_offs member, "This array can contain
zero values which should be ignored." However, the current implementation
uses these values unconditionally, without checking for zeros.

Whenever CSA is active, these offsets are guaranteed to be set. Therefore,
add a check for CSA active status before setting the CSA switch count
offsets. This ensures that the offsets are only set when CSA is active,
preventing incorrect configurations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c |  2 +-
 drivers/net/wireless/ath/ath12k/mac.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 23 ++++++++++++++++++++---
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9420566952faecc02356e885bee138d3ba79b097..ec37b2cc1457f1247fa80e707d79cd88dfddf2fb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -501,7 +501,7 @@ static int ath12k_mac_vif_link_chan(struct ieee80211_vif *vif, u8 link_id,
 	return 0;
 }
 
-static struct ieee80211_bss_conf *
+struct ieee80211_bss_conf *
 ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->ahvif->vif;
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 81cfb950e6cddfcf31747e46c7a9a805b94f55dd..9bd70a7d9874af491af98834f137894cd6280ad3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -100,5 +100,6 @@ int ath12k_mac_mlo_setup(struct ath12k_hw_group *ag);
 int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag);
 void ath12k_mac_mlo_teardown(struct ath12k_hw_group *ag);
 int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
+struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d06ab4db7db40219bd30079b4eb048f20637d42d..ff973372a01a85bede15fde72bbe7db99bcfb300 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1895,8 +1895,11 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 {
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct ath12k_base *ab = ar->ab;
 	struct wmi_bcn_tmpl_cmd *cmd;
 	struct ath12k_wmi_bcn_prb_info_params *bcn_prb_info;
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_bss_conf *conf;
 	u32 vdev_id = arvif->vdev_id;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
@@ -1905,6 +1908,14 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 	int ret, len;
 	size_t aligned_len = roundup(bcn->len, 4);
 
+	conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!conf) {
+		ath12k_warn(ab,
+			    "unable to access bss link conf in beacon template command for vif %pM link %u\n",
+			    ahvif->vif->addr, arvif->link_id);
+		return -EINVAL;
+	}
+
 	len = sizeof(*cmd) + sizeof(*bcn_prb_info) + TLV_HDR_SIZE + aligned_len;
 
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
@@ -1916,8 +1927,14 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 						 sizeof(*cmd));
 	cmd->vdev_id = cpu_to_le32(vdev_id);
 	cmd->tim_ie_offset = cpu_to_le32(offs->tim_offset);
-	cmd->csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[0]);
-	cmd->ext_csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[1]);
+
+	if (conf->csa_active) {
+		cmd->csa_switch_count_offset =
+				cpu_to_le32(offs->cntdwn_counter_offs[0]);
+		cmd->ext_csa_switch_count_offset =
+				cpu_to_le32(offs->cntdwn_counter_offs[1]);
+	}
+
 	cmd->buf_len = cpu_to_le32(bcn->len);
 	cmd->mbssid_ie_offset = cpu_to_le32(offs->mbssid_off);
 	if (ema_args) {
@@ -1947,7 +1964,7 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 
 	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_BCN_TMPL_CMDID);
 	if (ret) {
-		ath12k_warn(ar->ab, "failed to send WMI_BCN_TMPL_CMDID\n");
+		ath12k_warn(ab, "failed to send WMI_BCN_TMPL_CMDID\n");
 		dev_kfree_skb(skb);
 	}
 

-- 
2.34.1


