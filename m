Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E2C10F16
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSJXyLojc95CzlRegySG57zpsU09ycjRFGSiB4YgGH8=; b=BmV06Kjc/hY9zrX61TFre75Bll
	9feEtZDnDaZaoLCKWCYBql+jrPcU3S8/KmE3q0oxfIPl2++0zWSlkN6aGWZNywFBkOH728Jqyz4fF
	mjM4RcjDOiieZTOs9ssdm/uPbmSWpH0DfNTSixwifCtqFDR38dl/MRnEDyx78labcrR+KjWnsvcef
	YpF5MUjBX1/Ewlm0K8hyIccfwJ8O+eOBiLaK/J0IIem0wqBudTxDyniPV3R3L6C6cSzCX07IqBizD
	hgqRMXXSJHoPz16OFDzV6+jGp2urhvmCvXywwIP6J+eVqGGgTODwfW/k7CE60xGTAV3ZRKPVbxRev
	asNbFSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1i8M-00000005Tay-0AhH
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 07:42:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1i8I-00000005Ta0-2gvp
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 07:42:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7CMH2006602;
	Tue, 30 Apr 2024 07:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GSJXyLojc95CzlRegySG57zpsU09ycjRFGSiB4YgGH8=; b=h8
	EGiuqC36/gPUEemVrOUrwisrgrDM9EEYnuxlF7S3xO4jVx/gB0u3Y4RucJpCas1l
	jQjdAinF7l+5bG2F7C1ofEBRKo+ybhV+P3LsjobGyRHghcMfp1g81r3ljX85RcqV
	b3QQKyWRA0QCcziOEXzmoOwOd5MBwWEJjQg8wz91aiSx2DfOGYoSYsGr+PXmI40B
	ELGMF0yd751Fx7DS55KLun5zQQ2eMln4ZcRAUT+EyZwTd6IYh6lN3GeyM8eEK+o/
	uGa9N1+h+v7xxx4gz/AWa7dir+iw4KFGPW6DRUs9l9jaxluMEVLq09aBk/LWb8V6
	BAE7lWUB/zdi14sYEnvA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtv1hr20w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 07:42:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U7gUpI018029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 07:42:30 GMT
Received: from [10.151.40.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 00:42:29 -0700
Message-ID: <e7d71f62-9de1-413f-9695-96aa490daf63@quicinc.com>
Date: Tue, 30 Apr 2024 13:12:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] wifi: ath12k: drop failed transmitted frames from
 metric calculation
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429114841.413901-1-quic_kathirve@quicinc.com>
 <e1d428ee-0a16-4fc6-be0b-4c41036ff919@quicinc.com>
Content-Language: en-US
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
In-Reply-To: <e1d428ee-0a16-4fc6-be0b-4c41036ff919@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wKG-tLe4c69ARYUve4t-GjdCeokUSn97
X-Proofpoint-ORIG-GUID: wKG-tLe4c69ARYUve4t-GjdCeokUSn97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_004234_736907_B7EA96B1 
X-CRM114-Status: GOOD (  10.15  )
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



On 4/30/2024 12:16 AM, Jeff Johnson wrote:
> On 4/29/2024 4:48 AM, Karthikeyan Kathirvel wrote:
>> - Use ieee80211_free_txskb() instead of dev_kfree_skb_any().
>> - Drop failed transmitted frames from mesh metric calculation to avoid
>> false link metric averaging.
>>
>> Karthikeyan Kathirvel (1):
>>    wifi: ath12k: drop failed transmitted frames from metric calculation.
>>
>> Sven Eckelmann (1):
>>    wifi: ath12k: Don't drop tx_status in failure case
>>
>>   drivers/net/wireless/ath/ath12k/dp_tx.c    | 43 ++++++++++++++++------
>>   drivers/net/wireless/ath/ath12k/hal_desc.h | 22 ++++++++++-
>>   2 files changed, 52 insertions(+), 13 deletions(-)
>>
>>
>> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
> 
> 'b4' is barfing on this series since you posted 3 patches instead of 2:
> [PATCH v3 1/2] wifi: ath12k: Don't drop tx_status in failure case
> [PATCH v3 1/2] wifi: ath12k: Don't drop tx_status when peer cannot be found
> [PATCH v3 2/2] wifi: ath12k: drop failed transmitted frames from metric calculation.
> 
> Why are there two different 1/2 patches?
Uploaded an invalid patch by mistake, have removed it in next version v4 
and also replaced a dev_kfree_skb_any() by ieee80211_free_txskb() in 
ath12k_dp_tx_free_txbuf(),

