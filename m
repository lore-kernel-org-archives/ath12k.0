Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F55606A31A
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iVFCT2CE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQYopkuj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DawmWJRe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=iVFCT2CEkZ2ICp
	Gn3aS6479v+PLkkPnut6ws5OLzfbnW06TT3t9n9Nhbwa9rYzAJhVRfWpXFGMA7Q/iVdzSoLrsvnV2
	vXeb4Ivq9F3lhW31QVZl9lk3cKARo/LGPi/Efi+tScbswRvJV3oDVyUdeAeD3IvP2u1VDNQaGDoD/
	kzoKBP6e3upRWUAHItGnXiJ5jwcGbmcQt/PaC91X8rM0YtsmQucSlgBi+bWIl1c4FOR/usRAaZ7z0
	0X0hBvpestwr7m0N/lwiC0egmlwToz/3IogSm2wugppKaU0ZtzKRX6KHLP8jobkA0XvscV87T2ph0
	50Uuuzk8+CMgoILnSv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA7W-0000000Fovl-1DlT;
	Fri, 23 Oct 2026 07:55:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA7U-0000000FovC-08s2
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:55:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F899425685
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=IQYopkujZvHpVxHY
	b1d4rQf0efoSQLNWgNV/ZRRuDpKpgm6K4s+f4hyEn5kMwRatTdJ53MDZWlxHus6r
	+mDBbR+VDPpH6wXC/UuSoDKc5NGMFmUNSE9/9EOdsYdRE7q0cIme9Vn66aw23j30
	mhm9h0wVOXKzyn5kxX5XJrHhr6SFGK5vhOWm5CiFWm78tYK/G637mXTeGWVTfS+9
	qdjotwmZURqGLLtlhZn+5kl5/VekGUQp8cR5XtzD+jj2Jo35Jdz7q+4vZz0/wp1Z
	IOy4M5ZV4XQqe8ScrYGf2MusHCqS1unN6My7L9n5JLKDSBHm2DPLXt+XC/WRH8C0
	3EsexQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2bn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso573716a91.3
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738947; x=1793343747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=DawmWJReiEVbAejIJ1GTuQ7YQEt4xN5dr1NnWJhiA17Ty3WQvu6o/YCjU0JW2RDJmG
         FtO+6FytL4RzgSY/DrOW0PBrps3S/zOoqT06Pc/ugWe65urwjgNjnobeDtdPqp3ec8HT
         ERMPCdI8niERymDcShx9or3hXXzwYUOJg7T9n44md8jAyGQUCwbw9+gVd/PwmlSz0Oov
         RsedshypQKnqAG8iy0y7TADfx+d7E6CmJziTBxb2DnJgQiJn4XLOaZmb5iT6dv7KCSzr
         nh/W/fxpkjamaJcxhrz0FJwbk/kRamf0xoeB6/siOqklW/NNQPYHVGj55ZhrEtAB51fC
         M55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738947; x=1793343747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=Z3Ca2drf19iRwixejXvycoKKVn26U6GhlUlBn6W7JwtbkC5v8w80ak8eOfdJ0JA5zE
         p3Q+rSRwg9Vox9J/MYaa6TuRyY+wr7DfexaM+JK0EWLEvz+nsL8dJPzofegJBzgOpbAQ
         vhJjvTJxyUz1W1AXaZwkMPoS+mSEpRMJGK1D6eKuJH35uc8PkCpJfGXUyaz8qrxvo8ei
         TX9lE8Kp51QlMaaDb2oL5qRHtiAUdfmuNKPXAP23bTMn/cqCyjqcvXCcKn0FzAWpvFqA
         lh1y5zahHqShCU4haYAWMgHqNUYrWyv5k29bzKn6qrX3OUlJx5SDU5oNmzFYvYKX3cQW
         Xa5A==
