Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC017CD98C7
	for <ath12k@archiver.kernel.org>; Sun, 14 Jun 2026 05:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bm4jK+Xf02dDBOsENrfFjm6MJTebtVtYExFXmcCKlgU=; b=HY3Wx+nlWWJ+r2FLjDD9BN3q0k
	RGlDPac7cVCdytGpdeBa2r7WgN22h/8MtPFkxUggZ9biskU2xGJJcx/rM6zQzSm3bojIZw/DmAvUd
	ldkCiwXT4j0LEywaW4+kPXzGUvcNGyWfGzVmiTtYqKYdXCHhvmQj9mA4Atj8qmzcqyBnZrN7JhS7S
	iv8PHoJDaiELfHXoZybxxUs8HS+X9Ro7VPpkqScnOM2aLJb/y3fUBlTeAZTNpKf0gIcpN4tNkfKao
	IwLXz1PmdJU0QtoqmazjUxInBhtISj8MDnW6iyST9zKKGs7oYFpoVtDVySWM7lizBRiZAujqE+Icd
	wkK5nRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEr-0000000Cka4-1neZ;
	Sun, 14 Jun 2026 05:18:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEo-0000000CkYz-29ft
	for ath12k@lists.infradead.org;
	Sun, 14 Jun 2026 05:18:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E48XAs124406
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bm4jK+Xf02d
	DBOsENrfFjm6MJTebtVtYExFXmcCKlgU=; b=arOKUpYwGemyL83ekTpK9Taikj7
	ZxJop4V2QrBplYjBVoNL0gdWpR85H/fHvEEeGBCsaB6MbnK1sAxLqbz4cKWzfT7U
	UwXN/Wx3T+s5TDtxL7hJfu0XEWwBSVajELSyI5HXRVeiy8jythBzODo6AkEj3B6I
	ppONxfdmdSMv9qiuhM1CiimTeqgpvTWSeN1mDfWp0tPQ9f2c+xlKRdYk8hsdg+nk
	N7CH5x5Ws52p5venPnlR6eXF9ntmjhkiadaKM/ILpJELeKQM0INkqrsdC4pucijb
	yQcpGUyqCC1E6GPrg32vtYGikTiuEU3m67doQ+PZasRlmbbC6MPrfTJ4fZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fathd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so20586925ad.0
        for <ath12k@lists.infradead.org>; Sat, 13 Jun 2026 22:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781414305; x=1782019105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm4jK+Xf02dDBOsENrfFjm6MJTebtVtYExFXmcCKlgU=;
        b=MYlHUy0zJCWF42K5/Hck7ZNhoXOW399QHAp3XH0sIAXmIag1rqg0HOgq7MAcTtYx3Q
         QZx9uj1pXk8DZRNlb+QvaZA+pL8+uFKO63zEhvFvvoxYnP8u4GQ8Eai/IP6w6b+7OCT6
         AI5R4JRjW1UZdRSQ8UXk9zjWbZ432bsmXWRczLvffcJLHUFmRFOI8UZJ0SmhohjXkUX6
         aW5wQC/j2SLKlzAiLKL3la4GY6UOXkpGHPrzlzamWfuZCja4XEiqgEAQy5xfnD94Ej+M
         3y2YTuhgwjGpA1kMjYy4WoaKdaP9Z7pO8G7K5K/DnyKaXgcSSE+MSy8EN0eL56wtJDho
         W2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781414305; x=1782019105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bm4jK+Xf02dDBOsENrfFjm6MJTebtVtYExFXmcCKlgU=;
        b=nmEQct5EKowlyVQphM8b2bTIEZtZWy4BLdMul8ZuTzzzss3eowfXHs8gBr7qUPJ4jk
         VaBPzti1bRgkBu1XHnhWJrPT4XKLgq+jaarPtx0oq9KoMZwcTGqjwbbSHYKKNthsQU2y
         KQdNofT6/mc9gNwx1Jh8YqimqOHbzMsp/qZH2ld9Xav4E+I11eFgtToPYf1gODzY/zzf
         PCrwxhHk5yLbN/wRjN5mqfytoVC3gKUhAwCwAykGCFu8K87fe6ZuUO0LkJCBdOhiR9Co
         19jDwfGaNC2eouCsJqT418hKPzJyi0a/TK+8lv/vefZDobKr95n699lIUYyZrPaRpCUY
         yDug==
