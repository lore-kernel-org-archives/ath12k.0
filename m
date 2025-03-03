Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D8C282C6
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNyPo97UPzZvF9mMIrMk+0mEIwcBZ7EcIK3SHWW2Nic=; b=tLlHkvfc3xENXSuRf1itugInyQ
	HJCsvYs6MPkULlhEfTG4IqKyUWjfVj+CYEewG+05XBxRhyK+JWYjpbBJSeL6X3wJ+YlVVHErviV7f
	BUpRl11U9EE1/SQTpjBanzL2t2TjiYHFlPPeAo5hUfQ8BoBxt3otQw9unV2Yrh68xZIxwE/aHtNyG
	V9wraUrPAaYOrZ1M2O/xY7uXFu3RUq9OQoP389qEgOe71IO6Lu3RWxzPtDI0oe/Q5LMSWV4uVkEKt
	ZuvffoIcz6a2Ts0Cj8pXorIExuAruW0y/ROv8pnD8NJpFR8o1yqehBCGLHwZmShV3Hu2S5AQ0YDWK
	JKdXRVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Jx-00000000Nxu-010Z
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 10:46:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp38h-00000000LeV-30I6
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 10:35:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AVRSD003964
	for <ath12k@lists.infradead.org>; Mon, 3 Mar 2025 10:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNyPo97UPzZvF9mMIrMk+0mEIwcBZ7EcIK3SHWW2Nic=; b=LYZz3cGQ/yUSo0J1
	Iv2bG+sk9MnPwrl5YeECMBQsHzqtv1MeUqx7yYZrHVOdmpmwjO/y/PsHmmW76lXj
	5EOL8fGG+Ud3tv0s5/Z/lmgu4RNZboWyAL3b3g4b2XOjXYQkf642v2zVedB6jEjI
	Yg30E/xCAzgCjeihmnhfdT2jam44Ck36Hr9Yh+Po1xvWYPoACtP9DCobLqVGpTwZ
	YwPs7/A5tol/WbEqENqU+UOvpCHbt5k7FEYhN4kczc/DLugVC/oq0YX0+6fvGrNO
	agkwD6jo7Asc3RFu3B0lkGX0AYHOi8Bb75t28XutQmiB7usYYbIBQOM2o9Rs9uAw
	wx93rg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tm5mm2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 10:35:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2feda4729e9so5924885a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 02:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740998108; x=1741602908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNyPo97UPzZvF9mMIrMk+0mEIwcBZ7EcIK3SHWW2Nic=;
        b=cr3DcXU1hFpDHJwNJp4er7DJKbUqh82HXC6XbT3pHJNP7I5hukOTlaEKK6cPI1vdW0
         kEh4WuH1w8YH7ux+PkBd1oUthEeb/7jSAd1mfU4sYsnmeDu2Umbhul0bpWVAU//qn1cO
         7p44JnMkOEdSvkp69i8TkEka4qR4yD8NgENrGvQYLUFHXDKSF4iWCNNvW8746uE5SXB1
         tghcaNMzO1ARwADEjEQRx/91WIE1EeNHFBTI3AFdikKUsbvzWlCnLhyoe4IDZGE219vg
         xeaMBsgzZGxhVhe+8cCoAZF8XhFKFNBSVIDnE9de9LnOPIglfWBvQlVsv1dgpNnJIZ43
         u+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWLrkKsF/qLiAHxmEBvFjM/nkHs7wOlpMiIPJszTyovRNiqAxbhrR9EdAjxrVHRKaolzsGdSvI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYcETZjKAIUwTcJh5pdE0Mp3zgClwIQKXfiA2SIMA0IO6cNC+T
	AiCFu9RkZWZ+pJlPvWThcN7cEWxuUV/AnGyARZeYTSbzqASXDKe0g5ChRD/OrjXmoWdbP+v7lMJ
	KNzSmowjLr+/8iI01kgQpB4pZ0RXarj5Fs24ahoZlt9YtaVZNlsG5Ac2+m+LL
X-Gm-Gg: ASbGncsU8vyEo7bQyXiBhUCeiAaVIlOTbhh9uJixI/MTNPGOpToYYLzqPGe6XXZYBll
	Q50xyFY0yybxsXaYObBDY6d5uzZnI19LcHF43CZT77cIJPKvhbtqdSL7UzWS3lvNH2kIOfEriLJ
	y6SvHWU7uplr06PJAgt4EypTNED0L+9PCzKOzgfLC0ojmsFJPaA4RtX2AFU+1JPK432PqZhp+l8
	j4v77HRQSHP6ueCh8yHcFcFTiEGlIFP1dkrrR4JzLkI8a9dR5OYYoOHgxVH0Bzh6boT4lCPTJR0
	OTnRKmq6g6TKKbksUuXETMzuiP4zjMWXLPu2ds1kuMQX3YDY5jgI4YvO
