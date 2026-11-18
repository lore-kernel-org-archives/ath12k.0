Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4560A2628
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJBwZEp0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pNAS/BGz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JBY7sesU;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XudcsCak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=OJBwZEp0xx/wZz
	O00KA+9aytyVUqxz9lmqNbIDZVLa6Okeex+j+82FZ6hL9AsHsnUWHFUuVAHS4k+ijcFjRx1Xk53Ta
	hSEz0BbgKgh1pnJ6bY5Gsy21/akiAS/rXNPJSUNOEWolTgZvfnJLjVIenvK+wtOibrr/MqSPCkirp
	zF1FDwISHpBHAshJraE0+MDo02z/1qibHzXWIbBcb4ln8OUUfCCsXV5KE4gt6NXisOcDeFa1z3GWB
	a2xq8cUEBHaFNggQkxoPonZIvnbiOtqJXwRvlBLW8jzX55Zj0kTrqT8baPkdUCuEi53cB9Pep0u7S
	oHe+gx6Xf8nXftcjZiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqv-000000089Md-2M4u;
	Wed, 18 Nov 2026 08:17:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqt-000000089JF-37Wb
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=pNAS/BGzuRdNrRZLtOG7oNFCTY
	pKr5PBIWBnttIjeenSLqvdCHv1a/zZxyem3MY2KUY9Ie5GQoO03ctX1fr0rfO9o1mqqJt5ygUplSY
	QMf/mbMhI88YbLzlopyBQEizFj16M2FUzHFSj3MiuIecKuhzIhhuHv7JiQ6Du++VaKuoVzjnEu4f3
	tx89F6lyXLtu9lk/Wn+pce1+qINH+BygDpR3UmRhZ6qQum9kpWWCHRqiBwKwW5d5Npu9vWbYtgsp5
	eQpaU1fI3QEH8y3t9YGkiNlg+WxokAkuzYzMaYqre6Gtz0D0WYtH3vSYmuSxpZ634j2kj8YIgtfJG
	787nNzDQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaql-0000000BJ4b-31EX
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:17:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uo923371277
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=JBY7sesUIbidjWgg
	Ql2d8Y5ASHRZJZr+/adbwbzV2GZw3O2aIA5JRAOTxCBih4H91kNosboaDGHMi//v
	ZdvXfKIuPakMoM35vaFbOPg0ksdZRS3S0pwCQSAi/RBlDWBo5gGxD/wlrVOPPPXJ
	bFkCNBq+tPb1O8jFISU6u/Eaa5hd7bwpYuNGSooNwumbC4h0sSuNasohNhmlKhan
	Fa3bKvaQhrsbiumXSvHq8FL8Iov+9Wy82ZphJzDZwUIsYKkaAZpmkfYdpEwxTJJ/
	BO7ozYNZbUuIs2NcX+wkKDzvFQQIt7bWyHLG69OOT+1chXXuUQgH7A57mU6O+UpE
	GYn0JA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8syqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so700855a91.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989810; x=1795594610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=XudcsCakqxSgqEgV8XavxIsbIVYYBqfSMsL04BMcuVi06ajleYqcsvqj8YCOSzysoc
         +YGq6pxxK0ODUmtU55/hj1ip7X2OwLzGvV7hEbWJJNvD7hRv9oRm95vRRleuFiok1VY2
         rdgJ9AUWPQT3Q8qyYziZP790UFKNOl6IkS7C9b1yEBLxic8a6s66rTjBEZ4Xx0RS3Cq7
         WLDUjH8dfPU2VcRdPwpYsxSGCfI5E6a+c7i3KjPhCcF1BCnYW0Kgqyzk3FNnvm1uP8Rh
         7TjvajjxIWWJOWfSMSP0p9v6UeO3NYuK/OvFDWl1bMR4xIAc/JaHXi0tEcALUuaw9SQc
         dUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989810; x=1795594610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=NgjmQ69SfFDDjXFzNp41zcjlQ5lOfSa1yX68gyYaf7o92o/otlMRt+Rim+wGKphUwz
         wSmRdIFITyQhibORiPuGneRchH5CjdGDCEIvMJHy87xngroAFRjeDJ8apmMQ93cRJMQw
         V1FLTktrF/cVdpYL+/epr4uastwkduLCzNMngnB2P5u+GoeM65wnpjl4/V/0rsIggMIK
         macDKgrNAutVFX+ExAZcCw7e+9AODkT4161LyxssievsZhg1/B3SiYzDsnDEpZE3rqGo
         IwhDNRge780HsZf3gnaCRkWXQOtvGS5SBSHaUfQLGtAjGLi7HlfdSv3l1fWilRfRN1iz
         G0TQ==
