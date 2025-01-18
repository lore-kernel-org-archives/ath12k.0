Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0127DC02185
	for <ath12k@archiver.kernel.org>; Sat, 18 Jan 2025 00:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc58J9OB4PPRCWzPGXLTFxIIepsxQWHkofi1oIavTOY=; b=rXoh3eem1/Gu3hZTCDkOiPgG/j
	dEX/Dh3dF96X5R30mgM4wctF11cp0lFpNOAfSim/m0tgN7bq41k92bdpePJchbrp8AySH9dWGf40e
	5XsomiCLjdRTjDH7xf8RN50K72N99z3OZi9rjAFMjHl8ObSmqmxUiNHyrMXuegglIwXw6dUS8fMkI
	Hbpx07Rt1GUyKKx3bKhRAZf+4daoO5esr96Q714aAXJ2LoG13s+HAnR1wX5SkbUcCG9i9wB+9oNtS
	JOJ6TsEOZVMGQuQqY18ftmix1/aBf4ClqsBaKp9HqtSeOF685nlgo+iBMpYecH5c0MzjJZFwWgGE/
	vwJk5v4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYwoy-00000001cCI-2hEn
	for ath12k@archiver.kernel.org;
	Sat, 18 Jan 2025 00:36:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYwov-00000001cB7-31Qt;
	Sat, 18 Jan 2025 00:36:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HH49oE022007;
	Sat, 18 Jan 2025 00:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc58J9OB4PPRCWzPGXLTFxIIepsxQWHkofi1oIavTOY=; b=jtH0GsqySXK4nI46
	8iWf5e7M8lDC89yULrsBIBv07vjEOlkDGv8BE7wYSMPOCvwrQBOh9wmUx9z3Wck2
	j6gQOdiuCe6Xkg/SJy/1iypVDT1542aKIsyWUMWIGk9yB92kfofplC7LTjpkMQqp
	XFLPdVLUn4MYz/Llkm1K8uhcQCYCbKVF8mw5BPLaxmaT5/0jI0NEsKkIh4uUHPUR
	fjTV4KlBWjVbq4TX3kB33nVPH7ws/w+zghyFrTUr0tJkf1g2oAfEywV5SCwOfZ7b
	tLr6ve22I/NOonNxixPDVTmWIpByba4U0Lm/2CQkarTeDBCTU4vbb3RMTjUejVBh
	P4we/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447u9b0sqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Jan 2025 00:36:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50I0aBAK021105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Jan 2025 00:36:11 GMT
Received: from [10.38.243.19] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 16:36:10 -0800
Message-ID: <8a265410-4aaf-411d-a9c1-c215ef9ff412@quicinc.com>
Date: Fri, 17 Jan 2025 16:36:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] wifi: ath11k: refactor transmitted arvif retrieval
To: Sidhanta Sahu <quic_sidhanta@quicinc.com>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20250114223612.2979310-1-quic_alokad@quicinc.com>
 <20250114223612.2979310-2-quic_alokad@quicinc.com>
 <1df1e6b4-cb25-4abb-a6eb-1abaeeb5f588@quicinc.com>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <1df1e6b4-cb25-4abb-a6eb-1abaeeb5f588@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8r8aK7HHBJHvHuaB5LHJFnD-COw5ADq2
X-Proofpoint-ORIG-GUID: 8r8aK7HHBJHvHuaB5LHJFnD-COw5ADq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_08,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=723
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501180002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_163613_767470_2060CBDD 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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


On 1/15/2025 11:36 AM, Sidhanta Sahu wrote:
>
>>   +static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct 
>> ath11k_vif *arvif)
>> +{
>> +    if (arvif->vif->mbssid_tx_vif)
>> +        return ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
>> +
>> +    return NULL;
>> +}
>> +
>>   static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
>>   {
>>       struct ath11k_vif *tx_arvif;
>> @@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct 
>> ath11k_vif *arvif)
>>       u32 params = 0;
>>       u8 i = 0;
>>   -    tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
>> +    tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>
> ath11k_mac_get_tx_arvif can return NULL, below, we are accessing 
> tx_arvif without a NULL check. Shouldn't we add a null check wherever 
> applicable to prevent potential issues?
>
>>         beacons = 
>> ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
>>                                tx_arvif->vif, 0);

ath11k_mac_setup_bcn_tmpl_ema() gets called only when tx_arvif is non-NULL.



