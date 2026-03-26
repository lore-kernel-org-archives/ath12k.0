Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3ED109E54F
	for <ath12k@archiver.kernel.org>; Thu, 26 Mar 2026 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=; b=nreRLn9UgYvEVliHmvYZWqk5Zp
	bcvIahOdf4XdpVuGfwnVmkzGE9n527TW/RPKy1q+8AvazL8/dtPE4WK2LdkINQ8t5pCgRMTKxtXML
	3lZsprq9uYfMYZdXKcFKa6M3mkD5z8mAVzX6tXWf2HfAnvOs2im4FHj2PLu4tF1zMWWuvcfNcRouN
	I5N+8Yv0oKGIiDPHUOBhuDxogoU+Id8k0y6Uunqjvjlr27q4cg8XqiFUdTHnbzfaZdpq5/UAS2Ulr
	T+6WJnPUILukGDV92rN5oUxjrdoBOpfmHUcB9JUWKrueS0dHHiEW8ZBNRJwV29JdyRSzh//OwxONK
	Vr5lF9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5czo-00000004iaX-1iav;
	Thu, 26 Mar 2026 05:11:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5czl-00000004iYt-2TUx
	for ath12k@lists.infradead.org;
	Thu, 26 Mar 2026 05:11:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0jPRI1554493
	for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 05:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=; b=bISMWj/gMVkNeIHS
	mMXgr3kGp77EyfFWpEE4jLYGnPt5Cs1vAMK22lc1ocwpx1tzRhFlFgOHI/WWJNoy
	917pXeduA6Jwg75oZqdfXNoTpfo0iLF3K8em2eEGZzDMdXix/XA6GI2i6kKN8aif
	kjaJD9/tSF5GLkHiGo9Sbt+7ZGlFPlzMQeaP0JI751l3Ccw7mB4kiVrK5m7+u7t1
	gLw5y0SrrutiKhxnVLOHULGE5JxplPJz64HLsfuMLlZT18aBkbBuvlgAYD8erPlx
	gRgljDy9aJexD2yJUz/HXV515iFPbbEJR6JzD8IUI5r43EeKbw2rM+CtjiKHUnJ0
	3uGMog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7ax95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 05:10:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso513050b3a.0
        for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 22:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501859; x=1775106659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=;
        b=jobB09ofEDHRvbElqdn+BhbshDtbxA7H9rGdRlTKekqXEGj4lHaG1/Au5wPQ744WWj
         MliVPdvdvZ5w1C7tRKHy7gS/0M0gxX328M5ZWvBBrGo+wsUhnyh/ScOby9hgYarbfT/J
         IcoBh3W34gYEGiWognG40OKeeUlIIUM3Y+AWlLzgm+tvWinI0dKvEdvIWWhCjpXeTglt
         fPGpXOvDqIrSfWJ4MsxNrhOwF5VUNieyZqVA/em9SYVEPhx3dbCY/YIREkaCGn/Tm1cz
         +EQPpTvGZf6TIaO+0mf9jFsDZ7y5yl8Ee/u1M2Mkc05wKGSI5w2vkw7/dtUi2u5MowPM
         9a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501859; x=1775106659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=je9xx+M2zMyO3JH9z5bTiR8KWSCvjxHfgNsRcJjClNw=;
        b=dylpfA/x8GYXZiaGO8OzWoMVil98QNmKO8KEPIbsbbvt8xq+3PUJ1klcgf2DVZEi9N
         q01VoRUpdzR/yBnClJCBE+7fg8NHLinONhCTC2F52IOLaQFqQdYaK6R0eliefrjNoo7C
         Bjpz5xK2UCGxJlFyT4WXMplt0rFSH83pGnl6n9gDqNEtJEiMORpqJ9Tq53gPsjFQ48vk
         uXDUdhXMdkZ+BHpN9Nk+rkWhtI8D8nYNOIRUYUeafVFLOHsi48zhyS3ZE6TXDkMVMC/8
         zD1V7rMvb/TMUZ6Pq20QA75WIAObM2gB+bEB1vK5cqx6NCBRq3S7xhvPuqIBv5okkMTR
         4sbw==
X-Forwarded-Encrypted: i=1; AJvYcCVa0Ckm2PXqM2hY30ZCdBpvmtlm0tPfTbrue0kLWt+o2KUTowR9ugAjEuRuzhCD4L5cee6acGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLSrXC7FeNjtffVfgmEElainySrGpGli9WhfJqT+knzGcOAc//
	seV1Nn7D11MvPAGfMUL7Gl/uZ1iAuLT28qPaGR7OKM9goG/fC1w7WyMBInrDjziodVgAii+wF/7
	zXAUJsfjaI8Ohiy53qVvy2ZcvFVR29gtOW58ZttyBB6OiqHmTNfFEoaxo8o8IjKV4
