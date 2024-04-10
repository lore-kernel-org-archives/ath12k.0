Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B262CD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqlF9ltvyfYr20la98qPBUceL3GYzkU6FwVXCNPe+J0=; b=ukyizE6wydKHuE4kqrtVCHhMlj
	vtL5Uk7qdRw8AaaWCSQ0lbkl9W66K/txyyhDi/OmvxlhnFl2Nxv3WhTgRVwKIKPfZvcYes71vGhQn
	q6VcbUguY+5M7qYn0XVBGZYcFVcRDZwXWrVEEL61KRisXPzw13ZmQKvhZByxHEx9Mm5JWz2BF82V7
	qMCXGzJwvNnL3BOjFbLBJyRia47aWQN5Up5T/Zv2Wh/k0Pwvday0pt/WF3qU1dC5rgUlHi/USEMP3
	iVlAj+x7Cw3Hdz2RdY5Xe0cv/mPo9LVM8N1eoc3XAWjSQsbHv5TYlOwx3QKO1KRIPZ7QuNQkRnDPP
	UjStIWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWhm-00000006nNP-3Xz0
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 12:05:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWhj-00000006nMX-24ZV
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 12:05:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AAQ4hg005304;
	Wed, 10 Apr 2024 12:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GqlF9ltvyfYr20la98qPBUceL3GYzkU6FwVXCNPe+J0=; b=RD
	Da9XFUJMpucWeC+/oMxz/Jl7uaobzkxOXsgN/+sU2hZWxf+TJbC2fSndumuNnpju
	bNIATLatfaN3aoygp49ZILnYAuGHfZ2cFT1Ma7ismc2+PnJ8fkMECeeEiimbopJB
	c4k5QOln9nyGzu/53t3Z/T+6kWe3tbN2zHmuU8gTjhhiwbUpHKC+tMEzWXVQYR/y
	7uzG/Ualm9bskqMiX3VLx91SuBl3+5JAW1mjpuObihETvYFXk80UJAO/AiEVc7LM
	Tcji25ZkDcbxicbpcZocHrh9WWSYQt7/Ql5qaAeiLcsnZvoU/XockfVlOtQc/waD
	xt2tERNfGW6DyDP0qWng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdh6xbf2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 12:05:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AC5Nsj022326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 12:05:24 GMT
Received: from [10.50.38.146] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 05:05:20 -0700
Message-ID: <3b9fe049-0f96-48f3-b52b-6c0bc6cfff16@quicinc.com>
Date: Wed, 10 Apr 2024 17:35:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable service flag for survey dump stats
To: Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
References: <20240409175604.3299752-1-quic_kathirve@quicinc.com>
 <1e515bbc-0119-4114-b44e-d7a449b031f7@quicinc.com>
 <c47aa30f-cebb-4460-a78c-9a8df4f9e85e@quicinc.com>
 <87seztzj35.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
In-Reply-To: <87seztzj35.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EgNanT9_ATe8kWqKw2w5jHTxG3f9RAug
X-Proofpoint-ORIG-GUID: EgNanT9_ATe8kWqKw2w5jHTxG3f9RAug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_050527_688433_E068099C 
X-CRM114-Status: GOOD (  14.54  )
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



On 4/10/2024 2:32 PM, Kalle Valo wrote:
> Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:
> 
>> On 4/10/2024 5:37 AM, Jeff Johnson wrote:
>>> On 4/9/2024 10:56 AM, Karthikeyan Kathirvel wrote:
>>>> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
>>>>
>>>> The survey dump statistics does not display channel RX and TX time
>>>> properly because the survey flag is not enabled in the firmware service
>>>> flag.
>>>>
>>>> If firmware supports enable the service flag "bss_chan_info" in
>>>> wmi_resource_config to fetch and print the stats for specific pdev.
>>>>
>>>> Enabling WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 does not have any impact
>>>> on WCN7850 since this bit is not utilized by the WCN7850 firmware.
>>>>
>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
>>>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
>>>> ---
>>>>    drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
>>>>    drivers/net/wireless/ath/ath12k/wmi.h | 1 +
>>>>    2 files changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
>>>> index a5575ce9eed4..16504786735a 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>>>> @@ -3324,7 +3324,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
>>>>    	wmi_cfg->bpf_instruction_size = cpu_to_le32(tg_cfg->bpf_instruction_size);
>>>>    	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
>>>>    	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
>>>> -	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config);
>>>> +	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config) |
>>>> +				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
>>> shouldn't that | operation be inside the ) ?
>> Yes, will address in next version, thanks for the review Jeff
> 
> BTW ath12k-check should catch these kind of errors. Didn't it warn about
> it or did you just skip running ath12k-check?
> 
I was using checkpatch.pl alone, now moved to ath12k-check, ath12k-check 
warnings are fixed in "[PATCH v2] wifi: ath12k: enable service flag for 
survey dump stats"

