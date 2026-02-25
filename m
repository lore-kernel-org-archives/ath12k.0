Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC378FCEE91
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GMadxPYeeGMAc9obR7DlAd1ejOg9CPu2y0rOMiz3SwQ=; b=hCtp9rHNR2/JVecUqT5yCJtmSO
	hhnRf4ItjH0AsxycG5snknPJdMmBnQNYTr1FH6XbFuEV67jdbt3wizbu+j/q28n7xWQXPBYAaSrlQ
	b0mt9WoRZAKDXCS3M35atrHIGpdh9YLqdfdJwgLVD7q4k0Oeobrbq2D2J3xGtzsSDrHN/VojdR3I7
	NMoQveSc5ZPpZTjUnywaa5SqYQ+tAeKAnBNomJ3e5w6UW0G6MUzadg/GX+f7uVe1lreP4u0OKAO8t
	4YUkTEDk8E0D9Gct9AbH1m+qnNlNRpMeA51n2WT2vt0TMI87zqD9xIiaEoZmBmOruD0v78w8Y+j7f
	MuMTsaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDOY-00000003x2D-2CYM;
	Wed, 25 Feb 2026 11:49:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDOW-00000003x1T-27tF
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 11:49:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SCTZ806821
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 11:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GMadxPYeeGMAc9obR7DlAd1ejOg9CPu2y0r
	OMiz3SwQ=; b=lyKWrY+3Bx7tF533llt3wYhAEzcW1VXg7i41i2JcuLdbROzAGwf
	GW4RQCJCyZTWMeRF3OHtsvXR5ZbswvKCac02HjHxA54q6l2rXj6DNBkMxlklkTNz
	6qPlsrQlMT/R1wBL0/KSXlhbMIvr/Jwoi2nkObDhOGm+HKNFTj7q9sgLif6xO445
	w+WcH/hkJ1jnordEKcQKeoTkE4ZSJwI41Y20X2rtUHWwYxJguchkm0c/qHiQDkmO
	rlK6dz0F0jGk8fpuE++KRnAUyjDwJN5hty6JyCxJ48BnjxSssGCl+7m34vg2JKD9
	CVypFLDxA2WGdHitYmzd20FiJMDQxZqrzQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p9fw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 11:49:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35620e2faf0so5258882a91.3
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 03:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772020169; x=1772624969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMadxPYeeGMAc9obR7DlAd1ejOg9CPu2y0rOMiz3SwQ=;
        b=LWBpCfjCqzkwO4QLsAPISq8yT/st2OJzAlkvCkrFcAPH9UkqudbOV0se+2lePDdhXc
         Hx4FdHtRHgz2aTKrVLkfgAQwyDQAyb0NJKK9tuekaJHaAWTzo1BATd7s6vL7MBUm/q+z
         o3m/XcL9iuB8fpyhdyt1czYIVJnO6sqqWYJRkK/3nAQvM/48I1jqWOk5/TsbxWyZoC3q
         h0GpDHZgfr4BYs/3qGAr30BqDsrFonmNEhOj8b7iXHLomSMjMQkE+kONR5GbejpSVC3R
         oR/uaidDc4geSsxs5yhEgp7Djs8FZqS7+7flp7Wt+ymR0IHGJOKmEJJbKFcpeiHWfAPl
         WCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772020169; x=1772624969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMadxPYeeGMAc9obR7DlAd1ejOg9CPu2y0rOMiz3SwQ=;
        b=brs13wzTzF02MVcm+2FTY5RhgTk04HrDy6hSRrHMpZW8bqOl1E7el3Jam4lkDRqSvk
         L1Z5Lv76Jj/4cm+Q4FuujH20roNVusMLp9aCiX6P9LrGh4ktyTWBlFat01gSa2JeflnR
         5Dj0oAtky0r3BLfvdvViUQXRxdHFC45Gn4diY+PpTV44GcCWGPqe54aC/4SxzKGopE3F
         vcR8IoIA3PUKoULeQtHkKqRXOhUwNYDMWC6vAmQtyC0hX0pbFvySRvwBMZIvIgw+D3e4
         c29sKfwgL+B0p13g9czYQJngCZrBCGo5o5fkSAwtyZ0b067lkQRRjBOeyJU+ddUQzAYD
         IRNw==
X-Gm-Message-State: AOJu0YzIxro+AeyrcrP1V5bMviY1A1ScbkPAm8V67gyg+G46ejuRGvua
	02EI7E9i7LUqdvv7H1ieUIixtBNC0C4cOFGnV2WZOPo1MWXbYdFGi+ojQ02WQeCm1Ac+QtAsD00
	0Zb9OwnjMpVzCLBuciJFSTPh7A9Uo64Y0WhtSMekFAAinzec5XtPTvif3i+h4NN+Cj0CyMfRI
