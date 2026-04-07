Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05BFB5192
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=; b=cqm3eDKrth16SJBs5y1Ypp/i7C
	TckfD9Q+s/yyrEp55XG0fts0TrZe2y5/A1NTZOUM30iN0Zn1PN2/HV1jUv6XahIkfp+HXGLxYz9Cx
	HfOVWXOpsL7WyVV0tZelf81/pY9P8re+1CzsDqOPaTPYD6jkQyqcwfrUFO6wNskQXjV93R1MS6AWi
	+Unb4bo0hyjVIsewleZd9kLMWxlKD7YNlDeiq4LMud57UGZ4pPRgX0mSRtRJ80jiA58pIlOyODPYe
	C9iJ8+SZlx94eSO7b3SCb2rt5ywPfECwrlLpqq5214HXWC+WVWiHVUWxiOsML5Hr2OchRjBzkvYCt
	rzZlw8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxh-00000005utx-0KPH;
	Tue, 07 Apr 2026 05:26:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxd-00000005urx-3D6R
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:26:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LPqsS3815757
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=; b=P+oWCMi/jcpIhvZn
	Ll1Msh5a0E/SXHocZTW72KYK2onXTsqpTi42OjgETvbKarbTOpGiVvk0MvX702N7
	dbCzTB4/xEuuXi41FEHBbqW8Sp6QYPUolvNznaAis6Swn4bMYH34XOzqNmGhQ1Nq
	wMFH5xwbpmZfQ6jHXC6sGDDc/0oClacwoO3oDOh2gzoA7xjWIZ9GkMF1wAei4lhR
	AH/IKkz6YF/VYE5i8MQ7qqrQXW8DetScO9Ly4CSqldu1fmfkZdgkiUYEE7maW91n
	NicqsOn11Qfhgqea8DxHmAgKvLwD0EemQvSFUCfAqLv8TjKLBBhcv/QFw0xO6/+u
	/HtA8Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4s5tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:26:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82ce34a78edso6147922b3a.1
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539608; x=1776144408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=;
        b=BV3ElnJpFin5qiVZ05EzZ8Sxop1xFtLtAiPfQxg6Abn3GuCljTZ5Lgl/Vp3ICUEky8
         UNrsMtENGKssb9E3eKJKe11e+QgnFjNdqcji9nk8KqCVuxbgwr/Z7aZRKwuEHN8lwkGt
         p1t5nb3bfBffcC0DSE5mOuPGx6Ekd/IKP/VT+zw5ocoiD9iHxDkflJMrtnSSFdGN1u3z
         oFGla/955pserJ0Q5BemRrv8nB8oOBIjSLWFqdDGEsf3SRr/qabdaKUGPyIA9f5sodzB
         VBux2X3Fust3tB4415kD3IYO1Osq0PxCqL/nuS2lw2pHsYmSg/MuMvIsY4dJGeIGD9/4
         b8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539608; x=1776144408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=;
        b=h/KR9uaO3qNTUG9ElUtzPe6fS4SGGeENgEaA8z2u5SYJHza79vSjndv4rfSPcXQAvv
         fuL3OF1P0YyOKtwJu3jBeCm678sxUro84JlMgBefOKVCBfhBIBsoq2kjMol3Qp5EuYeQ
         Kf/5a3ADxsgQyHdIKVd18hiTNySacG7zBjlwrwhorNDe6PhTfRoBi1hwtGYbUwe3O3oa
         B8CME2BiGzZKyD+QFogGoN0kkNZHSGvNTfLzGMvEGAufUpKh5OJWMCcptvcLR3OYOZT7
         ATCVZDF+bW7bDfYog3AsKBeC/pmrcjL1gu/VsFIjAZZWdmFJbOyFnmpDRg53BETJRD+B
         Jpvg==
X-Forwarded-Encrypted: i=1; AJvYcCWs+19wlCqOKnKhsQMqRjKHDNNCpwV1p8e4J3nwNpjeINJB9V9UNISmB7d6f51xwWO0icRmiuQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Wf9Z0290H0RcmzJRjv6Mj9LEQdX8UDjz8mxILIEKIGAJxnQ4
	XYApDVq60rmzkYWClzItY1e0inzn8AI7dtKsSsf0sfBAPvbjLO9ubJmnJ6756FEjF9yaGhbgI+4
	Xhr3ldeXb8AzPt8YOyqTuErlSxxuiOEhxpaHRsA1hq4MG/MuHihVTwaaO5zBEaJvy
