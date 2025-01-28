Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E45C0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waasbAwmzj7ujLbfya5oMoQ+CaPf2PErneHn+u2V5JY=; b=OM+GSVO3HoKadjbJZkznNNPBcP
	jiFzlylUkqSne+eyqE6el+LvGQlGHDaua8zDlI5vPSZ5VbSIm2gn3fCsds/zV/OT16WTPoSz/vgZu
	P808l/tJcQmNpwejtbZPa8nEF9TNHElmbKQeVvtOZDirhrqrNHgmi8lCV9u8snUxE7S6GQC0UvTh6
	fGNAPvmxPxfVucLAhk6dhruJBPwbB26QU3EVi22UdRUHoIxdCXIhBw7fb0Fghp/aer/qN+gO3gV1h
	9nTZlTVELRmdc/yvkQf/6SwUtDBfSRze6XePwIReag31tSTqhgCSaiHzqa45zgSmKhcl0bToElnmo
	jHVLuUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqZI-00000005cY9-3S2F
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 18:44:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqZF-00000005cXo-2HMD
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 18:44:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SH6ibc032661;
	Tue, 28 Jan 2025 18:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	waasbAwmzj7ujLbfya5oMoQ+CaPf2PErneHn+u2V5JY=; b=bfZAiT7JBGavVxpj
	oKDKC41aLm9hb9J6OKLKYDqBeRUH7tnqY32k8CzYDa0mmnY5AzzJ0dZHEXvUPiTB
	dYggMLn4dsf6O5ylSF17rkGMkYrGbtfZLYyIqpxBTyiBRhtJ/umwZvueliRVZC8L
	s4kLEF4BsVTGbckTtFNkIsXSn/c7pchqnS6VS10tTKTgo+Rs6vLom867OlPC6zKf
	7eci2fzzYct6A2Ti1zMwhnk9eRVSIJq886yJE16yUmHYNA8b0Q8AJnaw1lnJHyi3
	bxkrDmiHsCPmlKnScgsiec59MoOUJj6EuoSFPvbm6AQ4FWQaF/NAtGr/5NZKjoq9
	miKwDQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ernksvq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 18:44:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SIi42c004156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 18:44:04 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 10:44:04 -0800
Message-ID: <961df6e7-0b5c-4972-9324-5c4d430cb172@quicinc.com>
Date: Tue, 28 Jan 2025 10:44:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
 <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
 <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gx0bl6nD4nIs3Aftg7pdH47GTKODw8PO
X-Proofpoint-ORIG-GUID: gx0bl6nD4nIs3Aftg7pdH47GTKODw8PO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_104409_728543_6D41B46B 
X-CRM114-Status: GOOD (  14.36  )
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



On 1/24/2025 12:26 AM, Maxime Bizon wrote:
> 
> On Thu, 2025-01-23 at 17:09 -0800, Pradeep Kumar Chitrapu wrote:
> 
> Hello,
> 
>> I believe, this is default GI based on device capability of HE for
>> ath11k or EHT for ath12k.
> 
> Your patch alters the behaviour of this code in
> ath12k_peer_assoc_h_ht():
> 
>          /* As firmware handles these two flags (IEEE80211_HT_CAP_SGI_20
>           * and IEEE80211_HT_CAP_SGI_40) for enabling SGI, reset both
>           * flags if guard interval is Default GI
>           */
> 	if (arvif->bitrate_mask.control[band].gi == NL80211_TXRATE_DEFAULT_GI)
> 	        arg->peer_ht_caps &= ~(IEEE80211_HT_CAP_SGI_20 |
> 				IEEE80211_HT_CAP_SGI_40);
> 
> 	if (arvif->bitrate_mask.control[band].gi != NL80211_TXRATE_FORCE_LGI) {
> 		if (ht_cap->cap & (IEEE80211_HT_CAP_SGI_20 |
> 	            IEEE80211_HT_CAP_SGI_40))
>                          arg->peer_rate_caps |= WMI_HOST_RC_SGI_FLAG;
> 	}
> 
> 
> I don't understand why a patch adding a feature to force GI would alter
> the current behaviour without any actual forcing ?
> 
Hi Maxime,

Apologize for my earlier comment. Firmware relies on peer_rate_caps and 
bandwidth settings when configuring GI. Currently default is configured 
as FORCE_SGI. When there is fixed rate settings configured from user 
space to override defaults to replace SHORT GI with DEFAULT_GI, the code 
snippet you mentioned ensures honoring this by removing HT_CAP_SGI_20 
and HT_CAP_SGI_40. The behavior has been same for ath11k driver as well.

I will get back with more detailed information as soon as possible.

Thanks for understanding,

Best regards,
Pradeep

