Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BF7D2ED17
	for <ath12k@archiver.kernel.org>; Tue, 20 Jan 2026 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TpALKUDyKAgMeTAAjE5QQAf1vwVOBRkwtHr2nPfTUYM=; b=SqpSQzaCK0n1tDVKuF3wQDQRjw
	YufoapZcgyeaXl22QbexHHBjGA0fvUWaXW9aCM0tN/YYBxbe2Sri2u6gxy/H5D02f3r7MZqK8AZUc
	5zBPAsYzMJKWougYDpmW+6P0BewoMnyq2dHXTkO1C7x45T2ucDJSmD5njhNUpI4CpFXbrpmOtrgBV
	gHKkxLqo4CNxx2Sp7tho9e3REyXGpkF/2wgnpn/hfwMv16wSjzsVx+kJn75b0hpL6QcP46GbzA7jp
	dyVhKvn/YEQVkYlhyn9sg3D7jW7fvsfqpqf3ISp+VHIGAHM8/pCevIScqLcn3zmMKTfgR5k9yXRv9
	S29x/Mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDZX-000000044jg-3FN4;
	Tue, 20 Jan 2026 15:23:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDZV-000000044ib-1HOF
	for ath12k@lists.infradead.org;
	Tue, 20 Jan 2026 15:23:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KETOk81408539
	for <ath12k@lists.infradead.org>; Tue, 20 Jan 2026 15:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TpALKUDyKAgMeTAAjE5QQA
	f1vwVOBRkwtHr2nPfTUYM=; b=Ue/wWwIvi6KDYaZmeHSf3Tl7N+2trCKDp/81V+
	EWxGHJM7bK3yEH7aaBX2uu+zi6W8q90vXPBijifIxHrT4KqI5c1MlymgN3D1sT27
	Fc4bexH/Mhw/l5lQ7qhxdXr8kH6B9IpVrgckN+wyhO4cEF8qrQJxcgH05KuA138+
	UqER4ivR+G98y5lt/WroRzAO7l9xSC98uhzxutJHuGUtMzOispReaae2mOPalytn
	gsKaOIioKyxXsJ01pSATWPBMyGcURlX28pZk0q/6dm5l6oaX8UTY6pCFNCVIuNof
	pSUZ16eMrBGCWkLavXcY5v13HaaemooD4WdE1Tb/xj+VosPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4y2sh3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 Jan 2026 15:23:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6ba50fc34so3172220eec.0
        for <ath12k@lists.infradead.org>; Tue, 20 Jan 2026 07:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768922586; x=1769527386; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpALKUDyKAgMeTAAjE5QQAf1vwVOBRkwtHr2nPfTUYM=;
        b=a4ZhkLv7JVD0JlDR32hSv9VOTHPWUQ5F3uECYbMA8o/cpia5mALVzXbncHhYWpNPG4
         z2yorbDKuvpLbEvkWl1WrQEALZRdlY+SWoBMZ1KcLuvJ/+7HFsNp+cROaannNdvD9xHt
         4AptR8WP7jAIaDenQMgCLfIMRKEys3FPkrSPLV9sLanrcGxuZL9SuP5cMm/GvmrhJ2UJ
         PkPtWKcgW0XLNd5czJGlG/RVGpeJqr/GLnvuTVlYaHoK74JlMvYuQJHsKvxDN/7NIaKH
         vp+OUM7drhIuzpTuhcKhSZ7Bnb9A/GUZTOWjwGbx/asxNuNs+UWE76nE2yZ5SOT7V4Gz
         j4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922586; x=1769527386;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpALKUDyKAgMeTAAjE5QQAf1vwVOBRkwtHr2nPfTUYM=;
        b=glQltHF9LmykIXVey+8hAN6362vGkNFuZBnyBbmt3OYJUQX+5+g4x4jeu4MeJTJu4M
         32Rute4cqlwERJvu7zSUjgie0zon26IWoO4LAzGJAGJ5tpRKL/F/I2IcorHK4hjrYwdY
         LzkyxyH+7oLVRXsjnY2TrVFO4ZrGVT9jLU9IXjRIU1VnTA3n9LDyYK/qkFmIWRnCkQKd
         fUfK9BTWd6KbfIZEYFUJn6bLXiJnJkBe3f7rU8Fuvfrhur6evQXCyZJS8BoR+XXabi0i
         qgt7kRoZwfwl/2gOcBtXIGKvMnCujiKElLXEIWHsL+d+PEdlISSxuOBMWdiRXeZ4EU2f
         PBWA==
