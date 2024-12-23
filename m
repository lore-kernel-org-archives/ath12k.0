Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61AFE7718B
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 05:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:CC:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXCVZRigwx4iw2UGQod5yPNq2rDksO7iKjqAHBQ1Taw=; b=j1bkoWfhr2Xvj5qQUMXR9LodNq
	SMoDwDUgWbRKNQIHVSm23efN8HLe+eZPA6LkQ9N6ld7qsfA9UpXtam0qkJ0MpfpI/aIoCgTdvwSe8
	FSUyCeqXeI/lA0X/lbugjWMaCofiqHN5TiGcNlJebq6CO45r50+BriLnbd9o597BwxTID5cPfxMgr
	5kO377aJTpG5X5juI2A5tA15ksim8d8du6eH8/V9qBejKN4HnZJNieCf+XmIhVRacSe+M2mWNj/hI
	ITaspQ/nXUSNB9JQXBfjHHMlTbJgQAP/mpdFtriC1hDiCRWTwB4blGW3/Rb44b9QJlNHyfbd9s3l5
	NECd89GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbMT-00000009Msq-1eqn
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 05:52:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbMR-00000009MsP-0d1M
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 05:52:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN3Cdhb007890;
	Mon, 23 Dec 2024 05:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXCVZRigwx4iw2UGQod5yPNq2rDksO7iKjqAHBQ1Taw=; b=g4QMOzcQmg2E/jtH
	GDh5JNbHJmp8EXwKnijq4dZlNqCkpwmz7MvHEdhxROaCS/4+hGxWlamONCYPkYzs
	/yPJ5+d1iEqruXkwxrlVkZ8+FO5Xr3IpJVwbkoyUpsgrviZgTmv8ibpyHYBQcFo9
	vgAloZWtPJYj90Dt3Cf7kyz5/KbEanSAimcyJQJS9Ics2sw9pMfrobXVpdnihhNR
	7em7g0TqOIsazHn3kMO/tKtTUD/FWZPnLpM6Ens4QgauaSRbqvTfK9larPNInzsF
	VBNNYqYcTcQoYaR9QARQZsTSyySx68m7SHnn/XV2ffqXiTl3r9G1DSQiUBUYMkyq
	8Ev/7w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43pyrprg9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 05:52:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN5q9HH007639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 05:52:09 GMT
Received: from [10.50.9.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 22 Dec
 2024 21:52:07 -0800
Message-ID: <9b4b8604-02fe-446b-9db6-703381be9042@quicinc.com>
Date: Mon, 23 Dec 2024 11:22:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] wifi: ath12k: Avoid multiple times configuring
 monitor filter
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
 <20241221043014.1252841-4-quic_ppranees@quicinc.com>
 <12dd8c67-9817-f189-738b-87d3533998c9@quicinc.com>
Content-Language: en-US
CC: <linux-wireless@vger.kernel.org>
From: Praneesh P <quic_ppranees@quicinc.com>
In-Reply-To: <12dd8c67-9817-f189-738b-87d3533998c9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8ywiEfTifOWcwLqVn6dIx2OrJ95zByRw
X-Proofpoint-GUID: 8ywiEfTifOWcwLqVn6dIx2OrJ95zByRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_215211_206863_F09AD96C 
X-CRM114-Status: GOOD (  14.01  )
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

On 12/22/2024 10:45 AM, Karthikeyan Periyasamy wrote:
> 
> 
> On 12/21/2024 10:00 AM, P Praneesh wrote:
>> ath12k_mac_op_configure_filter() gets called multiple times during
>> interface bringup. Applying filter configuration from this function leads
>> to writing same filter configurations multiple times.
>>
>> Fix it by moving the filter configuration to ath12k_mac_op_start().
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++-------------
>>   1 file changed, 29 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index 6f10813d9378..2cb6e9b529d7 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -7237,8 +7237,34 @@ void ath12k_mac_drain_tx(struct ath12k *ar)
>>   static int ath12k_mac_config_mon_status_default(struct ath12k *ar, 
>> bool enable)
>>   {
>> -    return -EOPNOTSUPP;
>> -    /* TODO: Need to support new monitor mode */
>> +    struct htt_rx_ring_tlv_filter tlv_filter = {};
>> +    struct ath12k_base *ab = ar->ab;
>> +    u32 ring_id, i;
>> +    int ret = 0;
>> +
>> +    lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>> +
>> +    if (!ab->hw_params->rxdma1_enable)
>> +        return ret;
>> +
>> +    if (enable)
>> +        tlv_filter = ath12k_mac_mon_status_filter_default;
> 
> No need to disable the filter in the else case like below ?
> 
> tlv_filter.rxmon_disable = true;
> 
> 
Yes, setting this flag to true fully disables the monitor ring. I'll 
include this change in the next version.

