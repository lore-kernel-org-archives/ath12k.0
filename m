Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A16C71157
	for <ath12k@archiver.kernel.org>; Wed, 18 Jun 2025 00:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M0UFGlCDLAmGlSRbv4ia+YpJ/DiudoV1d7kt9nUTgaY=; b=4MDRF4m6I+1s56gVgV9GVj/l7J
	SAjh5Rf3IKu1WJC5xg2qrdMDa72Fs0GsdBQUBauHced7W21FGM3BYFdhb2UESrUN4Vgqho2NOj9Zi
	l+j4xDSBjrXwrm+iUD5PLFFLxOlpqWuOBssfx71G7wgGx737AagOXcDzZLRJfNhlBSG/kquFo84Wi
	umwB3Vzek6xYAG4M8YfF1r6P3DYUGHvZxkDQjFPYT6HhcnI4TETFHrfBbTJuy3esvTfDocULISuNj
	7owVf3VUwg0PXwIZ6vLcYSQxrtekn3zVdWp0X81Kn5LgBqhDZmDCUDaJM3f2BbZfT8y2fMZukTttH
	64M+vjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRged-00000008gE2-2V36;
	Wed, 18 Jun 2025 00:27:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgeb-00000008gCv-1BLH
	for ath12k@lists.infradead.org;
	Wed, 18 Jun 2025 00:27:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEa8mY018553
	for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 00:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M0UFGlCDLAmGlSRbv4ia+Y
	pJ/DiudoV1d7kt9nUTgaY=; b=nGL1kajB0G5RdQgvMHvzMqr0claUc2qMgsKbOf
	eQ4OHmPb+0oCL57L87CZqI2/rLlM//p/OZbv8m9fp7gqyJJGfb5BRjA1/udsrlb+
	2AaOo2LkAFI2fWVEQMqC+K4CZ003hf3rsj6+KpWYyZ7nqBRr9gs7HtmnZp1aQ8BB
	/v7myCAft8EAud0iOd3/HaEhAiWcVxp683bJJ7OyjM+tmYqKyqMwzGctlDS6eo8p
	ktWNcnLoGwE7NDHOi+J8jCiw690mTjG7w2CEn+CjRdyx1TlstRZDJHh6YBGiJQup
	tYszus5Ni/hQgOTUAN8gCcGJ6bu6KDPhTpwd0YiFQ4ugQeyQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfj8b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 00:27:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af59547f55bso3725238a12.0
        for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 17:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750206468; x=1750811268;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UFGlCDLAmGlSRbv4ia+YpJ/DiudoV1d7kt9nUTgaY=;
        b=byqcbT9vYCQhr8s534fqiQbJw50k1Mu/1PsU50bTNFB79UrBbJ9twWufzvewS+Dyic
         L37FaRWFX4hdhsJ2NgVXE8anOejmFxl/xye/GfLpqXZeCc9uWzroW0mw6lsF0gQ5pf/a
         Ab5jI+x+t9mYgPsMq188SnxoWGnzf1fGoNyXE9431K4ZOpA8NCRmyfzP3c40lpMnsYy5
         ikbEYUmcZ9j9LDDRzw32z573FSSjlk1zJ1ZTCa8d0PQSke+7DbUsXEOKHjQkH7XCfado
         rCH9DhGCdvIlxOQ1hPGQxAsBb0bQ0LDUeDIefx6L2j4xCzK+hA6sZ/05KSGBjik3E/7x
         DOVw==
X-Forwarded-Encrypted: i=1; AJvYcCWdI8qCAsz/HVhWpGcJw1tQg+8Gxy6WIlGO9fGJsHrxTv7r5Xp0jvrR0IwY69SR2O0mCBv+GYI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9cwg7CQ/gp2YWVFRBYqZHbswwWYxhIclUVClRFL2xershkLdV
	zbHZ1q7srwbF+MRNXHaOb6IWqTvrI5cLBDzYYojtKIxIPesNymbDbfziW+Oi81xWXi8PTsxPpDY
	c6Fjn+nklmRPxaNq3aUJDcJ6P21BpgtDspvvTTPVJM0YfztsJmoY4E6D8MYwI7jzR