X-Forwarded-Encrypted: i=1; AJvYcCWyD947iOCzUCE6j0YOyXz0MFbUmzMqYd3l1sWb1uRxHpPT8CkYFZQjglMKckXAwMmKS1nChj0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv2r3OjlPyQUAR7NFeLARAxZXKSo5Xk7lNqeqDR0f7jnFpiQ1H
	DTecYXXsFhUBf7Rb9CN+WDE79AsdL1ya8Uw2FxehQllo6cQXGAx5av4Hod8OqfCWjvWOXTUrbub
	he4Bh4JNKlfcPWTWIVChlcN/o5rPl2jXn3r7JkqeeWSCuViLRysLNEOgnQyKUF9Dt
X-Gm-Gg: AZuq6aJoom6Y0GzwWlM7bw2OZcaVVemXxTqwq/pnxsdhppsrvjjiniDF59PBRkwZ5gV
	7TgfK5EB+jfFgHGTZXTzxWKkb4RhweKL9FeqO9+JYkVWpkGIjqFR7ir/+Ab9P8XoyOmWRK2MYcH
	/+lA/owiVYFx/6QHjxkEEEVIRoVxZOhxAXWyacu1Ny90tmoV/5LBblz/9XZqPGox2JXibGJhldZ
	gEboZe6hLHCpRqQvucf/oJ33tV8ktMwpGURsZC3Re9a3EQG9n0LWr9BI6W8fQZgLOREAWWoBd6e
	Sdld6n2P18pTutxaGEe7I/fO4IIRoN1Ke3G44VpBN2SdXfIQVpFtoDbmesKrvTg5h+e8Jm7SEo5
	OY/6VKDwh1pe66r7TNPR4GzkpHRGxLk0fczNDpIQgKWGV4g==
X-Received: by 2002:a05:693c:4096:b0:2b7:110:519a with SMTP id 5a478bee46e88-2b701107280mr1114037eec.17.1768922584462;
        Tue, 20 Jan 2026 07:23:04 -0800 (PST)
X-Received: by 2002:a05:693c:4096:b0:2b7:110:519a with SMTP id 5a478bee46e88-2b701107280mr1113941eec.17.1768922582343;
        Tue, 20 Jan 2026 07:23:02 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70a036d02sm654912eec.14.2026.01.20.07.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 07:23:02 -0800 (PST)
Message-ID: <65b400ca-8526-4184-ae0b-5e24e41dab9c@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 07:23:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260120
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyNyBTYWx0ZWRfX5B58mh64eQly
 6gjaF0oTaCMPRfRgpxPY3egY3ga9Bj4jwHzmqLFkjzzczZQqaF9gmd1kpB9LfFozLGl2XH5IQok
 g9FzBq/rss0tdBzfas/mp3AGkGixwEIFhRkG4nVQLAnohLooiq1xK89qzt590YaPSFtmn3RHbm5
 UQLPdqc1sucQBjLJxtuLH2n3oy6MI8VP2nfbmsfJqSPLWlEqP0vC57/QqqUnswACLlf6wL1y4X1
 y8wAmWTj+9f6EcdxqzIpNqq1EHvg86x1Q1AY/2p3/zkl1ReufDkdgBh3Kv2+qUWlrolaqqmeQcI
 2jVUFMQBFlcwTiUf0kSt7+ase3T08CvLpA3hNKzVzjEVRLc+OjJdOmkG4i9rLLal3t6nscGCe8G
 23OUm6DM6apICmG5GwHl1rmQRYeNM+4Je4np0G2SFFWYKOZ0dkwgcK8utoDmnwww6iHjTa0Y9/X
 kyDVCUl5vSPhHhzVPWg==
