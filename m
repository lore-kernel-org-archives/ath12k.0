Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79678CC6B00
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=; b=qzi8JbcEv1yU/Tl3fyQXwPWxMY
	VtAoYM/7cpOi8irL/6rrdOfJIpqTOPQbvK5jUiDY7ke6Eb6qAnRuFNf7NoH71G9XAcHWYJwieu8ka
	qlKWp+cvbhDffkjLEqBpkwLAXHSJboC2DWMXQDPBP3Zf5qxhUHVjL6fSG/4AAEti6d9FBNk3S0WIN
	rI29auEAH7+yPeStwHcEg94/noAVLmWnLEGrPZv49EoQ9MAYpz8k8yBNlvpxoUk43mEwxuO6LZNXJ
	9uBYV6N2ez4USdqJNN7QreaYoFXLlJcDGJVx9BioAe5Akez85rx0WlrQey7s6oEjOGJONFWy9ty8A
	J+GoM/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898n-0000000GgsF-35B8;
	Thu, 02 Apr 2026 03:54:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898k-0000000GgpX-2b1J
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M438g2798842
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=; b=RR+AEfH03aPwBl/v
	ES/B2b5UjUscjQpF07y6B94d8FnFQbIKaExqShAvSdkJy7Es2JnBnyd9BBwKO/DK
	3CKpA2NhQqrE5ogwg8epS2Fz/LDGHbEbswOB9+F9Y9PLh3NZtYFfDnRu/nu5UCPk
	okO2EE4phComAe0fifgCB1tlLfmU9I2wW5s6zaeuR6z67VLXV7Tt9vsLukhODekB
	yJ6qvRz9ktPamC+Qkv9ChSusgW7+e92AHIcpYHPOzFTgbjNcLDWsDbr7jbkKddcp
	sIJGbC2gMr5F+T1cH+ifcG3kbYsQ4XefIgxFVfWOw5pEZIXQWPqZDX4C2aYGD2UF
	IBD3FA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk23tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so288871b3a.0
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102080; x=1775706880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=cw0YWYykt/wufuI+RE18ECl81siCTTXpiometritCx2tQxwik1OO4vhAWcb+VMWGOC
         SkQU8ZEQRMsnabPdSCC0QnIbuok/kFNPeQJg2RUKQagyslP2+uoKEICP47Wy8HlUdPoB
         PnFD5pggncFBEbCgi+xPAIugwAVpMH0rLT4UoABVOJ2gJsMyzQvt6cPW9eQ/2EBtK4Jq
         eWbD6eqYkM6LFZ8RY0cRmhDJ52sOkSBK11ihPZSoikPtd9M5sVIyOhoriRCdMuHyhtuj
         880jwXpPIg0RMJj2mUKw2UtYbXsjNlgBAUZA0gzrCeBkGXeIXurjfUm2vYtvdqZYFGFz
         NjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102080; x=1775706880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=jSejrkovuzTlp8x9495yR8vIYqsX0Rrddw8SdudgKbrqDjbnUTqO+i8ZfNdt7od0VG
         u6ax4TsWI5NevPjUZLsVeSqhtxnOHwKagWqnSbbd0qtDrt2jeKgSBrQFWe1kuI3f3pu2
         rdbmWNy7cikVNe065F26QBYM2f9IwXS9bfX6xWKw5yZneEOZ9/wqJO1MIo8CLYmbOjMI
         YgCSNa7iLm4gc2eUKdxOUGqHOMXcxvfLLn67IpYY/Vp+dsGR+S84kRvnXUHb7MHCJh5+
         aloDHF3eZOc5Q3vGh8fi/9cEmfkUrOvJNpyQIwFH3/l491D8nB7gq6YFNqjwV0iXrMy1
         iP4A==
X-Forwarded-Encrypted: i=1; AJvYcCVxYSFxyQ243U6aJBWzOsljXptXGHPeEqJLeGugNkY1tzEJl8xGtvTvZ7MoXjarryT/riDjLCM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk+8/oEx41pO+6gwnRS/uAImgBT/8EpA4kgDJQMfgq/SuqDryO
	syd58N5ICWIsXoR+BP+kpI8ihNxVL9J4hiXI0YGvpjuB6caZDxXBqn1J4jCB9b22CzTemqsTbKm
	yfovmwzXGslATi/329g0w/Rjb5m06kht/KvRJKFhdcfwHx+GL8Fsr5fdrKd3cCPNFSkkAsu5S
X-Gm-Gg: ATEYQzysdkYAns8BS3TaWEg9U2idL/e9UbUj6xr35CA+0wbsRVOeLEAAW2yxQj2AS9h
	vlog/PD0gr4Cidn6K+pbPTFtxBRiZ9Nh0Rjb9JHnIWIYVTItaMRx/kjPF+p7ObtdqXttMB4Qv5e
	Khb9veOzA2y5IBQ+/L8HuKjCeY6Ff+87pZf6CjgY3e3JPl7Azryb1BXNneu6NDOkRhE0i3deMeo
	sEyYoDGAky+VDYPFSEZ6w1oZ6lZFnn/h6lMmWROnzEad9Ll4yAl8DML/2hgSNlTNIaFDQOFRUnT
	lXTKhAhptYxLCK0LJYuCa6dKhuM5SUN7czVdLQTrhkF8HXBPcRS/tkw4oZpfxNW2SG6EFE2/7+D
	dp0Oyp2liGFHmLGvJEAuSS6gGBMKpWRc3rmpvJM1HdzvMqMION3zFoPzPR2HVHntOCXdc43Uhcy
	sBBwaYwtYBiB+7jsEQhqoftbN/WJ1PFi9divIo384=
