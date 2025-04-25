Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BFCC369AB
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 01:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8q7p7/+7E+t4rVFcsV+1D+7rqxoPitw1YzY0CI1gFw=; b=TOVhTsTP39dtasT7wud7eievmu
	p9lwctt3gDpbz6Bg6vQMCT6mupRDh36/9t63NJXG2bBAyWv3k8Y5U1Q2vOimYWxHbnG7Bbst1Eb6x
	H91e2d1rFGarLyUTEoPzmn9okbKBfzxjGmjdULhcGf8FRcvG5oquYfunyCqC3Xcs1OzJZts+YXLto
	KITBhW1xpmU5RM5wsulNg8OkEZ+IoQPS4SEVSxzri1mJTdcgvN4lfVh0b+h57iCy7E4zBZBA7QPGX
	Zft3B58iZLxhMsksDt/I0lnyQaPPrLXF44hJvnX2+CRm9ZAVM9ruQ7RRlxRyph/4COjvRoiXzxUBW
	YPOaQS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rp-0000000FhJI-1l3n;
	Fri, 25 Apr 2025 01:28:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rn-0000000FhIT-12ue
	for ath12k@lists.infradead.org;
	Fri, 25 Apr 2025 01:28:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17Ml5003553
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=y8q7p7/+7E+t4rVFcsV+1D+7rqxoPitw1YzY0CI1gFw=; b=FE
	F1Lc+K3M9aQYrwt02BXEruPt6ReNbnxutTD8fLzCfxRcOwV5AwsYJvWneiqMaTsm
	Nm3ZI4KL+uAVwZeutrHTe8iPyJ4AVX8n75uW/c7JAHura+vdhHwUlGaX1vx5qI78
	ygtrJPbXnrIQCm2Hu78uBps7RjtJZ+tfNDKXq4WrDGSbdHZhyK3O+CuVsLe46Miy
	vv76rGaBi20CsJJ5aDP/JSxJrvIlMqFh9XgsG1J2rnmxyuK7+EFrNXa63wj2DgoK
	tioUD7iTtWe6K5OvOYAC45C5CF5DOfv18ZsVLKUH9TlIf/J+oAKXwTJYBp52OKtC
	1OUpISwMhpvfBgowOKeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0q8vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-306b590faaeso1371655a91.3
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 18:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745544513; x=1746149313;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8q7p7/+7E+t4rVFcsV+1D+7rqxoPitw1YzY0CI1gFw=;
        b=fEYGwdJhAtYEMHXxLBcJQSv6WntdmoL5tb7V1zSYRS+63/2DcXtzQyLMRXl122tUqS
         ORNh6ZoHLA2OSYEQXRIBMQRvyE5gMYJBg+8D9wgZA1bgDudlWRT1w3I+V3hjr767EAy5
         UK92qhNja5sNVScuUqwJKhIj/tgGqBFRXJXvgGZ6R0Xqt3GrVBI1Z7Tm6K26Xv/vkFWy
         GyRzRHlE76gEjInQ0AXn2S/iphJrYWoJyGJ1JbeM5gNPakmjLmy1X9cnikV1amsrv0gP
         bwH1mFIov63Is3TUAkKVOL4q4sWI5Xy6H64LHhNhbxEPBvj0RNNMEHr9ZGJ5cne3w+0e
         bpGQ==
X-Gm-Message-State: AOJu0YziR/BCYB9gnzcgnG1+cx3o2U6PJieTJtkbQoSN3ENLGY9CX1D0
	Ne7+XrWUiZXyNESRW69nFx4fkttJtTJ72FLu9uDiDezRV943CR024o1uAskIhB7rlvHQJU4oXmV
	a5Src2xEe07HPLJRDgJZ6dWTH6jrHPdcQdCAD6yUd1npXL9Qee78z2+RqVt3ylqR4Dpiq
