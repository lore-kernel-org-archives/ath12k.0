Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5832DC52D73
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OaG93OVWa3c/MU+QduFh7Ljn3vB5Sy+MTjdH+1YsF4=; b=TKekXr6t4NF/C8hBbNz2tT8C93
	U+pJKrpypGw+7Tlp/jvAXf2UhA7hhnxI1xOVb3gF016DfBdanVSkMdYbzQibB4jyHhaYjcy4DDLCk
	/1mZTbaSq5vKSGsiyR1R12HSZvqPx49SQb1mGe03r4e49peqXVic3KsB8gF3KzdpkcZO3h1TXwiZD
	/Pd8Ylskf+MZQadWGKhOOSjuns2+7c4ANNskrvI84v43hnBJZDz9IdlV1nDZXukGfKAoGH8/gATnV
	NReaMLfbkN49oJVxI5g05oJBPVBO65mv4+6qn2+k+kugqvLyT9CfFNJFi1m/+xPGAtejLJhf2nied
	DAvxKufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMh2-00000002Iaq-3yEA
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 16:05:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMdk-00000002HJO-3Bua
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 16:02:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476BfYvD013610;
	Tue, 6 Aug 2024 16:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2OaG93OVWa3c/MU+QduFh7Ljn3vB5Sy+MTjdH+1YsF4=; b=ZPuEDhEbA7zgrHNR
	HXy8Q6UeXg4uRyVnl0T6UbE8DMCN1rHoy+tPJMZuDKd09NjbQN0fueJwaCKdg9/W
	SQeQEIEIx7WTmOKcHh/6SpDa2BsCmW/X8hDNYxyW7ENt507raGA4++UoPkIaVvY7
	0J5VL1fbGfgfhdufmi6HysEUoC1YO8WrAG6MPVkjEbZoPr1UZDpdn10s/xpVbgdL
	oRIsICSWeDOb122+tpNUvg1XsYlkw7ykJpvgfGFYQ3w90uLwG1VHzLABbVBtYp1a
	FbRyxic9V7WLsX74+DzU32uiWmtACdW5bDprauUGovditrfXO2GVuXr9yB3dE0Ee
	l8s45w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdu97ua4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 16:02:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 476G2K7I014655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 16:02:20 GMT
Received: from [10.216.31.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 Aug 2024
 09:02:17 -0700
Message-ID: <1510a11a-c31c-4a05-80c0-bffa81fa340a@quicinc.com>
Date: Tue, 6 Aug 2024 21:32:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
To: Kalle Valo <kvalo@kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Sriram R
	<quic_srirrama@quicinc.com>
References: <20240711165511.3100433-1-quic_ramess@quicinc.com>
 <20240711165511.3100433-2-quic_ramess@quicinc.com>
 <87plql6djk.fsf@kernel.org>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <87plql6djk.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0e90sPM32qo_N9QhDSDSwFseHc6XlBH8
X-Proofpoint-GUID: 0e90sPM32qo_N9QhDSDSwFseHc6XlBH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_12,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=820 suspectscore=0 malwarescore=0
 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408060112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_090224_926281_8BAE1A64 
X-CRM114-Status: GOOD (  14.46  )
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

On 8/6/24 17:58, Kalle Valo wrote:
> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
> 
>> From: Sriram R <quic_srirrama@quicinc.com>
>>
>> To prepare the driver for MLO support, split the driver vif
>> data structure to scale for multiple links. This requires changing
>> the use of arvif to per link and not per hw which can now
>> comprise of multiple links.
>> Also since most configurations from mac80211 are done per link, do refactoring
>> of the driver functions to apply these configurations at link level.
> 
> Something I noticed while reviewing this patchset:
> 
>>   static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
>>   				       struct ieee80211_vif *vif)
>>   {
>> -	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>> +	struct ath12k_link_vif *arvif;
>>   	int i;
>>   
>> -	memset(arvif, 0, sizeof(*arvif));
>> +	mutex_lock(&ah->conf_mutex);
>> +	memset(ahvif, 0, sizeof(*ahvif));
> 
> Here we are we clearing ahvif so ahvif->deflink is NULL.

deflink is not a pointer member. It is statically defined inside ahvif. 
So basically this memsets the whole deflink memory region to 0.
> 
>> -	arvif->vif = vif;
>> +	ahvif->ah = ah;
>> +	ahvif->vif = vif;
>> +	arvif = &ahvif->deflink;
> 
> So here we assign arvif to NULL.

This would be a still valid pointer.
> 
>> +	arvif->ahvif = ahvif;
> 
> And because arvif is NULL this is a null pointer reference, right? Or am
> I missing something?

So since it is valid pointer, this is not a NULL pointer de-reference.

-- 
Aditya


