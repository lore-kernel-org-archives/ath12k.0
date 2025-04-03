Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57957C3601E
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6esBelNOAKgOOsjfxg+XGMAKvus81FJOG5HagSUCP7M=; b=JVupvGYJGqsLndh/za3Y3rXpEZ
	2wPho10iok+Hpj6pVOKeSTGIvQ8yJisJfxJHlFb3h4IKb4aD4nrJ4H8crsKx2SePiprp7BnpnEIl/
	rLmz/UkhQ5UOpd6CCw8s8YnGF2V7SZ8CaC/Fv7SvcyXJAt8oFxLwYa4PNYq9WLr47OR4TV7KazSqO
	67ROFen2b9Wuur/013q4+0qIbUHYptJVyUj8NMF3TFVWFW3IJgkFGtnNsl22YRiz37QDHWDbeqEbc
	b69t2TkMWavzni4nxh6jII31CR6fwW81iNF270KVCYZ751SQ6Sq0fpNRSg7eiz0MoWVcD87+9fzNh
	33v9KVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FqB-00000008FRm-0PE3
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 08:22:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fq8-00000008FQ1-1YJ3
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 08:22:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53383lOp010301
	for <ath12k@lists.infradead.org>; Thu, 3 Apr 2025 08:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6esBelNOAKg
	OOsjfxg+XGMAKvus81FJOG5HagSUCP7M=; b=Taqp3uVhFgybDvlT0xCokgx0cVR
	QKqJnrMAdlSFAErJGC0n8tS8LOoBWbBs4Jss1t0Jdp4AsVqRN7LszRsxLdpFZczD
	b7LLi7ZpoQFEnQ+LBaL5ECDUL9vNfy1uP6QPUie9IjPngagXozwvDv9N7WpfTRnJ
	kKMjhoh8bfs9qw/e3i9QcxlNqg8GtkaEB++FaYkoSW9GXQO7qXSPkS323MpXB9sy
	KX/Iu4o+V0HwiiwSSqqN9PiV0n0UYkC1cmda2P5M7lRB+Qpnj1OztarxwMKJpnzf
	X5nlbPbisg7W12DBv7DW6/VrVHEp2XM0pgzvoliLWOJKl0TGQZLfFr8G3iA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sbxy1dbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 08:22:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73720b253fcso616990b3a.2
        for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 01:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668539; x=1744273339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6esBelNOAKgOOsjfxg+XGMAKvus81FJOG5HagSUCP7M=;
        b=SOga9y+cLM65FBSJlThdpW1wyAP/1p0BIMvQcEXUSp7dj1juOD9eelzY2BrUcC8+1P
         sGJq9/m3Q1nJuu/lwT+9YgHI0XE0+JdYqnyZDI78vU+1vFiktnLUt6Dx1LFqNNiQBVeP
         FWlzs9ul1p1H7D6I2HBqtel9JYS8sZpwbxbQxMbjxrBzv5AypoMMvD/dhqZCVtgIx0VD
         Me8Qd4AFK4N3MSh1OWD6je4Akt8muPPorMoXrR9TJ/mRrh8kQVnDLbMMfW0d5yCBTSoL
         o8prq4gDVNssZYck3RBlCiRuMeqCW5zbognKIF73BG9mrTxrKhiuhITvYbak1/Tk/fEu
         uA0w==
X-Gm-Message-State: AOJu0Yy0+XCVKm3C9wU25v6pHlDm1032/qC8pB6KmIuNr1x9U5OfkWRq
	p9Dgch8FUdL1as8f7wkfJs4iSj0LAtWPf1C+FG6RUpXl5CnELdzjtAvFvJVmB/CSwTgalHECt1u
	7vNULAZ2fVJ3DeKquXji58/XjPfTrU0DbTLExqoSGgowIaQj5UbjO74SGRFU2gGknZPFT
X-Gm-Gg: ASbGncs+YH53nEsAtcCf3pQljOjuGY+LXfxV8sCO0+ODJPLeuuyVU/2hIT+LGJqAaz6
	A8F15XSzuWLijsYMs88ZRJ7GfSvQYN8QsgpW+7EJjiD95KoKtWd2sYGsNW56T3L8w4egNz2++Ih
	gsL/hItUs+9fEYjVE9/KRHh+z7o5PkHIiwnr0LiL7ilzXi6j/gP8w3afLe5qcvwdL4xuHIXZMp2
	kfXiVdpdIC3WCZI7cphYZRXmx9alUZJLM8fbUdPzFlvivDYndH2+Nj6w9/2lpLJG2myYXMfG6mu
	jeXb1OHEpjnLw3NnV27ss+vO7ExTkk6ykCQHEQVFqraw4F9BNGL+sYRKs3b3EHuIRKJjVSHJvJ0
	cReUaJL+YPkJreWP+K20Pbz61n1KORlAYSCmWJqI=
X-Received: by 2002:a05:6a00:1309:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-7398036acbemr27470736b3a.6.1743668538619;
        Thu, 03 Apr 2025 01:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGETLC/kmGTLpQGVF7+wK9Ovp6qgVpFH5bC1wFzQ+j22HSQk/gmxF+qKaR/EOTG5SXEk/YSPw==
X-Received: by 2002:a05:6a00:1309:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-7398036acbemr27470705b3a.6.1743668538089;
        Thu, 03 Apr 2025 01:22:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea080esm900381b3a.108.2025.04.03.01.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:22:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Introduce check against zero for ahvif->key_cipher in ath12k_mac_op_tx()
Date: Thu,  3 Apr 2025 13:52:07 +0530
Message-Id: <20250403082207.3323938-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TONk4BSJT5yToU-OwzogeCEncfeM4YHj
X-Proofpoint-ORIG-GUID: TONk4BSJT5yToU-OwzogeCEncfeM4YHj
X-Authority-Analysis: v=2.4 cv=PNAP+eqC c=1 sm=1 tr=0 ts=67ee453b cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=mQDnMu6jyAvxAejt3JgA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_012220_435505_342BA09D 
X-CRM114-Status: GOOD (  13.04  )
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

Currently, ahvif->key_cipher is compared with the enum value
(WMI_CIPHER_NONE) inside ath12k_mac_op_tx(). However, ahvif->key_cipher is
set using the macro value WLAN_CIPHER_SUITE_XXXX which seems inconsistent.

To improve code consistency and readability, introduce check against zero
for ahvif->key_cipher instead of comparing it with the enum
(WMI_CIPHER_NONE).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0036178cf999..628504ac05f2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7493,7 +7493,7 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 			skb_cb->link_id = link_id;
 
 			/* For open mode, skip peer find logic */
-			if (unlikely(ahvif->key_cipher == WMI_CIPHER_NONE))
+			if (unlikely(!ahvif->key_cipher))
 				goto skip_peer_find;
 
 			spin_lock_bh(&tmp_ar->ab->base_lock);
-- 
2.34.1


