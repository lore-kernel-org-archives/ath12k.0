Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E81BCD4F26
	for <ath12k@archiver.kernel.org>; Fri, 19 Jun 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zgx9wN4RH5WyeVxVnM5MXT21ptHceSoyFLQAA2pSnvk=; b=NVDdVab0IgvCVj0sQaCHkkeQSo
	m6DshtTTurhWsBh+o6wO1JtG2bjPTDS1wC0q+/s/qUe/+4RJfqM7Ym/Qbzl+sdcZlXcAJEx9Pl7lP
	2orCfIRc1s+WqxVIyY+HPdDV36GMWjRtD8lC0WnP1GRhik9HLPwOnfglIrrwCB4kMmelkQvevjlB1
	gQARbYaV/4k19hynR0wEProOECTtTH7apLbq5pzNRWXswEZR2MLCUjbzKqgqxcEHGN+B3g/stcfBo
	u0q/ugqlQlBGXrnL3Dk3dMVb7byy+yWnDccR/nIN8ZkEFOigqGy2qJJc8rmojx8c/o2lq0ayk6tTA
	aQjZc9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waY0v-00000002Mwv-2MG7;
	Fri, 19 Jun 2026 12:08:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waY0t-00000002MwX-1n6r
	for ath12k@lists.infradead.org;
	Fri, 19 Jun 2026 12:08:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Ova53659939
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zgx9wN4RH5WyeVxVnM5MXT21ptHceSoyFLQ
	AA2pSnvk=; b=kWLAJ09lLu8+BuBzTeLlKhj39C8yByDraaboiCm5Xi364E7VClv
	IxDCIPzq4A4opb5jrmkQ5AvzXwKjOsuzkCPNBplbhXxJeWUkiI6ELtLqh2kTLDWb
	dQ1caKnl02Rpn4udBjDo97ORRYjGURDtywr5UzaryBNs96en2CX3emrN3lw3pxIK
	df6143VOAI0xB9BAknxzWOOhkO4RpIfjySxnGiO9T3RTRiY9ITcvOAnULP3W7l9l
	domo36uY0yV/I0dnhDWSMTmdR3JBXrkS+3SL2BAxf2JpM9bt0vY2Jmmh0F4K7lzS
	JnxBleGrhWisdZ+tmHqw5gKRO/QwPbZ0Tsg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evy72h3ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 12:07:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so19910585ad.1
        for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781870878; x=1782475678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgx9wN4RH5WyeVxVnM5MXT21ptHceSoyFLQAA2pSnvk=;
        b=jBIBVnoOfsXhlRpU8a5jASJ/is6q99OcoUndbOnDX8uvP53R0cuvvbKgGlRq0I5rax
         RWRwEXZxTpOuiSdwfvVX3o9gm97JTQ/S51Qm5DOIJv9w9MT9M3KyON6yiBusfLxpJjRG
         CKDUtgIIOhx5SGtCk+bIvN3gVdSJxn0Mda8tS8RxK6gXzrm1djLPT76ZMiwvIORvpelb
         npmtcGPs7qS6lP+VaheT037kX9oFlQ+njyNX1cXBbzbFjHJjJHuX9KK93y3p5L2A5VHm
         0xfYzVviBBYh0ixvo1wMCeex5aoPiyaOKSQKr1g6tIVHwIuyCICahbZdQ3WO8h6jWP1W
         lo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781870878; x=1782475678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgx9wN4RH5WyeVxVnM5MXT21ptHceSoyFLQAA2pSnvk=;
        b=Dw5nUakdOr7jTWD6ldO/dIx0mXQ4DtVS6aR+Irqce1uwqen4/sfqxhMdOxlqsOVT0r
         6YKqjy537ax734eFi/TE3dT67v4jCOh5Ee6IZu/jk82z9Q/8d5nGT/Lat0T+H++HiNcC
         +3/HdMAK2t5EgmGzWWcy8zQMCMCEXnOkzt5Xu1tges9qOk0wyZoBw6vzmQmKr+9Q7lsK
         usS7/HhHeG87h96zm7B+d1+LoNay1b+EutY8vwiTLGu3UUb84dqJ24v0RIlw+lkp5V+C
         svq3hYRwfOL1v76BvQl0lxeww8mTapAMBXwVnczozx40LaguckqxI8gwYPpXMxY6udmd
         Swgw==
