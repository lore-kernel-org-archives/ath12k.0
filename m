Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC1ECEE35E
	for <ath12k@archiver.kernel.org>; Wed, 19 Nov 2025 02:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s0HIdUkI7dBen/MxX1fT/gQqc/PAqY0IKPsj+Sxwa7o=; b=I1J4kw7w56Wlskty45Pu2ghVCu
	IvkRowZRqaQEA+wFfLc4qSXOv9ygZ+3i8iPgNTLB2rfkTJ8ataUCF1Qf8wCHnjKkxOG2y5iYzOPa/
	LrOEso+OVespwVaA61W4bxGSMbZYFhCJYUGQOe2dpw1xDssmLh1YPZjhpgPW0BbLJnq2oDabFLOV/
	gt8ILmbn4ISPG4kR4NTPonFkmCDJigIoMFRxGslg0wwfMmuYTUiuM0bZwBnKnFLCJKbxfvfz5Ayte
	nLyobk/LACDgk3tkS+5mheSEdHfG21sxoOUVBYiQRBtqxOeyw+7zMwU2QFCf+FRh/LoPyriSZCo35
	IkuFFbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXkC-00000001NfM-0MYt;
	Wed, 19 Nov 2025 02:16:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXk8-00000001Nex-2Ra7
	for ath12k@lists.infradead.org;
	Wed, 19 Nov 2025 02:16:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIH7o302664787
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 02:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s0HIdUkI7dBen/MxX1fT/g
	Qqc/PAqY0IKPsj+Sxwa7o=; b=Q1BOaZk5qTC/E+9n5lQ8ir6JjuKuzYXHa7qH/Y
	/bEqQkbts+MmPFysvwBVsA0vDyPcqka1lmVe9ToFWLubeXZ+7mJyNavRRCxXVkIJ
	Y7qMhGLK2AzYnTHbNmtkEt4H59oct6IpKsoFrbYBpC4K7Uyj+hEnsDc08zXZOkQY
	JJEKZZDZubn23fwAktlb2QbhM/B8VYN0PGwir/J4Mrr2v3GR8v8Ygr3HKf9ZFyUz
	p3CyD9b6y6vk0Cq3S2ErDX7xdyxKU3mQ+LYylqKjXeeBUTjVNdThmKemrHk339Q+
	d5PHhKeKxP839dZ/U5Wgff0reWszI+EkuVTOc49nmBIlirJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjkajp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 02:16:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7434101a91.3
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 18:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763518582; x=1764123382; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0HIdUkI7dBen/MxX1fT/gQqc/PAqY0IKPsj+Sxwa7o=;
        b=VccAPD+qUgByHHraJc0jGaKF7n2amucf2VRTkL+cRr0jiFbFDC+gkMfeJ/Wf2ZQ2FO
         6o6iWn+yKQl16Fnk+rabSPc0Xkp3iqUOoeQyOat7qxy8C20TKrs0O8haYIThs0TXR+JY
         a2icCUwQc3mRM/tLpLjZKVLa6ffrnLa+ja/u/IzkPflPCNnpaTj4ky85OnzsmtyWy5uB
         9sg9KOUgTdR642Qr7gPGm3z2o1FtKbE1P02AY5/Vj8qbGj59KdCSbFKWRGmgIB1hEr57
         eTJ1BbI83ijE+l5fbtT+r0g5IBvU2cKHjEPQcAj+mFrRbIV4wQ+i1qWWafIXwyQ8bFg5
         uWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763518582; x=1764123382;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0HIdUkI7dBen/MxX1fT/gQqc/PAqY0IKPsj+Sxwa7o=;
        b=C1RrxaesVNQEd3zX57J4sLI5+j/CvOyi6mPsw0R4TaGPzNkgR1c0P2ljLEmtpixo7R
         Cz/w56pgmQcPCPRirxQupcHVYDoc5JBU+wsrUO6kn/NqcQE+uv8kWmkZkSZPp6np/PKn
         ywHESQ6X5vlRM0UeVV07zv4QNyLzJT1pITKN5vXq1ePFrJhRMhn8i87hI9wL/lMzvLED
         rXlOxPqijAUXRg8sAaS+93e8ZzRx9/Fb2fqpK+WJJTYm9CAdHpRHg5UYrYVA/AhNME6k
         SGAtvIVKBwNqUzxP4eXRaHH+8TIRTPuKA/GdfBd9JFSA/m3pzjvEdK7aw3i/QkSGPmiT
         F8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX2cX1enS2W8I0JVacIZivCUacm2Xsk9Vt63KznT4E8ud4mM+Y5apkeoeCYK+u61Fq9gCOZluQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKCwL6Maas7OjaATJtlJvtnOAeKuoFtNA9eRzJ8FF7nSuo6iKn
	yguypMDkD1kEa+JZOyDWBZ06RPFyX+7ua7lVaYQeRPGVSWFjE0yGi1n5XE3Fgx893FALn6GC//R
	hjJTZoCu6U0pfYo4TEPGBjbSr+wuy9hcUlropv4QKMoJ8MPA3TudRuWW1Rpe/HGRIdpjW5a+T