X-Gm-Gg: ATEYQzw/OInGqm/uX9y9ZdXdW8si7ouWGIdo+VKh7ZAKvQw2YR1hnYkwUGNa8pAgJ3Z
	jaQEcoUahz1jU9embKvwz/FvygpKWxmc5l3PJKP8R/RFJlGE/E/tZgxSmVTp4tLW3X2Hcw29aod
	lyNFMdbZW04qLhmNVmvgWGZgbPzmPiJquuHZ0WFJ97eSW71v4odlsSkJQQs4k8A6lRC6Qhktg4x
	UUIePR+z/K8JMJ95UM+vJKX/NjVCTx9tCROSLdShpL6RyJq38d072w6/MHiieqok74GtwPAPjfr
	4m+SWo8mt0+IRIJBp9U1r2tBzqCcY9UOiY36tpQPhssgzbTsY/lU4WtZO97k6I2bIi/l0kqL+Oz
	hRb3X1LwSUYs90UJRLWH1zMyp/1gi+Nx14FhaluQxTNWYlvDJEc9dGW+38JrQkFKX0d633twa2Z
	mticO5tJyL7585TIFpn9hKnHoMMLAvAjxJrD7P13/j64k5zg==
X-Received: by 2002:a17:90a:fc43:b0:354:999f:1b22 with SMTP id 98e67ed59e1d1-358ae8d7510mr13284791a91.32.1772020169557;
        Wed, 25 Feb 2026 03:49:29 -0800 (PST)
X-Received: by 2002:a17:90a:fc43:b0:354:999f:1b22 with SMTP id 98e67ed59e1d1-358ae8d7510mr13284781a91.32.1772020169075;
        Wed, 25 Feb 2026 03:49:29 -0800 (PST)
Received: from hu-rrajkuma-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35901977ec3sm2923537a91.7.2026.02.25.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:49:28 -0800 (PST)
From: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session
Date: Wed, 25 Feb 2026 17:19:12 +0530
Message-Id: <20260225114912.966266-1-reshma.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExNiBTYWx0ZWRfX8KJGTCEUdfLR
 E75EvYVSrDGuhX0Cg9AlXN8scLe2ilkOv16/hLRdramARCUHxKLBLR5gCuqLohssBdcucjiKre9
 qBiAZ9jhK9fco1INsMq4mByBI3T8J77tIDMcOP+nRjNzoK9Y9YVX9SkC5eZceifPL+f+b76KUKb
 yXx65eorZrim6V32bq3BHfRiKY5g7vBKVPE3T2bkGOhheo89Rq03cX+crLIoka6K0971Ek+iGOo
 ypjP9lANJbNG17BJut+QTVboccbOQeMW7czKn42GuN6kgQ39vjy2+4vOCHEng6fYJNMs/4PYfus
 KDlzqSaiDuMau+oIHyktAdGyBygEiEhVBAWkGypOZG8Jlja08OhFHqXYThQrwzcfvR+4cut7Zo6
 ii2ujPbl+t+cm7tIkUm/yOERkOyFI/Q9pPtZDm+jQD3KnwLzXOBTcBMeF5LizuXNp9uUOcJALU9
 09r9mBnTvpEnnjN2SeQ==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699ee1ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vkfXM0Oplov9zySb:21 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HdHnenrRhoasRur6LLcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YQmiB-vM5-TzfY3ZfRMg0i1I3yMYYCS7
X-Proofpoint-ORIG-GUID: YQmiB-vM5-TzfY3ZfRMg0i1I3yMYYCS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_034932_681583_DE28A6A5 
X-CRM114-Status: GOOD (  13.98  )
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

With traffic ongoing for data TID [TID 0], an ADDBA request to
stop AMPDU for the BA session was received on management TID [TID 4].
The corresponding TID number was incorrectly passed to stop the BA session,
resulting in the BA session for data TIDs being stopped and the BA size
being reduced to 1, causing an overall dip in TCP throughput.

Fix this issue by passing the correct argument from
ath12k_dp_rx_ampdu_stop() to ath12k_dp_arch_peer_rx_tid_reo_update()
during an AMPDU stop session. Instead of passing peer->dp_peer->rx_tid,
which is the base address of the array, corresponding to TID 0, pass
the value of &peer->dp_peer->rx_tid[params->tid]. With this, the
different TID numbers are accounted for.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a32ee9f8061a..640f752eaa03 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -735,6 +735,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_dp_link_peer *peer;
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(params->sta);
+	struct ath12k_dp_rx_tid *rx_tid;
 	struct ath12k_link_sta *arsta;
 	int vdev_id;
 	bool active;
@@ -770,7 +771,8 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 		return 0;
 	}
 
-	ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, peer->dp_peer->rx_tid,
+	rx_tid = &peer->dp_peer->rx_tid[params->tid];
+	ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, rx_tid,
 						    1, 0, false);
 	spin_unlock_bh(&dp->dp_lock);
 	if (ret) {

base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
-- 
2.34.1


