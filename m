Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8173ACD8CA8
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/J+OOATbu63FC4mSfzgPjIwoOf9EQ43EsdP/k2YTX8=; b=KJQeIgumI12cVR58GibPVcu610
	4SqdsUJQSESTr3EO/ST/j0AdpvHmb/x041f2HPb1qR3eesE22+mHOjLc6VYU6Bk6akYPV1gjl9z/Y
	MkVJwNbEsYqHrKQ6pcu2w7eyC/VMnUoWBjD5BJj2+A2tWJZAd5r4dT5HMYabu9nZiMez794TsHIq4
	Wnx6N0de4woLx3jdknikV9U7hYVsHw8mjNOYM+cDEN+0Kql0bAS/mDBknmQ3G+O9M43MRQrlJrh1y
	HXHOjjx8N0KGLvNciyW8mGSLwwzdz5rsZiS2y8dX1k4lZKLS6w+jrditBNI/piT5hNzvofu7sgJI7
	McRimZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuMc-00000005QCx-19JJ;
	Tue, 09 Jun 2026 11:11:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuMZ-00000005QCP-1uUX
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 11:11:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xgCI2245479
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/J+OOATbu63FC4mSfzgPjIwoOf9EQ43EsdP/k2YTX8=; b=H65C1MMuBK4i8zP9
	busMjCdSTJRsO85X4G6G6yWbFwAuJzMFwjpRp+NOqZL/WW0fEhweUp5FNbs2Wwli
	8VrF/ihCPFluj6PortUY+nfs+rdYwMjAMXlek7BGK8HvECzq5AY9hd2pwQMmCY+k
	JL0hTvMrsXcTAfDce19sp66D6xi+sXYFg6GdTR53U1QWepMhrb7AzQ67whIMMDDW
	9XbL/eKGsThZUHgrcSOcDfZr+it5wMEbZlNOg6wMU1D2qcDaoyiIO4PMaXQ9WEOL
	r2UXwpAXzkkTwc1Q93aNHyMSn+6Fs6fi4FSMLud+YiIk5y2pCs+rJIIck2Aw58tp
	lTWuNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds96cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 11:11:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf2bc4371bso44169815ad.1
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 04:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003477; x=1781608277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/J+OOATbu63FC4mSfzgPjIwoOf9EQ43EsdP/k2YTX8=;
        b=GyA0YrdK2iBlfWb5fkN+zOHpjyYoNeN3jJzY/R+ZDK6QOMKf/zpt3AICzaexWGtGK+
         HdaSKUPEiPP9Al86t8a+cn9s6rdWMr9p3jcRPJzC2dviHMCsjJNe5Djw1Z1DL0L6YyoP
         HqJeEwNGIe196EC7niDG+e7AMlnJz3w6gBmGDZQNcs4TscitqXXwz0YjRWGhoEWRLAgL
         6aDKxg/Ik/mhacEnE61gfeiekKxKTVIZ2WjE2o9mth8DtikgYBygHoAtdOMqc/yJ90Hv
         YhFoW4FgNZ/A9MWTZjRNO9oQlWSNzmd11UOkQOne1bWHzT7k3PCVnd4fng6iOin8Vn59
         Crig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003477; x=1781608277;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/J+OOATbu63FC4mSfzgPjIwoOf9EQ43EsdP/k2YTX8=;
        b=CyW2dvnK8KxWVBkSybjkdA/vfSrE0EoAmq2v5wtA5lHWdWidn6qXMKQdHV2N4SLpzO
         5SYJ7AT2w5nh+Z2/NKjfRgvTPn+5U8Bgg2KHzhC64KFKzoOysVhaOxDAvYRMV4xbVEi5
         EkBYJIAT1YEC5yKnXL+0hQs0d3BPWO1AZWuyLF3v5ndmtGRhd85Q90C1+CtOxApL++2p
         hYH4M7kdwuaNlDOksCXgsy5R5jfyKKuESnwsYDcVk7JRN1AX8dShfHf5Bwd6+Z4IMivJ
         mMZ9svxBmjEiKheHxpnm6lfIQVlbVB6Ab18rxYqvuW+7IuqgWw/3sGThsKFNxS6WLA9E
         dJjg==
X-Forwarded-Encrypted: i=1; AFNElJ++gh9pdFG0VEJuwRW4sr867g02cFrGDJnfVMCpbBNrqfFzWa/ItugG+q7CK8uy40TBONhKu4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyS8AH9CKsIbXC3A+uk67JpqC4L1Q/zColUnt5trsslBAuuntgG
	HIEDdINWJWROx2f/9g8nt1j9W4EDm7LaP054so65JvxY3i4Ou6zViLAJANwovqexn19SchkMP94
	p8aoboGDIiMofZjS2HfohdNTCgGhWAuMn/du9zasda43BWFrFBBTtM1N/LPeXbeOKRlks+Q3z
