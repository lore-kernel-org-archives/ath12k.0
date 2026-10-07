Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F828CA5FF1
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=; b=12Si6lVvN7ZHPTmSBtyDycvY7U
	p4QEPFxUMd0PtUo2Ev2+QD9x80NKTunOLlyvU7xU/tmkc1ebgiTNKXfRFUi4VW0NNaod4GJSwljOr
	0qXV3RPIKgOJyutM4n0ploSpFWvtf8RBynWaP4raKi2rm7RrALYY5tsy6NcpszEmeSBTJHqmvKqlk
	lhhrI/qgoRbsuZqJYSp1Px7z++Rfa5cu60yuEfc3IoiB+872W3Xn1NAUGaozMz+YKbo1gUEOgSqJe
	Zh0bQ3A7Tty1rB4wssv4gJVnjacKMynO/bpv390D9iJuzc/CIyBAQ36I19EPiUldhV+Xc3pwIC3rq
	68JZXDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENsZ-0000000232M-1Nt8;
	Wed, 07 Oct 2026 09:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENsW-00000002316-1Who
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 09:24:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjc22970126
	for <ath12k@lists.infradead.org>; Wed, 7 Oct 2026 09:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=; b=O5UkXP2Bh9fi4LHB
	pFzTd1hhEsCs0exA23gxG/t4AT9D27mcohtSKCvL1ZV1kOJq2uuBPHTIua0spwW0
	olHI84MWY3vikd36OBisaLeN3FMop0Kxfv3rDJDz2WrtSYWDSYDZmOtzLbtkkMOJ
	24PA2bMbKLV0l0JCYXi77NmCwae7YENCM6cyStej4Rs8yyeMT3qUl4pZCr7hpIbj
	ZlPfGvHDX4VGX5zfeKM+DqUk8dJpgEPXlMBpTiU6bKkAFUAMBoYzPaSaPPOkExF+
	PYPppktYo9otTpvLUFWVkn+mMUTc76Si9WpHtOtUf8TDuCxNG+HT5TG+VHxCjLOW
	LRhWbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679egd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 09:23:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768885b4so4725679b3a.0
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365038; x=1791969838; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=;
        b=L1dlHPD2UQhsqnS3esUm4TRY7OGmduwn6rA613gqZOgCHIiOkR7H5eez87X0GY/umw
         mEbtHLouLLto1Z1RDeDbf/fqAJu7eVDF3JFl4CHwYJuARZz+Uh8M4vuu77TkqqaQtvif
         SiOl6orqj1b4WNXENbAIk97chrRriZMETAXvF96TvTgf8ey6HgnFvAQfXDvMuJVFUE/f
         8At5lCqA5Ryt8HOoXI4wLaOZWRCr/SVdfEXnP/ZeGZhj06omPJ7X0k2YOc9Ab8cyBgK4
         6WBrEXmm+jX57+LtAJppcwgYkdFDb5No6x5Axoh/CwKRj/5HTBEbRPFxKtBG67Gek/kx
         AA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365038; x=1791969838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJgJ/jnse5alnP+vj4hLzcWYhPhvr+j+Eu4oWyU7/RA=;
        b=IT19TFR9H1l3KkKjdI0+O+34tf600mOLO0qzxnRziK2hBcdAw9We/A0ZKBFcTplAmk
         KbjgXxeQm8DQcYK0Qd02Hhc1b4lktIxV2VhmTth7RkiW3F1eatxuZWkh7u/WqNBFzPw2
         DaNHHi2o0qHPfOXXNMC/g+uABnNKLybpzAq+PZnjCUBmdCDaGZ7GD5b/I0LQufczADMD
         f5Cb+0lHGPEZogVBpZ5y+WSaaO3J8cOZStcCF1q2f22jJWbUQUU0lULvE71d8cnlgqZc
         nnM3nxeCpN9ZNfaR7xBF7OwGtBABGdOdlQFsssEBwMv+hXViBDQrYKWkjnXfQUi8zNLm
         ORwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIzaD6ZewWe9aDHHFasvhy9nwWYUdsN4HgeKh89NzgJGYelW690JRdI/P259jlwBW+sJtLNTY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJbfGKL3Qq+APE1L/8QQDnlVWHZyfd/rYkuztRJHqPahQDSK3ki
	j3VL3FjjHUI+ASZM8idzk4P1eoyzzMyds/qjx1gMPjzY3UX2Jp7Ivw0msltq+/gBJgZDe5N/jV6
	MRCt95z4EBitnS0AnOZDXxWfoYN+4Rf3nwRUKDUTgmF4kyyWxyP7I79USuNJdFXBsEixTvQOE