X-Gm-Gg: ASbGncsUIWC2SUgBVyY+0smh7RfnebXoD0GjnYrxOH4ng60SH3Ndbi/EjIp5EzI/NLR
	gcx0M6yU6zEvXvs1ZfQKUTArs7dRjyaGyDbhuM5vZv9TX++k5WAVbBWI2SSBUf1mtozkz/pKciL
	c1tcRs+b8ln6aXLSL43NDvc4JwXsbtCmCr2OpS4XYWdGKDq9a8JiBXxY0P9252rYFqy68E3ALvA
	lXsvoU3vbBXQcLmqsNKBVpAiD/lf2lcT46KXjPmTUZd5Icd4T7uiM+SA9CF40aRhdPMuOUI/k+p
	bxH4IYUrNgcuNLsFuujmFXhkHUp6YGQ04G6SOGaUQOPRn5k/V1vqTMjqKemU+DZ0I+76dns+O8V
	HLrX4WJmJk8ptQhiZ0vH5f3zgy1RtOB8ibH2/T/DrsoddUg==
X-Received: by 2002:a17:90b:37ce:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-309f7d9a9c4mr1083967a91.2.1745544512573;
        Thu, 24 Apr 2025 18:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEeBi9iuqdUjtRdn47ocOfM8w0ewxFwFyL96EUBBHyUrpBsm2jB08sqM8gpFY2vKQaFlUwIw==
X-Received: by 2002:a17:90b:37ce:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-309f7d9a9c4mr1083925a91.2.1745544511957;
        Thu, 24 Apr 2025 18:28:31 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb1asm2160107a91.7.2025.04.24.18.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 18:28:31 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vinith Kumar R <quic_vinithku@quicinc.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 3/3] wifi: ath12k: print device dp stats in debugfs
Date: Fri, 25 Apr 2025 06:58:02 +0530
Message-Id: <20250425012802.698914-4-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NfxQ7GMPtYDnNBIpbRFzlhT1mUD0on5D
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680ae542 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=PwApztsl_qjy-5aDgfcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NfxQ7GMPtYDnNBIpbRFzlhT1mUD0on5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwOCBTYWx0ZWRfX86SSVPsEVKDf TLrFFsfY6EZZmf1gKZD4oaX2UhvBbs/OvMrWun6gLJZNG6sK8wEAUXfeaUWUwCAnTcgQd75qXpa 3AR0/Ae8dZyh6F+QUdY/pFTa8jrt4nqxzIMKBNCEl3ssnvGrRQSJCdQDiv9fppEpzEAdbgBinVn
 0QCM+p+8mdfjVGhKVxIhgJVcOwCcPUSmjAkuVXt7nPsV2ii4FUZscekLFYi09uPy59E11kMfFS9 q7VufmtzRvdYZhRBN/8Wa7L05LoYkboUXwNWo2okNt8HrOfpYs2tBNp0+1brZdiJ1hQ6iwjeCfb nh7SUdUjPIK9IPaezgc1jq9mpxPDIPo6l8qrXi2Q/oSevaJAUJx2VQq4f8HmePaeBoHZeqi4Smc
 TFlYG6aPnya2zI9N+aDxSBuU4RaW0ez6fB/CLHn07UEBNJnnEyJqjjEUaGrj2ATsiuN3Jgr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_182835_422269_8EA5AF30 
X-CRM114-Status: GOOD (  16.48  )
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

From: Vinith Kumar R <quic_vinithku@quicinc.com>

Print the data path related device specific stats in debugfs.
These device_dp_stats are exposed in the ath12k debugfs directory.

Output of device_dp_stats:
root@CDCWLEX0799743-LIN:/home/qctest#
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/device_dp_stats
DEVICE RX STATS:

err ring pkts: 0
Invalid RBM: 0

RXDMA errors:
Overflow: 0
MPDU len: 0
FCS: 0
Decrypt: 0
TKIP MIC: 0
Unencrypt: 0
MSDU len: 0
MSDU limit: 0
WiFi parse: 0
AMSDU parse: 0
SA timeout: 0
DA timeout: 0
Flow timeout: 0
Flush req: 0
AMSDU frag: 0
Multicast echo: 0
AMSDU mismatch: 0
Unauth WDS: 0
AMSDU or WDS: 0

