Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA61FCA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=; b=JzDbgb7HbIc3HvH4QeX5qVhA3/
	PRWWYiFbbgPe11HtGRaxZ013sgou3ohXsDNNeurY3p6KR0aPd8fzIZ9OeZWt5DqzYE4meGKWI0h8A
	Yp3DIOjWLMRNCQygQGwHeNLZxyy/u/i+j3TQk/u3O7WkpYMqNfT1VxWwCM/Bq4k/+U/1YOVfX1S+B
	DHl4eVmt5g6I9B0XadQdA3uziCB2MgeT/WbLfPe/zcUoGkzgnVWjh0YGs499n4TRg+JgkBsFOSpVh
	8tCCVbPByxpWm8AL35io9NuG78mlxnPclED6a4CJ27ADPQWEGTXSmWTk9Wv9W4XCmBjk3xYiT5Txy
	J7nBuJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJj-00000004790-2FWs;
	Thu, 08 Oct 2026 10:25:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJh-0000000476s-2oWP
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=; b=h2W+Q0J7YXzej+uWYF3acLOpnB
	bO98fGyUeYw1IqE2dHePs8JyPSYt5bjIhp9fLVEn+PFiGzEB5eFQmjdlpmu1/ssxp/VhIMKQ5clZ2
	1TiXBuxQbjGBTos+rQZ8CMBS04iq2z3mzLUtbiyovo0chwfUEOBgo/LvqgOlrSc2g3yGFC33/Bz7E
	9+CIM0twhIEuGYyKHjeymOff4AQ5clXy60CcZXaBe0kSCLWPyYnNIdcN7v5DoNLwJnQk9fOQh6BQI
	HWgsIppphnAbFhQ78Alv+8n+KprDm3W60rwYY5c4SE3IBw4eiJX4B9+bEKlVgcea0RjCXBPH+HPU+
	dnxhO1GA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJc-0000000AHxE-4ATq
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KB892560127
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=; b=WYh3HATTj8NQpdVL
	L8WrDjTB4ZCgvC/7USEJiUlpIxDYZ6O5opUIPus/1BpblGXK5l4NHAuMNaFiru2v
	wZXylQIDpUO6VseYuURW/9Uw5sm5YaCY9msqDpWy0MLoVQmPtlcW9EUhCVB5W0ZJ
	mLa+Q+DeuNDemPxy7mkvpYCYTIx/L6NekzopJijbFkXlOSIVUmh4exIlm9FEmDb9
	KAxE+E1KC5dFaipXHZhhPsbA/OHsk8K4sE2pWKN1KDBs7vb16Pu/VhMXRNsIUcWv
	a3E03xgrSHi3fn7oan3pwjpxk91VgLE/qnZmZPwVKfp5j/ab6FkrLVvivQQTzp+L
	yZO/sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82cyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:25:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e651510a5dso15207115ad.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455130; x=1792059930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=;
        b=St8+imQiXHb6Q0gIG0YeC1pA7F+0z0TAf5DDa5vGaZPyOp30cVUUlfL4/xU5CqvPXu
         DeIxN7fQ3x9TyKo6shexdRjZ/VOgIRaPYsjUwaOufdmqMZlGOZ+v+eR2FBIEV1Urf1tG
         7sFVPZ9rl6Sy2iA+YobwZem1ZBxoJwJItcppPJc1QiLWFUKs6eQGx8y+D6F/K5flWbQF
         5dsDLz64G1YV5vGbimhQm5G6ynx3ntdz6YlHpkQ42IKUgqtbTtehRCaEdD8aKQTOLQBp
         HGEz3ilyptlMkPBABrjPl2Y0Wc0N0dteUz4mg1vGMr5WHaN+z9utZaCwWNc/6A0TdZAZ
         VjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455130; x=1792059930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=;
        b=07iYKDIHCaBqFkl7YBLOYNBmL53Fyoxrx6Nu58SsOXbAvp7rTXp1Y3PbZWFH3/7Wfm
         zKqu/oByReRlWG1pjjVwQ2ZLg2Z4KlcgmYN7oZg4XTqLuSetWFOPbNUNQG82sUTLzGax
         JVhUKQgoJlJP/CIIjkd7MLlPNKM2LqiJ76UD/dwm+sFrXvxovZvKS0Cp5B8qdiwL9mfL
         MwHyX2rOspMqKauH0U5kDzDKIzhglfbGeI2uQXv6URBDHG2EMoXYLnhdjiRbNQeUWATv
         iArBdZQmm6hpTnd9xXo3LHfiJvPARreRBzK093c0fbFnrYbs9e4weqqi1GittpTR495v
         Cv4w==
X-Forwarded-Encrypted: i=1; AKwUvBysYc8LOsuUsimNM6nVPMd5hgNtyYmq+xJvCnBAX6zPkz695khXpWtEaDBzPzkxk7CZPWVmsmw=@lists.infradead.org
X-Gm-Message-State: AFq9FYL6L1nf+4nUSGTf/BgiyRJ0nPpp2XKXGP9nsTALAiLK58V1kHDk
	lZWvZl3vWLIEq8WfwbMEup03rPjt6yJKnidC0R1UgshrtKGoZR8lwLmIkbLvf/JETj3BVF4eiii
	Ysy/Ncv3AQhoye+yBua9Sea4GKSGzu+KdV3nEMZUkTeVgzKVF5qT/NkIIUh2Ns02c
