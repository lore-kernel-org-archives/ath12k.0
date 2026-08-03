Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF66BC55162
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 01:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gOYdHmHJg1Jcs8rtWRTz7x7izX1hWSBGmELRGXVK7vI=; b=W9YzABr4piBz2a7MAEBjKXTUSr
	ORUfgxmhaWgkVOi55IZBWxu7uFasNvP7MZSsDs/oHuGGab2qMQvA7BT7iygquBlHeMg61JWYXZD5y
	YZH3D/qmqPZKGrzYuNGrabLE/wG2R+adzsdauhwBr7uEB/jfr28hEOT2AxblxKZhQxuUUIHMtmqZi
	/YQQKJ1IR6QhIZBzPMTiDH+5BWXeUZdk9paDzPeFjvBmYAbAof1t61cf5497l16fczK8xLzZmp3Yv
	KxXshmBMT0XsJn7uYJy3pmH80u6Xux63lZZcfEGCGTHRMq/7MhqpzHIHPSayKgxcap8a0rIx/vFKA
	2yjjQV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqh7s-0000000G9GV-3Zxy;
	Mon, 03 Aug 2026 01:05:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqh7p-0000000G9G5-1pvh
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 01:05:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWMoF2793334
	for <ath12k@lists.infradead.org>; Mon, 3 Aug 2026 01:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gOYdHmHJg1Jcs8rtWRTz7x7izX1hWSBGmEL
	RGXVK7vI=; b=OWfd+iVEqpl7w/0lTw9yReilSYO4bJgQUkuABKt5xBpUe0sRyWn
	HqrsGjqj8h0dcLMRCK31PfddX9Or7UqhUtd7Pl/JgUEV1VLSXbPHxa5g4n9FOxb4
	piIfPAQL41IDK9Wbr619lK2VUDtaW8zr0AOmkX9lFVTk9HB5RGLQyYbdHMbA137Y
	RgdhkJKZexIRtixObg9cboI3fQx6hCaKln/uhCMbmFrO7kTEwj87Geh79qtKQN2c
	cYh+WT0nJaHfUgzw2gbUY9nhDw3xTxAhIPAnzLpA5a5dEZ8PaJborXY1QCS3dqVu
	p016t15tcVf/cjrQMLVNH3r3hlFa6StyHsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9byq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 01:05:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so55130705ad.1
        for <ath12k@lists.infradead.org>; Sun, 02 Aug 2026 18:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785719149; x=1786323949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOYdHmHJg1Jcs8rtWRTz7x7izX1hWSBGmELRGXVK7vI=;
        b=KykR/AgbXkMe8vvSlJwnkUQXEnIk1Z8Op7cxAD9Any0PITDQG9viRsXjreZJXI6oTZ
         yssfZPWZ8836V3Rdz62lVILIndnfW+igPik//5Ks6+IJQTAEx1WsZNBi10TcF8Z0qzF9
         6AU8WF3c3zdXPQDBetHxCRvYDhw9L2S9xSHcN99xIo24mo+LcAIYoP57QiIMk8P02w0i
         YDjn9EYkDCfrbwVo+CVRlgcBRdV4KX/U4CmIxTtByGItZ3Hwf4kRXSaB4kUAyZsl9LNb
         JzMJP7OZHnAH255PiPkvt2qW5Sg2aXZO5KKZisbOnvwsM8jYSA4/VInCYYuPe86qdsju
         Fx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785719149; x=1786323949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOYdHmHJg1Jcs8rtWRTz7x7izX1hWSBGmELRGXVK7vI=;
        b=ITwyYZrbPNqS5UFYWELAf/1vVSYrL6jEgtoNnBNgaqSjm82O+3gQfVPap+DrFvVrXY
         0pwJggCbfAlwdiwJc0RS61BnJKmBs2PeohVxlw6+CRjLNHnPwe1XbyRoubJhTqWMONq/
         JuQ/lNfjK8ZCCjodT625J+f9bWRa05pCQ299ZfVvFnJCZBQtQwSYxyGskGdxyhF4C7aN
         0LHFWe+xzGCHTxbX5gn4izExvCH2YvGF7uG65I9dFUb54X66JhKlnNoDsSIAKSIaeCMu
         /hb3Jy4leBl75SysiacJptL+Zqehzl2G9prA9Mj+wn+Ip1QKMobyUG76l8Fzvni3QS93
         t6hg==
X-Gm-Message-State: AOJu0YzQXfBBV4i0z5grLbBKOH45KWojbhKIGgGJ2qLpWzkAMGDdOthb
	zqjPeIxEzD0iDzhBvlMDZxTqETlLk4dFVlNuYjGS0FbYyR6uNwr/EceT63m9vZ5Bi9H6hvz8Kku
	9q0sFmxAfBR8loQhU9LZXjjuBJTGARz0FXffEVJSUFb4rYx5QvtBouZpePpIW7637