X-Authority-Analysis: v=2.4 cv=Ds1bOW/+ c=1 sm=1 tr=0 ts=696f9dda cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=TO4lM5bOfp6PPmgnV6YA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rgpkQwt_zzGFV8Auj48tGNv_GlmZ6vpx
X-Proofpoint-ORIG-GUID: rgpkQwt_zzGFV8Auj48tGNv_GlmZ6vpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_072309_356209_BA74191C 
X-CRM114-Status: GOOD (  14.97  )
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

The following changes since commit 24a57985670e9dac5547e5b7731bf8e7b03d5be8:

  wifi: cfg80211: don't apply HT flags to S1G channels (2026-01-13 10:44:26 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260120

for you to fetch changes up to d8e1f4a193101a72235416f189b01131a57e26e9:

  wifi: ath12k: enable QCC2072 support (2026-01-15 17:19:42 -0800)

----------------------------------------------------------------
ath.git patches for v6.20 (#2)

Highlights for some specific drivers include:

ath11k:
Add support for Channel Frequency Response measurement.

ath12k:
Add support for the QCC2072 chipset.

And of course there is the usual set of cleanups and bug fixes across
the entire family of "ath" drivers.

----------------------------------------------------------------
Alexander Minchev (1):
      wifi: ath12k: remove redundant pci_set_drvdata() call

Alexandru Gagniuc (1):
      wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params

Baochen Qiang (18):
      wifi: ath12k: do WoW offloads only on primary link
      wifi: ath12k: refactor PCI window register access
      wifi: ath12k: refactor REO CMD ring handling
      wifi: ath12k: refactor REO status ring handling
      wifi: ath12k: fix preferred hardware mode calculation
      wifi: ath12k: refactor 320 MHz bandwidth support parsing
      wifi: ath12k: fix mac phy capability parsing
      wifi: ath12k: add hardware registers for QCC2072
      wifi: ath12k: add hardware parameters for QCC2072
      wifi: ath12k: support LPASS_SHARED target memory type
      wifi: ath12k: support downloading auxiliary ucode image for QCC2072
      wifi: ath12k: add HAL descriptor and ops for QCC2072
      wifi: ath12k: add hardware ops support for QCC2072
      wifi: ath12k: handle REO CMD ring for QCC2072
      wifi: ath12k: handle REO status ring for QCC2072
      wifi: ath12k: limit number of channels per WMI command
      wifi: ath12k: send peer meta data version to firmware
      wifi: ath12k: enable QCC2072 support

Chien Wong (1):
      wifi: ath11k: fix comment typo in monitor mode handling

Dan Carpenter (1):
      wifi: ath12k: clean up on error in ath12k_dp_setup()

Krzysztof Kozlowski (1):
      dt-bindings: net: wireless: ath11k: Combine two if:then: clauses

Miaoqing Pan (1):
      wifi: ath12k: fix PCIE_LOCAL_REG_QRTR_NODE_ID definition for QCC2072

Qian Zhang (1):
      wifi: ath11k: Fix failure to connect to a 6 GHz AP

Randy Dunlap (4):
      wifi: ath5k: debug.h: fix enum ath5k_debug_level kernel-doc
      wifi: ath9k: debug.h: fix kernel-doc bad lines and struct ath_tx_stats
      wifi: ath9k: fix kernel-doc warnings in common-debug.h
      wifi: wil6210: fix a bunch of kernel-doc warnings

Rosen Penev (1):
      wifi: ath9k: add OF dependency to AHB

Ross Vandegrift (1):
      wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1

Venkateswara Naralasetty (6):
      wifi: ath11k: Add initialization and deinitialization sequence for CFR module
      wifi: ath11k: Register debugfs for CFR configuration
      wifi: ath11k: Add support unassociated client CFR
      wifi: ath11k: Register relayfs entries for CFR dump
      wifi: ath11k: Register DBR event handler for CFR data
      wifi: ath11k: Register handler for CFR capture event

 .../bindings/net/wireless/qcom,ath11k.yaml         |    9 -
 drivers/net/wireless/ath/ath11k/Kconfig            |   11 +
 drivers/net/wireless/ath/ath11k/Makefile           |    1 +
 drivers/net/wireless/ath/ath11k/cfr.c              | 1023 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h              |  308 ++++++
 drivers/net/wireless/ath/ath11k/core.c             |   81 +-
 drivers/net/wireless/ath/ath11k/core.h             |   19 +-
 drivers/net/wireless/ath/ath11k/dbring.c           |   50 +-
 drivers/net/wireless/ath/ath11k/dbring.h           |    8 +-
 drivers/net/wireless/ath/ath11k/debug.h            |    8 +-
 drivers/net/wireless/ath/ath11k/debugfs.c          |    2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c      |  142 ++-
 drivers/net/wireless/ath/ath11k/dp.c               |   12 +-
 drivers/net/wireless/ath/ath11k/dp.h               |    1 -
 drivers/net/wireless/ath/ath11k/dp_tx.c            |    9 +-
 drivers/net/wireless/ath/ath11k/hal.c              |    3 +-
 drivers/net/wireless/ath/ath11k/hw.c               |   19 +-
 drivers/net/wireless/ath/ath11k/hw.h               |    8 +-
 drivers/net/wireless/ath/ath11k/mac.c              |   23 +-
 drivers/net/wireless/ath/ath11k/reg.c              |    9 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |  147 ++-
 drivers/net/wireless/ath/ath11k/wmi.h              |   97 +-
 drivers/net/wireless/ath/ath12k/core.h             |    3 +
 drivers/net/wireless/ath/ath12k/dp.c               |    2 +-
 drivers/net/wireless/ath/ath12k/fw.c               |   10 +-
 drivers/net/wireless/ath/ath12k/fw.h               |    3 +-
 drivers/net/wireless/ath/ath12k/hal.c              |   46 +
 drivers/net/wireless/ath/ath12k/hal.h              |   34 +
 drivers/net/wireless/ath/ath12k/hw.h               |    2 +
 drivers/net/wireless/ath/ath12k/mac.c              |    2 +-
 drivers/net/wireless/ath/ath12k/pci.c              |   18 +-
 drivers/net/wireless/ath/ath12k/pci.h              |    7 +
 drivers/net/wireless/ath/ath12k/qmi.c              |  180 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   16 +
 drivers/net/wireless/ath/ath12k/wifi7/Makefile     |    3 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |   62 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |    1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |    8 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |    3 -
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h   |   33 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  503 ++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.h    |   13 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |    8 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     |   97 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h     |   30 +-
 .../net/wireless/ath/ath12k/wifi7/hal_rx_desc.h    |   17 +
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |    8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |    1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  101 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   26 +-
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c        |    5 +
 drivers/net/wireless/ath/ath12k/wmi.c              |   54 +-
 drivers/net/wireless/ath/ath12k/wmi.h              |    7 +
 drivers/net/wireless/ath/ath12k/wow.c              |   16 +
 drivers/net/wireless/ath/ath5k/debug.h             |    4 +-
 drivers/net/wireless/ath/ath9k/Kconfig             |    2 +-
 drivers/net/wireless/ath/ath9k/common-debug.h      |    8 +-
 drivers/net/wireless/ath/ath9k/debug.h             |   15 +-
 drivers/net/wireless/ath/wil6210/wil6210.h         |   33 +-
 59 files changed, 3135 insertions(+), 236 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h

