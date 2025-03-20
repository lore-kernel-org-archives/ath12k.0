Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5716C28B30
	for <ath12k@archiver.kernel.org>; Thu, 20 Mar 2025 06:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epNXuiZgPOtdpXAoPWdzdTQN9ufPEX1JFxVWl3vDZ9s=; b=zPhRMqCWmMV9Ex2d98zvhp12lj
	FiEbflWHIVJ3OwLncfDbstA/72FY0lynSmEO2Lb6liLmXF+PJnYT1yWXQ3evCnQcrkRqRR38x6Vnn
	meU4gJDlz28GKkhjlejKd3ar5Y0RG3hWxfSDODq4C+TtnHKAV634MHyawxRO/r41Wi8nX8/3nh8pv
	O+8YTSxLEhbneQTYAmfIX90QjL4BbXLuupRilz5ipJLsLLoS9gyuvPZb9bcnDIqzki1kmGl/tBUwv
	Te0TTWlS5/JU3oeuq0+cEeBf6WM0jKYtaiObMG2WvW3vQpi7G828XTSxN2MRbtGKMfwomI6qgUp/y
	GrJZWt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv9o8-0000000BLb9-21Pt
	for ath12k@archiver.kernel.org;
	Thu, 20 Mar 2025 06:55:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv9o5-0000000BLaL-3PdX
	for ath12k@lists.infradead.org;
	Thu, 20 Mar 2025 06:55:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z70r025394;
	Thu, 20 Mar 2025 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epNXuiZgPOtdpXAoPWdzdTQN9ufPEX1JFxVWl3vDZ9s=; b=of07lCQkrV+tqkLW
	8gLDImJsWIiDOUubo7nxFLS05CbpJrHueuXVgviLgAMw3uvnWaSndxGbK/SFIEAv
	Qz6Bco7GWYxI1wwmJ0gjYJOf1hARWv9fnlXBQfyyiEVtYHvDBhZfSJEnhNiBs2OM
	4lVM/sVQkmj7KsyOwbxY6y5gdvCr1uznJwXkfaTt7m4T1SKmAzEAn0XtflHMNArb
	i1FIS90Nx/vhROw7XInzsqiVlva9brb8EF/82tD2OSIFlR0FI+9v1BZPUvsn9KkR
	aWThqLn9ZbjyEWc5opo0uljeUWRnVY8ijdmeUGLhuOjYSCDRYctSfEZs8pDAhyof
	DFaJ/Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y1w56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 06:55:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K6t7wX003249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 06:55:07 GMT
Received: from [10.152.206.29] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 23:55:05 -0700
Message-ID: <c55d9dab-9ed5-4a0d-b1a6-31fcfa7e17bc@quicinc.com>
Date: Thu, 20 Mar 2025 12:24:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix incorrect rates sent to
 firmware
To: Ping-Ke Shih <pkshih@realtek.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20250319153547.771843-1-quic_rdevanat@quicinc.com>
 <524e12be0cb6421883d353114089fb6e@realtek.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <524e12be0cb6421883d353114089fb6e@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eU3mYQUc7QF1vwAvZZMo0bVbTjTnFObg
X-Proofpoint-ORIG-GUID: eU3mYQUc7QF1vwAvZZMo0bVbTjTnFObg
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dbbbcc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=aR5AiG0RSsZbc1Rv2rMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_02,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_235509_987846_50384B1D 
X-CRM114-Status: GOOD (  15.28  )
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



On 3/20/2025 5:54 AM, Ping-Ke Shih wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 9fda97667d4e..661167acaa69 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -3450,7 +3450,9 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
>>         }
>>
>>         sband = hw->wiphy->bands[def->chan->band];
>> -       basic_rate_idx = ffs(bss_conf->basic_rates) - 1;
>> +       basic_rate_idx = __ffs(bss_conf->basic_rates);
>> +       if (basic_rate_idx)
>> +               basic_rate_idx -= 1;
> 
> It looks like you misunderstood what I meant. 
> 
> The difference of ffs() and __ffs():
> ffs(0x0) = 0, ffs(0x1) = 1
> __ffs(0x0) = undefined, __ffs(0x1) = 0
> 
> So you need to ensure argument isn't zero before calling __ffs(), and no
> need to minus 1 after the call.
> 
Noted the difference, thanks for explaining. I'll do something like:
if (bss_conf->basic_rates)
	basic_rate_idx = __ffs(bss_conf->basic_rates);
else
	basic_rate_idx = 0;

>>         bitrate = sband->bitrates[basic_rate_idx].bitrate;
>>
>>         hw_rate_code = ath12k_mac_get_rate_hw_value(bitrate);
>> @@ -3983,10 +3985,13 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
>>                 band = def.chan->band;
>>                 mcast_rate = info->mcast_rate[band];
>>
>> -               if (mcast_rate > 0)
>> +               if (mcast_rate > 0) {
>>                         rateidx = mcast_rate - 1;
>> -               else
>> -                       rateidx = ffs(info->basic_rates) - 1;
>> +               } else {
>> +                       rateidx = __ffs(info->basic_rates);
>> +                       if (rateidx)
>> +                               rateidx -= 1;
> 
> Here should be:
> 
> if (info->basic_rates)
>     rateidx = __ffs(info->basic_rates);
> else
>     rateidx = 0;
> 
Sure, will change this in next version.

>> +               }
>>
>>                 if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP)
>>                         rateidx += ATH12K_MAC_FIRST_OFDM_RATE_IDX;
>>
>> base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
>> --
>> 2.34.1
>>
> 

