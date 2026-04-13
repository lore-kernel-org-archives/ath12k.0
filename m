Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D34F531CE
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 23:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtmbfjqxuCsqPvNY55CdE1l1BTHuJDYnMaJvgQfTDqg=; b=1QDYRifOaMLwVDr1kwVxuCBEDE
	L5qAUBQn3MIcbqG2v8SbfX6rdxzQJoOvf0H2s4dH8LJV8KZisuLehY1hNvo2Z8zDyDLIw4px+Blvm
	5tULv/0ps/K8R7DbY6zUnU6W07JXjzyuc/YSLPhOwU67F2LKstlGKUEsYbKWGcdGdGhiFHyau59Ck
	Qcbdpy8Wpvp4ybfUye0tEB8lXjBKSQuGrebIYf5ger+78Es+1sohfMWWYX3WgkB2hyy5133R3EKp+
	lR0IFgkF4sDjoVoT7SuBPeRtOZ/5BchUbfkpG73y83UPP8eq159YEAD+eyatpBN423Yjne+5Pp0/r
	ISefPRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRB9-0000000GUma-1t46;
	Mon, 13 Apr 2026 23:58:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRB6-0000000GUle-3ZZb
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 23:58:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLD8bF395284
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 23:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WtmbfjqxuCsqPvNY55CdE1
	l1BTHuJDYnMaJvgQfTDqg=; b=Pv1QuxKdLnzXkNdvrCnokJAPIdH2Z1xaQVgyno
	wg9rZJ6GKR3cLZK0nw3DEnP77nHpw8WnQC9+O/k5xPiN4ReFiXCYGKvvFNao6xzk
	tsisDnqsI0OZzzOHTyivGRtnejfKOcYP9pfGEqyobwIcsdsfUz91B/fP+gxjHRYZ
	oG+kLMxNtcEgmbey/g9Kpms5DYNREepzWSBtuyOqRt8Pk/1TSdLfLMkB9orgS1Bp
	E85n7DW4guxJaGfi7rSy7lYmsPiog/6gWpolzsnIn3Mt5NmUuqLqFI4MpeykYK4k
	91cVD2WwY4Mu6FtRUOym2/WcrjeO6grMbQ0nkmMr48fOh+Ww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870rbfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 23:58:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso7659405eec.0
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776124728; x=1776729528; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtmbfjqxuCsqPvNY55CdE1l1BTHuJDYnMaJvgQfTDqg=;
        b=QCI34M87sqdbsLjuBsmSZv05gKWZGbsScBFcjloV/zcF39Lw6Bl8u0RPO1MgIItzDK
         FnPn3MZFmTiuupXIw2MqAXOPT53lVU6oxR5CZDNqd0KYnl5wKD8kAAVNS7w3dgg3P+oa
         42hymwOl8G9Or2+DhRcnPapT3ouDwk48YUYBHk0q5xoVsSogCTdlszeNRM30BDKg1h2M
         ooAoADByUjIi98l/d2uKZefyTjzN6YggSaJB+jx5/CjmjRzErztnfW3DV/4CVRcrRPsR
         jTVriro8bQKE32BbXJ9DEXxBn3KR7BF/Jv6hkNoGZT6wLO7Zpd/x/uQ7hpofz7oCXTad
         NGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776124728; x=1776729528;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtmbfjqxuCsqPvNY55CdE1l1BTHuJDYnMaJvgQfTDqg=;
        b=badyLgHKLfb3UmZnvb2WqLdCOsi3xZyppa1A9kn3TZL0/kzYSuC9zsAEdwzIBpcM76
         X21iaMMYxGoRqGtx1iznNiSOn5S3hw9VgLT9CM1TH9/3eLUJUCXswxy4xDCw/2tqkvTM
         Dx94Ua0aeH9sV1ixbHQqUPP2BsXGQ9Owxr8H2G6mY3mVRrfDzZ60yU4AFID5AMVOQMyT
         tHPwr2oO1Ue56T+okWltDI7BmyecO9HJUyz/QIlyUNcupWj/gz3yQJmVMBvxz304i4y4
         j5n4rwDYR9yCAd05VyoHQUsGMVowL+TxsutnA9uAT30OvT1WRUmx3of3IfTCeHazrA//
         b71A==
