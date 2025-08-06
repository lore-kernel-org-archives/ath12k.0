Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59570C87FCB
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtiBpRz0wprqdL+T05uhAHQTmTjB9b6wv16oJjaoicQ=; b=s5055DqtVlNz5YvWD0zGSR6nNZ
	MgT1SDoAvy4n/sIrmIy7n2CGZjHwWwv4NYo54Agn6+es6UpDyp/Z32sv1ZNPa80Kr9mAqQZGmAqET
	HPXt33zC+W56QTnNdza3bkjdeeaAbKaosJOW6jq9dcbAnyGcgNiXOjUnOHuabeE9AB8Ez/i8Wflaw
	vPpVRvhIgQ2TfYUGpz/AJm4TQM6aWtNl65oYjntINgofiq25/vrC2SH9jFXuM0aSPP92TB7K0U3yn
	CiwPKwUsiKg1Y9cPP3gdl4A3N8fVR9wwRffwfjWwp3Qlv1SanwTNkDrf2eoZNrK6bZPtWGPMooDLD
	ni45pITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9k-0000000Ezfn-06Jr;
	Wed, 06 Aug 2025 11:18:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9g-0000000EzeQ-3q8B
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FVSX011007
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=WtiBpRz0wprq
	dL+T05uhAHQTmTjB9b6wv16oJjaoicQ=; b=gj7cg3Mk4JMpuNmoDxj6Vwj37GFG
	veV/dmBD9cwZzOZTSWgvaVYtX6XMkhlKfcWrUInDWMdWIvOYvqFSedSrbzkJNCvu
	bc3+B6NXS1kAh+uIHIfY/nmY+JU/WWlF0Jjoq9oE3diU66hRQuZG3JpkZAdndWPN
	sUPNG2jRI0+PWjA7Hk+clrSlHHntadeVZTNrH57NeLdmA5fIn9AYhLFviWxHksCS
	e4O3IcZdalfsDz99dqpV3J4qPotWVogTWOtS6GnAp2IuwvJL3hSmjki8WxouMszk
	NT9i3ForXMTakFWUg+HH/rEEUjhhdJKjNAWrAF99ck5ySdPWxIQ/ua34cg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw32j28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:17:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3214259ce67so3687160a91.2
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479077; x=1755083877;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtiBpRz0wprqdL+T05uhAHQTmTjB9b6wv16oJjaoicQ=;
        b=JeQPzDzfjn0H/ixL6hst67A56oBmGxFTNIwAW8PEp3F3B6pseLwY/JGw8SLnw1GF20
         w/cZ1vX+iy+3dmxaKNH3u0ybsHc5VpceshLbLFl1d7nPsEqX3cHVTT2cX5/NyeEXIZLr
         WS41FntQy4hNTndslxsWc+4EBA/QCoTMXXGmEiJDbRsFg3vKYCuees2e8JLAYkDKV3HH
         PHbRtEJvrHJnyqDZ0vdf+HX8FhDpGkbKAEYgTxMlLEPr2eaMzl01NdZ4DqLYJMLqrDZh
         YxggCMGajBtXrtDZMZXDV7Rc503wSmZFP2JcChpIFi08rBluLA65F+sV35sQ2MasuOzw
         gyCQ==
X-Gm-Message-State: AOJu0YzTPi88JjFWlAUlRsSn7Fa2OgKAwcdk48hSAv8gnIT2+ONVOY8y
	vn0Kn6ILBXH4249Y25UYFzvriYM5muYjH82qP8tJmcsaK2XP7cvN6mqVLc1Pa11nfhBHPA5N6CY
	gPITr3zu9vStwyUlFxxkQkuRkkkuDSGlVCkVxcIBR/bAlnbfRs5j0keQQ1HY5w72gtQkKEQ13
X-Gm-Gg: ASbGnctjuKiq7HBZUqI/gCAFYZTXZdUVoJ+xwiy9YEhR7nARaeXwXG4WC/EmsRfst69
	ErNa1CPzBrl//o065F8jHpBx7Kv2dy7P0fJBP4yI2DgE/qQvn6H/F7ynLPdI6omVkXyt3QV4I8P
	h5RE1tHjOhV01JtnousdL9qjekWccaSwCz3KsuzelCg4wHwHdcj4iC0vx3IkRU8EtODvyoAt2ow
	nlOrBeGaYIZd68VdpkkSEJZW9/ix3s6FtML5ZYeZQ0mMPCtf3M87pUE522YnaF+q7N/QJ3+5/V9
	4/kfouK2vyVmb2VE4SdMlNmbGKAmfnQ99WhqSaMsc9XiSIxWym2v/iuKLzh+sQSUMxqQRGHAqX4
	ZbUKGK11O61jO2JAiEjiD60oM0js4qFLQisiGOECLzMIADhgcKkxRVCI3Z7mSBNm5G1jkQrrVvQ
	==
