Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E4CC55182
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=; b=2gB77OuTN+xL/FOsrJzekQeGka
	Nbe0N4fZye+n/MTi3oBAUJt1hMRtRK+CMZjUGbmtQ0UsEqxqFjAFZg4xQ20KKnrDJooI352gh+AtI
	71J5FWLPp/DkLOnn5jv4IaS06FPUd9uliHSoc5XsHAaRARd5Gw7Jv5t2oD3SHlkv2B8oBhTk0eFPD
	thezgGZFLMk/nIcxPDE6a84ScXCwLQzcO6d9a6qNQCy/hUzISU4rCS5Or3wcw4R5PoxpavaxgFU62
	PlO+JFXZsh9aLuV4CwQS+mDSBiZAfwJ9rBcbQweh5JhR7ehcQsP2cCbqqLVSyKpgh4UJzUP61QCBY
	lm8fH/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzKz-00000000VPx-0Vqb;
	Mon, 03 Aug 2026 20:32:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzKw-00000000VOw-2kI3
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 20:32:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkYnn1347797
	for <ath12k@lists.infradead.org>; Mon, 3 Aug 2026 20:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awTHV+0FHJTetu7VAFUruO
	wJMsi/uWQRW6kJiJoR04s=; b=M7UU3bv8jvmuGlt360SYvXSL97ZgGhu6ieMi1t
	aclz1S9hmMS5caX8giNmy/akI3PsNwfP0lCQWC9EiUb59Q7vWwWiUnej+CukvsFU
	Ajz4Fi0NbGmR1YEZ7VIFxfBmyGip6jD8KKcrtXN7ucV6L5Dpd2dI/C5P58yhsEdE
	m3h73oWRlD+LayTt7RkROzos00sbiLErn078JI284DMr9mo2huaupdtZmlOF4Hat
	iaL/k63bBeso3m31wbyLs63p3jI9Puf+KHy1zPfLHpUGGAT11SclHBvuh45E5wAP
	x3mlXkYJvoO0kq+BMiT8i8C1MtIkV1COyMWk/pzgjRy1EUVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb3nn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 20:32:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so3943310a91.2
        for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785789157; x=1786393957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=;
        b=klVtPER06/iPGq7lW2gb2ng9CExOsfJy0EO6PDQE6XBw8ZxLFO+UTXTbdgz5Sbv0AO
         KzKaMj4k0c+jTO8/qQZJv9GSrpCmNT8AKj+xwQhXjByQMr2QvDgrtFGB6bg5OF5hrqnj
         dK1URM3H3CqqSWjhIetTl99ha7laQjyHiQmrpooVzHDcuw9jSnh22eB+1AN+eDSXwlwD
         2X8XfbmWWFbM3slTB2NqGXTG4rySD3aE0khXYhG3d9nSY0qjOaMQXOpLVflGZvgyurMp
         QY2ixI+FfjAwseklfvxH/QbeATmaCd+x4SGBzfGQILWcbDwJEoEHXfsa4uk5oU3EtxmH
         lL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785789157; x=1786393957;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=;
        b=hqBjxiQl9pQ35hqmYcrdIXxUtLvbHucrhP0Gbmk71a48cDy9iVUIa8Ooj+Vl9yKZLi
         p8XOXY0aDQ++zBXj10rNR8MdGV9a11zFJxBXhROZ9L9GInNOmhG+lxik1TPHEXM/dJxI
         VJz/YQmaMe9N42XnhkQJSPXY07Jqv/fVHQSIOARWGfT4L3A7LIgNvZpLw3wDt3aC+ksB
         jTgPqykx1L2+31rSRzlfHvj+xO9aBELyaAzEuCMqD8afCrFmOvQYUaPM2oJNAYuxqyTI
         hJiQaO9Tne9H0+H9lR92y/7mJ3HnkDuZAEEq64MBj5+ihH9wj0jTRs62CDJ0XvPKS/DX
         P+EA==
X-Forwarded-Encrypted: i=1; AHgh+RqSo9YG7KbxPs/HwAYaa4nc8VAY9LTYUH1M24lOyetgmQUBgYEO3aeBi9Lbo26919nh+6hQ8/c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9+zHNdXrf4p4Nn5XBZW8hHNGTVXCRpzeYSe6A/deWX+NYHScj
	4DAWoLxgBLKHJKhQXbMh7/7bW38ikX1cpp3Uozvrva/czvkistliBm/bn+QFIur8kFAgeOfRpkS
	0ejZuDZV8K2akyGYWooulORfy0Ff5KjkOwnlTqPU4dZXxKnbTnYB3f9P2VkjRbOTv
X-Gm-Gg: AR+sD12fA7JE2OK7ANFoMSvZSU+RQd9Njwq2GacuyR+3+5DyED6QGnaMCHdUVVj68NF
	R6WJwgceN497MWFe6LKqbXmgcyVp574teXeKvi4IO5oeVIc8am8JnwQWSBB5aBeIgtFTOZ0Tue6
	5xaGOQAFEYXD71AQN7JoQ547o02UeENRF5D0WYOpXPUZoLPwyM/PE8DT4CIZxWQjXi0KhpTPi0N
	fv28XebTHDrQ1USUmvWa+fOwoDLwKZ1voKCJhn2/rJbsN4t9sVc36j2LZm7mhHTfmJxo4Trki9H
	RMra6L0z18lwsBIZshbr9U0qaSh0gxSiD8Qw8Ue1dV7vGBLAA6b2f/Z+/13OCcvGQaZTBk/b4m5
	h5WjkXF+l6olZ0uGT0hzdsoGDSYFMw65nOUjU