X-Gm-Message-State: AOJu0Yz1p5zrGPnMGeWaGSDN1vVk0Gydy1NA+j5L7zosNmtDa8se9WCC
	xl6LsOHRvLrYCJ4PphxQvgU8c1ojnYD9Zm+RVQ+BjE54adXRSREHtGKzwSmOYcxiqHjyP/a1cTI
	pF4BT8pGpBYYpYqbW2J3ZzafuPujI/wZkfO1Dbhfv46RF70aARAvZLI7fx1ywPJ54u1vIOWGp
X-Gm-Gg: AfdE7cnM7LkTjP7TTsGW3IzumEis5HkTpUUl4rnO7yoh3KyK5sscvjeA/0VxX9hEkl4
	nRTdnc7EbDaB6uAMYMn5NfxurMZU66aUxf+yNxekB9f0mYIGcdmbAYS7dE1UYSnIjUZPrEJ5CFg
	pcuawXLYO/J+I/aTrwgFzlH3WYUiOs/vz/0rABgBEVYLqoN7cHExX68C2HrQNwJ6jf058L+u8Ww
	j7iknHDZofqTa68PDRWMLE+amYHN4bRi6bpvobfagREHoLgSOmcQXiE98s+mWGrD6SfLqH3bLyP
	3yRWSGCyBatvsYxrpt/Qxiz7eHz/suIMhgMXYEk0gwx6AwwRmy+9DXkJZ8E0JGHc6/Yj+quqSiS
	VWH3GcLIhplTxmyBcJVxsS0kCIIl2XQg2erZo/h50djlbcorio976VUharwsfH9MByefveUBsAl
	xtqZPjQ4HZpF2CMbA1JZAOMAa5
X-Received: by 2002:a17:902:ccc8:b0:2c0:cf44:3b3d with SMTP id d9443c01a7336-2c71901af93mr36154715ad.26.1781870877762;
        Fri, 19 Jun 2026 05:07:57 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:2c0:cf44:3b3d with SMTP id d9443c01a7336-2c71901af93mr36154375ad.26.1781870877329;
        Fri, 19 Jun 2026 05:07:57 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7208d67cbsm23004965ad.26.2026.06.19.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 05:07:57 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: reset REOQ LUT addresses before firmware stop
Date: Fri, 19 Jun 2026 17:37:51 +0530
Message-Id: <20260619120751.363340-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExMyBTYWx0ZWRfX6G+1/Wv21dGv
 uxKtBYj1EmEixB0kcob7rxidgcq4b9EbwDSTQMkRSFqB0RkUMfAQMc0ChT0xrQgCneIyFEnq6vk
 oErzZAd456Wfzw6e6YFs/DhHSi9wgorylZ1pfQBTXUy8nLLLbMAyMrkwzWK0yDH4SSj2BdFxUaN
 mv8ezcow91kcakOqqMu1OuAmxOBCmhmofPD/zJk8VpaY0DJa9mYTBQwI0kfZxv6Lknjt2tJwlB5
 LQmWhlG06QqbdJwMEnDVH0lET2TnzSMSFpLYD4My0xIL8oVHY7JnFiuqbaWLEuTRypwinRrLuNH
 ydVmChGEEpjAQAyf94FRXu09QNt+xzrp1gmHdBrdcCDG5ujhC7nDiYqTkKPJQcAud9Sm/B2pP+0
 sC/1/m1xNAtwWkHG3UGmYiUEbdA9Q6JVQs2eQ8Sy+lAAUMyyhb+AOtrXaU7bO8cSlrFz+rT5g/N
 m2T+jvK9ePRb7kJQQ4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExMyBTYWx0ZWRfX55FvLfbpiIsu
 lBJfHKmNGzRVqfiib3mhj89ls1ib/7joXKLeOAj5Bhw+v/8CPUJdz41UifddCnHaJr2r4YrZ6qm
 kPiRsqg2KpmxJPgWYUpSxmw3uaMNNIM=
X-Authority-Analysis: v=2.4 cv=I75Vgtgg c=1 sm=1 tr=0 ts=6a35311e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=id8SikcatB7TCbyXZYgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0IZlAnAdB4Llt1MdQMDxEtePmilq3seA
X-Proofpoint-GUID: 0IZlAnAdB4Llt1MdQMDxEtePmilq3seA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_050759_476158_A77C7F20 
X-CRM114-Status: GOOD (  16.34  )
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

During module removal, REOQ LUT cleanup writes 0 to the REOQ/ML-REOQ
LUT address registers. That cleanup runs from ath12k_core_stop(),
after ath12k_qmi_firmware_stop() has already stopped the
firmware (mode OFF), so the register writes can hit an invalid target
access.

