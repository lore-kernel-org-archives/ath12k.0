Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2D8CD8CA6
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 17:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct1CqZkFlo4ls/P1k+jnl+NTfOBY2WJSj3L4dNVFpAk=; b=xtRSPifT5/8Vx4ECiu7OFLA8ls
	ubwTBUsGgfVMqmJNW66YY2RL1SzVkYvDqEH+ZquqmZ/7OgeLXZqn1669X5D5OWKwIftK1I2BB9VRe
	m1Hzv2YE4XpNn9he/BCYFigaWK6Hya7ksouCOlOZefERqr8RrGEN6o4D0qWDiL3+Aq/Kj9npXfcf3
	eMGEOYwWR2x00xKhsVnOw2Uhs9rN6yCJkn3kMI+1DdH4dkChzG75brIFGPKbNnAMrqLwveoNVsLFQ
	a+Tk7usCRbhF5Bd+2JREApIU4Tv93RpKAF/eGaZK00VonBrbTSElVZ6R8A9Srakkdiw0ByJi3lYBA
	kVo+eIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmp-00000002O6f-2nLy;
	Sun, 07 Jun 2026 17:59:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmm-00000002O4s-2Q1r
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 17:59:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ejsda441388
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 17:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ct1CqZkFlo4
	ls/P1k+jnl+NTfOBY2WJSj3L4dNVFpAk=; b=NcbTQ+SaOyihZ7EPEkYbUZfcAvN
	zCIYzyECqPQLREGBjhJNHdYHNg975fFIy5RInCNVq5Zv0wi2kLM8/fsNspUQmLkQ
	o+QHij+t2LJgCa1hTTvERyMrOjtzhuyk+KSbNBp95BWSXmMKdVA+6W3H5Ohq7TH0
	CSNh7IRFVfgiROCQO4xp2eJndXGF06nKpmLPwk5e+B5EvBiG4r1W/ECjZkJ4fo7Y
	TvL2+6qM/8Nh5pwna3tM2zNJRaUk+P+JZfIo5v8x2EB8mVgGPdTCuuT7/G9L/UIB
	+3vn+vk4/TPx8GdJPYnXMFUI5qOucPLgPMgNucfyQ22bJk/UJLu9r1Xf6QQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1catw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 17:59:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b7c55406bso2615223a91.2
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 10:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780855187; x=1781459987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct1CqZkFlo4ls/P1k+jnl+NTfOBY2WJSj3L4dNVFpAk=;
        b=jtRrEMs/iIF+u7L/TjtQDWAWMEjjZ8rN9rFbFzN9DkEMkOY/JgYdN+FaL9LL+xdurX
         OnnS+kOK/kEKYRahZIITKpjzA+24XBpEuUl8pHrGm7EHo/wONPaPdisrywRZl6T2Txcp
         S4L/dhy46mIdC1VSVYeSLXXACCQJV4vI7UsZmSftWJew/B63QtwZYrg8qr+z5QfLMHen
         K5giSAsqz5H9gg3D5EI8S3CS6Ny41YAR4UNXVVkf9knAS/pJzAxIX1PKLi9natE0p8Et
         gejF8cGI0+fiZxqzjiZyk8cyTzWLtvINVQYGGvxRZpb9reFvXnbIaQlogcpEeGhlQpEH
         S6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855187; x=1781459987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ct1CqZkFlo4ls/P1k+jnl+NTfOBY2WJSj3L4dNVFpAk=;
        b=PSD5Z9pHJjU4fW2zlAPmdDwlTuPV3zePunFYIsJkvaknZMSO5JS3aegsQTZLdJg8pW
         aaZJRDpPVj0+WOWTaK9npnBCD+JlAh5AaN+6RVBS7TG2hH08PTg6G4bt/nsq09YqjKQb
         cJndF+53s7iI1HPThnZGAsr3rmOdEde47UF1f3vwn58DiJP3H/1lHm7DaCUQE7SqrOH0
         eHkPQCZgwTnU2fseBP6nATgRFGzx3dZCWu7DVZG3Md3KeJ23tpjOOhuJBkzw5YTO4R94
         bFY40XnCFFB0Q2l6hLLYsRJe3tcFSsx7eehxCYSdAF0MbLg/vtazpwzMleWvczmcg4L4
         inZw==
