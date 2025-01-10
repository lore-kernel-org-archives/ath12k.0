Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3065BE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vQDTu8f6hV05Siw56Nv8aFADGRJErCXhVsEQ3XeP2I=; b=NKGNZj5BQLYL5GfadMfWxZh8to
	lI9tEckawzQ9RCvjuwuS9WMUK97KuLE/IgHifbV7Zef/R51t/wuQ5AN6ZA/SpNIeFcpsOVSQ4oILr
	etC4b0MD1jGJf9dbLgEPZT0pl2VVfmixl7iZOVmRTrmvTJyhiizeobGkvw3NsS1IszkXta8Oax8jI
	av15QzZUfIrK2Vdw2zb0HScixogzXBvf8gBLTFzpcszABr4qwVV18nx3JepFulJ+yXV5yYklksuO6
	gt2eFf9yxwww8efOh4tP7lZ3eJp6/5Kf9ebMGYIzTlzDqdKj87OlYN8hke/1D0Rx0AhoZkbktiZEa
	cksuQi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKZd-0000000GkGi-3lCI
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 19:21:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKZa-0000000GkG4-3NUm
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 19:21:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AFEmp3004043
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 19:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vQDTu8f6hV05Siw56Nv8aFADGRJErCXhVsEQ3XeP2I=; b=CwxdJ8GXA8a1EdXO
	/iS8wRuoYsRIrPRAhwzqjbSjVRImUdJk1maPLXaIRlp0Hq9b2ZGqXW5vtOBtvVhf
	wl9hbQOWPwDamOv21qd/nzXTCNYXPQqkq77eVhh8i0RvgBkHwo8Gzh8sQHvsjPo9
	rcMAW1mBJ4/EGGeBQa3CNSnyZBcNu6LWVfHtkouEXTwF4mBGyUD7bn+oxxkjcN01
	fasSPygC+71RMwqV2rfi+d4Q4W8+0fDlG6NCGG/doyWyfpLOoeVPziXVAtj9IMA9
	j2aaTrWbRbnFMJz22waj2yfJXMk7FCXqdD3VKqlJxs/HAHAAaUbyZzwIJyyq2acI
	+pbV7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4436188k7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 19:21:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AJLVdi009567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 19:21:31 GMT
Received: from [10.111.179.128] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 11:21:30 -0800
Message-ID: <320dcf5a-3506-4fcb-a7a4-71ba4e972158@quicinc.com>
Date: Fri, 10 Jan 2025 11:21:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix invalid data access in
 ath12k_dp_rx_h_undecap_nwifi
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <20241122174252.2067375-1-quic_tamizhr@quicinc.com>
 <75c641d9-26f5-4d42-bd48-14b1606ba4d9@quicinc.com>
Content-Language: en-US
In-Reply-To: <75c641d9-26f5-4d42-bd48-14b1606ba4d9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iuO7E6CmkKmwmmugh5uwygbwzHQ-aj9-
X-Proofpoint-GUID: iuO7E6CmkKmwmmugh5uwygbwzHQ-aj9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112134_855843_8D8AAC5A 
X-CRM114-Status: GOOD (  14.03  )
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

On 11/22/2024 1:07 PM, Jeff Johnson wrote:
> On 11/22/2024 9:42 AM, Tamizh Chelvam Raja wrote:
>> From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
>>
>> In certain cases, hardware might provide packets with a
>> length greater than the maximum native Wi-Fi header length.
>> This can lead to accessing and modifying fields in the header
>> within the ath12k_dp_rx_h_undecap_nwifi function for
>> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
>> potentially resulting in invalid data access and memory corruption.
>>
>> Add a sanity check before processing the SKB to prevent invalid
>> data access in the undecap native Wi-Fi function for the
>> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
>> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> 
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> One nit...
> 
>> ---
>>  drivers/net/wireless/ath/ath12k/dp_rx.c | 42 +++++++++++++++++++++++--
>>  1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> index 0fb39c174475..26ff9a346dca 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> @@ -2474,6 +2474,29 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
>>  	ieee80211_rx_napi(ath12k_ar_to_hw(ar), pubsta, msdu, napi);
>>  }
>>  
>> +static bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_base *ab,
>> +						   struct hal_rx_desc *rx_desc,
>> +						   struct sk_buff *msdu)
>> +{
>> +	u8 decap_type;
>> +	struct ieee80211_hdr *hdr;
>> +	u32 hdr_len;
> 
> try to keep reverse xmas tree format

will you be posting a v2?



