Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233CCCD6E60
	for <ath12k@archiver.kernel.org>; Tue,  2 Jun 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O50jApDYHIgJb/YLiCc0daKUWGbnLsbEGopktQ8wurA=; b=b3EDcJoieQRg2jshqYqbcOfgq6
	azOAvB/t08wG/5khd28QU43cAtXU2mhM8u1etpVfnTLw59ppeF1pDvNO7sKGQqPxGP2nA1/kLQJmj
	O+w8Ft8FNdAon03guxgdzADLYhZ6vy7mLADcNo+Tj/q0vnYRyLVTwmWml0m8xjZX5ZQcr8NpFk0CZ
	IkbxTO76fPr7013huZkFOvcSKzGDKKi5dsiJSLvC0KH6ZOLTWmEQaTgZwtdbEyuYXhiJ1nxHPanmO
	4CWW+XhprM2Tio2mzU8pPqSwVVc+kEOQu0xdsdV2Nu+ca8aG0tbAtLrbM12sQ2om1M7tY7MoKNdRC
	ipFUaqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQ62-0000000DBKV-2cHq;
	Tue, 02 Jun 2026 14:27:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQ60-0000000DBJR-0L7N
	for ath12k@lists.infradead.org;
	Tue, 02 Jun 2026 14:27:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529UZlc3355398
	for <ath12k@lists.infradead.org>; Tue, 2 Jun 2026 14:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O50jApDYHIgJb/YLiCc0da
	KUWGbnLsbEGopktQ8wurA=; b=BSZKg4doFi6Yc7w23PyEnxn/ermC+HXymQi7Gx
	MTU84Gmil9/HLIKmzjmEahYtYwns6qU+JfYWVddLJIGejMzJMGl2TRTAGo1t5C/9
	ARFk7VZljBobBnQG2/hebyoAoWfqsLjmD9bzxhJAZyBQ+q0sRz2OQQd/RxgWNwRd
	n84sqh+fDfOjml3+8tPdiUmRN7TzBw+j20fBbh3zPRup0CoYCDhDngQFnTmzn2Sx
	bsXxviE5PaMbGAsvWkjuTQQajnvsyUW0NzWTlrR8rALOokUoRrv3mxg4Q4LM1ntX
	i98okuppxifQNnDcQXYI3leyR4weTvds3fVh6D2EsSqp+aoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkx92qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Jun 2026 14:27:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ec73b015so6341100eec.1
        for <ath12k@lists.infradead.org>; Tue, 02 Jun 2026 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780410474; x=1781015274; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jApDYHIgJb/YLiCc0daKUWGbnLsbEGopktQ8wurA=;
        b=TXLtmMF38foMbPY3syMZL2SJpSWQtNXKOP3vsH8bEeFxWEDGJ7ofLksm8nWVki54v2
         KsCPeeTeS6aQ0JxFvW8NuP2xxXLv07/yzsj3FbwT59RTwTQ/8ZUyifSuuH/JAvyN08CY
         iSYABXvFZmYBe0hEev0+EQSrdxdY+cAFeF/gHe0jLFL9Ja7eYnTWLbWt4RnLJE61D4Pz
         34I9V5lgkdPxSon/JIpbpWi7fLvo6lSvA72/pfPbO0t4lL2NpZ+3b5EnwALKLDQ4538T
         bq4DE+kmEMFeEaFXMgHzf7FOjbCRV+vsWDUELDfdLR/PZbobdJIhjJ5eh3SWBsxpImgS
         O99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410474; x=1781015274;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O50jApDYHIgJb/YLiCc0daKUWGbnLsbEGopktQ8wurA=;
        b=WbZnyDfM01+h9WmDuiIOn/sFswTN8R3QH+3Wvk/+G9ZqbPrn3GT4NFUdOB8ZPMvFiJ
         y7+2sdGRkXZUckg3E9MrpXuAMWuz9RbkHg5eHdcLFM3PnIXG7NDoD8/5SWBNzgepaPfT
         pQHc61dlCd5oYnrQmFg6jRaZZ57j+UmpLx5xNbKVg5dvZV4pnkgWAuK87wPsPRPc9YSm
         joEUtHlFZ9Sibrgse9DH3jZ8zt+NS+Hbc2FEvzeYn4/u/UTJSVrEhCZ2LmweDZAh0Nub
         stYAN5v4EHaXNlzGhJzsWgMOR6QrbF7Yyzf4nWP56areC9uPxMZ2jP+68upmsJkeel6N
         ct6A==
X-Forwarded-Encrypted: i=1; AFNElJ/zQXsIAPnSvvxV4+X5SoL/e9NfV5SP2y3P4+a81FYONYiCQw/hYRmxt/lVdfmkoxg5IWywpcU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUfvNe+NL3KLqefndAOH+NfUgetMob2ViEwhzGLh2saqXjzNdn
	6qz8sQHGqclpU+q8S5aHFWFMlluv+v/X/dvhFKsRLEW3xq/ZxK9mth052JWsGA5WsWC9jxomcus
	Uju19AlZyfby/NtZLa7/xQxB+d5jNzjrZ9bgsK0/N+jPZRaPdDxKWjNB84uezI6pvfagAMCS7
