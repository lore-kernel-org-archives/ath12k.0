Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E6C5AD49
	for <ath12k@archiver.kernel.org>; Mon,  9 Jun 2025 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vU3slacD63FXPGwNfK+QHmRo5Ka90SdOVDtxxih8Exk=; b=PgD0C0DMwihjWIqiK4nY/47Owg
	Kyetdvy0sZ/X9xwy27yL48yXt827mfxveJl5J1SKpi2vUgQrPoCnbwa1PAcG2K1fGoz9pSHcPtRYM
	EwNsLNW2AQfDAmL02sY9dk5PQ9ZbtuJhXNc/wx+hta/iDREPkrpKVA08vLxk3sl9yAs/ySMuthfOt
	dbDexf+X63T9cSE9ZkdaC8R7hwOWvbbRhbvUYQ40BfnW/tYJd8ftWGpgrLbR9icfuBF5iyduQiuul
	RWhC+Hoip8J83s5SyAgsYplQJJHo2uXJRViMBHIwpSy1DSEkZezftBNeUgWpbr47sQypamjdSTmKD
	fkgP6v2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQFl-00000003BFY-31Z1;
	Mon, 09 Jun 2025 00:20:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ6M-00000003Amh-3LcI
	for ath12k@lists.infradead.org;
	Mon, 09 Jun 2025 00:10:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Mq1ZQ017884
	for <ath12k@lists.infradead.org>; Mon, 9 Jun 2025 00:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vU3slacD63F
	XPGwNfK+QHmRo5Ka90SdOVDtxxih8Exk=; b=hkxnfGyo2VMTLjYH3XYXtSssMSZ
	VoTpRcO4UsIHhJruKPsQKdJyG4rjOP7dD5cfTU4o2ATEf8VK/luG3qUq9VZeJOsU
	mXIH7BfMVf2OBn/+mFYiGeL+jhaYuQDbKHhLJYmnpJdHZyryZFz4cB80cF6Kdagj
	QMFujbKLXlgHF3dIlFMBr3XNdtX6gw2uwyFAd6sn0et/htRnSFRsG1bBFLYny453
	hn4e9SS4/4QmWlYPjQDqXA4M+73XzijlVX8S24RPKMx4ehAfWIQPB8qVnkXQnOsH
	UTz+8ak5ZiNQNUs0fxW5pO5AZs0G7PNJGCtHHzdxdkIkVpIk7JlbX76vT5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrmkfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Jun 2025 00:10:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234a102faa3so24772725ad.0
        for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 17:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749427856; x=1750032656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU3slacD63FXPGwNfK+QHmRo5Ka90SdOVDtxxih8Exk=;
        b=SpO/0hu9cwyYqmYdrDjUo5axrt7qxZ+n3JxZyNKpBNMNsmguQX/fIIbokrvNoKhgwU
         jJ5z5oOH6hK8tbIXQ0D5yJ0LmJWIv5w0QcqQOrLeJxKNDmNashPLMeJyRR0Ay9GW7a9t
         0r8etTBFqFGAhrMGW/EZAl4+511QxNog9dQjw8t1DEazyvdxSHBth+wE97UpJVVVYLPI
         EfT9mtuVpi9vPUY35mZLHO4xTephvZMDJQSHmCdTWI7uQ6WMNDEBndr/f1exyKUDnrCG
         UV7jzl95NqXi2c1VvLw1W65b1mgCdjAOUPO7BWTIk15n1VztNRNZbRgfybIqNZPdrdb3
         ++bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCTFincupkLYyJYu74y3Hs1DjNfYccF0rC4Xcsd96adFv0D9l4WS0q7Tqx/Uq/UvBbuVEauO8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFXliybCoJhPGWpvEc7oQl4HFoT5hKurm9IfUjOZGZXqqUcO7K
	VmrCkHj/TaD2aKAi/zRpPSZp+6PigqEyVFnoIapdbSw8WnAsHSm03xpopReX2hCc5dMwFquk7qr
	33IzRruNv4N71gS5ba7WlkDVhg4zDGhUAPGfBti8mZVRtnX0DNFqiEj2dmIPq2whh
X-Gm-Gg: ASbGncs7rZwLgpYvt7Rmj1pfzrZIZ/+A5o31GhfCkc1q+FI1EqOnn4N4Bgjw1WcDaGr
	seuz1wL5juYeAvP4Q1M9fU8HTBPRGnlbx53Naqm3j3voGZlPopqGJLGq+CTEvfiCxBFKLE0okvm
	E9bN8vtTGUTa9yhuQ3kYjIt1N+NWLdcrm12sKyfEoEZehL2YbL7FMpZRJXOk+uNjognS3SpAN0Q
	cuhFN3ZCZGRVDnX83z/Xp3ZweTUb1nnVsk1/jcT4S57JMsuQ4XC4LkdoNcI+pByMGp/jOnI3WzF
	b8R7YXWSX5noYeuylieFk3kstiG/LbofRxIAZv3zUkcMRB/H67INb9qWcsMmp6KnOOu0HXEbHco
	VQZzLb+yZrOUCJtGWc/9s1Q8c9WhtkEOiHEECUKZb