X-Forwarded-Encrypted: i=1; AFNElJ/z9LiLJFN6z5do3Uy2sTLLsM8ylRdW3KETbBS/E1y/QkN1cflIn/M9Nyea6Y5RQvLbof8221c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYa2g17TuO1zrlaBciREedb3pTbnvVK8GDVcG2s3qWtJ8OaVT+
	6IceJp0NVJ7LfTxMPhLKJWIdqFpM4D4OWQRBHwsBALGY64jxz4HWRg6lpqHj7sBZEVaLutw8o+c
	WvEoeAguby2S1Q9iyYtxVT7QnINSGQaRku/t7T5WUlk++QnArYYcsG6dpinjGP8XbrCwV6DDm
X-Gm-Gg: Acq92OEpSq+gzD8nZFVW82ucbKu7zdNBY56CrHQ9b8zMDMM8cKGhcjCuHUb3r/lOgyH
	K9jCgarRDj+c6tS7OAZCU3O0+L3vNI9CSjS0GsbcjZ2FXVPYEMneytGu1TNHtbW4q5mZhUUuEj+
	+x04tk+YNPStBgJxsCYTuPQwvufjp917lHHJi0tmdNeosvVbg1587MsD/TJRayCXutS0LiSJGG2
	gpWbJsr18sLfqL9sC1xvxQRygEI4USvEpfU5chW0/kE0ZLnGloKo8Oa6a4nVSX8uz7WuRimMuNc
	2VEjOHrHBfZpEkd7yLjW2fguxCd6wuHoRtmJ/LfA4q9xmBMZiNJF5IFUGrw90v+vITrvpYcHVF/
	+tgeX5f65AnDol4wQZL+P178sMor1Akx6KONtx+w5g/7KV4j1UXHr7EkItPZSrSFL1V8F7mrxRo
	b2S6PCV7UYRIBGwkrv8Bl8B+2awRRhGvvR9g4SAzflAkvqXxwYjg==
X-Received: by 2002:a05:6300:67c7:b0:3a2:7ef4:81d9 with SMTP id adf61e73a8af0-3b4cd0a4451mr16314596637.44.1780855187295;
        Sun, 07 Jun 2026 10:59:47 -0700 (PDT)
X-Received: by 2002:a05:6300:67c7:b0:3a2:7ef4:81d9 with SMTP id adf61e73a8af0-3b4cd0a4451mr16314570637.44.1780855186780;
        Sun, 07 Jun 2026 10:59:46 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm13078522a12.18.2026.06.07.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:59:46 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next 1/5] wifi: cfg80211: Drop unused link stats handling in nl80211_send_station()
Date: Sun,  7 Jun 2026 23:29:08 +0530
Message-ID: <20260607175912.2266215-2-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4MCBTYWx0ZWRfX4VyViES2eJTc
 788VEV1m0PW4K+BchevhnVaZ8DUBhX56SFCby3oTEWgn23XymsbOP89QuJY77sjdpcO5daOtYpO
 8+8D/xowAr5wbZvlymzQtrG1qG3l1niRa95Vv4bFBlHN+6xzOI7GFzOlut+Ha08Sxr69tCLW/tA
 9dsYrRpR1YpbizhblR/jT0sgGi8rSx28LK9Pd3qg+sEfDbLVCww8VMDrVL208RRD1bqcuGPEVnO
 N31tGCmYbL9f2bgazLj4Nl4nMkXcd4IJan0sJA7eZhDFXo97rwKsKoNL9EXxA3seUKFlC8l/2Vz
 y4iXYlw70xx+FRVmuK3eNKLOou8wTp5LsAQY1zqy7mL+2ILg8WyYGfK80qpoRk3jdQbiHctfOju
 AsyRkjofYwu08y9nK1BICQVOF3fIrQvrxBCFf2ZnDbKoo5Z53cFbNXniYdEMSdO7B30cIDScpy3
 ezgWXC0EdzufYVgCm8g==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25b194 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WxumSkjBCS4GX7jbcoYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: aTlHGYVejX8bhZgksR2jLVrAJdhMKPaw