X-Forwarded-Encrypted: i=1; AFNElJ8jhp+LxEZVv3yc+z7XNTVMVlApdIhVXNi7XLoVZfrtx/A5Rrg1qKJjUCd0cyqfoBHqlEdNLwY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/xbQbEdQS3GUEYUy0cTvQ6SKF/FmlLb+F7Yhrjq+yJpnGebyG
	tnkppSUPDRYXVmT/8mztaGtxUv+RryhrxjuHXllDrWaFU4XxYdxDGMcyOcJmuqupNGJv7MiGyPi
	QiIDBQFeLhR5LohZ1NEXv9AHKmRS2iI8gsOOcqGFJQQrdM4sG3pt0cdUnHh+GyTio
X-Gm-Gg: Acq92OGxjZ2cJWHqc9Ry2bEylnq1+pX+zhhAeSmgAav681UYEAw8tS00+JQaTN+OAVw
	FVdp/MtzOsU85RS53dLf6W84Nn4EZAIDZu0VbDUtgLxcpfks+MDhwxlJf/4U6axz1j7bX7b4MSk
	c1NJzcoX2ujUdN0eeWvJkEVXjH7KPrjLnOz2MsrbszW1LN32cO7wq2Kpic19MMgWp+DW3yWq1Dh
	iIx4NFWz0WpuyUbfrro5vFGOe/iefgBqurDQb9BWsNzv4Nty0BLYKHrGuZoUfQ5i5GWm/CULYr8
	rCUZtj/VPM4RG2y6U+PTLVehyR174vVJxL9Qm7w5HZJgeh0g3nSS5gdUeludrdoUobV6CUwsCSD
	RuPSn/9+mWRLCAFsvqzE4lLtVuhSYiZcTubKPptRG4BwriykshcKTpBmlpar9VJd0/VInJ4f3aq
	aF/7tW3MjTD1jSJR2YxU7HGvgmwLCalp6uVQ1ZRc8=
X-Received: by 2002:a17:903:2351:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c6641ca3cbmr66820805ad.4.1781414305423;
        Sat, 13 Jun 2026 22:18:25 -0700 (PDT)
X-Received: by 2002:a17:903:2351:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c6641ca3cbmr66820605ad.4.1781414304948;
        Sat, 13 Jun 2026 22:18:24 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c651dsm64456705ad.26.2026.06.13.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:18:24 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next v2 2/5] wifi: cfg80211: Add helper to pack station-level STA_INFO
Date: Sun, 14 Jun 2026 10:47:32 +0530
Message-ID: <20260614051739.3979947-3-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
References: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX0wGJWxJl9ZJC
 9ix/p9SqC7eBbhYDrUJoVl8UmxX9gojbACMiECkXn64bUTD2DNQXx6aDS6MCGhrsMjRk+gU4YZt
 7mIZQ6Zyx9Yh5Cg6zlLL+z8Y4prHa6Z8Ixf3oCmeb1Zc4gpOPeoC9eBa9494bs6ApzV2Sxk67fg
 OTTh0Zw9usUZjeOAmGCTgmsYuX1Kcl72OpOmkug/oo3I9twHYVSd7JPtuycBY8jIWhPVKHn3F1L
 Rl/jnwUzbxHE1XGmCjZZpTjDmy9ZRSWsreROrWzzqVt3f4tKhTZ926GRcfQk0wd32bDKlCjSAj3
 YgRQQB5MFnsbkU1mIuFdEnUl58m6Ndfx+eaR3JlOdpxL1Z2bn9uFp2sOYRe0fi/HPacU6QpmK5G
 4AyIXSPNqv3ZDrV0Tzk3GDigd84i3+zHxpXI349peqXLRU/BWiFLK9hvYPlBnM3stGbKJ0d43Sr
 KgsrHXScdOgS4Doqn7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX+yUhTYKlNPPa
 gly6J6+lIE0CmL85jXNIue3CC8XBk0SUBpHY61+YGOnwVOm1eWKITWix5ldPPnMrtB8FOcfcbBI
 3jhBa/zMGeajP0OLnFs9rkEH3zaV4lg=
