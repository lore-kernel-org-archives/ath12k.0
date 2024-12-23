Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20729E77190
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6uYF29f9et72+SEQzet3hQ1OKO/acLLyHYfWfsblww=; b=gKq5cDtXIlBNkQiJXtIyHeeeVZ
	iDEaBa3YtXeb/fYChx4FxxjvzvcjbAFn86PHJFzOz0pMsNATPbLaRmrMR/juckWP+YKcgR/rTUtrw
	oqNoRQ7Bl4yycQsCFlAV2f+OzFjPHAVRXzx4muWkcA/NsIDtMZXDImUAp4rzLE2E3XRJcjAC/Z7a9
	kOAo45vDFl8RjCndGSupp/F53l8rpyxWmh5CMvRxZkC6TS99f3UZoDqGnx3yAEguyAWD92JyRonsA
	ulpk9foI1B+KzVyadbzhIWqwPk1Zu+9PE7HddRrOHBE8uChHhOM+1Mhmuhj1hBsa9mZadxrMg9EVK
	B+KFIl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlGV-0000000AORS-3Ing
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 16:26:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlBx-0000000ANV8-2UNG
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 16:22:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCahNG004009;
	Mon, 23 Dec 2024 16:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6uYF29f9et72+SEQzet3hQ1OKO/acLLyHYfWfsblww=; b=jtVnve3BM1ARwz3/
	0bPVTtyAFNXMPRrRD9fJid42XDYEwi3rfvHlc6kDcTI8iN4eZSFYq/cZFM/Lj3LM
	phGo5auGudjfBUc4Q6Al8wbS+/D0xIW1dCtD86hIFE0y/k7gMF/keJAJ7ZGM887t
	icSIOd3Fik5RKD48JHEaU4ms7rkhtVd7N69WOlmPXKl9SAOrZADsmpeBGSbM4pD2
	qLm8us2H9C8vEf3P8TTqq0WHhx3cgw6uPctJI+JE0Tb8kripD6LUL8ZNEsdO7yRR
	Kem5yhKGDf56bkZtcYwJXmNgP1e2S5Rx+LC/iKNXwduUZ9vZu3ird6frMMafkmr9
	c1bnbg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8168vp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNGLvPA011415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:57 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 08:21:55 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Mon, 23 Dec 2024 21:51:39 +0530
Subject: [PATCH 4/4] wifi: ath12k: prevent CSA counter to reach 0 and hit
 WARN_ON_ONCE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241223-ath12k_mlo_csa-v1-4-78b6d7515568@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jBGF_yed_wbkBG75ybDcTSMCFkcdY8VN
X-Proofpoint-GUID: jBGF_yed_wbkBG75ybDcTSMCFkcdY8VN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082201_765376_6DF4FF53 
X-CRM114-Status: GOOD (  18.74  )
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

Currently, when the driver receives a channel switch count WMI event from
the firmware with a count greater than 1, it calls
ieee80211_beacon_update_cntdwn(). If the beacon transmission fails, the
event will be received again with the previous count value. In this
scenario, the host decrements the mac80211 counter again, causing it to
move ahead of the firmware counter. Ultimately, when the firmware count
reaches 1, the mac80211 counter will reach zero, triggering a
WARN_ON_ONCE(). Therefore, there is a need to check the count value in the
event.

Hence to fix this, maintain the current ongoing counter in arvif. If the
count in the event does not match the expected value, silently discard the
event.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/wmi.c  | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b789b375b891c87a4c00374ba81ea12ef0f994f9..61f07d378aaa9676385bcb0b597170ad20febbe3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -298,6 +298,8 @@ struct ath12k_link_vif {
 	u8 link_id;
 	struct ath12k_vif *ahvif;
 	struct ath12k_rekey_data rekey_data;
+
+	u8 current_cntdown_counter;
 };
 
 struct ath12k_vif {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 99f6dc2fbbe3d0aa71ab96e500cfaa8e4bf9930f..d0f328fc9f379cacd1c3beeaeb64a025f2fcef06 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1934,6 +1934,7 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 		cmd->ext_csa_switch_count_offset =
 				cpu_to_le32(offs->cntdwn_counter_offs[1]);
 		cmd->csa_event_bitmap = cpu_to_le32(0xFFFFFFFF);
+		arvif->current_cntdown_counter = bcn->data[offs->cntdwn_counter_offs[0]];
 	}
 
 	cmd->buf_len = cpu_to_le32(bcn->len);
@@ -6912,10 +6913,22 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 			continue;
 
 		/* Finish CSA when counter reaches zero */
-		if (!current_switch_count)
+		if (!current_switch_count) {
 			ieee80211_csa_finish(ahvif->vif, arvif->link_id);
-		else if (current_switch_count > 1)
-			ieee80211_beacon_update_cntdwn(ahvif->vif, arvif->link_id);
+			arvif->current_cntdown_counter = 0;
+		} else if (current_switch_count > 1) {
+			/* If the count in event is not what we expect, don't update the
+			 * mac80211 count. Since during beacon Tx failure, count in the
+			 * firmware will not decrement and this event will come with the
+			 * previous count value again
+			 */
+			if (current_switch_count != arvif->current_cntdown_counter)
+				continue;
+
+			arvif->current_cntdown_counter =
+				ieee80211_beacon_update_cntdwn(ahvif->vif,
+							       arvif->link_id);
+		}
 	}
 	rcu_read_unlock();
 }

-- 
2.34.1


