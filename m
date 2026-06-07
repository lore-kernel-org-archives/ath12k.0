Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FD5CD8C92
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXITkc+tkWQMcJ/oIGv5IYMCHMit1ftKb5kgEiFE1Js=; b=g/o3QeLfN0bZ7IC8eG7LmXB6x8
	qHWWNB5IjhLOXSNTyel9JC7Vs1S40O9cliaVKQMzuANW1q02y7tbs6Rqo9a21tNaasyGvPsTei6Vs
	nOZAdFz1qaZgZUyTwB2IsoY1wW1tXg4yeYsyAqSZdqwjxnZP1WNtEcDtNfumDIvh/ku1YBpzIhuNu
	APG+14+6uUgfnt2zLw1J0UCl26VME/sR0iaMROUQJ+x18H6LGvxGW4csD4FUtrySY+m9iUswbro0z
	BL95zbmZSY+YAEEgZc1WVRBe+4IkeIOcioy+i43ObAhkdLDfVYB0hGcV01wq6i2lJaJklm1aaU4g0
	JURnWERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHn7-00000002OIu-0bSB;
	Sun, 07 Jun 2026 18:00:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHn4-00000002OG0-3LBg
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 18:00:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElEp5827670
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 18:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IXITkc+tkWQ
	McJ/oIGv5IYMCHMit1ftKb5kgEiFE1Js=; b=Uy64Y7svAp+JJuSTJ093XwcMFb7
	FpQ0J1v09mQUOKHH/PkCY/52gTKbawJPRNHh0eofUB9jRCCmy5p5+Jos4Cspn6LP
	xnpeYt559OP5G4c/ZW4wmkuBwW1dFHMG0BvjT2TGRsxsxVaMGfLpwmBgfVaUdt9k
	k042q/LP8ldkDJAGiAYcDW60jZDUR6yY/hsRainBPQy0/BsDRCVbc2uw7xO8X1bA
	6/xRUdWAumEQPD+UXnqy0kGKUvaw+uOFYHZMaiDIc0pEsd3bDYZAxl5Tg5CAQiYx
	DH7K8zRzeDQDJcXSReJIzVHJNLy3z1eP/XdF1Qlj82ffSGX5/wGQT3PemRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6cbwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 18:00:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso2243546b3a.0
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780855204; x=1781460004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXITkc+tkWQMcJ/oIGv5IYMCHMit1ftKb5kgEiFE1Js=;
        b=YFnyThFv3y4OMTq6/Y0RMHSW27Ko7B5lp8grY27nP2DYzjiF/QHPhtED27dN3xg3/E
         FF75qfl4BzoBtQG8hMjBs5+F/tyRO/jqZgcbxfUIBvxXlYd9bwlI4wWnKLa634+RgoLm
         WroWhad+3xNWFeKI5Bbt6/MzmTq3eaov8kFi2XC62u1eaF5va+lACUiG+iirdlLZl82c
         Sfm+cuedcLXtQ62XeW/qU3pxW0rIVn/dPCM8M7I7ulN18bQ3alU5gBBQx/SzfbVuVUF2
         MYjw0cqLYfJ8YI2lawkutml2Du2x6BUVNIca+HV4jAnPmGTv4e192hVnDyGiXwv+8d9x
         XTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855204; x=1781460004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IXITkc+tkWQMcJ/oIGv5IYMCHMit1ftKb5kgEiFE1Js=;
        b=Spk+sUOPYEs08RaZPVUwR7FQ6ADM2D7c8Blu6rNhLPNgxkdhcSYFiYXuk+Y1wBZ2iG
         +2g9LCpYVx/eLku/BJrExwfjZGQ48MHOA/GUcBd0R+AqloK9CbLc2AV0qYzSGI6pcEiQ
         EVAZGUjJegEevwQdrz2J9MbnVBQTv97FX74i1BrDxirEy0OMFS9gbwN5lhAmWUNpy7dj
         3TAW3WsHW/OZlZM/H/BS4oBtQR55Z1iyfbojIUdTkimdDeyZjTHeaqpML4YJNo1NszqG
         OLkylHEgf4CpMGdReIK5EWrPpqjDODq4pMy/xthlJX8QpHT2zbtWSggCzKghl2ODDkP6
         0kFw==
X-Forwarded-Encrypted: i=1; AFNElJ9HLRh1rTAtu73o/VJL/3f/1TqUe7aNSrdBibhsRPLgEZvjY2kf6uyYrPPO/uAL5kTuuZdhvBw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMdyK2lHYm7FtW9NbNbkcUu6qIhRmWLQWvRRXgKfdk9EqBK8yP
	7xGuHcCtkYlsXDK2XqYbi6vxTGnPqMgTFmtReKgBcB4qNuQcxcUpUlFex8fyTzCVCZ4igJh0eOz
	LfxPwbxeKSFMDxDuGi+1BfSoKhJAD08RT+zlAqR8YOiBK+9UDiTt96EabZO97nrKv
