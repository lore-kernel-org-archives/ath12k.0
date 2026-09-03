Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15677C624DA
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUCeoJ0lyz1zczGEAe/+z+la9Wo25ev9VPqfyBGxzrQ=; b=lXu6la23BRszFmAlG9Bss+LOZn
	lknwCwyhDtPEUs5nsoOJal+Tq9c3hSU6j7Ngii3lEGjGt+S+ylVdZ6k13gIiiGUe+LHUr/fBtVfZu
	2MT3XQ/Qu8cT6fHeQDypniXjwbTuIefTpJNARPBJySnadA6cy0ppBIYlsFXeknE3P0PnM6uCn3CIl
	r0kMO7eyyuLmNDylU35P7j+8gyIYmcEWCNBHU5kpqfpPKYv8bVO8hVbO2KZsH3VcBimi7YsFTWD/W
	Sdd6VPBD+ZhJzsMfgxBCw6vcsROClpuLO5v/7uyvgwaVmgcap7rz2CdV1bpDlKHJOGobR4SI8XEZc
	Y8aQzrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cht-00000000QGG-1lmT;
	Thu, 03 Sep 2026 19:02:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chr-00000000QFe-0AeW
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3DnA3958343
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUCeoJ0lyz1zczGEAe/+z+la9Wo25ev9VPqfyBGxzrQ=; b=pjCmj/a9L+ZwKiLr
	vjQbNHySTvXbMAnSIpg2TUWCLWf2DDMaIdyWZwKcHxYcWOQNx/KXf4lRA7ehPSfA
	tbkWIGxbKfpVaDLCtkT3MIpYPHagJ26sPem+YzzRBPqfLALixk8Px1MTI3ckwmTz
	PmYJRwa8rd39+1QO4dvPKRtkhTKGAs67GuNGbhvmPZUE5rdnXJDgAkUIgjHDulYf
	cObJJZOkqu1FmyqCceGRNVvbzqX2RLeyBvUHhT67Xrlwz21iN8J8SJyhWCXl8nO7
	MQlxalq1EX1JIvIszw8SLFlgWnGmPHi/xeyQibqR/aQeUwjXnhoUIce7qQUhRMXn
	lZ0bLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d12s73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso334071a12.1
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462158; x=1789066958; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUCeoJ0lyz1zczGEAe/+z+la9Wo25ev9VPqfyBGxzrQ=;
        b=LT4a6Rcpkilhh+CeIhhr7xFitL7d3W8hQgiY2mrM3D6j2jRRoNk1MOUb0+1RXv1Oyx
         k/NolcZXcl4R0r8U9LvwY8sv3IBraE90YVUlp5q+Bl1XIoCf27BBVDK/BmKdt5SdsQfr
         ZxcaltLKQ92ur0qzUN1HVKgbT2V/U4GGKgFxBiWLbVq5Okey34YyflJvzAl9gLawoNZg
         kWzgofOK86JvzfAIpFWlaic0kvtxNjccUkKtHPpTDMMWWIXLRdJK6uiQkMahayoagoXU
         shf0Ngpz7admKglZji2esOM0VfxDxkyvG2A0F7QZ9JZkvA3/3+PZc0cN6HL8MJYCO3zx
         mDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462158; x=1789066958;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUCeoJ0lyz1zczGEAe/+z+la9Wo25ev9VPqfyBGxzrQ=;
        b=SOEwpr9JSqACfggWuHCM+n2ebUeP1t6RE4qsp0X/0nw0EGMF5sddZLSZeuon/liWjv
         ALyXuIE2tODmhiaRws37XxqB5TlpN0pB64VaJgBKZmcjaUFEmVr4SkJ/JB6GQQ2UdlvB
         RnoOKNY8sql4rzMxtcuLcZVklmZylK1XKnRGJFWSsVvNHQl2i4XLqq+dhADM1K1FDKm1
         skm2l8N65g3TqQ05Yt+V0S78n5hQXKUQEx6P5XWheyUEnH8Dh43ZsNWFMwzanez38j3k
         3IB1iHvbFyKvUp+OnBxcvtyrLWcD7JgRVdH6EGipam1vyNgMHUYEdpRjrRZvWqsd3+Gd
         ysfg==
X-Forwarded-Encrypted: i=1; AKwUvBxobmtDUIUKJpDWXBqnvpMuDFoWM17sOgI7GatN0nG3Uh/cq9NckxOyGupA+Qv/lJV07Vb0iKY=@lists.infradead.org
X-Gm-Message-State: AFuF++npnX6Dvt5v2TEw+N4n24vYG+ve3DsnGSpT/Xz1Uh0A1ll+uMgc
	6dk28blJwm2eRHT+z9uUW2DQz7s6KEXmi+7HTgQYqNL3JNpGxBgtAM1Tt3JCgQU/YE9OcP6GcvW
	xRBq1dCMjl2bydcVSHLNoCYLrTlcdPLlLt5HAbI8ooDbWtHhM1ZmmG+hVzhaIrhSd
