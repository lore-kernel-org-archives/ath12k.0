Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6CAE77197
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 04:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KABFMgdQguKH6sy8WkqGX7JMdnr+PcCvmml3+ddYV4Q=; b=smLwAa6c3nqjaRiVrFz2/mr8o5
	sFZacMLiaLunOWGCpZRh1oMmECVxcKlFsghmojPfjJI5CzkH6lx1go162nWUnX5LnFqKzvfqyRgl/
	rQS3uprYPJJkKh7sYZXA1bYg3Za+JUHcXGhvKQsuwW3NsydF660zNv2OmNmShrKVIXHrIwMgtUz0+
	xWGZGBd8o0otLACkQkRsbLips6DBy39Oc8eNK7eDOh6Pk/JinWbaEdt7O6v8Z2wdTAEaToPGjtC70
	VQ1MiT4w1qRHVELtMOoc8wrT3xgKXugC3f5XcdM0gjGs8rMSWQ1oDOuwnteVKm/kEdJPJ7DG/Q+4J
	JB/m/0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV10n-00000003SBN-3qIu
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 04:16:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0n4-00000003QVK-36Gc
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 04:02:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506E4dDV018489;
	Tue, 7 Jan 2025 04:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KABFMgdQguKH6sy8WkqGX7
	JMdnr+PcCvmml3+ddYV4Q=; b=Ynz/8OxTibqfeCY7bonsMrixz25P7idjaVgoiz
	E57BgXdoGa7jOBmzIB7DhrVB3bda2barq0AMfOqQ2vH2drR0bnwoTL4fFXS8Vu4x
	HFhuBPA9OH8XsF/0b2K2xBNIWq8qBpNFsU6yfGk5RilLTh4UMCR6ZFWLOut4QWD4
	Jmpk4nyluMVSfwJGktACsJ36m4WzBJZvENOzEMM4pcpC1OyyvJIcirikdfwLeMll
	zbgPGznMOSsDiOTdnLWGm9upbZ3bsoGNfBIodvF9MIxf3cxO2cBf2+xXDymjqOgQ
	CiBQSqcGFGx5J0fFs5pvujW9PopJDQO8iNjJHcgdlIX/1MJw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440gmc1p42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 04:01:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50741ufT023199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 04:01:56 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 20:01:51 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Tue, 7 Jan 2025 09:31:39 +0530
Subject: [PATCH] wifi: ath12k: encode max Tx power in scan channel list
 command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250107-add_max_reg_pwr_in_scan_ch_list_cmd-v1-1-70d9963a21e4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACKnfGcC/x3NWwqDMBCF4a3IPDeQxF5styIyhGQ0AzXKpFSLZ
 O9N+/jB4fwHZBKmDI/mAKE3Z15ShTk14KNLEykO1WC1vWijr8qFgLPbUWjCdRPkhNm7hD7ik/M
 L/RzUrbV0H88tdZ2B+rQKjbz/K/1QHetwkc8vWkr5AlfJjQKEAAAA
X-Change-ID: 20250106-add_max_reg_pwr_in_scan_ch_list_cmd-732e9f43e881
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Bhagavathi Perumal S
	<quic_bperumal@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>,
        Balamurugan Selvarajan
	<quic_bselvara@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Wen Gong
	<quic_wgong@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Sathishkumar
 Muruganandam" <quic_murugana@quicinc.com>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NKGu2jEQ1USuon3PRvlwLmW2-If7AcMs
X-Proofpoint-ORIG-GUID: NKGu2jEQ1USuon3PRvlwLmW2-If7AcMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_200202_938636_D3FEF2C2 
X-CRM114-Status: GOOD (  12.32  )
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

From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>

Currently, when sending the scan channel list command to the firmware, the
maximum Tx power is not encoded in the reg2 member. This omission causes
the firmware to be unaware of the host's maximum Tx power, leading to
incorrect Tx power derivation at firmware level.

To resolve this issue, encode the maximum Tx power in the scan channel list
command before sending it to firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 562b0615ed065d094f5d7709cafeb22c41f02d17..69f661a867bc295deeb6632dfa96d63c39234b07 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -2794,6 +2794,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
 						  WMI_CHAN_REG_INFO1_REG_CLS);
 			*reg2 |= le32_encode_bits(channel_arg->antennamax,
 						  WMI_CHAN_REG_INFO2_ANT_MAX);
+			*reg2 |= le32_encode_bits(channel_arg->maxregpower,
+						  WMI_CHAN_REG_INFO2_MAX_TX_PWR);
 
 			ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 				   "WMI chan scan list chan[%d] = %u, chan_info->info %8x\n",

---
base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
change-id: 20250106-add_max_reg_pwr_in_scan_ch_list_cmd-732e9f43e881


