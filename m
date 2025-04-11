Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FC1C369A2
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=; b=kLBu03DmCMxPnMvTYG+UyEu6zM
	cSsOasRrpIaKTTPA9ubqHQJvvW3J9ukTX0dOfqWpZAvm16dSoPdhd2JJO6Tg34e1ktPuo+wCy1Kwh
	5glFTp+IlrOYUwz/l4ykvVOQq3y168wSvYNWrcykEe+D+YbUKRoaAOySiu057Avqq8fEi2m2ZJHpo
	xUgEbCJBSp64ae8iHrcT45XUy9vWeKqQtSy7wBiBPE0FpjqXymk9GbQkx1BpObZEy2lhAfgK1lI46
	BkWH3Xr79TPEkvMlm/VWodViJwl1jhFXZU+Jt4zUq9st31ZLsFvB+ZjI2ZYDqYgKLapylo8B8Gnmz
	tPN7U7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34hY-0000000CMVY-0OgB
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:05:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34hW-0000000CMUb-1voo
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:05:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFrgt6028839
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=; b=oAM3cTkRrt19YYyl
	NP2G3HTSNGV/lL176CuStsm1ODbepOTwfwKZuzpRZ7JmzJG+88AyzZdmtuxlhvrk
	gm2BLESyyoHXp3sq+fqj8MfEXerF7shFC/81hZyfOzL7ENLlZlP5ygPxanUcisa6
	A6dV/+vEkyDeY0tMdVLFrlq9HFuyof8/vk30k4wIFIzvjkUYsPWSp9JCQw3v9PEB
	dWsjAVyy125NKFS/dKqDCdARz7yPoCx+fbS+KkPBov3V2dV3/stoUKX9XWQKZt4B
	z1+DSGtYfSCIG6h45jGrHVNF5Zn4q/Z3CBYjQU6Ns8537HQ5wB7YKINXjZ2P7wYH
	ytc+xg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbus07c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:05:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff5296726fso2151580a91.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744340705; x=1744945505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=;
        b=ci4YKwwDXR2C+447KACKM0vxHAG37gcnfdKGFuq1RjgOozuWi2bpzDwNHfql7vCNYa
         HWPJC7HEYFkDyXMYU0/oV17JRyU/iaP/acKZLJ24UoON+2w+/Ht/j3rWU4W2QiXHPK/J
         nCUuUcXk9YMaIxFnqFAZrDMz15PltHiUGNkB/KVQ9ZYVhsyD+56BqY1CQmblrJkytUXP
         409GG/0v8mMwP0Inol+rC2qA74gBZTj5WzAvFpTHwTNUIXV218HN5jXaGJJWd6a6ZS2U
         e0Ek/LDTwXfmNYfrHGz/kpMDlAxVFo6DOnyWNds8WlET6h0NrbLRmG1dxjSogh6/25ic
         0ELw==
X-Gm-Message-State: AOJu0YxQ/aMI6JFTL8ERubfuDxgGZK7j48O4KiC1lXYsHwwJkeP/twzL
	qVqTLAPqALiyX0UUwttRrbODiPrEOlCJyzlIFtiLECBCyi56yVGh1lU3kA6ehZmjq0bJzxUJbOD
	cWRMoiNuKvVn1XKXQ87GVaDcUduRB88GHXajgB5PHurTtCAFd+UpYRucxe+5taqSIw/nx
X-Gm-Gg: ASbGnctl5qpxuQl/zIsUrbXMXShnLZ2JTH0wuXxnauXrLsF7Am5f2bGBoxiuSaszMaI
	27CIvAMYhNyjq+m+uz+7BEzaQUZbHPxUbvHmNEAXTCLIRcziDhx0/gyqPg9N7m11mioB4xS676n
	RZvTRgWUlKRrhNVmpS36mjc+LxUensvKyPPcxUMhdvfb0P4p56gngp+S4/4WE0626JhEKDUaMe2
	jxbcL+wu+I/O42m3f/+nD+actw8DdwR3SZfUXP5t4E2nitndcoU/OdgN5lWlJYowV3WAjB7gWND
	8pEwzDSmOVWljDIluNA5oux60eP1932tVyaVjkt/B3bdpsci7hDqZgpFF66r6hbSzQ254MkjAHo
	bI/9HneE1TesEH2kDC0Zlc235HQ0Q82UV1doL
X-Received: by 2002:a17:90a:d44d:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-308236244f3mr1884745a91.3.1744340704843;
        Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw3aUHRcQ8EhaIL95aG+J1wgT0E2sTrzFKeDpRppMCbJ0z8YGzrCZWpdAJnx18k6Dqno47tg==
X-Received: by 2002:a17:90a:d44d:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-308236244f3mr1884712a91.3.1744340704381;
        Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca88sm38425205ad.256.2025.04.10.20.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:34:51 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Use scan link ID 15 for all
 scan operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v1-2-07d8b4a5d19d@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: gtqQVV6a_JsXYhSByKUfK_zz6q_NWf20
X-Proofpoint-ORIG-GUID: gtqQVV6a_JsXYhSByKUfK_zz6q_NWf20
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f886e2 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PUz9acJwvWvt2_6aZDkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_200506_508078_3347BB6F 
X-CRM114-Status: GOOD (  16.20  )
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