Move the REOQ LUT register reset before ath12k_qmi_firmware_stop(),
so the registers are cleared before stopping the firmware,
while register access is still valid.

Additionally, handle the error path where firmware-ready setup fails
after LUT programming but before core_stop() is reached, ensuring the
registers are properly reset in that case as well.

On the crash-recovery path, ath12k_core_reconfigure_on_crash() calls
ath12k_core_qmi_firmware_ready(), which re-enters ath12k_dp_setup()
and ath12k_dp_reoq_lut_setup(), so the LUT registers are reprogrammed
before use and stale values do not persist across recovery.

There is a brief window between the crash and when the LUT registers
are reprogrammed during recovery, during which the registers still hold
the freed DMA memory addresses. This is safe because the device is
non-functional in that window and will not initiate any DMA access
until firmware is restarted and the registers are reprogrammed.

No functional issue has been observed so far due to this sequence.
However, this change proactively avoids potential issues such as
invalid register accesses after firmware stop during module
removal and error handling.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: P Praneesh <praneesh.p@oss.qualcomm.com>
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  5 ++++-
 drivers/net/wireless/ath/ath12k/dp.c   | 14 ++++++++++++--
 drivers/net/wireless/ath/ath12k/dp.h   |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..efe37dc91afd 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -708,8 +708,10 @@ static void ath12k_core_stop(struct ath12k_base *ab)
 
 	ath12k_core_to_group_ref_put(ab);
 
-	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
+		ath12k_dp_reoq_lut_addr_reset(ath12k_ab_to_dp(ab));
 		ath12k_qmi_firmware_stop(ab);
+	}
 
 	ath12k_acpi_stop(ab);
 
@@ -1371,6 +1373,7 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 	goto exit;
 
 err_deinit:
+	ath12k_dp_reoq_lut_addr_reset(ath12k_ab_to_dp(ab));
 	ath12k_dp_cmn_device_deinit(ath12k_ab_to_dp(ab));
 	mutex_unlock(&ab->core_lock);
 	mutex_unlock(&ag->mutex);
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index af5f11fc1d84..fbc0788b37a0 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1097,7 +1097,6 @@ static void ath12k_dp_reoq_lut_cleanup(struct ath12k_base *ab)
 		return;
 
 	if (dp->reoq_lut.vaddr_unaligned) {
-		ath12k_hal_write_reoq_lut_addr(ab, 0);
 		dma_free_coherent(ab->dev, dp->reoq_lut.size,
 				  dp->reoq_lut.vaddr_unaligned,
 				  dp->reoq_lut.paddr_unaligned);
@@ -1105,7 +1104,6 @@ static void ath12k_dp_reoq_lut_cleanup(struct ath12k_base *ab)
 	}
 
 	if (dp->ml_reoq_lut.vaddr_unaligned) {
-		ath12k_hal_write_ml_reoq_lut_addr(ab, 0);
 		dma_free_coherent(ab->dev, dp->ml_reoq_lut.size,
 				  dp->ml_reoq_lut.vaddr_unaligned,
 				  dp->ml_reoq_lut.paddr_unaligned);
@@ -1568,6 +1566,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 	ath12k_dp_rx_free(ab);
 
 fail_cmn_reoq_cleanup:
+	ath12k_dp_reoq_lut_addr_reset(dp);
 	ath12k_dp_reoq_lut_cleanup(ab);
 
 fail_cmn_srng_cleanup:
@@ -1627,3 +1626,14 @@ void ath12k_dp_cmn_hw_group_assign(struct ath12k_dp *dp,
 	dp->device_id = ab->device_id;
 	dp_hw_grp->dp[dp->device_id] = dp;
 }
+
+void ath12k_dp_reoq_lut_addr_reset(struct ath12k_dp *dp)
+{
+	struct ath12k_base *ab = dp->ab;
+
+	if (dp->reoq_lut.vaddr_unaligned)
+		ath12k_hal_write_reoq_lut_addr(ab, 0);
+
+	if (dp->ml_reoq_lut.vaddr_unaligned)
+		ath12k_hal_write_ml_reoq_lut_addr(ab, 0);
+}
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index f8cfc7bb29dd..9b39146e65e1 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -701,4 +701,5 @@ struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_dp *dp,
 						  u32 cookie);
 struct ath12k_tx_desc_info *ath12k_dp_get_tx_desc(struct ath12k_dp *dp,
 						  u32 desc_id);
+void ath12k_dp_reoq_lut_addr_reset(struct ath12k_dp *dp);
 #endif

base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba
-- 
2.34.1


