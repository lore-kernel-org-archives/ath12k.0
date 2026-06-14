Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15588CD98C7
	for <ath12k@archiver.kernel.org>; Sun, 14 Jun 2026 05:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiKLOiDVudlQGkTMkHnlpYL7j4GbMZyPsHezGFhbg+8=; b=SR4tTPV1KneMyezFrCuctz35KV
	ydwkLg4O8u7wo5dFDIK24aCgIOfdKuypDJjb3UPxcuw3IhU1upYxU5inwO+rkP/2kTQrZn89Mnu8Q
	lPMdj2SS32xnofhuGCSYZKEoHC7VV9dP9pXXgaa/anFSmTQyaCooyHEgsImJ27JtBGYKc7jCFLPAE
	TKBRXpJpXtOk6UxbtdB+8dOPQqfgpfF+12KQeTlbJciTBA8ZHuEUwADi6EECbTvh84vmVF6MI2WuM
	MBugdvAqJyVx9b8gEW4JK+nHPI2pIgG9V6ECUwY/nGmSBhloVCV1gawJP7jba0k4xoZN2Fgcvi46J
	zMqV8YKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEn-0000000CkYl-1IPh;
	Sun, 14 Jun 2026 05:18:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEl-0000000CkXv-0Qvk
	for ath12k@lists.infradead.org;
	Sun, 14 Jun 2026 05:18:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E5CUcF252141
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EiKLOiDVudl
	QGkTMkHnlpYL7j4GbMZyPsHezGFhbg+8=; b=kRBdEthxlh/q7uir2Vpqxhx3Jsq
	eFoBXsdL387n1KpUdc16+IjgUwXtEzWySQlhSSS9khGv1NnlpI1tMwdDysl9aLWU
	rrOw8C/TWtIl3WiORplV9wx5Ktahwh4UPpmmRuLQTtpr3TG2HQBo4gtfxjoOAxc1
	zyCvxnwmisEJWbeOh6GJQ4xdghtGGhuNvgqj9Mif72XX1lkVNVCkIpyc6NEK67J+
	aZZ1WJKvWVM31Eau8/ctaYx2tEi1BoVuhSzzudFevr9SgVEJsb1mHj1udFP6SXpe
	QqP05xrZbP+pVeScQWmw3j6VHtxRpCby9UbbP3QidahdUNAuFH/XLp8hZXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fatgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so39988755ad.3
        for <ath12k@lists.infradead.org>; Sat, 13 Jun 2026 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781414302; x=1782019102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiKLOiDVudlQGkTMkHnlpYL7j4GbMZyPsHezGFhbg+8=;
        b=AolsRKlccC9BJjKZc81KaCWA4sH9IWmufNg/hPJM2rQ3VjEvQykI3X/EHQSfc+/gs0
         DTpGOiLp4sLJO9kqjmOah21f0yos21uCt/pcqYEWPwc68Tg7mMRBYL/Iuo1yOQ/6qw19
         pCNcMFl7WrD3LmMco0adOOaVkNyjRFVV064Wyz5WZtwm243H/Wtu3ePMHkn/4hebAOI8
         eWpYR8toFLkV3f5XR6NutHg8GimZdCm56LT7l5Rw+4SRPG+xfb8U6The/Kv4fasH/hYW
         YrLn+rV4LJMsJ5nr806Dg2SCkMYMCmFE4Gi5VfHck7aqI7qLh8kba+oXSOLgNIHqzOH5
         jH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781414302; x=1782019102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EiKLOiDVudlQGkTMkHnlpYL7j4GbMZyPsHezGFhbg+8=;
        b=i+zxJo5M0GtbSrQYFlgcAx/K3/iqrFhWeNIKjFW+MJvwj29amA6zji1/7q16VCGLhF
         K+nWuKas1qEBqo8O2RvRW1K/hTe4u7CPY/PEs8G4p769MvBB47VoyRIhZZmWb+tyTZWq
         R7wiULX7HxYjMnWTnN/+TUwxjopOHT2xtJ+fSFSEgOJ92Cbtnx2mAiOkiWzx3zyxFO6Y
         mZhOxJm7YxpCp0gXnevipxe942kXCO2ZkxXw5NE6jJKG6+AxSdaLUA3SLd+uqc0tYDBq
         JqXeBsEWWKOBar46ON/VoS0BPoIox0dfGzWKT0Q4tC1LVaerpYkZKjLMqZyt+gnxeOeJ
         +ipg==
