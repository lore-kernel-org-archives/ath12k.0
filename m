Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436DAC369A8
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=; b=z00PblaOfHYiJDETJJLkfcLxD1
	jGhjXZNz0zcPr8O4GL9k2mL0Ix134TBAcb3slcPEF7hFXzKDg72AKPN6qhKSjRdT5RLcf0nKVCY59
	jsh3FHkr28C/JTqCVDRJ16Z469bQ09GFDjfKiljJWcz0PcctJAIQp7DiTSobi/+LA6ReYeYiJekbb
	cW2xH6vfKYrwthbBaflUCKxDymxLdmmimyWQSImwQ2xU4en1Qx2nzlOB/l2LGeFj8qLV3VGZxT3Ss
	UtWw89NZItuLXtDcYP2uFQuDwre297MBDu2N0DEjK0ferFvAor7sJAm8RoINMP9uWEgwy4L7d82er
	5XMKDNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34tI-0000000CNaU-04mg
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:17:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34tG-0000000CNZ1-0Ezs
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:17:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGJgEO029696
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=; b=XIbtCLy4dEwZ2+kY
	Slya+eNl1FOqJMgTnBKXIF12Rpho8Mi+dTIiRJQgfes6J3ZhBiKj7E56oaprhHyC
	aj4UlUt46ftJwYcSnQOY5drac7g1klC8VqY96zc0wjkZC6s1936vAWXJrYbwQgqS
	z/UC/Ja4/Xt4wdR8beSdSoylp2sw9f97242gO9nDHE6NxlM4YLtSnNha/+Sw0TaG
	UF75KS2plceWrbjPY9fDXxKljHwMA9qUwYKa2X0oN2n3liZruAGZU0C1P3FTyKvV
	gs8huQG93GAmjYMJm28dn/tOA27pQboBozlbrf1b86AKzNxGMc3O6aofWHscfqqc
	bTTYvA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbus14d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:17:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73691c75863so1796837b3a.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341433; x=1744946233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=;
        b=PJzvkhffX1hTP+4NXA/s7mFmOBe69gqnebgNNi1vF7ue4agQ8iqBEnAdaJjxNrTC2F
         Fkjs9+43cWXj5mdXiqpXvQAVCe4xdO/CLncRJSdwn6KpJO7v0He+RUZ6WCpBi0M45gaO
         WJvJ76iOUvgM9p81EDw0rIMJYvKd2JvXkhR0ShdGcvGkssnCauseJ82sqCGr1p8u8yxi
         BswrqWKvZ1R4TQD/XUdXn6z7D6QMbUw8619OUA6c8ZqEE7mEJhLmW6sgR+sHc5fywLz4
         8dqEuwoT8hsLk9JQuGwo63UQYz/aW0WtI5QxHQzA6zuXpy4l/ypDf8XIo2dPzinayU3L
         OYQw==
X-Gm-Message-State: AOJu0Yye8dp0ScOHFifkYyxSNvupk2s+i1nP3syDMqQDmEJzk4RCE2Cb
	mDo9ry8De8I9tdGsP/9GPbJpnGzvU3C0oDiNxP0MDFKuXhI9OXOq1wk4zjas2sLufe0QahGerzQ
	w3R/cG/26o6xbFBZ4SpGLcthp5AGO79PaHXkuebIr6D5Qt95Pf0uJE7KPPTre
X-Gm-Gg: ASbGncuzhVSPdIHMudd3niRlCMmrwqFyXeBrHByjTRKwa9/sIbf8yFcjspSxyW385cI
	KQjkh9fvHJnYfUASMhic01M7ouBdGwIcyjAuWBxcwSGfdKna5eGi1vSpkduL5nJNQjOEYrr95df
	7JWKJwKkgupfsikoTrvtSbXhdCsFXPmCj8qu/iz0rJMgw0Sl+CxHXvLzGL/syRG5mGCjJFjl/XG
	EAshg51gms8C3zXkwhkZavtAGvaPHOQs4L4pdcJ4Uq9VfK4DHeBHYoCGaQHmhlxjA1mPVVijYNn
	prg+mxPqoR0YcuLOY41R7f/H9C7UlnroFmhntO/mu1ediE9qOGwWOo6jTkZLooXiw+UfNZZKAZW
	j5OaizdNVeXOJnTCWWk8NuF5WIZc3K+bdliL5
X-Received: by 2002:a05:6a00:392a:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-73bd11b4f98mr1556470b3a.1.1744341432590;
        Thu, 10 Apr 2025 20:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv7fAFdhMVleG+iD4udU51UyV+t6xUvvk+0Clkocs2XAyqEabBGSczS5fRIUiwv+VHndMXHQ==
X-Received: by 2002:a05:6a00:392a:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-73bd11b4f98mr1556438b3a.1.1744341432061;
        Thu, 10 Apr 2025 20:17:12 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da35sm375964b3a.131.2025.04.10.20.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:17:11 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:46:52 +0530
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: Use scan link ID 15 for all
 scan operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v2-2-b6740896c144@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 8a2oH1Y1AJizF4TJMQzndaAxvugoQY8y
X-Proofpoint-ORIG-GUID: 8a2oH1Y1AJizF4TJMQzndaAxvugoQY8y
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f889b9 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PUz9acJwvWvt2_6aZDkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_201714_100347_B6F12B6D 
X-CRM114-Status: GOOD (  16.35  )
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

According to the code documentation in ath12k_mac_op_hw_scan(), "if no
links of an ML VIF are already active on the radio corresponding to the
given scan frequency, the scan link (link ID 15) should be used". This rule
should apply to non-ML interfaces as well to maintain uniformity across the
driver. However, currently, link 0 is selected as the scan link during
non-ML operations.

Update the code to use scan link ID 15 in all cases.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4b3469380fb46a629fad7a9a40a44e761ef33fa5..7d96052bb0ccb1230ac446ffbfd20c5f6a463b5a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3463,23 +3463,15 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 	if (arvif)
 		return arvif;
 
-	if (!vif->valid_links) {
-		/* Use deflink for Non-ML VIFs and mark the link id as 0
-		 */
-		link_id = 0;
+	/* If this is the first link arvif being created for an ML VIF
+	 * use the preallocated deflink memory except for scan arvifs
+	 */
+	if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
 		arvif = &ahvif->deflink;
 	} else {
-		/* If this is the first link arvif being created for an ML VIF
-		 * use the preallocated deflink memory except for scan arvifs
-		 */
-		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
-			arvif = &ahvif->deflink;
-		} else {
-			arvif = (struct ath12k_link_vif *)
-			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
-			if (!arvif)
-				return NULL;
-		}
+		arvif = kzalloc(sizeof(*arvif), GFP_KERNEL);
+		if (!arvif)
+			return NULL;
 	}
 
 	ath12k_mac_init_arvif(ahvif, arvif, link_id);

-- 
2.34.1


