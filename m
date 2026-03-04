Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF2EB7EB2
	for <ath12k@archiver.kernel.org>; Wed,  4 Mar 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KqCQTN0mpKgKHcGY9unMdelUAmpcagrmaV/BIIbHl28=; b=sUdUAKJ50WGHLsIMsgjhHQpbOM
	oGV2DwhZBMkow5J213UjzfSW4Wec9R6MdcdtaAOMMgeLITScwJvq+oUnEnKtQvD26DZG0GBcA3E4X
	RyU1Y6zeqfobWn4G669kHgPnbaBgVHsyiLqQ1PRJ5ekc9lqnQzOghkgoavYasxulXctVFZSo7Pj9T
	6qNCiEkrTM3nJ8Xr7tfsTCyGt5ajNzMBgt09FJZ/0dE+Cilnqm6mipDzEiaT/J+I/y/dT8ZW7E4a6
	YiDklZZYqNpOVvEj368EYDjVp2CqXB6fEw/Xdzzsvi4OUWgolfmBJFVOHER/xi1AIwNjMPRzgcaVf
	om5AfG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhzg-0000000GnGW-32r7;
	Wed, 04 Mar 2026 08:54:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhzc-0000000GnEG-1jSF
	for ath12k@lists.infradead.org;
	Wed, 04 Mar 2026 08:54:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SRJO945123
	for <ath12k@lists.infradead.org>; Wed, 4 Mar 2026 08:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KqCQTN0mpKgKHcGY9unMdelUAmpcagrmaV/
	BIIbHl28=; b=EMXJNdyw3CwHchkrLP9ZPgunK26GidPzXytbIx0JtFr+NhWRVxg
	p1DMq4aCDpToOopxq0Jb552T4OBbyrrkK58LZSKW5TYDMEE2htQGDeZla9jVNZvD
	NUo49ivu2CStTF/2EY3rdxhdkqhgSvqo8MGQqhu4XYZEbmFN2OKyrC8sgk89VCfN
	lUCvgC9IY7hPSthBIDBzrSJIQKKKxUyhL+tvOfTjf7ZaT9V7bdcwni3oVsjrbccI
	ShzY20KaahKaQYd2odaffHuGT72mXG8gBlFSZoBFXv2Vqx6xYk5xzqpngoRb46DA
	LGUCojGyFAn7r8A8QivojAgxMbX2LrzhaHQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfcbtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Mar 2026 08:54:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so3802858a12.1
        for <ath12k@lists.infradead.org>; Wed, 04 Mar 2026 00:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614446; x=1773219246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqCQTN0mpKgKHcGY9unMdelUAmpcagrmaV/BIIbHl28=;
        b=IWYBhWchYX35iTl1rd5t8oiIZLH6G9t+awzoQ9NJSliiqx6Fd8VjqVLen+ancly000
         kZ58SH1mdsr/JryusEjdMOGoQ+quc+iy0SWN8NytLSm6FIum/qrw6RiAhBAz/kk4gBZo
         5KBg02ws8sxawHzscddL2qvp+UfYlHAxMBxT/GaCZHwcC60cEz1pVE5RcZpqpGng+/sp
         ntXuFHh4WTIpqYouP1PgZD2DQ/P+fGl4h/+5O6Gr6hoj1oXokhMFbu39LjqrwEofCaiw
         v/Kpb6Z7gyGo6xAuLx6ICUIju7z4SlfIgHsWB29PfOEWqBv5FWljfH8oLUQ2vYM2ulMn
         awZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614446; x=1773219246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqCQTN0mpKgKHcGY9unMdelUAmpcagrmaV/BIIbHl28=;
        b=sfEEGXWoJW/Oza5VZn15/mzr8Ia38cwxGhxKsdERH5lOLjne5i/tkwQZwGdCZTRS9s
         jl0rmLJLs0O62SErn9bCKaHDatrTkS5NHmzgoSilNNONGhHVWb9ZdmNj8jSdovyy9lhW
         SKyYVHcdDdK2K/aE1fQOUk09HTsyburptX7Pep3PW18vpYl9ozU38QcMIDgV18ptXdZn
         E31r8CGQsJle5rdAomrgnb8xQX3dVCJx6cghf3PSc3DVIPSAPxOSRUEFneKqOTC03BD1
         sQtXxZ9QAHjQCkDpqVz0IUFCMOT4Q7qMA7Dm89nUkhEpe0vzj5GeaC2ZJW5fgIbPz5qA
         vdQw==
