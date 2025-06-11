Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B33C71136
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=; b=j3nIkxTjrpMgX5
	+xRh8I2RXmZVOMm/Rvbs8KQtbww74AIU/Xkh36XNUznQMW5bgH2REhO1cjPNZZDYP+m9wqABZSqnU
	K5Wgj5Ki2n6/hT9xY+c6sOGFOQj755wXmWeE9M6dd3iUgZcOLuILy5JPVZ3ZHm4TQ8TexpJCf0fWG
	4KVfOZP2nqSKStighTsh0aVEkKH/xyJm/1mJf4dDNAx1I0LKnHn/19/0Tz0bb5iQqj94n67RKRGdR
	pQHZHlga+dhp8XdqnNlecFun26gpvmw8tSWR543CbtJbf7gHSA5TuJBQx5PI0VKZWHkSL7KE4KX37
	qd9l24Cpi7xWUScXwzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYO-0000000B4C9-1kuo;
	Wed, 11 Jun 2025 19:56:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5S-0000000AZ7G-2uAQ
	for ath12k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEDG026020
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IzZh7++TWPnt7YAqqfAhzt
	YsaqI1nC4j1vdMdoyOJp4=; b=S9nwzEEnytmD5lsY3JIK/u2CxjjnuBzwa2Z4K+
	En/lXI5srBKNpC6TCq81bBvRIs2kl2iTorlABiOoBrB73JPxPRO8pQ2MMDXbZSdj
	/3pkzw0KNnMk80rSIpIoL/csMMouRrMWK42SGare5klQ7lMd0iMxuQskVp5JpJ3+
	quST39cipuIM/aldhh3TpSVaNg41pVuT4LY8zaftX4VNppysWhNUKaqCAuzAYWoH
	cZ0LX9sc52OrzgBBDa5dckOoW6alBlcfKTtSC+BrPlfShG3WoeMi5qL+PMuZd2Yk
	qJzzFl70vd6H16ZyCeDe9ahEZr+8wX3mE6PIcmVUTMk3pB0g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y8ed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-740270e168aso41161b3a.1
        for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658441; x=1750263241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=;
        b=T5Z+vaDSyO5iGGV40IuTUdmzHtMbNXDlWDrSnxYPZk0UXXMEwbyhxo+yov+0kurfxq
         l52Ap+/DFTzrLpUEuRo5IZzjp73TBSKa2tpYXuH0PyqXWlsxHapGmUafMS4SacdVVOl5
         rbxKNNsWT51nL5SCPbR/Rh3PFLo+cZb6p0i9vNAHeoAurT0Pgzo81rW8/eugf7uOucmB
         UC8WLAZTKnwP80oI9hg++O8e9x5zJ8WWuAv/LFAHMKvtFKWV3DML2/tB8ykL1bzELFVL
         3/gFN7LDbo2fg82UqPWKbbX/LOGj3lU2jb6B0GkiapkvuCLYZuOAyHZdFnLKLtJNKx8m
         QSQg==
X-Forwarded-Encrypted: i=1; AJvYcCWCziIKlHUyzYP867jLkVLQP6ANcnbKsScoezDmh4bNR5EL5Db87o/k3ew3HN8BAn4VS0jLsFA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8F4GVDvme3SM3ShU7tnFz2wzsu8N0/4dcfIKTkSC7S6a12+cL
	/zY4U+n14LfF3/rq/GKVtkdSG0oKKGlznbWm1Of9zgGlyHiZiFF4pe8ehzS2DknKnnoVF5XHf38
	M88oqXiuIoL6DcLWeY0AARIjih1Fc/6Pu5v9xr6dh7IA5E/hd2xn/SBKHk3xMJ4LOaZlgKFe1