X-Gm-Gg: ATEYQzyqz+4fIjBDgxiBJA269VZ37UCldQShhk79VmZ/NmEhuDI5PYl81IqEeGFJSiQ
	tqVtNoA60d/oLss+E+SE8wWNZO8tzmLkDaiYUdkMWq0OJRJgxximHun5uUniipPwiALZZXgmAJu
	rzcheuotfGZmmHdG9OyVi/QdbIsEdadsH2NiSc2MUYxsJ0/M8nYcvGF3q1AgB3uym3zBZbUxWtI
	7noM5eABeAzG/Ignd7fFu1+WgRc7T3NVwKrGSCS8C/Uf4wEU0RpkQh35oIR04WtDl3gymktRVla
	p0oSP3oH0skMGoRKY9pfoyVisSEfgD1XBEW36WaH/YD/+I/OKgcveBC4SqGtS3Mxq8k6Sp6Dz3c
	sikzozX39ElxK77LZED81LUFPhY1Y/CIZe76RvRvP3lwexd+4dw==
X-Received: by 2002:a05:6a00:4bb3:b0:82c:7876:a027 with SMTP id d2e1a72fcca58-82c7876a666mr2759734b3a.18.1774501859103;
        Wed, 25 Mar 2026 22:10:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4bb3:b0:82c:7876:a027 with SMTP id d2e1a72fcca58-82c7876a666mr2759715b3a.18.1774501858647;
        Wed, 25 Mar 2026 22:10:58 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3f9593sm1246249b3a.53.2026.03.25.22.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:10:58 -0700 (PDT)
Message-ID: <c0f0d46f-fced-415d-b2ee-30339a0a0049@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/5] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
 <20250518-ath12k-ipq5424-v2-2-ef81b833dc97@quicinc.com>
 <12cb2f34-2142-4a38-9e73-49c2cf66d8f8@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <12cb2f34-2142-4a38-9e73-49c2cf66d8f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4bfe3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=xSzTO1CcoS2zrBndkREA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNyBTYWx0ZWRfXw7FqdpymS7gK
 j3ikH+mSKabV5MgByMzkCljlJkzCh8pZPa4XEsKvGxcqY4MLB6A0D+ML65BSBZ/gFoRvwPQ/xmm
 GO8zkZYSYPgDsKGjrbhP8pbYk6YWpkHh8Jq3pOFnVCZ9nKT0O/bR7b3IlF0kchv4usCnJSnfqwZ
 eyiZVkn2SoMTIg5qIiVYBZ/ZCrx0Bw49oa6qb/Seaqn8TEkhkDDdS9iYcCYcnuM4yeIhX8RULPL
 GPmHpI7axnowatwH7HjebwfVtk9xHoZNVil7dspxO4kkncVdplujnl1WIHZ0REGC0ctg2qd7FiU
 qBdfCVRE1Vssu59pcqq+4svc9u2j0NhaP9JTVDTGLOw20oKllrhPtl1ExMnIcLYh/xAxysTW2Uz
 Vhj6UaFYieTCQGyJU7abRq4iGucbv4A/l8rTsR3FLRZXsWDGWeeC9sDKfAaFJK9nJmDTL/MWzb3
 aqSaHrIpo5rWWEs2Xfg==
X-Proofpoint-GUID: Mso0lrIMiel7VhdbxuejXVYoaUeZIUFH
X-Proofpoint-ORIG-GUID: Mso0lrIMiel7VhdbxuejXVYoaUeZIUFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_221101_712315_5EA17EC3 
X-CRM114-Status: GOOD (  13.33  )
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

On 20-05-2025 21:29, Jeff Johnson wrote:
> On 5/18/2025 11:22 AM, Raj Kumar Bhagat wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
>> index 7e2cf0fb2085ab014fc14a5c81074802674b154e..866de53f37bb5af94e16c796a0052fda39eb4ea8 100644
>> --- a/drivers/net/wireless/ath/ath12k/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/hw.c
>> @@ -1590,6 +1590,84 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>>   		.ce_remap = &ath12k_ce_remap_ipq5332,
>>   		.bdf_addr_offset = 0xC00000,
>>   
>> +		.dp_primary_link_only = true,
>> +	},
>> +	{
>> +		.name = "ipq5424 hw1.0",
>> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
>> +		.fw = {
>> +			.dir = "IPQ5424/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,
> 
> Until the firmware is available in linux-firmware I cannot accept this series.
> Please work with the firmware team to make sure I get firmware via the
> internal release process so that I can stage it.
> 

Hi Jeff,

The Firmware binaries are now uploaded to CLO:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main/IPQ5424/hw1.0?ref_type=heads

Will send the next version and resume this series.

