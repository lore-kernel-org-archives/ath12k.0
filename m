Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122B6CD98C7
	for <ath12k@archiver.kernel.org>; Sun, 14 Jun 2026 05:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xcsC7PWMWF2K4chMPT3Qgjge7/FQUrHZN5Z4nu+yEU=; b=hA00MT6e8menRQwXVVErzOvpsA
	fPsiVicRwKntxSNmwB0RCOgR6bLBFiAdLNhgdGZMRPz3kHiGw7vvhCOxeS2NFCvoqRMLYMTHmOlQm
	r3R43VsmyWlVuMmXPhAv/H4jmtOeO8j3fZHHo9/SPhojYEYfGnwDdlUgTshVsc01FKPXZpJLnLohD
	6TBRa3vFw4k+skk9S1mnofCUjxMRZz4BOQD4OL64MtJ0EzSxSL3yG7xD77Qs5pyH8qtPC0WkGlMwS
	iuzF020HSCQ/8+Bx6p5ur1zFrBMSPFvOleZNRugl4R3bJ4dgwS0VeaNFtiVt3S9bYu0T34aywokwO
	Y+8whASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdF1-0000000CkeO-37KD;
	Sun, 14 Jun 2026 05:18:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEy-0000000CkcO-40h9
	for ath12k@lists.infradead.org;
	Sun, 14 Jun 2026 05:18:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E48qPa137151
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3xcsC7PWMWF
	2K4chMPT3Qgjge7/FQUrHZN5Z4nu+yEU=; b=Z8v14gW9gIyzoNU1NmDesbyTAgN
	pfkDVWPWLLW6GjdpOuaMOXA9GNGIRT+jfjudekFVCqsjlMxs/Dg4S69TbLr5tYmO
	8BtY5qjc9pH/VdYHd3WFEyLqLIMxhYfxPjySkOaKNhUxeSS5h0c7K5h3nIe52XqH
	q7UOjdTQSadM6bbexmnEvLtNU8ED7kEDrb+n4YpCqiLspFIrQ0IeWasVb6Y0BLNZ
	Qs114FhzoU6FpPYSpYrb/dr9cZY1bxudFnB9Zy5eGKbElrIkyheQFL2WmF+eioTe
	Exuhd2gcbcU5i+c8ImkYPEiTV/51ZlhYBY+39pqp4HquSzyJQUEI2H9CPwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgjmxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso22640955ad.1
        for <ath12k@lists.infradead.org>; Sat, 13 Jun 2026 22:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781414316; x=1782019116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xcsC7PWMWF2K4chMPT3Qgjge7/FQUrHZN5Z4nu+yEU=;
        b=TikJuCAI4RFkLG8FPnWst/7W5Gn9WMtF00CIPgTIwV21W1UZTZkfsw+QM2VZLiqWsY
         L5UXFVL9e9obvPDMIpkIyfxbW2T7xyH36qweuA/U32QL3Ux2jLl7zzkE4NPCJSb90rdo
         UKJQnRkrvkGzQK5QGFGxTJknQRw72nrzIOqZMZjSvfVwYYjtsP7egaigxeId2mlfKqhg
         kIdBbFd0RKV/Q1shT8G845qU7AU+cYSvVEJqTCCJcnD4fU/Fa7N/epyYeouYDSEqkOb0
         Gs3IKfij1l/8LBu7PBuozy89XHLu/4X1tiG084K1pQ7oupHrEoUxUFMi4ifFd7Q6E9a7
         KnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781414316; x=1782019116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xcsC7PWMWF2K4chMPT3Qgjge7/FQUrHZN5Z4nu+yEU=;
        b=JsFF+uM8iAeXoC8aVtJO1OrttqAbh1B7SuRABmlPCcuo5D5PmkkUhZpDDYfpG09zQG
         j4QDkSKQpzRkzyyQH+m32rJwfjXRH+/UURg60vyE39Wx44/TPOANKrngmU4foww2XkiQ
         wzcSJfGJhsFWn6XeEryFexuyRFX//+OOJN9AxLLW9+hGENxXazbK4MkoXcPDKHSMc1Su
         mtHRLjWPigF5Z54LMJr7X+XARPZD9+kcH3RslLuDMa0/Vjisp3lLAhj8VKJKBXwIkhwa
         aaMYWWTG4ZxQXpH63IP+R/Awwhf3cG8YRdaPMw7nZqEPHa5OP29fYpNdAmgPSGw6rUQw
         qrMw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jwqz3GlWJDU24kfO95mK0zmdT9wvHQP82SKtCFWtUMgJfUqCaPYFBnmDfqlw+512MVErpXro=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wLQ1D7PtbJDw0oUo2HIPKDH+faKK3cOmberk8Y4DK5F69Vf2
	ahGH2f6XmTFhQiChGerSkS0eg1bfjKDYZoGFFNSoBSL3iONTtZ7bmGYYrIIQ98cN7L+uC6CQjpQ
	D16De4hxnFe0w/976xsBIvXHWDjZ+wSNhNuXKh3c2gSqXyWpIw5dEMXj9tPZcXcRK
