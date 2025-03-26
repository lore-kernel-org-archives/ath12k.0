Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A29C36008
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCUpOh8kdffZ7wAW+YTxoSqCTdnCmAxd9p/8UtdJehg=; b=xUns6QpD7tE8nPWbrgRzD5jY78
	DSTyaD8kVL0oj0IIvFDHVtLS0FHcRjxJep+ap6qW8MHDjtVYScMc8gZZF+vKmAwzJAp7AJFW/nrwi
	f2dYcxyYC5n8K/tsabxaTyvo7JpPJfK7Ig6OS/JlN32Il1nVPi1NypDgUf/b62I502+O2wbvhbeap
	A/P/AmHtZSC7SgQ+zTwUcZ46ziUNDOOOqDkbRozsc4/4KlGaYtfVEuXhhEM4PDU93OrYBZTraOwh+
	U8b7XoUbltRQODKWlN6hLWfxviCZPFxhuEqMPlzztZ3Q6khVU0jvGQLVnzErZwdE1dc5Bbz0Jlw14
	vH7XLO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXxu-00000009c9D-3ndr
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 21:07:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXxK-00000009c2N-2XC3
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 21:06:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFR5hM029039
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 21:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCUpOh8kdffZ7wAW+YTxoSqCTdnCmAxd9p/8UtdJehg=; b=pza3gZgoqfAvxP0q
	D+v5GfIVU7KDtppWSid2yMplg7NGlhsfqNAuX9l4Va27Xd8qYfPSm33RWF8Vkr/I
	cLTNzvd6v9ClWZtj5lf6juD+LR3mkZNYE4DGWeagjV88BfMgIzgbblIVLePIzwq6
	WnPNOZIVRsqSlzsoYY+M28MclKNmtKpDPCgmXficDUxD+qaSyQk7s8kSyHXo6Mq5
	Y8K+qrPzDdyqACLHegqhk+PbJqt1aFSwvXmBIU5VzR+P57Mh0vbGqjAOl9fbXmGu
	VMeDlB+eFJtZyCUNPwpMdcX3dbMp6k1/UvMSdpmwNiLbpd/9IAabc7GzQccqsg9z
	8hDj7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktend78p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 21:06:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240c997059so6343225ad.0
        for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 14:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743023192; x=1743627992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCUpOh8kdffZ7wAW+YTxoSqCTdnCmAxd9p/8UtdJehg=;
        b=ZZV2DmyPLc3SH6eP39eRGubQbbJG3ghk5BAuK5VEheN5azqQq78jBL34oaRE/prdOe
         9Mf/hX/683LQdi2NcLkVS5qaIoS1tDbidg9Y9mHY5ukq1oNU6MmpHOgRJ8stEvBgbQMK
         K8pF9xGrrikUrwxPBDjjcQHNfF19ZIyPQCKCwROH3JBwSyIiJRCHPKqPYKJ6ihTckh4Z
         YIM5FwFIFBwQ2Xbr5/OiyaGhidziz0CrEINWvur6y4t3R/TwlTervHdB5yn4T2NAX62P
         i/o5U/j0fO+sI/SfIeydbZf6AlGS1oCcXy+7X5VzV2GiSu9NQ9KqTqu9SsDm8MlZEI6N
         kN5A==
X-Forwarded-Encrypted: i=1; AJvYcCUadBsmNcPiMqoT4jX14NaEBv4iHFTfBHKHvLEaG4jO0y/5ly3Kt6HAlLe361+6aY8m8+rvwsM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi+KMzYy7zhuGoQ7S8loh9Dvo0FpYwOEOuLZTbSmmNpFTpOGkg
	mMxyyQuHPPJPAup4R3Ai+nufrRMNbcHo5ANyd8gJYESR9xHxhYZfrlzEXffbLpJN5MSwZsvGaO1
	uabWPi/q/23H7cDKxv3kXTgkt+bqlWe3tiFQAIH6iFTGa0AsVhHsVD4XuKY4g
X-Gm-Gg: ASbGncvfE1+LTEYvFv1eRGF7wDGBpFaf50WAg4wehgZeVBuLMaYnnF6WeTeDS6x+ptD
	0dAS9/lgpnfg+9r0AFxsMYTwjMTTWpyA8D0/I1eli8B0uivnsP2I2i1yfcKKovO1ecIf7MXJfTd
	metFvvzetC3L4NkysSd4rCrKsCNffCVpdN9LH8mYARumuyKC0wP9PSGhD13xqLtFqvr0xtmrmNp
	CugJPeLwspxmv1yTnt8BLqvR0EDMkwM3KIjVsdICwZ9DdbHVSh7SDHQB1743j6Vg/Q68Jqa+mTF
	IruPlLB7SPd6Szdswfs+YVpEBoFhZWdCzsbMIaetsnQnIFANUbAnOSb29yluhoQYNyukdCp2YZc
	0I9PHnKRL
