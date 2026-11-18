Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917A606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdX8Gynk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fi/x16FI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=TdX8GynkPVU/UX
	UJfLBaSZEp0e3fGiwFnO0vAYaeOaMQZ+XbfrvqjZUx3xDZP07yDUE8EF55mGjyWXHrFs4PMEEAH76
	5wDu8tLK/pXMm+B5rpH//w+oR1K7UzIQCIZSHJtOxWwAjH8kVYgdtJEbWuNS1aLYYFnjE2lgSkrwj
	9INd6CMMuftVSSX+zvzzFSHHs7qzC4hP0FfGiCWFqgCWP2kQhijUVIvsoC/ACjh7TzDZu8TtQoTGS
	Bq2Heawyq81/z+9YCwVfq71k9pnM0YvMTE4lzB9ynj0x9rjLShvh9YM4DGAkPceMRt2TqZbru6+au
	IBLjIwGxOTQatyqdd+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZaf-00000007wwM-0wWy;
	Wed, 18 Nov 2026 06:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZaS-00000007wuN-0BGV
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:56:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UupY1959692
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=Y3jPPzR8mOV/BonK
	lBRvXmtMYaTAitKtjPjJC3235gUB87lBOZ+Yq+QA2ZsGdo5PhG9GJwPsSJ7gOPGQ
	UA0EXrG2UXygeyQnPdOsRf/q6GrnKDgfGQ77VLFP2gxuKRaLhNFCCDk/lcE8Tllv
	BluwG3MoHd8j4ikhPrWCy0xVLtVpK/bAdTrmbtM19vHPJPWfAVpEU7ULwL9jyMtV
	bBc+oL3Mi5gce+CU/Wc3CQyOAywRr8pautqHw+jbA7/Q1CHxwlAdHcIPSwIevhYx
	zvzXX6Cx48reYBN4DzWAA6+0bMOXUDdIiLaBsvpg/dniVlVA4admmHH6IwdjX3PA
	9UaghQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hh0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so583916a91.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982818; x=1795587618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=fi/x16FIf3bmDpfoDcQY+bEDfILLZvFhVcXpFB/4jtmQYhcUjVNkhLG1lRFBn1s05n
         8g4AR4xqCOuMg3CZT6jy0V1Qo8OoVgdv5LcPvAFASM922+xeQDz2099QAJGnlQ9yHyTX
         N1nx43DAc9/TZmk2xvZkFhWReSGWHxMqcK+HaFfH/TECTMNQXWZ3j3KJ+BvTycj0xRZ9
         /0w9oOSKumShHztJSQ5VqfP4YdiuXLbvwyeOoa8ReXcQwHWlRgVXV4BWGbWdhxxi5X1O
         5Rj3Lax6cEIli6M1KkYNFqSliYb6OXeIPOAhfw450YbaOclmVRXudiRoJF/ZDz4B/x2Q
         DW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982818; x=1795587618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=dzgpqt2lIueHgEAJkpoUh2NonaBKgzZ9fXGPy/MviCDlxQhUblcIL3vC4QPHL9cdvT
         KLTCjXklg/+nJmxKShXEAO4AT+cVH9hKTPf4vLg8g07x5q0KTN7uMwsLJVQRgi1kst9d
         IqxryHvi9XebSjKdaAG6RbrLvYvsKhIzzvwlaYLmPyv064JgumYQepR3IA+KAWlIowh1
         RKtFQPgy7MlIzHStBR2Z79ZD/Ak8T32UYYSMPgPGze7qCYu0YUEuyeLWGpgqzjWRhXWl
         yPZVf3dl6mAHJw0+ggDneOBGZarOqlZ4PtMqbVhYHN2V8xcyFyCXoFJ+ITe3xO2PalzH
         EQHQ==
