Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD81CCD8CA8
	for <ath12k@archiver.kernel.org>; Sun, 14 Jun 2026 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCooeqOaEv4I7HLFPq20wnPAfqQPMybGkbd4nqm+hXw=; b=yiRxTKDWxjO1EpHuxaT1Rb0eH7
	dAJ6R+kHD0M1rcxk6CFKfOgiprCF1q6HhxJxcXa4yh3a1b3bYCwQuf8gL//zUyY+Sdmdx1dt0qMcz
	VSdbvVOCVxpyk37uiZoQeiQA0r+WviRodE3IlJqDfsDXg9sjqWCVpzsdWNmCitBVTrgbA8n4tGLcM
	g3immOcbF+31zpayPSb0psMKDvKMTNIVGWjtcvwmqSo+yeftJgYUhxtDcjrl3jlfM3RAnh8uXo5Vi
	Wnx/Ck5/2zNOSyKdQpUjAuboGxcTNnaMV5v9XM6lkf83W70RCq/n045KlSfxN2J7MqIopcfh2AJUc
	doeALK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEz-0000000Ckct-2n0B;
	Sun, 14 Jun 2026 05:18:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEw-0000000Ckbm-3Lbc
	for ath12k@lists.infradead.org;
	Sun, 14 Jun 2026 05:18:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E4nr3r678953
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rCooeqOaEv4
	I7HLFPq20wnPAfqQPMybGkbd4nqm+hXw=; b=dsDCfBSvIfamYKCquFjmxm0Ke/b
	xYrxLLQVhUbzIyehQKHTSWXmOeZzjFrs6lSqAP3CHnL+ZRmgsuWS1pGXw+yFm9Ck
	shzt9wR5sX8IFRuXy39XUSIgEHC7x3xO5hqS2OlU3oaHh6iAe+HUpXCkvaMGMQnK
	gMqFD9/MHEGpnjMzLRyPedpfeFqIaumDR3P4D+gIxMp3pWNGCMR0ErAzuVfeJdxB
	5AwVHbR9FxO8eiDsVrfQZq3p87abHIiSBp1wazqTYeT17JVoGAxpY7MYLOa+X9pb
	dlvdBOO8kZF3SxB65pxYTRjCh2NWL9nwfko+BMeOec54O5ofBpMgLE+FRZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u2sju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c858e0cbca3so1126675a12.2
        for <ath12k@lists.infradead.org>; Sat, 13 Jun 2026 22:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781414312; x=1782019112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCooeqOaEv4I7HLFPq20wnPAfqQPMybGkbd4nqm+hXw=;
        b=DOXMnFGn1A9M4KeepQYf3vgHiIPN9HKSVRO/4t2Cnh42GD3cIl4c5YdhlL7Ayngkv+
         YeZa50Rh00Z5JPLaYUdzZpDGn7U/Je/LkpkrYM7uCI/MYNQsnPXr/6pNDe6N9ItZe2Vw
         nDJ9ZMqFQvI6bgsaNbAxZn/tEW5iybKdXHmBrlN9R8s34B9M1dqtenhTlptHhde/DM13
         Sx/iJyXf6icj65Hnqw93zcI4DP8MiVM7LSHTRG3ThYxuHY0RV/9Ps0x0U8FiRrkR/hCK
         /+MNPdrd5GFl7hNp1AnKOaa1LuF5+PDD6wTb8phlbgdCVlhlpxoVsYPPO9RgtJi0X0Cf
         mZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781414312; x=1782019112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCooeqOaEv4I7HLFPq20wnPAfqQPMybGkbd4nqm+hXw=;
        b=FBpIGj8Pv2P1idqPcgjpJXu1PQDG6EiqWfqsWLPmr8ZyOXrtLu68o0DyDOYveywT+b
         SqMgV0A9VicOkgM24t0OMNrUzx+5MVFHL8P9jLfbjT74QYJih+56vMJoH2Wa+pwo3MLk
         w7UUkiBdhiM/if3dHPnw6tfAY3wWIzDJD2t4fGtIHRSdGaJYOmunTm8+d/cwC+V0P/gM
         KxE9GEgXTY6V/oY4yAxedlR822s8D0uGQf5wPjvgV308QeKI9chItfcUnGaenFqWLWq7
         JujgrwuaJQTm9+O1gmZNLoNi48jK3GGO3HmO3T7kB+ajivpbWsuniuhtJMYqrIbDClbb
         CzOA==