X-Gm-Gg: Acq92OGI555ZPoc9QSjrw9Wj+BZ09JIuC90GBVluxlzfCfe+ZHnebT/uh1H/vCKBQDr
	vyCBkl6LcfllbigPF3NRR6ltqsr2z/ouxNnHiCPR40L7fmwDWiYeAP0bFSmVjPIeLEOP5qCAn3d
	ln7c3AshVCfP0cFbcqnRpJH0kjZx1oVTYXkrlnvNsuk7xOf9N957fKp4t6Rs3Fft/oVzhDujuzc
	tk4q2+rrcQ+ibkC1XgkPT7K3JHfZ+TuSeN/aR7RiqECPuKt+jwY3skPiErYF7tlIOWXriOvOjQJ
	4zOBXevi6s6gDADHkXSF+WV5EcR/B3ZWhB61tvkhDhS1z5W7r1yQaIIO4+CfwknfG8eR7YZQFUT
	wd58rf21wxmjHwB8JhVoxC7bXIALYpdQy8YzQcwkGYkgbKydtGoleHM5GpJ1K99nyzM+p
X-Received: by 2002:a05:7300:5714:b0:304:1fb6:88fd with SMTP id 5a478bee46e88-304fa693196mr8120233eec.29.1780410474015;
        Tue, 02 Jun 2026 07:27:54 -0700 (PDT)
X-Received: by 2002:a05:7300:5714:b0:304:1fb6:88fd with SMTP id 5a478bee46e88-304fa693196mr8120214eec.29.1780410473495;
        Tue, 02 Jun 2026 07:27:53 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d06asm12573698eec.14.2026.06.02.07.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 07:27:53 -0700 (PDT)
Message-ID: <10edc8a3-4d0d-482b-9ea0-30d827f67b2e@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 07:27:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260602
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x3ODY5fiIXz83Dlyt2CF8MgrE_51bnw6
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1ee86b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=lSH6NSywkKVUnX8X2cAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: x3ODY5fiIXz83Dlyt2CF8MgrE_51bnw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEzOSBTYWx0ZWRfX2N7h/QqzY8/b
 gn8HieTxoglN9hH8L7bI27SHhVyIc9X1lBPX+IRnGKyOo1xR5S50Dc2b7GRItzTC9jb00xkyOKl
 t7sHfk8KeaItJTKbx8Uss/sHVlm+S/RuGcUDOrbqeH+HSvEUGIOtDKvasH+shzG2NOgQxIHw2rf
 e/nbl/CtdVOJcnmbOMforHrRQi65z6j2FakRmNPBPngoWvncPbfSdVyoTTMbBSfi6gH92oLdroN
 x9xsnn3bbXR/TBI27mR3BHTYL7Qxh3rUqPAI0uns3GljZ4dkNOcGOiPZw2ThvxTf33Kg0xU924m
 vJ/N1PgqKzk1y3ctcjsRuVTjw80WaoxXqKCpEwNjj9VcWUc8kSysIWKMP9bwLzeN5h7cvcBpkzw
 NJ5dSdnjbdynvMKkQ2Rzvi0I/VGNnP8Vss1dtlW9avlbTLkEwOTTd860NUdt5mm4GRui1Z5sL7O
 vXr2OFd3pnbnS33IZvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_072756_232258_709A5ADC 
X-CRM114-Status: GOOD (  10.40  )
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

The following changes since commit e7d6bd24e883bf7c328d73c99bf6bcde19bf5e61:

  Merge tag 'wireless-next-2026-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-05-28 17:05:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260602

for you to fetch changes up to 565257a857690244211d85593b2cd490ce86783a:

  wifi: ath12k: Handle 4-address EAPOL frames from WBM error path (2026-06-01 09:58:06 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #3)

In ath12k, add driver support for WDS mode.

In ath11k and ath12k, a number of cleanups and minor bug fixes.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: add hardware parameters for maximum supported clients

Aditya Kumar Singh (1):
      wifi: ath12k: Prevent incorrect vif chanctx switch when handling multi-radio contexts

Hangtian Zhu (1):
      wifi: ath12k: allow peer_id 0 in dp peer lookup

Kwan Lai Chee Hou (1):
      wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode

Miaoqing Pan (3):
      wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
      wifi: ath11k: add MSDU length validation for TKIP MIC error
      wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()

Rosen Penev (1):
      wifi: ath11k: use kzalloc_flex for struct scan_req_params

Tamizh Chelvam Raja (6):
      wifi: ath12k: Set WDS vdev parameter for 4-address station interface
      wifi: ath12k: Add support for 4-address mode
      wifi: ath12k: Add 4-address mode support for eth offload
      wifi: ath12k: Add support for 4-address NULL frame handling
      wifi: ath12k: Add support for 4-address frame notification
      wifi: ath12k: Handle 4-address EAPOL frames from WBM error path

Wei Zhang (3):
      wifi: ath11k: raise max vdevs to 4 on hardware with P2P and dual-station support
      wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
      wifi: ath12k: fix NULL deref in change_sta_links for unready link

 drivers/net/wireless/ath/ath11k/core.c             |  10 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  59 +++++-
 drivers/net/wireless/ath/ath11k/mac.c              |  72 +++----
 drivers/net/wireless/ath/ath11k/wmi.h              |   2 +-
 drivers/net/wireless/ath/ath12k/core.h             |   9 +
 drivers/net/wireless/ath/ath12k/dp_mon.c           |   6 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c          |   2 +-
 drivers/net/wireless/ath/ath12k/dp_peer.h          |   2 +
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  13 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |   3 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   4 +-
 drivers/net/wireless/ath/ath12k/hw.h               |  25 ++-
 drivers/net/wireless/ath/ath12k/mac.c              | 228 ++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.h              |   3 +
 drivers/net/wireless/ath/ath12k/peer.c             |  11 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |   3 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  95 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  41 +++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h      |   4 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  16 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c     |   4 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.h     |   1 +
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  16 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  48 ++++-
 drivers/net/wireless/ath/ath12k/wmi.c              |  47 ++++-
 drivers/net/wireless/ath/ath12k/wmi.h              |  17 ++
 27 files changed, 642 insertions(+), 115 deletions(-)