REO errors:
Desc addr zero: 0
Desc inval: 0
AMPDU in non BA: 0
Non BA dup: 0
BA dup: 0
Frame 2k jump: 0
BAR 2k jump: 0
Frame OOR: 155
BAR OOR: 0
No BA session: 0
Frame SN equal SSN: 0
PN check fail: 0
2k err: 0
PN err: 0
Desc blocked: 0

HAL REO errors:
ring0: 0
ring1: 0
ring2: 0
ring3: 0
ring4: 0
ring5: 0
ring6: 0
ring7: 0

DEVICE TX STATS:

TCL Ring Full Failures:
ring0: 0
ring1: 0
ring2: 0
ring3: 0

Misc Transmit Failures: 0

tx_wbm_rel_source: 0:986 1:0 2:0 3:57 4:0

tqm_rel_reason: 0:1043 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0 12:0 13:0 14:0

fw_tx_status: 0:57 1:0 2:0 3:0 4:0 5:0 6:0

tx_enqueued: 0:329 1:145 2:464 3:105

tx_completed: 0:329 1:145 2:464 3:105

radio0 tx_pending: 0

REO Rx Received:
Ring1:  0:201   1:0     2:0
Ring2:  0:0     1:0     2:0
Ring3:  0:6152  1:0     2:0
Ring4:  0:9     1:0     2:0
Ring5:  0:0     1:0     2:0
Ring6:  0:0     1:0     2:0
Ring7:  0:0     1:0     2:0
Ring8:  0:0     1:0     2:0

Rx WBM REL SRC Errors:
TQM:    0:0     1:0     2:0
Rxdma:  0:0     1:0     2:0
Reo:    0:155   1:0     2:0
FW:     0:0     1:0     2:0
SW:     0:0     1:0     2:0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |   2 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 199 +++++++++++++++++++++-
 2 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 2cfeb853289d..5203d94c8b10 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -789,6 +789,8 @@ static int ath12k_core_soc_create(struct ath12k_base *ab)
 		goto err_qmi_deinit;
 	}
 
+	ath12k_debugfs_pdev_create(ab);
+
 	return 0;
 
 err_qmi_deinit:
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 1f0983c33885..dd624d73b8b2 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -103,12 +103,6 @@ static const struct file_operations fops_simulate_fw_crash = {
 	.llseek = default_llseek,
 };
 
-void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
-{
-	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
-			    &fops_simulate_fw_crash);
-}
-
 static ssize_t ath12k_write_tpc_stats_type(struct file *file,
 					   const char __user *user_buf,
 					   size_t count, loff_t *ppos)
@@ -1027,6 +1021,199 @@ void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
 			    &ath12k_fops_link_stats);
 }
 
