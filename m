Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98755606A89E
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0s+RKiGk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9Tsvygw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=0s+RKiGkZ0TGD7
	dGeIqkmlnY/xIoSWtwE60pWUu2+zeBpMOM/oRi96q0vn0cUr0YKXG6yCKRnvJ15loWdWe1tcBHTPm
	GLwxm9c5fAUDY2RIFsDgKt+2m2IrPrXJhJqLK9QhPaVJFhketw26enLcnZCBcZx824HiC+REse1uq
	ZP/5uqx0AKlfZ2K9IDJVjCpenFAjH4NInupRRHf+AxajMxyempt7VxYw4PeYzD/oRWBMTXno7BYHB
	ZVaw3dAyt/TPvS7V8DlERZH1cBlv4UZK3sDYrH0GUUQBzFr28tUkEWV5YfHmCHDn3sExkJPz29R6x
	jXS0xKtxuC/S89XejTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqY-000000088tu-0gF6;
	Wed, 18 Nov 2026 08:16:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqP-000000088lF-1vUc
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VDZQ2106647
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=FpVrs0Bha0w/0rn0
	aXJhKN/JmYwXtN/rPG/vJzue0PU8ZxPmj6NBMtxe4mUsnR8BnqGKZvU9kR1FZVhc
	qtTYZwuc0NDyeaJJ0HeKlg1WS1OitJdRQ3h2vfXeaM9bO/8gqdOJ5z/Nv8sP6fut
	QKa0CmmZbO3qEecQkqbdhQmyOYcr9s6mrguRhpIRd0uSaELLDPOlOTHBLbatd0/Y
	Zq8HYZeNB3LXxIBWfeFDRWXKVMOl/+kCHaTPAA4TGHN0aUKo6IkhR8WxsUO+JoIp
	LtzOPwErN33XFku0tzlH8qXUO9ALcwXp9RB49c1qGAAN8SOOVtCzE1G7ldvZg0lS
	tQsT1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sxq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so778213a91.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989799; x=1795594599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=J9TsvygwuAX3Qc7s3NX+TVTDTQaH3U6HQQEYI9gCHgS2n76yNSeVFI7lqb5f9CNWqG
         LjK3rrFzUlSqbzy48aucAS1Iykn9/s96ZoFiwkJgk3y2On9rzpK9CchJLve6zUg+sdov
         TgmrBJ1cDGDB8iX1Pi5jgzy7jb5EqCFSCzvx9pesi94YPQeJ1copUWX7jUz8XLgZG/jp
         CTc13GT2071iqTCpKRPHs00SlsM2uF8pelSgGVMF39Gg8BxFX5NobKSfLfuR3zXzRe5q
         OVS38jBPPHHaKyUIs1lN8WEQmav19RTcOzVj9isEPv8nTVjB3kbdh2xDzamAc5vIZiBl
         bVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989799; x=1795594599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=PpHG1ia9hDdZlmeHzhu/hr89zWmXzZ/Ypjw2LFHhZy7LUyrre98HFFWO76PmWjl40c
         k2uFR0KyL+mZFjbPotMJp0khif+x7t9uH2bcjozS+Ng9Qaq/D+JbIpsmTe2plno3UHrr
         z+37nSYhyN5Z9o5ncNatSiTZG/1QDGRBG9Um5QWx8GmFmW71sl70WLYUmv3Kv5XTLnGE
         6JSp4uFIsXA4+xjXNKITyk+nwuUy3VJYwTuJYCG4QjGBin6GEDhpP3nREe2ezCadAdxw
         h2S3h5WQmuaHAu7ChY5tJNIoyJQnohIX/YxwTqwX3qj3O/ri7A/bKw/1XgAXf01hucih
         p6nw==
