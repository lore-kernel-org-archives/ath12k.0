Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA30C5B572
	for <ath12k@archiver.kernel.org>; Thu, 13 Aug 2026 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j12qxXFZRgGvMYL4VwSD3777CSO2qlK7lXA+b2yjqMo=; b=E+k1/jqNvaGoEnIGFVWQeuy9Yh
	f/H9/FXqVMGIRbLC7SY72Ef8uOQXCgwt7hNRKB+atRNTS8zG8av8DhBzaiUYXCP2uQqp4p1oQKjJB
	cKQILpAfQIYKKkQGGucs9n2fLnwZ1DVSU+/rOmPwQyimmcqcbrWtMVRzUu02RzK6jk4rl7EN1sq5e
	6fAfS47cg6HSHwnfAmy8iFC2TvpHX5mlSNM2htX2BQHAG/fvZ3g8Q9skuSSiWVcPj7yDsmeT96vpz
	VMSFd1CtK++LBElSyWkFxhjraC6JnrjyymerANScfqpAy+XYZ0bGJfpfi13BVkqBRPzLOX862m3gL
	PUtSZVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZPJ-00000001JW0-2CuR;
	Thu, 13 Aug 2026 17:39:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZPG-00000001JVN-1cSU
	for ath12k@lists.infradead.org;
	Thu, 13 Aug 2026 17:39:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTIg83177100
	for <ath12k@lists.infradead.org>; Thu, 13 Aug 2026 17:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j12qxXFZRgGvMYL4VwSD37
	77CSO2qlK7lXA+b2yjqMo=; b=mpI1sGF27CCpiYRPc82qaYKuDzlF50D/MUPpZo
	gqf3Tio78xBdjTpbzAs7fuVb3znmGXiAZTZOwou3eFmOqj6fATmOeNqjPlqSZf+h
	Ks2sQNbiGv5gUMJDAU/REAe0E1b68jTZIV1E5HMrMpEC5OxMG3jr0VnQhm1QNYNc
	Az3YnUs4YRbmWKwWYerHm3kdvmY+leR/Sr053peii6H/YlOuxP+Hqv2S/ntyw9Qd
	qczMl+Uli136ZEZ3U9qDWeLv/KEA9v9rzXmvHBaT5GcD04SdTToqKAoeClvtBpUa
	LoL671+5oAeziKzBrai8HIWXgykeiiWp+O2QvYoDocigApKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1f94h4am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Aug 2026 17:39:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so3111035ad.2
        for <ath12k@lists.infradead.org>; Thu, 13 Aug 2026 10:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642793; x=1787247593; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j12qxXFZRgGvMYL4VwSD3777CSO2qlK7lXA+b2yjqMo=;
        b=W0Pnb9RnWH80tDVIn8IAz0xY3Ep/KRhdcEwLZvM2Jy5d+hUT9dP+FUk8coRYEt0ISu
         0fAOoqRtQ3dfMAEKnenFjVv/KR8Yf7gbhhYLUXvFtYDiuZr6ylLSL1xZwBRcQJeo9J46
         /3RaMjygkayOCFyE8jPYyu71b52U3Z8hy46grZUpkNEH80np6U8KsSl4LV8J2x648Z3A
         crDylvMWUXI4Hk1UXpQ7gdlvzPiGBybzdTwpGAXan5UitHB41VNVpNgbdXytC8InAlZG
         x2ko642lF9NylhJj7KZFBtYRSsMtVBkZYvHLUtAACpDzx4x2IFWmqOrWiWBD3GavCej9
         DDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642793; x=1787247593;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j12qxXFZRgGvMYL4VwSD3777CSO2qlK7lXA+b2yjqMo=;
        b=U8/Z/0N5BTZOweuTzzJDe7Odph7lJ1W4HKMqL2PgdBoDmKrFQ50MIDQutoUJWQeUXG
         eAoB+F7DTD/PAaeWGErRoAzJa4i57a6eyW9/c9FYkAwWuZm1ntqrPx41a8QAxKeERZsl
         dDAVw6W2FMVCwOIf7I02kGXwXfj5pH5h+KeBEocQ9JBek3ntRw+aKFQELhfyMoePY7Je
         FIcqs3BzyX10/7b///Llc5piwKHS6VqMw87R3ztL7aMNvuv0YekBK809q8Scxm8VkI80
         IJsi5qeUe2lcujTsDzT17obR5LsuQZRPwglv6vG+i64y82Zyb6C5QLuVhoXl2rghCUF8
         4hcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDb2ja0uUz2dYRX5Cr3E1oHoTrT4klLvdnVSTByy1W+10MBIWZQBd1BcKrM7tjH0XC/I1iSpA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz011VMA+qQU2RqQf/4Hta7ITnYcxYRXZfBx2TcfZ8JifZ0Q6tZ
	gDBtaHE8bCf0pxxGh4b8/+sJtyS39jTSR8UsSk4qoph0gLu7d/YU3eurzS/ybMPpoWCBXxZVHbh
	aQHPQFlN6w69gGWlX5rf9CFWDA594SqMyd/1ezqLI9ZqEsY4vCfDsQLgGCZNs0jod
