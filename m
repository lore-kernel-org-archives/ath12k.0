Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD4CC27C79
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 04:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Bj8FJaMCS8jKnX1VnafPVpgiQEJjcKXalQEuVh9L90=; b=kusG4WNd8+yTRR9virUExaQN72
	FBXXChnQppki1MAC3wWN+kvDvzm82Wn3+0EpTYLs8DyPYrc+sFFh/g2l68LFonq/8vC+cXGL+S5Fa
	yXlnawFieypv8p0K9WAKJfq2rG5s2RkMOcZ9kOBkKQE3c2IbBs/eb6Kn6+aLC5WHipZDriSGkEG4t
	ma8gJm+/U26NFb7b/sywbPsesgJoZmYzovWlzviEwBDoLU6WzzMVzbe74QB99sTJpq2JDDAUsKuQ3
	UT3BvAorap2nUWvi1urwpo27vHatyteD/iff4weBAkBhYqc3Qj6x2a78npB9g5vS9N2gPL5niaat7
	ZChZa4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK9KS-00000003ZL4-2xtX
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 04:23:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK9KQ-00000003ZKQ-2TsT
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 04:23:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JNUxxL025755;
	Thu, 20 Jun 2024 04:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Bj8FJaMCS8jKnX1VnafPVpgiQEJjcKXalQEuVh9L90=; b=Y+CLMb35A1utbT/Z
	rju8nONoEcR7OFH1Gui1g6/8Jggf65eVMywDb5FVIYH0Y1UkQ/3CRhumLDByPTbM
	Y+4tnmMxTJji3n+ncT3Vg3AUH5M9+t3bgg0A7dDWy7lo7m/jibvepnJFSMeIdXc1
	KOMuSqc7ckzxCOlSFo/LZiXHP8FRABRb0F0NSgv1DKx5J/q3hC7zXhPX6v/pCKyO
	ItHAumSMWDdbvnDEqYfQvH3LQHLtHFrwGVQzPi7IcooyRpCbuy2p1q6DWzExXo67
	qwbaxhL4a90po0yKwAELWQpi5PgVVWf87H+D9sRUNgD1v5M7So4P3dYfYlcQoOti
	HUJmcg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4kcd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 04:23:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K4NEB8001593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 04:23:14 GMT
Received: from [10.152.203.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 21:23:12 -0700
Message-ID: <d1e9897f-c093-48ec-b887-2f5398ea9aa8@quicinc.com>
Date: Thu, 20 Jun 2024 09:53:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single phy
 devices
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Lingbo
 Kong" <quic_lingbok@quicinc.com>
References: <20240611043342.2672998-1-quic_rgnanase@quicinc.com>
 <878qz1kokv.fsf@kernel.org>
 <eb7ab3a3-4365-44fe-a33b-fdcd47524778@quicinc.com>
 <874j9olu7u.fsf@kernel.org>
Content-Language: en-US
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <874j9olu7u.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t1V4N_UjHbbbB7QnBX0_LHQTsPZ3meKp
X-Proofpoint-GUID: t1V4N_UjHbbbB7QnBX0_LHQTsPZ3meKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_212318_678028_8580F1BF 
X-CRM114-Status: GOOD (  16.39  )
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



On 6/19/2024 10:56 PM, Kalle Valo wrote:
> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
> 
>> On 6/19/2024 7:43 PM, Kalle Valo wrote:
>>> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
>>>
>>>> From: Lingbo Kong <quic_lingbok@quicinc.com>
>>>>
>>>> Pdev id from mac phy capabilities will be sent as a part of
>>>> HTT/WMI command to firmware. This causes issue with single pdev
>>>> devices where firmware does not respond to the WMI/HTT request
>>>> sent from host.
>>>
>>> But WCN7850 already works so I'm not really understanding the bug
>>> description. Can you elaborate, please?
>>
>> pdev id from mac capabilities sent as a part of HTT stats request or WMI
>> control path stats request was not expected by WCN7850 and hence fails
>> to send the stats response.
> 
> Ok, now I understand. Please include that info to the commit message.

Sure I will add the information.
> 
>>>> @@ -81,5 +81,8 @@ int ath12k_mac_rfkill_config(struct ath12k *ar);
>>>>  int ath12k_mac_wait_tx_complete(struct ath12k *ar);
>>>>  void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
>>>>  void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
>>>> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar);
>>>> +u8 ath12k_mac_get_target_pdev_id_from_vif(struct ath12k_vif *arvif);
>>>> +struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k *ar);
>>>
>>> AFAICS ath12k_mac_get_target_pdev_id_from_vif() and
>>> ath12k_mac_get_vif_up() can be static, no need to add them to mac.h.
>>
>> Ah! Sure Kalle. I will take care.
> 
> Thanks.
> 
>>> So we are left with ath12k_mac_get_target_pdev_id() but I don't see it
>>> called anywhere. Isn't that dead code we are adding?
>>
>> The wrapper is used by upcoming HTT stats and WMI control path stats
>> support. Initially this change was added in the HTT stats infrastructure
>> support series. Since WMI control path stats also depends on this patch,
>> to eliminate the another patch series dependency, I pulled out this
>> patch from HTT stats series.
>> This wrapper will be used by below changes:
>> HTT stats:
>> https://lore.kernel.org/linux-wireless/20240614063404.2659089-1-quic_rgnanase@quicinc.com/T/
>> WMI control path stats:
>> https://patchwork.kernel.org/project/linux-wireless/patch/20240529180920.1472003-1-quic_rgnanase@quicinc.com/
>>
>> WMI control path stats has to be rebased on this current patch. Since it
>> is deferred, I refrained from sending v2.
> 
> Ok, you could for example mention this is in a comment after '---' line.
> Adding dead code is usually suspicious.

Yeah sure. I will brief the usage in commit message as you mentioned.
> 

