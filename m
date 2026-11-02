Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D1606A326
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ns9mjuh+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FN4Q6ibA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gTcl/L7v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OkDJiKq9UvkXpx5tpZc8Vu+HkAF1n11aZGZbN4YtcU8=; b=Ns9mjuh+rjzvZN
	FZMycPulZa43CziZsB74S3v2r7SiwC8VcPNtavV+nDoDD5zqah6FiHWsYoup0JMV2pAAb7AVjyna3
	sAdRy0hmuo51tePBsUWkIkNRCozs1yeZkajsI8PxV/UbYwtl6uG+mKn7B0TltcJfeXYJIf9QXP4mH
	2imbNccYnoUqld7c1h/vx6X1ExeVeC2KtzxBF7PYC8M6VMTZfUkESrszl+h96MTcJwt7p6k3xJVES
	VvTsVOeWkH+uiyVlE/8EbXP7SBVtcFMnMMyqpediOVQncUYRFs+HQrXPEkGkv2p6ea9K/96nIpK9J
	Mn7Z+0UymwblQIs7tDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlgz-0000000Feo5-0f0j;
	Mon, 02 Nov 2026 06:38:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlgx-0000000FenD-13Hk
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:38:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vF5O3348776
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OkDJiKq9UvkXpx5tpZc8Vu+HkAF1n11aZGZbN4YtcU8=; b=FN4Q6ibAvCLEdo7Y
	hBU4SZ4bB2e5KS+k0ZeYW17NNK8TQqCGGgHfPqpUKrYpB4ORb1XML9+L1/weS1Fp
	blE8EuTFUFr8NjL2XfZzn6OiG6ef78ZFBdBgTsAvEy78XrdCXuX8SE/r0w8DzGvT
	FHem23oD2/k3hT0f+NMCZLgy16TAq2G9Zqn14w5mOgo4RhA4tQGTvpEgamsuVqMc
	TqHFsr1gVTn+Em2qY9HB799FEcC9eIU/KPS2ZHF3gT2+8RjlOIwEeCLploj788th
	lX5uXswy3xTfZLpemKEigxF04I5ddERz61q4WnmRIFJl45LUneEyBjqrhHm0j58k
	mHx6Jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnhyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso2083938a91.1
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601529; x=1794206329; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkDJiKq9UvkXpx5tpZc8Vu+HkAF1n11aZGZbN4YtcU8=;
        b=gTcl/L7vmeI6GOQdY+PaS628QGhByO3GYPYWG6AZ/xwHG2hl5sicYCSTZO5dJUcZ3Q
         jtahITNA826eDr3gbw8Fm1+617Fhnd6t7P0ob55sfL8L8F010fR11st7dR/gNQWNh9ut
         1v3Kmlwt2bhyAUaBEvoaE+mWrwmBG2XczHVBer5aJrV+p3ya7Vd27sAE5UhhOWuyWgOQ
         BwXmwijXHlUtnZaGmM9u+qo4Phoy5WOTg1w7V11hF9ng2LrwpCC9jfDemANEgqKhpIDY
         LXbkQIDuGtmqPvtNSJCG2RhXB+IocAwrwpzLyek9P+2B+6v809V8mEKyGubzZrLwVaHM
         iJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601529; x=1794206329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkDJiKq9UvkXpx5tpZc8Vu+HkAF1n11aZGZbN4YtcU8=;
        b=eKUB5rZMKwQ8sqzs8dxNLA2ZvCqb+UC2xYCNrr3cvpMxyNZHzEQ0SOKAbM58rFtn0m
         U9rAXPtVOEItbovKkCecOZ4AAFIN6paIeyDssz5IbffTwEcLdhwbC5KvOEHIB6a9xNHo
         dqDyOdwGrjQ6UddFKEno3b016+aCJZ+MO0EBvQ+1FFYihtWvdhEkKCwbgXEdhktb/MGc
         jYsOeSMfRxJGMCpJYU/aQDQL7Uq4lAaF+YCYzu22MjMfaSktSXjKjPGDe/GIrYZKlCoN
         0BtzXoz7Oy59vtby1LoS5K8EmrTneOwWzkimfyv4MpaWlsGH1TW856XlIjBHr2aGLY5l
         Y+Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxCc8BNbb20gBgrL66IDgetMjwDoUAlGppqi40pQ+wwC3eR1ObfELpU+IZlFxERJ7i9DZ7WPLQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+wFXTesPFhs687zU2GoQKLD0QqQrHmWq078ryq47Y8FPnqVpVs
	BsaHpTEooK0TLtn502sfct6EplMDC8bduK0yv0w+SrjiMAZ0Nsov9tlj/9uR8A5GTtkuMw31Mi/
	St43jWp05BDCCeo5jCPVUIaIJMQBGQR1wRw9QMOCOigFG84pYMhYVchnZc+lz8RnC
