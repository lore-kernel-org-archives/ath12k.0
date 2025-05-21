Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395F2C2D0CD
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL3+vydyMIJ1To8zYn3AtbMFpeDybXOzCHGE6ghysnc=; b=N5pVycVLD33Mq6A0G2ZEY5+FTP
	KFjFZSwWrsmJd8Y/kTymO0qtR7AsCe39dVoNauk2zzhC6iWY2DjVDeG6WSGaOBeiB/wpajMhnwKEn
	9m19Lyd6j/FO6gGd+Qb+vkG/dZIxUshngxPlubxCP5Bq61ylk78tVC20MlT30iBeF10xfd/0rQwwR
	2aYU7H63gm6FRAggJQAjZ0Yajq4NiFE3grTR6V0jniD3Zhdj2NAAj/XKDBJIDExSR5FpKbSEZyZY/
	zmCsdZs2uEorDyXhBFRPSxHUvtMixA8xl1q+8BNylfDQ0qQl11nfwIAPh+/fvr/rJkYNmYv1FnsHp
	WX5OJb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmnD-0000000GWmO-3nVs;
	Wed, 21 May 2025 16:59:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmnC-0000000GWlO-0URa
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 16:59:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XnWE016898
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WL3+vydyMIJ1To8zYn3AtbMFpeDybXOzCHGE6ghysnc=; b=CJiyUde9WmTIwT+Z
	VhlDJwHgGE8NcP284SxFISm4AlBD4mcS4RktaKJFd+gc0LI6FfRHwobFlG8MpLyA
	xsCyEqHIjL8D1dcsDGh2aU7HFWXaMmt2Q6lzrM2rGeyjW1Gu/rgV8JHCRb7mIQHW
	ms8IS826A3NhR+bWK/V+jwOAY+RwxFiQ4wqN7yFk8Ho3S0Ku1itEH+QGLRLlMjUU
	8k3AWwBVYYZE4S/REi4yoT7SLodsD0M3+e4G/x/1KIes9I1w2F+0rgYeyGMaKQ+q
	NSu8452wEs1rBkWm4A+VP57LE1zMer5urgywg8k8mxSGx4UJPuKQrSFO7rvh8DU/
	gHjKmQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9up9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30c50f130d9so6143721a91.1
        for <ath12k@lists.infradead.org>; Wed, 21 May 2025 09:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846784; x=1748451584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL3+vydyMIJ1To8zYn3AtbMFpeDybXOzCHGE6ghysnc=;
        b=H2uuBbtQlDZza6rg7yS5TUiUSIvSWAlgd+pqUld29zZpEqjHUFEqV2ZlJMnObB7i0w
         SgocVtO3MH3gaIsBwepYE2XxqGWef4n1mVZXSDnExDnBwI49wcdBrZJJZKi/0VnA2x0x
         6QymVXwsVjkjtlBykyo99sYK90slqM/PAmOccbDBkCzEzjQVezFQbymAST0AaJRclLKm
         bYQFvKOz4fu17wECuMNLKn2STdgBMeiFfeDffeKzw3XwCFbNSaW1TAEQmLDSxQbTAmaV
         YKOc1v1VC2plHgidBBFCUuAsgMWknVgY7bInZMfb/5bGLDi2RPIi3JZvc15xf+Y+WM8n
         D02g==
X-Forwarded-Encrypted: i=1; AJvYcCUUpfUVd7ip4MoE+bbRgMRMGqCca01yK55XXrnYlJeluaXSm9pYr22oWUr3t2+7Y+6J/zQ63VQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz60dVX249c2A0A5LIEeMRdKWVxv2F89g3Ub0IhvmSVaT4OkqJ6
	ILz4GqMDTgRuikkxQTjvgFEP+/+Kwa/rpjNG27kr/dpO8GyC2q2lGtiUuHgLS9jTrB+lJpJ3LxC
	3sIBxcVnwTYlqyy1OTdPys468wf/DTiJX6/Flfw1dsh8T4Xyb5NYa14KlddQT6gt+ba0A7BWW
X-Gm-Gg: ASbGncv6Gjm1JrIzacbGKEg9aldD/fpOKVJGZMQBPMh8XO1ykM8pG7quUwW7d86cCK9
	9IypRk3+4NTBTIQftRvXbmI0NHmKQto4qU3wHUHka07fKE4z91NC9/Te7UH1yOh6qyoCDSmdpo1
	CNf1+0b5njcPV66ReHdMkcXa0kS9R+/nzjM8bfoOl3tkD6mBnr/2WdclUOQ0bSElGp5DD1k5Tfi
	90LJzSgYsjLG56pSX8h8Odr5XEysSu8ovmjlGbhe6c4GccWjgiBRWt6lSceRLqkePP5ovHiwm3z
	kUVyvFIdXgsJ6ZgcCn++o9mCGDUeb7P7av99G9gpAG95PGidsQumUoqCpjMoWLYt2Wzl3GNCqpF
	lJwKHeB0UTiyV0NtVpFeuebrVy4HmXlvZ5wx3
