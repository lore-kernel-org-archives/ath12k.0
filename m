Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED3AEC1E84
	for <ath12k@archiver.kernel.org>; Thu,  5 Feb 2026 09:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1aFgHVIfZ2yLEDQAzRb3TYjSWteUfgWHSp5wk/19zoc=; b=JdfDTIQwlknnYMXa0e2QnKJBDw
	bh5vRfx5d+35vxQLbg4LO1cY3lDttHRnUMhVFzxSIM0/OVh40dbznoxnPUdqoehmkx30xGkQR6kUY
	QOwa+E2z4N2SrpKl7+a9MyUP4rVhr1W1mOxKP4XIcpzGFG4BLaOS26TZGoMHGstww6/jT2Kbk7CwQ
	X+xlOSQ1y7do941C98qEKbPmyFiEZ4lXJdZ5Imi4RTq0mqnahLST/I+DLAxThdJz/aJLHlCsu680G
	Jai1F9aZ8tgyUXgYBt6P5cTqE4y+URDYkD7PO9BxqHRKmMi+lgkkj5u+4HHa0uGqDAkxlj4g7yJA6
	muMv7wtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvsa-00000009itL-44rj;
	Thu, 05 Feb 2026 09:42:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvsW-00000009isz-49TI
	for ath12k@lists.infradead.org;
	Thu, 05 Feb 2026 09:42:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dpFM2639822
	for <ath12k@lists.infradead.org>; Thu, 5 Feb 2026 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1aFgHVIfZ2yLEDQAzRb3TYjSWteUfgWHSp5
	wk/19zoc=; b=JZcVHTpZq9wNZamP43mvwJLck1na60GSND2L3XKEvMZMDQuinpv
	Vs64kDUx6qawhZsUCpStZeRCtxWvB+hEIBb7E60fQPDnHqgHTXao11sQk8AvqtZ4
	U0cbdUQD0rNGe4HTXvYJ+8+eCmBgjEf1FQcjWchaLvdH7B6/MbTaCcqtQ4yi6XKR
	cZCsn+3JryXBO558MlN462vVwCdZ3rkoNzSpL+Um20NRQQJ0Aw9YCbpfmxIuObyf
	Knl1DgTMmvQgJZkNuKSv5mEKdFIhfNUxPgE778tgpgqox1acqvgdSPa+3QL/tgPJ
	Q/jkvsWnNfKPFZmgFg2d5gv3p3lKxKjKA2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvb8x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Feb 2026 09:42:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so7891135ad.3
        for <ath12k@lists.infradead.org>; Thu, 05 Feb 2026 01:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770284543; x=1770889343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aFgHVIfZ2yLEDQAzRb3TYjSWteUfgWHSp5wk/19zoc=;
        b=Of39B9MWengFA5G8HuNsHuIdxk/ia4FSQAbqgvHTpxOT6Mbfj0gl0R/aFQSArXG4bX
         sEan0y+4bC5QqJd15ui80kXGklV6T2XfdV/hAHdBP915jklCyx6iG46WhI9VBFhg6a97
         A9EGEYLI7zPnYOipoWZsyW923rbjfaYC4R7Qy8TO+E3B/ICx13taA/zGwz8MLk9Cnfh5
         XOgMCdfCt9vu73Q71gfSUnO/R5unTmm65XttKo1hEnoDmDV4UN3z6aQnvzdwNO3gr9Z4
         bPN1ce7qweb7FPAsqVcFKXf8KBWDpFztFr/j3HSPPKjnDgxLMdTkYva0nv9lSIlKzvPc
         64wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770284543; x=1770889343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aFgHVIfZ2yLEDQAzRb3TYjSWteUfgWHSp5wk/19zoc=;
        b=qgI3AV36xqPhEgsWUbHwnrPcTHs5fSpk+oT5sUouUu+/kkST74t660NDyTXS+u8cYf
         rQksHCtk3VGZAM2ekDBrxRDOHv1KSQjPQw7UYs0//RNJa4ZARFSAjnDOlaKVBOGmS1Mt
         DOqJnBAJy5fVHHlZ/BiAuhwPUdEr7l2Wm0xQdN7pOmWBhm+9NcwlVf50z7lL2Q73UDKS
         AONruWxQmKJ5vvD53pvJWpyxLdbORw7XIi/mVYHLJY9o02x8mWkAZbPEsk5CLoReoeIm
         uI8NvMMiSwpj+qXPX0KBHJYCluzk4u5ST9xTehbvWQxso98s3pwoblLjEfaeRzeacbOf
         6HTw==
X-Forwarded-Encrypted: i=1; AJvYcCWtOGij9R6652sdEmvf1kr/A4nJHBYKd7ywftsAxuKSgpvJ4o9+qmG01yQomcg3I1NT2EOcimw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXNLIGJwr91/De6mpyy/cvdRHfRLrjRh61+s+7QjyLET7Na33T
	H7ehbttG8sJXUJeYXgafLYDFfCsH6SH1KkLqPR3T//YEmsdNcqM3tm378PFmXa5hTpooKMmcdra
	DNoBWmX/rlafxCWdfV+aIx9EFMMjJRNbFzBW5nmil4qrH846y+lUyWK6Lt0yu9Ma4
