Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082E9CA1016
	for <ath12k@archiver.kernel.org>; Fri,  5 Sep 2025 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PnoEsGdxqqq+FIZVH7OYFnVpR36GWf1rMYPBcU3Bqhs=; b=CT6nfWWGEk5/jSY3K8hrCELuFr
	GJntfYQS0MaQEDRjsS6P0jbP/gf1zEplM1XDH56vW4sMiOPp2QCepGOUeZQjCuxlqArXJadeyJ0n3
	IuLCXuvMRyRD3GbGZ3g7WN5E7B5PTAT1HRFEvJSnKATFahaUEmk2oQYdI0UVBvk/rdv3neTmjAMa1
	SJ3FLZOc3EKL1HFhsyIm1fPduCc7yqEKqEPeVE0BOyOOrfIGe6jZxh2yzvCSEdtdRSBR/eDz2kIRk
	231fikNVVGU78NslOIjYIl7xZw5FWxoKS+fD/sp7L3DctsrYfI3QJds/IZJzImn+GTweyu8l4UnuJ
	L1NrTXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZHV-000000036js-3Ckk;
	Fri, 05 Sep 2025 16:27:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVrO-00000001mUS-06Vt
	for ath12k@lists.infradead.org;
	Fri, 05 Sep 2025 12:48:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858ufNH014542
	for <ath12k@lists.infradead.org>; Fri, 5 Sep 2025 12:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=PnoEsGdxqqq+
	FIZVH7OYFnVpR36GWf1rMYPBcU3Bqhs=; b=BATH75HEm8CTPalJQ4riPPDYX3+H
	jSl8HtQINeJeXLPTOjXnhoSApfx5oRIZMxYSm8fMH2nhqT7mjZ3K8lXgYidylMl5
	XL4PNQex3YN0ioS9BMvRJT6Il+y9Z7c1zE8k4K/gfpDecv5KMipsmxe7+87avECp
	yfuLdRZgbG6zHjYaeYT03dVUUTlbjGL9hYiCbhH980W/EmX+jxtL+g/YIPDkAiK2
	neOu69gTuShF6ii3gE+78zy8aA1CmPV5T1CbRulmjZFca4fNRyIDXT65xPm/fkS7
	0xODZuCC5P4xiULRaOydDlXgwUVgJKJqnr5CkPXY6JmW4LPPFdIITcL8Ag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmju3wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 05 Sep 2025 12:48:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77260b29516so4333533b3a.3
        for <ath12k@lists.infradead.org>; Fri, 05 Sep 2025 05:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076486; x=1757681286;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnoEsGdxqqq+FIZVH7OYFnVpR36GWf1rMYPBcU3Bqhs=;
        b=i3fRCgwzEkGnhMytFNgoiGPG7TCgrYcqTYOZtvlQ8643qIlVm2fwpbJpq8p1LnkXop
         cFCHUBx5RTDT2GPN/pVw1HyvaDnjd7BFcq6UU8hy08DNJm9s+xvNyyc3zOD8jD96gxKH
         cT0mtkgD1TSCFpKTq/O/hB1QykypLxzvVcpdlfELAtnuins1jvNKz/ylszqF2DZPOdO+
         XVKdKnKutJl0tYuCT/QsmNgTJIB1m6U+heQtDU1HVfpIFe7v5RvEmyIHT/NJN5f5BDjq
         h2i3ko5hf86YuJKmE+asO4hz2OqiXKiOuruUqefJ+gE6hhATsQ4/OhOaUtUK9Y/Q9z4B
         RO7w==
