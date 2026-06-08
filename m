Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47825CD8CAB
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=rNl8ZClGAVCCHE/ooaWimTkA+r
	7iVI2J0K4EuULiIC1MxYfE4BmWrBu4tk8hI3Dk+4tkTCbVcCgJaFPf+hFKqaoWjSyUCI6w2BBHLis
	3/h7qAqtnXCjy+ToC9faDGJhz5Bu1JhqMRRdAW/nQprT8Pynsc0IrGQRfa8yYeaPKKa2i1xFb5k6/
	Il3aA9Otcd7OiABM8K379Y42rgv210LmySV5+aVEdow0P2zhAHyDuE7mwdF+a2VTUa5LtPDYdzesa
	9OoYSRGSOJrL1aq5/MdFj7iOu0rG2c+1nV+Ad4gWoYqStsH4Z4kU4dVBqVwn1VnhT2LAJq6WK1zNR
	JtOlW6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvb-00000003c5d-3f4e;
	Mon, 08 Jun 2026 13:22:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZva-00000003bzr-192E
	for ath12k@bombadil.infradead.org;
	Mon, 08 Jun 2026 13:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=N+/Fn3W9uN0SHy3RCjKeL/FP8T
	wHA/OI9yiZ1aLoPp9HgMftNB9sI+LVUcjkGGUPOV1TypLVa1HuPT97MnUdQ8MV4sNffjpb9GmxWOZ
	IpysyKvegVF+e2+hvSZhGLGikh2vqsGYTlC6jOTKWduaUfA1fbKIlwDNHY6Wv5aKow6LmeYAynAwT
	O+W7N4ImGCzZOUWmPs2SKefVUMOeAGv0P5l5C66B/qd/JswoT1NucRseSxBIIjagNJnzrpjmoAJxU
	eqZ+akdmg19lp5cibh1yv8Lto+JFCnMJtehDiwjjxRYgLpSWWvUjPba38S9OHyuFTuqaH2C4yXUBV
	+OLUu0fQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWZvX-000000012W5-0iAf
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BCfiv3456741
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=dmjFTONZoYj83Me6
	pAY7niq9uXjobmrkbbOifA2pJVVWZIsgJnHiidXr93blZZDg5Y/7u3AYcPQFJ5WA
	xxVQoKb6zjwqeikNVGv0NJQfHtpvkxAM60FORdmTUrOC4VCr9qGSvOEjWuIcqOWp
	Lrb1jfnjAyMylL3aWXMiCWEtSAWExxTo8zxlgUu4hYsmnVqRH2iinZSve8w6stWI
	TMTzU5ZeZJk/WoPwTy4iTQPT6sNjuuBjZjEgvBwZnEvPrPP8CKxu2DUdHyFv1w4t
	zfnTwc9YVUF44OhBoD0MJZHAxNveiXnHfyPmJIYBCkgzkLvWPqsDc5nPggbg7uIe
	+wfJOA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0h3y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304ee7d1368so4014881eec.0
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924918; x=1781529718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=;
        b=KFJz007d2gBHHMDZGhOdlwsp2umZfcLu3p8H9I5na6x/Lgl4ifWVFYrZTxnGPF7P8W
         2Nv1J0p2+uh8DCgQFG5cDQcO8qQMh3SUnCCVrZfavF6dNqKSxltCZa6Lim0vSNKXoWP+
         Dx6uDPAR4VTfub9pqW9DCKYMBAj4qWiR/y9XGQIXDqCCZSeRJ5uLreLgyEmdysVijcXF
         WGy4p02axoWGuvOu40jnjVhdjt4+rUIKmc42QVWjlyRZg4uz0kahlSnrT9PPuUtM0sJw
         BGlH0x5iVOstUFhRKcKljgu3a2E0Vp7gpU4/sc9uLwfq5BzIjZfq3hh+dGJKFjrGZcxe
         nmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924918; x=1781529718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=;
        b=IM9+J1LGaph73dnbqNyt01hbkr5Tlb5AMWuseXMZ7V+045L8PxWSo6JdhkPwR9DCr8
         bRzBZBJLbP6twJqqlh3GXUZ9Rfr6U6+hPPgNiknZJK/4TW70AWG3huwPGOuF20Wc3pfJ
         YG3KmX5bJ3HXbdKWEbCkWRXzAoKL/9/yGJzL26CXt8NoWGCnsv+dBcpxYqfvLk105XT+
         WTnq27WsDey3UpqVoFQIRBL1Wi8a6ZpMp484mnjPK+PLmdtawPYUB8MAc6AyZ+Np+BQz
         gL9Fr2aiNJ0iZ4aV6aM4nEpS5FyLOHIJ1iEMFueXB5G9Y0yE78Ex7lRNK2B8mdgJ54J4
         gkvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eRT1znQSaLCrwMuF43YzdTsre6shlX4CBQEG5eM+vCuwZHT7xxII44Hpg0shpUJe1m/HA/U0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNhiw5C9j/eOVYhssJsBAhQIEvY5+fiaeVAIveAXRgOdBveU/h
	/GfoSi8wIgr9TWmpdTWUHg1woDa8zkTt678x7BCLGR5M4eIt7SfWoJgp42LIBgl5WkjVUhJsUno
	L9PXZ6YcqYKuYQIoIxz3j1NOGPyPBYygE9o9wbbpa5uPgSTx/xAjB62jS/POCYTlq