X-Gm-Gg: AZuq6aIGPIsapUNBMmOgfR9Z96itIcr6Clj600Vegk8gYdiN6sPcCuD6weWnLnXkAm/
	p+r1CIZ3HWMtQnnJHrJ6uhzPjwxFGEOKWs0Obmsz5uX/1oVQePMsW40p4HK3BxPPAZuxBthcIag
	MNDzE4YWAhWT/oda8l2f34ABmWvYD5SHnSqONDrFvTHV3mLR8oJqUXx4bDm4F+KvWYJG4S87HCN
	DjLjVNfLK0G+aPuYYUm/eXNg93Z+UT8ek0VN0/T735j+eBhMLp6KbxS1Q+jCCeye8qz1Ph3/AcG
	qSuU0Lm7qzPqIoIjG0WlWVtLHZLuVQwxefcw/HahpvkjB8SnDrGbpwQI2GjVSzWnzDRWEOLiB6Y
	I7zOim9IMNOXm/xNKyXkpbYJicpLgUZHQ7CufJPnMNZLfbUYHGtDyAsJydmLOMkH2wAFbeqJYTr
	ddeWwrgOqLOOmYr+AFGaBOFJM=
X-Received: by 2002:a17:902:e5d1:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a934123dd5mr58228725ad.54.1770284543227;
        Thu, 05 Feb 2026 01:42:23 -0800 (PST)
X-Received: by 2002:a17:902:e5d1:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a934123dd5mr58228465ad.54.1770284542651;
        Thu, 05 Feb 2026 01:42:22 -0800 (PST)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933854fcbsm46421675ad.18.2026.02.05.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:42:22 -0800 (PST)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Ramanathan Choodamani <quic_rchoodam@quicinc.com>,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH wireless-next] wifi: mac80211: set default WMM parameters on all links
Date: Thu,  5 Feb 2026 15:12:16 +0530
Message-Id: <20260205094216.3093542-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69846600 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9ZobptKUMGgaKLDI8xEA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2AdS6iEMjVuD0Yl_RIPY2OiHNYNHk8fV
X-Proofpoint-ORIG-GUID: 2AdS6iEMjVuD0Yl_RIPY2OiHNYNHk8fV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3MCBTYWx0ZWRfX0W/CplfJkFwj
 2ovdbEX28h2RePYi+vK95IwGag4GFHEwSoxGL28tHgyk0NJJTKg5C6aOBTVuYYQxamh3Xngv2fj
 K/XYR9qn0jcqGOiOgwe85+WtJmIWvHW/N5vWQdvfIbWhJ0RaGjZuR3H031IX51FxTL8H+QGJ+Sc
 4IIX10Gk0pbgWX/b12/ajVbA2LmsjOuk46gKtSy4y/zGczlVszhvs7UDZcyZx1X0hqNv3Yd/e5C
 lWAuopFsNmZvGBe/eEglxURrePbZzJ/rIqdwuXz8fq+eIdpJEn8+Msu0Al1EnCSE3VRRwRL9PLQ
 vASRs0WQZUVC6MO7vkP8BO1Nuvx1yWsImWEXdrj0tEhkAjvKzhyYRnFNv00Dc8iNtO6jZ6epV4N
 EOIuy4eLqfC+tJ9QffTdj0OQCSCfTV6+SxOG9PNQGqGnSPaRl7AJEEsPmBPq7IM9cPUI4+k5p+e
 P169CSMy0pea2qs4l1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_014225_052362_F1B9A751 
X-CRM114-Status: GOOD (  11.28  )
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

From: Ramanathan Choodamani <quic_rchoodam@quicinc.com>

Currently, mac80211 only initializes default WMM parameters
on the deflink during do_open(). For MLO cases, this
leaves the additional links without proper WMM defaults
if hostapd does not supply per-link WMM parameters, leading
to inconsistent QoS behavior across links.

Set default WMM parameters for each link during
ieee80211_vif_update_links(), because this ensures all
individual links in an MLD have valid WMM settings during
bring-up and behave consistently across different BSS.

Signed-off-by: Ramanathan Choodamani <quic_rchoodam@quicinc.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 net/mac80211/link.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index 1e05845872af..b659497680b5 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -281,6 +281,7 @@ static int ieee80211_vif_update_links(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS];
 	struct ieee80211_link_data *old_data[IEEE80211_MLD_MAX_NUM_LINKS];
 	bool use_deflink = old_links == 0; /* set for error case */
+	bool non_sta = sdata->vif.type != NL80211_IFTYPE_STATION;
 
 	lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
@@ -337,6 +338,7 @@ static int ieee80211_vif_update_links(struct ieee80211_sub_if_data *sdata,
 		link = links[link_id];
 		ieee80211_link_init(sdata, link_id, &link->data, &link->conf);
 		ieee80211_link_setup(&link->data);
+		ieee80211_set_wmm_default(&link->data, true, non_sta);
 	}
 
 	if (new_links == 0)

base-commit: c30e188bd2a886258be5facb970a804d8ef549b5
-- 
2.34.1