X-Gm-Gg: ASbGncudalXHBrlI7bH0uvyADqf546GcPiRr3pY+1ZEkIJX+PT2fwTiUiy0VE2cQOUs
	8qsjRlmW27N41alWsoj5v3eVW0TOflVtEMlqOHv0fXY2LLD3Tq5yAIQVgafLW4pjFlmdzN4WEvE
	wkoTDOXde6F4N+WpoZU0tuzzjudZaMItox6tIyXh3+MSI4InZG3CH0st8zVEvHJndjmJ16Ta5KP
	P1zPO+jZNvs1RkIlnxY2ggUZnwpww25vIVqFU730fIVjJWAps9TfIjTvPdUcsWT3o0j4sIOt6QD
	HQO6y//dpovR0FIA3NKx9LrOCfvA/ZaVIwxab18xJqp6POiAdtLpTJNKpdMXwmaCh4tQ9AQU491
	/5a/c8zVrsntYsYwJfmKGx/UB9E1gTIr5pdM63jrLPn7JSpCtTvscwZi98BreY6c=
X-Received: by 2002:a17:90a:da8f:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-343f9ec8d4dmr23030952a91.16.1763518582186;
        Tue, 18 Nov 2025 18:16:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjFwhJwn2q5r+kloWWxFwZrr4LwJEQHZ4nvWLiWlma7WXZYn1lYNT/jYBKDxeT2PJ1pzbFvg==
X-Received: by 2002:a17:90a:da8f:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-343f9ec8d4dmr23030923a91.16.1763518581684;
        Tue, 18 Nov 2025 18:16:21 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc24f941sm799890a91.10.2025.11.18.18.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 18:16:20 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:15:57 +0800
Subject: [PATCH ath12k-ng] wifi: ath12k: add the missing RCU lock in
 ath12k_dp_tx_free_txbuf()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-ath12k-fix-missing-rcu-lock-v1-1-8155de1dc4fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFwoHWkC/5XNTQ7CIBAF4Ks0rJ2mg/2hrryHcYFAW9IWFFqia
 Xp3CXHpQjeTvMybbzbildPKk1O2EaeC9tqaGPCQETFw0yvQMmZCC1ohIgO+DEhH6PQTZu29Nj0
 4scJkxQgVlqxUtGKStyQKd6diL+kX8jk0PbnG1aD9Yt0r/Q2YCj+9CAgInVRlx1vatLfibL3PH
 yufhJ3nPI7EB/oHSSPZNEKWtarZEesv5L7vb2RtVlorAQAA
X-Change-ID: 20251118-ath12k-fix-missing-rcu-lock-51484e258da9
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: P1VskY49L28lm-Uf6eCGpwsFrlW8uxZl
X-Proofpoint-GUID: P1VskY49L28lm-Uf6eCGpwsFrlW8uxZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAxNiBTYWx0ZWRfX+4cMaJ2ZjGLO
 IoVkdBP67HRXOT6gxuN4MJR+XEGjoCBj2HqhzWDa7zIWyVxe+brj2o2BSC9Ha/rs1tUjfp9FJgs
 BSir1myydZULfzINA7hlL56ZWesBbGSdlJ0e3znbqVwUTzc0UxLFBfQCJ65KZG4pBpmnJ0SWwrI
 LNJ9OzRDitJCPas/MpSA3iEfNe4rSPUm4uQ+BApbDw4yal9hRZoGHoHHQz3Isihalbo9HPd6EBG
 XQ8irIJN85C+p0li7fLPnIQ+DWiX7KigjKdO7RUxM7TXLwUkSBGnDzoIv36HLqSG+vS/qmitV+9
 yk1yf30pnNCbw9bu6VV9dA3V0p8qbvRjxOI4+m4DWSjz4Ep5tSEkXx1dUC0SXXSSpC7q4IzX9Y9
 Fe7hMhLigyv5qK6ViCsb/0g3PRN94w==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691d2877 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=U-W4M1hCd-K8Or1wGFwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_181625_447829_009A4F21 
X-CRM114-Status: GOOD (  11.34  )
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

RCU read lock is missing in ath12k_dp_tx_free_txbuf() before calling
ath12k_dp_to_pdev_dp(), causing below warning:

WARNING: suspicious RCU usage
-----------------------------
drivers/net/wireless/ath/ath12k/dp.h:653 ath12k dp to dp pdev called without rcu lock!
Call Trace:
 <IRQ>
 show_stack
 dump_stack_lvl
 dump_stack
 lockdep_rcu_suspicious.cold
 ath12k_dp_tx_free_txbuf
 ath12k_wifi7_dp_tx_completion_handler
 ath12k_wifi7_dp_service_srng
 ath12k_pci_ext_grp_napi_poll
 [...]
 </IRQ>

Invoke guard(rcu) to fix it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 1d4444f3936f..c10da6195c9c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -194,8 +194,6 @@ void ath12k_dp_tx_free_txbuf(struct ath12k_dp *dp,
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 
-	dp_pdev = ath12k_dp_to_pdev_dp(dp, pdev_idx);
-
 	dma_unmap_single(dp->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(dp->dev, skb_cb->paddr_ext_desc,
@@ -203,6 +201,10 @@ void ath12k_dp_tx_free_txbuf(struct ath12k_dp *dp,
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
+	guard(rcu)();
+
+	dp_pdev = ath12k_dp_to_pdev_dp(dp, pdev_idx);
+
 	ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
 
 	if (atomic_dec_and_test(&dp_pdev->num_tx_pending))

---
base-commit: 7cd7392a07782b8ad4aa6360e4be1967af2eab04
change-id: 20251118-ath12k-fix-missing-rcu-lock-51484e258da9

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


