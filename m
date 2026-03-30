Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026151061B1F
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=; b=yszyWcH0psKwrv+9rlRYZN1x8b
	h4PAFtGucIlH79nT0dS9X+87vQIY/ianWVg4jd0PKOr5SrMNRl2I0FUNcqZQNBXlvvh6wdAAwngBl
	tEhWg7dFiQf28XxkJFlvomYwczSlc0YDevMl6imtuYr2m1TAsK6jSdP6DMRum9nb9BK1JO1gZn3bM
	+jfd7Cy06mKwslXYfMiJaD2yK7MyAbLUzqKZYk4GbKCb+uey6QDem8S1VP542L26ukMor6gox6mrr
	j0GphqDTKcRXOD5VHGrzwgGFBtf/N2FQsQmX1VBldi4XngN2LnS72Z2UA4JzmKFDtjQF+bjPErSoH
	bRqTL6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOW-0000000BqKd-2nsc;
	Mon, 30 Mar 2026 20:39:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOT-0000000BqHp-44pG
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 20:39:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFnwgN2723231
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=; b=nnC6omH7DK8rffr4
	JJvweljcHOHD8MqehQadaB9avOrHpGUe88uyhfDs5RgN9P85k6WIQpKjNhXqU2iQ
	OxmJwXuzGpe7dtMz7qyfpPrZvRU2MAMnSVeJWy7fF3V2LYumyZs8WtSbVc18hgee
	NV9p7VPiKmzCVh8o+VK3ts5p5mGToGMbeoD5JV9G8zI2QBlDEkMdo3j5Y2MUOhax
	wsd6tcz8nEQbaAmFvZo0cNXKL1P7c8zTQQNsmqWjcO13TLXsah7HEl7QSxREE+Pf
	XcrXJ/FI1tZfl/2M1N9czU5Rl/v026/k8aotYP7/TlbNjLEn2/o7YsrTsd0DqVjJ
	0u4rPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0j9pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23c909256so37770105ad.0
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 13:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903168; x=1775507968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=Xop/ZxGYgWqsorWbXPz5h+Z7u7gKqJpx7Y9xMyCHseuR4kmU/GpZ0DWPEewbqykXHi
         yB4hhV2HKDH4DY1DGAFmYl/61RudP6tNERMt3b/ZIQeZfSVVvRlbJuiYYJ2v1GStCa2Q
         p1pBB42FAi0HU0B+BjEtb8FxRiNjXeWLujJ/0E5tNHHMbCQ8DFG2ttJrQJJreERvEuXU
         OW3PxxMnFDV0U8hhnxpXdZui4LIJUmUAAbjocBRknv8Fn9qwfBVHEUo19dLFrgAmPLwT
         f2ZJYct8TlsH2Kq5Qq57dZuyuAeyfzAgzsaTmP9kFnzzY5BlVIaOXzxD06psPVMONRxv
         nBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903168; x=1775507968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=dqtaVary44bB5K+zLd9OlOxU7iyfLXQJJR4GABhFCHSD7Hk2u0SBhyZ0S5VxJBzkHF
         YEdltbKx3SdKGiSnN7PzM36NkltQJuaDl+f0B7o/6iXvuCnIEh54b2dM+zflcZAsnexC
         EC3OoJP22eH8ZVWk6jXUJS/dWSGtzaDVAPaLOu8GU69BAqWUrqYdKyIh5+4VVDEpOA4l
         qCEcRvAB39g3MvWHANAL3/sNlxqhA/CoAkASYOYwL/X9QM1D//eRiEz5GxtO7SiI0NwO
         rf7qIxb+LZKOJxzeB76KAd1pU7w2tU7h5JiBDf8JlEdgzwgeDIOKiKI8bq/IFelPhTFc
         JW/A==
X-Forwarded-Encrypted: i=1; AJvYcCVRBngPcEb5mPhr7ZprDdGx3lR5I/H6u0BTZKp9BnJTXIJ9o3rxqgOqxXN4xXm/CFMktqKBNjI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrkJL/0F7aHuRGVdz+zsn1nV2Eq/MIzWIoFAgRLPwcPc4yDzzM
	mEb0WKQdtYAsH/JPhD901/6mEyOp7qKoanFoyyzpywmYjyE3W79/Oc9femIT9dAo/wgKHbYz/WU
	aLnQeEzgD3F+83A/GgBhA5CPsO8qORwWcvsJYxjzqu9OGzUvkTSfZKY5VTzpnknQM
X-Gm-Gg: ATEYQzxdw59w14bFc6iILecgGP00+4UZbXka6IYXjq5/76dTixyha37+yIk5C7tpeAV
	csRz0cK7AFJjX9HEJy3Twx8n702yDc1U0G901rjtVjJLX56LPmDjaJ8bE/Q9zytMglrZa/66tG9
	XKIcDWKx2Jc99CpaBNqpDVprYLARh2HRedZE/Die9g5hadsBu8PdUcxiHV1IrpwYrIhjXvwd0rb
	d1aFqE01pliCZ10QDq+cY3xwy8QP+DSwa/wISXDxiW0cVc2Cx9VuaJEaKtkOQDV/gUpb56w0/P4
	yrq7cm+H6if29sAP1eQF6zfcItT+ZhGfvyKKoril3OnMegjV9sc+k0clWp7Zc7BTdpuJkcKBwvG
	Q4rw6rtpZIVwPYth7oo+dVpcDwnQdxV5sA9iD1ZPQgOzKpKv8JGNDMjVbMv8tWII1hyVc4hqCV3
	8NhKudj2j4JpC3KHYl3mrxDiy/Z+ZGy2t8UnVjvF0=
X-Received: by 2002:a17:902:e541:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2b0cd9eee9amr146049805ad.0.1774903167700;
        Mon, 30 Mar 2026 13:39:27 -0700 (PDT)
X-Received: by 2002:a17:902:e541:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2b0cd9eee9amr146049495ad.0.1774903167179;
        Mon, 30 Mar 2026 13:39:27 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:26 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:08 +0530
Subject: [PATCH ath-next v3 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-3-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69cadf80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V2VgLR5doq-8DBhT5hEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: SV29tsxhx2tdrLWcMiGkC3dnD5gBeriP
X-Proofpoint-ORIG-GUID: SV29tsxhx2tdrLWcMiGkC3dnD5gBeriP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX+kWVnZ9087sQ
 plXDyCkG7gXlpfUW+A7DDaorK0DQ7r1yOvg5+leo3VgpIzo1YpQQN67R1V6LyUFSqHQJLBwX2Py
 yquYxjG7NNz+utNpo6HEpFnUOskP+WGpVDsksYnEowCR17LY5zTdFZRHQAkRvqga9ic+Vwq935V
 +znwlJpReuUiJ4QG8/WuBdq3bnm8KGTbymmpJu7Ydjv+iay171oVlZ8/565PkA0wGynXFz5WGtN
 M54c7ZYMnFU9jpmRlVR95h3afHAjDnzGXcwTgIQl259pODNEXhw65v8n24L1IdqYjq59rgfT3uh
 3hqeY8ywZ2lWmRY6IBI1sMpsAl79NdjE0FL4hl80poTou3dyOSlUsmTV4WfPVoUVai6PA5Uxtrs
 XYoFzQRaX4egb+gTkk7rsVtjuFg0HTHzDRUQ73gbFyrxhsCCz1R4+1/K5TivqgDha/2KUUX2rkN
 CF6F9cjP5v9/6zcSPnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133930_136193_52E04CA0 
X-CRM114-Status: GOOD (  11.55  )
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


