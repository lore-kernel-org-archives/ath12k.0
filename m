Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1E606A31C
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nG4T89Dq;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPW3ipfR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyTkUbBR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EmImKn6xTR7BjFAtVScQ9ClU28Zoe4LIJE5onFodCJw=; b=nG4T89DqNSm3eE
	XxDOsu++2vS8aUlSiTVbjxm0a0lgysXdd+EPcOGZSh9wtrOzXjc5qC2at6D/pWdmSoR6SrFegd7+g
	ACgnw5BKCRXQ/He494X8DRgUUkLx/bGiRGg3bbPBlZ5h16b29N9RwHXRM931zIWuXrwM9hLMVkY6a
	HsHo4+AoVzlss36UNxcA/5BGv7Oo/j/vQX3T6NJTa9AGFYYGZModjdBXQ8N6oxNxSnk5AAEZyejtJ
	sdlqOBKWHFZ2CMtyndv6428BaAZlylQ9WGDLrM3JWEUfOsVHMBavLJR3Xm9jDVPBo8SXFFZ3hDaU3
	DRS6c5K4Upa4B2aqCRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJBv-00000008QTV-2pWD;
	Thu, 29 Oct 2026 06:00:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJBs-00000008QSv-2eej
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 06:00:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HDxk3341413
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 06:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmImKn6xTR7BjFAtVScQ9ClU28Zoe4LIJE5onFodCJw=; b=CPW3ipfRgB2GUOOf
	R/v7LzBQWuoHoz6MIgHk5xhFHA8B1Fsj8N4r6t8r9M7RNA6XhjsGS/6NRfwmnw70
	w/e/+b+ItFBRPmWGpHiQ5OrEJEFWpuywn4OW86gIm3fBRhd0Qz0XDNVTo8cuT5di
	ZUQyTuR0AHnrWuo2jVgADB/ryUes9A5tu4KJOwLzgVRC2ByYWj8roLoRt2wlMM8k
	4ZrKIYI7vNvlE/n00OnIgE04a8qU/iZ/t5HnNKU3tCGcZkx+Jho7E/5O1P6HDvTn
	zXQSo2UtPuO3XfvWgWaqbTbW2Q873NrUTwtv3f0fVpR/eSIbycwF/XtCmQYqE9qf
	2roo9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3gx3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 06:00:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so1197476a91.0
        for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793253642; x=1793858442; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmImKn6xTR7BjFAtVScQ9ClU28Zoe4LIJE5onFodCJw=;
        b=EyTkUbBRN+2kv0qIDOWnvVacdKnPO8a6kCOSMCnuUHi6Q5gCjZegL6HambDJcbM8SD
         0oCsr5srjtZ5cdJnVyRB/bEWToKglCspGNCXzzDekDEgSaAiyvWLnLo4MBk0Ui0XBtrP
         IVpuREDJRWGoquaX5XqbQ/IPzexdBRRQ1JE0WBAj/SoZ2OWwpyMGenPWg3Cs9Hf70wBp
         809lHrnpZqJev2VxAVrHKGYmOtAFdUrTEf4V4KaH8h4DrVpY9gUPsmm9MeuPXFy74pFd
         oNFJPf6cVxTdTUfccPSvGODgQP1IzTEvUfsSnDrnrGahjqKc9gVmHG+KgKhaPL1uRs21
         1jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253642; x=1793858442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmImKn6xTR7BjFAtVScQ9ClU28Zoe4LIJE5onFodCJw=;
        b=ttdxNmkEsXzWui9oRXiWwgHkMRkmqmbgzLzSrENpVZ45SFFUT7IK2A+3Bv01yBY2ZN
         LZGS67lXJ5zpB84zi2/Q+LN1oOG1tSNslUwcS2jK6yU57I8xNRh/IltbeSiOcsZs1DHq
         719MiSRtTljKrEP0I/fGPfnLJLsMCzXs1hKUKVrnwLhbNpMjOIGZhpcah11EJ6xNaHsr
         bTMcd7ZhL2pMaMncTINSgoCxT1OEWjX7r2zmBEL8qoG5RRJa0wC7bHzukkAHNmx8K6ay
         nLEkKmeE9WOinU7iHzgr/2kmpOkkjpQiA6XfvJ6Ts5J5O1k94U4uYpuLn9QtKZ9G8tm4
         yvWA==