X-Gm-Gg: AR+sD11dPnGzUiwwwsHb+hXPrVeOtUcxLhh7sICkEHEOHnUkoh89XEuD5h/uaWqBhIg
	J6PLaj0NK4YCU+m0nhZz5iXgDWN/7fxd14IMcp0uUO0Np6ORAF2Ebg4+S3GezzxU6SjwHS6z1EV
	QTwvyiCtjRXVQae+ksV7yyZYBYd1vSAON3TstmYPcnWruNHugOVtpATE+pddacW7PMgAwueI3ez
	OXmWG9gEFxPwfORqSA2x7JjvPVZAaWeZvl/pJ6Bwd9AHBfbsV3w1WGC2f3UEN27Dj3+ERoONp8Q
	lYyWhoM7ke8G0VKOVquloBs2fmEg5GboQz27WtauOf41cl/AZH2+hjb10I1ZSIPopDuEAzy7v7b
	pwHX34/eCTN5GhtW+LZ9LlRUz0TzLDLCqjEEYoJM92esv+SnKK99xs1wj3B0=
X-Received: by 2002:a17:902:fd83:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d0521ead59mr83215255ad.9.1785719148720;
        Sun, 02 Aug 2026 18:05:48 -0700 (PDT)
X-Received: by 2002:a17:902:fd83:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d0521ead59mr83215055ad.9.1785719148302;
        Sun, 02 Aug 2026 18:05:48 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11e9aasm30167455ad.55.2026.08.02.18.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 18:05:47 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: remove unused ath12k_dp_rx_h_find_link_peer()
Date: Mon,  3 Aug 2026 09:05:32 +0800
Message-Id: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RMEylDlnMNv-OOMxsCvzh4ILH0AnIs14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAwNSBTYWx0ZWRfXxgn2Pn+EDnzj
 YplVq5lLWSIlD5o56QudMaGZxDuXRUU/TpBXIUmDDzDxvM174wKw1faSvkbJOxZ+iDD1carGVJM
 ChsZhnJ7a3PSHy2Qmdqagy3GDzvTCEfABLx+J9zDy6gnUmWOg2BjpXj4BP9iSInjXbUxEkP4Sb9
 Uh8DrMFLecTD2ne+z48vo5g/Qok3GxVUvAZaY+zasu/vTxDAYastWtAt8Ze6dq2ITEnwgFQuA5d
 h8hy9uhsti1nTNQJRojL0ZBPDwcFZYKRn8uVq+BZo0mk5FZ4II5j9gyAegfH8+TCePQRTHNzLA4
 3FgELpoABF8cs/Kuj/7TnyBZKuP0OVotIXl9wFvLpCilngAtF5SzctGMMOfzRQ1+ITV3En8ws+H
 vhXqXruBvl+kpHF5xdYpe9BKq50Bz+cpKMI7KpDkO5P4Z4QD/pFZ59xE+nhk7I+mqy6fVunv8zY
 8QARsqrb8xydVc9KBgA==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6fe96d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-Afe9Qe1I8jwNvhdIH8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAwNSBTYWx0ZWRfXyXijX3Y3FWCj
 OZ/hVDfBCgdp6DlLOgwv7+jUZmCjsaTY5+8dr7GKyVDImw+uDjIz3HI4PjbapoLNu+q7Mq5DW/S
 ruSrP2p9/dkmruwJsJIY9YKzKUB65mg=
X-Proofpoint-ORIG-GUID: RMEylDlnMNv-OOMxsCvzh4ILH0AnIs14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_180553_651663_C9175B60 
X-CRM114-Status: GOOD (  10.10  )
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

ath12k_dp_rx_h_find_link_peer() is no longer referenced anywhere,
remove the unused helper and its declaration to avoid dead code.

Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 21 ---------------------
 drivers/net/wireless/ath/ath12k/dp_rx.h |  3 ---
 2 files changed, 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8fa0e90b4531..23d1a6d39d41 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1200,27 +1200,6 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 }
 EXPORT_SYMBOL(ath12k_dp_rx_h_undecap);
 
-struct ath12k_dp_link_peer *
-ath12k_dp_rx_h_find_link_peer(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			      struct hal_rx_desc_data *rx_info)
-{
-	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct ath12k_dp_link_peer *peer = NULL;
-	struct ath12k_dp *dp = dp_pdev->dp;
-
-	lockdep_assert_held(&dp->dp_lock);
-
-	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
-
-	if (peer)
-		return peer;
-
-	if (rx_info->addr2_present)
-		peer = ath12k_dp_link_peer_find_by_addr(dp, rx_info->addr2);
-
-	return peer;
-}
-
 static void ath12k_dp_rx_h_rate(struct ath12k_pdev_dp *dp_pdev,
 				struct hal_rx_desc_data *rx_info)
 {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 0660db070e92..82700474548a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -237,9 +237,6 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 
 u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
 			struct hal_rx_desc *desc);
-struct ath12k_dp_link_peer *
-ath12k_dp_rx_h_find_link_peer(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			      struct hal_rx_desc_data *rx_info);
 u8 ath12k_dp_rx_h_decap_type(struct ath12k_base *ab,
 			     struct hal_rx_desc *desc);
 u32 ath12k_dp_rx_h_mpdu_err(struct ath12k_base *ab,

base-commit: 691e5e43b2aa5da35b044532845a3b230e540894
-- 
2.34.1