+static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
+						   char __user *user_buf,
+						   size_t count, loff_t *ppos)
+{
+	struct ath12k_base *ab = file->private_data;
+	struct ath12k_device_dp_stats *device_stats = &ab->device_stats;
+	int len = 0, i, j, ret;
+	struct ath12k *ar;
+	const int size = 4096;
+	static const char *rxdma_err[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX] = {
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_OVERFLOW_ERR] = "Overflow",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_MPDU_LEN_ERR] = "MPDU len",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_FCS_ERR] = "FCS",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_DECRYPT_ERR] = "Decrypt",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_TKIP_MIC_ERR] = "TKIP MIC",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_UNECRYPTED_ERR] = "Unencrypt",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_MSDU_LEN_ERR] = "MSDU len",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_MSDU_LIMIT_ERR] = "MSDU limit",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_WIFI_PARSE_ERR] = "WiFi parse",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_PARSE_ERR] = "AMSDU parse",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_SA_TIMEOUT_ERR] = "SA timeout",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_DA_TIMEOUT_ERR] = "DA timeout",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_FLOW_TIMEOUT_ERR] = "Flow timeout",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_FLUSH_REQUEST_ERR] = "Flush req",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_FRAG_ERR] = "AMSDU frag",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_MULTICAST_ECHO_ERR] = "Multicast echo",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_MISMATCH_ERR] = "AMSDU mismatch",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_UNAUTH_WDS_ERR] = "Unauth WDS",
+		[HAL_REO_ENTR_RING_RXDMA_ECODE_GRPCAST_AMSDU_WDS_ERR] = "AMSDU or WDS"};
+
+	static const char *reo_err[HAL_REO_DEST_RING_ERROR_CODE_MAX] = {
+		[HAL_REO_DEST_RING_ERROR_CODE_DESC_ADDR_ZERO] = "Desc addr zero",
+		[HAL_REO_DEST_RING_ERROR_CODE_DESC_INVALID] = "Desc inval",
+		[HAL_REO_DEST_RING_ERROR_CODE_AMPDU_IN_NON_BA] =  "AMPDU in non BA",
+		[HAL_REO_DEST_RING_ERROR_CODE_NON_BA_DUPLICATE] = "Non BA dup",
+		[HAL_REO_DEST_RING_ERROR_CODE_BA_DUPLICATE] = "BA dup",
+		[HAL_REO_DEST_RING_ERROR_CODE_FRAME_2K_JUMP] = "Frame 2k jump",
+		[HAL_REO_DEST_RING_ERROR_CODE_BAR_2K_JUMP] = "BAR 2k jump",
+		[HAL_REO_DEST_RING_ERROR_CODE_FRAME_OOR] = "Frame OOR",
+		[HAL_REO_DEST_RING_ERROR_CODE_BAR_OOR] = "BAR OOR",
+		[HAL_REO_DEST_RING_ERROR_CODE_NO_BA_SESSION] = "No BA session",
+		[HAL_REO_DEST_RING_ERROR_CODE_FRAME_SN_EQUALS_SSN] = "Frame SN equal SSN",
+		[HAL_REO_DEST_RING_ERROR_CODE_PN_CHECK_FAILED] = "PN check fail",
+		[HAL_REO_DEST_RING_ERROR_CODE_2K_ERR_FLAG_SET] = "2k err",
+		[HAL_REO_DEST_RING_ERROR_CODE_PN_ERR_FLAG_SET] = "PN err",
+		[HAL_REO_DEST_RING_ERROR_CODE_DESC_BLOCKED] = "Desc blocked"};
+
+	static const char *wbm_rel_src[HAL_WBM_REL_SRC_MODULE_MAX] = {
+		[HAL_WBM_REL_SRC_MODULE_TQM] = "TQM",
+		[HAL_WBM_REL_SRC_MODULE_RXDMA] = "Rxdma",
+		[HAL_WBM_REL_SRC_MODULE_REO] = "Reo",
+		[HAL_WBM_REL_SRC_MODULE_FW] = "FW",
+		[HAL_WBM_REL_SRC_MODULE_SW] = "SW"};
+
+	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
+
+	if (!buf)
+		return -ENOMEM;
+
+	len += scnprintf(buf + len, size - len, "DEVICE RX STATS:\n\n");
+	len += scnprintf(buf + len, size - len, "err ring pkts: %u\n",
+			 device_stats->err_ring_pkts);
+	len += scnprintf(buf + len, size - len, "Invalid RBM: %u\n\n",
+			 device_stats->invalid_rbm);
+	len += scnprintf(buf + len, size - len, "RXDMA errors:\n");
+
+	for (i = 0; i < HAL_REO_ENTR_RING_RXDMA_ECODE_MAX; i++)
+		len += scnprintf(buf + len, size - len, "%s: %u\n",
+				 rxdma_err[i], device_stats->rxdma_error[i]);
+
+	len += scnprintf(buf + len, size - len, "\nREO errors:\n");
+
+	for (i = 0; i < HAL_REO_DEST_RING_ERROR_CODE_MAX; i++)
+		len += scnprintf(buf + len, size - len, "%s: %u\n",
+				 reo_err[i], device_stats->reo_error[i]);
+
+	len += scnprintf(buf + len, size - len, "\nHAL REO errors:\n");
+
+	for (i = 0; i < DP_REO_DST_RING_MAX; i++)
+		len += scnprintf(buf + len, size - len,
+				 "ring%d: %u\n", i,
+				 device_stats->hal_reo_error[i]);
+
+	len += scnprintf(buf + len, size - len, "\nDEVICE TX STATS:\n");
+	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
+
+	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
+				 i, device_stats->tx_err.desc_na[i]);
+
+	len += scnprintf(buf + len, size - len,
+			 "\nMisc Transmit Failures: %d\n",
+			 atomic_read(&device_stats->tx_err.misc_fail));
+
+	len += scnprintf(buf + len, size - len, "\ntx_wbm_rel_source:");
+
+	for (i = 0; i < HAL_WBM_REL_SRC_MODULE_MAX; i++)
+		len += scnprintf(buf + len, size - len, " %d:%u",
+				 i, device_stats->tx_wbm_rel_source[i]);
+
+	len += scnprintf(buf + len, size - len, "\n");
+
+	len += scnprintf(buf + len, size - len, "\ntqm_rel_reason:");
+
+	for (i = 0; i < MAX_TQM_RELEASE_REASON; i++)
+		len += scnprintf(buf + len, size - len, " %d:%u",
+				 i, device_stats->tqm_rel_reason[i]);
+
+	len += scnprintf(buf + len, size - len, "\n");
+
+	len += scnprintf(buf + len, size - len, "\nfw_tx_status:");
+
+	for (i = 0; i < MAX_FW_TX_STATUS; i++)
+		len += scnprintf(buf + len, size - len, " %d:%u",
+				 i, device_stats->fw_tx_status[i]);
+
+	len += scnprintf(buf + len, size - len, "\n");
+
+	len += scnprintf(buf + len, size - len, "\ntx_enqueued:");
+
+	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+		len += scnprintf(buf + len, size - len, " %d:%u", i,
+				 device_stats->tx_enqueued[i]);
+
+	len += scnprintf(buf + len, size - len, "\n");
+
+	len += scnprintf(buf + len, size - len, "\ntx_completed:");
+
+	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+		len += scnprintf(buf + len, size - len, " %d:%u",
+				 i, device_stats->tx_completed[i]);
+
+	len += scnprintf(buf + len, size - len, "\n");
+
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ath12k_mac_get_ar_by_pdev_id(ab, DP_SW2HW_MACID(i));
+		if (ar) {
+			len += scnprintf(buf + len, size - len,
+					"\nradio%d tx_pending: %u\n", i,
+					atomic_read(&ar->dp.num_tx_pending));
+		}
+	}
+
+	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
+
+	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
+		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
+
+		for (j = 0; j < ATH12K_MAX_DEVICES; j++) {
+			len += scnprintf(buf + len, size - len,
+					"\t%d:%u", j,
+					 device_stats->reo_rx[i][j]);
+		}
+
+		len += scnprintf(buf + len, size - len, "\n");
+	}
+
+	len += scnprintf(buf + len, size - len, "\nRx WBM REL SRC Errors:\n");
+
+	for (i = 0; i < HAL_WBM_REL_SRC_MODULE_MAX; i++) {
+		len += scnprintf(buf + len, size - len, "%s:", wbm_rel_src[i]);
+
+		for (j = 0; j < ATH12K_MAX_DEVICES; j++) {
+			len += scnprintf(buf + len,
+					 size - len,
+					 "\t%d:%u", j,
+					 device_stats->rx_wbm_rel_source[i][j]);
+		}
+
+		len += scnprintf(buf + len, size - len, "\n");
+	}
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, len);
+
+	return ret;
+}
+
+static const struct file_operations fops_device_dp_stats = {
+	.read = ath12k_debugfs_dump_device_dp_stats,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
+{
+	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
+			    &fops_simulate_fw_crash);
+
+	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
+			    &fops_device_dp_stats);
+}
+
 void ath12k_debugfs_soc_create(struct ath12k_base *ab)
 {
 	bool dput_needed;
-- 
2.17.1