X-Received: by 2002:a17:90a:fc4f:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30e83216290mr25433519a91.23.1747846783513;
        Wed, 21 May 2025 09:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL5e8jDdzNZMMd0TV5+CNwRTfOM/yevICECgWpAkW79RdU2B9pfHaXPHxgwINBivapixqfUQ==
X-Received: by 2002:a17:90a:fc4f:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30e83216290mr25433481a91.23.1747846783123;
        Wed, 21 May 2025 09:59:43 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:42 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 21 May 2025 22:29:30 +0530
Subject: [PATCH ath-next 2/3] wifi: ath12k: fix regdomain update failure
 when adding interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-2-9737de5bf98e@oss.qualcomm.com>
References: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
In-Reply-To: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682e0681 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zyJjCoAm0S0MJ9WaK7cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: db796xfq3NvplMcq9vx8-yHUZIGUaXZu
X-Proofpoint-GUID: db796xfq3NvplMcq9vx8-yHUZIGUaXZu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX1Q0HZgmliLvt
 ab3j5CPaFQ1CgyVOWNz2/aIvBZkmadQHPtwUMFHhkYhjJSvXrxj5egRscaZIM0YWwHjzAJoyWwS
 MFozRblBwFYh8GBpyiru+lGeJK96tq9CKk6rCeM/IMrq/6wtWILk6ZcIitRPUeicmi9dddf4vzn
 OfM4jYxNtaPStDHxyx2hMoSTkW6Q7B6ZMyQyM25V4oedAFZEbmNviqfX58omCDgPfV3yBaf8BRx
 onsb6XaV5aXS9QyT+pI6ZAJnGU8dh0Z5XT31/Ze4tE8t8LDCPn+84H1yX2yYLw/BVMEUtpulw1M
 QmOx1Zfsi9jvb/P7zw68h3hBFnu76D+936PqRatar9LTijwb3m6nCPxm2RDiRp2K1sYQZyZ0SWk
 0J3Q/dRKi3PHmUns1lKHfjXoa6OkpnEnctUs0BjQ7BPnwpA2rdv4WS13VzXf4wxHGbIZ4yuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_095946_305201_885A0008 
X-CRM114-Status: GOOD (  16.64  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

Commit 4c546023d71a ("wifi: ath12k: update regulatory rules when interface
added"), introduced a call to ath12k_reg_handle_chan_list() during
interface addition to update the regulatory domain based on the interface
type. While this works initially, subsequent updates (e.g., after an
interface delete/re-add cycle) fail because ah->regd_updated is never
reset.

To address this, reset ah->regd_updated before calling
ath12k_reg_handle_chan_list() to allow the update to proceed.

However, this change exposes another issue: a timeout occurs when waiting
for the 11D scan to complete, as seen in the log:
    ath12k_pci 0000:05:00.0: failed to receive 11d scan complete: timed out

This happens because during interface down, ar->state_11d is set to
ATH12K_11D_PREPARING, and during interface up, the host waits for
ar->completed_11d_scan even though the scan hasn't started yet.

Fix this by updating the wait condition to check for ATH12K_11D_RUNNING,
which is the only state where a scan complete event is expected.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 4c546023d71a ("wifi: ath12k: update regulatory rules when interface added")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 drivers/net/wireless/ath/ath12k/reg.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 81ff32d2ce5afce582b78c17fbdf5082e4394798..755546246915cb355fc6f40fef85a87b880e2f91 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8833,6 +8833,7 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 		ab = ar->ab;
 		reg_info = ab->reg_info[ar->pdev_idx];
 		ath12k_dbg(ab, ATH12K_DBG_MAC, "interface added to change reg rules\n");
+		ah->regd_updated = false;
 		ath12k_reg_handle_chan_list(ab, reg_info, ahvif->vdev_type,
 					    IEEE80211_REG_UNSET_AP);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 2134e72e0812b2a0bdc537ace456ef7af1db0726..2598b39d5d7ee9b24ad8ed5d6de1bc5bbc6554e0 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -139,7 +139,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 	int num_channels = 0;
 	int i, ret, left;
 
-	if (wait && ar->state_11d != ATH12K_11D_IDLE) {
+	if (wait && ar->state_11d == ATH12K_11D_RUNNING) {
 		left = wait_for_completion_timeout(&ar->completed_11d_scan,
 						   ATH12K_SCAN_TIMEOUT_HZ);
 		if (!left) {

-- 
2.34.1


