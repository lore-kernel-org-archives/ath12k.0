Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913160A2608
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sUPoB1QN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eioDjqHC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKk0c5K9;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCd+8oXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=sUPoB1QNgUWA/2
	Cucpl2oiumvQ/GKnuPC6MOE2XNFFGyVdbjnR6m0EzCduuMjojwm8n9LS1G8P96CrbbXJ2QcW+564s
	MK9KPC5f2mB3mJd+UEIJSlSfYusflaoNe2cWhVq0MCPgtehxO1/h5Hr2/zdhFFTEosJfH1+ieCgNO
	ZQ4xRHAdqK5VwItTbLykp6BBCN6bmey7Dt5Yh/sPVOLvZcaliHwl3QCPWny51HtqG7gn+nRlYMDLj
	mB3C/IS6ZApcAW+uguYzqwL8mDji8VGUNcm/m4opIT7P97jgu8sYl/wiiQEX0t7N4NNj+vTwI9Eg1
	te4cCty0zPGpuMbieJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9IE-0000000Fgsx-1Rcq;
	Fri, 23 Oct 2026 07:02:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9ID-0000000Fgpn-0phT
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=eioDjqHCwpRIEGJg4BFBf0ziTv
	sWk7+iIhcjV0+VDjVx+AHTWo9pUtk0o+zTgmaAAJQS06dWP5EzLSlmYV54zu0kGNj7WNYX1fJQMZB
	5qMCuwqGuugQ0xY94IKncaav76vGfjbKLfR88KOhzPm+js2DcP434DOek7iHyR/ZM2HjcGEnJfzsi
	Z7e7uXndEzYnKr2I7Fhdy65PPzzWJxVhsFSHqPS0Dzt42tUNQBQx5tOIYfhv/aMFuXz+BVguLw4Tr
	lihL7oCmh+rXUKrmrsaCGXXECgpHrIo6XCsSp2xL2NUFPNAuoDn8EZ1hmL/BPf0BNM+h71xdIRQZK
	HyaLrA8A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I9-00000009vtG-1Hrq
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:02:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F0Q11289969
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=oKk0c5K9CTS6MWcB
	uGpmgNrpK2ZpAp8fPf0KP0nt/WdcO8gBvQ+jdVWHV3aRAKiRDqJedfa30en8I4tZ
	VPx8KrSw4ywMU1rxLf2EGmHA7KzhTgCwGO9ens/U96SDXq7rz/SC+xJ9ewhHBac2
	YtGR2OfA8stWhXFzKG197MXVZhb8zCU1Bzr7QRpz5bdf6wRaeSpRC42A9lDZrKTc
	dz7926Y2pTTbchPOax79XU3QvGfJtef+As0fgZjUExC88RVGt0tsgFQDOb5wPXId
	BN8SAMDRcx792542lgG0dDjFS+MaCcooUKyI/cX9ocSxMEHaIpTI32Nin22VKclA
	DWKgmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw2vje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8e16d22d8so9435315ad.1
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738935; x=1793343735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=OCd+8oXydKk/kKvibmasbNDkpy+Fec8lNqRUM5SXRbIpXGC+9wgQj0gt9oBLXFd/vv
         bYnQ1JWm2jbiscpgzz/dkCkV4qH6co99eZ0N7rCkAGMb1b5HQ2KaGwIjnS9v9s4GRxPO
         jqvAEMYRgzPXdrwRZ1FDzVd0iEh5V2+8tBteOQuUPmzS2iwdxZRLMDNBqY/RrACAeGGE
         qKnZvCSO41PUOhnooZRhMiVw5JE2QQZuvwn2IUw1kkXKUJtL6zbG3DLAUAPHBXUvRYTK
         cc3BTRANKtbTTejAECXk7kPQs8lLaNRXAKfJDslD9tWkrzDpF6wZX5pslYuVObnJxN5K
         R/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738935; x=1793343735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=bEGq9lfkDyoRTaOU4Bw6exuHBupBwTC/ej/8fvlA3HySL2k9FiBZa2NnHxeVSIj0RU
         DdIHstV+hYPfbLYYHQAPCDlHJiY0EgLFi5zw1lVBP4bkXdh/cXBsbTPg5B1XXWiVOGx3
         xAqeiLa0+3XbtDQeSRrXTm6RGg64a6k9K1e/opKwgtewiYeMTpb0faTGwsrlJ+QVZIMk
         8zp8pX5V0sr62PhOdmkNFmTcY/wuL8vdezqrBV+mBB1m8W3HCoaMf/1a6IDUP+8xUswl
         93VOVD0eCFJ7CSxoTMejSChi1C99AqMj1KjvEJQrK11uYVErehFxph/002OQNgnSEwd6
         klxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1Pyy/lSgM1iADXdPKvC8Ep3uk3fhLONchDUm4E8THMzkRndrTsdFxzl0xjyS9nYODqOvZhhM=@lists.infradead.org
X-Gm-Message-State: AFq9FYIsvYt77wXvSl1X5K9m54Gnd4KbLMW5A1HQfqHbE5SsG8z8bxq0
	9rIBToZ17WxutZIpvhyhzmTFqPlNX5kRvcLCFYVOmkCnQv2Me/HHk9XrazzN0EhY+hEe9uH4jdz
	mO49O0SbtRwyAVrvmDAXo6oSUrVgIIszWvPre7iww0CpwWLgUWcBfOno4HPRdyKKc