X-Forwarded-Encrypted: i=1; AL+hErF1Ous/EDAmvdKMUjTdGYjeXYWi9Rke8zOwUHTOptWGx12IUDQW446Lta1qTmA6vW/OhjBN/SY=@lists.infradead.org
X-Gm-Message-State: APuU4Z8X9vUeSRp/0yyo5d6WpwBEkWeBUHP4492SKHfHVojn493Q6Jwx
	xtPEbzQ5U/UAdGPSw5jCV7J/3tewkX86wELP8ehvMDlX2nhKQDZVXO4OUj1dHOqfVh6puPu/Njs
	L4o0fTknPJZujiTZC4Xst/ZoQlIwjKz7VSysqRisa1B/LNOOjRAUHmNOA5c100Ibw+fvQhwRk
X-Gm-Gg: AZFdTZfsbKMhNQbeivYbj9KnX5kd+SYE23W1n18Y4DZTqdQPswZdq/GXrCrfW61WkeO
	aXiT4wUa/kKd4tW1vcVz86f0xOY+PbpFF6IHyMJ+C9vyEjlEQDAYUv5s0gmMu08Hf2FYfnKXhxK
	YzNtNP3ZBl15wJBiJyWdjPVJyVJRvPeucJWzxoZoJyW1rcc1R9TPjkvY+LJOWQDSdxMIEpnkX5b
	ikF/prfsjBog+U0FmMz7FLGR64CFlUrkJdaZhN+ggl9i4KZsua7gYdttY/NfYFWDjA9KM+LoLj/
	HU8MQ8Saz31dTVapvhzY6xLzb9kcDIJnKZ/5CPVkS26fppk9+f+BQfH21yOQOIOuujVQ715TIQS
	g2jWbv6MKb31T+CEX/4l16P10vlZl8GukjLem0g6FU7BkCBVMnKwEb7huVg2BWjM0BFnN/be+0v
	9Zof98qn36CGLu52hW8cF9E5OoRZWpTrE8OzwSlEndzqSntHbx5LGSfO+g3kVpxTLjc+3gEc0pR
	g==
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1583863a91.10.1794989809574;
        Wed, 18 Nov 2026 00:16:49 -0800 (PST)
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1583842a91.10.1794989809062;
        Wed, 18 Nov 2026 00:16:49 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:38 +0530