X-Forwarded-Encrypted: i=1; AJvYcCXNwFjy4149i0b7pS8NO7xNQXW3zWoX9JdpWjFyxOlQkAW8aqABzPD2Tc/M2PAa6HGdWyLA2tM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwYrUi3L+DZks/Vi17/kNQkz5B8JpSX8qGmCpO/Axxff6iEZ56
	3EOxfaEcUm3kqYUasvF9IYlaw05PhE5kk5GyC/XzkLCpJLTtLeVkCGAWGdufAacdGCueACYkuxz
	J8oHDSQJzR9vHIO0djrcMk5fBLnLQ0pfUvcEQxJ+Wf+T31QILWkqvqSjF8Ra0IyTI
X-Gm-Gg: ASbGncue/YwFUjpzv8NRHzJr/f0RvIKNZ6/AmSaoLWKdnxA6TfUVbYbyEuXlYphkxGy
	5eYYC5O6BujW2d+XA2RLp+b1kdoNQrnTizCTjkiLPPzY60Js5OhfgJdhUMTEguCOuNTWpkktMqH
	P/xdrb8MkNDbAYMd8UI25io0CHq+3TRg+so5UsLfrXEMTuLwofkaqZtgyiWSc3S+xCMcolwmiD/
	is6IwofQrgQe1uPt+gJSAasx1F/raR1gvk5putm1Vzu63D57dMlAzoSF9RnG+HS/dHnfaPOJQ+t
	3RWynlMBDJM6CKVkfqoTea3PPRnv1/csuaHvgm1d8MHJu/jmcBFsDXU0pAOmB5XkEml/Hpn9iUQ
	7wqyQkmmNuTJshtPzfSXp4H/L5nWGYjwV5Xt/1bwcobM1LdZULY8rnvdS8lCdT10C6k/nnMwCQQ
	==
X-Received: by 2002:a05:6a20:1594:b0:248:4d59:93d5 with SMTP id adf61e73a8af0-2484d599525mr14294963637.55.1757076486489;
        Fri, 05 Sep 2025 05:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+bGBfGl7Fsr54Xy6h/copErhPkUt2t6Lw+VQUe8R0kU2Adw8e1CrcQx0dQhU4gHL6WYqFwg==
X-Received: by 2002:a05:6a20:1594:b0:248:4d59:93d5 with SMTP id adf61e73a8af0-2484d599525mr14294926637.55.1757076485970;
        Fri, 05 Sep 2025 05:48:05 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4d96829a66sm18041851a12.6.2025.09.05.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:48:05 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH wireless] wifi: cfg80211: Fix "no buffer space available" error in nl80211_get_station() for MLO
Date: Fri,  5 Sep 2025 18:18:00 +0530
Message-Id: <20250905124800.1448493-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68badc08 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kD4sTvn9sZURAWMP:21 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=gXmUh3uitkxkngZH5WgA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: SxyvORj2zaeNfYZAJAbGJef4DzURDsiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX5+snJ6vtexKs
 lPCMQTzXZ/imWjKKDT/M6/rB/vZhz2sZyHZ60BuLf8azE7i6MEbqShctllgqR01pC1FaV7W1H07
 Wxy6WrcezVbezsDfYLYy3UW77WdfkUoTaKS3ntsEuyrZYqqfzFYBFVuUiYuDeJLO9fZShRkq2Pw
 Tb7WxMx2+rcp5FGRaEvMxNAJzs1+K54jV3ihQ61ciy+sS6WQvSIhV5QmeLdgmKzOXcKDvtBjnf1
 cIUXqPDmqsvdIt7qTBDwwaapdUwBgpF2lVUG55G3fuq+OZS5GKihZ1h7qN8CIx3FtesjJ8dnp8l
 0F4UFOoG5B4snK1DN5pq5elKOpuaEug3dwxO049iHbatJZaeGC9bIwdZZnQrCSUdjAmSeDOTZvK
 Ga48GWrt
X-Proofpoint-ORIG-GUID: SxyvORj2zaeNfYZAJAbGJef4DzURDsiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_054810_184856_B0F0DB06 
X-CRM114-Status: GOOD (  15.24  )
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