X-Gm-Gg: Acq92OGydAiAC29meBmezbMOiwen/R7cD/Q+2rwwwwmaVjYa4uLTP9XVVC1XrAhhkFm
	yYQbuBKOqgEDCn49rF1IOpxFtWEtkq6OPlkrr+sF95zqL7w8j3zhKaRJ/3Vm4BJqLos5SaDXySG
	5FZjwqbaruPVEjB65Y4ZvdKdybRIFzdQmNCOztJtSK2K/Dck936gD/x2FyjX5HsczrHZJKWmEA9
	sqgipSHWOiL0RcZdJQOf26unhRa54PpooO5OJXJS7S7yLXviodUPlLU28DCMGa4gc5/En6D9495
	0Vr0dLnueQYizooIzgYxBPOWpUnuZDFUnAxBfDSEF8H2YQHNUt2nr7D4T0E5rfavRBeC2KcMqCp
	8iSLYrH9VJdTpkXcwm44pYjaWRylJQWid5fw8uAYAmvOqOstukkCXiYSGEl8+DDP0SRZaGiVBRQ
	ZAd5lTDGRDdEiN3HjfJpA0+VbOfRk1DTMMaWfb5y54seoFH1LhSw==
X-Received: by 2002:a05:6a21:6f0e:b0:3b3:1ee3:2796 with SMTP id adf61e73a8af0-3b4ccd00046mr15508158637.1.1780855204257;
        Sun, 07 Jun 2026 11:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f0e:b0:3b3:1ee3:2796 with SMTP id adf61e73a8af0-3b4ccd00046mr15508136637.1.1780855203782;
        Sun, 07 Jun 2026 11:00:03 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm13078522a12.18.2026.06.07.11.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:00:03 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next 5/5] wifi: cfg80211: support MAC address filtering in station dump for link stats
Date: Sun,  7 Jun 2026 23:29:12 +0530
Message-ID: <20260607175912.2266215-6-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25b1a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pcWKcSKorTg-uW9tO98A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4MCBTYWx0ZWRfXwSddfR1xBYKV
 uEFsEBc66SmxVYqWKVYr15iuVyIh+d8cNvVuvvo5qHkKSTQLyZZT294CdmPW1GI6Ns8CtZYdQhp
 W3XGOQLCIdR6/35UyYImGjGSp5RYIAMySOQh++aFD1PJEJxyk167oe1fm7nTTQwyr6jrCDjNnNm
 8taDpOsGG3pOBcTVrJ/eVf74W0cusYcg0PyqpPwBa/Ao7jciDbUFE2V2ZWakuSP2RAWdGamvl1h
 ay39DNH5oh0+Fgq6+msqfVYHDAcVq5u4Dzn43/vVXJsBgbkbDtC9ry5ECfU8qQkFnxdgJQcDZw0
 jnED6+3L48chtMOzy5wWJyEIB7nBHKczeVv3cYnBZ8c9UpVNNhbF7cYpvZVWPsg6pcMAQT9xQ/v
 g15e5vNJ1EyOxx2hr0D8xAwgkgNK4OL5yYMlPMIiKsGMER8V6ErSiYtGId00kFhrOb/LyinHnCx
 AQG9GUxoox30Ma5rRCg==
X-Proofpoint-GUID: RipPg46YliYUca5FN3jC5TD2nqRwXTIK
X-Proofpoint-ORIG-GUID: RipPg46YliYUca5FN3jC5TD2nqRwXTIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_110006_960972_B6BFB248 
X-CRM114-Status: GOOD (  18.79  )
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
 net/wireless/nl80211.c | 44 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 3dba329c7eb2..209df747e53e 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -56,6 +56,8 @@ struct nl80211_dump_station_ctx {
 	enum nl80211_dump_station_phase phase;
 	int link_idx;
 	bool dump_link_stats;
+	bool filter_mac;
+	u8 filter_mac_addr[ETH_ALEN];
 	u8 mac_addr[ETH_ALEN];
 	struct station_info sinfo;
 };
@@ -8618,6 +8620,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 	struct nl80211_dump_station_ctx *ctx = cb_data->ctx;
 	struct nlattr **attrbuf = NULL;
 	int err, ret;
+	const u8 *mac_addr;
 
 	NL_ASSERT_CTX_FITS(struct nl80211_dump_station_cb);
 
@@ -8650,6 +8653,19 @@ static int nl80211_dump_station(struct sk_buff *skb,
 		ctx->link_idx = 0;
 		ctx->dump_link_stats =
 			!!attrbuf[NL80211_ATTR_STA_DUMP_LINK_STATS];
+		if (attrbuf[NL80211_ATTR_MAC]) {
+			mac_addr = nla_data(attrbuf[NL80211_ATTR_MAC]);
+			if (!is_valid_ether_addr(mac_addr)) {
+				kfree(attrbuf);
+				kfree(ctx);
+				err = -EINVAL;
+				goto out_err;
+			}
+
+			ctx->filter_mac = true;
+			memcpy(ctx->filter_mac_addr, mac_addr, ETH_ALEN);
+		}
+
 		cb_data->ctx = ctx;
 	}
 
@@ -8661,7 +8677,12 @@ static int nl80211_dump_station(struct sk_buff *skb,
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
@@ -8679,8 +8700,25 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				}
 			}
 
-			err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
-						ctx->mac_addr, &ctx->sinfo);
+			if (ctx->filter_mac) {
+				if (ctx->sta_idx > 0) {
+					err = skb->len;
+					goto out_err_release;
+				}
+
+				err = rdev_get_station(rdev, wdev,
+						       ctx->filter_mac_addr,
+						       &ctx->sinfo);
+				if (!err)
+					memcpy(ctx->mac_addr,
+					       ctx->filter_mac_addr, ETH_ALEN);
+			} else {
+				err = rdev_dump_station(rdev, wdev,
+							ctx->sta_idx,
+							ctx->mac_addr,
+							&ctx->sinfo);
+			}
+
 			if (err == -ENOENT) {
 				err = skb->len;
 				goto out_err_release;
-- 
2.43.0