X-Received: by 2002:a05:6a00:2d82:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-82cfb9c0d13mr1887457b3a.47.1775102080217;
        Wed, 01 Apr 2026 20:54:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d82:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-82cfb9c0d13mr1887430b3a.47.1775102079627;
        Wed, 01 Apr 2026 20:54:39 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:39 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:04 +0530
Subject: [PATCH ath-next v4 6/6] wifi: ath12k: Enable IPQ5424 WiFi device
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-6-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX8MnhKNMDeoLF
 sAJz7ryIFdGyLY6rBMCLPmDO3mz8WzeEd4Y3Cq5vDkfN8KULjxWCfbHZunvLOqmKMqmqqsyGEiP
 W4CatvfcRfbLTB5r6AZgbwj1NYFjQtuGbWR0nWhzqiqh3vQye0dq1WEynnnq+KBo9IKzC0K4L57
 vO/YjQgO4z782gCiQAn/8YWFGU7biqevy7m5B9oQP6wKs7ZdVGDmE6NSh5Yj3ZGysvVxZpbjABx
 NBqKn/fMVaLjtLSYvbHbtegZqwtxPzY55JE07iARGnBTBzF+aPkuFTqut5p3+wh0X8ZNdN/ckCr
 4xJg7evNdEexX37mWuczCnXLn6/n15+0/Y/G52UwX0aLk/HfPst/oGl3fNMSvolnLZhxzmzDGuy
 X4kTYbPuzFDhJmczeN8rS9FdRYFVVLeGaYSu8FGJfp9Kx23pTCoVosYw5H9gs+i73J2FMCNQkkk
 H6vnBs6MU6VltkOjngQ==
X-Proofpoint-GUID: cZAf8XkfILLEMGTbXAYyVAk50DdqrByw
X-Proofpoint-ORIG-GUID: cZAf8XkfILLEMGTbXAYyVAk50DdqrByw
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69cde881 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=x73wdjvOoWb_6dWcbhYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205442_774243_8049DCF5 
X-CRM114-Status: GOOD (  20.36  )
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

From: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>

Currently, ath12k AHB (in IPQ5332) uses SCM calls to authenticate the
firmware image to bring up userpd. From IPQ5424 onwards, Q6 firmware can
directly communicate with the Trusted Management Engine - Lite (TME-L),
eliminating the need for SCM calls for userpd bring-up.

Hence, to enable IPQ5424 device support, use qcom_mdt_load_no_init() and
skip the SCM call as Q6 will directly authenticate the userpd firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
Co-developed-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       | 36 ++++++++++++++++++-----------
 drivers/net/wireless/ath/ath12k/ahb.h       |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  8 +++++++
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 9a4d34e49104..2dcf0a52e4c1 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -382,8 +382,12 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region, mem_phys, mem_size,
-			    &mem_phys);
+	if (ab_ahb->scm_auth_enabled)
+		ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region,
+				    mem_phys, mem_size, &mem_phys);
+	else
+		ret = qcom_mdt_load_no_init(dev, fw, fw_name, mem_region,
+					    mem_phys, mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -414,11 +418,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	/* Authenticate FW image using peripheral ID */
-	ret = qcom_scm_pas_auth_and_reset(pasid);
-	if (ret) {
-		ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
-		goto err_fw2;
+	if (ab_ahb->scm_auth_enabled) {
+		/* Authenticate FW image using peripheral ID */
+		ret = qcom_scm_pas_auth_and_reset(pasid);
+		if (ret) {
+			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
+			goto err_fw2;
+		}
 	}
 
 	/* Instruct Q6 to spawn userPD thread */
@@ -475,13 +481,15 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 
 	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
 
-	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
-		ATH12K_AHB_UPD_SWID;
-	/* Release the firmware */
-	ret = qcom_scm_pas_shutdown(pasid);
-	if (ret)
-		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
-			   ab_ahb->userpd_id, ret);
+	if (ab_ahb->scm_auth_enabled) {
+		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
+			 ATH12K_AHB_UPD_SWID;
+		/* Release the firmware */
+		ret = qcom_scm_pas_shutdown(pasid);
+		if (ret)
+			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+				   ab_ahb->userpd_id);
+	}
 }
 
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index be9e31b3682d..0fa15daaa3e6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -68,6 +68,7 @@ struct ath12k_ahb {
 	int userpd_irq_num[ATH12K_USERPD_MAX_IRQ];
 	const struct ath12k_ahb_ops *ahb_ops;
 	const struct ath12k_ahb_device_family_ops *device_family_ops;
+	bool scm_auth_enabled;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index a6c5f7689edd..6a8b8b2a56f9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -19,6 +19,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5332-wifi",
 	  .data = (void *)ATH12K_HW_IPQ5332_HW10,
 	},
+	{ .compatible = "qcom,ipq5424-wifi",
+	  .data = (void *)ATH12K_HW_IPQ5424_HW10,
+	},
 	{ }
 };
 
@@ -38,6 +41,11 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	switch (hw_rev) {
 	case ATH12K_HW_IPQ5332_HW10:
 		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
+		ab_ahb->scm_auth_enabled = true;
+		break;
+	case ATH12K_HW_IPQ5424_HW10:
+		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
+		ab_ahb->scm_auth_enabled = false;
 		break;
 	default:
 		return -EOPNOTSUPP;

-- 
2.34.1