X-Received: by 2002:a17:902:eb8d:b0:224:b60:3ce0 with SMTP id d9443c01a7336-22804882d89mr17541055ad.5.1743023191620;
        Wed, 26 Mar 2025 14:06:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF9p6PkEiDmbQ6VllN6VJH8Mtgwnavq9CvRTi4U8LKdM/l5NzA8Xn1ntYinHJbtZcfe+ulqA==
X-Received: by 2002:a17:902:eb8d:b0:224:b60:3ce0 with SMTP id d9443c01a7336-22804882d89mr17540575ad.5.1743023191041;
        Wed, 26 Mar 2025 14:06:31 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b493sm114967855ad.34.2025.03.26.14.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 14:06:30 -0700 (PDT)
Message-ID: <fdcdff6b-8775-4772-bf10-a70f811a7c5e@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:06:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: report station mode per-chain signal
 strength
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250210054050.656075-1-quic_lingbok@quicinc.com>
 <4c1681f7-c4fe-4101-8023-a50b4b59a17d@quicinc.com>
 <933857b4-1697-4893-89df-91002a5282d6@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <933857b4-1697-4893-89df-91002a5282d6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e46c59 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=OGqSUBrs7WRVqf5_iPYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dZfwpb3Awyp4KWRP5Udovg4ArgV9sSA2
X-Proofpoint-ORIG-GUID: dZfwpb3Awyp4KWRP5Udovg4ArgV9sSA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_140634_780747_6D44CCD2 
X-CRM114-Status: GOOD (  16.01  )
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

On 3/24/2025 7:31 PM, Lingbo Kong wrote:
> 
> 
> On 2025/2/26 19:34, Lingbo Kong wrote:
>>
>>
>> On 2025/2/10 13:40, Lingbo Kong wrote:
>>> Currently, command “iw wlan0 station dump” does not show per-chain signal
>>> strength.
>>>
>>> This is because ath12k does not handle the num_per_chain_rssi and
>>> rssi_avg_beacon reported by firmware to ath12k.
>>>
>>> To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
>>> flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
>>> handle num_per_chain_rssi and rssi_avg_beacon in the
>>> ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain 
>>> signal
>>> strength to the chain_signal of struct station_info.
>>>
>>> After that, "iw dev xxx station dump" shows the correct per-chain signal
>>> strength.
>>> Such as:
>>>
>>> Station AA:BB:CC:DD:EE:FF (on wlan0)
>>>          inactive time:  212 ms
>>>          rx bytes:       10398
>>>          rx packets:     64
>>>          tx bytes:       4362
>>>          tx packets:     33
>>>          tx retries:     49
>>>          tx failed:      0
>>>          beacon loss:    0
>>>          beacon rx:      14
>>>          rx drop misc:   16
>>>          signal:         -45 [-51, -46] dBm
>>>          beacon signal avg:      -44 dBm
>>>
>>> Tested-on: WCN7850 hw2.0 PCI 
>>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219751
>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>>> ---
>>> v2:
>>> 1.add break to avoid warning
>>>
>>>   drivers/net/wireless/ath/ath12k/core.h |  5 ++
>>>   drivers/net/wireless/ath/ath12k/mac.c  | 39 ++++++++++--
>>>   drivers/net/wireless/ath/ath12k/mac.h  |  2 +
>>>   drivers/net/wireless/ath/ath12k/wmi.c  | 82 ++++++++++++++++++++++++++
>>>   drivers/net/wireless/ath/ath12k/wmi.h  | 18 +++++-
>>>   5 files changed, 139 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/core.h 
>>> b/drivers/net/wireless/ath/ath12k/core.h
>>> index 57e71ccbbb67..967e3cad3bca 100644
>>> --- a/drivers/net/wireless/ath/ath12k/core.h
>>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>>> @@ -508,6 +508,7 @@ struct ath12k_link_sta {
>>>       u32 bw_prev;
>>
>>
>> hi jeff,
>> do you have any updates on this patch?🙂
>>
>> /lingbo
>>
> 
> hi, jeff,
> 
> do you have any updates on this patch?🙂
> should i send a new version based on the current upstream code?

Please rebase, the current patch no longer applies


