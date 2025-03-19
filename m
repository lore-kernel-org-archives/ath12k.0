Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D693C35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeEVDtRTtfm/mIgiKRKIxsL5mdTxcvp8WT7XXvQZHCo=; b=V4C7XE3lyJM+6V/vGV9csyHPR2
	gLS1hKW+4Ukhc9p4A0TCKEtlvrDkevtlMfwGXhr891EGqrD3VGezeJNYDpUmEdEfDnkdeev1FUHHw
	ELO9SkI4IejoFD7YV1EkEL96zlH9omn9PEEoNsmKSpE3YuVlXM/jZOTyDi5gPpYz52hD36hdFko/S
	llKFfIFYq2Uu2j+OQbhl9EDwQmOdF3Ux5+9kP6tdBXGBw59kegC2ZHmeqggJtsxJ5gkR7YsNWkV2G
	kUCfEm3HFqU3cOi/KWDz50iumk8BKwR/bY79YtCpb0tpOF6MYVQ+GSvk6C7SkQBsz/MibRMKA+1iV
	XyE+0Wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tusww-000000091bR-06SK
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 12:55:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuswt-000000091aY-2HF9
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 12:55:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lp8M002066
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeEVDtRTtfm/mIgiKRKIxsL5mdTxcvp8WT7XXvQZHCo=; b=gLtUt1Um0VqJKelt
	rKcZrQxH/YA2N2VTrhRxeULs6eF7KgF39nBpBnY9iJF82u0XRJ0T1XskJ6l9/QYt
	qNPRxszawW6nDtPwrifjTwxcpocKbp3KrmhBRn93YnHbIjtIU2JbJ7uJkD1u4uzU
	Cxi9AFl/7gAmwpoul8V5Bc1BKVjA1xEDjNc+ukRGmkRoURNIJ7ROocCj3ijz9Pvg
	WZNQkVyi01NDqGDCWtC7Z+6bVVbdyZG3uvz0QtkhlU8UXSWuTUuuHf9X5DgbL6NF
	AyTkx/VJ8XNFo3jqHA7PSDryIEPSWpUcCxeoyj54ODFMzT45ADA/VVUD68qVYOli
	EcpmIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbx0dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 12:55:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff8c5d185aso13759561a91.1
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 05:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388904; x=1742993704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeEVDtRTtfm/mIgiKRKIxsL5mdTxcvp8WT7XXvQZHCo=;
        b=MNbGsd7/sma4jRUnhs0z68aQwwa/XSzjRPHZvrSKrjXJLIDz+FDvDptMMSifmfNJIP
         u4+mpqKxAf/lSHpLI9462l6i5e7QJxCZXxjZ0hz0Q7NCBmbMiayXdVq47GIh080f+vAT
         vbbMM4oytd5Xg/FqzwkED1aGWOxC/M2qZtkDqRUFefjxReIzL7YnrKBhY3NcAY6/gYdV
         UnEoDIrJVGCl3OYs2F4re99CRAQe7H+FLi13TfbkthIbCMiITB6C86nuKWsPaTrl88yE
         loDhbrij0QaaVo0YA7qWULH9eu420YmZRPC1p3xNGjrAQFEXNvMW24p5VGvlF2ukKKdp
         nK1w==
X-Forwarded-Encrypted: i=1; AJvYcCVCb953W2NLQg46b/rXFmLZEVlPNg/001F9IhEmkP95JmMF9leS0+UmlGOArtsg0BfXVKm/y7o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4yHQgrWp38WIpd9gV9Xta0nU5ZAjm1IFCNvBY0PecdKvnkwNK
	fVF/QAC377GxkDmAF6RN+6h23YEc0/OBtOKuN+lBpgPFWjis5CbsJEmwdS4O219iXxtK3rQuhyA
	wTIIStOgJ+tKHEgQ9x18bFjDHg0Q0MemImxUtMcvjAUoJ/9xxuwFUr2Nz5D+v
