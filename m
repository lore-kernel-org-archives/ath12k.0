Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D14FB5192
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFU+VhBzRJeenl+VRPF3v3N81A+uPDq1V4VHj9wAE7U=; b=FHamN34QM9InkhZP1cM5WHW5sU
	Ep8w/6J3ItNzf15EuzscnR3INZeWYyvw9kXTlGy3J93Vc7TnVrc54DVPnXWKGDjqiwNqmVBjzjiq6
	o0gzkdh5Z4D5qLzCzWIRIKZUyUoWGpXHGoaxDS8B3A7XIbgshq1q04/+cJ3gJEquwTMWqnXsjsXJs
	I1WJ/bJ1amUhuXEtNtJfCFrZur3Vv5iJVQcugU3LDJVSX+kAq9P8C0yD3jUUnm4tR61LVtcOCTOhg
	nFc9q14w6ZQKQWBTWnFAdjX2MlBZ1YItPD4WnRRkVTquUZwrPfoTCBGzM8jT1gQQ71u6hBRy+fona
	mjOnclCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxv-00000005v5N-21qr;
	Tue, 07 Apr 2026 05:27:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxq-00000005v0s-3iJi
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:27:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQfOP4008692
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFU+VhBzRJeenl+VRPF3v3N81A+uPDq1V4VHj9wAE7U=; b=GNcxkF8noMHRludh
	nWfTqDUoJq/yoGzuQq2o5/RH4ISv7h7h9c/ghCn4oLhV3xAM6NGn1MjMkUYgQEnS
	+DqwZ0mKcPHN36hxt7p4ZPCRZMPhEKaHYXWBE3ckFiMl2j/PcVTCIKs2WJLT+/l4
	zfE7xdsZv4s0Xn4779TGojhhFRLaonHxKqbC+7tc010RRn6iIbdKovQIJw9bWFTV
	mQ4fMYUA4L/jGeCbj0O10qc9znHWF2IBIHbuTNlEJrBNHiHuq6BFWjvaWXDEyfqM
	x5xFqO0/mJcpifu2W6JAd5SkPs71wgVRCiRoowzsOOdNxJME1TFEnowRgxrw51TR
	IIVmww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrks57g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:27:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c646e980bso2390447b3a.0
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539621; x=1776144421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFU+VhBzRJeenl+VRPF3v3N81A+uPDq1V4VHj9wAE7U=;
        b=d8tHHUUIJU2XuyhiKGWaqyByW+BmDLmt//sM4ejCjyA3U0CsL6TSDEBKDhqz7J3p4i
         AijCGsc71hXnrvRL/xh+ewuTChUCUaB3Zgxm9rJP65gFoAdMqnyvtI7cVc1p3uoq+imm
         Px5l+JvgEIkm9OxVlaKyXk+/+tG97jeC5mjeo50aaGkWwZp6XQlvZkHWI464oXj66V6w
         0A+rKjpOWu2/7q26u7q8NXAl6f69YtBxx/ME+Uibs5xI9KkIdiVeU7is+cdVjsxboHhp
         4AsqVo9DUVmYiFCVHAU6c6smT597um64HreejLJluvoyPTDRdv+UAb/I6CRipluM+idV
         AqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539621; x=1776144421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TFU+VhBzRJeenl+VRPF3v3N81A+uPDq1V4VHj9wAE7U=;
        b=C1Ndvukr/HWtvtPHBtVMb8Wmh3EmPVwNwLJ8x73Z6M3Jdn2j6M8Ej2gFgwsbeKCJz7
         EEaJ6HWwCLDqi5gD/7PNKwDOAs46LpD5uUjCAxlV7BCF6RqyygWoB9C0AsUFfdptbC3o
         yZIJD0gb+W363Js+2yg8/Zomt895G/nfjDqU8pPyA3P0lw89fUVjOaiCrE/sFj4j6jYm
         jTrlgHi1b/8yJx0nAP1I0VYBekzJsLT/tAwBvdCdosSlXe8HgD1gmEO2Ub1XgG32exjT
         onNm4EK4jbxfu/WhBW0o/exRS6zk+EuPVduSJr2r/wfsXAHtXKYpASkNYX7M7eWr8foW
         wFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWrouMe6aOE+gFnuqzSrMiwARbU6vZZu3X7dF9yNjv8cMGU27mUakZW6O3Kzd4S4hUl4sBusDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLxN+VFGaWBILQ2qbmrmtSbmm/b4r+hH+rdqTtNe9xTTo7avE1
	HtdCggSgZm0O05yrBjw/VPzDxKGpUZ7Gdej+DvbCJmt0OFY95L2/muytsc//UFVg0Slk/TLJGxJ
	MceY47bYvziDBWOq7oDyJyl6nMO4jKDlAVToX3QW+f1/uRm3sQvSIPTQaynlw6JEJVPibJX7B
