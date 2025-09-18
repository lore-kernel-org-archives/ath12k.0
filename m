Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C2ECAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP7bfGFdU/7o7BOcVSMb+JUezO30+s+j/x36Ohrw/po=; b=g4fGPrt09kdauZ+d+dP6D31uOP
	oZJzdiKVjxz9ZNz92pmcEJGM/vxUO8EOZUZq+De85Wz5sOEcYgBOcrF6CwISfa5e9fEdzSUsvheOv
	ozylDX6D9qtlpnQascHTsvn7FGcMw2OBxgvoEaH6+jOyRSEKzftHTaP9oZK51BtiIw9bsyRMDVBI0
	IDFqo+nJBmYB/pXuGUXeMweSru4k8OTGh1JsPSHCS2VLVlLeR1r4aNDhFHnJWVeskmeiafGtnsEMm
	4780grb/SAGiknB+ntuZV7JfnETrb0EqXT36kkL8b5OJQHA0QLGWqCZa9rchSaZb25pAXlyE57Enk
	6MggqWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8a4-0000000GTt8-3Edf;
	Thu, 18 Sep 2025 06:57:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8a1-0000000GTqw-3H9p
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 06:57:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I6bViF027120
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 06:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kP7bfGFdU/7o7BOcVSMb+JUezO30+s+j/x36Ohrw/po=; b=idYCm4t0dtfo1mNf
	B2Ols5/GhVrplFSi7idhch8X0MeJX9GJv32dde2Vo//5J9SR5HBV3nmAOIG4zioJ
	EAFpy5d1p0q+e6RZ1VdSzdfmWbmsaSXdeJ7eYOIoLKwYZFardky8jEsMkTr7X9Sk
	OURmuhvqcajlpHAQpec1C8aE98oBkVYFXf7C0PlYAjYooZ1HxHWViDX5Du/MOe/3
	+NQ+ic0AVwoLtoZR6b6pVqc2LPM60LLLD8gX6SaqSbgaImJQfL+PpNLKxthAgCgA
	4h44ZnSwGhANADnb9Qe0VmBMsALL4Gn5Z+EH8goW0S16w15y5qRkBNerYr6uQiKR
	z0ENmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jb828-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 06:57:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581953b8so7627855ad.2
        for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 23:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758178639; x=1758783439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kP7bfGFdU/7o7BOcVSMb+JUezO30+s+j/x36Ohrw/po=;
        b=HPXnzeJOXebFtQnWAj4s+qAMww8nojHALkhxeVblIlIlIZL9Y3fFMeLRkGxZctpu9y
         XFaZVsGIHnFgJDx//+NccKgATC1xj0Q+ft+ufjLLty33uMf+jW8Cy1xNrotCdDRpMvM2
         qIz3Rdq+q1FN12CUoWSeVxsMwDneDL+JSBNdVUASJL+21XbxjhtoE6D34RNC9lHCGqfX
         zEbiecYKkFrsfw3KbmLqM0AeZ4n+FJsmvG6T+XElT6CjieQ1x3hGRWC10OedJQJkjiIa
         MBuyWK78NlTbp4MioxnTd97pXq1hvjAmj2PkUgddQWOgZ0hcMW4SPRD8rlWd4nmCZklA
         X1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmidTeH5MQku+NeN/a7a4OhkfL65JbHBw/jLMaQGOeMBiIu0hHaV5M2qb4sdtO50TjkhH0m6A=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk0AQPOUekYBnbP6UpfXfP7njvGW6dsPppPPLY2d2uND/CJ8ji
	lOPVOpuxxNb/2xfODcf+MSQ+zTtaQbDh8jwhCj0TXkXZ3JOiV+8RlGjZnE0mchDI/nXpVKHslNH
	a51tHWQUTI4+JrRdWmXL2GYILuk5qw+sQtG9Cm7rauM4vvSWhau/wk4ShqC/vZlAB
