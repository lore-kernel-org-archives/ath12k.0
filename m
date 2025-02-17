Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0BC021A0
	for <ath12k@archiver.kernel.org>; Mon, 17 Feb 2025 03:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHOT/tIVc3KEdfX3aJDRjS0QlWTWE2GxKNZqfA9jy5A=; b=ov+lQ8mNvRVgcgPcclXoN27tp8
	YEJYHtCwUBP6s7fxaTk4lQNuK9VZk6CrVgbfN+GT4p6GJ3LLykhX7eFAaR592Mps+bKk1jdnfM5ER
	cZwkkBcQo2D1Kqxvxofer343Muf+YvGp+uSylt8lMOWD04CcVfQV+P3bJ94NcljYEkooMdBxcg/Vv
	TCJrw7rn++6ZB7txeclpEfMpP2Kp9IjsAEhhuJzEYKINtEuHo3UQ+tWjZRnGJj81ZblFl8cVwlg0j
	9nETqYekA1Xcfx7ITQObq6TdwRkwWDeCgLreAEQPjBdsqCQfv/opmBwaC0YejKEFdoMhj+VnioBjh
	YWtDZrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsBW-00000003AFk-0ogC
	for ath12k@archiver.kernel.org;
	Mon, 17 Feb 2025 03:52:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsBT-00000003AEw-0Heg
	for ath12k@lists.infradead.org;
	Mon, 17 Feb 2025 03:52:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03DDM022862;
	Mon, 17 Feb 2025 03:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHOT/tIVc3KEdfX3aJDRjS0QlWTWE2GxKNZqfA9jy5A=; b=WYTyPHX9MjqytOsU
	MsoaVjMep6iAB/V58YMz8wBFadN9S/7Q1LWS5MiTSkKVNa0C2sOQKog2Z16oVXYJ
	g4yxbCD9cfgho8TB7RIPOAH/cLKScqz5lPvQ7n8g4oAjKCyiPn39HqX6JdZSZAl4
	Lw7Anv5BpaBaaaKvkt1IsyG36J5at84HEo6RSPYPzxoOCuWrRk3FIMtOxURQHEz/
	nKzfgBXaaMocyLQG7hhzYBLf5DPUPdLaAffNq24sv1ByEsJzAmY16ullo1I+WFTX
	FSWAKtwTzn/hTNgqK1M3OlR3SoSlJdOcCiwjxnMj76FUdnsr5DhfIoKfYoKLm6ic
	VP6jyw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vgcmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 03:52:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H3qa5d024687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 03:52:36 GMT
Received: from [10.152.201.120] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Feb
 2025 19:52:34 -0800
Message-ID: <32bf3919-8347-497c-a534-0d61a935eb47@quicinc.com>
Date: Mon, 17 Feb 2025 09:22:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: mac80211: correct RX stats packet increment
 for multi-link
To: Ben Greear <greearb@candelatech.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>
References: <20250213173206.1665731-1-quic_sarishar@quicinc.com>
 <20250213173206.1665731-2-quic_sarishar@quicinc.com>
 <26f57f33-459d-4563-b0a5-2c5c287e1d55@candelatech.com>
Content-Language: en-US
From: Sarika Sharma <quic_sarishar@quicinc.com>
In-Reply-To: <26f57f33-459d-4563-b0a5-2c5c287e1d55@candelatech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jW5_WEWVChAx_f5neXrc1EA2FvVcamD-
X-Proofpoint-ORIG-GUID: jW5_WEWVChAx_f5neXrc1EA2FvVcamD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_195239_118242_EB433DFF 
X-CRM114-Status: GOOD (  18.74  )
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

On 2/14/2025 1:47 AM, Ben Greear wrote:
> On 2/13/25 9:32 AM, Sarika Sharma wrote:
>> Currently, RX stats packets are incremented for deflink member for
>> non-ML and multi-link(ML) station case. However, for ML station,
>> packets should be incremented based on the specific link.
>>
>> Therefore, if a valid link_id is present, fetch the corresponding
>> link station information and increment the RX packets for that link.
>> For non-MLO stations, the deflink will still be used.
>>
>> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
>> ---
>>   net/mac80211/rx.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
>> index 1e28efe4203c..eb3e2d550c8f 100644
>> --- a/net/mac80211/rx.c
>> +++ b/net/mac80211/rx.c
>> @@ -231,8 +231,19 @@ static void __ieee80211_queue_skb_to_iface(struct 
>> ieee80211_sub_if_data *sdata,
>>       skb_queue_tail(&sdata->skb_queue, skb);
>>       wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
>> -    if (sta)
>> -        sta->deflink.rx_stats.packets++;
>> +    if (sta) {
>> +        struct link_sta_info *link_sta_info;
>> +
>> +        if (link_id >= 0) {
>> +            link_sta_info = rcu_dereference(sta->link[link_id]);
>> +            if (!link_sta_info)
>> +                return;
> 
> I think if you cannot find the link_sta_info here, you should just use 
> deflink
> so the packet is still counted?
> 
> Thanks,
> Ben

Currently, we are consistently searching for link_sta, and if link_sta 
is not found, we return. We are not utilizing deflink when the link of 
link_sta is NULL. Additionally, while populating stats in station_info 
structure, we are checking sta_link for link stats instead of deflink.

I believe that filling the stats in deflink is not beneficial for MLO 
link-level stats.

May be Johannes can comment on this, if still required I believe this 
could be taken as separate changes.