X-Gm-Gg: AeBDiesIcaLKyFPoUohV98vB7oHYEoWXbVuLpq9XF2tbn8c1m6Fhg1fJRmPI9sOQC7Q
	tCAR+7VvNWDpm/TL0ChWJ/fOJoXF3v9eBxqKBDkkEiDffWokl8FrAmEzjxZ63QAVXOIwlPCezN1
	4qE3fRWrTLYMzW22iP1u0GuF7pzmzcezuuYJLM+JydCFr2YS9yOZdTK8sq/0UjLfRfy4yt6M1PY
	8Rxw02A/CQJ7zcZi6sSdnDa1Ho/XfaP45p+ngoOLVfzLFAUbKzdFp974c5eAhc1l78lVUJ/515b
	Y5vAFdlqPLo50YVoIoPZdPIctPTeogd9rJbPz1mgdv6IjXKF5NNvzd6j4MtubJkZYG5jl0ZRSon
	I4egkW0b8V2BeBQUL2AyX70YUzy946K4A8jHjX9x2A4Nga6Fr/3KOyAKK6Thx/OHoswAYTvrfXK
	kby0Llg7RXdc088nVd+aS71kraKJVDbR5nKAQCCbA=
X-Received: by 2002:a05:6a00:3cd5:b0:829:9ea2:3e17 with SMTP id d2e1a72fcca58-82d0da33ed3mr15584041b3a.9.1775539620502;
        Mon, 06 Apr 2026 22:27:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd5:b0:829:9ea2:3e17 with SMTP id d2e1a72fcca58-82d0da33ed3mr15584015b3a.9.1775539620001;
        Mon, 06 Apr 2026 22:27:00 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:59 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:33 +0530
Subject: [PATCH ath-next v5 6/6] wifi: ath12k: Enable IPQ5424 WiFi device
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-6-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d495a5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=x73wdjvOoWb_6dWcbhYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FdizTw85vzHF-0pjwe3KAio0-oviaDb8
X-Proofpoint-GUID: FdizTw85vzHF-0pjwe3KAio0-oviaDb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfXzrmd3cM5+KeI
 HUVICigO2WotUSQjsY1hCsWgeA2FdWVDPNIuAuqidFLHo8I1qN4wXK40nEjrFwUr3HW6HUNuNZr
 VGxj3BHwHPXmtcLUTv5vKL8edlPNx4N0FULap6ZhJocInxQLtZVtKmde92fl2YkltP79+d95K5u
 hmTVtushDoiu/+cElHc/GZp+lmF+FzoICi/h1SovzljLHVWyRgEgrYLflon3EYOvBFc483XClGt
 PrFpEVvPYcOzh6denqLJSb6eZKSZ9UHRW3q0PSYo6YzZRbFKKt5nwsNviGF2pDuCLLy8lDNddva
 pb8ag5fx/WELRGJi/08ZtmMa2koA6fiv+MAPn4gfCDCosuRHUuEVjktJfYo5Q67q6cdXFfjSWZP
 kSKDKRv3S5+RZAMWdMyTD3P6REJ0sxvjSWAMRfD4tc8cv7uDpzeaOeC1ra+ioICWXIirwkO7WJC
 SRP1grTtiqj8zVnW01Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222703_074609_27541F35 
X-CRM114-Status: GOOD (  19.79  )
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
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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


