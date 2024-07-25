Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C6C3DA49
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcJgsuGYJifMQU507Q45xqvyY9WgRFd9SdPoGyOI/Ww=; b=HJdbYa2A0DSK4+182IyvyoR7qd
	WSgBJnsxitafl/RMpTkApgznOgsCfTeKuUzZzBb6Q/pfoX1sInad9JONrTRDqUFBP5eRAnL535GQ1
	fM72oQzBAAT5nIwJVy/NUEfgC5kmMxlF6P3tw4TIm/fDWK7V+mRpexXzNFZQE02VF70iwkPkh7rL1
	O7XW8y3g5iy39HaW1VOfdRgc7+PySYWhDUmKDLCN03aGnXcuYH0VKhXZG/XAxkbRfBWByEfHWUsjd
	Ovc9+Ro3Wr7QmG8Pu2iUtkgZHSskEC0aIFcOISy5wB1TFpTcF/Tk6y2f7ljdPTWpuS3qGI4//Jhvk
	/z9HdDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9u-00000000q4o-0pA4
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 12:01:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9i-00000000pzF-48XP
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 12:01:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P9B5fP018291;
	Thu, 25 Jul 2024 12:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcJgsuGYJifMQU507Q45xqvyY9WgRFd9SdPoGyOI/Ww=; b=cIUu2S/097vLT6jy
	/+86HvJfpz12XKdmrH3SXJhwW/nuDm9e9aWlfoHvEFykfLLtq7TOtm96p8x8jGf/
	7Cu8UY7Asll2LlDuE3bmBuHzacVbm2Otl1E2rEcXJBdp5zHCWwMA0rA56uxMqqOs
	7wN4qEcg/IvuFAv33+4Z79CjYBeX1LAppC2PT+czKx+A5jS/wz4yfgwNuhGYHNCB
	Fv1MlTxCfp+n8simc0kMteuxhv+csG9QRCEhKyOdVEdeU5YPeAicWekQUueTN+sM
	lKYK/wUzqCxNKlA0FjVKxkcG/C3XzctppyNBEGlkzFX/veR7mQtWwSkb6pD/eGYD
	3GbTeQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xen8sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PC19qT013652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:09 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 05:01:08 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 07/11] wifi: ath12k: properly handling the state variables of monitor mode
Date: Thu, 25 Jul 2024 20:00:31 +0800
Message-ID: <20240725120035.493-8-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20240725120035.493-1-quic_kangyang@quicinc.com>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vQhPLetgxIFWTCx2s0oXSt5TVQjmyDzQ
X-Proofpoint-ORIG-GUID: vQhPLetgxIFWTCx2s0oXSt5TVQjmyDzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_050111_080236_2A04B603 
X-CRM114-Status: GOOD (  11.73  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

Now monitor mode has some status variables, such as monitor_started,
monitor_vdev_created. They are not always handled correctly.

For monitor_started, it should be true when driver works in monitor
mode, and should be false at other times.

For monitor_vdev_id, it should be -1 when driver doesn't work in monitor
mode.

For monitor_vdev_created, it should be true after monitor vdev is
created successfully and should be false at other times.

For monitor_conf_enabled, it should be true when mac80211 sets
IEEE80211_CONF_MONITOR, and should be false at other times.

Handle those state variables according to above descriptions.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  5 +++++
 drivers/net/wireless/ath/ath12k/mac.c  | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 51252e8bc1ae..6965876137ce 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1060,6 +1060,11 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 				     ath12k_mac_tx_mgmt_pending_free, ar);
 			idr_destroy(&ar->txmgmt_idr);
 			wake_up(&ar->txmgmt_empty_waitq);
+
+			ar->monitor_vdev_id = -1;
+			ar->monitor_started = false;
+			ar->monitor_vdev_created = false;
+			ar->monitor_conf_enabled = false;
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8106297f0bc1..642d756db663 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6565,6 +6565,9 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 			goto err_peer_del;
 		}
 		break;
+	case WMI_VDEV_TYPE_MONITOR:
+		ar->monitor_vdev_created = true;
+		break;
 	default:
 		break;
 	}
@@ -6614,6 +6617,8 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 err_vdev_del:
 	ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->num_created_vdevs--;
+	ar->monitor_vdev_created = false;
+	ar->monitor_vdev_id = -1;
 	arvif->is_created = false;
 	arvif->ar = NULL;
 	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
@@ -9330,6 +9335,11 @@ static void ath12k_mac_setup(struct ath12k *ar)
 
 	INIT_WORK(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
+
+	ar->monitor_vdev_id = -1;
+	ar->monitor_started = false;
+	ar->monitor_vdev_created = false;
+	ar->monitor_conf_enabled = false;
 }
 
 int ath12k_mac_register(struct ath12k_base *ab)
-- 
2.34.1