X-Gm-Gg: ASbGncvNNSj+Mgu6MeLBSP1NWcx6V8SCVP4O/vMBEobwS00sc+jOkkhJHK7FOHSbNWk
	S0+ZCtlmXI7EwSS1jyL04PWRzO1uAiyYui/1FYzPvYJfz017WUg+v/qNXiyoroxQ0Dyv7klGShf
	zucSXr237wfSaLJ3FEOLu7kypxDQnDCC/TvVCC2Qluu4q7LFEXaMdwMb3MiHnsZBj9Pz+zw/Ufz
	V1Zs7MjZpUUwcXdS+nfeg7vldQnL8VHmx/M7YYwuSY3NVEHR17/QmBN7SdeAr5frX9hixI1iiLt
	rpgEE2xI9uglHKochHB2cH28RCqlWZC5Znyzs9VQhcDBg3gjHxeQXy+RhjRr1A8uitl8CzVq450
	maOJbaw==
X-Received: by 2002:a17:903:19d0:b0:267:9a29:7800 with SMTP id d9443c01a7336-26813f1d000mr61188745ad.59.1758178639550;
        Wed, 17 Sep 2025 23:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu+tO6Q57GSmftk1FgfAyqaDBz+rsymYzavH7+yrOI3zPLb0aE7EqBJflDWcrWlzsqxeR8vg==
X-Received: by 2002:a17:903:19d0:b0:267:9a29:7800 with SMTP id d9443c01a7336-26813f1d000mr61188465ad.59.1758178639021;
        Wed, 17 Sep 2025 23:57:19 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm15625335ad.109.2025.09.17.23.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 23:57:18 -0700 (PDT)
Message-ID: <7bb9c17f-34a9-2602-8bb5-d0d5f12f47d2@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:27:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add support to handle
 inactivity STA kickout event
Content-Language: en-US
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o-J8cW7STc_f6L5VlpcW_tRu-2upa1-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX0lL0f0dZOFxe
 wzrBPWbT2RUANMbv8ErdnKjYusDbAceGSkL6GEU5wr8/yaDgcnmrq0O8lOu8P9If87DtIbtqBxN
 runvNb4bePk65zzwGPpMwV9qX8bPdBfBN6gfAw2sB0iOyQHmetpa06dsGGIZRb1qAVpEgUdSTyw
 jcwc5QRq+kQbXwcl7KPBWE/j9EP9XZgJW61D6UO7DngqKL7pLYDOtdalBZq7tXESDbX3QthElv8
 eApV/NzNe64Ng8EaONGmM2iN3GftHt7ytlcHcM4QoVEmogCSDKx1vnj7mQwhizDznyG+AtZdRxJ
 l10XObbkts/Mv3z2R4XL6KeptARvPWJqRLgb9OsGlm6g7K0esAve5PYeYLRW1SN4LzxJixfwYHY
 b0kbZ8zS
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cbad50 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o4nd2XIhPPp7Sg7KCEwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: o-J8cW7STc_f6L5VlpcW_tRu-2upa1-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_235721_941932_876444F8 
X-CRM114-Status: GOOD (  13.39  )
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



On 8/12/2025 4:47 PM, Maharaja Kennadyrajan wrote:
> In this patch series, enhance the WMI_PEER_STA_KICKOUT event by adding
> support for reporting the kickout reason and RSSI value.
> All reason codes are handled by reporting low ACKs, and will be leveraged
> in the future.
> 
> Add support to handle the peer non-AP STA kickout event for the reason
> inactivity.
> 
> Currently, the ath12k_mac_handle_beacon_miss() does not handle MLO non-AP
> STA. Hence, add support to handle the MLO non-AP support.
> 
> Arulanbu Balusamy (1):
>    wifi: ath12k: Add support to handle reason inactivity STA kickout
>      event for QCN9274/IPQ5332
> 
> Maharaja Kennadyrajan (2):
>    wifi: ath12k: enhance the WMI_PEER_STA_KICKOUT event with reasons and
>      RSSI reporting
>    wifi: ath12k: Extend beacon miss handling for MLO non-AP STA
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 24 +++--------
>   drivers/net/wireless/ath/ath12k/mac.h |  3 +-
>   drivers/net/wireless/ath/ath12k/wmi.c | 60 ++++++++++++++++++++-------
>   drivers/net/wireless/ath/ath12k/wmi.h | 15 +++++++
>   4 files changed, 66 insertions(+), 36 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