X-Forwarded-Encrypted: i=1; AFNElJ/kgnAOXL9S32TRfghgOclvpvv8yyDmVOnJyxgUtI3fweIpuTseCizGYhSRstimDpRDy53SavY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4O8AytgSz/Gymu6mcKls+zpyEKwYloOMnemsuAqlUQs0nfAe3
	ndECWFgAksEiGiDnsWFNy7SS/S3tUby5U/E3nthiO1ZkV364IzqYBRwI9NXRg3CV9o1uMOUzxbI
	Xs6cr9kEyqbVw/HJ6lbwmTqIpZsaVDzu7wxvgdQKA1kf6Mi1RrrIXZC0rB8svirtr
X-Gm-Gg: Acq92OG2DyVNfCe6PF5BQyyGKwyaU5McC60JLde3sr9rs333rIEFjK87tqFpk0An5JI
	moVzOLBmX4H5z2WIcaMkAz8XC0gHDbIHVTuGtiQXSEf8ZQ9kI0ZwYuGEdfT8CXET57Z1DmGqNvA
	5igtSnXcd2y5UXLMFJQ12fq7lUOBt1rKRpptb5y6ENRTksWvgJ8K+0dBuvecJwzx505KX/5JL0g
	A9y99TPF6dQWxq6Lhv49L/VmaHx4uIeTZaFdnsm00Pzjqt56im3lnLuhoyqHY5f7jzqwOa9vwF0
	nn+FUV0Mv/wxHHxfN7KunwsrD/aOQhPCBFpjWugf3pLm6f/9myNT7RYqUI8eB0wlzh4s4vNLPu2
	0zp4cFlQjw87NYvFtdz+6TwL527aTImcjJmkk3UlzdQVOwW//puzli45YNogIZMVvMMzVg5kz3u
	K2gAaNkTjMS+JOPD7mBQ3wUWelU8Q8O0BK5/nChGQ=
X-Received: by 2002:a17:903:46c6:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c41050a155mr109935365ad.7.1781414302031;
        Sat, 13 Jun 2026 22:18:22 -0700 (PDT)
X-Received: by 2002:a17:903:46c6:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c41050a155mr109935095ad.7.1781414301565;
        Sat, 13 Jun 2026 22:18:21 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c651dsm64456705ad.26.2026.06.13.22.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:18:21 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next v2 1/5] wifi: cfg80211: Drop unused link stats handling in nl80211_send_station()
Date: Sun, 14 Jun 2026 10:47:31 +0530
Message-ID: <20260614051739.3979947-2-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
References: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX/u/b9irhCnSJ
 o2lyu8W2MJRrMbjfbZT3+oi2YJqOuOI/z1pWUDSmUsht+7/q9zi3Rey2JiNtscwiZkFb5DXYfBk
 IRtehb/RcmIEj41SebPEF5w81gvrUYhZslDnDoDDNBJnKpZWm9abaj1nKBd7X4Seqz00YZFRW9T
 tMAykYG6DxBvxR1yxkJuusru3dz0/KKXZtx6nmDLtSNycL27rhnu+vUamqsOaChhVXda3czLjpF
 9M19BMPJqUsKH7R7HmPYjMy0uZmrnwj8kZXmH5/oslH5WnvPKFdAk/PFzOSC4AJ8dDwkwE6/LkC
 ECuS2jkigE6SiaxmpEu5NUxOt2ItaSr7hiz2CGg9ethllvoz5JS9KuM0gxi8bt8dHndHjNvFnF4
 WKUuVzsZcaGf3sMaw7aQNMOULww/3ycwJAJTvAWj43ka6WLPIvqB+cOwmb5pZAoX0mlg2NtmkGR
 4B/Y8tXb078a+el4h6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX7gzZEjA3Fo7k
 DuQeBNUzUeDMCrW54u5iU+w5L1BIB4KvegvAlVrTn/JRnxc69LUaZawttzjzr2INPq20K4UCA8i
 YTG2LYQ7gE+/yvHSvks0lckMalERBB4=
X-Proofpoint-GUID: HOfvRjTlzePC6C23cKXBxSGEljHUUVFK
X-Proofpoint-ORIG-GUID: HOfvRjTlzePC6C23cKXBxSGEljHUUVFK
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2e399e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=9HtPZ92rRTiFI9LOixoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_221823_146848_7F9EFF9E 
X-CRM114-Status: GOOD (  15.08  )
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

Remove the link level statistics handling from
nl80211_send_station() and drop the unused link_stats parameter
from its signature and callers. The removed code iterated over
each MLO link and attempted to send link specific station data
through NL80211_ATTR_MLO_LINKS, but this logic was never used
because link_stats was always false.

