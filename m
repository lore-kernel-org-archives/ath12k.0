Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1732CA1015
	for <ath12k@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LXrcTy7G0WcV6Osu/tYiTbRx7MyQDw5VIaQZZFiljHU=; b=34Cb8SqGzLgaFskh5eamyItpI0
	W0Y92+QEjTo8URKFAf+VnvL3BR7g5JuLt8WSR2Ypcbuu6nOfOiVzZkJz2ZKJw87HYgC1iMercLNKN
	JbEhN7whXY9rjcq3ctzrqmTk7393dg2iSc4L/I3jA0OYJnQQe+Ps46WyvbtO+v3U2IAXaXApm9uLJ
	tn2BspDUbFcvd+FKmfs56FSMGkOSH/cjWQUpDYfgNt5/TjW1s9/yar6XAYnDpreV6JzfU8PtbSVQP
	XcjsdW9i6BLEmDYF9Cd0jrkS0bRlHve/emEmUQB/dBr6Iot48U8QDmexjxhvFttSfHNA4tqCzISFp
	45KFcV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQw-00000008Ewy-1sWE;
	Thu, 04 Sep 2025 02:10:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utu6k-00000007Zjg-02In
	for ath12k@lists.infradead.org;
	Wed, 03 Sep 2025 20:29:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwxOZ007597
	for <ath12k@lists.infradead.org>; Wed, 3 Sep 2025 20:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LXrcTy7G0WcV6Osu/tYiTb
	Rx7MyQDw5VIaQZZFiljHU=; b=Udoje8NFvTCS7UJX7uZAMSr3ASXQgQs6wweMUu
	CD+tp4g3ULUA57kTcsHbkq4jKH1v5RkAUCMFdZXYcUCR/PV7Xe7RIHf9RjEElWTa
	cFUYdFWWIg9Rtm+3H8lUz6HTRIIha8nD0MgsB7JM3FyPkq3yDrEXGVg4WBTcGkrl
	4Vg2iQI8+JY4besC1fK+w3EXExsfkXI9TAXWD0T5NUWgXcZCt14NOfBMdmMzjqwS
	sVc7u7Pph3UqPvrgcbaqJYmFKvZl3849C1d18fYh4YD4P5PpeetymZqPtqiN5Tk3
	YvK/dOJSOmcZsoNYlUvTKNZ9NDS7ohBBhF8rLLBa7A5FEZbA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv57sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 03 Sep 2025 20:29:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4f8e079bc1so154150a12.3
        for <ath12k@lists.infradead.org>; Wed, 03 Sep 2025 13:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756931367; x=1757536167;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXrcTy7G0WcV6Osu/tYiTbRx7MyQDw5VIaQZZFiljHU=;
        b=rFmTx5mKwup5l1oHajYesIzwgp1k6n6MNp4e9WuFkp3rt3J8hixZ3+N6jerd1xPGPy
         6Q3q0AXbgibAuc+0KPJPuKY/IkAfLMPm8IwIJ5yWb7gVcnQ7WNA5+278k4C7c5JcDNum
         xuFxRi/OxdV83OXSM5cDYdohyO8pSnE9WO6dNqx58Ua8yFhdY9TmtY1XYP5Qc2mDAas+
         99hNP3VXoq2M7mqZt3qlqK63BM9vJkMdqJh0YLc86Vw2gZnStaVFhzbp17d3y4TCHlFq
         qyafJFvO5b5SuUx9ebotnAyLoETLzwPKcn06FSbauqypov85zSd1j6uFgd8hNBdjB3o+
         xdxA==
X-Forwarded-Encrypted: i=1; AJvYcCXe3teJwTm+QePYfudU0SJcnk5WL4aT8DoD1iEhDEr+dHvz2+dOGXWALjW6RUgadEiehkI1t5g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ycB7Z+OaXZLZSJpnKFvxsd7Mq1PRZ8X5GeT0YU94Ctpu+vQo
	+Hptbg89iuZ8KR/YyVfV7qv/7frDmEU7u606Ilfc5Tg3VoPzE7jLg47ajuzVEe2doW813FNEUls
	SIsRRHMlBpqZYLYxBShfguPyT2dKHD6VaauZYBMOd5Hmw8yowV26X1gjO/nqKF9MAlErjMQuw