X-Forwarded-Encrypted: i=1; AL+hErGM5b7UmUDjQ90jOvuygMK4zNGPZuqHwuh+lJCeE5wd/ZRcLERZehju1pvpilnAlfXL/i0KUDE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/GOaQsT7yyr8JKQxLQwFWPJdXvOdLrxK1Is/mFUmusjzx0XqFS
	iBYnDQHL0dxVvZy1dyImh1PXmpqInRwgMgpLgom0LA4d0yu/LChafMETWtLwNyixQMPhaWE6OW4
	aQOY7iyhDeWMgQElkPfDghEn1a0o8c0ERDC/JzZDmhLrTlV7r6WbCYOCQk2piU1nY
X-Gm-Gg: AZFdTZfORvA18MjRGrr2VDjxfwESEQXXzCA5WqzzKwdQcctJzCysSyOPfE0rNtlHgl9
	pPldKt9n0taVsw0lnLVBNiZvA1NuSdqMkge26JdHn9E4pefl1io2IGeNvZ5x5Ky57cvHsdPLUVu
	LZXx/CIz5BEacqFvIvfLnMd2Tc6fofg5pORkRit8A17MVfu4Auy9JaVR0d0eb5WuuqF4SsakxJs
	ufnz8Yc+sGwSDz+nBeQyd+oYbIIWS9sttwlpd8l8FSRVXk4C5ghRmJTqraQBiJYDKm54aBtGfNC
	PwMF4+Yu5wlVm6Y5TfLpihRxTpl3vdj7Nip9UCkT4V8hch1QujTitc2sNFh3Al/IVhG9hVDg4mw
	d44MMHqLajUJo86nramWdZ1hmA0B8DO4lX7b1avFbDOJAHuwR2RQN9raNFzhjiq085N2xg6BF7Y
	tPdAqc6ajAGROpxggHepYLs4+nqw/eUDYf6eXBVbrWMx1hvmlDRxsaaLj/GWPYXWnVm5PKe1G5E
	Gw=
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653305a91.35.1794982818120;
        Tue, 17 Nov 2026 22:20:18 -0800 (PST)
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653276a91.35.1794982817603;
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:16 +0530
Subject: [PATCH ath-next v2 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-13-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd43a2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: blwqbYoOpDAeBARWvl7tCfg5wZCWByAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXweSrTWnchOpt
 ixjgbagerjO4LBMP79QzRY5dt2o88HduHq0lc1I8R8+tciTcNupr0gjfr6fxH8k0eb600E4RvF1
 kcUtp3xUhBnmb9l64U1tnmZ0SZRVfRLn8gJLy7FPrSpFDbwqGmiDNTk9+KQUBgUJ49/rV+0Blwj
 v4Hj0Z8H496YF/+18OzBR8xbLb1e8f4VRLbzywq/AJ1ARLclLkTdKg4M4/uFxeixDnp9CmMxdtj
 3AUc50tOuKkgkiEJ8FHm2/3FjuQimPKULcIaQTc8PShjdmmwcgErpTQ9/jKy3pDVtu+g6j8oywW
 SgKIw6ZMHm74zQjRFcOC77B93OzKRXN6qzSySXYMc4eti4ne/VjFirT/t199DbIUF64VgwzX96R
 KwzK6CK4O2KeNJGqxEAap6n0n7+4UVZjKHws2FQsroZzztNj1czm+lKgucWVQn3xSVGW8D5cQDZ
 y8SKkLLBUXe0H1oLqpA==
X-Proofpoint-GUID: blwqbYoOpDAeBARWvl7tCfg5wZCWByAP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXx0+eAdlrKGww
 MPfkqLAZNmhYyAseegw6XmoN5FbbJrrZ6gF2pZsO7Tv+DwdPRuLoDItSwzkOfLpfJ2LCVE3L54L
 d+0ACkC9pbA+77G4QFLId4hEz3wNBGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_225618_613506_0DD5FC8F 
X-CRM114-Status: GOOD (  14.00  )
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


