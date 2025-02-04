Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CCAC02197
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqFb+cP0lljHDkbZ2f9V4FJId+CUmhUIBF5/NENtV5o=; b=DsHqNa+UP6MoYwoR6PRd40LoqX
	cFNY77nlgINRzQBpOLs5t0sMi6N5nVrL0Xh+HxJ+UfkhsGEVByYzyfnzC8MkaCGtJ5f+Muhfit7Y8
	dOn7H6qSDaT2Sam7zyUrCpiNQZqMU+YPK82BJoofo8tXh7jtqYZ7KO19tiAiTfwrjCTUUeqLOWX0t
	9A9o27GSHjtgMJHVnKibanKSkW3sXdHOEV57SX3UfXVhSDchQxD5nFuP/RY0Jr17FcVlqO9QZlPWP
	1pUNMz4a6N2peclN4Js7h+oiQffUWm8351QGwtjh7vrtJfBr/UjRtSxrgjX6eH5aVB5cS2vzQMicy
	H/1IHs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATp-0000000HDzY-2rHy
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATm-0000000HDxm-3VBw
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141RlCF024808
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqFb+cP0lljHDkbZ2f9V4FJId+CUmhUIBF5/NENtV5o=; b=UZwRpsvgE66B5fsQ
	aI5KY/1NRCbroSvbKop353xhUyqvyz3kA8R9jQ7BpdLKAfbEpiCZDJ/2Rb4B5fwM
	jnImr+5dXYuAmrMCRtLUySv4DFzNxvp+8DhF4ukugLnHaQJw9xDjqOQAuKvQHfxn
	dE4Med1rZcNiqmspA/WtX8ibOdPSXNhxL9qTD4ruj7ZcrN2lPUsqJMckov/8qjBD
	++hV9T1rBijs8A8anovBuJLt0aVRhRqBMtfZfd+hRPHX178Ssv7U7DwSuEWvnq/N
	1jmPWeruvr7pOq86V38iXXEPlqhUc3dnroFf8WufdBDqAl71OIMiKKC4W7uD6Szw
	eec33A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k98jg93w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164861e1feso104513205ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643045; x=1739247845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqFb+cP0lljHDkbZ2f9V4FJId+CUmhUIBF5/NENtV5o=;
        b=Ods8ao3EoXM5fO51bDDAS96sv2Iof+FFwnOIep35RLSux695yjElpy5CerT5W/BQAK
         TiI2Arc5shZ4kaobQ6XXmS4ypr1sIj6olraqGYQLBPecBGSenE/QpftLa7N8GdZsaMab
         t3t/t+kVJIjoN1wIHv4eYS2U9cXqoLxN95BxFtdvKqUvbajknuyIUHmP9O2fvvhh3ZH1
         /8d3Ets7AHaCVQHdUexwqItm9hbWjd8rjcBuKV6dzrN0Py9V4c9c0mjsOwxl/gHsxy7k
         SSHtbaHQLxWxhXQYtoJEwZiHla9scrCCZ76j6PAMJXBFchEpjIJzkGBEzokijyP/Dexj
         K2GA==
X-Forwarded-Encrypted: i=1; AJvYcCWrDs0omOOl+NxIJgW5jHNfHPhZMM40LIzMLs8zsTeIx59AttPpk4nwldeUkj2Wxh/sN2EXrAI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBYIoCxVUtmCl+7j+bDlBj2DVX6hbcJc1ci9yD1qAXonO+DwBS
	T6NoalY+baKAQjsXWuCK+rwi0MJSi1tEE9/Xb9Ns7VXwN6SHfz9zBRUpJrswsnuRYKnsY/Gj9iS
	htqypkvu/24QyQRgdDPLvNs7qDfbDGdKaxUoUWddFUAWKeVZm4V+Ik+yVWzes1x8yG/6K
X-Gm-Gg: ASbGncsLeFfekYQNYZvan09AaAtxkGojGvz5lETSwJhHWgml+vwRC2Xo4Gw/G6OtCW3
	qVoMVdGP3A+xcRrlVIzonB+sHwkaVl5S3qW0tHDc0uFpwVfxOQJJ6mhpqtnLATuZ4Wdb/ChPUf6
	1ZCdxBXYDgHf+ksUi2+Prq2/jozkimE1d5F/LyzpAyJnrK3Ds5veBhEv7Pb7I9wpFKMpXZ6VPQz
	czhevKI0GtQgnRMzEgrspGwSCKY6nILJbvDBWtUOLyRhAoJOpOpCazXHl3fmISbXHm/SHBODJVd
	HBNPwkDUZr9tY4Qa8kWDuzVlCbo45kKA4Yir8QYCQVhFG3xWhldNTk1oTalEQeARH8EBSyg65uK
	i5BB6ytQitIlLg9oMFhYUAmUQUkwqhA==
X-Received: by 2002:a05:6a20:1596:b0:1e1:ab51:f531 with SMTP id adf61e73a8af0-1ed7a63cc71mr42599421637.22.1738643045170;
        Mon, 03 Feb 2025 20:24:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF09iljl5xk+oLZXpbhxTgvu0aBdVTIyAYQE/2Jkms4zcEywMp0Em1Jpv+9zSV+CcejUShJ9g==
X-Received: by 2002:a05:6a20:1596:b0:1e1:ab51:f531 with SMTP id adf61e73a8af0-1ed7a63cc71mr42599365637.22.1738643044359;
        Mon, 03 Feb 2025 20:24:04 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:04 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:43 +0530
Subject: [PATCH 3/8] wifi: ath12k: remove redundant vif settings during
 link interface creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-3-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: zK2Fyqe3YYcgKdpJPjdt_jZi5wA0wudZ
X-Proofpoint-GUID: zK2Fyqe3YYcgKdpJPjdt_jZi5wA0wudZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202406_886853_6BA1785F 
X-CRM114-Status: GOOD (  13.37  )
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

Currently, vif level settings are done in ath12k_mac_assign_link_vif() as
well as in ath12k_mac_op_add_interface(). Since it is vif level settings,
doing this on per link does not make sense and it contributes to redundant
code. Get rid of this redundant code from ath12k_mac_assign_link_vif().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 16e6f2fae943d3fa6a46ab1ba6780c9070418279..7defc2b20fb61dcaec06d0e332c48a1b6cd2f5d6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4022,13 +4022,6 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
 	}
 
-	/* Allocate Default Queue now and reassign during actual vdev create */
-	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;
-	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
-		vif->hw_queue[i] = ATH12K_HW_DEFAULT_QUEUE;
-
-	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
-
 	rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
 	ahvif->links_map |= BIT(link_id);
 	synchronize_rcu();

-- 
2.34.1