X-Forwarded-Encrypted: i=1; AL+hErFnJSbP64AovsqtYHyoF39sbVtZrDl+ioBj/7e/yyeXoxd9+tZuQcyZBT9C1yJYU/ztzZBO0SU=@lists.infradead.org
X-Gm-Message-State: APuU4Z8EXmMp9h0yH7xX08UEK/qU/c3Lqq2+5cz3qWZC9ZsbL+fbDj5Y
	+B+FEhon3zIyszPCdX8n1U+5MwCZo0cKKZ9D2/QF0EWAbjCSMG8ucK1clfiVl1MS0JytXwVRRVa
	sXCtYNi4WRsuSt5bW7yJYDQ6xlFWHVt3C1BuYgvXHfHSLUvVscOPVRtTVCMwmk9vRRU6airoO
X-Gm-Gg: AZFdTZeysn4h+0pefNVUU6DIxghH0/xLE4K9myMUxd+bspBmmhgniZeDuFc0ULEqG77
	vwmq/wwGFx/0tT/qBUkR13btTOH3pi1dRFsqSb7T9a0BuHhlt5WazYp2pzlY4tG4gj0mp7ptiDz
	vJGYLTQVj3uTk7MMgpYRxY1sSwuVZWu+WOiXx63VGHj4Tl0yM7V/Y3MCb7bXUQnXTGRG7NF8neH
	5Y+VV8no7MFdoc3ATB+tk48dJrHfvE61vteRo8y2Zn2vgGvr15W9BLjC/Koi33Bt5twsXMgljtB
	7j5AQc5bB/uRP/iTpDpAfFZzGTjH1i0dvJ42VSgkC/yOvH102h/wB3r0AduUBz0E32U/iQzu4KE
	YxV7jvBfRCXZjNd0F2LGHhEKGXU+JnujiyuvwX+dzc0Gw9DllnJ6/TkDhDUrpwgV6T6X+WBCB6q
	PF5iZS/fInOU29uplG2plxfLA+tZ41ZiwD3H46hAUO0v09jPiCnt3uMI0tL2OGhr6xx4fhiBXYt
	Q==
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922930a91.49.1794989799354;
        Wed, 18 Nov 2026 00:16:39 -0800 (PST)
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922910a91.49.1794989798904;
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:36 +0530
Subject: [PATCH ath-next v3 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-13-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: X2e-pxe0p8HXxsracQ2Xv_OkxOXxxExq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX80Jg7s7jrDhG
 kCyiVzmNoXeyPCwknJRgAQhVIwm6B2/7+8HjTJE3CXSHoDazTanKKhu7lEptcmj0s8dyZK5iZF1
 k9VbK63Nlu/iB8jhh2FTB1f6xyFBkrU=
X-Proofpoint-GUID: X2e-pxe0p8HXxsracQ2Xv_OkxOXxxExq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX2/nYyPxdQqa9
 Yds9LHZmo7solOFiRCmiBvIhDtWsms6tm5AHVccsyNLMqNqTbkYFzJthvpeIf4pIaxaTx9ft8ec
 XKQVpNirrPQyM/JYzevorcZ7hStPR2ZTCVHAqjNVpKWhGicq+TnJZTMUxnJRlqya2Z+F6BC7F+2
 hnABVHYoC6fIHo/idnp/RbznX9sbk+QDjTVJHee7sqqyeaUiFdxHuvs77R9nbil6xdftb9avInU
 C5KNU98t7m9xK+LqN2ZDBY3nEbQ3VSTEXC4jEfww+c5UmHSRVQkE0rxliqOLEI2Eidyju3+B2cQ
 BGbyBEx3Xb/76aWMUWVzOcayhrpAFz/fF6/zzl3Htc0SbLj3L+awj6IdU/Ixb4MVWFut8ce/KUv
 vWBHTpGp/DEsBZQTr6wYvj4dqVwTMRtIi+V3YG5kBAOhO3004600qJTWyq5yBOuG9KZqRwooIU9
 guY2DLGC1g4NrjnYq8g==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5ee8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001641_630105_239D4A0C 
X-CRM114-Status: GOOD (  13.94  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1