X-Received: by 2002:a17:90b:510b:b0:311:f99e:7f57 with SMTP id 98e67ed59e1d1-3216758d502mr2878174a91.23.1754479076970;
        Wed, 06 Aug 2025 04:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1XwnPNYoOYZYKfYeAC7wcfba4IX19JWDYTOJ++Z1aJvosC6lygulwki5g/MyHnuEzjnSJnw==
X-Received: by 2002:a17:90b:510b:b0:311:f99e:7f57 with SMTP id 98e67ed59e1d1-3216758d502mr2878135a91.23.1754479076482;
        Wed, 06 Aug 2025 04:17:56 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:17:55 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX Queue Updates
Date: Wed,  6 Aug 2025 16:47:43 +0530
Message-Id: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX+3Hiwrl6tMKh
 /LgHPVy82g9AnoOw+qDSPeQLMukOk5ktaWlvOhydEs6m9MB3tJhX1Pl5JBPoTL3wZ41/wiBU3N1
 XRewYp19DkkW6nRXiIqW/xZj5nlkuuu2HhSBzPSDsfueO58WlMp9qgErRLQ0+o6yEttXjJ5fMja
 3XnAYDGFjLLWhRM/VrXcdk5Rautig+zc0rhZL2BuJrwjLSg37dWlExsexaF/MtBHEE5n3YuQozT
 c/Wp2V9z2MaHUDCNC6C0K25bSRRFou6K8j9r+EHx/zcpBvvuj638PzS6Yc2sCF9GDeBR+ZcS8VV
 7nL10fMwhIDFPjIHBWu6p/q3LJ7bKQmGHkKSVG1hITD3cdQ8BNdcMKSqMhk4tZDy1dgB1Dgl4K7
 Lee+D+op
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=689339e6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=xkmYrVTeFEw3W4icy9sA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: mFZR7ldV-YLA2EIY58UiWhCmR52dfM0z
X-Proofpoint-ORIG-GUID: mFZR7ldV-YLA2EIY58UiWhCmR52dfM0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041801_071127_BC2F1191 
X-CRM114-Status: GOOD (  13.58  )
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

During stress test scenarios, when the REO command ring becomes full,
the RX queue update command issued during peer deletion fails due to
insufficient space. In response, the host performs a dma_unmap and
frees the associated memory. However, the hardware still retains a
reference to the same memory address. If the kernel later reallocates
this address, unaware that the hardware is still using it, it can
lead to memory corruption-since the host might access or modify
memory that is still actively referenced by the hardware.

Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
command during TID deletion to prevent memory corruption. Introduce
a new list, reo_cmd_update_rx_queue_list, in the dp structure to
track pending RX queue updates. Protect this list with
reo_rxq_flush_lock, which also ensures synchronized access to
reo_cmd_cache_flush_list. Defer memory release until hardware
confirms the virtual address is no longer in use, avoiding immediate
deallocation on command failure. Release memory for pending RX queue
updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
if hardware confirmation is not received.

Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
likelihood of ring exhaustion. Use a 1KB cache flush command for
QoS TID descriptors to improve efficiency.

Manish Dharanenthiran (2):
  wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures
  wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors

Nithyanantham Paramasivam (5):
  wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
  wifi: ath12k: Refactor RX TID deletion handling into helper function
  wifi: ath12k: Refactor RX TID buffer cleanup into helper function
  wifi: ath12k: Refactor REO command to use ath12k_dp_rx_tid_rxq
  wifi: ath12k: Fix flush cache failure during RX queue update

 drivers/net/wireless/ath/ath12k/dp.c       |   2 +
 drivers/net/wireless/ath/ath12k/dp.h       |  12 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c    | 336 ++++++++++++++-------
 drivers/net/wireless/ath/ath12k/dp_rx.h    |  18 +-
 drivers/net/wireless/ath/ath12k/hal.h      |   1 +
 drivers/net/wireless/ath/ath12k/hal_desc.h |   1 +
 drivers/net/wireless/ath/ath12k/hal_rx.c   |   3 +
 7 files changed, 251 insertions(+), 122 deletions(-)


base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028
-- 
2.17.1