X-Gm-Gg: Acq92OGD28sEF6LKoU0vyAs+LealXKoHd3Y19uTxzIu9UsnEZAZaMzND/cQUl/O8Jo6
	WYZa381wefmgFzUinbG/G18pK4PyyXLJyE9VJbtdWas7UB3V6dmVdxlqa7lgI2Tbq6mI+1iI/pn
	ER66jkRHBJYm3pW/gmPhEhFSrmpK6dn9AITX0Yhfcr2HDr0Oi8NVmkuPO215FqaXVGNfxhx+ikZ
	WumSRiPkwylTPgCyEgIuyhXEDHqcb2l3Bx1JqE78UOgX6Uo7Kv2zxNqx+3xANKr/JDMpcJiJ/TB
	KmPult1BQq5RMDpSt8XehkWen0/QRdyKJV6bkK+3HsI21DZd3UBs2eFpMhPYFZAWtQdpl9Tyysh
	22ZXRBzXWPfhM6R2TI1TKfIq6PAegzgho+hceBEbImf2vgaw3n+rMSqHIQ0e9AJKAXFeaaO5xI0
	AEpQm5DArtTTde00CP0bRlv8iv3B7UKYMlb/5AEoc=
X-Received: by 2002:a17:903:b46:b0:2b2:5515:661c with SMTP id d9443c01a7336-2c6642b0dc3mr55466455ad.31.1781414315747;
        Sat, 13 Jun 2026 22:18:35 -0700 (PDT)
X-Received: by 2002:a17:903:b46:b0:2b2:5515:661c with SMTP id d9443c01a7336-2c6642b0dc3mr55466335ad.31.1781414315272;
        Sat, 13 Jun 2026 22:18:35 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c651dsm64456705ad.26.2026.06.13.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:18:34 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next v2 5/5] wifi: cfg80211: support MAC address filtering in station dump for link stats
Date: Sun, 14 Jun 2026 10:47:35 +0530
Message-ID: <20260614051739.3979947-6-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
References: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zWwn7wRBHbIJf5Ooz5qiWC7ydCPLOflN
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2e39ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pcWKcSKorTg-uW9tO98A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zWwn7wRBHbIJf5Ooz5qiWC7ydCPLOflN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX/YZZN491izJF
 kWursDe3xlmmdiWE84VraeItDb7APqD7W/+7lpVNwBhhvPYzssau4ysggCyunApgzBD7gc3y9mX
 WaIcq/SkScnst/sWmIyw52VH8B3Czxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX1GIden2DxtmX
 ksLiuau405ENTu+lXw1+Ly2zxtsY6uRG/+5DQIIEqiUhLBFQsCghb9QGHVm0HAirNwOmPGxKva+
 hejpi66IhC34ra1N3G1qvJCzfuzh3vZ1qpJKSaryTnoNQKlJBZn2IEH5Jl8fNsyHtYYd1Fk//D6
 XJxpWeB9HI5APl/bl4fOBUMe8MeE7+JtkTDpD01bukj0W/3HdlIafiuNLvcjRytYTTFkRBC6FPR
 dtZc/GuLMKp9y4zHpkIms714RG+D8ZSar+8x05vNsNQKT6IVKVN3ATcw9lDzZwhACZbj5lflYoE
 JkmFzbte1jTR+y8KWJQNZ4AETdnZ0MWcjg5ECbIRNpW7vbopmanQ9io5Rc82spAucJBbW3FAj4w
 d9AWd7CLrnUdliuZx5pqU1kj7QOj7L4sLm3RYdZBtJbFcApmf8ciH83xJb4m6wo89/L4e5uEaZR
 Mj8pqTegF7PLeDEeDTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_221836_997819_DA4E5E60 
