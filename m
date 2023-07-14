Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121A0EB64DA
	for <ath12k@archiver.kernel.org>; Fri, 14 Jul 2023 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wHPvx6TX751xjG4xFtm/yAKqIRZwq6Q9DO6LQ2Dxmzc=; b=PPRWcpTU6iNFKZ
	iAlY6bTTm2bjnNSsYuSUtqgEPIO23YU7TNkjYID3s4FCBDViMTgtvcPrIHswDxivHGPXCo7BpQy4H
	HGQHX5Xi/6jj6Rm8dA5f0svl2R6mLy59iHeFT1+6vBuXTzokt1otT/sXe7U+Y59Vh3hvGQZRRLLz5
	F3IaMlPriffE/3Z05dB/KHU3ybj+UfuDDAt9Y+EErKFf4M3thzK8qwf96rVSsG+GG3Jd9aThQF0xv
	crZVozcZoLMblq6ohyeQriwAC7fug9Bwyo7kylOEkQJld5rxBMxlhY2f1jj4fYLxlh27QXhCiLIhr
	ZRE0yCq2ex7K4AfBD8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEhk-005cLn-2d
	for ath12k@archiver.kernel.org;
	Fri, 14 Jul 2023 09:03:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEhi-005cL5-0d
	for ath12k@lists.infradead.org;
	Fri, 14 Jul 2023 09:03:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36E4vdh7025029;
	Fri, 14 Jul 2023 09:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=DCnHI/tlQRCCnZQQMDWUH38S4Zi9InVHJ2qvIzmxVzc=;
 b=cWmoL4wfchb7w0mtLha7YXvcji374aPWbETeq97BgwtQqmXSZ43GZdW0OM4GG5yA+SgY
 z/61IyCRKRCzRRmWccVrqYLopmjAtwNODwxxPjWcUY87kwcd+Q1lV/pAV/cycctlZLHd
 4vpk7K+MXY1XZ4liOdTveupFi8xJp6HMZRa/qA5x8vm6+RdK/r9m1hc6L00hwserfvwy
 kabsN2hvkNrH2Du73fl0oi4yNRatoxEwYIncFY0yN4LOwnK36m3KD1FOo19VxXwb1/nr
 zoy5f8s+28hv57nUgQlWYXvjod8SvwrpBF6KYgmDtuW9ax295Ux4yBBpYoxoUltMzdQD SA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptu9b4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 09:03:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36E936CO031779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 09:03:06 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 02:03:04 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: trigger station disconnect on hardware restart
Date: Fri, 14 Jul 2023 05:02:50 -0400
Message-ID: <20230714090250.1409-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yi4sLuCQNWDeiGDV9yFJxW2mKBWERmut
X-Proofpoint-ORIG-GUID: yi4sLuCQNWDeiGDV9yFJxW2mKBWERmut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_04,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_020310_271725_4C3CEDB7 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently after the hardware restart triggered from the driver, the
station interface connection remains intact, since a disconnect
trigger is not sent to userspace. This can lead to a problem in
targets where the wifi mac sequence is added by the firmware.

After the target restart, its wifi mac sequence number gets reset to
zero. Hence AP to which our device is connected will receive frames
with a wifi mac sequence number jump to the past, thereby resulting
in the AP dropping all these frames, until the frame arrives with a
wifi mac sequence number which AP was expecting.

To avoid such frame drops, its better to trigger a station disconnect
upon target hardware restart which can be done with API
ieee80211_reconfig_disconnect exposed to mac80211.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ee792822b411..9d77ad6933b8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6364,6 +6364,7 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 {
 	struct ath12k *ar = hw->priv;
 	struct ath12k_base *ab = ar->ab;
+	struct ath12k_vif *arvif;
 	int recovery_count;
 
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
@@ -6392,6 +6393,21 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 				ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset success\n");
 			}
 		}
+
+		list_for_each_entry(arvif, &ar->arvifs, list) {
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "reconfig cipher %d up %d vdev type %d\n",
+				   arvif->key_cipher,
+				   arvif->is_up,
+				   arvif->vdev_type);
+			if (arvif->is_up &&
+			    arvif->vdev_type == WMI_VDEV_TYPE_STA &&
+			    arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE) {
+				ieee80211_hw_restart_disconnect(arvif->vif);
+				ath12k_dbg(ab, ATH12K_DBG_BOOT,
+					   "restart disconnect\n");
+			}
+		}
 	}
 
 	mutex_unlock(&ar->conf_mutex);

base-commit: 0a00db612b6df1fad80485e3642529d1f28ea084
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