X-Forwarded-Encrypted: i=1; AKwUvBwS9aPQ6hET3gjA5IW2Wsms6vFdAggMZ8qCSqfqEjI7QDEU6fkzbm42EC4r7LREfQpR3KtYKZ8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJgjpPusgciVOkB7LWvRAP4bsUoXCwEpQWBAf6GxHVNAp4clAed
	mBej6/90fNzgRyOo4YihBGBkdf6xXBaRY9lC+m/zzGH8IYCNjaaOyQYZalqECBVuVif7E0h/dOe
	OmNQ8s77p/fI1R6CSxbhCNHfbiFzZ5eJ8ljPu0LR3Oksoz+xiyyTdvWz2OOBca/VB
X-Gm-Gg: AYBFou2zb4RdrKcqayQ4o/dszPucepEJebaXhr5m7ImpqZYHUWPioqTmumZGAaSL26N
	cLYgCehJjuKRW8vmsWMU/WqZaYvfv/3E7LNtSK9Xg9jD3mrTTDT45cubmyD8+SM3/2hcUfnzX9P
	3zNvenwu9j/D0XqvUha9VOIPE3OKE9FNcbdX4tA8LwXtQHmabPgzGkUL88Ri+lEa6nbKEqfbxck
	bdRsC4Kg/CIQT8EfkV/lXIjF7uCv42jksIhKl35OfD1GMUgLfNun/4l9j3sWXinabHluiHikm8f
	AG08TWsj+kTYnMx4TtBL7hCmabxhgzwEcayiFn3IswjXworjl6H/+bwUflAM7m3c9xw0yyvdTnM
	UvnvtaBRWwgKbmh9i8RxhP7vXH/na7dhP7Gkq56+qEN/H7Uw81pH/f8nyJnRotg/O5f3UU7apmL
	xb1NoZMDnh8PsgCjd1Wp0WLw==
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr1056173a91.13.1792738946676;
        Fri, 23 Oct 2026 00:02:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr1056152a91.13.1792738946137;
        Fri, 23 Oct 2026 00:02:26 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:25 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:20 +0530
Subject: [PATCH ath-next v3 17/17] wifi: ath12k: Add QCN6432 AHB support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-17-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2Mn3O9k5M7a4
 V+gOak0aPEPiNuA7EnToKG3XwfYT5u8Nv5w6YWeU9JlEN21pgCfOMfgKhu85PPiPpu7i6ZLVV+D
 yQhm9QamuZsY77CjFbpFy253E88uduU/dm0qO38IePYgUzooSn57gDlWOVkuR0za2pLiM8rxT5h
 CWWJ8I5z+RKvkLw0VrLaJFN6pHjUCiLESXtsXMhpP6qZ7XET9TECin3AfnrAoHH51h5K83uFyI/
 j0y4bqsqURQxwLaSoFiU6GwmU01v/v56Vk6oQXTStGW3FkEuNRD+ScB3AGvYkyaOw2+a04kAAzE
 zEbPYkWFmyk7NlN8YsVa+nm/zhTxRIKpKVqkutA8usjcTLLd1+bo8rZS3jS5A6LPtAyLf+DZwnV
 8jWKdiOzmUYG6qXVynKlmdWmiEjNfZ3h82ucaFZ9Ihn5IShcJggmntq26sadEepddV2dw2EAc7I
 vsRExp8QR9SMhanemuQ==
X-Proofpoint-GUID: KknqV8BgASCLg9BmxvmwT3KM5tEw89mE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2IiYBysQoqKB
 ejqs/275EiCx7UQcRbZl4LPFIArBd5YSBWiWdJQLwsKawd4kXlbae+flBs78Z6FNHgNKC3iz1S5
 +tVRFsRXIVaxaz7Isyb+y3GZo4euZxU=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb0683 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: KknqV8BgASCLg9BmxvmwT3KM5tEw89mE
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
X-CRM114-CacheID: sfid-20261023_005520_096084_626DDE34 
X-CRM114-Status: GOOD (  15.79  )
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
index cecafc12e8a8..b55590c64a2c 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1233,6 +1233,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1289,10 +1292,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
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
index 889361e637af..ae5380eb6f8f 100644
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
+	{ .compatible = "qcom,qcn6432",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1