X-Gm-Gg: AYBFou2MWdoW9z2J6k3wFilVBOW3lDNQAfuwtUixkOD6XlkQYQlQ8URQ9fPm+ouhCd9
	1zzCN7e5dqSF4tuR48LCK+ksLF81uoKFDkE3tHtcxhHIbyMfOlXn0ExhaLIyugbTGm4WX21LMfu
	cVPOH0v8UX4jcr/VeRLaSk9YQ+/kYngiVq4cy3o2tIFHrViE/mfaFuitTPnJ00vmve99CXkGtKk
	3n5D5eiejlu22OVP6tXk4rn/fCIYb/aQ8yFC3vd6mghxtVeTRJYtCufEq46CRk9gOBe52Mw1Fip
	yrQLwTl4NLZkbfbMIk21Cf8JAz0eFtsTPebKig5IXqs5StehCOucgBcSH0ATbG+bnmSlKY9Qg/y
	fFJ/L7GTotGi1jeJr3QSdCJW358qh89Hwux15FXASYihrBZLdSjD+126Yv4EOxMp9yUPVuTtKN6
	MFSly0PmhrC3IxMj6GNbuIVA==
X-Received: by 2002:a17:903:4b03:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e7e73e7348mr18214275ad.31.1791455130106;
        Thu, 08 Oct 2026 03:25:30 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e7e73e7348mr18214035ad.31.1791455129590;
        Thu, 08 Oct 2026 03:25:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:29 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:13 +0530
Subject: [PATCH ath-next 17/17] wifi: ath12k: Add QCN6432 AHB support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-17-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX8L4W4Knta6nN
 t8FFd86eHQoO6pfgaVWiyASdGmUkPbkRBcYxdDYvjl3ojGNE/IVgY/UBN0G5XnC8LEmG42Hf4e3
 s2+rS//RweqVFT8ihnxkfKt3QLZCEb1A7cNOu+I5frJrwSzsX5BFS2tPNOY6RCfYGxF0wj5q8HA
 sHpCoP5M+MZKhh0hmtqgHYGNwNCEXBgajLaO+6kFZ9BS9J5i8S5nBq2IS1f5h0kl3VENfeZTwjm
 rP+ITKC2nAQu138lRaJH5njbB+eJ3JRWa+4p7+SeKIyl4vWHLt79bipeFmyP+ydoD4bjt8qJWJE
 uZ1w1p3uXxdZme7r5XRVeaMuyhgfXacAFq/lf5/B58u3tgi6SyxjePPTDQT8GaIt9teLC2gM9cW
 ebafAAsPobNAr7tkDo0LcjJHgClHv2BuKVl7LgVvoeu0ErcO54EmMBYDOqSIknZmDOeEeixD17w
 S3OKdUmJUekXpvet0Sg==
X-Proofpoint-GUID: n8MSVFWaqA827OJYYEDbW2NqmxzNg0Iz
X-Proofpoint-ORIG-GUID: n8MSVFWaqA827OJYYEDbW2NqmxzNg0Iz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX+Bb/kTS4wtSG
 yZzUcfPU20cjWDY468ZkN9ipnuMS6vMFEpn0H0MgOxFHlHtmcFQ2zflL9xVsQ6MTRCxAHn42gKE
 qrL5zoXju+f2Ccx2DAjAQlqBOFHO0Ak=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac76f9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112533_450489_2FAD405E 
X-CRM114-Status: GOOD (  17.96  )
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

Add AHB support for QCN6432 by adding its hardware descriptor and
device-tree compatible entry.

QCN6432 uses a hybrid bus where the CE memory is handled through the
PCI interface. Skip the CE remapping and cleanup in the AHB resource
initialization and deinitialization for hybrid bus devices.

Also add the UserPD mappings required for the QCN6432 devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  9 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3872aeeb9ba7..04974a6b423d 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1210,6 +1210,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1266,10 +1269,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
 	if (ab->mem)
 		devm_iounmap(ab->dev, ab->mem);
 
+	ab->mem = NULL;
+
+	if (ab->hw_params->hybrid_bus_type)
+		return;
+
 	if (ab->mem_ce)
 		iounmap(ab->mem_ce);
 
-	ab->mem = NULL;
 	ab->mem_ce = NULL;
 
 	clk_disable_unprepare(ab_ahb->xo_clk);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 86359ed1eeb2..98e74bdf0112 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -18,6 +18,8 @@
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+	{ .io_start = 0x21e00000, .upd_id = ATH12K_AHB_USERPD_ID_1 },
+	{ .io_start = 0x19e00000, .upd_id = ATH12K_AHB_USERPD_ID_2 },
 };
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
@@ -33,6 +35,12 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.ops = &ath12k_ahb_hif_ops,
 		.supports_multipd = false,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops_qcn6432,
+		.supports_multipd = true,
+	},
 };
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
@@ -42,6 +50,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5424-wifi",
 	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
+	{ .compatible = "qcom,qcn6432-wifi",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1


