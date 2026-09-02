Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DE4C61DFD
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bx5OJOE9oR66Z67IATW0s3UqBd7Ug7fmOWgd7byeZ/0=; b=SNugeXa5ygEfG/aiQHTkgEPJBl
	gGIkrn0zdCGWl3KsggZxaiScOn2jthr8K+gai6V5xBUBRYU6aUQBGiYnQnHs0Q+ubrQz5JQZemOoL
	cHhYGyYDQOHJBAQXQGyinmTYqxsIGQAv4nyjS/aTgnnCowLxHCr8Wi6inrw1ZY4kubz47aFl8QLkt
	MoWoQp9jBP5XA2HLZsqjqoVeRIY3ZeH9fVqRhMC5U6yj/P1kLV4MMlfi7euhd59In6PueCp7jhwUx
	sfLaZZZwDWt41nzL+LJAA2Hde0hNoRwXxH8R9L38mRFwRM+KheR8jmLWo0q1VGIha6g9AYY6io4jI
	1zn3VtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fLe-0000000DvAl-0U7o;
	Wed, 02 Sep 2026 07:25:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fLX-0000000Dv8X-08F7
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 07:25:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Wbrm695612
	for <ath12k@lists.infradead.org>; Wed, 2 Sep 2026 07:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bx5OJOE9oR66Z67IATW0s3UqBd7Ug7fmOWgd7byeZ/0=; b=apWy+54JXMRSuAJE
	bVg+E0uSPUwa4KcCpwj1SGUrXuRtrbQnOqRHxduhMWxjuypQKR3IK9AcqPyza9/h
	/Wdjipoc3lqoSQUDOfN95BLbY/tec5X2aK3jh7yIqxkWBvtsxEDDVtvDMXZKd8F9
	jZdZT+jZBikRFrfellibG0yl7Kxsby3foFnwf2xh3QY4idWTJjRQ3ZjWGlKHUrHB
	zLOftwF43zgW17dH1vp+wDKfYGYUE6wiq2b72MIx36gHV64EinFQ5d1+XGaG6w1y
	b6ulBkVzKOPjuqdt/nZrnAIYv5hi6rOl+OkRNqP8hpAbQaxizHIYzYF5neSYGamS
	i7rWZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb560xy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 07:25:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso972444a91.2
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788333921; x=1788938721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bx5OJOE9oR66Z67IATW0s3UqBd7Ug7fmOWgd7byeZ/0=;
        b=GG5QLMojCjWtuN/uj4M1fuXgEcwlz7/XTbDuFNc2x91BbbaNDy/8dwqhHQZTiFLkZD
         7qILa4q0ODpAKJEv8lAh/l/uw4qyohv14qIh1W4qwsyBylxJZr7X+Ma38XOtg9CUAprH
         OFP12q5K38xt16V9/5SGGXBnXiBF5N5QW8EGQD6KPkg0jpEX5JEn2mDdDdwtUsaluRh/
         5sd1FZireoVkPlJv3/sf5ShyuFzx6fbs8ixIQ0OqUKh1NaQingK/Oz6SBTmNOdYkLMod
         IN/dX35ZrytcXuCdC85DDZUlnGVTfeucQTvgRIRSkm8s/ID5aH6TRi6B10BaV8vHRGff
         QAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333921; x=1788938721;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bx5OJOE9oR66Z67IATW0s3UqBd7Ug7fmOWgd7byeZ/0=;
        b=CkAD7L9xWv46HpbbsWQPK/pzT8SIiL2j0VehCXc7wXX3UOWUGipHXpwMetWoBj9Z7N
         oSzWtuGzJFD/VvIiOF67DY/QG4yIqTvsYVUoxqwnoTdYPGLOVqUXxaMYcWtXrOqrAXTT
         BYqF7Q7GlSKupmrDViDCR8CP4cCJedZMxSw3T26ShqeDRaO9kwuHIVb/TjKLQcxZ9QFa
         H3PEE+mqR6pk9Vy4Ae+Hh44ZrhmJ26GlsYulL3YcY7zexsbakCab9URQl+fFWJM4pwCc
         JNao/QFRRcfl6vrR2tTMFDuSJAyl937k3bNYIXubody4fMZyDyaRdZA6o4AkdX5Y6P25
         0cJQ==
X-Forwarded-Encrypted: i=1; AKwUvByc+6WWWsnPZDwmP5eXwMk0yHwJzVo1aQmzTnOxdV/RKFyc3R8PVGwTHsThAtaZIGSHPKonfwY=@lists.infradead.org
X-Gm-Message-State: AFuF++mIIe3SlcMgAnQ7OCAlKazxJM+zCq1OTswXrSU/PQwBXWY+gJyS
	Mrqx0B+sioQlJxz4iUFTSHLYAOdNwYy/uczLYbsAdzQjoZIvZe6D3mVmR9Gvsf8eWsca+re6cGB
	semYxLz3lt25yX64ZMTxo1GvpVBXHA26EEOmcc2X85taAbJA5YlJhhU6gj4QJYL3GtxG2JEdK
