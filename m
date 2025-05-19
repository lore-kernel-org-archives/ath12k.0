Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3B9C2D0CD
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 03:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx0z0Q+vLmuOiYnj6uOJoIt6Cok2EgqKjloGkG4l+J0=; b=QByIKlhNww7KvGk0MsHklAapx4
	EVI7sabBKteWOv2E9/6OgW+3RNluWyBCuVodG/8V86bMOhAixMD3jV/JwM81MFLvyMotdUgaTogxP
	Ko36nOMt3GzCCRpNoL8yv5v3TaTxQpnqajLxTK6LAV+2d+eZzsjoJEWpFuvW8SesiR0MOmypAJBYQ
	F5XzyZHV0spC9xJoGCed+fzYrYo/M0ja8ezjD6VWvVrnU+MffbLHIQ1iE3a8wvBRD8Ou93izmzLpR
	aBz+3kK2qGo5TVCtL/9MM7ii0WXKLP3OGtATnfp6pIqvV4m3e4vCgprK4WzJzHvaQGtgto8bYb0Iw
	hDy+Ar7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGrJA-00000007unY-0fSY;
	Mon, 19 May 2025 03:36:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGrJ8-00000007un5-07oT
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 03:36:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILoXcL008335
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 03:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tx0z0Q+vLmuOiYnj6uOJoIt6Cok2EgqKjloGkG4l+J0=; b=QHSHMJyLtqRrDCOk
	hNm2R7wzonYuyA/98ozd/q+MZs6aT3Cec7KgVOZrcgklgHYXb8CtMm66kidp8KDE
	9FeIRAux415YRpr9srEo0+bllseVO/WY9TTX6TMnk9WbSV3WZ6CHwjoG7fwBLDCW
	XAy/kmZ7Jq/LlhPwMzEviEvu1a30m0ywkhHKxngxsyNixs7GPQqVXC+db6tfzLuF
	NXB+LMyHKpz4j1pQUWhFEGTyI4vAT1gM4/augDhvtkRPDyylZ8QRRd6bnpXC2fn6
	xCyIpdd6lnFWLvRhzDf4aDG8mJ+8DNcikMnAPdZtQUcweD2XJSLLvVh+TT6y4Xwl
	oCiuTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyjxqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 03:36:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e3cfc144so20621645ad.2
        for <ath12k@lists.infradead.org>; Sun, 18 May 2025 20:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747625810; x=1748230610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tx0z0Q+vLmuOiYnj6uOJoIt6Cok2EgqKjloGkG4l+J0=;
        b=ID7+i8F+VFr/aDlcsMXauu+yS+MSWgNFsTpgWJmfvS4tpyrFshLMO336a+X1o+vnJ2
         jv8NNnnYYbkg/4jcntELdINtlzElkYAweP1qtzRIfQNKA1OifoE/K45MQTsOTgzceE3U
         henk5ATe3gHgK8o2hvgIEKfdd2ea9QvV/oEegfoeFp6UMc02PH86JLfx+uY+2RI72Wvj
         a90Om9JR7jK4Zt/6eE8KB42E760WiexsQwQ8dYPwTtaPzZ6bpkCSaM1DFPmAdp7r6nBm
         mIVtzg3zuVCwPYrSCcfeWvo4wF3EqeO2CuKMxDgM/Cs+za/yPSCz9lKYhPzXMDL0e9GF
         +3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo7GtQ/IGg45wS/k6kIqvoK+F/wJM2NpQt1POkmJycH2BvRGSyCTiqSfNy9VbE7xgYKUKDvyQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8wCj5v0mYOhYGdkavR1d+ARSUqRJsnHNa/1GXQZL6zrqSeY6S
	x1SaGf7EDdGztsnP6QRbcO8/9KSzShHGZpNfQKUOk+HjYemJu5xPb2HG2/1OXdBiMeyS5zHgf00
	iIqw5qGcpMfmI50BYHV9qLv4SjvJKZ6bELV6VPRiraU/ldk8UEYsPieba+7wT3mB4RXlX5VNE
X-Gm-Gg: ASbGncvHUzsG8JPoPTaUh+KpSo2YaT4lTYzvIQKBYXU9odyN4xsHv+3TfsBhtOD/rQm
	+cVkgeARkxctNTXu2rPjswsdhqqTC1TGtyva6XGISiw6mOeELA1K/6zEpUI/z1C5B9HA8kC2j6T
	20qfID92Lg742EpvluuddNQvVWKaeREzLVAnemtv8um5y39cldXSGmKJYi3h2L+CVPjhM048pjy
	9yCs9N6DtxfGjag/G+hUj5v+YyE0hr6Hn4/PjTRyzLkZMM7kyQmop1yUxmnbOIgmnHVNB3quObU
	8FCbpv7RuFFtpdC7BecLQvgZ+8PhGSGdY3zVIvoN6gjWbYrIXECO
X-Received: by 2002:a17:902:e5ca:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-231d43d5526mr156987365ad.9.1747625810481;
        Sun, 18 May 2025 20:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqFqvAF5UB+fVYD0ZWqXG1/cjzbqexjTAP1GVf7lSAi+RnISws1iZ9K+8/EIT9d91skpOCjw==
X-Received: by 2002:a17:902:e5ca:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-231d43d5526mr156987035ad.9.1747625810001;
        Sun, 18 May 2025 20:36:50 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97db8sm50068375ad.110.2025.05.18.20.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 20:36:49 -0700 (PDT)
