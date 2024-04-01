Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26423CD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xMEW3+SVtFhufOnoKM3ox1bPVltq/fwZhGsuzloJB0=; b=ORAufwj8y4D8Qxp4UzKMGS5h4L
	r2J5JSP1cyIhzv8rQ33+dQbjvCE7p+NgK4LWrhDN+siD1R5/Vsup3E+WBF1jbRkXd1fOkUsHQvN71
	DQtyoxgo/6udQrTfjX66xHmReXNq2S3kxD1n4qmFq5iMSagHsfGlkUhDD15+2F0Ys7zaLt97CStLM
	TZAaFGVVcOOMAKBiJd7r3QOyEU1497h8936gomG6qSGZgymYC23K0qmfu7sntjmZMy4O2Cx6JC687
	B4ZgfskQhTlpaHzXufoCBjT1O0D6PbgdU29PxxYzKdLJ1dN3E02VQGT9zQp0E8bZtovDbCvoBgpCv
	yr95F30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrM5I-00000008Wpb-2FpW
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 18:08:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrM5E-00000008Wp0-3oqW
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 18:08:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431GuwAK029404;
	Mon, 1 Apr 2024 18:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9xMEW3+SVtFhufOnoKM3ox1bPVltq/fwZhGsuzloJB0=; b=M1
	QtgQMs72R7k0fsTYbO6fnPX/be3URkdIMp0yWXxNTNnd/dlqSIiF1wqA9Xc8Goe5
	Y8I9+ghk/hbf0VkEZ9869j/8aYYRdmnJKLXtmHc7F8ZNf+Kem3B9DNmZwxT1poE4
	S+wSUCwLSh3ZdSXY9oRs8mFTqp5W816yOxXRsy0vbaAb0vnA6nYTzSxzvdIcwUsj
	p42YhxnHcHdkBcvdaWsYxc0EPN3OXbw/8oLZwt7yDPWmk6PyUIs6HxUxSnFJPkFO
	S3zHFhcZNhts5mRaEAdhTodszGhrDPWau1CB5H04FFW4sZ8aasgJQBYCM1dfmHSC
	UiULUQJXMaWHAukR/Mjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x80w5g72n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 18:08:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431I8WSN031419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 18:08:32 GMT
Received: from [10.227.91.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 11:08:32 -0700
Message-ID: <ea60844d-7d66-43a0-a298-2f89a6867318@quicinc.com>
Date: Mon, 1 Apr 2024 11:08:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
 <20240327170910.23975-8-quic_pradeepc@quicinc.com>
 <a217c752-65fb-4975-8208-c708a0ceeab8@quicinc.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <a217c752-65fb-4975-8208-c708a0ceeab8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BAwA91PtSBykupOyznrsnuoXGUJZeL5i
X-Proofpoint-ORIG-GUID: BAwA91PtSBykupOyznrsnuoXGUJZeL5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_12,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_110837_116669_B0AD3E83 
X-CRM114-Status: GOOD (  28.78  )
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



On 3/29/2024 2:34 PM, Jeff Johnson wrote:
> On 3/27/2024 10:09 AM, Pradeep Kumar Chitrapu wrote:
>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>> Reuse parts of the existing code path already used for HT/VHT
>> to implement the new helpers symmetrically, similar to how
>> HT/VHT is handled.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 588 ++++++++++++++++++++++++--
>>   drivers/net/wireless/ath/ath12k/wmi.h |  18 +
>>   2 files changed, 562 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 46ef2d63a3de..72232285d2b1 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> [...]
>> @@ -3888,8 +4130,9 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>>   	mutex_lock(&ar->conf_mutex);
>>   
>>   	nss = max_t(u32, 1, nss);
>> -	nss = min(nss, max(ath12k_mac_max_ht_nss(ht_mcs_mask),
>> -			   ath12k_mac_max_vht_nss(vht_mcs_mask)));
>> +	nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
>> +			    ath12k_mac_max_vht_nss(vht_mcs_mask),
>> +			    ath12k_mac_max_he_nss(he_mcs_mask)));
> 
> When I run this entire series through ath12k-check I'm getting the following
> issue here:
> 
> drivers/net/wireless/ath/ath12k/mac.c:4170:15: error: too long token expansion
> drivers/net/wireless/ath/ath12k/mac.c:4170:15: error: too long token expansion
> 
> caeed0eb7fb4d (Pradeep Kumar Chitrapu 2024-03-27 10:09:07 -0700 4170)   nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> 
> I don't see anything wrong with the code.
> 
> Even stranger is that when this series is in place, I see this same issue at
> another place:
> drivers/net/wireless/ath/ath12k/mac.c:7903:23: error: too long token expansion
> drivers/net/wireless/ath/ath12k/mac.c:7903:23: error: too long token expansion
> 
> But that is actually pre-existing code from the original ath12k driver drop:
> d889913205cf7 (Kalle Valo             2022-11-28 17:09:53 +0200 7903)          nss = min_t(u32, ar->num_tx_chains,
> 
> And the issue is not flagged when this series is not present.
> 
> However that same logic also caused the same issue in ath11k, and Kalle fixed
> it there with:
> https://lore.kernel.org/all/20231214161740.1582340-1-kvalo@kernel.org/
> 
> And one of the MediaTek drivers encountered a similar issue here:
> https://lore.kernel.org/all/5457b92e41909dd75ab3db7a0e9ec372b917a386.1710858172.git.lorenzo@kernel.org/
> 
> So there is definitely a tooling issue here.
> 
> As a local test I added an intermediate step and now I don't see the issue
> here:
> -       u32 changed, bw, nss, smps, bw_prev;
> +       u32 changed, bw, nss, mac_nss, smps, bw_prev;
> ...
> -       nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> -                           ath12k_mac_max_vht_nss(vht_mcs_mask),
> -                           ath12k_mac_max_he_nss(he_mcs_mask)));
> +       mac_nss = max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> +                      ath12k_mac_max_vht_nss(vht_mcs_mask),
> +                      ath12k_mac_max_he_nss(he_mcs_mask));
> +       nss = min(nss, mac_nss);
> 
> So let's add something like that in v3 (perhaps pick a better name)
> 
> (Even with this I still see the other issue from the original driver drop so
> we may need to separately propagate the ath11k driver change to ath12k).
> 
> /jeff
> 
> 
Sure Jeff, thanks for the details..will address in next revision

