Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F356AFF8860
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=; b=sZYhS6Bkjc2Riv9qj4WUFgfkyD
	y6QJP2BSlXHxa8qP5IG7qnyzJy65t0IYoEk/qo7F7uK8CT9pz4Iv3jRa0LT+Nf7tRDjTwOwLeUFTK
	nreq0q6Cvf1fF9ZK6MRtxgGElIT/ivmo7jmpEVXncYu7gx1xQG6fcU/L0SE1yFSGciUZmZd529IGY
	xitaf814v/p7ddsYvNUJIXczZTW3CyOFFFrHz8MfEbRiIvirGoEiCLv81k8vbLjZbqP/PowBI1i/y
	8Sx/K2+rnKHtckMUWToDqjZ1S4GIiFFv86N3jI2/JCMESaIj5FHgw4jvFVletgXn6gasiG9i614te
	tnmTyajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMgi-0000000H3ub-0SIS;
	Mon, 27 Apr 2026 14:11:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMge-0000000H3tA-2aPY
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 14:11:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCp8Yq2382817
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 14:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aA8A2beOZ7PaJPh6gnoKuM
	WPVYV/5052moWZbH5LvRY=; b=pkwAw36Ho2+iE5B1Mzt8kXgT4DwZSZRo79Z+iX
	fXA9DJwzshq72ja/tCdp9dGo0QjhlPT+Oz0qRU5MsFAzIej1pb7D4rsolCheoKKH
	5v2napDN4XugCYzfh+BJc8OcPYWJCtwKYK+7iQzzsQ7C5tU2MgwvM3Df6T3ts4F4
	8NknCQnVJyLtbcEHEx+1/JZ9CVU7rsE/nI2jTUlw6ZMOqPvTrdg0jGM+lP2OHVlc
	EzNWIiBuc4Cm7uZ6/k/vG8XC3pxeUwrUW0o41junreK+EB98SJkF+hQ1d5QgMaf8
	DYnquS8MD9ta6NKbfGaIvYcahGsX3jmeVqNErWZ+R/SEIfsg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xra4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 14:11:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dbf4f678eso5902099c88.0
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299107; x=1777903907; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=;
        b=e8Rfm5I+0Yn/rEan14wsDKBp1SBtgWwHOAv5i7+577ZMz30y24KZqToIsDqqOU30nB
         95o4F0PSyZMIegKjFjLRYmyo0vWDovQ+2yhC1X+pgpxSeayE4XHw4zZJGkzz9USfj9ma
         4XuPvkyM8T8UnO1y4Nzkpq83o92mNkkOBxvHV1wDrxTx2T2jGue7WhHmgW+G3l9w6Yjr
         tFZtwPNE0fgJ9cipYgZsVViN7Gbr8yT9c6eowP0tONm4Ol3EPJEyduRLxkQBJvFC+5W+
         SJBb+LOKZEWW7rLpGJzoVZIYES6Lx01xPNpSvfLn/JiMV3nISnwAlhwCX0v4idjWnKJ/
         OVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299107; x=1777903907;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=;
        b=dwyZGT4Ffd6+/FV4qKa8bEIX8uoqc6ZHRX+WRposM9hHaE5fm+3KEDRDmIRfTL3KZW
         mysKVgXzq180rUcdNvjGYpWf3ht3WMBqUyclCXeoEUs5YqE8FzKN2ROqnMTKUd8fcyQY
         shjNBgMsBgGjFVpETNxfNDOOEN4XFnugwuaiHHqoa/Qgif1Y7BhkuZvHuFG1/ZmKSCoZ
         CK5HuzQ3YaISJ+18ueInGCB+YFfU5AFMME//Zn4s1QG7MirxYWnrZE7kl6UqFrM3eTjf
         VW6bo8AJEql28l7NyqEirFnUulqSah9RH1yCl/005lXzokzJqqfGOxeW4UISKvd5/A+D
         DgOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+lVtp7/pyOFgQqCA5xFGjOo/nSfPIAv2JSVeFXeNLEVEgG3YwRdYuPF53tS34mvWgw5s2JsE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFTfR99MbPNw3OxbAMSm5ajNNIc74Z4TH3jEvvuHnitTPXivfw
	9BtmFyqgyXmy9OOVQiWAFh6hZlm3CEFABCj8V1lZ77lCGofjJCj2WUYAby7aQ9cEjr2Wpd+KXju
	J38L8cMz2H5kbXTyljZPN/eZ5exAfk4SwPihyHNjI8wBAk6RO+jkgWGB33/oKvqXGBAJUqEfE
