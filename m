Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375A4C25B75
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BoKMffnN13x1fegF+z2l1P9ra2w1+Z9uXxcaGttFy8=; b=Q95/+l06kPCeW8Lbn7WEJl8yh1
	t9i5IY2g0Vtev+Dpx1Ro2cMxwtBWgmuT8zwPvabTq+Q84zQFzE8ygMSfwnPRDjLOgt51VD2RHu30K
	kNvcyXEMa4HSqVvg4lgpTHvdvy4RIgUU8cJzWyASkBsJQX7UmlAPxbYSPdKfWRC9b7kyqJYWNNv8m
	i18KVQ7j0UKTRgujLuKN05a2q5Is307W+2VENX8bxP2iaqXcrIxk/uX+FIM8925SyfViyA+4lgria
	vCBS/jcO+Qp+ZrNioZqHwB8oAofRLCB4QUXpSWZv/3xLTtgIHuNckrFszItGCx0E+tTFqUHwwaWo3
	rfBn8wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HCt-000000023fe-3471
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 16:10:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HCq-000000023dK-00Zi
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 16:10:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90djK027077;
	Wed, 15 May 2024 16:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1BoKMffnN13x1fegF+z2l1P9ra2w1+Z9uXxcaGttFy8=; b=aP
	uCAAk1Y+4Yrp83IUwbmZ77CewH3L3KKXjp4c4eJId5QEWBQKAx1nFC7QJ+M+b8Ig
	eF4FNZWUzjmO8q0QIqFtongu1BIJiMKci+XCgfZcZLM5gxAJwPHFhtiXOkuSW6Xs
	hRlyocXTBowNX5LyTR5DZYUso/sVPOdZwU+Hrq5F9USE8bjCDeGn6EXN8HPe1rOC
	lkN0l/WULRefQKsdytUPwbUQEAfs7bIXKJFIaM302fekWkhIhBn8vE9ZN11ew+s7
	5sgK+R1X2dfIF2l/EciE0Bo+7EVC0b8SpdV1Z1EKnJZz6LXHaeikUOiMGo2vs4KV
	b1LY0ofIFXTiClXuz14w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egb8na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 16:10:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FGA9Rf002669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 16:10:09 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 09:10:09 -0700
Message-ID: <98a7ac4e-7ba5-453c-8b27-270ac7236677@quicinc.com>
Date: Wed, 15 May 2024 09:10:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-2-quic_pradeepc@quicinc.com>
 <3b7be076-9aa6-4f21-b9dc-7ee04cf26ce7@quicinc.com>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <3b7be076-9aa6-4f21-b9dc-7ee04cf26ce7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _DIZYtmYOwQS4lMojoaxvMHZZB77w93R
X-Proofpoint-ORIG-GUID: _DIZYtmYOwQS4lMojoaxvMHZZB77w93R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_10,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=964 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_091016_252551_737AFB51 
X-CRM114-Status: GOOD (  10.88  )
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



On 5/13/2024 1:49 PM, Jeff Johnson wrote:
> On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
>> Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
>> to pass EHT MU-MIMO configurations from user space to driver.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
>>   include/net/mac80211.h | 4 ++++
>>   net/mac80211/cfg.c     | 5 +++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
>> index cafc664ee531..d7b6f75bc920 100644
>> --- a/include/net/mac80211.h
>> +++ b/include/net/mac80211.h
>> @@ -701,6 +701,9 @@ struct ieee80211_fils_discovery {
>>    *	beamformee
>>    * @eht_mu_beamformer: in AP-mode, does this BSS enable operation as an EHT MU
>>    *	beamformer
>> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP) or transmission
> 
> suggest you reformat to fit in 80 columns
> (we allow code to exceed 80 columns when it improves readability, but comments
> should almost never exceed 80 columns)

Sure..Thanks Jeff, will address in next revision