X-Forwarded-Encrypted: i=1; AFNElJ8XIzxxCmpNm/7qK6tLkmj5sCR/fBp2KoHrnQuPmGlBz1yB9NkTBtmIPMTe3XAcwRCZ4RRadzk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXbP4WuDJQUs9fLTO7Qh+as7GUKv4flEJiqqh+8tamiA2UJ8Ns
	wI4mCL8S3FEGwjZBvtw1E6SnGeWkuAqDw5Zsp9I6CyEUyeKRAdygVGwYI24UYoOXvGHUDEZxISC
	eBwUHh7SqLogMQFUEpjJ6V2TIQEDaKvE0jqx+WuWgOrsFXrCi41i0z/D+H0PBl26k
X-Gm-Gg: Acq92OFqPr0eAfTBypTKTN1ycWf6zD1JfTMZ3YE1Y/E7zmgrIAyXvgYnt5L5RneOOhC
	PihqrVezqh8yslHAqm9CAvSpt8qQDjFr3ltNeH8oMbWFGkxN9kwxUf+IzVjN2kjkG0nunMEGX1T
	QZvmToXx9dvb0iRNR3bWF1DfSI0cIgl7a3IeaKs2IKOEx4r9frPQ2r+iQtBHo0o0WWgVNewMyME
	CMEPYcnFEdkMzPVG+uFTGAchW4hIkI34vkTY0bWuZD0XKHjipZT7MH9VRBVK2XCrf4bZua8oYDL
	qE6GhAy1Wjqi8clvLpD9Ac9DoJ2lyBp2ct5HjpXjgXAadFc4oGB4dz0w3EtHHsGpVHoyqUXCNeg
	pd3aR6pjmDmzhbzH8ZWbda2kB4WjKUOh8ml66mFOUFE7luwly111baqBnjMVUBU3jEBSuV39jhu
	l+Z8BsSq6xEj+q5Iqpci1XEzKr2J5GISi5WNSM600=
X-Received: by 2002:a17:903:b4e:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c6641efbc2mr64784615ad.12.1781414312431;
        Sat, 13 Jun 2026 22:18:32 -0700 (PDT)
X-Received: by 2002:a17:903:b4e:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c6641efbc2mr64784445ad.12.1781414311939;
        Sat, 13 Jun 2026 22:18:31 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c651dsm64456705ad.26.2026.06.13.22.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:18:31 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next v2 4/5] wifi: cfg80211: Fragment per-link station stats in nl80211_dump_station()
Date: Sun, 14 Jun 2026 10:47:34 +0530
Message-ID: <20260614051739.3979947-5-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
References: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2e39a9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=p9g4ZCCWhs38yyyI6XkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: cBNb3qE7MdZaUn9QI0VP7Zem8ebi6tds
X-Proofpoint-ORIG-GUID: cBNb3qE7MdZaUn9QI0VP7Zem8ebi6tds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX2/1ype/Fmb7R
 D/o/jCqD1N2Sy6ZS224drK0HpN+cHMx6z/MEIoN926PWXP5BBJoer3A/pI05ZZNv5hU9X5JIbD3
 ulB+RjMODLgQKcPkExuJewukFQR8S8AZOA4aExAz3R09OQ/TCd/6mHxjliuDtXEboAnWSjSvCqg
 dEWxm0red1gjmAgzzH3mm//JSC9XRwG9ZPODO6bEuqjwOxagrr/9nkiuORgUsaAiNcb0mbOoJyd
 0FlDlAc51iS9gtuSdYpPmfslo8MqG1mrfFNZpPT0ccSftVqj7H0asgN2HCJ/c71qd+odHOIPBHV
 To5pDdnBmSY0u5YlpFEGlSadkjSDFBxo36q69AGGn87AoVmvwtiqos1dSAR6CmC4Yu1c1LWitiQ
 nasLpSU5nyi2yvWx/XvkCMHvJcQNp2hvBpiCnz5gz1vQRgMT2OMw8yry1C7m/uhgGEQNhlISLYl
 YwTT0tcj5UPChLqVw0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX0FMKhqEhtW7y
 u6WOSWKwoPrTU04/l2spB3FfxBAcGO6DNoS2HvD+JiAGUV/9uiTRKTGD44xL5dX9axCNkR5HKxI
 uSFUU8N1WL7GGxgnwXrTdQuujYnzHJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_221834_956164_5BF87CC8 
X-CRM114-Status: GOOD (  25.00  )
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

In MLO scenarios, stations may have multiple links, each with distinct
statistics. When userspace tools like iw or hostapd request station dumps,
attempting to pack all per-link stats into a single netlink message can
easily exceed the default 4KB buffer limit, especially when more than two
links are active. This results in -EMSGSIZE errors and incomplete data
delivery.