X-Received: by 2002:a17:90b:1801:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2febac065cfmr17159589a91.32.1740998108242;
        Mon, 03 Mar 2025 02:35:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQV5vNMKSgyQo4Pt6OgzKlyznzJfawE26+KhJqccz79x90AT0E94qyC+Ud7Wq2VNghW2BCFQ==
X-Received: by 2002:a17:90b:1801:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2febac065cfmr17159569a91.32.1740998107885;
        Mon, 03 Mar 2025 02:35:07 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a98d8sm10632336a91.8.2025.03.03.02.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 02:35:07 -0800 (PST)
Message-ID: <dbb750cf-b931-4ab8-876f-36e4e5e3bfb5@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 16:05:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: ath12k: update EMLSR capabilities of ML
 Station
To: Johannes Berg <johannes@sipsolutions.net>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
References: <20250117170416.2907530-1-quic_ramess@quicinc.com>
 <20250117170416.2907530-4-quic_ramess@quicinc.com>
 <cb41175353348bbc56791c3bb0c38a42ac4fc6d8.camel@sipsolutions.net>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <cb41175353348bbc56791c3bb0c38a42ac4fc6d8.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KdlNxUrD-BAcovvgS1QIDxpODyTS7vmQ
X-Proofpoint-GUID: KdlNxUrD-BAcovvgS1QIDxpODyTS7vmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_04,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=716 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_023511_889756_E6C85424 
X-CRM114-Status: GOOD (  17.00  )
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



On 2/28/2025 6:06 PM, Johannes Berg wrote:
> On Fri, 2025-01-17 at 22:34 +0530, Rameshkumar Sundaram wrote:
>>
>> +static u32 ath12k_wmi_get_emlsr_pad_delay_us(u16 eml_cap)
>> +{
>> +	/* IEEE Std 802.11be-2024 Table 9-417i—Encoding of the EMLSR
>> +	 * Padding Delay subfield.
>> +	 */
>> +	u32 pad_delay = u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_PADDING_DELAY);
>> +	static const u32 pad_delay_us[EMLSR_PAD_DELAY_MAX] = {0, 32, 64, 128, 256};
>> +
>> +	if (pad_delay >= EMLSR_PAD_DELAY_MAX)
>> +		return 0;
>> +
>> +	return pad_delay_us[pad_delay];
>> +}
>> +
>> +static u32 ath12k_wmi_get_emlsr_trans_delay_us(u16 eml_cap)
>> +{
>> +	/* IEEE Std 802.11be-2024 Table 9-417j—Encoding of the EMLSR
>> +	 * Transition Delay subfield.
>> +	 */
>> +	u32 trans_delay = u16_get_bits(eml_cap,
>> +				       IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY);
>> +	static const u32 trans_delay_us[EMLSR_TRANS_DELAY_MAX] = {
>> +		0, 16, 32, 64, 128, 256
>> +	};
>> +
>> +	if (trans_delay >= EMLSR_TRANS_DELAY_MAX)
>> +		return 0;
>> +
>> +	return trans_delay_us[trans_delay];
>> +}
>> +
>> +static u32 ath12k_wmi_get_emlsr_trans_timeout_us(u16 eml_cap)
>> +{
>> +	/* IEEE Std 802.11be-2024 Table 9-417m—Encoding of the
>> +	 * Transition Timeout subfield.
>> +	 */
>> +	u8 timeout = u16_get_bits(eml_cap, IEEE80211_EML_CAP_TRANSITION_TIMEOUT);
>> +	static const u32 trans_timeout_us[EML_TRANS_TIMEOUT_MAX] = {
>> +		0, 128, 256, 512,
>> +		TU_TO_USEC(1),
>> +		TU_TO_USEC((1U << 1)),
>> +		TU_TO_USEC((1U << 2)),
>> +		TU_TO_USEC((1U << 3)),
>> +		TU_TO_USEC((1U << 4)),
>> +		TU_TO_USEC((1U << 5)),
>> +		TU_TO_USEC((1U << 6)),
>> +	};
>> +
>> +	if (timeout >= EML_TRANS_TIMEOUT_MAX)
>> +		return 0;
>> +
>> +	return trans_timeout_us[timeout];
>> +}
>>
> 
> Some of these should probably be in ieee80211.h, and also - making a

Sure, will move all three get helpers to ieee80211.h and use it in driver.


> table of shifted values? That seems ... awkward at best?
> 
> static inline u32 ieee80211_emlsr_delay_in_us(u16 eml_cap)
> {
> 	/* IEEE Std 802.11be-2024 Table 9-417j—Encoding of the EMLSR
> 	 * Transition Delay subfield.
> 	 */
> 	u32 trans_delay = u16_get_bits(eml_cap,
> 				       IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY);
> 
> 
> 	/* invalid values also just use 0 */
> 	if (!trans_delay ||
> 	    trans_delay > IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY_256US)
> 		return 0;
> 
> 	return 16 * (1 << (trans_delay - 1));
> }
> 
> seems a lot more effective?

Thanks for the suggestion, will remove the lookup tables and do direct 
computation.

> 
> johannes
> 

-- 
--
Ramesh