X-Gm-Gg: AYBFou0n3ArQU1VHI1MxtT78wErpZAmOBDbXOOdwjdOHl3T6vAUpZjBxRsv+MPG0Fx+
	KDTHEdXzHPvNUcam2vSEy1S0WRVz/NEsuoV145QuOk9HCj+WwIjlSMZcQRVD+aMQVq6oKUt+qNV
	uJIiL7XqvRQMhgcKjpvjyBwxqDaqLGhumtQtwZE6pBFL0u55+REiRYETm3ZDV+Onq2V+PsnmwOf
	gMOQmRySzXIo/Ml1wl7VmFaAuLw4susRPutg+x0vBYa2+l/8C01jqWy0tU39xSvXZ1sTimXyWOn
	CrHY7TZypEWtZlYMR3k0F50073J6VZViTF9DuYu92FKnavEac1/PIfU5CEbgdJZhektGhhroAD3
	wY3zep1mX/eo4JDuwrhydcjNgsDFclS8/BlUtfnmFwmVt9smTz96QfofHI67f32K34UR/Ue8XkO
	92wraKdhP34QY28LSk3D2sRClPdlis
X-Received: by 2002:a17:90b:4c04:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3ae897b519bmr6563024a91.50.1793601529171;
        Sun, 01 Nov 2026 22:38:49 -0800 (PST)
X-Received: by 2002:a17:90b:4c04:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3ae897b519bmr6563009a91.50.1793601528635;
        Sun, 01 Nov 2026 22:38:48 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:48 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:10 +0800
Subject: [PATCH ath-next v4 01/11] wifi: ath12k: fix potential OOB access
 due to unverified hardware link id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-1-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: GsyTAE_uTI5ss0IVBI9_KThyT8Tx9A9Q
X-Proofpoint-ORIG-GUID: GsyTAE_uTI5ss0IVBI9_KThyT8Tx9A9Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXwba6PKLfr7cB
 QdpqvwDA58iMHtAU9uXJBOnDYq12gGZGCuCwrKAUpHOkm3QaN+twIaeX9L6crBEFosYJFSbYjws
 +aaSeAPLR7wu4Kp/Xs68bWudeMnOtY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX4Te+xQwYxMX7
 VaKL+1JCIYhTCgotuieM/NdvmmvmRcSDnR1TFcFkhd4vGPIW8UaSx2T4juMyCXC6sYLdRTHN10c
 NRhioK7T4W+oYloWVcA1dFQ0RPbqJlbzO368wdpCL3jTZX/pOwrfsX1Y4z+7sxZTGr6aEPQCGyB
 qGq0eUl+oPNomTU0gJYBt2BNfvmD5X7CrFCG6iWiqV/FSydxUDie5nohWF0Dh8tJ9/yiN9HW/7q
 NJyNjoaDWZWvRsD+UQp9VXd1nWxZxoCh2TF1sb5nD5TjlS1yF2mxrEdx9aJOTd69NULsJzWNrbF
 NuRlWBmKz4uTmrT3WSJC6lSfKNRHziVk6kB8qwKzPxtJlHFIt6Y/XYTAVcPxk5HA1mxl1baYKSC
 eAMaC2M+dRbH6htqx8wNcsk9oVCU2brkSB8m+FyTEUNfFnZzSm+u8SyACCW8WxJ9x+LP6HEY2Sj
 YbuntE47tOg/tQt9tng==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae82ffa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qtqQsJB7fzTjSEb7W4QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223851_412651_D144A9CC 
X-CRM114-Status: GOOD (  14.42  )
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

In ath12k_wifi7_dp_rx_process(), hw_link_id is extracted from
hardware/firmware descriptor and directly used here (and also stored in
rxcb->hw_link_id which is used later in other functions) to index
ag->hw_links. ag->hw_links is an array with size ATH12K_GROUP_MAX_RADIO,
unverified hw_link_id could lead to out-of-bounds access.

Add the boundary check before using it. If the check fails, continue to
process next descriptor.

The same applies to ath12k_wifi7_dp_rx_process_err(), fix it as well.

This is found during code review.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..c8e590e5e250 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -705,13 +705,22 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 		cookie = le32_get_bits(desc->buf_addr_info.info1,
 				       BUFFER_ADDR_INFO1_SW_COOKIE);
 
-		hw_link_id = le32_get_bits(desc->info0,
-					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-
 		desc_va = ((u64)le32_to_cpu(desc->buf_va_hi) << 32 |
 			   le32_to_cpu(desc->buf_va_lo));
 		desc_info = (struct ath12k_rx_desc_info *)((unsigned long)desc_va);
 
+		hw_link_id = le32_get_bits(desc->info0,
+					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			if (desc_info && desc_info->skb) {
+				dev_kfree_skb_any(desc_info->skb);
+				desc_info->skb = NULL;
+			}
+
+			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			continue;
+		}
+
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
@@ -1469,6 +1478,11 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 
 		hw_link_id = le32_get_bits(reo_desc->info0,
 					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			continue;
+		}
+
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 

-- 
2.25.1