Subject: [PATCH ath-next v3 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ef2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: o9jO1b1QbydCuw7S9bdpj2X_NVHE-b3e
X-Proofpoint-ORIG-GUID: o9jO1b1QbydCuw7S9bdpj2X_NVHE-b3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXy9E0t77EOcMP
 VusY4mWJkIVP+9PdEVJmIRgsmtdiwwd8mWJKCZj9eEM95HYPPVYDjvv/l5nYpM220py2fDpq/5P
 Znxw2bjLPozQXOT/6dbtnVHkHbIvXtFNM6lTbGy4h1jQUh3I4JE77lXDPug26gfuc/e8ih45Aoc
 Y24lwUT5TfBTegDdMs7JyvfB7c47CEfF9xLJqWI2TfWsT/GLPWgoS0icPSOrfo/CSQeX6jtFDuK
 h3tMVFuNwn4zHfeiekFL2/Qeru4mbbJMoKveMpLqcuTw9QGSy3IQDBny4NEisBZ/zfaouMdcDmZ
 Rgtoutkj9kMifr9JgeSvBUurTGgMaPpelImeN09eQXQArVveah8vFeVWzxLPlMv+eYtEZOAxgLe
 q8ToxTGBrgHYJy4aXYJdkKVGWRBKRVicd+EytVY2AFTa/B3ThEF26fGSh6H/hKryR/O6vYEw/Vr
 VYFt8oEmTeOzZUWyzpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXwXtY+rj9ob0R
 7DAwBqEBoO6vrZAAyS+ZqkxSiL5XZ8+gmsutDvOGUjwYUgyhfOtiYspSBUJb7LESDksVCAvRHkK
 +P0aFoz6pCbzQo2oj6I+X8WmjysyoxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081705_798826_7C16C458 
X-CRM114-Status: GOOD (  18.75  )
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

Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
[20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
per-device window selection. Implement ath12k_wifi8_pci_probe() to
configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
8 DP vectors), static window mapping, window register address (0x3278),
and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
to complete hardware initialization. Define the Wi-Fi 8 PCI driver
struct with the probe callback, and register it with
ath12k_pci_register_driver() in ath12k_wifi8_pci_init().

This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
and MAC datapath support will be posted as a follow-up series.
QCN9575_DEVICE_ID is intentionally left out of
ath12k_wifi8_pci_id_table for now, so no physical device can match and
probe until that follow-up series lands. The id_table entry will be
added in the final patch of that series, once QCN9575 is actually
functional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9e88bdf4a93b..b30a8039b2ec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,8 @@
 
 struct ath12k_base;
 
+#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
+
 #define HAL_DESC_REO_NON_QOS_TID	16
 
 #define HAL_INVALID_PEERID	0x3fff
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 19e02bb16ff2..fe880b0befcb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -31,8 +31,6 @@
 	((hal)->regs->umac_ce1_dest_reg_base)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
-#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
-
 #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
 
 /* SW2TCL(x) R0 ring configuration address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index c99521abdcb3..89fa9a7f3fd9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 /* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
 #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
 	((hal)->regs->umac_ce0_src_reg_base)
 #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
index 3975081d167b..fd0489f8333f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -5,14 +5,101 @@
 
 #include <linux/pci.h>
 
+#include "../core.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../mhi.h"
+#include "../pci.h"
+#include "hal.h"
+#include "hw.h"
+#include "mhi.h"
 #include "pci.h"
 
+#define QCN9575_DEVICE_ID		0x1113
+#define WINDOW_REG_ADDRESS		0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(25, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 7)
+#define CE_WINDOW_MASK			GENMASK(13, 7)
+#define UMAC_WINDOW_MASK		GENMASK(20, 14)
+
+static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);
+
+static const struct ath12k_pci_ops ath12k_wifi8_pci_ops_qcn9575 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static int ath12k_wifi8_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pci_dev)
+{
+	struct ath12k_pci *ab_pci;
+	struct ath12k_base *ab;
+	int ret;
+
+	ab = pci_get_drvdata(pdev);
+	ab_pci = ath12k_pci_priv(ab);
+
+	switch (pci_dev->device) {
+	case QCN9575_DEVICE_ID:
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_wifi8_pci_ops_qcn9575;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
+		ab->hw_rev = ATH12K_HW_QCN9575_HW20;
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "Unknown Wi-Fi 8 PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
+	ret = ath12k_wifi8_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "Wi-Fi 8 hw_init failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct ath12k_pci_reg_base ath12k_wifi8_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
+};
+
+static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
+	.name = "ath12k_wifi8_pci",
+	.id_table = ath12k_wifi8_pci_id_table,
+	.ops.probe = ath12k_wifi8_pci_probe,
+	.reg_base = &ath12k_wifi8_reg_base,
+};
+
 int ath12k_wifi8_pci_init(void)
 {
-	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	int ret;
+
+	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
+					 &ath12k_wifi8_pci_driver);
+	if (ret) {
+		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 void ath12k_wifi8_pci_exit(void)
 {
+	ath12k_pci_unregister_driver(ATH12K_DEVICE_FAMILY_WIFI8);
 }

-- 
2.34.1


