Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD8CD597C7
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 02:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8YAhT/d7aoNiwh7l8uTfhTu93H32l1fd0Xwb9JY0UI=; b=RgmUS8aR0GIEc2ASyCM51ZcI2y
	wekzMQlPwIezOid3dadsHG7yiayTnGSLAHZJWaagukN87GsUL6AEg+8QL9/SC3GGuQQi4fLByb+uS
	OrJHj2unWPBMAhx5szuTZWSOfDLNulthoAtg0oKz86ssyGrONJOINNlt5+PAGDkfrpVGbp6/dEV++
	5RP3s6gwep1JQr69p74C1PIVsjjncj+i6VYmExPfWK577gPshJHnZw10wrO8ppzlZdrtulG8H+ChP
	5UxEiaM1hujX9MVXuKiY8fDGZHqRWkb0nUyUGM2Ws4U2tg4mrzRNqD0ITuLFZaLz8fgEzCsC8xt55
	3wVuUZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB3XZ-00000005d9Z-3StZ
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 02:55:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB3XW-00000005d9C-3eZa
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 02:55:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACNU1QL028778;
	Wed, 13 Nov 2024 02:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8YAhT/d7aoNiwh7l8uTfhTu93H32l1fd0Xwb9JY0UI=; b=UOlQcBfPYxPPiNNb
	G/vnAp/b5xSiC9+lToXa4ari1ykZ79GzpmuDHas4rlAG1JzlyrxrjA1ilcVZoILi
	PObzpoSK6XVtO+EombL6Se5gU9ihaNCFTU05ekw6gNNRojwB5tPR4FX5zqP2SERO
	luGsCMY6yFi0kmZHdkHmJ+MRfEuQcufHSfqmmzFOTwSSr//idi9QR0MjEgJe3+9Y
	jql1wN1JKZXG8FMprZJzHdf+snqTwJG11TPLBAxDOBY/l/+xS77eLmMZTZ/83NSf
	2TDk5XFbfZ9YUYk0qr36I9+UmJz5pmkztzZMp37Zk5mwI6w5C5KDbC3vuCgoQaT0
	7+fxzw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vgqqrckn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:55:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD2tPEZ007816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:55:25 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 18:55:24 -0800
Message-ID: <97f3f465-6ebd-4ca1-b672-4c8c7f42220d@quicinc.com>
Date: Wed, 13 Nov 2024 10:55:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-2-kvalo@kernel.org>
 <2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com>
 <87y11o2x9h.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87y11o2x9h.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KSyLEBddQT0RtKOBO4QaPUyyeRuinKW6
X-Proofpoint-GUID: KSyLEBddQT0RtKOBO4QaPUyyeRuinKW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=832
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_185531_071827_2733461B 
X-CRM114-Status: GOOD (  20.60  )
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



On 11/13/2024 1:10 AM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> On 11/6/2024 10:26 PM, Kalle Valo wrote:
>>> +static void ath12k_mac_unassign_link_sta(struct ath12k_hw *ah,
>>> +					 struct ath12k_sta *ahsta,
>>> +					 u8 link_id)
>>> +{
>>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>>> +
>>> +	ahsta->links_map &= ~BIT(link_id);
>>> +	rcu_assign_pointer(ahsta->link[link_id], NULL);
>>> +
>>> +	synchronize_rcu();
>>
>> this looks strange: generally we call synchronize_rcu() to wait for
>> any RCU readers to finish, such that we can then safely free
>> something. but here we do nothing ...
> 
> Same comment as in the other email, this is to make sure that we don't
> continue the mac80211 call flow before all readers have the new value.
> Is that a problem? And we can always optimise later.
here this is a different situation from that in the other email you referred to: we are clearing an RCU pointer here, so a synchronize_rcu() is necessary for the purpose of safely freeing arsta. But ideally the code flow should look like:

	rcu_assign_pointer(ahsta->link[link_id], NULL)	
	synchronize_rcu()
	if (arsta != &ahsta->deflink)
		kfree(arsta);

However the patch is doing nothing after synchronize_rcu().

I know the actual free happens immediately after ath12k_mac_unassign_link_sta() returns, so there should be no problem. But it really looks odd to get them split.

> 
>>> +static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
>>> +					      struct ath12k_sta *ahsta,
>>> +					      u8 link_id)
>>> +{
>>> +	struct ath12k_link_sta *arsta;
>>> +
>>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>>> +
>>> +	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
>>> +		return;
>>> +
>>> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>>> +
>>> +	if (WARN_ON(!arsta))
>>> +		return;
>>> +
>>> +	ath12k_mac_unassign_link_sta(ah, ahsta, link_id);
>>> +
>>> +	arsta->link_id = ATH12K_INVALID_LINK_ID;
>>> +	arsta->ahsta = NULL;
>>> +	arsta->arvif = NULL;
>>
>> if arsta is not deflink and would be freed, can we avoid these
>> cleanup?
> 
> I think that's something we can cleanup later if needed. Sure, it's
> extra assignments but it's not really doing any harm.
exactly, but ideally we should avoid unnecessary effort if possible.

> 
>>> +	if (arsta != &ahsta->deflink)
>>> +		kfree(arsta);
>>
>> I know the actual free happens here, but why split them?
> 
> You mean why have a separate function ath12k_mac_unassign_link_sta() and
> instead just have all code the in ath12k_mac_free_unassign_link_sta()?
yes. such that we can have synchronize_rcu() and kfree() located together.

> 
>> these two hunks give me the impression that we may (in the future?)
>> have cases to call ath12k_mac_unassign_link_sta() alone somewhere else
>> rather than directly calling ath12k_mac_free_unassign_link_sta(). am I
>> feeling right? what are those cases?
> 
> At least I'm not aware of anything else calling
> ath12k_mac_unassign_link_sta(). So I'll just remove that function and
> move the code to ath12k_mac_free_unassign_link_sta().
> 


