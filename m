Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0677C5AE59
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 05:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sX5qD6gyPEWF32QtSDMR7E/1T4f6HYVyEgp9L+B6/SE=; b=VueTWCrvSdjQMb6ON4U0u744FZ
	IpWqMDVi5rd2Q+RF+Q+/xyIuX2Zw9YpFyBmyHvsrqF6u1ZQjw7l6BKkbcHtg8Gi1JAV8p1cGqj6Bk
	1M2+Oz7KLjA4gtO7Q4b6stSM8ADJYEEAFokLuikZzgbZdy7YLwDM/4BbWQzsVoEaI9GmPyELk6G2h
	y55b5oDyprBESRtpEWNKvXZF7lIhgJO6VHdx15OF7x7E2IHMLM8IsNtFGov8/vajF40ptHokeejfD
	Miw4u1SEHlrc9pSMuXi1cKG+Y7aGerTBIJndUNiiDHzaioZSpIZ3qKClzouDzHv+7yHz42oXUvGQQ
	LNKJBZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2lr-0000000EjjD-1YEm;
	Thu, 05 Jun 2025 05:04:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2lo-0000000Ejin-3RDn
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 05:04:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554GX0WX019377
	for <ath12k@lists.infradead.org>; Thu, 5 Jun 2025 05:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sX5qD6gyPEWF32QtSDMR7E/1T4f6HYVyEgp
	9L+B6/SE=; b=jjExmvvTXDsRuZmRmOASQayRYwQIy6fJK0gFFKa7D7Id4+gg8uQ
	9Vaukui+2Hi4E9/ajYG+Ajj86e57euadNke2WC4DC839/3PG8Ef8PgDU0Q9rnPbB
	Dbn7K7F4gPbISu4ob1yuAYtu+z9jsPMa/efETs9yoKXLWM5Ytusix2EzWGHmuCth
	L1k3N7tpZzQjuZS1Q7QAVgx7svQv6LTtZ9b1Q1uqtKg3TWipolun2fU+UAKkw+rB
	ZvB5zacJiy/FnhS9QDbPIPu7FXT0KyuEgXC+WI5uiN/J4VAGHkhyEYivd2IzefYd
	iw3qW8AcqizLE4ZQkDP0MdA4/G/G5/jAVsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t05ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Jun 2025 05:03:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235c897d378so5462475ad.1
        for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 22:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749099836; x=1749704636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX5qD6gyPEWF32QtSDMR7E/1T4f6HYVyEgp9L+B6/SE=;
        b=hBmczDIHk6x58VRSXb6mt0+RSHTwjIFZUie4o4emlfY+5WZkqKh0rkrZigPm8kwhkl
         Wm0IUPpMxNVBSLUq8P3JfGBux5MfN7w64PndeINYrbkPrp/0ReVuTsWs4x1D9D1h/NaH
         CvVWKLGkOuRwOKoDZI1tIGvlb1k7lTbFF+we7Q8FjixPFOMBTe7kUwvFAwwKoi+TWjEY
         FQl/bhtAH94H1dDeAWEPSdPufHpNyqPjtqOBvvUuSGyZ39t10IvnSk5kfDtdCosj21Yt
         NU2XeRCzBbvuQMDiTk/imAD8D2Qdu2Y9ctbjgJ/9gS/iRhtpXfHTT2KIat+6+jry2Exc
         yaEw==
X-Gm-Message-State: AOJu0YxY/55Hmy8Ok3P7TrVWk0x2ggUzl2jeuYirp/CC4JUtQfdPLxHh
	soJnaNwpNDJFh9wor+fSsPNLLRfwBE2VIXS3qd8B8wNvwJd8c7LoF/fJ5AXAsibUXDM71E1IwvO
	3obonr0UEset6D0GXZTiEDbOTQ+N5Y3UkPRCzQQrZ+6UwGDqdRgZRk6sh91B0rTdrKyBLx4o/