X-Gm-Message-State: AFq9FYLQ2VDYjZqDdiWGc6tHcCjTfVDbRJyaYG2to8qlojeON4G4ZQla
	7o7cmkEURcffqynBahzUhfhD/7OKtc3qKx6m/yt5OIWU5x2nFnRbfHzPzOsM/ONLTHnQ8/n/lHc
	CWpvO26hi3UHDvtNf9/JCi2WkNjpnOn/Ye/pGmvMCU51LO3GHHdVEJhLoD9sCLoQcDrkukIpK
X-Gm-Gg: AYBFou3piCNDHhAyO4A7hJ+8Sc5thIEOb3DeiU8PMpOmEAMcbUg9JFcDUfQyyxHw8S/
	thFq1Bq5p+1yGK5dAI180YMxo3Hp2yo8D/5r7L1tONBje4sFVoy3bFNUzDDp3XVOwo4Uwg6Amja
	r+kpVER2YfdteYQg4LgPXpRwXd4MSK/VDKlWYrNotaYgQ689rjEouIVK4pPWE32dIixHFDXZ3Tq
	itVhDGPmClYERU/VHDZT7CrAIRATSCzfopRvUAHiAzWYIHRPKamCxXqmwpQtEYtpkcXXB5ap1BD
	+TpMPmwBPHs6ZOhNSHC2EmM5OdAgjl+ft4FhqHHNTc/5z+KxpFSwbswW/iwqA7ZLtaOwe5CTtbJ
	zQrAXuWeGbJFp6Gf/tbclFZLNac2uxdHpt1w4L7Yc58h3vwQabD21WlvhL+LfnndPNA2qRH68Xp
	PFsmanaFg=
X-Received: by 2002:a17:90b:3eca:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ae57e2ae86mr3527310a91.4.1793253641496;
        Wed, 28 Oct 2026 23:00:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3eca:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ae57e2ae86mr3527286a91.4.1793253641022;
        Wed, 28 Oct 2026 23:00:41 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9db612sm2575016a91.17.2026.10.28.23.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:00:40 -0700 (PDT)
Message-ID: <ed272d4c-3571-4291-921c-e26aa78dec4b@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:30:36 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] wifi: ath12k: service all RX rings in an interrupt
 group
To: John Macias <dencity7@gmail.com>,
        Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
References: <20261025181955.2089498-1-dencity7@gmail.com>
 <CABkEBKZtaWkvxbhnOPBUjbh_iLx-Tyok0PskhduQk4O8qq=NVg@mail.gmail.com>
 <CA+KzPsoFGBe4PBJgjKQf-u+aeS9ckNALFjEkra_UoddRS1TPVg@mail.gmail.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <CA+KzPsoFGBe4PBJgjKQf-u+aeS9ckNALFjEkra_UoddRS1TPVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMiBTYWx0ZWRfX78h2AEwcwL1m
 OKEMbIsxhRp6kT8eZTqVsg+bME3goVbekcJUy7+4EXZDdEvqkiOKoNdxqSThdwOGYVSIRp1LuOG
 Zx19Ai0538P6n/Ph8eiNBZeQ3IoskcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMiBTYWx0ZWRfX8w2xNlePzV3F
 zTqaiKwu76mRi//ObJfA4DH5Ci/wz6Mi9OQR3eyo60sgKICU2OdoHGy/mULZtjTYGPNnbGN6KOq
 GMFi30fGGSXlgQNzhVHsQgDJWfZ62InRueoBNpC8qLbYUJ2eA5ZQxE9bgpm8IFdXO26idGCpEvM
 yrnkyiHtx1PjUkLC0bKCj1GXUYh4uFzBjC9ZWutmg+socUbhkb81u1hfDdxT7xzZODvmo86Z53+
 w/LMC1SHUbvd6shtHYq+XkFVe0mmzrICHzOJckWU016O9pFvlc08w9hQq9BwF56ayFjHMEXOzGu
 xSzYCII1+TyrDGm2VjsO4NtqZS7w8yrIEotUt9+AJTfiDUsRsEtZEhERTtcIhqt4X+qS0/0peP8
 rLFpjRP7R1/Uvv0Xmth9+0YSLh/KwJLu1t4KwQF/+8Rmuz6G1ntua9gCMEInc26UaqQWWw9YNwJ
 cxaRaT5As5cSCrL2Rqw==