X-CRM114-Status: GOOD (  19.18  )
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

Currently, when userspace requests station information with
link statistics using NL80211_CMD_GET_STATION with the
NL80211_ATTR_STA_DUMP_LINK_STATS flag, the kernel uses the .doit callback
(nl80211_get_station) which sends a single netlink message. For MLO
stations with multiple links, the link statistics can be large and may
exceed the maximum netlink message size, causing the operation to fail
with -EMSGSIZE.

The .dumpit callback (nl80211_dump_station) already supports
fragmentation across multiple netlink messages, making it suitable
for handling large link statistics. However, it currently iterates over
all stations on the interface, which is inefficient when userspace only
wants information about a specific station.

Add support for MAC address filtering in nl80211_dump_station to allow
userspace to request fragmented link statistics for a specific station.
When NL80211_ATTR_MAC is present in a dump request, cache the MAC address
in the dump context and use rdev_get_station() to retrieve information for
only that station, instead of iterating over all stations with
rdev_dump_station().

This allows userspace tools (like iw) to use NL80211_CMD_GET_STATION with
NLM_F_DUMP flag to retrieve complete link statistics for a specific
station across multiple netlink messages, avoiding the message size
limitation.

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 6910dfa7343e..f9818d4cca90 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -8474,6 +8474,8 @@ struct nl80211_dump_station_ctx {
 	int link_idx;
 	enum nl80211_dump_station_phase phase;
 	bool dump_link_stats;
+	bool filter_mac;
+	u8 filter_mac_addr[ETH_ALEN];
 	u8 mac_addr[ETH_ALEN];
 	struct station_info sinfo;
 };
@@ -8543,10 +8545,22 @@ static int nl80211_dump_station(struct sk_buff *skb,
 			err = -ENOMEM;
 			goto out_err;
 		}
+		cb->args[2] = (long)ctx;
 		ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
 		ctx->dump_link_stats =
 			!!attrbuf[NL80211_ATTR_STA_DUMP_LINK_STATS];
-		cb->args[2] = (long)ctx;
+		if (attrbuf[NL80211_ATTR_MAC]) {
+			const u8 *mac = nla_data(attrbuf[NL80211_ATTR_MAC]);
+
+			if (!is_valid_ether_addr(mac)) {
+				kfree(ctx);
+				cb->args[2] = 0;
+				err = -EINVAL;
+				goto out_err;
+			}
+			ctx->filter_mac = true;
+			memcpy(ctx->filter_mac_addr, mac, ETH_ALEN);
+		}
 	}
 
 	if (!wdev->netdev && wdev->iftype != NL80211_IFTYPE_NAN) {
@@ -8554,7 +8568,12 @@ static int nl80211_dump_station(struct sk_buff *skb,
 		goto out_err;
 	}
 
-	if (!rdev->ops->dump_station) {
+	if (ctx->filter_mac) {
+		if (!rdev->ops->get_station) {
+			err = -EOPNOTSUPP;
+			goto out_err;
+		}
+	} else if (!rdev->ops->dump_station) {
 		err = -EOPNOTSUPP;
 		goto out_err;
 	}
@@ -8575,8 +8594,22 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				}
 			}
 
-			err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
-						ctx->mac_addr, &ctx->sinfo);
+			if (ctx->filter_mac) {
+				if (ctx->sta_idx > 0) {
+					err = skb->len;
+					goto out_err_release;
+				}
+				err = rdev_get_station(rdev, wdev,
+						       ctx->filter_mac_addr,
+						       &ctx->sinfo);
+				if (!err)
+					memcpy(ctx->mac_addr,
+					       ctx->filter_mac_addr, ETH_ALEN);
+			} else {
+				err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
+							ctx->mac_addr,
+							&ctx->sinfo);
+			}
 			if (err == -ENOENT) {
 				err = skb->len;
 				goto out_err_release;
-- 
2.43.0