To address this, fragment per-link station statistics across multiple
netlink messages to ensure reliable delivery of complete MLO station
information. Extend the stateful context with a two-phase dump mechanism:
phase 0 (AGGREGATED) sends combined MLO-level statistics and phase 1
(PER_LINK) sends individual per-link statistics for each active link.

The dump loop is structured to produce exactly one netlink message per
iteration, with a common header (ifindex, wdev, mac, generation) built
once and phase-specific payload added via a switch statement. This keeps
header construction in one place and makes the EMSGSIZE bail-out uniform.

Add a new request flag attribute, NL80211_ATTR_STA_DUMP_LINK_STATS
(NLA_FLAG), for NL80211_CMD_GET_STATION dump. Userspace can set this
flag to request per-link station statistics for MLO stations.

Extract this flag during the first dump invocation by passing an attrbuf
to nl80211_prepare_wdev_dump(); use __free(kfree) to avoid scattered
manual kfree() calls. Cache the boolean in the dump context to avoid
repeated parsing on subsequent invocations.

Per-link messages carry a single NL80211_ATTR_MLO_LINKS nest with the
link ID, link-specific MAC, and per-link NL80211_ATTR_STA_INFO payload.
The link-specific validity (is_valid_ether_addr) and null pointer guard
are checked in nl80211_put_link_station_payload() before any message
construction begins.

Also fix all nla_nest_start_noflag() calls in nl80211_fill_link_station()
for nested attribute types (STA_INFO, BSS_PARAM, TID_STATS, per-tid) to
use nla_nest_start() so the NLA_F_NESTED flag is set correctly.

Propagate the actual return value from nl80211_put_sta_info_common() in
the AGGREGATED phase rather than returning skb->len. Returning skb->len
signals netlink to re-invoke the dump with the same sta_idx, causing an
infinite loop when the aggregated payload is too large to fit; returning
the real error code (-EMSGSIZE or otherwise) terminates the dump cleanly.