X-Gm-Gg: AYBFou3igxAa41HNrCTU6hxdYHy9J5QRRh8RXKHAXRrkOBVpHBBACT3OcqHaKAW34HA
	MC/IeYiQY7KjBcQRNDS9j1fd353ft5e9Ik7IQjAhyVV6gc+ja3uL1iaKqOeSpXIlaIMgxoqTXr8
	4LOwutkFNhVPg+2lJ/nvRHEdz7Zt6w3NoHBKaHvQndpDS74GyAhx153jKVQxb/QKRmPgC/ClDUk
	LegQgolr5UE1m1iP5OdJY8b/yEK+PV3d7SdKJFPl4rdskGJAyBsLEF9seoHinxxgeVh3h1Z8aBj
	Tr+GOvs8bm5Y7QF0Asjlo1W0WylTCP8DkTbLaODb/FnSeDnTdzpIhmsohN0Ni4cxRHGmuq8ovts
	43OP6yvs/f63YAlTKkGYfQUwVY/Tz3GKD9XFIvPar
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr3932690a91.12.1788333920928;
        Wed, 02 Sep 2026 00:25:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr3932596a91.12.1788333919970;
        Wed, 02 Sep 2026 00:25:19 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bb684esm4349165eec.23.2026.09.02.00.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:25:19 -0700 (PDT)
Message-ID: <46d36161-5647-40e4-be05-33038f35bb83@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:55:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2NCBTYWx0ZWRfX9qvOY+ReEmgI
 FI4sGMp+XWRna/NZpBgMsWMtcnQkZus4/cxZyxA34VPBWQZpkwQGUUgeYLL2n0dfORKSeKR6MLs
 NEin9WIWvUAFEkhRto7EnXhdRFkbOcEd/rvnGm7h2VtJ1dduKlIjw5iQhCPpi5BLTcEhUue1q3v
 Vl+a6MIlvz2Q3F9571e9YIFHgg1CuyQRRwzgAGW43xCGhXp9W8VTf1CFlRRyM7M2IurFpBVfVqt
 gRduAplDZa/z5Z4/yRX+7RyCfA3dyPxNQNyPtxi1JrrxW+XSlhDZMpYpIo4nGNYJVzHCihM1PMO
 GLPw27NQw0uE4pyzv6ldEh2hTp1W3n1nJNlFn4qk5+cjKbaW1cbc5suHJ6Ov9Jt2D7NMqxzf1Y0
 XONhIWyD+Xi6q8Kjq5RJSivJW5Vgj97XmWUWtpU4fRbYiW8T31a0c8ZPU8AMmn99hcLhQ0VpmDm
 cD8nhs4NCpOnlaLTWRQ==
X-Proofpoint-GUID: p5w9Cc1xVg4KaZSOp38IbQQ0M4hxGQkX
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97cf61 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FAEhTdbA7TVx68QRkYkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: p5w9Cc1xVg4KaZSOp38IbQQ0M4hxGQkX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2NCBTYWx0ZWRfX+AW+z3pK/WwZ
 zvGE3umuDlt8Qau0zokYsnjofYzNADFTbmAMNfKaSPdxU98FXLyOE8ym+hiJ2sINWaRpbTQWUNd
 ZqJuCfn7hBpuq+13J7frxGeFVV65J/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_002523_214313_F86D8AF3 
X-CRM114-Status: GOOD (  14.35  )
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

On 9/1/2026 2:26 PM, Aishwarya R wrote:
> ath12k_dp_link_peer currently carries state that is not inherently
> link-specific. Both the station pointer and authorization state are
> shared across the links belonging to the same logical peer or station,
> yet are stored separately in each link peer.
> 
> This series moves ownership of these fields to structures matching their
> actual scope:
> 
>    * Store the station pointer only in ath12k_dp_peer.
>    * Store authorization state only in ath12k_sta.
> 
> Doing so eliminates duplicated state, reduces bookkeeping required when
> the state changes, and makes the ownership model clearer.
> 
> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
> updates users to retrieve it through ath12k_dp_peer.
> 
> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
> updates authorization handling accordingly.
> 
> Aishwarya R (2):
>    wifi: ath12k: store station pointer only in dp_peer
>    wifi: ath12k: move is_authorized flag to ath12k_sta
> 
>   drivers/net/wireless/ath/ath12k/core.h        |  2 +
>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
>   drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
>   drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
>   drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
>   drivers/net/wireless/ath/ath12k/peer.c        |  2 -
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
>   drivers/net/wireless/ath/ath12k/wmi.c         |  2 +-
>   10 files changed, 36 insertions(+), 84 deletions(-)
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