X-Forwarded-Encrypted: i=1; AJvYcCW1pJqP9yfvK8/TFpOh5qydjpa073j6x/EDKDi6YFEtqnXfXUdTimOCr496YAsGsicZJlcoeq0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQuutDZdFYxXYXmjpJDtrsMQstu6aaphzvdwLqw3YQSDZuSpBF
	o7c9rtdWCq0hZE0/FwYotAbHOg95jKO7esOmmV6/l56hDVXVDOVW8jGMrHlPIO8n7ZqArmaM3MK
	tano2D9m96ARcTNf6VYM8WCgbCBS/rfH6lrNPcA29IrcUtrbegkMlfP3ZVacQ4+AHVy9XNW4j
X-Gm-Gg: ATEYQzyGDs9n54VmTn92fk95vgnnl9C5mvVH1FwTf8LH3uvO74XDwSHo0xyiiUxwM20
	HGvJEvpEMUcVjaTgtiEKXbIe1cdmhlzQj7MThnJ8Fx1Gvv0PQG/Ci6jY19wDxod2PCifn3Xl4Qa
	+wklLmkLZRU+4kM2VrhkOfRKq6Wsn4EqWqx6TKQUQ2pQvWcvwnrElS77dMJxk+n3OLDd3PLFH3H
	hRN8Y5YmYibvXWpEZXWpk5Jb2QFJxwE+3Jdt5Nf+AxKib/2FZWXRl/SPBNj0miK8WfAEwPviNhq
	GcqE84yLpYRBpi5vjKyqUgsPIDGcsKSji6D9k63lnF0gPIeqW5O9AiBlHBXWaij4JEoc92CZlnw
	GbW/4GbsiSk+1eznYmJEKCRBibQLfK++0e0T/pUUs19YFh1D5G/2wHqVpxugf/18zzA==
X-Received: by 2002:a05:6a00:2195:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82972c9e7d7mr1219408b3a.34.1772614446179;
        Wed, 04 Mar 2026 00:54:06 -0800 (PST)
X-Received: by 2002:a05:6a00:2195:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82972c9e7d7mr1219268b3a.34.1772614437061;
        Wed, 04 Mar 2026 00:53:57 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a9dasm18205140b3a.49.2026.03.04.00.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:53:56 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v5 00/02] wifi: ieee80211/mac80211: Add UHR (802.11bn) Capability and Operation parsing helpers
Date: Wed,  4 Mar 2026 14:23:41 +0530
Message-Id: <20260304085343.1093993-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX3JACzK4XEuBt
 XZrgBWLHGbGbxpsD8JgcJL9JA0WrlF6JzZ8zNHjzNYR31Ltyy6CwSaOjg8FIFnuP/13OEVNCyRf
 uifPHgWhfdb6OrGcQMErVfww2lTp8+McwzVapUBSW6qT0hCVPtRAmgNee2/LHx5y9XqgmAjurdl
 wolTpBLQek6IBOhMl9MSa7S6WvnOB0PUlYXPzTswdynYPQbI8jMybyIKUchEKLJ03nejquTIctY
 ZAviJ+ZnW8JN0b7tImV5luHgMc5u8kiJEI3ZuxxfniYMOTqgBOv+S3SeZskXQY04fXTvSHZAyIJ
 Kv3buZ62GrVuATCzP+J49x3jwRVS3oeN8aQutVUgmpKJKuELBXEobl1E/Y/VqAuQyxA1+QfIyJ/
 g+RKSbRXN+MIn6nipFt+0Aom/M01aO7Y1gb3l/AK7F7f6amdrJuMb+Sbk+NLoLmPj4NoxcKcEQa
 wCD+Nn0PchSi6eOTnyA==
X-Proofpoint-ORIG-GUID: l7Lf5Bsh9wP2PKKqC7CwOCobSrxhuK0p
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f32f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=syIFNRD9xIPPAOLOExcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: l7Lf5Bsh9wP2PKKqC7CwOCobSrxhuK0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_005408_587147_573AA8A7 
X-CRM114-Status: GOOD (  10.73  )
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

This series covers support for UHR capability and operation (11bn)
parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.

The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
There may be changes in the code to adopt upcoming 11bn spec changes.

Karthikeyan Kathirvel (2):
  wifi: UHR: define DPS/DBE/P-EDCA elements and fix size parsing
  wifi: mac80211_hwsim: Add UHR capabilities to the driver

 drivers/net/wireless/virtual/mac80211_hwsim.c | 246 ++++++++++++++++
 include/linux/ieee80211-uhr.h                 | 271 +++++++++++++++++-
 2 files changed, 511 insertions(+), 6 deletions(-)
---
v5:
	- Addressed Johannes's comments
	- Modified hwsim UHR MAC and PHY Caps as per spec

v4:
	- Addressed Pablo's comment on mac80211_hwsim

v3:
	- Addressed Johannes's comments
	- Removed reserved macros and unwanted
	  IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP

v2:
	- Rebased the changes on top of Johannes's initial UHR commits
---

base-commit: 0314e382cf02983eb3c33ac537ad9701e7858bc9
-- 
2.34.1


