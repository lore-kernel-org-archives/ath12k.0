Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737BDC36010
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=42USD6xLBFhYYaeFkXybXR4DDGWjXP3SE1bsfsaPzF0=; b=ulqM+vomp7wIFSewInq2JnZFi0
	eB6Gxv1ly2ykkQZmuC6bb74INn6CchgDBbqKWbStTeyn/dSX8ap2MaqILX6JnaB7hCwYHIAG8Y6dX
	7M+s1KOn6niO5CNAN/nbBMKxX5hYoZj/n1MQ5fzBOVfOIPT1Oh7HYE5u5m0/OE4qAdDDyQ7wk1iAG
	TQEEotSp1HP1FqeFjpLABqs+SbL0bctEAgN1fA3xYkGzcGaCUh+P6+JoTUC0V3B4f+fX08jyazYxK
	1mTX0tUNqKoXhxDP55fIVddETwePoe14R3zxow9ozgFvEa1ps7HqBGF+ncJr5lTak9zsfsbHTEGvC
	1nflqoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfZ5-000000041vt-0z0T
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 17:38:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfYy-000000041v5-2QRz
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 17:38:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531Djjil024535
	for <ath12k@lists.infradead.org>; Tue, 1 Apr 2025 17:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=42USD6xLBFhY
	YaeFkXybXR4DDGWjXP3SE1bsfsaPzF0=; b=lW6ylEhhevBUV+ni6kNijbDGvNF/
	U3Exd5D9VomGzqbq3xsnoD+iHDkXtEJIV9/Oi3DvaqiLyXJWk3yQjAqcw5nMqyBy
	mbZNvLKb2CKQCrx0a9WTa6yPvkPCaaDOGsIPdU/KTE9Puc+nOSXruHLlzLAv3N5y
	8i9xS6537MbHLOExTwYa/PpTe2IFC+zN9A7n0OTEVAAkDOpYgxWos5f2cmlflDfE
	FuP8s4DQfeTe2G64ZRbigO4HHS8zRMxgXuYNJ1Wo2jtk3SB92tUol+Wv+vyErNjz
	oj7QsFvt7aqhkEKxbY/sl7lYj98ijVAFpsEDCU97yPDVpxBU3kVfwr5Gnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpysw1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 17:38:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254bdd4982so148345815ad.1
        for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 10:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743529089; x=1744133889;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42USD6xLBFhYYaeFkXybXR4DDGWjXP3SE1bsfsaPzF0=;
        b=F2L/RBYGtwKHCbeMZIu8Zt3lIZRHWY4UR4cvlcTXD24doHii/QmfyCqd1W5lL4SWwf
         DmU9+tflkF4c3sSUtH6hfgH47iK0ZPeuheh3j4bcnLSqUne+H11nn0kA3Q5SQp4fJSZE
         3EscfOAPu8LhV6wk9NJGjTawOeXxiDa2olaDjycai/4he74L3yvT7yQjGz+CgL6e7I81
         qoGYQ8oU3vhV7dUL54AdGjxyA3r56lA4A9yt3xCfAeHqDFfhm72tm2dfzJ8AYUmqOT50
         0iOYNKxvph5uwXduz0+dNsq9T9k1rNr5jS1JO5aUpnRbUUQfDyMkyjHgrxSP8H2GgrIf
         JsiQ==
X-Gm-Message-State: AOJu0YxD6WWgGGWkQWcHgZS9Za+jse5cc24ZK0sxvxdmEe7FHe2RHTZM
	XqD/lwSwd+sEzKz21er9aZxM/B/p3pY4x/FnFRqN0SlmL36Z3J4IDpdSWKkb/95nnmISnLlcN86
	gFb7C5cVAoSyTqKncW49L8qiEnwiDeC7OgI/VI5RCYe/sK8duZ6w2YlY0C2PuQxZ3dhyR
X-Gm-Gg: ASbGncszdW3nWMFx+co7lQ89cxbB+wL//E/BNy7wv4OuGvNfIur0bDPBbb3nT5AzffR
	4U7et1SQvc/6RvJc6fEH9zY+t8iZfEuELc1rMxtthYcyRYlLjpJwhYpLYv9PK8edb6s1HJ+gYK6
	jtBHRS6PaeKm8HBkz9kXoDoso1miFyQEFMleH+hrSecihNN5AUaIWxICLGBB/k8B1MmsUstnIo5
	WIMr3FspeNehJJthUTmtQACmqdMfu2tgSOm69POcMryLJVwWqLbQg1WnJjFv/iksPXcXSbMxE/x
	1eh2ikfybxA9Kiu5i/9Dm5fhwdEae+kukU7pBLMXl18pj0GB6HMT2ZUP1eguJ/1mjz87SH4DSCo
	vW1sBFi14rDQI291xNEe66C4D1sKxDtDzhMYc9rGaXjpmUBU3JQ==
X-Received: by 2002:a17:902:d487:b0:223:fd7f:2752 with SMTP id d9443c01a7336-2292f9747fbmr248468265ad.29.1743529089235;
        Tue, 01 Apr 2025 10:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq+vypP+NaSsVeb6Jphfm9hixv9zWPpkB+7GSItWhCFf3xx62asR82rkaiYyFZtR29kSFx6Q==
X-Received: by 2002:a17:902:d487:b0:223:fd7f:2752 with SMTP id d9443c01a7336-2292f9747fbmr248467955ad.29.1743529088795;
        Tue, 01 Apr 2025 10:38:08 -0700 (PDT)
Received: from che-siroccolnx03.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3e125sm9597434a91.5.2025.04.01.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:38:08 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix spelling errors in mac.c file
Date: Tue,  1 Apr 2025 23:07:55 +0530
Message-Id: <20250401173755.1982382-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: G83KaE3brzxtejroFDtrEAEURhBVzlUo
X-Proofpoint-ORIG-GUID: G83KaE3brzxtejroFDtrEAEURhBVzlUo
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ec2482 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jOCyixPqWrj1a_6UGRIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_07,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_103812_630275_65C50E83 
X-CRM114-Status: GOOD (  14.31  )
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

Fix spelling error correpsondig -> corresponding in
the comments within the file mac.c

Compile tested only.

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f2fddf213afb..98bda931724c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4462,7 +4462,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		return -EINVAL;
 
 	/* check if any of the links of ML VIF is already started on
-	 * radio(ar) correpsondig to given scan frequency and use it,
+	 * radio(ar) corresponding to given scan frequency and use it,
 	 * if not use scan link (link 15) for scan purpose.
 	 */
 	link_id = ath12k_mac_find_link_id_by_ar(ahvif, ar);
@@ -10438,7 +10438,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		return -EINVAL;
 
 	/* check if any of the links of ML VIF is already started on
-	 * radio(ar) correpsondig to given scan frequency and use it,
+	 * radio(ar) corresponding to given scan frequency and use it,
 	 * if not use deflink(link 0) for scan purpose.
 	 */
 

base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7
-- 
2.17.1