This logic was introduced during early work on link level station
statistics with the intention of reporting information for each
link. Due to message size concerns when a station has multiple
links, the feature was disabled behind the link_stats flag and
remained unused.

The link level reporting block in nl80211_send_station() is dead
code and cannot support larger messages, so remove it. This
cleanup also prepares for proper link level statistics reporting
in nl80211_dump_station() in a later patch, where fragmentation
allows safe transmission of multi link data.

Also fix label indentation: the nla_put_failure label had an
erroneous leading space.

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 50 +++++-------------------------------------
 1 file changed, 6 insertions(+), 44 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 53b4b3f76697..98548e69b5fc 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -8033,14 +8033,10 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 				u32 seq, int flags,
 				struct cfg80211_registered_device *rdev,
 				struct wireless_dev *wdev,
-				const u8 *mac_addr, struct station_info *sinfo,
-				bool link_stats)
+				const u8 *mac_addr, struct station_info *sinfo)
 {
 	void *hdr;
 	struct nlattr *sinfoattr, *bss_param;
-	struct link_station_info *link_sinfo;
-	struct nlattr *links, *link;
-	int link_id;
 
 	hdr = nl80211hdr_put(msg, portid, seq, flags, cmd);
 	if (!hdr) {
@@ -8258,45 +8254,11 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 			goto nla_put_failure;
 	}
 
-	if (link_stats && sinfo->valid_links) {
-		links = nla_nest_start(msg, NL80211_ATTR_MLO_LINKS);
-		if (!links)
-			goto nla_put_failure;
-
-		for_each_valid_link(sinfo, link_id) {
-			link_sinfo = sinfo->links[link_id];
-
-			if (WARN_ON_ONCE(!link_sinfo))
-				continue;
-
-			if (!is_valid_ether_addr(link_sinfo->addr))
-				continue;
-
-			link = nla_nest_start(msg, link_id + 1);
-			if (!link)
-				goto nla_put_failure;
-
-			if (nla_put_u8(msg, NL80211_ATTR_MLO_LINK_ID,
-				       link_id))
-				goto nla_put_failure;
-
-			if (nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN,
-				    link_sinfo->addr))
-				goto nla_put_failure;
-
-			if (nl80211_fill_link_station(msg, rdev, link_sinfo))
-				goto nla_put_failure;
-
-			nla_nest_end(msg, link);
-		}
-		nla_nest_end(msg, links);
-	}
-
 	cfg80211_sinfo_release_content(sinfo);
 	genlmsg_end(msg, hdr);
 	return 0;
 
- nla_put_failure:
+nla_put_failure:
 	cfg80211_sinfo_release_content(sinfo);
 	genlmsg_cancel(msg, hdr);
 	return -EMSGSIZE;
@@ -8549,7 +8511,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				NETLINK_CB(cb->skb).portid,
 				cb->nlh->nlmsg_seq, NLM_F_MULTI,
 				rdev, wdev, mac_addr,
-				&sinfo, false) < 0)
+				&sinfo) < 0)
 			goto out;
 
 		sta_idx++;
@@ -8613,7 +8575,7 @@ static int nl80211_get_station(struct sk_buff *skb, struct genl_info *info)
 
 	if (nl80211_send_station(msg, NL80211_CMD_NEW_STATION,
 				 info->snd_portid, info->snd_seq, 0,
-				 rdev, wdev, mac_addr, &sinfo, false) < 0) {
+				 rdev, wdev, mac_addr, &sinfo) < 0) {
 		nlmsg_free(msg);
 		return -ENOBUFS;
 	}
@@ -21635,7 +21597,7 @@ void cfg80211_new_sta(struct wireless_dev *wdev, const u8 *mac_addr,
 		return;
 
 	if (nl80211_send_station(msg, NL80211_CMD_NEW_STATION, 0, 0, 0,
-				 rdev, wdev, mac_addr, sinfo, false) < 0) {
+				 rdev, wdev, mac_addr, sinfo) < 0) {
 		nlmsg_free(msg);
 		return;
 	}
@@ -21665,7 +21627,7 @@ void cfg80211_del_sta_sinfo(struct wireless_dev *wdev, const u8 *mac_addr,
 	}
 
 	if (nl80211_send_station(msg, NL80211_CMD_DEL_STATION, 0, 0, 0,
-				 rdev, wdev, mac_addr, sinfo, false) < 0) {
+				 rdev, wdev, mac_addr, sinfo) < 0) {
 		nlmsg_free(msg);
 		return;
 	}
-- 
2.43.0