Message-ID: <b4138c8a-5b09-4d17-9151-bd60d511aca3@oss.qualcomm.com>
Date: Mon, 19 May 2025 09:06:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: combine channel list for
 split-phy devices in single-wiphy
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        aditya.kumar.singh@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
References: <20250506105624.466019-1-rameshkumar.sundaram@oss.qualcomm.com>
 <7db2e4b5-377c-4d3b-b51f-290accc9ddd9@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <7db2e4b5-377c-4d3b-b51f-290accc9ddd9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAzMSBTYWx0ZWRfX35YxTDtC5j+E
 ByaxqTWkDDKcRatIhHaXFdgmyVWqFvgidFka+Lw/nx5rvRWEtXa3zz/wuBpehnjqJ6Eo+EgV8NV
 dNje9Mz4BSyJiEKKhylFoj8ES9Ti1mjyoSAco8VgHiXI+kONqtM5e/KuHBbVG8A+3MWzHlBB/1X
 l3UhKZfRsTZPSKWR6bO8Bu0NCL/8wYxZA9LP1oFLq4oFvyYS9sLpsW+VrOem+GnvCAuJ/8v2G/3
 JxfED+ON20OANa4/cqQ1phHFKEGF3LUgtGaw0IdKS1GuOXi7hnsXlK3TRkyX41HCKtPsfqcLekv
 lTaNPtFdrBGW5wVSSRh1e/H09zesksv1qbZYw6V6/Hk6Wq1fH/VeBvNyXlIandakdxj1iAWPgTQ
 icQ+dH0bijD2YqGXfm/CFASAuGUK8eMSJNFRmeO+N73d5H2HQMpGOb2RZg9TE3lbk3864dke
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682aa753 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mNHDvxWOCiuYGhU9H0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QNlcqGm-RVYjXSIBClZvUPct68Dyi_5C
X-Proofpoint-ORIG-GUID: QNlcqGm-RVYjXSIBClZvUPct68Dyi_5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_203654_205132_B10A3FDE 
X-CRM114-Status: GOOD (  27.34  )
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



On 5/15/2025 12:04 PM, Kang Yang wrote:
> 
> 
> On 5/6/2025 6:56 PM, Rameshkumar Sundaram wrote:
>> When two split-phy devices that support overlapping frequency ranges 
>> within
>> the same band are grouped into an ath12k hardware (HW) setup, they 
>> share a
>> common wiphy instance. Consequently, the channel list (wiphy->bands[])
>> becomes unified across all associated radios (ar).
>>
>> For reference, the devices are:
>> 2.4 GHz + 5 GHz Low Band
>> 5 GHz High Band + 6 GHz
>>
>> The first radio probed within the 5 GHz range (say 5 GHz Low Band) 
>> updates
>> its sband reference (&ar->mac.sbands[NL80211_BAND_5GHZ]) within
>> wiphy->bands[]. However, when the second 5 GHz radio (5 GHz High Band) is
>> probed, it replaces the existing wiphy->bands[] entry with its own 
>> sub-band
>> reference. As a result, wiphy->bands[] always reflects the channel list
>> from the most recently probed radio in that band, restricting supported
>> channels to those within its specific range for upper-layer.
>>
>> Fix this by updating the wiphy->bands[] to just enable the channels of
>> current radio when there exist a radio which already has set it.
>> This will make sure wiphy->bands[] holds reference of first radio which
>> got probed in 5 GHz band and subsequent radio just updates the channel 
>> list
>> in the same address space.
>>
>> Since same sband memory space is shared between radios of a band, while
>> determining the allowed frequency range of radio, its frequency limits
>> (ar->freq_range.start_freq, end_freq) should be used.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> 
> Offline sync with aditya:
> 
> This patch and patch [1][2] will make WCN7850 update regulatory rules 
> and trigger scan incorrectly.
> 
> They are based on the design that one chip only supports one band.
> 
> This design will limit WCN7850 to one band.
> During init, WCN7850 will be limited to one band(such as 5G band) due to 
> patch[1]. Then will only update 5G regulatory rules and trigger 5G scan.
> If manually set country code by "iw reg set XX", WCN7850 will be limited 
> to 2G band due to patch[2]. Then similar issue will happen.
> 
> 
> If QCN supports multi bands like WCN i think you will have the same 
> problem.
> 
> WIN team needs to figure a new design for this issue to support multi 
> bands on one chip too.
> 
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/? 
> h=pending&id=b7544de8a2984e61b95c58c1c6c1e8ce659b1021
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/? 
> h=pending&id=13324cecbb2c390a11f1fbfe87f3a5e62d6e4591
> 
> 
> 

Thanks for pointing this out. we're working on a new change which fixes 
the frequency range marking in [1] & [2] for multi-band ar's, Will re 
base this patch on top it once it lands in public.

>>
>> Signed-off-by: Rameshkumar Sundaram 
>> <rameshkumar.sundaram@oss.qualcomm.com>
>> ---
>>
>> *v2:
>>    - Fixed frequency conversion from KHZ to MHZ in freq_to_idx()
>>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 93 +++++++++++++++++++++++++--
>>   drivers/net/wireless/ath/ath12k/reg.c | 13 ++++
>>   drivers/net/wireless/ath/ath12k/wmi.c |  9 ++-
>>   3 files changed, 109 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index 4dae941c9615..23cbf348e836 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -4131,8 +4131,9 @@ ath12k_mac_select_scan_device(struct 
>> ieee80211_hw *hw,
>>           band = NL80211_BAND_6GHZ;
>>       for_each_ar(ah, ar, i) {
>> -        /* TODO 5 GHz low high split changes */
>> -        if (ar->mac.sbands[band].channels)
>> +        if (ar->mac.sbands[band].channels &&
>> +            center_freq >= KHZ_TO_MHZ(ar->freq_range.start_freq) &&
>> +            center_freq <= KHZ_TO_MHZ(ar->freq_range.end_freq))
> 
> 
> Though WCN7850 won't reach here, but this is also not good for those 
> chips who support multi bands.