X-Gm-Gg: ASbGncv4euk4ncrhBzCi2dNJnmmLMQHNnC8/pi8CL4Cxv59ICJrQdnTFeNUqB4OTH8Z
	Fm72rbhVb/qYZx0SGmvWPCwWbd635Vv5duCzjBe8+2OYfu6lSqPF9nmgqKxDUuylaDTI/zxIfSs
	CLeWc7wiEuwAuOCpgfIlcUUz8spbMtODzTcJIeW5Nl+AGf9svVozNEx+yW2Sf3fDy3X7EE9lU8h
	3cD6wlg2iDAZ7KMfEBuwoxdXbKLFGfD84u/Mn/1JyrT03BawDkwkos5p3scmzIkIvLBNlro92p8
	VBIlhT6ZabIVUhq9XVHFfDJD4tN+59+FzQCe6Cz+u+UZmquyyErV+QGlulc=
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr23328146a91.2.1750206467648;
        Tue, 17 Jun 2025 17:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE47uJ5OhWhcQUshu3iRdTlSHkJeUqFGAtI4R66G6CQxenFgnSEHCf6F2kwyiWPrYnb7iu/3g==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr23328110a91.2.1750206467179;
        Tue, 17 Jun 2025 17:27:47 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49834sm11294893a91.27.2025.06.17.17.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 17:27:46 -0700 (PDT)
Message-ID: <9fb699ae-3f30-4459-94e5-2f7bdb29177b@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 17:27:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250617
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAwMiBTYWx0ZWRfX/aWM2L9hsII3
 9P/zxVt09J4iSWJ3bcjq3+J1Sgs6wDnCnYXHKs0JQhEH9gMUXTUjlcdQnH5weIf7+2wqpwkNedh
 kqm40Pmu+E2T3usnBCGCre4B/f8+nzpz1bapZtgr8yYIfvTZxkhHeVDeWDLLvReS209gjPl/kyU
 OR+VG5WBoy8jJtp6sxysEHsiazOUFQd/7RvaKjfzqZfp9XvprxMqYc8uAfQMbIbc38jaw27x1E+
 ElwGF1KJLzDJYoQXp2y5oUhF0xSqrmXncByXFiabrsgN5HJV/WxRO6rpDuyHoQg9qIbn7UNx4tz
 dYJL74bzZk2zYDTjZyEmeWaSLcSw0FO0fsBPFiBuL1aN7+XpCyGduDTWq31lSViv251aliuec/F
 ciT7j7Bjuy4JZH+/YAqwnOhZ4Xttu+w9p0CmeDxFTh6h2VlwvjXjb50mO+r2tFzLlGEfSYHD
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68520804 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=v6iAXbONLxioC5Ttwi8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Vho0t1y4aq74hAD9Hrg2ocXusXSd-ZgV
X-Proofpoint-ORIG-GUID: Vho0t1y4aq74hAD9Hrg2ocXusXSd-ZgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_172749_353348_BE8F5C5A 
X-CRM114-Status: GOOD (  11.39  )
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

The following changes since commit 27605c8c0f69e319df156b471974e4e223035378:

  Merge tag 'net-6.16-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-06-12 09:50:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250617

for you to fetch changes up to 15d25307692312cec4b57052da73387f91a2e870:

  wifi: carl9170: do not ping device which has failed to load firmware (2025-06-17 16:28:35 -0700)

----------------------------------------------------------------
ath.git updates for v6.16-rc3

Fix the following 3 issues:

wifi: ath12k: avoid burning CPU while waiting for firmware stats
wifi: ath12k: don't activate more links than firmware supports
wifi: carl9170: do not ping device which has failed to load firmware

----------------------------------------------------------------
Baochen Qiang (10):
      wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
      wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
      wifi: ath12k: update freq range for each hardware mode
      wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
      wifi: ath12k: update link active in case two links fall on the same MAC
      wifi: ath12k: don't activate more links than firmware supports
      wifi: ath12k: fix documentation on firmware stats
      wifi: ath12k: avoid burning CPU while waiting for firmware stats
      wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_process()
      wifi: ath12k: don't wait when there is no vdev started

Bjorn Andersson (1):
      wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT and BCN_STAT

Dmitry Antipov (1):
      wifi: carl9170: do not ping device which has failed to load firmware

 drivers/net/wireless/ath/ath12k/core.c    |   4 +-
 drivers/net/wireless/ath/ath12k/core.h    |  10 +-
 drivers/net/wireless/ath/ath12k/debugfs.c |  58 ---
 drivers/net/wireless/ath/ath12k/debugfs.h |   7 -
 drivers/net/wireless/ath/ath12k/mac.c     | 394 +++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h     |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c     | 829 +++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h     | 180 ++++++-
 drivers/net/wireless/ath/carl9170/usb.c   |  19 +-
 9 files changed, 1395 insertions(+), 108 deletions(-)