X-Forwarded-Encrypted: i=1; AFNElJ94AVfHN79ddy/ACM6PVvMtUOJhlrBDNFy2NqoMw9A+9Ya2naDFYF9DAtZbYmc46GuVJ0QWCmQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3QtrvHyS088Kja3i8KDe/Q+/FcCtm5ApEsvLkCyied4fVCWth
	vxC4Ej7oXlR6okeV7M+Y31WYxJCCdJatSy9P9b8hvCTI/OyBS+x2nTJVXmFpoBXFvA2UrugUa1i
	VZm/bCjzUK1vuMxz27nuNYwx4JaUdY7IOHb8VVhfIxGCcn0z7epsxAOTqZzK+uBsY
X-Gm-Gg: AeBDietLhW4deTARQOeDaQBbZmRQOW5McpRIt0zaTaZmOxz39eQg6GMvevj9xT1uUKX
	TaxMSlWlOSH5Vbp9EEOdN6upOqQdb07xfN/iECx2xXS1WoMeLcPI6D31hLbq87ni6UtVF4JkXR2
	b3tK2Oob4C13FY/ff5bH5X/UxNfu1bYeA+JxzniPAUnRcK3OfAkc3rU3PiMnoSKdpwdnIzzULwO
	dRmmEQn98jo8wz9ai+LVGmApfsRWbFUqrLI03a/MSsYJQMPEf39T/ixin+UvyMF2PVhg8Dcf6HF
	izWPZADjBGNYg7CM6iMgppi6chI+7K1m4TNZLqtXLX/8ACN/b5l4KfipuYlH9G0iwgatMxB58sj
	XbJvzDUf9INoOTpkfyscaNqyU6cC9QcDO7G5892q7LYR6ccCtMSy2QmzOW/DAMKN63PPJekWouz
	B7
X-Received: by 2002:a05:7300:7495:b0:2c1:85a:d25d with SMTP id 5a478bee46e88-2d5871afa9cmr9657698eec.1.1776124728526;
        Mon, 13 Apr 2026 16:58:48 -0700 (PDT)
X-Received: by 2002:a05:7300:7495:b0:2c1:85a:d25d with SMTP id 5a478bee46e88-2d5871afa9cmr9657692eec.1.1776124727943;
        Mon, 13 Apr 2026 16:58:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562ac344csm18650600eec.25.2026.04.13.16.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 16:58:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 16:58:46 -0700
Subject: [PATCH ath-next] wifi: ath12k: Remove unused HAL_RX_REO_QUEUE_INFO
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADWD3WkC/5WNwQrCMBAFf0VyNpJdQ0BP/odISJuNDdjEJk2pl
 P67oScPHvTyYHgws7BMyVNm593CEk0++xgqwH7H2s6EO3FvKzMUqIQUknfmodOsE0U9FCqkfXA
 RdZ9t0W0sYeSCkBpljZAKWPU8Ezk/b40rM2PHA80ju9Wn83mM6bXFJ9j+PzoTcOAOTq5BkJJQX
 WLOh6GYRxv7/lBni0z4KT79IsYqbloAVNYdrXBfxOu6vgEWoCdgPAEAAA==
X-Change-ID: 20260404-hal_rx_reo_queue_info2_msdu_count-0e2eb6da0461
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: DOpbLdWGoKI7bTs87ltevyKFMhpNwdEQ
X-Proofpoint-GUID: DOpbLdWGoKI7bTs87ltevyKFMhpNwdEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDIzNSBTYWx0ZWRfXzbOlIjzkbqK2
 65KU0kbRnxBPnu0Bt/+3fInwPuv01bA965i7iHeO5TteSB5f2X3UgW/nKPy2v6Ej61AoIx8xJnd
 vPtD7G+0Ga2uorjNNv1be7awK8cCfJMmtnpubxbhykFa+eX3Y7CNej76HvhE7Gbwh1mogzmhl51
 IsrylhBTxJkCHUb9TOE1lSTt9wbdvLMA8bUraoRWn1pa6LhsQ3xZ28mRpj/UrgQpePeT9q2JEil
 MNvIGwTTwCoya6VGnEe3UGiJniuKyRJOSsMB6YzLsioFPEepzQ9tUkzsfy0mCAJpN0wRD1ONN+c
 /fKS9vgUf8BJJw82v16oENlTNg/NymLn6xb1iQCTkv2F9DggmH8GhTiydiGiG4vduq16HB8KuLH
 xsFb87Yrf8cDzRsQBUC9wHdRy/HV3NX84W08b2kJZnmXFcP35IAjqlHLcESryDguMRbQmZFKqX9
 3lK9QZ+QOyI4ySuDy4Q==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69dd8339 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NnysC0QT6Qjdb-6y4-4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604130235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_165853_030194_155DEB43 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.

