Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404D2C4167D
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Frth5Q4WlmdMLaYgFx6E8dXtWW97g4uFN3+LU7SR2nI=; b=xPE4PCSyWkHqMo
	Gq6fq5uUEp9fvsDdsEghTQtotPMF6I32xQhit8zJoVojf5U2OdMtC1JTjAaiOZ3tL+VPuCpa61Pl9
	aVxXbYrRji6DAcdAzS5e3Cp/qbxCY0As5Pq5p2ShU/3ZlDSj8E1TfAV0O3Grgu5bCOMTqr6lWZWzD
	RVJRTBtFwlq5cWTqnLlSCZve2PMkI5rFcCmpEpQKtUwrjrNkKaSgHHZM5FDyb9crFVaI+Hp7IT00I
	LCLKTlqn1ErNnDnSW+rsGJgrpS/SxA57vdK+zXunUjOL6fS8p6zJBP9w6sA8uv2LM08KFIuWaFrC5
	z5Q0tG7IYF2XPfoq13LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxajW-0048pS-2h
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 22:27:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxajT-0048oQ-2T
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 22:27:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39ULr0CD001615;
	Mon, 30 Oct 2023 22:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=SL/MIBA0mOd4tfJPcwrEwU/N9z4OCdpEnGMYOXXMVn8=;
 b=ll8xA4p0xH5kuWWtxc8imALYGT2miyBwNcMvQBPwNnoXGgMh8aOjeTVJLOr4zSw0ziMU
 ayPVWJsi9qKUcM6CUZ///ETm7syQMsLGqAkQYhbwE2Uwo3iIq3UtdOmENl8cf5nBQxj7
 dP9CgjKTUW8DFF0rQ3jm2eNPNo6d0PQ9snpLIM3Vhn1UmzJ36UTF7IvqQibBQ0A4CFi8
 XkVQ7Fp/rNPi6ItPDYELKViG+ThBCsyuWMuNk7Z6hmlKvgHpjFEaGrtSXNhegP4HcSvQ
 K9T1eyt20iJvSjHWcAezfy0AVfCh8b2Oq3UVTbYJX8P3Pg2fkDVhhDF8sjLpM7+dBDud XQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2b2qsjc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 22:27:38 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UMRbDP020547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 22:27:37 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 15:27:35 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH 02/13] wifi: ath12k: indicate NON MBSSID vdev by default during vdev start
Date: Tue, 31 Oct 2023 03:56:49 +0530
Message-ID: <20231030222700.18914-3-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1IBpsR_nV7lDX0791h39Dl_iVCkl8XPF
X-Proofpoint-ORIG-GUID: 1IBpsR_nV7lDX0791h39Dl_iVCkl8XPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 mlxlogscore=804
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_152740_151894_5621752C 
X-CRM114-Status: GOOD (  19.03  )
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

From: Sriram R <quic_srirrama@quicinc.com>

When any VDEV is started, MBSSID flags are passed to firmware to
indicate if its a MBSSID/EMA AP vdev. If the interface is not an AP
or if the AP doesn't support MBSSID, the vdev needs to be brought up
as a non MBSSID vdev. Set these flags as a non MBSSID AP by default
which can be updated as and when MBSSID support is added in ath12k.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 drivers/net/wireless/ath/ath12k/wmi.h | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fc0d14ea3..594aa18e7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5987,6 +5987,11 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;
 
+	/* Fill the MBSSID flags to indicate AP is non MBSSID by default
+	 * Corresponding flags would be updated with MBSSID support.
+	 */
+	arg.mbssid_flags = WMI_VDEV_FLAGS_NON_MBSSID_AP;
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
 		arg.ssid_len = arvif->u.ap.ssid_len;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 0e5bf5ce8..88ec77dee 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1024,6 +1024,7 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
 	cmd->regdomain = cpu_to_le32(arg->regdomain);
 	cmd->he_ops = cpu_to_le32(arg->he_ops);
 	cmd->punct_bitmap = cpu_to_le32(arg->punct_bitmap);
+	cmd->mbssid_flags = cpu_to_le32(arg->mbssid_flags);
 
 	if (!restart) {
 		if (arg->ssid) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8e1eda7aa..dfe9eb0cb 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2269,6 +2269,14 @@ struct ath12k_wmi_hal_reg_capabilities_ext_arg {
 	u32 high_5ghz_chan;
 };
 
+enum {
+	WMI_VDEV_FLAGS_NON_MBSSID_AP       = BIT(0),
+	WMI_VDEV_FLAGS_TRANSMIT_AP         = BIT(1),
+	WMI_VDEV_FLAGS_NON_TRANSMIT_AP     = BIT(2),
+	WMI_VDEV_FLAGS_EMA_MODE            = BIT(3),
+	WMI_VDEV_FLAGS_SCAN_MODE_VAP       = BIT(4),
+};
+
 #define WMI_HOST_MAX_PDEV 3
 
 struct ath12k_wmi_host_mem_chunk_params {
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
