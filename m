Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B0606A328
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BaDvCYG7;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hKQbarb1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoeGyNFN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=; b=BaDvCYG7UqgcbO
	D3fmqLK3Izawsb+XAK5oYgs4A0SXglhMjlDbisjdo3fBqzGYMVcPnGciLI5itI22FCv03oXxpUzmd
	pduPrUpVM1xdrVTdaHh2zpiop/Q2eP99gH6IIeVAdZgrWkfUwf42IY70Gm5UDI/J1SkGHkGbuyT1y
	QQ2C+3ezpqyxAeUeQ+voHdm1h12MV7jL8x1NH+HLh/K0KClilUhMQfL0oxx0NveBkRE7pt79zpPwb
	tqhxneWGm/pSeySwOSgPqvTxvhuEHxUcNyYKfUaKQirUkse9jc1Uch+bEvtCpdjwMGKlkZdx4NUc2
	ZDO2Y/HOBwXC+sCsJkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HS-0000000FfxN-3Qci;
	Fri, 23 Oct 2026 07:01:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HQ-0000000Ffu8-30gj
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FrMs429249
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=; b=hKQbarb1BYVCgfgx
	WS/Joh4mAyMiwZ+731RXvNT5GoeO+DnRvJPZCjaDWqav7xWvyXBSnAnsxiBd0CwB
	ETcvfgUrr4SxmD2LArtCpzPKqy+Gj9TNydj9Au+PZYMtiYHD0Pd8IlgxBTeSUX4y
	0KY/aoPUDqOaZB33uIFi0KlfXcdyyk7XN2u9NvPK5XYbQVaLoq+Gch+FUl7GGhNv
	EEm6g+YBCSuc3wqf37qD+r/y/lBc/e8LzRPWKsZJBmMTvcfqrZhFpTLFp1GcPgIj
	/IXihBPgO/NyjMUysbnHPIzSj8s6LnOZ4+9lIdG8asbHKuFvB5EdVrm/4MRFX8EB
	3wYDgw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2bcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso705009a12.1
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738891; x=1793343691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
        b=NoeGyNFN+A4DoiCRqVREKCQOxuyA14yWEj+mfDZJ6dyKryRNBOV3Ht1PDRHEuOjcCI
         tR3KE5E0pKDNLYptFdgNUqEif9r2bf0+OELCxTw+RIdZVr/x4oP/Cxjb0PjieCmwPerQ
         gC1r5eCLlYPAeWTAJPKhw26p2tHtlA/IeoylisrM4irGjNt3IE340o8q3PdI0bqnr1r7
         t0P7j6mEhhzQ7VMzmKK4pfY6bt/IbyiYWMAySUlYUNp9gQRxvlpVYaJhUSqTHd9Glgkw
         JHFaleg/sORVFtp2nCKf7qISDAsUu8D+p5j44pz12pFd60GbL/c6lJ2HR4UGugrd8FOO
         Wi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738891; x=1793343691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
        b=gojUKqLP31p5y7Fn1q+8hZX6Cv4fMzwGlrUCNW/WfKwqKK86ohZ+sddjOc05DvIgyY
         GAYBwWp+sqSGpnbzgxnI5h6w5Yq6PHe9xvAXuLwqX5LxzAvFNNghBAlW6qB80TWSO1ra
         +Zjm6nVoMHP/tAuSZHkLLSEcZUp3xu+AkZu6qvXieEW3zA0YsebGrEH6Yy5lUBfmqVdy
         63Yb19KVpu8gA3wpBMtbHVmnmMRJ2+ByCwRK68mzdZAMhVvHYsBMibIHctNBF5CkhVTK
         6MMwCPkItJie5XUb1rP3qBWCzKuYbb5m/S/xF+kkeSaW5TeBQuoj/gSmw9RLogI7XgaQ
         eN8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrVAMs12vM2HXWeLzuXJmsWPt3gY7oeM8zoYboa+CXziNyWydY1254Okofyn5UlS2/f+6dhEQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYIxNT3qkS/SuXc5aP84zFN7irakBNmcofoJZ4Btr5q5Uy5+HpIL
	jZvd480faSHSg/h1dfuF2hlZkHiJPsIZSzDFnqHFdvERb5HzEbsrFnHqlzYwmcOXjk+myWa8laJ
	sZ4pREplikIzDmg6yGet0GEEVdxp0kLCOWlQY1PlfJIfkWQamB9dMEHciFcJSlUwI
X-Gm-Gg: AYBFou1NiX/MXV0YHTEVbSw1E4gZKYLxWP7TLfk6C1/AIhpMDQk7yEENv5jn+fgFe7A
	Xo/R6EGWw5Tn0bissxWQj8cGz+zRT5rhwMk/H7YNTNOiO3n9loJMsAECBnseHrh1PbpgZRLk9Ua
	oxMMIBL1dBgXrnnuTJYokqTUT8TOyMWsiffUT22BSVup/lQkDo0mnpCLVCXYyhjEfv1ICHFHsIZ
	7jK/MSMogIeIdvu/FHSEfPrbYos4orsypLAIkWWasHGQ3mEF4CSESQ8yoT3mDWuochZ7IMCUS2E
	EeNEogG6Z6fEu9fvyuV8ygq81d6zohfU/B1clU1NFMOrmnsZQVR/44fbye7EgiwCGr3R50mWd87
	ttomZu5blo5/KQ1n6IPcNVRq3DilulWBeNjqg/UEiNhnrtcelHGTeQRNizj3pHwIGqW5Vmfy0wG
	/yengBJhQeA3NgicL2RBaGAA==