X-Gm-Gg: Acq92OGSJDE5BKoGizxAgT7xCS1HQqqg2NNjTIrCLRytgaDlyC42YNYM8ikRZb0E2ns
	Z/4ToRaowpDSE4z00KHAcx/+kBHKJjBO8SOYaZRKDUs6iS58u/YbZAJ8I9gqfchxFNveAMAtE/T
	LH7F5BVh76JNhfdK692qVr9y9EaRb2VqixUsTdD8OZZUpp+UpCIi0nkvzof4IIdqDMv3MUtupT5
	sGqCisQHDWTkTqNStGU+CLqVw9oGb4lVsO4yTfNILcUIZ2dN2cpiccOjeietdP0QEDBllkhPx35
	DIdMFQZ5iM9TrCFsVKwj/TG8he6v0Vn/46J5sjO9u5MoA2O9Lvl1yjn5JFlP3Q4W01+hXPM3esZ
	IHyyZM3GX0b1G1kMubebjyTN29fkNiPlpJ3/iARE1m47trGkN1undsr+IhHxb0q8f3JeJdgMF
X-Received: by 2002:a17:902:d2c7:b0:2bf:13af:b077 with SMTP id d9443c01a7336-2c1ec9290abmr169510815ad.14.1781003477478;
        Tue, 09 Jun 2026 04:11:17 -0700 (PDT)
X-Received: by 2002:a17:902:d2c7:b0:2bf:13af:b077 with SMTP id d9443c01a7336-2c1ec9290abmr169510495ad.14.1781003476997;
        Tue, 09 Jun 2026 04:11:16 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d318sm222078575ad.15.2026.06.09.04.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:11:16 -0700 (PDT)
Message-ID: <67196fd1-4239-4c64-8c41-16704a0e5c55@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:41:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: enable
 IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
References: <20260604095831.2674298-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260604095831.2674298-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CNi5HgBzMNWnPS1V-oduH9gMW96mwnrY
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27f4d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l4s1JwOcGLE_FPx0VMUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CNi5HgBzMNWnPS1V-oduH9gMW96mwnrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNSBTYWx0ZWRfX86WKljM+/RdO
 s7Gu3a7ciaiKZNnVBJwMfIE2p2c4cw/MXl7sOnOkUwpOeoLIYthJySH89yhrBLqppO76LYbMI58
 woxw9QSWdRq6NysOFoaAvOc9cqGyFJwHLtQ5gTx4RXUn5e41/cwc3hZu3dnQEHhZ3eImFYA1d0t
 22lr17nNMdFTpAW9oIG3YfF9ytyMPeIfSeUza6ie+8pCmpnniPjXzdsBWvuq0uBxsT4cdvVGqWP
 lsiwf/gsh166Txu1lBZzbylw0CnFNmOi3Z+Fa5pCmxBqfvpyzXtlKJVjI5RsZUkibFn8yhX28j9
 yo0DXNfx8cWjRUNesrVG66sbOyco4tZPx6ygdIf1om2eTAL3uThNQlEEFL3YUinlq5EOxZ1cfN1
 pZYRExWalYVzBbXrr34fnrKZbqvXGw7+sYeHGpwnNYZPkegQt9Pd8BHfNyqTkH9+jhfNg061awu
 kXmQWXKhBuDCZcI+qcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_041119_642564_92130101 
X-CRM114-Status: GOOD (  12.52  )
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

On 6/4/2026 3:28 PM, Maharaja Kennadyrajan wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> When firmware reports NSS ratio support, SUPPORTS_VHT_EXT_NSS_BW is enabled in
> ath12k. However, IEEE80211_VHT_EXT_NSS_BW_CAPABLE must also be set to make the
> advertisement valid.
> 
> According to IEEE Std 802.11-2024, Subclause 9.4.2.156.3 (Supported VHT-MCS and
> NSS Set subfields), the VHT Extended NSS BW Capable bit indicates whether a STA
> is capable of interpreting the Extended NSS BW Support subfield of the VHT
> capabilities information field. Advertising extended NSS BW support without
> setting this capability bit is therefore invalid.
> 
> Without this change, mac80211 detects the inconsistency and logs:
> 
>    ieee80211 phy0: copying sband (band 1) due to VHT EXT NSS BW flag
> 
> This indicates that mac80211 implicitly aligns IEEE80211_VHT_EXT_NSS_BW_CAPABLE
> during ieee80211_register_hw(). Explicitly setting the bit in ath12k avoids this
> fixup and ensures capabilities are advertised correctly by the driver.
> 
> This change follows the same approach as the existing ath11k fix.
> https://lore.kernel.org/all/20211013073704.15888-1-wgong@codeaurora.org/
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 18ab9d038fad ("wifi: ath12k: add support for 160 MHz bandwidth")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

