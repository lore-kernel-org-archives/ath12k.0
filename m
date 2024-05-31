Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1901BC25B75
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb+iaUW6DdlJnSDpiN1YqPO1vDQ8v64dWbqzF7/lRd0=; b=NPW2WT2H2/Kb6s4OBYRmoNIupD
	PrXc8F5nAKZNwdXuU6MQ6ERu1dR2Wy5qNpsvefQC30BkNQ3L16nRZAH0nvVTT7jGJBdglRBZAZg3h
	PL75xO3okE2iZ8V4iso7Ys12nY0aQBW6fKQrKeOJ5Qo2UcTuJyma3+rORMvQnKsas/T6cojwgtCwI
	uKIkWtQQtR1Ln2InrpqJ3gpKc2ilLeDurv0Z0tF8V9aoq1SXJFaTtzDsB8DDUMHIO+SHaQJeKqPDx
	F1UD8sCvGoddeTbgR8/r99eSboR50T2VLa/0foAuoeGRhhW3fTuqtXcg7SPIihx8UQk6BeNbvmXTf
	nm/NF5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD61n-0000000B0J1-1lBm
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 17:26:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD61k-0000000B0Ia-3bz7
	for ath12k@lists.infradead.org;
	Fri, 31 May 2024 17:26:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VFK0KO031709;
	Fri, 31 May 2024 17:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kb+iaUW6DdlJnSDpiN1YqPO1vDQ8v64dWbqzF7/lRd0=; b=nVKfI3AFYRtZ3hhP
	ytOauIc97cV6++YlMC5O6FFP15/mJx+m/JwKpTAnlN7JlvY8C4Al8hEzwAhMTza9
	i1h3OltXFVqH9WPBhWy0+WCDorRsU9Syp+m2d61YLVyCa0WrnQuIOcqdit2GSXlV
	8qmrfLt2L2S1/9uHVfLDcWNc19QItZr850vL+2SQHLBwMluKBmg/dNNJj6cNvg4f
	BBwHpX14HLSArWTnEJUM9eX0Nkf5Cw1nNkczoKwDCMWzYDn0x8IUqS43Rc2pr3H8
	E1im3fhHrb4Jyxvygi1JhWtvtLIxkVgtlrhyWgA9NLWgGB9cIyvF+OjCsmFWCL2E
	hpU9AQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf8xa1q1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:26:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VHQp5R030498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:26:51 GMT
Received: from [10.110.11.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 10:26:50 -0700
Message-ID: <29f1a482-2ead-474a-93a1-00616bcf06f8@quicinc.com>
Date: Fri, 31 May 2024 10:26:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] wifi: ath12k: support ARP and NS offload
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
 <20240530072714.25671-7-quic_bqiang@quicinc.com>
 <ccf9791b-e050-4844-8c37-35873fb3fcaf@quicinc.com>
 <17721436-19fb-4337-9058-b20f4df2792c@quicinc.com>
 <af326e49-df6e-4574-9562-44b6aee10abd@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <af326e49-df6e-4574-9562-44b6aee10abd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xwQXDhSs0_3H9RE0iaMZbX2RQMZHyxvk
X-Proofpoint-ORIG-GUID: xwQXDhSs0_3H9RE0iaMZbX2RQMZHyxvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_102652_939345_9DB92B56 
X-CRM114-Status: GOOD (  12.49  )
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

On 5/30/2024 10:11 PM, Baochen Qiang wrote:
> 
> 
> On 5/31/2024 11:42 AM, Baochen Qiang wrote:
>>>> +static void ath12k_wow_prepare_ns_offload(struct ath12k_vif *arvif,
>>>> +					  struct wmi_arp_ns_offload_arg *offload)
>>>> +{
>>>> +	struct inet6_dev *idev = arvif->idev;
>>> as noted above does it make more sense to get the netdev associated with the
>>> arvif and then use in6_dev_get(net_device) to get the inet6_dev rather than
>>> caching the pointer from the ipv6_addr_changed() callback?
>> Ah.. I didn't note that we can get inet6_dev in such a way, just thought the only way is to cache it in ipv6_changed() callback.
>>
>> will get it using the following in next version:
>> 	struct ieee80211_vif *vif = container_of(arvif)
>> 	struct ieee80211_sub_if_data *sub_if_data = container_of(vif)
>> 	struct net_dev *ndev = sub_if_data->dev
>> 	struct inet6_dev *idev = in6_dev_get(ndev)
> Just found that ieee80211_sub_if_data is internal to mac80211, so not possible to get netdev in this way.
> 
> any other ideas on how to get netdev?

Thinking about this some more, it seems like you'd want to send these down to
firmware immediately so that they'd be available for NS offload. Does firmware
support NS offload even when host is awake (I think the downstream Android
driver supports that)?

So perhaps an alternative approach is to collect the information you need from
the notification and then schedule a workqueue to actually send the
information to firmware?