X-Gm-Gg: AYBFou2Du5fSw0AZkj1KrkMVz5+KZEUNaKXe0bFQDPPzyzm6tAT2swLM9eCejgv9JFY
	AAJTwQONVdON/VX8NpOLdObnYTyBoVWA+ijRcpOOyjUOTaL7nLsjGCdHwm72VD4a83LnkmURBvg
	6SRK6Sjcz9Sh3XZI8NvuT+ho58LK+AI00KuVEtlwyE2FNAWq04vzqHDgAQy0lYgEOTgIsXH95RR
	/umRKO8SmqMHtH4aspgGYsGpFU9w7oWl7cW1gpJj7Km54BK9AGuWB4AGc0QpdgsgHa0ErwvZm7E
	ywtV304sU30NFNmc9NB9BCYfus3oRaEKIgtZ8FPkXlHzQ/tmEfED2YYZW3zgUAgkaJ+jbBbpbmk
	PmGTDmVhCbDDoCd1Mfobr1voLVLsSTMeWRdcqS8zwPWF+WZ7nSJuJDFV8xFDmFnoAzWvoWrLb75
	uZZWfjNzveYNtJU1EQqeXMXw==
X-Received: by 2002:a17:902:f690:b0:2e8:3cab:3af1 with SMTP id d9443c01a7336-2ea7d0e1aa8mr12883615ad.23.1792738934440;
        Fri, 23 Oct 2026 00:02:14 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2e8:3cab:3af1 with SMTP id d9443c01a7336-2ea7d0e1aa8mr12883465ad.23.1792738934047;
        Fri, 23 Oct 2026 00:02:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:17 +0530
Subject: [PATCH ath-next v3 14/17] wifi: ath12k: store and use MSI data per
 CE and DP interrupt group for QCN6432
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-14-19f3fcbf7b5f@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZOKDqB5UqRkgXJrZgYCbNO1QHYYpqjUy
X-Proofpoint-ORIG-GUID: ZOKDqB5UqRkgXJrZgYCbNO1QHYYpqjUy
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb0677 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX9dWWDQibcWNk
 qiDT2lFXyDf36en1hWjOtEC095Vk8lLmUtG+9PK43N0xKC0OgyncxokrSz4PkxMVwvRI7Ucuc9/
 Hc/o18fD94JVPixKZ/TH1VgApGozVmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXxZZ0ykcGh4Kn
 6Y/t7pNw1bNWjA59QXLenIiVh1Qgbjrq7PLxLI0lGxt17aodD0gVRlhSQzq2gOaad0tPeN1K8AH
 qYsAIm09+04bfVI6PWEFZ+Pp6tFzVveSNx+eanIIgwc3YLJRFoe58gKgEuJrvvpwE5t7JPDhSZr
 W/mLFKSfnstzq2K2FAegtKkIgawBnrYcc/rkkmLK8z5F4vTiA/u/vrFF+K4FrBziNFhfeyKCeBR
 RlyO557zg8xWkrnVr+I/yNJcUdVuocgV5sohlrMxDScs5/iRnk3CrFIjYfDQ5q/tR9XXQSeu+zU
 G6XlyMEAjadrtOsWK5G315eQD81ecpTM0cngujD00pkMqL65ZRb8fCankJ4qXZls1vv0kB4+MWs
 XpwI7j4Eox6cNU8yE2CjpGAs4LQIoyj0/MoCFmD3VkD3B9/ReC/PV+E6zNZX5VStSF/CcIwX8lc
 L9SQeP8RqSDjCnEYAeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080217_562683_33917521 
X-CRM114-Status: GOOD (  11.74  )
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

Store MSI data values for each interrupt vector during configuration
and use them for ring setup on hybrid devices. Hybrid devices require
explicit MSI data values rather than calculated offsets.

Add ce_msi_data and dp_msi_data arrays to store values captured from
MSI descriptors. Use stored values for ring configuration on QCN6432,
ensuring hardware uses exact platform MSI allocated values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c   | 7 ++++++-
 drivers/net/wireless/ath/ath12k/core.h | 2 ++
 drivers/net/wireless/ath/ath12k/dp.c   | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pcic.c | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c99e915e3885..cc8ed8451a2f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -270,7 +270,12 @@ static void ath12k_ce_srng_msi_ring_params_setup(struct ath12k_base *ab, u32 ce_
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.ce_msi_data[ce_id];
+	else
+		ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bbbde9f05ea9..575139555dd7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1172,6 +1172,8 @@ struct ath12k_base {
 		u32 ep_base_data;
 		u32 addr_lo;
 		u32 addr_hi;
+		u32 ce_msi_data[CE_COUNT_MAX];
+		u32 dp_msi_data[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6cf254b2d2a7..0f0800388935 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -225,8 +225,13 @@ static void ath12k_dp_srng_msi_setup(struct ath12k_base *ab,
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_group_number % msi_data_count)
-		+ msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.dp_msi_data[msi_group_number];
+	else
+		ring_params->msi_data = (msi_group_number % msi_data_count)
+			+ msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index 13097cdf2794..b6d306fd3b99 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -275,6 +275,7 @@ static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
 			}
 
 			ab->irq_num[irq_idx] = desc->irq;
+			ab->msi.dp_msi_data[i] = desc->msg.data;
 			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
 
@@ -318,6 +319,7 @@ static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 		}
 
 		ab->irq_num[irq_idx] = desc->irq;
+		ab->msi.ce_msi_data[i] = desc->msg.data;
 		ath12k_pcic_ce_irq_disable(ab, i);
 		vec_idx = (vec_idx + 1) % num_msi;
 

-- 
2.34.1


