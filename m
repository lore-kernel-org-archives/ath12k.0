Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA0EC0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2H3WUaNQwsaAb3gCGRdZw4v18QA9Nzh15V6dq6hVJc=; b=w49tKP0UP97XZzP32E/5ClDK+w
	mD9At+r81tSTiTiz/J+tXqJFpMVQsM6nTfvDAOJ3t0Ct1aoDTfSDTj18n1d3ZXTXpNmdQqyq5NPKD
	IXzMYjHGY8l2fHPfN4XWq5yn7npHJwCMgS+snkbWbFhda+JVtBrv56qwFFMKAIGWYWA4kr0p03bDU
	su2qxTnFI7ipiSpU5jZt4nyQvZ8Ve6a6dB6kgIAdzYDYFTTrA9PcWN2E+iapXkYQhgRhUQdAR3NP1
	HKiWSvByhgRMx+vJl2K831zBH3L24QOU2L+M5l2rrJrV8YCQGLUxQ+qj4cF1CXvD+QVRSJbswPBf4
	ceGEY5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSoW-00000002s6a-2uNn
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 17:22:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSoU-00000002s5G-25Ll
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 17:22:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RCkQnG016992
	for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 17:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w2H3WUaNQwsaAb3gCGRdZw4v18QA9Nzh15V
	6dq6hVJc=; b=LdUgn21xtWQ/xwoVdvmjV+LeYGILxaIaoP+gBWN201M/ldmMhAq
	ZBGq8pLf48GuuKiLBoQYCx/Fvxy2c85BzOksm8gAheCf6xIWqs4V2qNGdy2DCfjY
	LtoXUrXkx3oPDGEfUO+YOyQN9X4dx1qnyjRehe2VyVEqr9awpF3EfWLcB8MWjpa5
	QZoViASk8NH37Fl8dKC/ACdnTc/eE/F9UPfjSZzX+iDLHT9X8ggaUG8t9FxJQu45
	+XmwryYfi+mYEtDCRFaYYx1G7ZtGXuqDcvJrCTRSaORPVzwdCNFmaXJNr3h0FBlG
	eKjmLiiK+KURHVw5Vk7C+C69fGWF0z+jhXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eaecgjp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 17:22:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164fad3792so77550275ad.0
        for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 09:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998534; x=1738603334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2H3WUaNQwsaAb3gCGRdZw4v18QA9Nzh15V6dq6hVJc=;
        b=ofgT0CMuUanX4DyRydiqbiCedo/UUi/NOvOhYjw0S9RiM6LZq9TfOYHBUfntIQxAyD
         7iOUuT0D9n+ZlcnEqERDdJ6ie2DXAOsGiyt2DcX2H2EYm4GUPADXHhjGzrLusiDEoPZn
         jqtBG07Kos5eqJEfHtMjb/vtmqn/bJ49Cqch+dCkYPqp6FgJh8rFbCfwz5bWXi5m0J6F
         mTObc+bDRTMYArFQferWJEFZ1MGhckXmkE2eZatFOW1w/jPC6dBXyyDQAUIgV7AsTlG9
         W4sEGgPi7+PYQ77XNHg5XRkeF04LiWStDC6lIzWeVuaJz/nODnKxEMEIxvV13ZLPg7cF
         ZPwQ==
X-Gm-Message-State: AOJu0YwNIVsBSx6y1vkg8AEi4Ik5V3JQ4uKZ+l74nJZbWCCZN0ryOLEN
	r3NVozV3tirCmOG667xH/wccyr83equkVhw/tFiy6GswohmT1k0jtlBDKCN/ncJJ8n2ZqZmB+oM
	OVFTeVqIzxFQiIqaPvL8yPrA3BRCOYcRAPZxnz17LJAo7Yn/GY+QMwqsN2ZCmzsGXI2Wq
X-Gm-Gg: ASbGncvxrwb7f3CZi+hr43u62eh6hdQ5YwuxYUOVkB2NkaW9yZumaJe8EB1rOjp3r4o
	dAqWilRGPkkN80SLSCqZyzcD4kyd4X/YmeMjhnWFvix5Qbyq6LV6aqHuVRmrm/tAR+YbwVAasHz
	5mhMbEO+a6GpH0InfJ5b3KPSQNLmQX9nX+TorYVqXbv0O2CKcQAnR3eO3b5e1SGw63p46vXdjFX
	S6WqBID3os7hblG47Pks/+3JYexLojsF4kiEZ+q5V+udf4bjnjsIs6iu8NIsWmQh7IwrEsAo8RY
	ORoMUlc3dHwgX4SwU00qIgzTS3FNBXNY+u1GhkL8aBMykKVWMnxa+6avkqFyb0NV9pzZvnfmtur
	k90nv8tiv/XRe7dfWvgakMtvgDPIetK5f4g==
X-Received: by 2002:a05:6a20:9152:b0:1e1:aef4:9cdd with SMTP id adf61e73a8af0-1eb2145cb7cmr63636513637.1.1737998533806;
        Mon, 27 Jan 2025 09:22:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG418GSIzCDpHtOEMEZjmZHoa7ZnZu/zhFFWaiALhb8y/n8B5l7GrsF9CE0e/RWvHzzd2IBTA==
X-Received: by 2002:a05:6a20:9152:b0:1e1:aef4:9cdd with SMTP id adf61e73a8af0-1eb2145cb7cmr63636479637.1.1737998533418;
        Mon, 27 Jan 2025 09:22:13 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b2c07sm7464639b3a.40.2025.01.27.09.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 09:22:13 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH 0/2] wifi: ath12k: add support for get_txpower mac ops
Date: Mon, 27 Jan 2025 22:52:00 +0530
Message-Id: <20250127172202.1410429-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uHdQQEOw2wEOkYhFySbwVRbuc3zlyfDz
X-Proofpoint-ORIG-GUID: uHdQQEOw2wEOkYhFySbwVRbuc3zlyfDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_08,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_092218_663279_F7594557 
X-CRM114-Status: GOOD (  11.92  )
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

Currently, driver does not support get_txpower mac ops because of which
cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
gets its value from ieee80211_channel->max_reg_power. However, the final
txpower is dependent on few other parameters apart from max regulatory
supported power. It is the firmware which knows about all these parameters
and considers the minimum for each packet transmission.

Firmware reports the final TX power in firmware pdev stats which falls
under fw_stats. But currently, fw_stats is under debugfs.

Add support for get_txpower mac ops to get the TX power from firmware
leveraging fw_stats and return it accordingly.

Also, move fw_stats out of debugfs so that get_txpower mac ops can
function properly even when debugfs is disabled.

Aditya Kumar Singh (2):
  wifi: ath12k: move firmware stats out of debugfs
  wifi: ath12k: add get_txpower mac ops

 drivers/net/wireless/ath/ath12k/core.c    |  45 +++++++
 drivers/net/wireless/ath/ath12k/core.h    |   4 +
 drivers/net/wireless/ath/ath12k/debugfs.c |  44 +-----
 drivers/net/wireless/ath/ath12k/mac.c     | 155 +++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h     |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c     |  94 ++++++++++---
 6 files changed, 247 insertions(+), 98 deletions(-)


base-commit: b5aeca2e66899430827b8afcad061201f3b7861b
-- 
2.34.1