X-Gm-Gg: AeBDietIpjerwnVxpkT4WqWxNSUaslV+2dc8tyuScNPYoKS8E8h2bsuZ0Sp3gfhP/tG
	FJd3DEoLYTvzqCaXnWZBy+XBbIcImto12QsOLYaMfCcsM9R8pkOeaaOX9saXwo1vscwnLvo7Ls8
	MVeDYop45vz1rKVz0DHzp5E87WIoYMOBn6myQ+qb6tSjNeex1XqWZYyLYlMpfUmMxjsAVWQtKMa
	xeWGsRHDhMUjSMwxEzexU6kvEqEeecuMe4lwsNxl6JQPXVwrqOFvdhIJ3/GxvDhKWrFMbJiutHS
	zwBE95Ho2M6z6eOu98Mp6AIHwTmAWD2fFrKwZG6E4j41q9rszB4lAxyLHsP/IGCDaToQnItcR/k
	It0qW4lqdxg+PHhf3s5uX+w+u/gXkP9oVKkl9G/tHOS6HlOeix0EpMB1okjB9dR3kzpsy2HRIS3
	myr4yuQ7T5kL3V/Wv7dHgBXdlAqvZDBe8S40qkT5Q=
X-Received: by 2002:a05:6a00:451b:b0:82c:24a6:1de3 with SMTP id d2e1a72fcca58-82d0dbdf0e6mr15003647b3a.54.1775539607589;
        Mon, 06 Apr 2026 22:26:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:82c:24a6:1de3 with SMTP id d2e1a72fcca58-82d0dbdf0e6mr15003622b3a.54.1775539607118;
        Mon, 06 Apr 2026 22:26:47 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:46 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:30 +0530
Subject: [PATCH ath-next v5 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-3-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d49598 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=V2VgLR5doq-8DBhT5hEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 3R3YkibVu2YxtsXKlrz5WuQ9OD36Yl8S
X-Proofpoint-ORIG-GUID: 3R3YkibVu2YxtsXKlrz5WuQ9OD36Yl8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfXzo8VoL0msp0i
 nOSVvKycosqJEYeHPvIvvV1GIVbQjyT65buq58Zs8Opqx+v3wFNctrBrUQInlLVqCDgyNYjtgth
 HDlXumBbcjTg1svBNDp2CGR4BVZbCR66zEX4nBLUvM1Ms1nhFL2TTuR0ZG3Hh5LWVYBdT6E1x3h
 Vj6pm5AYy6UidxZIH3yNJK4coluNJm9VOvZJKRSxpWphF8N6u0yXQ11bZPZiADQOSjRO/sJKGoo
 GMKGBNiJTQKVwPeK4/LzWbJ5UYRWiHJPddfRcuXfTZOvAlkJWH/Wg7OliJ6OT41avYjW18lxCWg
 Eg4uCGsPDsRBfSXOWzQFt2We151G+gerjrW7xdaX0q8zOEc33dYGyDqIpS3/BAJp3F6ine/UQsF
 hDbOHfx+STILMNdPL1m5lKq/D8wUoi8r37F9EEzeQxp4erS3K0kSxX3XoHbejiBy2r2Vd30smZj
 AJXDJ9psdSg23HJdw0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222649_936776_B5D7E1D4 
X-CRM114-Status: GOOD (  11.10  )
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

Add a new ath12k_hw_version_map entry for the AHB based WiFi 7 device
IPQ5424.

Reuse most of the ath12k_hw_version_map fields such as hal_ops,
hal_desc_sz, tcl_to_wbm_rbm_map, and hal_params from IPQ5332. The
register addresses differ on IPQ5424, hence set hw_regs temporarily
to NULL and populated it in a subsequent patch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index bd1753ca0db6..c2cc99a83f09 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -50,6 +50,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_wcn7850,
 		.hw_regs = &qcc2072_regs,
 	},
+	[ATH12K_HW_IPQ5424_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = NULL,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)

-- 
2.34.1


