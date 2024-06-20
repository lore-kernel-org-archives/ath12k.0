Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B244C27C79
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 05:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss9dsFbAq2sILeOap9WZdRDglRvfql8k6A/40bSJUjI=; b=HTz8Z4plHxXUy0ptSr1s9uyMdr
	WsyKD7Uz12fNQmBTIdMeEBwR2Nze24DXV63Kq6OGmJAC7NwaZZyjpMsx4Vx0YBddj7rMoCaMARyHd
	nki0Jm2P01AwPmXZ1wWDAgiwMlOHlXoRfogOPuvWQP7RwX7fO7mu6QNHugOwg9S88ydi3nDgqCci4
	IbV3QMkrR9W97f6K5JMYC13mnUNTnYSKgRLNIhev5gOCTM0EnK3rF+OJdTezA6ZP/4bnoLFDoJlJH
	gs2IhBnkpLKVrFtgwijXRC5xcJaiogtTS1vbxF9NR8gzNfDHW18gXTdH3TziHXAdPHOXyaMyfWixB
	WXqLQbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK9uZ-00000003dPx-2aeT
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 05:00:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK9uW-00000003dPO-29IJ
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 05:00:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JKcX6U023321;
	Thu, 20 Jun 2024 05:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ss9dsFbAq2sILeOap9WZdRDglRvfql8k6A/40bSJUjI=; b=PtlfJjCFnW46c9No
	8mchGUR3CmI224eINYtelbuJ01BlV530fzeGkffDa9Ey1/nIQUXmtUPxAhzscU3w
	CcQFTAhlduAXQ9sApW0r89Cm+xRLseUHFT2wOSBqaWjNbJO2B9JOi3ily55E6ts0
	P20jT1ZLIYoBHvFRIueZASscFnDb5ZQLMIO2LOoAfTBTEtmfE6+m9ccotW9avnbS
	5AKt/m3BqqNZfInbclCOinqAp1bgQg9sI5HOy36nRT5U1OuD/A6PoOjo7FPxypeu
	ALe5ToDi4f3dtt3W6WO5nnNq2uNR1NODAMIoqR4xM74KpxV5t0RtOojk4SntoO13
	BRdJAA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv6hn0ter-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 05:00:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K50WDZ027336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 05:00:32 GMT
Received: from [10.152.203.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 22:00:30 -0700
Message-ID: <b84e9793-d159-4e82-8c2d-90a811e2a3e1@quicinc.com>
Date: Thu, 20 Jun 2024 10:30:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single phy
 devices
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Lingbo
 Kong" <quic_lingbok@quicinc.com>
References: <20240611043342.2672998-1-quic_rgnanase@quicinc.com>
 <87zfrgkf8i.fsf@kernel.org>
Content-Language: en-US
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <87zfrgkf8i.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yANB_eUnVp61Vk9ykA1k5bbBqIZAg0ph
X-Proofpoint-GUID: yANB_eUnVp61Vk9ykA1k5bbBqIZAg0ph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_220036_613952_E17057DB 
X-CRM114-Status: GOOD (  18.75  )
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



On 6/19/2024 11:05 PM, Kalle Valo wrote:
> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
> 
>> From: Lingbo Kong <quic_lingbok@quicinc.com>
>>
>> Pdev id from mac phy capabilities will be sent as a part of
>> HTT/WMI command to firmware. This causes issue with single pdev
>> devices where firmware does not respond to the WMI/HTT request
>> sent from host.
>>
>> For single pdev devices firmware expects pdev id as 1 for 5 GHz/6 GHz
>> phy and 2 for 2 GHz band. Add wrapper ath12k_mac_get_target_pdev_id()
>> to help fetch right pdev for single pdev devices.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> 
> [...]
> 
>> +static bool ath12k_mac_band_match(enum nl80211_band band1, enum WMI_HOST_WLAN_BAND band2)
>> +{
>> +	return (((band1 == NL80211_BAND_2GHZ) && (band2 & WMI_HOST_WLAN_2G_CAP)) ||
>> +		(((band1 == NL80211_BAND_5GHZ) || (band1 == NL80211_BAND_6GHZ)) &&
>> +		   (band2 & WMI_HOST_WLAN_5G_CAP)));
>> +}
> 
> This is not really pleasent to read. What about something like this:
> 
> switch (band1) {
> case NL80211_BAND_2GHZ:
>         if (band2 & WMI_HOST_WLAN_2G_CAP)
>                 return true;
> 
>         break;
> case NL80211_BAND_5GHZ:
> case NL80211_BAND_6GHZ:
>         if (band2 & WMI_HOST_WLAN_5G_CAP)
>                 return true;
> 
>         break;
> }
> 
> return false;
> 
> Or any other ideas?

Thanks for the suggestion Kalle. Switch looks aesthetic compared to
conditional checks. I will refactor the code as above for better
readability.
> 
>> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar)
>> +{
>> +	struct ath12k_vif *arvif;
>> +	struct ath12k_base *ab = ar->ab;
>> +
>> +	if (!ab->hw_params->single_pdev_only)
>> +		return ar->pdev->pdev_id;
>> +
>> +	arvif = ath12k_mac_get_vif_up(ar);
>> +
>> +	if (arvif)
>> +		return ath12k_mac_get_target_pdev_id_from_vif(arvif);
>> +	else
>> +		return ar->ab->fw_pdev[0].pdev_id;
>> +}
> 
> I find this easier to read:
> 
> arvif = ath12k_mac_get_vif_up(ar);
> if (!arvif)
> 	return ar->ab->fw_pdev[0].pdev_id;
> 
> return ath12k_mac_get_target_pdev_id_from_vif(arvif);
> 
> But I still would prefer to have some a code comment explaining the idea
> behind here, especially why it's safe to use fw_pdev[0].pdev_id directly
> and what scenario that is.
> 

Sure. I will get the necessary info added as comments.
Thanks for the review Kalle.