Backward compatibility is seamlessly preserved for non-MLO stations.

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h |  19 ++++
 net/wireless/nl80211.c       | 170 ++++++++++++++++++++++++++++-------
 2 files changed, 157 insertions(+), 32 deletions(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 9998f6c0a665..1a501effd635 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3165,6 +3165,23 @@ enum nl80211_commands {
  * @NL80211_ATTR_NPCA_PRIMARY_FREQ: NPCA primary channel (u32)
  * @NL80211_ATTR_NPCA_PUNCT_BITMAP: NPCA puncturing bitmap (u32)
  *
+ * @NL80211_ATTR_STA_DUMP_LINK_STATS: Request flag for %NL80211_CMD_GET_STATION
+ *	(dump mode only). When set on an MLD station, the dump produces two
+ *	%NL80211_CMD_NEW_STATION messages per station per dump call:
+ *
+ *	1. An aggregated-stats message whose top-level %NL80211_ATTR_STA_INFO
+ *	   contains MLO-combined statistics (same content as a dump without
+ *	   this flag).
+ *
+ *	2. For each active link, a per-link message containing
+ *	   %NL80211_ATTR_MLO_LINKS with a single link entry. Each entry holds
+ *	   %NL80211_ATTR_MLO_LINK_ID, the link-specific %NL80211_ATTR_MAC,
+ *	   and %NL80211_ATTR_STA_INFO with per-link statistics (see
+ *	   &enum nl80211_sta_info).
+ *
+ *	The aggregated message always precedes the per-link messages for the
+ *	same station within a dump sequence.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3763,6 +3780,8 @@ enum nl80211_attrs {
 	NL80211_ATTR_NPCA_PRIMARY_FREQ,
 	NL80211_ATTR_NPCA_PUNCT_BITMAP,
 
+	NL80211_ATTR_STA_DUMP_LINK_STATS,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index b4c4406d77bf..6910dfa7343e 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1093,6 +1093,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_NPCA_PRIMARY_FREQ] = { .type = NLA_U32 },
 	[NL80211_ATTR_NPCA_PUNCT_BITMAP] =
 		NLA_POLICY_FULL_RANGE(NLA_U32, &nl80211_punct_bitmap_range),
+	[NL80211_ATTR_STA_DUMP_LINK_STATS] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -7870,7 +7871,7 @@ static int nl80211_fill_link_station(struct sk_buff *msg,
 		goto nla_put_failure;					\
 	} while (0)
 
-	link_sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
+	link_sinfoattr = nla_nest_start(msg, NL80211_ATTR_STA_INFO);
 	if (!link_sinfoattr)
 		goto nla_put_failure;
 
@@ -7936,8 +7937,8 @@ static int nl80211_fill_link_station(struct sk_buff *msg,
 	PUT_LINK_SINFO(BEACON_LOSS, beacon_loss_count, u32);
 
 	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_BSS_PARAM)) {
-		bss_param = nla_nest_start_noflag(msg,
-						  NL80211_STA_INFO_BSS_PARAM);
+		bss_param = nla_nest_start(msg,
+					   NL80211_STA_INFO_BSS_PARAM);
 		if (!bss_param)
 			goto nla_put_failure;
 
@@ -7979,8 +7980,7 @@ static int nl80211_fill_link_station(struct sk_buff *msg,
 		struct nlattr *tidsattr;
 		int tid;
 
-		tidsattr = nla_nest_start_noflag(msg,
-						 NL80211_STA_INFO_TID_STATS);
+		tidsattr = nla_nest_start(msg, NL80211_STA_INFO_TID_STATS);
 		if (!tidsattr)
 			goto nla_put_failure;
 
@@ -7993,7 +7993,7 @@ static int nl80211_fill_link_station(struct sk_buff *msg,
 			if (!tidstats->filled)
 				continue;
 
-			tidattr = nla_nest_start_noflag(msg, tid + 1);
+			tidattr = nla_nest_start(msg, tid + 1);
 			if (!tidattr)
 				goto nla_put_failure;
 
@@ -8464,21 +8464,74 @@ static void cfg80211_sta_set_mld_sinfo(struct station_info *sinfo)
 	sinfo->filled &= ~BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL_AVG);
 }
 
+enum nl80211_dump_station_phase {
+	NL80211_DUMP_STA_PHASE_AGGREGATED = 0,
+	NL80211_DUMP_STA_PHASE_PER_LINK   = 1,
+};
+
 struct nl80211_dump_station_ctx {
 	int sta_idx;
+	int link_idx;
+	enum nl80211_dump_station_phase phase;
+	bool dump_link_stats;
 	u8 mac_addr[ETH_ALEN];
 	struct station_info sinfo;
 };
 
+static int nl80211_put_link_station_payload(struct sk_buff *msg,
+					    struct cfg80211_registered_device *rdev,
+					    struct station_info *sinfo,
+					    int link_idx)
+{
+	struct link_station_info *link_sinfo = sinfo->links[link_idx];
+	struct nlattr *links, *link;
+
+	if (WARN_ON_ONCE(!link_sinfo))
+		return -ENOENT;
+
+	if (!is_valid_ether_addr(link_sinfo->addr))
+		return -EADDRNOTAVAIL;
+
+	links = nla_nest_start(msg, NL80211_ATTR_MLO_LINKS);
+	if (!links)
+		return -EMSGSIZE;
+
+	link = nla_nest_start(msg, link_idx + 1);
+	if (!link)
+		goto nla_put_failure;
+
+	if (nla_put_u8(msg, NL80211_ATTR_MLO_LINK_ID, link_idx) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, link_sinfo->addr))
+		goto nla_put_failure;
+
+	if (nl80211_fill_link_station(msg, rdev, link_sinfo))
+		goto nla_put_failure;
+
+	nla_nest_end(msg, link);
+	nla_nest_end(msg, links);
+	return 0;
+
+nla_put_failure:
+	nla_nest_cancel(msg, links);
+	return -EMSGSIZE;
+}
+
 static int nl80211_dump_station(struct sk_buff *skb,
 				struct netlink_callback *cb)
 {
 	struct cfg80211_registered_device *rdev;
 	struct wireless_dev *wdev;
 	struct nl80211_dump_station_ctx *ctx = (void *)cb->args[2];
+	struct nlattr **attrbuf __free(kfree) = NULL;
 	int err;
 
-	err = nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
+	if (!ctx) {
+		attrbuf = kzalloc_objs(*attrbuf, NUM_NL80211_ATTR);
+		if (!attrbuf)
+			return -ENOMEM;
+	}
+
+	err = nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf);
 	if (err)
 		return err;
 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
@@ -8490,6 +8543,9 @@ static int nl80211_dump_station(struct sk_buff *skb,
 			err = -ENOMEM;
 			goto out_err;
 		}
+		ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
+		ctx->dump_link_stats =
+			!!attrbuf[NL80211_ATTR_STA_DUMP_LINK_STATS];
 		cb->args[2] = (long)ctx;
 	}
 