X-Received: by 2002:a17:902:ce91:b0:234:e7bb:9640 with SMTP id d9443c01a7336-23601ed6329mr169861735ad.44.1749427856539;
        Sun, 08 Jun 2025 17:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZVAjFLgXzEW9psAJQituVfG0bOdTGp7YM9USikP3VuDGuhNs077kH7bFrjiKj/yEte41b/w==
X-Received: by 2002:a17:902:ce91:b0:234:e7bb:9640 with SMTP id d9443c01a7336-23601ed6329mr169861445ad.44.1749427856141;
        Sun, 08 Jun 2025 17:10:56 -0700 (PDT)
Received: from hu-rkaliapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059cbsm43731235ad.165.2025.06.08.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 17:10:55 -0700 (PDT)
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
To: johannes@sipsolutions.net, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
Subject: [PATCH wireless-next 1/3] wifi: cfg80211: add mesh peer with puncturing bitmap
Date: Mon,  9 Jun 2025 05:40:46 +0530
Message-Id: <20250609001048.2263586-2-ramasamy.kaliappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BDLSuJsXEAjwIN8gZ87cPY8KC-NhA1DN
X-Proofpoint-GUID: BDLSuJsXEAjwIN8gZ87cPY8KC-NhA1DN
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68462691 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=IyDEItP2xcx-QbxgRyMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAwMCBTYWx0ZWRfX5RLTqBDeoRCv
 D8oC7GZvPh6ihf0vH9XJDAZLZc1zYPzJ27GqY+qoQGQRBk9OAUdWesDIzVofI1lSmsjk/yIzqOu
 +w5V2v3itpRSBueX8uK+ZqLfMTwkWB4o5EBZBDge76ZZM1n0LcQgd5A+f9bswTjVdBKU+UxDbOe
 ahFrqiMxm7bgvy7FVjualLluoxKSKeZBDbaAoOamvbPVT3ynOyFYqaaXubuTVO60WYQuZst049K
 D2Z+83qHlKjyWv2NhSBnG4d/7Jg+JR0E6sgdilbfEM+3Q4AxN2SFDME6NYiE589Dru+RWIve5WP
 XdoHx1pxivbSVCXgOUwGAKk7hRp43+BbW8sLLBrTz3utKIaHgsMO0xrBUzFa9uscdEw+yJDnTxI
 5z9zsdPi4tqI4fFj6J7to1MRMJv3CKk5HnJ8pqJoLTJZlKkAc4ogMA8y6nj9gg01LyzFXLuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_171058_962187_4CB3A991 
X-CRM114-Status: GOOD (  15.50  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

When a mesh peer has a different disable subchannel bitmap advertised
in mesh beacon's EHT operation element compared to the mesh
peer STA, there is currently no option to send the disable subchannel
bitmap to the driver when adding a new mesh peer station from the
user-space application.

Add the ability to receive the disable subchannel bitmap using the
attribute NL80211_ATTR_PUNCT_BITMAP which userspace can include in
the NL80211_CMD_NEW_STATION command when adding a mesh STA.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
---
 include/net/cfg80211.h |  4 ++++
 net/wireless/nl80211.c | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index d1848dc8ec99..47cd87541917 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1653,6 +1653,9 @@ struct sta_txpwr {
  * @he_6ghz_capa: HE 6 GHz Band capabilities of station
  * @eht_capa: EHT capabilities of station
  * @eht_capa_len: the length of the EHT capabilities
+ * @punctured: Preamble puncturing bitmap. Each bit represents
+ *	a 20 MHz channel, lowest bit corresponding to the lowest channel.
+ *	Bit set to 1 indicates that the channel is punctured.
  */
 struct link_station_parameters {
 	const u8 *mld_mac;
@@ -1671,6 +1674,7 @@ struct link_station_parameters {
 	const struct ieee80211_he_6ghz_capa *he_6ghz_capa;
 	const struct ieee80211_eht_cap_elem *eht_capa;
 	u8 eht_capa_len;
+	u16 punctured;
 };
 
 /**
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index fd5f79266471..3a7bd549363f 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7681,6 +7681,17 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 			nla_get_u8(info->attrs[NL80211_ATTR_OPMODE_NOTIF]);
 	}
 
+	if (info->attrs[NL80211_ATTR_PUNCT_BITMAP]) {
+		if (wdev->iftype != NL80211_IFTYPE_MESH_POINT)
+			return -EINVAL;
+		params.link_sta_params.punctured =
+			nla_get_u32(info->attrs[NL80211_ATTR_PUNCT_BITMAP]);
+		if (params.link_sta_params.punctured &&
+		    !wiphy_ext_feature_isset(&rdev->wiphy,
+					     NL80211_EXT_FEATURE_PUNCT))
+			return -EINVAL;
+	}
+
 	if (info->attrs[NL80211_ATTR_STA_PLINK_ACTION])
 		params.plink_action =
 			nla_get_u8(info->attrs[NL80211_ATTR_STA_PLINK_ACTION]);
-- 
2.34.1