X-Gm-Gg: ASbGncvEE3VScXN+ySt+zKFisfDrVpQ0X+03t/lNMx+gTuwmg4JV7EI1gPK4LOr3tQx
	xhHNgRpoCWCdZXYfz1GlS0JE3BVFkemZSNhnCbf5IPt25qe6pmiJ0nHf9ii1G0S9IHaM8FwuyJ9
	7pvBqBvqXiFup4qPsW+XAILXpV8eVsLx0EUB/3yfstkR6LQk4tkkYK/zDouXa9nQp+GGlSTIxGZ
	wE3w19GXph+zwjt3S/N8GUwzh6lVBgASYqFp2aA/m8TjNlRkNwLsCYGZ/Gug7wXmWr1CBhPFGin
	vWEG7eMAnImoEVKm+NHiMcxJ5JPoUEDtupwp3NIZ69QUNuIpLfbMvo4ZE0DpAF6spYmZhE0cKrU
	m
X-Received: by 2002:a05:6a20:3c89:b0:243:9824:26f7 with SMTP id adf61e73a8af0-243d6f3b99dmr22328012637.43.1756931367508;
        Wed, 03 Sep 2025 13:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWLCFA4e3h2HULrJci/u2sRbtYBFqxTbsBEzYXySZPoSiJ1k5AIwMaAZVutQz8XDR/THEIsA==
X-Received: by 2002:a05:6a20:3c89:b0:243:9824:26f7 with SMTP id adf61e73a8af0-243d6f3b99dmr22327968637.43.1756931366275;
        Wed, 03 Sep 2025 13:29:26 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772409e1e65sm13711254b3a.101.2025.09.03.13.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 13:29:25 -0700 (PDT)
Message-ID: <3d942fb1-e7dc-41cd-885e-a610bfcf856e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 13:29:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath12k firmware ath-20250903
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX5OSJGleiaCAH
 TUC+XxZtIMcYT9aPE5ulmr3yJVKluZlQyzHeVmQXPSzOmn2qL2sYf9XAn/nyxU6BeTpOPPe42Ph
 s4k8mM7r0TdMeJb4xJUyJiHInIkbUGn9Pbngn/vDBdDf420jVGJ7KW1HsAQivCZNtWA+7vgm2Er
 VkcXRgy4ddnS/QCXgbLCJMB0UnKZcVmzAp+eWKI4PwT18o4FC97Gcgxpj/FuWWQ0kopquiKm2Oj
 HxU+KYs7jMYrBqeOvRwESsaP6yTgRNBqwEgmcTxgqOyfb8nx4+q+uTRV1zyWb4EdlbqdBke6AfJ
 58B3ZrGJspDnZ5SyIIRmi5NQkeknPorh76e6Wo21D/iLF/oxER4ysH4oTuyKAJFtLl8dT+/d4J9
 GNxcyOhV
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b8a528 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=qVH1Mreu5pg5mNMOoWQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: D7hnR2s5U4x5oniQESK18GSG24LRfsEV
X-Proofpoint-GUID: D7hnR2s5U4x5oniQESK18GSG24LRfsEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_10,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_132930_167851_DB1D54DC 
X-CRM114-Status: GOOD (  10.82  )
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

The following changes since commit 7d59b255fba6e1c3a4b7814c028cb9f8e83e14e8:

  Merge branch 'mt7925' into 'main' (2025-09-03 15:36:06 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250903

for you to fetch changes up to 1c44d84a08bf0dfec147db6637aff593d7195b0c:

  ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1 (2025-09-03 13:23:20 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

 WHENCE                                 |    4 +
 ath12k/WCN7850/hw2.0/ncm865/Notice.txt | 3386 ++++++++++++++++++++++++++++++++
 ath12k/WCN7850/hw2.0/ncm865/amss.bin   |  Bin 0 -> 6111296 bytes
 ath12k/WCN7850/hw2.0/ncm865/m3.bin     |  Bin 0 -> 299660 bytes
 4 files changed, 3390 insertions(+)
 create mode 100644 ath12k/WCN7850/hw2.0/ncm865/Notice.txt
 create mode 100644 ath12k/WCN7850/hw2.0/ncm865/amss.bin
 create mode 100644 ath12k/WCN7850/hw2.0/ncm865/m3.bin