Currently, nl80211_get_station() allocates a fixed buffer size using
NLMSG_DEFAULT_SIZE. In multi-link scenarios - particularly when the
number of links exceeds two - this buffer size is often insufficient
to accommodate complete station statistics, resulting in "no buffer
space available" errors.

To address this, modify nl80211_get_station() to return only
accumulated station statistics and exclude per link stats.

Pass a new flag (link_stats) to nl80211_send_station() to control
the inclusion of per link statistics. This allows retaining
detailed output with per link data in dump commands, while
excluding it from other commands where it is not needed.

This change modifies the handling of per link stats introduced in
commit 82d7f841d9bd ("wifi: cfg80211: extend to embed link level
statistics in NL message") to enable them only for
nl80211_dump_station().

Apply the same fix to cfg80211_del_sta_sinfo() by skipping per link
stats to avoid buffer issues. cfg80211_new_sta() doesn't include
stats and is therefore not impacted.

Fixes: 82d7f841d9bd ("wifi: cfg80211: extend to embed link level statistics in NL message")
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
Note:
- Planning to re-enable MLO station statistics in
  nl80211_get_station() at a later stage with the
  following option.
    1) Consider extending nl80211_dump_station() to support MAC
       address filtering, enabling targeted station statistics dumping.
---
---
 net/wireless/nl80211.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 89519aa52893..f2f7424e930c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7062,7 +7062,8 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 				u32 seq, int flags,
 				struct cfg80211_registered_device *rdev,
 				struct net_device *dev,
-				const u8 *mac_addr, struct station_info *sinfo)
+				const u8 *mac_addr, struct station_info *sinfo,
+				bool link_stats)
 {
 	void *hdr;
 	struct nlattr *sinfoattr, *bss_param;
@@ -7283,7 +7284,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 			goto nla_put_failure;
 	}
 
-	if (sinfo->valid_links) {
+	if (link_stats && sinfo->valid_links) {
 		links = nla_nest_start(msg, NL80211_ATTR_MLO_LINKS);
 		if (!links)
 			goto nla_put_failure;
@@ -7574,7 +7575,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				NETLINK_CB(cb->skb).portid,
 				cb->nlh->nlmsg_seq, NLM_F_MULTI,
 				rdev, wdev->netdev, mac_addr,
-				&sinfo) < 0)
+				&sinfo, true) < 0)
 			goto out;
 
 		sta_idx++;
@@ -7635,7 +7636,7 @@ static int nl80211_get_station(struct sk_buff *skb, struct genl_info *info)
 
 	if (nl80211_send_station(msg, NL80211_CMD_NEW_STATION,
 				 info->snd_portid, info->snd_seq, 0,
-				 rdev, dev, mac_addr, &sinfo) < 0) {
+				 rdev, dev, mac_addr, &sinfo, false) < 0) {
 		nlmsg_free(msg);
 		return -ENOBUFS;
 	}
@@ -19680,7 +19681,7 @@ void cfg80211_new_sta(struct net_device *dev, const u8 *mac_addr,
 		return;
 
 	if (nl80211_send_station(msg, NL80211_CMD_NEW_STATION, 0, 0, 0,
-				 rdev, dev, mac_addr, sinfo) < 0) {
+				 rdev, dev, mac_addr, sinfo, false) < 0) {
 		nlmsg_free(msg);
 		return;
 	}
@@ -19710,7 +19711,7 @@ void cfg80211_del_sta_sinfo(struct net_device *dev, const u8 *mac_addr,
 	}
 
 	if (nl80211_send_station(msg, NL80211_CMD_DEL_STATION, 0, 0, 0,
-				 rdev, dev, mac_addr, sinfo) < 0) {
+				 rdev, dev, mac_addr, sinfo, false) < 0) {
 		nlmsg_free(msg);
 		return;
 	}

base-commit: c5142df58d5a19a0615414037f256cd5ca39f7c5
-- 
2.17.1