@@ -8505,34 +8561,53 @@ static int nl80211_dump_station(struct sk_buff *skb,
 
 	while (true) {
 		void *hdr;
+		int ret;
 
-		memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
-		for (int i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
-			ctx->sinfo.links[i] =
-				kzalloc_obj(*ctx->sinfo.links[0]);
-			if (!ctx->sinfo.links[i]) {
-				err = -ENOMEM;
+		/* AGGREGATED phase: fetch sinfo from driver once per station */
+		if (ctx->phase == NL80211_DUMP_STA_PHASE_AGGREGATED) {
+			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
+			for (int i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
+				ctx->sinfo.links[i] =
+					kzalloc_obj(*ctx->sinfo.links[0]);
+				if (!ctx->sinfo.links[i]) {
+					err = -ENOMEM;
+					goto out_err_release;
+				}
+			}
+
+			err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
+						ctx->mac_addr, &ctx->sinfo);
+			if (err == -ENOENT) {
+				err = skb->len;
 				goto out_err_release;
 			}
-		}
+			if (err)
+				goto out_err_release;
 
-		err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
-					ctx->mac_addr, &ctx->sinfo);
-		if (err == -ENOENT) {
-			err = skb->len;
-			goto out_err_release;
+			if (ctx->sinfo.valid_links)
+				cfg80211_sta_set_mld_sinfo(&ctx->sinfo);
+		} else {
+			/* PER_LINK phase: advance to next valid link */
+			while (ctx->link_idx < IEEE80211_MLD_MAX_NUM_LINKS &&
+			       !(ctx->sinfo.valid_links & BIT(ctx->link_idx)))
+				ctx->link_idx++;
+
+			if (ctx->link_idx >= IEEE80211_MLD_MAX_NUM_LINKS) {
+				cfg80211_sinfo_release_content(&ctx->sinfo);
+				ctx->sta_idx++;
+				ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
+				continue;
+			}
 		}
-		if (err)
-			goto out_err_release;
-
-		if (ctx->sinfo.valid_links)
-			cfg80211_sta_set_mld_sinfo(&ctx->sinfo);
 
+		/* Build common header for both phases */
 		hdr = nl80211hdr_put(skb, NETLINK_CB(cb->skb).portid,
 				     cb->nlh->nlmsg_seq, NLM_F_MULTI,
 				     NL80211_CMD_NEW_STATION);
 		if (!hdr) {
 			err = skb->len;
+			if (ctx->phase == NL80211_DUMP_STA_PHASE_PER_LINK)
+				goto out_err;
 			goto out_err_release;
 		}
 
@@ -8546,18 +8621,49 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				ctx->sinfo.generation)) {
 			genlmsg_cancel(skb, hdr);
 			err = skb->len;
+			if (ctx->phase == NL80211_DUMP_STA_PHASE_PER_LINK)
+				goto out_err;
 			goto out_err_release;
 		}
 
-		if (nl80211_put_sta_info_common(skb, rdev, &ctx->sinfo)) {
-			genlmsg_cancel(skb, hdr);
-			err = skb->len;
-			goto out_err_release;
-		}
+		switch (ctx->phase) {
+		case NL80211_DUMP_STA_PHASE_AGGREGATED:
+			ret = nl80211_put_sta_info_common(skb, rdev, &ctx->sinfo);
+			if (ret) {
+				genlmsg_cancel(skb, hdr);
+				err = ret;
+				goto out_err_release;
+			}
+			genlmsg_end(skb, hdr);
+
+			if (ctx->dump_link_stats && ctx->sinfo.valid_links) {
+				ctx->phase = NL80211_DUMP_STA_PHASE_PER_LINK;
+				ctx->link_idx = 0;
+			} else {
+				cfg80211_sinfo_release_content(&ctx->sinfo);
+				ctx->sta_idx++;
+			}
+			break;
 
-		genlmsg_end(skb, hdr);
-		cfg80211_sinfo_release_content(&ctx->sinfo);
-		ctx->sta_idx++;
+		case NL80211_DUMP_STA_PHASE_PER_LINK:
+			ret = nl80211_put_link_station_payload(skb, rdev,
+							       &ctx->sinfo,
+							       ctx->link_idx);
+			if (ret == -EMSGSIZE) {
+				genlmsg_cancel(skb, hdr);
+				err = skb->len;
+				goto out_err;
+			}
+			if (ret) {
+				/* skip invalid link, do not abort the dump */
+				genlmsg_cancel(skb, hdr);
+				ctx->link_idx++;
+				continue;
+			}
+			genlmsg_end(skb, hdr);
+			ctx->link_idx++;
+			break;
+		}
 	}
 
 out_err_release:
-- 
2.43.0