X-Gm-Gg: AYBFou1Dy/ZV80Rq1lpRwu80O3QEkmCTRagTSHE0fNBDP2qf/bBZ+qn7bWb7tpduJYT
	+t9QQhbJaP4X4CAP2cxG/8F/uzhGHGrtsO6AfV8jdfQQghvSEZROsiaQdJj3uSmapqaNzc1rgtr
	GGOgkfSgWfj7hAA8ZcWE+/3EoOdc3S54+WDxhv/kOXRJ/I4xhCdCM2JcwSQreQcn/U5GK0ejaZZ
	sodMaQ4IjpvXRJoMTUpPLwVWDNC5b5zNV6Hzbgl2L9tw0WumcxC6MSMJM1Yu6iollF0YUVugpM8
	PErGfC8A+2Sf17PxzDqekJ05/TMGhKEHGoW6FaCLsNtYgte+c3IxbcG3wLf+rYm/N0ZYY6tbumP
	H3PasZAxA6jwis6mq0GjRYDihzEW7be/kwdfHB0ou0UnQeiGB7yTixS3aFvSuEmP8jM/zxE5VK1
	4vjYyppC2TUx9ebIC0lrFqolo=
X-Received: by 2002:a05:6a00:3317:b0:874:708d:b627 with SMTP id d2e1a72fcca58-891b1290986mr1402182b3a.28.1791365038377;
        Wed, 07 Oct 2026 02:23:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3317:b0:874:708d:b627 with SMTP id d2e1a72fcca58-891b1290986mr1402172b3a.28.1791365037974;
        Wed, 07 Oct 2026 02:23:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89271257af8sm119128b3a.41.2026.10.07.02.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:23:57 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 14:53:33 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Increase RXDMA buffer ring size
 for default memory profile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-mpp_ws-v1-2-739b1fb87d24@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXzX7RakuLRgmS
 4Ek7SXbMZkcvsb8x12c9eY5IphjNhfDWaI7S8qsVy/Nb302FhfuU7mkKBcZOjwXASdTGyWfwY/+
 SJ1OHY4Y0MFTQE8dKYdazP2NGUFsaZU=
X-Proofpoint-ORIG-GUID: bJZAMQT4prXrbaD7RuYqqexTs4xgjaeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXxCOA0E2xqd/U
 qbzfdcsVBrCI1WPQNjVa3LAGETixExo6V0NIS5zvp29hKRI6pIIaAEg6WnJCgfjoPvQsS/XoNkP
 M8FwZiCjTZ++mUl/uTD2XP3MAcozoH9hJvcFq4eRjpudFDp6sowjeJGlhLGeTiCNnIjT045KV2M
 mybWdh02VAKL7wyD0saEw2LxznQ1GSiv9t1zHinN0twY+BwhqC9tJx9K/DyB+x+wX5k2Z6x1znn
 Ou1u2+97kvAMdHqUNKndwqbi29iRsZFKk6y0e5F4pEUEK566XxWAikyAcdkoUHH6HugpkYjle5T
 sRvCNn0tKXH7IVxWONzOj+R0ZVhK1j1zsYrybCOuScEDD6RwxG7fDXTQuePZSfsJeDs3t9kcs3x
 4GQJDufXcMny4xEWUU/7yY9RnflbOgbBL2Ki4a2oMuxLwmXljFu71DYunjtDyd/2+n7kVusLDV9
 OjpskHYi7TB4IHLiT/w==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60faf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b5TSSxGLzCK9vQyPxlUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: bJZAMQT4prXrbaD7RuYqqexTs4xgjaeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_022401_166424_B30288F6 
X-CRM114-Status: GOOD (  12.98  )
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

From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>

The default RXDMA buffer ring size of 4096 entries can become a
bottleneck under high RX traffic load, resulting in reduced receive
throughput due to limited buffer availability.

Increase the RXDMA buffer ring size to 8192 entries for the default
memory profile to provide additional RX buffering and improve RX packet
processing efficiency.

This increases memory consumption by approximately 9-10 MiB and improves
RX throughput by ~20% with the default memory profile
(ATH12K_QMI_MEMORY_MODE_DEFAULT).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 764e646d0090..a70590e1d821 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -54,7 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 			.rx_release_ring_size = 16384,
-			.rxdma_buf_ring_size = 4096,
+			.rxdma_buf_ring_size = 8192,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {

-- 
2.34.1