X-Proofpoint-ORIG-GUID: SwOLOOLcNAgIhTgKC_znGc7P5yNg9pB0
X-Proofpoint-GUID: SwOLOOLcNAgIhTgKC_znGc7P5yNg9pB0
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2e10a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MOjrjcmSYU6aCDbe3KkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_230044_685146_94D35164 
X-CRM114-Status: GOOD (  21.34  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/2026 7:52 AM, John Macias wrote:
> Hi Tamizh,
> 
> Thanks for reviewing this. You were right to question the grouping
> itself. I am withdrawing this RFC.
> 
> The reproducer is downstream only. The submitted base and ath-next at
> 7b14c8f4a961 have at most one RX ring per interrupt group for QCN9274,
> IPQ5332 and WCN7850, and there is no QCN6432 entry in that upstream
> source. The downstream QCN6432 mask groups REO rings 2 and 3 together.
> 
> Its hybrid bus provides eight DP MSI vectors, with ext group i using
> DP vector i % 8. The mask uses groups 0-5; empty groups request no IRQ,
> leaving DP vectors 6 and 7 unused. The host programs each ring's MSI
> data from its group's vector. Moving ring 3 to group 6 therefore gives
> each RX ring its own active vector and NAPI instance while retaining
> the original single-ring handler.
> 
> That configuration now works on the Slate 7 in a short hardware test.
> The tested module was built from the 25 October single-handler source
> with only the RX mask changed. All 16 four-second single-flow downloads
> completed, at 890-1166 Mb/s; the old mask and original handler completed
> 9 of 16 in the earlier 25 October test. An eight-stream, twenty-second
> download reached 1208 Mb/s, with the slowest stream at 72 Mb/s. All
> four REO rings received traffic, and the new DP-group interrupt was
> active. No warnings were recorded in the valid runs.
> 
> The driver reload also needed a Wi-Fi reload on the Flint peer to bring
> the backhaul back, as it did for the installed module. These were short
> tests in one session, not a soak or a measurement of CPU time or
> locking cost.
> 
> Your other points hold for v2 as posted. With two busy rings and a
> budget of 1, its fixed descending order serves only the higher ring;
> the lower ring received no service over 100 polls in an offline model.
> Each rx_process() call also takes srng->lock, and an empty grouped
> ring can be visited twice. I have not measured that cost.
> 
> For the tested downstream configuration, separating the groups avoids
> the need for this RX-handler change. I plan to address the mask there.
> If QCN6432 support goes upstream, it should use a suitable per-ring
> group configuration rather than inherit this grouped-mask problem.
> 
> Thanks,
> John
> 

Thanks for pointing this out. QCN6432 has a dedicated ring-mask configuration
in upstream series, with RX rings assigned to separate interrupt groups rather
than sharing a group.

The driver allocates 15 DP MSI vectors for up to 12 interrupt groups and assigns
a separate MSI descriptor and NAPI instance to each active group. Therefore,
the grouped-mask issue described in this thread should not apply to the QCN6432 series.

Please refer to the latest patch series:
https://patchwork.kernel.org/project/linux-wireless/cover/20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com/