X-Gm-Gg: AR+sD11KvhMyBawgqOHj9qdFfG8BWVvcWGCKJYyrfljm9bhxuN9zAHqoIN7nS+cKmQz
	VOn1tjgEpl6rSpbNKuiNW1OI6Bcl8x+5s68ig+2AOPvZLoTy5tb3poDmP8Sdxqikc3AZkdphZlk
	/iiE72iZIHW5gB2GiAegXwmk/313o87IgQNySLbxsz/oLGiBeXVTun+XcaANqXxnc3k1m7xE0s4
	c5m8XYcQ1SxMjeyIIV92h3uuEzzlHFqgWuEFI15uPNbz2fd8nez4EQAiTKuQ/MeRLmhVF1ZDLGi
	fOlzg9Ccm5baiU+3bWp8+48lUTRY+uPrNKQ5qbG3Sh5UvCiBL48H0pQ8U/aPgcTK/q449uqlazU
	SAWYsoqso4mtXNMitmnsl+Gk0aBgLz93cz1sCbNN1UzY3Z8KEHPisA2ua7p8DTonj3VD2Xy4HXH
	ZuYJ3AF+OioK05179zNOOdX1OUpxbk
X-Received: by 2002:a17:902:fda4:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d37d539ed2mr95986205ad.4.1786642792736;
        Thu, 13 Aug 2026 10:39:52 -0700 (PDT)
X-Received: by 2002:a17:902:fda4:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d37d539ed2mr95985545ad.4.1786642792300;
        Thu, 13 Aug 2026 10:39:52 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732166sm16226182eec.18.2026.08.13.10.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:39:51 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 23:09:20 +0530
Subject: [PATCH] wifi: ath12k: fix DMA unwind for ext MSDU descriptor retry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEcBfmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dSKEt3c4pRS3bTMCl2D1GSzJONU8+Rki2QloJaColSgMNi46Nj
 aWgBQT3XBXgAAAA==
X-Change-ID: 20260813-ext-msdu-fix-0ec6b3e7cc8c
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642789; l=2381;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=xLF00iTls/RAYDJtyGsB8K+5w9HGYHEA2gaF0Z64x94=;
 b=vZigJ8jkaHcN14L0GFihC0RjISUC1ncumALNfutBXs/Lw6kwxIzozUpCKghha3M2e64KuHWqh
 3J6MHUr37tODbU+ZKl/4ROqC96b+KbsqQxJT1rK+uOZbC635sb7INv+
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNyBTYWx0ZWRfXxxl/wFJiB1Wk
 A8Moiwl1OTtNsgPB2fowEHQDNaTHb89OFKfTVnAH+70Z4XPiNYt8mIi4JqfEHvsfUCYXeQaL1VH
 tXxluQRkl0yaysAP1lNa3KkmqwqyPRk=