X-Gm-Gg: ASbGnctKaDEsiKxV7PhKKAGOvgiX9FWUfIk77PieAiXIHTjAxwuJV19dSCRf9A50lpn
	Ehzq6OMPWmPI12hVru3pfeGbS7yVpU/H5omz5aH1hZbPqpPvy+IOY0Bl9M6jXblA/jp67vNSZrZ
	/NSGVjr7kitJdpAYbPCqxOPZkdlKreU8STOKCR/BIGhwlIOK4eTfkM12KwTFD2CdDKI2PweEVs+
	x9VqYl6Xc/2aCnBpvYe9ZwYFAg/O6bV2ifo0IsLQeGalArsHjEwNqssWoGp1sHKmKRt6Ywz4dGB
	lHlNxXWhKzC7VZzuYhgOIi8hbqDBqIUhIACnNNsFQ1xFH7NCpaTEIc2aLw==
X-Received: by 2002:a17:90b:4e8f:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-301bde51fc9mr4540475a91.7.1742388904512;
        Wed, 19 Mar 2025 05:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/2CAuo/R2eq5BzbQLNQBq0yPs22kdCE3hs/7Vq2U563faJ6/8KWodBXAfiVexNfvldQlfDA==
X-Received: by 2002:a17:90b:4e8f:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-301bde51fc9mr4540440a91.7.1742388904132;
        Wed, 19 Mar 2025 05:55:04 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576be5sm1463455a91.6.2025.03.19.05.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:55:03 -0700 (PDT)
Message-ID: <c6e3b0c1-18fe-a9fa-0e72-d955809144e3@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 18:24:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <db232678-fa85-d75f-de72-d2b5e1ec611f@quicinc.com>
 <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XmoQ72fheiuJBU_mGOrSibf68nW2iMDB
X-Proofpoint-GUID: XmoQ72fheiuJBU_mGOrSibf68nW2iMDB
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dabea9 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=cXwcXxlD48ZRgq5pOxwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_055507_724481_796D3D53 
X-CRM114-Status: GOOD (  21.78  )
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



On 3/19/2025 5:21 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 05:02:39PM +0530, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 3/19/2025 3:57 PM, Krzysztof Kozlowski wrote:
>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>>>> ---
>>>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>>>
>>>>>>> Best regards,
>>>>>>
>>>>>> NAK since this will break QCN
>>>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>>>
>>>>> ???
>>>>>
>>>>> The original commit is wrong, this fixes the conversion, nothing else.
>>>>
>>>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>>>> Setting the mlo capability flag without having required driver changes
>>>> for WCN chipset will likely result in firmware crash. So the recommendation
>>>> is to enable MLO (in WCN) only when all the necessary driver changes
>>>> (in development, public posting in near future) are in place.
>>> Really, these are your answers? There is regression and first reply is
>>> upstream should wait for whatever you do internally. Second answer is
>>> the same - public posting in near future?
>>>
>>
>> May be I was not clear in my response. I was not telling MLO bug fixes were
>> in the development. Actually the MLO feature itself is not enabled
>> yet with WCN chip sets. Any code changes enabling it without full feature
>> support would result in firmware crashes with the existing firmware binaries
>> available in upstream.
> 
> Is there an undocumented change of the behaviour in the commit
> 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> single_chip_mlo_supp")?
> 

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c

-       if (resp.single_chip_mlo_support_valid) {
-               if (resp.single_chip_mlo_support)
-                       ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
-               else
-                       ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
-       }

The above logic seems to keep the initialized intra MLO support even when
single_chip_mlo_support_valid is not set. The above code removal is correct as
MLO support can not be enabled in host when firmware does not advertise it.

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c

+       ab->single_chip_mlo_supp = false;


diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c

+       if (resp.single_chip_mlo_support_valid &&
+           resp.single_chip_mlo_support)
+               ab->single_chip_mlo_supp = true;

The above code does it in right way. Overriding firmware MLO capability as done
in the submitted patch under review is obviously wrong. The firmware used to report
the issue seems to have an odd behavior: 1. it does not seem to advertise MLO
capability in single_chip_mlo_support bit and 2. expects configurations to enable
MLO from host. None of the WCN firmware available in upstream either advertises
MLO capability or expects configurations to enable MLO from host.

Vasanth