X-Gm-Gg: Acq92OHX99LyeFOsVXIkLTnYrthylPQdqrqpIBRc9PCbBPIaOlZIMgoL0h5TU2OLvtE
	YW33Stho1zOLq0RbeeGb/Ci9axpy8x+Bbasfj6LYgSqLaJVXjTpznp8EhT2if+4yaotakJFARNd
	2IkAndD9lwGneggCBdzSjGUrLgF9a7G9GQPy3ITudVsRi94iiTavCMqM6hpUm+yN7Q4zxEPjdaa
	4zWoN8pOudN2bbbalNl6Is1RSVJiqBENr3ZchYvl8zPsioSNAMIQ08N2fpLibzbNbdqSbHGN+Ie
	+SESI7yJIlEWeurLaeGF1lga9p5LnGcLfRroPQxv4ne/wFreuFn0lpy5a0/l1op0ukrgVnKT9KV
	oD6Mo2swiBYlByT/X/dL6ghHlZqgPZVJ/87fg5zw7NmZdj52x60DL5Ibi77EsfUvObafitEB3mr
	BAmVthkbkQgmM=
X-Received: by 2002:a05:7300:8cac:b0:304:ab8:f87c with SMTP id 5a478bee46e88-3077af051efmr9016479eec.12.1780924918023;
        Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
X-Received: by 2002:a05:7300:8cac:b0:304:ab8:f87c with SMTP id 5a478bee46e88-3077af051efmr9016453eec.12.1780924917534;
        Mon, 08 Jun 2026 06:21:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:35 -0700
Subject: [PATCH ath-next v2 4/4] wifi: ath: Update copyright in
 testmode_i.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-4-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX2z19DN9i3cbr
 846XUvdrzFUZNW2TgK0NMXif64CnaAUsZIFEUeu22i07iYfCUUG1yMUjFZIpH5E1/qadHB2hF1N
 G2pqxYKa38dLc4Un1hHZWHkTMkNAtxUZ7iH4MFNjHzBL0ftecdppftu8ks0USJnyHcH0zfNDomj
 dSJhWzyVJ9ooekMlDeviZER7gn0fS0tvME3f+eOaCLKnRAiP5XsgLBeMCGkYEgMujr0Eplt5onq
 SxB7YijCSNmUkUvEzySetKRAHMqj01Bd5oxl8sNjY6XLMDxw9eJnj4yhA6toGk8pCuhtumgsl2w
 xsHJBjPeVGuKaQ2zrwWWQGrn3SMH36IvACXze7VwyYaRHzesHoOgm2h7G8HjAUvcC/f3uRtoDl7
 6cZJ+XlzVXC6f0/dDmOcxniN1IZTjg9Fjzwryw2dixxlwbx3zWlOoMOALk9gDHoJycGArwsygOS
 4mlrW+FJ3zFrhhfZ7iA==
X-Proofpoint-ORIG-GUID: FSV1SDIEl41TWvvJonCvMVdjIsrra4d-
X-Proofpoint-GUID: FSV1SDIEl41TWvvJonCvMVdjIsrra4d-
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26c1f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=E4j0M03IeE_1wCd7Dv8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_142203_584030_D1D53923 
X-CRM114-Status: GOOD (  12.33  )
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

Update Qualcomm copyrights per current legal guidance.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/testmode_i.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
index 980ef2f3f05f..78109d21a655 100644
--- a/drivers/net/wireless/ath/testmode_i.h
+++ b/drivers/net/wireless/ath/testmode_i.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /* "API" level of the ath testmode interface. Bump it after every

-- 
2.43.0