X-Authority-Analysis: v=2.4 cv=VYDH+lp9 c=1 sm=1 tr=0 ts=6a7e0169 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wbETQ5BLc3zoOrHjYAIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: MCwr84R-KJ9hnTXiPv2GqIk_ij3E_kQJ
X-Proofpoint-ORIG-GUID: MCwr84R-KJ9hnTXiPv2GqIk_ij3E_kQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNyBTYWx0ZWRfX7H4NFQ7YPfM0
 1KtaM3TyvQFEevBpWoK8U49Yjj4Teb50+M5K2BoEbiB1zK8LizkVMC6wCOnWq/1j3sZFshOU+MX
 C6X0b+K0F6mPEsx6Rx+NkqLX3Gmb0pI/DKl6jf98c96kclREyhOoQ/XhoqU5MpBZQ2+d3KxGtQZ
 uZekAmV/fDppSy3RNZiApH8r+ZizlbJFb2YfPC2OMgIBmuQVIzBjZT6x5RuruXJY179A4kLCsJc
 g6/VamFp4uZDr/9Xl6qqU0FQVUO+heKGQSZg100opZMLAjMPU2cl5gwOAjQZGfL9JkPlKMvb27y
 1m/lbztT4Dg4zXBxb7+wsM/AYNGTqWybL2xQb1ze4zTZYr/b6wA/0hoywxdlTf84Twq2ZMYa5ky
 rTxVTn8NRh7i31YTdnj27iu8StkWywZKJpKlUO6eqej/iwuJYV3wDIJ+mOZhkaalmFh5/IQ0lNH
 lmRFJjhElg0oW+J2+SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_103954_663053_74A15AF0 
X-CRM114-Status: GOOD (  14.79  )
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

ath12k_wifi7_dp_tx() maps the original MSDU into ti.paddr and
stores the address in skb_cb->paddr. When an extended MSDU descriptor
is used, the function later maps the ext descriptor and overwrites
ti.paddr and ti.data_len with the ext-desc DMA address and length.

If TCL ring allocation then fails, the error path first unmaps the
ext-desc DMA address from skb_cb->paddr_ext_desc. It then falls through
to fail_unmap_dma, which uses ti.paddr/ti.data_len for the original
MSDU unmap. At that point ti.paddr still refers to the ext-desc
mapping, so the ext descriptor is unmapped twice and the original MSDU
mapping is left mapped.

Fix the original MSDU unwind to use skb_cb->paddr and skb->len instead
of ti.paddr/ti.data_len. The ti fields cannot be used after the ext
descriptor is mapped because they are intentionally reused for the
buffer submitted to TCL. Also clear skb_cb->paddr_ext_desc after the
ext-desc unmap so a TCL ring retry cannot observe stale ext-desc DMA
state from the previous attempt.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: 37a068fc9dc4 ("wifi: ath12k: Handle error cases during extended skb allocation")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..0dcb566fd182 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -449,15 +449,17 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	return 0;
 
 fail_unmap_dma_ext:
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(dp->dev, skb_cb->paddr_ext_desc,
 				 skb_ext_desc->len,
 				 DMA_TO_DEVICE);
+		skb_cb->paddr_ext_desc = 0;
+	}
 fail_free_ext_skb:
 	kfree_skb(skb_ext_desc);
 
 fail_unmap_dma:
-	dma_unmap_single(dp->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
+	dma_unmap_single(dp->dev, skb_cb->paddr, skb->len, DMA_TO_DEVICE);
 
 fail_remove_tx_buf:
 	ath12k_dp_tx_release_txbuf(dp, tx_desc, pool_id);

---
base-commit: e07447e654476262558bee570f4cf456e2b32565
change-id: 20260813-ext-msdu-fix-0ec6b3e7cc8c