X-Received: by 2002:a05:6a21:7e8e:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e3693502dbmr832385637.26.1792738891428;
        Fri, 23 Oct 2026 00:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8e:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e3693502dbmr832359637.26.1792738890923;
        Fri, 23 Oct 2026 00:01:30 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:30 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:07 +0530
Subject: [PATCH ath-next v3 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-4-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX+UM+88mwALhu
 a8BT+L7Samz0zdJn4AKagdSAx7Gn70DYsEfRe1khyLU4Kj1AVbk4lEO6fK+7U0GFT8bImJf7ODu
 3ks6PSnFbL+Dk8QG3Ls3vJr1YokNbkhzdfV1+Kh2Xuq6bQGytFLlddvLKG+cbmQWzb9bHDOqh4e
 edsVKDev9MmmlHWYQeJPrnQv6WONst4WI/uT4aNQNI7Itxclg9gFhXxvA35fW6ob+PEUYO1R2wB
 A9IN4zPqoNVVdpHY4acUdkujgtDEwi/jX7twx/ljEphbgLDmGFchcB7z0wIAqZN9fk/cxeWRIuU
 5NEWVxGbvkJru/8yq41xjxo4YpZF3yJrUW7ib79vttoYVHp9UUQe3+1PyAhkx+xeJTomavEGm/7
 jgKeKvaZGBZ4AtdGRVCn2y836gcJmObnPTW9pdBMQk88HYiooISj6ifpq1pZLPX5Se4h5LiYf2T
 /qwxHl6isr28bFD5ccQ==
X-Proofpoint-GUID: YwgpSDiHo3nmzzJZG3OxxQFwAX63t3Lp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3CYTTsA8LB3e
 LVL5WyR2hfGVAiGMYE7iSgEh+cJtysDKMVOS2kLOWRgv1yutVahm9P0xFMhf00/b1NUyUtv8QPD
 s+Dul71seaXvHDsiXUMkX4WO1OY4xbs=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb064c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YwgpSDiHo3nmzzJZG3OxxQFwAX63t3Lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000132_839742_43A286AB 
X-CRM114-Status: GOOD (  14.06  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware ring mask configuration for QCN6432 to support interrupt group
mappings for various hardware rings.

The QCN6432 requires a different ring mask configuration compared to
IPQ5332 and QCN9274, with support for up to 12 external IRQ groups
instead of the previous maximum of 11. Hence add a dedicated ring mask
structure that defines the interrupt group assignments for TX rings,
RX rings, RX monitor destination, RX error handling, RX WBM release,
REO status, Host2RXDMA communication, and TX monitor destination.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 52 +++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 52558dd126a0..833aa6d43ce4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -127,7 +127,7 @@ enum ath12k_bus {
 	ATH12K_BUS_AHB,
 };
 
-#define ATH12K_EXT_IRQ_GRP_NUM_MAX 11
+#define ATH12K_EXT_IRQ_GRP_NUM_MAX 12
 
 struct hal_rx_desc;
 struct hal_tcl_data_cmd;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 643c95c9bccd..acc4eabcf2bc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -332,6 +332,56 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 	},
 };
 
+static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_qcn6432 = {
+	.tx  = {
+		ATH12K_TX_RING_MASK_0,
+		ATH12K_TX_RING_MASK_1,
+		ATH12K_TX_RING_MASK_2,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_TX_RING_MASK_3
+	},
+	.rx_mon_dest = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_RX_MON_RING_MASK_0,
+		ATH12K_RX_MON_RING_MASK_1,
+		ATH12K_RX_MON_RING_MASK_2,
+		0
+	},
+	.rx = {
+		0, 0, 0, 0,
+		ATH12K_RX_RING_MASK_0,
+		ATH12K_RX_RING_MASK_1,
+		ATH12K_RX_RING_MASK_2,
+		ATH12K_RX_RING_MASK_3,
+		0, 0, 0, 0
+	},
+	.rx_err = {
+		0, 0, 0,
+		ATH12K_RX_ERR_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.rx_wbm_rel = {
+		0, 0, 0,
+		ATH12K_RX_WBM_REL_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.reo_status = {
+		0, 0, 0,
+		ATH12K_REO_STATUS_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.host2rxdma = {
+		0, 0,
+		ATH12K_HOST2RXDMA_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.tx_mon_dest = {
+		ATH12K_TX_MON_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0
+	},
+};
+
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
 	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
 	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
@@ -926,7 +976,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1


