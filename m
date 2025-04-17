Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F4DC369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ttTa73WkTcOZWGbKb5821pi0YyqaxdkghvCg4Lt9j84=; b=MxZ534UDMMEtOX
	9ZeX1Tz/6c5e9fpRJ3CPrc3R34ypuKtAkfVd9/JrkJhmMPY1ndpC0TUufpMl+zzjZdV4xkC/dr4Nx
	Ml70lyTJW/Yi2Eafu0AKKa7eVtntoW7JJM0lb+1VgYmjA69tJbyElWtwfS0X+xQmPQk5UFZvT4EkK
	Vuus1b1GJStUp8r6sTOnfG5fz8E1HdF6liajTAGRMA7mN/OlHNtMATG3lG7tcW230GM8QJqtMnXG8
	eicee8c6QGSXADS+Yllu4iY5t8OtpeyGyYnQZKmvflfQkC7vpuM4/Q2sI4F++0p/WB6FXZ7t2LGUW
	jiQnxg5Bys0N+LlZ1CGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5I80-0000000BouH-045p;
	Thu, 17 Apr 2025 05:49:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5I7w-0000000Bot9-2fJv
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 05:49:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lAs2026106
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 05:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ttTa73WkTcOZWGbKb5821p
	i0YyqaxdkghvCg4Lt9j84=; b=FQCq3C4uV9KhOrAJY6H/88PwYhZw34zur04L/Y
	K7zGc07Pcr1w1VozWLCUVYS3713a+eJlRryQ8G8Fm0RJvpmFqtNJbW0H/JDGCpbd
	Hs/XV7to2wtjnF3VeIHrC2843xms++071ikrZJIlu/ScYHjITiJDrkns/7yeqFCL
	JPUG961AQuHS/Zd5y6wh0N1+RStSG2x1GzluzblUYBwWrueb8Lm+wPVlYnkdqLpT
	5XQFPpo80R7DWvLZ1IJn+MEzWlykbDt+hO8TysnjCwICCu6mEZgniHS8TI6ehPmA
	A7ItO5UuPBQwfy1sVA4x95kPQtKSj67TaIfHka97wlEwGWDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wntd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 05:49:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so375663a91.0
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 22:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744868969; x=1745473769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttTa73WkTcOZWGbKb5821pi0YyqaxdkghvCg4Lt9j84=;
        b=Gcr7NZ/60ZcTpovlIGH2XBuMkxRKMFdD/UsksQ35r1+mGxZ+mX6xbTp8NTQTErWFTy
         cI6NmmujktWd15DEGrZpUl1HNa1INVghmXC8TKZHtkx1yt6JxuqKcMrK7j/8i9hg2WLs
         jegC1kyarIOFRq30Om0rsx+0lcfYOYoPlhSGV8gMziTnFMajxLkz/NiNuUipS4KRLAmG
         nE161wOIczYOagsLGsmB+FfgZAPmUz4Iqdx9LSe4NBMIDcl57m1xi5A+H2jtpMHlN/L5
         MOeGy/kgSkwcqigRB2nXXb5ZN+l+3LTBBmVnEzAne5OwNvLm0Qafi2AYI6JZFK0L49EX
         0MLA==
X-Gm-Message-State: AOJu0YyfaAiKgL7d0xKyPwVtfWElCKF/0MrdB7aYzFKX1JYi32oe9ANa
	aLh5cX3iiUomtAMybwxb2UjkatbnVlyJJQUD5RIDhFvu3KkHSIdzTsrCcZ4YkTkDLu7P9TzZjx9
	dRw3j5R1Yqe77M1sCDi5iUJQb43pIBAnJD6AGF4PWCB2gnjM9AQzZmszf2R+xNUpaTPEI
X-Gm-Gg: ASbGncsvPnmVoRm+OY4Ewh/lkyDaZqEBKOzpDnN0ovnzHsA2ca4XbLt5RaAu75Iefxq
	nJFe+HNVa+2pMg3oQnekTfiJVIbwSEjCv1M12KvnKfjrc/AGYpRDs3c8Novl9c2cjGc4l5+MxfR
	8+9Bnw/y0zwLSs2JC5Kuev6M+Rq6DAkQ9brvQLnw2dyNL40qti6zaKzH0BoWynjzv9T9x2LhcLX
	SRFyPzTUj2GGVrJkQ1wBRdk91Ll5F2yfAbBQuuZS2MB18IA+15LuL0TWsQS6nDltpgiT0zLeyEb
	2mP4EO7wJTtPI0JmVjpWhMNcnRcdfU+UpY/TH4WBaR9wDBMffYicj9zrQ+nE12rucz7er1Zlf7o
	f0IlBQjk/NLdQul6lzIUH+7tvnlI0hbl9XgtO
X-Received: by 2002:a17:90b:4ec6:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30863f1a0admr6945420a91.13.1744868969096;
        Wed, 16 Apr 2025 22:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK3GAi2aYavpOLGvxBAktOxHdMPkHBYyy0K0QhpFaR5OgCOTt0l+Kzx3QK0O86NXB8BoUAEg==
X-Received: by 2002:a17:90b:4ec6:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30863f1a0admr6945393a91.13.1744868968679;
        Wed, 16 Apr 2025 22:49:28 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc47e0sm24745715ad.167.2025.04.16.22.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:49:28 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v3 0/2] wifi: ath12k: handle scan vdev
 consistently
Date: Thu, 17 Apr 2025 11:19:12 +0530
Message-Id: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFiWAGgC/43PzYrCMBAH8FeRnDeSj4lpPe17LFLSZLQBTbWpw
 UX67jsUDx4M7GXgz8z8hnmyjFPEzPabJ5uwxBzHREF/bZgfXDohj4EyU0IZAULxY3x02bvUlYC
 lo5FwjunE8Wh6BKP6FlpGy9cJaXKFf5ibB57wMbMDdYaY53H6XS8WvfZfuK7hRXPBLTbWWRChc
 eZ7zHl7u7uzHy+XLZVVLvCu2aoGpGlwDsFjMEJWNPmmSVnVJGnChqYHZ4JsQ0VT/9MUaf2O3mz
 anZcAH7RlWf4Aaa+bNLcBAAA=
X-Change-ID: 20250402-fix_scan_vdev_handling-ef5be452b949
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=6800966a cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HtmLlQNqzqJkp9_W5pEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: DD-gxqC5cTgmc-grLyIS84oZOFzfqMz5
X-Proofpoint-GUID: DD-gxqC5cTgmc-grLyIS84oZOFzfqMz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_224932_861962_BA1F1E8A 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

This series of patches addresses the handling of scan links in the ath12k
driver to improve consistency and functionality. The changes ensure that
link ID 15 is correctly used for scan operations across both ML and non-ML
interfaces. Additionally, the patches prevent scan failures by fetching
link_conf only when the link ID is valid and setting appropriate default
values for scan vdevs.

Currently, no issues have been observed; these changes are intended as a
cleanup and to ensure proper handling. For split-mac these changes are
pre-req change.

---
Changes in v3:
- Rebased on ToT.
- Link to v2: https://lore.kernel.org/r/20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com

Changes in v2:
- CCed linux-wireless list as well.
- No other changes.

---
Aditya Kumar Singh (2):
      wifi: ath12k: handle scan link during vdev create
      wifi: ath12k: Use scan link ID 15 for all scan operations

 drivers/net/wireless/ath/ath12k/mac.c | 60 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 32 deletions(-)
---
base-commit: d0bcc5eaaa611aacbffe6b2cc2fb64bfc3bdfcbc
change-id: 20250402-fix_scan_vdev_handling-ef5be452b949