X-Proofpoint-GUID: aTlHGYVejX8bhZgksR2jLVrAJdhMKPaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_105948_636950_5177FC2A 
X-CRM114-Status: GOOD (  14.84  )
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

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 227 +----------------------------------------
 1 file changed, 5 insertions(+), 222 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 85057bd4d565..33609a065423 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7841,197 +7841,14 @@ static bool nl80211_put_signal(struct sk_buff *msg, u8 mask, s8 *signal,
 	return true;
 }
 
-static int nl80211_fill_link_station(struct sk_buff *msg,
-				     struct cfg80211_registered_device *rdev,
-				     struct link_station_info *link_sinfo)
-{
-	struct nlattr *bss_param, *link_sinfoattr;
-
-#define PUT_LINK_SINFO(attr, memb, type) do {				\
-	BUILD_BUG_ON(sizeof(type) == sizeof(u64));			\
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_ ## attr) &&	\
-	    nla_put_ ## type(msg, NL80211_STA_INFO_ ## attr,		\
-			     link_sinfo->memb))				\
-		goto nla_put_failure;					\
-	} while (0)
-#define PUT_LINK_SINFO_U64(attr, memb) do {				\
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_ ## attr) &&	\
-	    nla_put_u64_64bit(msg, NL80211_STA_INFO_ ## attr,		\
-			      link_sinfo->memb, NL80211_STA_INFO_PAD))	\
-		goto nla_put_failure;					\
-	} while (0)
-
-	link_sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
-	if (!link_sinfoattr)
-		goto nla_put_failure;
-
-	PUT_LINK_SINFO(INACTIVE_TIME, inactive_time, u32);
-
-	if (link_sinfo->filled & (BIT_ULL(NL80211_STA_INFO_RX_BYTES) |
-			     BIT_ULL(NL80211_STA_INFO_RX_BYTES64)) &&
-	    nla_put_u32(msg, NL80211_STA_INFO_RX_BYTES,
-			(u32)link_sinfo->rx_bytes))
-		goto nla_put_failure;
-
-	if (link_sinfo->filled & (BIT_ULL(NL80211_STA_INFO_TX_BYTES) |
-			     BIT_ULL(NL80211_STA_INFO_TX_BYTES64)) &&
-	    nla_put_u32(msg, NL80211_STA_INFO_TX_BYTES,
-			(u32)link_sinfo->tx_bytes))
-		goto nla_put_failure;
-
-	PUT_LINK_SINFO_U64(RX_BYTES64, rx_bytes);
-	PUT_LINK_SINFO_U64(TX_BYTES64, tx_bytes);
-	PUT_LINK_SINFO_U64(RX_DURATION, rx_duration);
-	PUT_LINK_SINFO_U64(TX_DURATION, tx_duration);
-
-	if (wiphy_ext_feature_isset(&rdev->wiphy,
-				    NL80211_EXT_FEATURE_AIRTIME_FAIRNESS))
-		PUT_LINK_SINFO(AIRTIME_WEIGHT, airtime_weight, u16);
-
-	switch (rdev->wiphy.signal_type) {
-	case CFG80211_SIGNAL_TYPE_MBM:
-		PUT_LINK_SINFO(SIGNAL, signal, u8);
-		PUT_LINK_SINFO(SIGNAL_AVG, signal_avg, u8);
-		break;
-	default:
-		break;
-	}
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) {
-		if (!nl80211_put_signal(msg, link_sinfo->chains,
-					link_sinfo->chain_signal,
-					NL80211_STA_INFO_CHAIN_SIGNAL))
-			goto nla_put_failure;
-	}
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL_AVG)) {
-		if (!nl80211_put_signal(msg, link_sinfo->chains,
-					link_sinfo->chain_signal_avg,
-					NL80211_STA_INFO_CHAIN_SIGNAL_AVG))
-			goto nla_put_failure;
-	}
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_TX_BITRATE)) {
-		if (!nl80211_put_sta_rate(msg, &link_sinfo->txrate,
-					  NL80211_STA_INFO_TX_BITRATE))
-			goto nla_put_failure;
-	}
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_RX_BITRATE)) {
-		if (!nl80211_put_sta_rate(msg, &link_sinfo->rxrate,
-					  NL80211_STA_INFO_RX_BITRATE))
-			goto nla_put_failure;
-	}
-
-	PUT_LINK_SINFO(RX_PACKETS, rx_packets, u32);
-	PUT_LINK_SINFO(TX_PACKETS, tx_packets, u32);
-	PUT_LINK_SINFO(TX_RETRIES, tx_retries, u32);
-	PUT_LINK_SINFO(TX_FAILED, tx_failed, u32);
-	PUT_LINK_SINFO(EXPECTED_THROUGHPUT, expected_throughput, u32);
-	PUT_LINK_SINFO(BEACON_LOSS, beacon_loss_count, u32);
-
-	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_BSS_PARAM)) {
-		bss_param = nla_nest_start_noflag(msg,
-						  NL80211_STA_INFO_BSS_PARAM);
-		if (!bss_param)
-			goto nla_put_failure;
-
-		if (((link_sinfo->bss_param.flags &
-		      BSS_PARAM_FLAGS_CTS_PROT) &&
-		     nla_put_flag(msg, NL80211_STA_BSS_PARAM_CTS_PROT)) ||
-		    ((link_sinfo->bss_param.flags &
-		      BSS_PARAM_FLAGS_SHORT_PREAMBLE) &&
-		     nla_put_flag(msg,
-				  NL80211_STA_BSS_PARAM_SHORT_PREAMBLE)) ||
-		    ((link_sinfo->bss_param.flags &
-		      BSS_PARAM_FLAGS_SHORT_SLOT_TIME) &&
-		     nla_put_flag(msg,
-				  NL80211_STA_BSS_PARAM_SHORT_SLOT_TIME)) ||
-		    nla_put_u8(msg, NL80211_STA_BSS_PARAM_DTIM_PERIOD,
-			       link_sinfo->bss_param.dtim_period) ||
-		    nla_put_u16(msg, NL80211_STA_BSS_PARAM_BEACON_INTERVAL,
-				link_sinfo->bss_param.beacon_interval))
-			goto nla_put_failure;
-
-		nla_nest_end(msg, bss_param);
-	}
-
-	PUT_LINK_SINFO_U64(RX_DROP_MISC, rx_dropped_misc);
-	PUT_LINK_SINFO_U64(BEACON_RX, rx_beacon);
-	PUT_LINK_SINFO(BEACON_SIGNAL_AVG, rx_beacon_signal_avg, u8);
-	PUT_LINK_SINFO(RX_MPDUS, rx_mpdu_count, u32);
-	PUT_LINK_SINFO(FCS_ERROR_COUNT, fcs_err_count, u32);
-	if (wiphy_ext_feature_isset(&rdev->wiphy,
-				    NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT)) {
-		PUT_LINK_SINFO(ACK_SIGNAL, ack_signal, u8);
-		PUT_LINK_SINFO(ACK_SIGNAL_AVG, avg_ack_signal, s8);
-	}
-
-#undef PUT_LINK_SINFO
-#undef PUT_LINK_SINFO_U64
-
-	if (link_sinfo->pertid) {
-		struct nlattr *tidsattr;
-		int tid;
-
-		tidsattr = nla_nest_start_noflag(msg,
-						 NL80211_STA_INFO_TID_STATS);
-		if (!tidsattr)
-			goto nla_put_failure;
-
-		for (tid = 0; tid < IEEE80211_NUM_TIDS + 1; tid++) {
-			struct cfg80211_tid_stats *tidstats;
-			struct nlattr *tidattr;
-
-			tidstats = &link_sinfo->pertid[tid];
-
-			if (!tidstats->filled)
-				continue;
-
-			tidattr = nla_nest_start_noflag(msg, tid + 1);
-			if (!tidattr)
-				goto nla_put_failure;
-
-#define PUT_TIDVAL_U64(attr, memb) do {					\
-	if (tidstats->filled & BIT(NL80211_TID_STATS_ ## attr) &&	\
-	    nla_put_u64_64bit(msg, NL80211_TID_STATS_ ## attr,		\
-			      tidstats->memb, NL80211_TID_STATS_PAD))	\
-		goto nla_put_failure;					\
-	} while (0)
-
-			PUT_TIDVAL_U64(RX_MSDU, rx_msdu);
-			PUT_TIDVAL_U64(TX_MSDU, tx_msdu);
-			PUT_TIDVAL_U64(TX_MSDU_RETRIES, tx_msdu_retries);
-			PUT_TIDVAL_U64(TX_MSDU_FAILED, tx_msdu_failed);
-
-#undef PUT_TIDVAL_U64
-			if ((tidstats->filled &
-			     BIT(NL80211_TID_STATS_TXQ_STATS)) &&
-			    !nl80211_put_txq_stats(msg, &tidstats->txq_stats,
-						   NL80211_TID_STATS_TXQ_STATS))
-				goto nla_put_failure;
-
-			nla_nest_end(msg, tidattr);
-		}
-
-		nla_nest_end(msg, tidsattr);
-	}
-
-	nla_nest_end(msg, link_sinfoattr);
-	return 0;
-
-nla_put_failure:
-	return -EMSGSIZE;
-}
-
 static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
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
@@ -8249,40 +8066,6 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
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
@@ -8540,7 +8323,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				NETLINK_CB(cb->skb).portid,
 				cb->nlh->nlmsg_seq, NLM_F_MULTI,
 				rdev, wdev, mac_addr,