X-Received: by 2002:a17:90b:4f48:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38fbc4fcf95mr10430252a91.28.1785789157426;
        Mon, 03 Aug 2026 13:32:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4f48:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38fbc4fcf95mr10430228a91.28.1785789156974;
        Mon, 03 Aug 2026 13:32:36 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm37948142c88.1.2026.08.03.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 13:32:36 -0700 (PDT)
Message-ID: <e3d855a3-94ee-496c-98f0-efa10e0138c9@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 13:32:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260803
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DVdSDH1nWks7KRbigtk3QYkSjKc1yWmD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE4MSBTYWx0ZWRfX9UDF2+Yk2V5x
 AKT+gc9EJTy5iJ9ovxxN9qmpIwbXSpgFtlfD16HndJrO7iqm592w+m3mbaVfBRQYiTitXq0mWMh
 0Ju/MD79pRBMgHu5/60TWv+6KFgGhS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE4MSBTYWx0ZWRfXzja+AA5KnBev
 sxU5bVVWL3kxNuS1Rc+oZCXeO6Uus/wnP7bwaA2sX8D9kQAVZCEYB9PCai2+AbK73BQhexn3G7j
 ciBCqHrpbI4b+ODytcNGpvCP0k6t9QZdx93ple6KJyOq4GqXqBeWbX96LPaltRbgStLyXrwSSBq
 l+kQuYdGoKeHVY97Gtg4kUQeBuCQCK7bA+/INCy0A+pFwRrk264BSVF1TJQ6xJ2x6g5MA5J/4gf
 npyppN0L72LZwJhapPibu6UA3vgmrIv2YS1CHk2We97GOjiDWbQJIKKVogtJmEy6OHAHMi11oKq
 6f37zF2UdLVFRDyPrQU+rFvbjjEguXcYdgDhsiO7z/dzzZci1eXm8d2ScTw5K8My32xeKAK1bZ5
 uHgz45+thWLWo3sZ7WewDsdF9nqlX6H3YKe4lDJ1WMNCu5P2OAnL38KzzWl09XolYADKCNbBGcq
 lLmivjzFaHG5G8wumHw==
X-Proofpoint-GUID: DVdSDH1nWks7KRbigtk3QYkSjKc1yWmD
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70fae6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=M1n47RuBD0lxbceSDO4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_133238_766770_1AE83BA0 
X-CRM114-Status: GOOD (  10.91  )
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

The following changes since commit edc84a9396acf1a0e78c46230dd0bcee1b84ac53:

  Merge tag 'wireless-2026-07-26' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-07-27 16:03:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260803

for you to fetch changes up to 4f25071afe9218aaae1c63fbf75e229aa6405319:

  wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump (2026-08-01 08:50:27 -0700)

----------------------------------------------------------------
ath.git patches for v7.3 (PR #2)

For ath12k, add MultiPD support for AHB platforms. Other than that, just an
assortment of cleanups and minor bug fixes across ath6kl, ath10k, ath11k,
and ath12k.

----------------------------------------------------------------
Aaradhana Sahu (2):
      wifi: ath12k: add AHB platform descriptor support
      wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate operations

Doruk Tan Ozturk (1):
      wifi: ath6kl: clamp assoc request/response lengths before subtracting IE offsets

Jeff Johnson (8):
      wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
      wifi: ath12k: validate TLV length in process_tpc_stats()
      wifi: ath12k: move firmware_mode enum to qmi.h
      wifi: ath12k: rename firmware_mode enum members to use QMI namespace
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix leak in ath11k_service_ready_ext_event()

Linghui Wu (2):
      wifi: ath10k: filter non-UTF testmode events
      wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump

Pavankumar Nandeshwar (2):
      wifi: ath12k: Use different RX release ring sizes as per memory profiles
      wifi: ath12k: skip MLO multicast links during crash recovery in Tx path

Reshma Immaculate Rajkumar (1):
      wifi: ath12k: fix encrypted EAPOL TX in encap offload mode

Sang-Heon Jeon (1):
      wifi: ath6kl: return 0 explicitly in ath6kl_init_upload()

ZhaoJinming (1):
      wifi: ath11k: fix resource leak on error in ext IRQ setup

 drivers/net/wireless/ath/ath10k/snoc.c        |   9 +-
 drivers/net/wireless/ath/ath10k/testmode.c    |  14 ++
 drivers/net/wireless/ath/ath11k/ahb.c         |  79 +++++++---
 drivers/net/wireless/ath/ath11k/wmi.c         |  30 +++-
 drivers/net/wireless/ath/ath12k/ahb.c         | 209 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/ahb.h         |  34 ++++-
 drivers/net/wireless/ath/ath12k/core.c        |   7 +-
 drivers/net/wireless/ath/ath12k/core.h        |  11 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   2 +-
 drivers/net/wireless/ath/ath12k/dp.h          |   3 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c       |  46 ++++++
 drivers/net/wireless/ath/ath12k/dp_tx.h       |   2 +
 drivers/net/wireless/ath/ath12k/hw.h          |   1 -
 drivers/net/wireless/ath/ath12k/mac.c         |   2 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
 drivers/net/wireless/ath/ath12k/qmi.c         |   8 +-
 drivers/net/wireless/ath/ath12k/qmi.h         |  14 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |  90 ++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  64 +++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c         |  32 +++-
 drivers/net/wireless/ath/ath6kl/cfg80211.c    |   5 +
 drivers/net/wireless/ath/ath6kl/init.c        |   2 +-
 23 files changed, 550 insertions(+), 120 deletions(-)