X-Gm-Gg: AeBDies0dwLiROKxNOQ2pbHTR5OGTbfL3uJ9TvqAdI5uhDuoQljdBvOfltxwnWOVRLD
	OAieb+ryVPo1R182IbSGma06XrzCVZA6+pg5q5UWtThI+MJH9lQExntWp+Dhfc4Xe9Y4oQXGHg2
	EuLunaDeM85g5hdYg/ujla76mA3D9QCqkTt4XIdNJopi01281SWFre3FjEEVC5WoDj0sp1t5uO+
	Qg3iX1cl5/7uSm+429U9GovruRFWv51GOJ1CGkmvBF4Zpv282LTV4YCPYC6SD3t06/y+xuV3ey7
	x/ImCfHA7QMA9wvFyiBEG5aMBgB5FS8ABwkt5yCgODxK64jSBgO5l6eZAAWg6RYtkxm8TOag18+
	kvCDBwtbvVQ8ZDt2+J177YcYdBlxtE18Tv7KKgUCSvjFtEmKefFXONfRXQF8Is9odPtVo
X-Received: by 2002:a05:7022:f016:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12c73fad616mr23542077c88.29.1777299106990;
        Mon, 27 Apr 2026 07:11:46 -0700 (PDT)
X-Received: by 2002:a05:7022:f016:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12c73fad616mr23542050c88.29.1777299106265;
        Mon, 27 Apr 2026 07:11:46 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm67154071c88.10.2026.04.27.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:11:45 -0700 (PDT)
Message-ID: <b1071639-e724-45f4-a1f0-51706acb7ccf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260427
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69ef6ea4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=m6NHjSuB-jaKV5Aw_IsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: nLzX0oFySZgV7gAmg6K_W0PdjGWSF_oc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MCBTYWx0ZWRfX/V00ORv5ogR7
 5FcBCzpAMK9cz3fRLoJJMP21OJTbik6D9/zGZH0WhPOKJlJYvqxTbB4DJZChTfogaYQZlC8958j
 iaTHAdhkwLCAYPAMbXjy/Kze2ji/aZ+5NfApNRh14Qjhta2sKOViAtvuX6cNZim/wr3nAo506Uy
 kIibwLyVwfwFLZyfR5kePBvMb/azX+EqMeFuqYZvsRbV/wyF93v5X0ygQKCIfTHblO2iwfdRHfY
 hV6gO/uV0HW03B80NcGeOkiW0HBxowC3ro/3jWg6D6FT8x13AIBvZbN0VHjwhqdbz3kKPsPFoTG
 xqouWA98XeErZKmELSbcJ+oL5rpIf27dJ2iwU7uM2tPnOVcVgOo2fZsTSNY2M4S0omuoktbmIM8
 bekC7eyKeXEoen2B210jkH1evbt77Per4DREZYOHYlS7+5j86N4XYDezXEMma7HSN/Hiws23jim
 L2tqU+UlTbcrUX89AQw==
X-Proofpoint-GUID: nLzX0oFySZgV7gAmg6K_W0PdjGWSF_oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_071148_681161_9852F720 
X-CRM114-Status: UNSURE (   9.44  )
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

The following changes since commit 929298742bb5dfacd53ea99cf989cc81210f90a3:

  Merge tag 'ath-next-20260408' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2026-04-08 23:26:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260427

for you to fetch changes up to 34a5329beee86a22a446e27eb37f06caa63479ca:

  wifi: ath9k: Obtain system GPIOS from descriptors (2026-04-22 06:57:12 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #1)

For ath9k:
- improve the GPIO interface.

For ath12k:
- replace dynamic memory allocation in WMI rx path
- avoid buffer overread when configuring IRQs
- code housekeeping

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Fix invalid IRQ requests during AHB probe

Jeff Johnson (3):
      wifi: ath12k: Fix HTC prototype ath12k_base parameters
      wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature
      wifi: ath12k: Remove macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS

Linus Walleij (1):
      wifi: ath9k: Obtain system GPIOS from descriptors

Nicolas Escande (1):
      wifi: ath12k: avoid dynamic alloc when parsing wmi tb

 drivers/gpio/gpio-ath79.c                      |  57 ++++++-
 drivers/net/wireless/ath/ath12k/ahb.c          |  25 +--
 drivers/net/wireless/ath/ath12k/core.c         |   6 +
 drivers/net/wireless/ath/ath12k/dp_htt.c       |   2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h       |   2 +-
 drivers/net/wireless/ath/ath12k/htc.h          |   8 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h |   1 -
 drivers/net/wireless/ath/ath12k/wmi.c          | 217 +++++++++----------------
 drivers/net/wireless/ath/ath12k/wmi.h          |   3 +
 drivers/net/wireless/ath/ath9k/hw.c            |  33 ++--
 drivers/net/wireless/ath/ath9k/hw.h            |   3 +-
 11 files changed, 188 insertions(+), 169 deletions(-)