X-Gm-Gg: AYBFou2FnKByfz3fTOupW2Y3ACR/0rGXRWyu9FfoTzSP5NGR/PexPuGcP4gi0cwL0cW
	SZsZ9OoacEQZGkuKDzPFo4SHqAXByD4P51KWwSMz7D7JA3E2jKdYJSQsqeEOBISGSlueUI3oCUd
	Q7dQGH/v4SJuBafKIxfMBag0/L4bl/nNnu0TxhLtpKWvSFrjQ4sl6yI0y4Sf5uab3Q8anBnNfIb
	Kw/L2hLMgtky/f+7b7+jCLF+3d+TWi3vqG/bx1RoqrODYjzYyh9KdoYOhzVlbL15YidV0+141X8
	rrrXYABFJlBvprZI6VF2C5a0zLjWr+wF2PAczdRgWMKIVtpaWH8qsIQ5YWRtF9GxmI0+qbJOQPz
	E4n1/urySAX/yyrbHOtTJd6EtbUk1w+wDm9a6q5Z/9Sf2MOiMnDjGBfw=
X-Received: by 2002:a17:90b:5845:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-39b2620547amr889142a91.16.1788462157530;
        Thu, 03 Sep 2026 12:02:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-39b2620547amr889029a91.16.1788462156900;
        Thu, 03 Sep 2026 12:02:36 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:36 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
References: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/4] wifi: ath12k: fix timeout while waiting
 for regulatory update on bring-up
Message-Id: <178846215597.824911.15370402365282213910.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXxU4o+pJ+P0ku
 tOzVrV4XMoBV+E+gieQ+iwE+lAqxw/jMsaB2isu5PTGNYFizhyd23g1LoKcv3wjrdOPnJOxflqn
 MmiMTC8Su/gRmuw9b209sFTULrHVmfjXI2Zk44mPiRXha/98C+FDjnBazX7VG+ynLmMzGN8bK3P
 dqFYK3svRPbmdhT2TyW6zsXLPLrlKAitEfUtdTnpHXJGY+hegGJ3ZkEGrJ6a29PW2CM8d03nlVh
 d9uTYJE6OOx+kO/SpVBUE3BLt9aHdnbHOLI9WujKai1J06+QaN5dV4L4ro0Vbir7HQBaD6y7elp
 tr2WHSlkFfB0Uw/3owLYPpjM0TFnwqbOGsBySOyGNDAEo722B8UY19FneIeq5UUvweN95Bpsz6A
 Iiy6aKCjUVG6tSPQ/HdHTU6+J8qpPLmr+WFu7jtW/5abuNLlk16DaP1itOXeMq3Ddyx/XMfTaQQ
 2R9YqXmkI29S7wEqd6Q==
X-Proofpoint-ORIG-GUID: uuOE-RToAOJVQZySO9Bf164vRa_F6MZb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXwCPLICMIsWET
 AkHDzg5avjAnk5/HpxW7Yd0rRVd1NoxvcwwA94p5Gw5Cqkj3XuPjuix7Rn2xLfPMYZ5gfMW+V0X
 fwRH30JmbwOfU1QD62G2zS737M0xy4g=
X-Proofpoint-GUID: uuOE-RToAOJVQZySO9Bf164vRa_F6MZb
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99c44e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dBmMSM3fNOV455FkuikA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120239_087124_40C48454 
X-CRM114-Status: GOOD (  13.09  )
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


On Wed, 29 Jul 2026 15:18:10 +0800, Baochen Qiang wrote:
> On devices that support setting the current country code, the following
> warning is seen during driver bring-up:
> 
>   Timeout while waiting for regulatory update
> 
> This happens when the country to be set during registration is the same as
> the one already applied at boot time: the regulatory event from firmware
> gets dropped without signalling the completion, so the waiter times out.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: signal regd update completion when reg event is dropped
      commit: f2576dc0f894ef33045ba7ed057ec417988bba8a
[2/4] wifi: ath12k: use per-radio ab in ath12k_mac_hw_register()
      commit: af8d103b2b23f8cf9a1a72b15b3873bad53470df
[3/4] wifi: ath12k: protect new_alpha2 access with base_lock
      commit: 04497f2a77216f27f60463c9b3d84c3c8f2cf62c
[4/4] wifi: ath12k: skip setting country code during registration when unchanged
      commit: 8ab8a5ee16b2fcb06837039dc42405ed53866fec

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