-				&sinfo, false) < 0)
+				&sinfo) < 0)
 			goto out;
 
 		sta_idx++;
@@ -8604,7 +8387,7 @@ static int nl80211_get_station(struct sk_buff *skb, struct genl_info *info)
 
 	if (nl80211_send_station(msg, NL80211_CMD_NEW_STATION,
 				 info->snd_portid, info->snd_seq, 0,
-				 rdev, wdev, mac_addr, &sinfo, false) < 0) {
+				 rdev, wdev, mac_addr, &sinfo) < 0) {
 		nlmsg_free(msg);
 		return -ENOBUFS;
 	}
@@ -21626,7 +21409,7 @@ void cfg80211_new_sta(struct wireless_dev *wdev, const u8 *mac_addr,
 		return;
 
 	if (nl80211_send_station(msg, NL80211_CMD_NEW_STATION, 0, 0, 0,
-				 rdev, wdev, mac_addr, sinfo, false) < 0) {
+				 rdev, wdev, mac_addr, sinfo) < 0) {
 		nlmsg_free(msg);
 		return;
 	}
@@ -21656,7 +21439,7 @@ void cfg80211_del_sta_sinfo(struct wireless_dev *wdev, const u8 *mac_addr,
 	}
 
 	if (nl80211_send_station(msg, NL80211_CMD_DEL_STATION, 0, 0, 0,
-				 rdev, wdev, mac_addr, sinfo, false) < 0) {
+				 rdev, wdev, mac_addr, sinfo) < 0) {
 		nlmsg_free(msg);
 		return;
 	}
-- 
2.43.0