No functional change. Compile Tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
This issue was highlighted by AI review which noted that the
HAL_RX_REO_QUEUE_INFO2_MSDU_COUNT macro was missing GENMASK().
However, rather than fix an unused macro, it seems "better" to just
remove it (along with all other unused HAL_RX_REO_QUEUE_INFO macros).
---
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h | 26 ------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
index e1ab47b44433..822de3a4abc8 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
@@ -2100,41 +2100,15 @@ enum hal_rx_reo_queue_pn_size {
 
 #define HAL_RX_REO_QUEUE_INFO0_VLD			BIT(0)
 #define HAL_RX_REO_QUEUE_INFO0_ASSOC_LNK_DESC_COUNTER	GENMASK(2, 1)
-#define HAL_RX_REO_QUEUE_INFO0_DIS_DUP_DETECTION	BIT(3)
-#define HAL_RX_REO_QUEUE_INFO0_SOFT_REORDER_EN		BIT(4)
 #define HAL_RX_REO_QUEUE_INFO0_AC			GENMASK(6, 5)
-#define HAL_RX_REO_QUEUE_INFO0_BAR			BIT(7)
 #define HAL_RX_REO_QUEUE_INFO0_RETRY			BIT(8)
-#define HAL_RX_REO_QUEUE_INFO0_CHECK_2K_MODE		BIT(9)
-#define HAL_RX_REO_QUEUE_INFO0_OOR_MODE			BIT(10)
 #define HAL_RX_REO_QUEUE_INFO0_BA_WINDOW_SIZE		GENMASK(20, 11)
 #define HAL_RX_REO_QUEUE_INFO0_PN_CHECK			BIT(21)
-#define HAL_RX_REO_QUEUE_INFO0_EVEN_PN			BIT(22)
-#define HAL_RX_REO_QUEUE_INFO0_UNEVEN_PN		BIT(23)
-#define HAL_RX_REO_QUEUE_INFO0_PN_HANDLE_ENABLE		BIT(24)
 #define HAL_RX_REO_QUEUE_INFO0_PN_SIZE			GENMASK(26, 25)
 #define HAL_RX_REO_QUEUE_INFO0_IGNORE_AMPDU_FLG		BIT(27)
 
 #define HAL_RX_REO_QUEUE_INFO1_SVLD			BIT(0)
 #define HAL_RX_REO_QUEUE_INFO1_SSN			GENMASK(12, 1)
-#define HAL_RX_REO_QUEUE_INFO1_CURRENT_IDX		GENMASK(22, 13)
-#define HAL_RX_REO_QUEUE_INFO1_SEQ_2K_ERR		BIT(23)
-#define HAL_RX_REO_QUEUE_INFO1_PN_ERR			BIT(24)
-#define HAL_RX_REO_QUEUE_INFO1_PN_VALID			BIT(31)
-
-#define HAL_RX_REO_QUEUE_INFO2_MPDU_COUNT		GENMASK(6, 0)
-#define HAL_RX_REO_QUEUE_INFO2_MSDU_COUNT		(31, 7)
-
-#define HAL_RX_REO_QUEUE_INFO3_TIMEOUT_COUNT		GENMASK(9, 4)
-#define HAL_RX_REO_QUEUE_INFO3_FWD_DUE_TO_BAR_CNT	GENMASK(15, 10)
-#define HAL_RX_REO_QUEUE_INFO3_DUPLICATE_COUNT		GENMASK(31, 16)
-
-#define HAL_RX_REO_QUEUE_INFO4_FRAME_IN_ORD_COUNT	GENMASK(23, 0)
-#define HAL_RX_REO_QUEUE_INFO4_BAR_RECVD_COUNT		GENMASK(31, 24)
-
-#define HAL_RX_REO_QUEUE_INFO5_LATE_RX_MPDU_COUNT	GENMASK(11, 0)
-#define HAL_RX_REO_QUEUE_INFO5_WINDOW_JUMP_2K		GENMASK(15, 12)
-#define HAL_RX_REO_QUEUE_INFO5_HOLE_COUNT		GENMASK(31, 16)
 
 struct hal_rx_reo_queue {
 	struct hal_desc_header desc_hdr;

---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260404-hal_rx_reo_queue_info2_msdu_count-0e2eb6da0461