X-Gm-Gg: ASbGncsuin8Cn3x5r/wBADXc5b5qLMJggTLk/GeDiGYmRqpxkpjWmxgTdQhMqOGszOv
	BHqFaRVpjdEDKN34E9WX8lzKckUzg+Gn39+F5mp/yFC9UMrXN4ZwZv4rscYZ6f+q06U/qkJOLaB
	9YkfjDt6naNsZIdE0SRsJ+GLwU46+3SpvNO5vQOvXuhSPJ1xwLDZjC08FjRnoYEaPVD8gVw1q5n
	MYg0MAn2ImXUfxU4FuWkMbopRWaRTHfyS1/qpeGYKpXopa51f1idiKbpMiClLZs/r2nv2nYJLJa
	QJAc8qvdRWHGMUmnuwxxJmDedmAkikmn1In+A6h5AQnk/dm8zm5Ikky/4Ug8JZKZfoW3ekyGr4c
	ZkeWC+JlPC8GI6iwCiQGtD+xiZ0sRvA==
X-Received: by 2002:a17:903:1245:b0:235:2e0:ab8 with SMTP id d9443c01a7336-235e111f2edmr64256715ad.6.1749099836045;
        Wed, 04 Jun 2025 22:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmOhn7HowKVgRR38Ows7HbGLwK8NasZwHVY4O0MdR3/Zh1Vyq2eb54sN3MiL+8NIRRAXjEUw==
X-Received: by 2002:a17:903:1245:b0:235:2e0:ab8 with SMTP id d9443c01a7336-235e111f2edmr64256375ad.6.1749099835682;
        Wed, 04 Jun 2025 22:03:55 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be23c1sm111842045ad.78.2025.06.04.22.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:03:55 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: set RX_FLAG_SKIP_MONITOR in WBM error path
Date: Thu,  5 Jun 2025 10:31:35 +0530
Message-Id: <20250605050135.1802902-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: faXnWQNjsAXpsKDgcZRrmYtDyT7fX2VM
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841253d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iJxYE32BEC57r-YmU5AA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: faXnWQNjsAXpsKDgcZRrmYtDyT7fX2VM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0MiBTYWx0ZWRfX30ytg4VwSyoO
 jPbvFBf6p+c2RljKTMPZ+NFEzk8OZ6fqg6N8KR+lkXxNPNyq/arGg1Kta8hjVJ0d4/SawGztR0d
 TM2PQQBXN3YLagOGtl1PI/YGWHjWhMyJrB547jBvs1CYaDmONl+6qo/Z2YH+yOq7sr7M8ZC96Zx
 l5wef+uPw0kY7dzskRdyT7iQHbiNsU9blKzad8CjnDpI5pJ7wcke4iCdH9n5qi5GaO5RPDSeLXT
 AMslQi2fo0D1aVSTIZFrPye0xgBnysVkwid1eP4g4ymsUajuKgiqhRwJkB7lhxCJS9WVCMbdiW3
 02fws90NbLHZ+BMGE5ODz/eqCcDAu02NsuUMJRsc4oxkLdj88ZccvaHId4fK1fdu73NV0+eud/2
 rYsDX5k01fOAaehJj/leqMV0za9nijuAa3/piPKpf8fhcDeukAdoG0+N3KvlSQQNL1hxcUs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=985 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_220404_874199_606D3860 
X-CRM114-Status: GOOD (  10.96  )
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

Packets delivered to mac80211 from the WBM error path currently do not
have the RX_FLAG_SKIP_MONITOR flag set in status->flag. As a result,
mac80211 performs unnecessary monitor mode checks on each packet, even
though these packets are not intended for monitor mode processing.
In regular rx path, this flag is explicitly set to avoid such overhead.
Align the WBM error path behavior by setting RX_FLAG_SKIP_MONITOR to
prevent redundant per-packet checks in mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 7e1a8f29c7b6..2bf1fa9c83b0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -4007,6 +4007,8 @@ static void ath12k_dp_rx_wbm_err(struct ath12k *ar,
 		return;
 	}
 
+	rx_info.rx_status->flag |= RX_FLAG_SKIP_MONITOR;
+
 	ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_info);
 }
 

base-commit: 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21
-- 
2.34.1