X-Gm-Gg: ASbGncsCicB5ycBLYD81WeLaGhaWhM0YewYx4rm8Dj3inNreo/EgqpbgbC3pN8Tuff0
	oVB8Y3ZHUrg5r8icxRMFq5Q+9/QVxxKuVYh8S/6IEUD00l9O8tHT3owb03bCkXwmtiWEP8Zig6v
	5Zj2EIiexs3pgl+ftFqAnnB/TN2FHqKtQG6mc5vWRuffW9dFCFvlFwKDuz+l8gTUrU16nxNAzQ9
	83zlwTndeuVnwdIO4GabwfPrah2PglDot+aMnwsAnoqpm6JE1YxrMUYuerrYF7BdvxUeQtod33d
	9zNQev1KNflSYMPGpZF/RDFitpEPqSPwSKJValtFvHro1v6Xm4pDbkO/Pls=
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341549b3a.5.1749658440962;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/6SRDJJ5564j6vwuGUZRBSXLBvt48Y+4pJb7MX/NqEakaLAuxT3fRBYYzZ/dhUftkuTCdKw==
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341521b3a.5.1749658440551;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/5] wifi: ath: Add missing includes of export.h
Date: Wed, 11 Jun 2025 09:13:53 -0700
Message-Id: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGrSWgC/32NQQ6CMBREr0L+2k/aIjS68h6GBbYfaSIt9heCI
 dzdygHcTDKZmTcbMEVHDNdig0iLYxd8NvJUgBk6/yR0NntQQtWikQK7NODsZyaLtE4hJrS9vNS
 NsvJRaci7KVLv1oN5h1/d05qgzcngOIX4Oc4WeeR/uItEgWToXFmtje7VLTCX77l7mTCOZRZo9
 33/Aq7uSK3DAAAA
X-Change-ID: 20250610-ath-unused-export-df19562d1b37
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX8RtrmibenauU
 1BYgqCC+Xq3v10GTPuanf9Yuum37peW3VrAPp+PoDl72BwlPYOSBlSBPBaIX+VM5zTnBnRBld4v
 iiHYa9ZpSAI4yGEiuATIhBmaNPCLPhJ+fFuM4gr56/31+lnAc+IcbtOu1lXDAKGHYgEX1UrGky2
 IGVOLzw+7zk/XsW00mr5urSFQfmlQCKPBjAGP/VACmNHXIzj8xPr3co8ln8AG9Am+HD6hWsUrpc
 vCKdWFwPXXSnv/txiq5io91R+yC9SaI8cZBIMUI2rhIIhKdCr6GNfDucte02qqTuXYkIdqh9h+S
 qVZ/fLCMbd8xPQlDmTkmBj/K7X7+bUPs1V08cx5mbsMM6z+K3LtzWgRXTJkcu4oM9PzccFT+mC5
 dQFF731EnZFnUwCHb4K9c72EHaiTci9cJPkcYssIxUrRTJDlf9xQ7oRwRsN0E78Avj3iPkAB
X-Proofpoint-GUID: PGcR0v3E8Kgo3LRz9LoU9bp-8PVWcaNY
X-Proofpoint-ORIG-GUID: PGcR0v3E8Kgo3LRz9LoU9bp-8PVWcaNY
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6849ab4a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pn7C01q4hUtA5Nn5QkAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=645 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091402_765223_A8398404 
X-CRM114-Status: UNSURE (   9.78  )
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

commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") added a check which is now generating
warnings. Fix the ones in drivers/net/wireless/ath/...

---
Jeff Johnson (5):
      wifi: ath: Add missing include of export.h
      wifi: ath9k: Add missing include of export.h
      wifi: ath10k: Add missing include of export.h
      wifi: ath11k: Add missing include of export.h
      wifi: ath12k: Add missing include of export.h

 drivers/net/wireless/ath/ath10k/bmi.c            | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath10k/core.c           | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c            | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c         | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c         | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c            | 1 +
 drivers/net/wireless/ath/ath10k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath11k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath11k/core.c           | 2 ++
 drivers/net/wireless/ath/ath11k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath11k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath11k/debugfs.c        | 2 ++
 drivers/net/wireless/ath/ath11k/dp.c             | 2 ++
 drivers/net/wireless/ath/ath11k/fw.c             | 2 ++
 drivers/net/wireless/ath/ath11k/hal.c            | 2 ++
 drivers/net/wireless/ath/ath11k/pcic.c           | 2 ++
 drivers/net/wireless/ath/ath11k/qmi.c            | 2 ++
 drivers/net/wireless/ath/ath11k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath12k/core.c           | 2 ++
 drivers/net/wireless/ath/ath9k/common-beacon.c   | 1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    | 1 +
 drivers/net/wireless/ath/ath9k/common-init.c     | 1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c | 1 +
 drivers/net/wireless/ath/ath9k/common.c          | 1 +
 drivers/net/wireless/ath/ath9k/dynack.c          | 1 +
 drivers/net/wireless/ath/ath9k/hw.c              | 1 +
 drivers/net/wireless/ath/main.c                  | 1 +
 30 files changed, 53 insertions(+)
---
base-commit: 2b404d0c06adaeeebd355bd727ef600706b28197
change-id: 20250610-ath-unused-export-df19562d1b37