X-Proofpoint-GUID: tkawWCsGTtb4HxcdQ90J0KO9U78SWOQf
X-Proofpoint-ORIG-GUID: tkawWCsGTtb4HxcdQ90J0KO9U78SWOQf
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2e39a2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1T2V7jJnlCC3E2zEIMEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_221826_581080_E58D6E16 
X-CRM114-Status: GOOD (  15.25  )
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

Add a helper function nl80211_put_sta_info_common() to pack the
station-level (aggregated) STA information into a netlink message.
This prepares the code for future enhancements such as supporting
fragmented link statistics in nl80211_dump_station.

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 66 +++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 98548e69b5fc..66f19bfc030a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -8029,32 +8029,15 @@ static int nl80211_fill_link_station(struct sk_buff *msg,
 	return -EMSGSIZE;
 }
 
-static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
-				u32 seq, int flags,
-				struct cfg80211_registered_device *rdev,
-				struct wireless_dev *wdev,
-				const u8 *mac_addr, struct station_info *sinfo)
+static int nl80211_put_sta_info_common(struct sk_buff *msg,
+				       struct cfg80211_registered_device *rdev,
+				       struct station_info *sinfo)
 {
-	void *hdr;
 	struct nlattr *sinfoattr, *bss_param;
 
-	hdr = nl80211hdr_put(msg, portid, seq, flags, cmd);
-	if (!hdr) {
-		cfg80211_sinfo_release_content(sinfo);
-		return -1;
-	}
-
-	if ((wdev->netdev &&
-	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
-	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
-			      NL80211_ATTR_PAD) ||
-	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
-	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation))
-		goto nla_put_failure;
-
-	sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
+	sinfoattr = nla_nest_start(msg, NL80211_ATTR_STA_INFO);
 	if (!sinfoattr)
-		goto nla_put_failure;
+		return -EMSGSIZE;
 
 #define PUT_SINFO(attr, memb, type) do {				\
 	BUILD_BUG_ON(sizeof(type) == sizeof(u64));			\
@@ -8145,8 +8128,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 	PUT_SINFO_U64(T_OFFSET, t_offset);
 
 	if (sinfo->filled & BIT_ULL(NL80211_STA_INFO_BSS_PARAM)) {
-		bss_param = nla_nest_start_noflag(msg,
-						  NL80211_STA_INFO_BSS_PARAM);
+		bss_param = nla_nest_start(msg, NL80211_STA_INFO_BSS_PARAM);
 		if (!bss_param)
 			goto nla_put_failure;
 
@@ -8188,8 +8170,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 		struct nlattr *tidsattr;
 		int tid;
 
-		tidsattr = nla_nest_start_noflag(msg,
-						 NL80211_STA_INFO_TID_STATS);
+		tidsattr = nla_nest_start(msg, NL80211_STA_INFO_TID_STATS);
 		if (!tidsattr)
 			goto nla_put_failure;
 
@@ -8202,7 +8183,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 			if (!tidstats->filled)
 				continue;
 
-			tidattr = nla_nest_start_noflag(msg, tid + 1);
+			tidattr = nla_nest_start(msg, tid + 1);
 			if (!tidattr)
 				goto nla_put_failure;
 
@@ -8232,6 +8213,37 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 	}
 
 	nla_nest_end(msg, sinfoattr);
+	return 0;
+
+nla_put_failure:
+	nla_nest_cancel(msg, sinfoattr);
+	return -EMSGSIZE;
+}
+
+static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
+				u32 seq, int flags,
+				struct cfg80211_registered_device *rdev,
+				struct wireless_dev *wdev,
+				const u8 *mac_addr, struct station_info *sinfo)
+{
+	void *hdr;
+
+	hdr = nl80211hdr_put(msg, portid, seq, flags, cmd);
+	if (!hdr) {
+		cfg80211_sinfo_release_content(sinfo);
+		return -1;
+	}
+
+	if ((wdev->netdev &&
+	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
+	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
+			      NL80211_ATTR_PAD) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
+	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation))
+		goto nla_put_failure;
+
+	if (nl80211_put_sta_info_common(msg, rdev, sinfo))
+		goto nla_put_failure;
 
 	if (sinfo->assoc_req_ies_len &&
 	    nla_put(msg, NL80211_ATTR_IE, sinfo->assoc_req_ies_len,
-- 
2.43.0


