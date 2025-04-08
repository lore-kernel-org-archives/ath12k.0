Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC7DC369A5
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XilFwlxG3QLgFkotXu2wdZpmkObNvAbLqmHueg9pqb4=; b=ef9CPokZhEeJMECtPYWxrmmmY8
	wuBHt8P/NRl5rPh1fkqAMnFxydOTLayCOdciIZi+8lvnDum6FhtDhJJCMd3Wnl+0e4D8ruVQEopLf
	2BpbCMGp6b+otX/wi/aCAqxQG4mEZnAJhexVeDitrOSQG0RDfNjny9UdHv3b8msrdypaJm+mYuOAa
	0FDHIbcV6RVnyrcF52NPcnuo3aE+WlYXduOwlDED6IN8KDgCeOdjgQFAcANDXE5sIxZMV2rRB6ZOB
	+JEbraUZpPyZvLTHQUdVp/BytGO2BVntsjWwyRRhYGoQKYlohFaePIdG1+xGbwnqlcEaiyJZp6yM6
	kEj4+CMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22By-00000002rsO-0UzH
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226w-00000002qoW-29T2
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:07:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382JK0W014104
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XilFwlxG3QLgFkotXu2wdZpmkObNvAbLqmHueg9pqb4=; b=dUo57VaSdG2Vu405
	ibWQyYjVwgAmv0QCTKKLtwtisPg2OdvfgFzBvY9Ph8ao5lYhc/FZZ9mMloXDtAmr
	cUMV/EqGWg+/qSEIutKiuWDoQuijoj2WUYiUFwk8p+VtFq8725SbgD9LHE5ZxwxR
	sG4XWa/xGBwNJRF+twzv+BXksxTz5X64Ozh89JixDAU2R7NhH+XYXmEf0CAMxe/p
	xO6NORG3LqIZzxSb0QVv40mDEWeUAq4mVhzZYYrSycMjHx+OR67XwRF4C1u2PQM+
	pn07XrG2W+9pRvpgpTM7+jTl3ZLm3V/MzugwdidZMA/ayAGWeOaBLqKfj3LxR62s
	Sk6cag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm6nhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:07:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7395095a505so4026831b3a.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092421; x=1744697221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XilFwlxG3QLgFkotXu2wdZpmkObNvAbLqmHueg9pqb4=;
        b=FjEs+QQm0aXR/5Gvui03LaBo2lwk9udLXnFSmFBXfb7/pBvZfz443Lqr71IPsT/y8q
         vgavBbpkRahfj5wlU8hiZ+NTQIug6fr658lOUXdw34wrLDqO3h+BphscDyP5NNjre9dz
         qSkCxldKg8+sYikXkBZk2GsbaZh5RAcHpUPb4p/PgZQbFqKv0xfJRkDh/7Mk7QSWbPic
         Hljb17Va/Xm3+DUvtaeB0YbfN9BEjqYoJkcdQ2+5XFQXfsuKzabC4fjxTyDDGEOteKV5
         gJ+toEYeyBInUpAjX7rgHKlv2WNFQf9sd0kEYRoOqDy5KiuD/yNSrb2iMsqMEiWy4B1d
         6UKA==
X-Forwarded-Encrypted: i=1; AJvYcCWVUD1sM/m+9HpyOIRTBRXQNUENTrbxTeVRHYFt5tuo5LVlxwI2eWymwzRycE6jyWBSu4Oqp6Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDa8IbtJx/huTEDsVWwYFRY3/ESse+ogRAT27F/ExsxHn1Pxug
	oe/xprkZxjQqb5YnZ2Y1oQTdbFFIJ7xHWGtFow0lEcYAppyOa4QeNsYbeKJerAm/RmWx0FIHN61
	Iid4g2mueb5yDumwhezFpAeTJVjMhFPeWpDqsjGfD7RfHBcbMSIQ5/ylkuN4JCxUvhO/l
X-Gm-Gg: ASbGncusjQUNbQnqkTKJWlt7Vx4kA5em2YxCsHt9VbWjOWx7rTPE3K0SoWeS0JvKXNJ
	t03dwvDMb4XUELqp4b4kevBbvZiaB25li8/1qcVOrJ+GnzC+odboTg/b/9TK1M8yqstDZ5NlHWH
	2CmXAMxGND6cCFMVbSgCYC2Yoqo+btbYD9/JhhbxlMjI9ZpK/TRHpQ7/797viaIM5jfl0QncndC
	XqT1Su+cvT+u6mpYbzCQik7QgUHW6+sjH/g61PvPEhdBfNrW6lZ3hwtbyNWSFiVAPIwCBx8jXJc
	Na42aBQvepsGQBkMakqZM98UqtQje22sOvhOTMdf11I/KWcRx7pVKgiZJd+41jVa0twHmJdJpZ5
	z8WW/zvLBTtR1mKkBYa5/nvuDeXRFrb8DoVJsfSyw
X-Received: by 2002:a05:6a00:2186:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-739e4be8c14mr19887005b3a.15.1744092420839;
        Mon, 07 Apr 2025 23:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6V1K+A72p6ax1SQOI5iH5ofN/dK0np0CGIaKKMDNjVDYs3xGeXEuliC86DR471I1M0d0xYQ==
X-Received: by 2002:a05:6a00:2186:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-739e4be8c14mr19886980b3a.15.1744092420424;
        Mon, 07 Apr 2025 23:07:00 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:00 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:34 +0530
Subject: [PATCH ath-next v4 6/9] wifi: ath12k: fix
 ath12k_core_pre_reconfigure_recovery() with grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-6-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pAnjCPkFRMca2IlFGN7xhIMCJGkQQG-h
X-Proofpoint-ORIG-GUID: pAnjCPkFRMca2IlFGN7xhIMCJGkQQG-h
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f4bd06 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=d-GbLxaNKwXvygB75HgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230702_561586_0AD4B2E3 
X-CRM114-Status: GOOD (  15.91  )
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

Currently, ath12k_core_pre_reconfigure_recovery() reconfigures all radios
within the same group. During grouping and driver going for a recovery,
this function is called as many times as there are devices in the group.
Consequently, it performs the same reconfiguration multiple times, which
is unnecessary.

To prevent this, add a check to continue if the action has already been
taken.

To simplify the management of various flags, the reason for hardware queues
being stopped is used as a check instead of introducing a new flag.

While at it, also add missing wiphy locks. Wiphy lock is required since
ath12k_mac_drain_tx() which is called by
ath12k_core_pre_reconfigure_recovery() needs this lock to be held by the
caller.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cb2a99d110d5c9ec2c092fe1a2b776b6265c4126..0fb3e57cd254ede767528e47e1d9d183257e5b71 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1411,6 +1411,18 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		    ah->state == ATH12K_HW_STATE_TM)
 			continue;
 
+		wiphy_lock(ah->hw->wiphy);
+
+		/* If queue 0 is stopped, it is safe to assume that all
+		 * other queues are stopped by driver via
+		 * ieee80211_stop_queues() below. This means, there is
+		 * no need to stop it again and hence continue
+		 */
+		if (ieee80211_queue_stopped(ah->hw, 0)) {
+			wiphy_unlock(ah->hw->wiphy);
+			continue;
+		}
+
 		ieee80211_stop_queues(ah->hw);
 
 		for (j = 0; j < ah->num_radio; j++) {
@@ -1439,6 +1451,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			ar->monitor_vdev_created = false;
 			ar->monitor_started = false;
 		}
+
+		wiphy_unlock(ah->hw->wiphy);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);

-- 
2.34.1


