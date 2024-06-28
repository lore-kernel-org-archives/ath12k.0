Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1CAC30659
	for <ath12k@archiver.kernel.org>; Fri, 28 Jun 2024 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrBWJ67RM+4zRQ4OB2FDZku720Trdk8u6YEReM1NGZs=; b=sDSw7N2EP7z/p/ojx/tfnr5XgV
	6/XVRGfL2xBnZPjm0NEzwxdkhSRvorXUPRQmu4Nh/VxwyHS9iHx7uQxeGes32rxU82P+AWL1+kY9D
	J7+BtM4O4NI0iK/P6T+Up/71j+MThk0asHnbvMTCfdB6pdJnIK9wckJywPKUOhUH6OHJdRR0E4Hik
	fDgJCRspfJPyLZsMpzWzOHOOxHNQOgk/u5bkhT5CDMS3kRhSxRxQcKFpXpCiiiYfjITCXNsGpO4EZ
	XT6R7MrtnWD78nh8cJPzqgFNKJZ7gBSovPwA5aBXDuHv7hoygWuSPFdA6StS5syHdUvajde0T5D58
	Uic7MUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8H9-0000000DKca-2JWc
	for ath12k@archiver.kernel.org;
	Fri, 28 Jun 2024 09:52:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8H4-0000000DKYQ-3qE4
	for ath12k@lists.infradead.org;
	Fri, 28 Jun 2024 09:52:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S1ZosD000900;
	Fri, 28 Jun 2024 09:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IrBWJ67RM+4
	zRQ4OB2FDZku720Trdk8u6YEReM1NGZs=; b=edh2sAZ5DoFCYcrQVP8BH/K9YaD
	zHNSSOVNalQcb7NfHkEpg+OdY1mH8/2y/SF0j55pO/NyBwWe9vxSF7EDrLkb0ABo
	KjTVr9y43a3HDKBmZCS/gIeI8r4wqbG8WEyw6DaRDkYcj34hn6AqpOjINGd4hGlT
	k4CD10v5Q6FanRATJJEsiN/depdwE4+uS7sak0pqHsvUfygQjBlGagnCaP/+j67L
	gUBf2P2y+YG40kg3sIDTDgkn6dmJPx/j9eQzq6BM5xO0dBg5+WhVAMbIvRVA8VSX
	6LoYbtGVT3tTZvXqzo/94nbWGFpxYAbgvVCX+539knhM7fE6MmhSv7Ok3cg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90ph93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:52:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45S9q6Bg017551;
	Fri, 28 Jun 2024 09:52:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpmmm3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:52:06 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45S9q1uW017469;
	Fri, 28 Jun 2024 09:52:05 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45S9q5Xu017544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:52:05 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 131D2410E0; Fri, 28 Jun 2024 15:22:05 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v9 4/8] wifi: ath12k: Introduce QMI firmware ready flag
Date: Fri, 28 Jun 2024 15:21:35 +0530
Message-Id: <20240628095139.292952-5-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628095139.292952-1-quic_hprem@quicinc.com>
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lOlIiKPkn9s5TPsLaPryL1xDXAPwU2vh
X-Proofpoint-GUID: lOlIiKPkn9s5TPsLaPryL1xDXAPwU2vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=912 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_025211_301916_74851326 
X-CRM114-Status: GOOD (  14.22  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

When hardware device group abstraction is introduced, QMI firmware
ready event of different devices in a group can be received simultaneously.

To indicate firmware ready event is completed for a particular device in a
group set a flag (ATH12K_FLAG_QMI_FW_READY_COMPLETE). This would be
helpful when hardware recovery is introduced for hardware device group
abstraction.

Add changes to set/unset ATH12K_FLAG_QMI_FW_READY_COMPLETE flag for a
device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  2 +-
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 12 +++++++++---
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 690896c1cca1..fd840a6a94e0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1140,7 +1140,7 @@ static void ath12k_core_reset(struct work_struct *work)
 	int reset_count, fail_cont_count;
 	long time_left;
 
-	if (!(test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))) {
+	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
 		ath12k_warn(ab, "ignore reset dev flags 0x%lx\n", ab->dev_flags);
 		return;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index e7238dab16a0..c747cc71984c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -210,6 +210,7 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_HTC_SUSPEND_COMPLETE,
 	ATH12K_FLAG_CE_IRQ_ENABLED,
 	ATH12K_FLAG_EXT_IRQ_ENABLED,
+	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 };
 
 struct ath12k_tx_conf {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 4028672864b3..66f50dae8dd6 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3023,6 +3023,8 @@ void ath12k_qmi_firmware_stop(struct ath12k_base *ab)
 {
 	int ret;
 
+	clear_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags);
+
 	ret = ath12k_qmi_wlanfw_mode_send(ab, ATH12K_FIRMWARE_MODE_OFF);
 	if (ret < 0) {
 		ath12k_warn(ab, "qmi failed to send wlan mode off\n");
@@ -3320,7 +3322,7 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			break;
 		case ATH12K_QMI_EVENT_FW_READY:
 			clear_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags);
-			if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
+			if (test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags)) {
 				if (ab->is_reset)
 					ath12k_hal_dump_srng_stats(ab);
 				queue_work(ab->workqueue, &ab->restart_work);
@@ -3330,8 +3332,12 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			clear_bit(ATH12K_FLAG_CRASH_FLUSH,
 				  &ab->dev_flags);
 			clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
-			ath12k_core_qmi_firmware_ready(ab);
-			set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+			ret = ath12k_core_qmi_firmware_ready(ab);
+			if (!ret) {
+				set_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE,
+					&ab->dev_flags);
+				set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+			}
 
 			break;
 		default:
-- 
2.34.1


