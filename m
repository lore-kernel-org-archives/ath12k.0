Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B74FE7717F
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 02:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=308AwFRUc8/2z3xgz5XLjNsQzSeVHTgxgSRlrNZcop8=; b=ObEKTJPfGJ+1K74rQaT0p+cbjX
	T+xNOl9f+gqkWW+59UqdnCWFT3cGFdTN4yKGSpOrPo43KRZPNhIAazrigGHUN6AL3cZAf0dOe2PzO
	4g/ob4wwWfJnzgvdnUaiCicoNjDFOyPx3OJtDrSdyfjJOuXerU3dW7mKdZJDNGvcJMF2yBbnK0Km/
	sZ4aPnjcHI79uHb9yuHNAwNC0va75bghnSQ9KmCtmAv87TlU8EqSJCx5oX5NJMNmVSQZO+AV9OYIa
	gYpqx/S4+dh5r3gZYLAuRJRRk7rF+3RC303WdnokZ7sw2ohbDpy+ZEwi5UaKeJ++a6rSEnH+SN9Bb
	QyPqsqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCIz-0000000DUZn-02Wd
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 02:18:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCIw-0000000DUZO-3XlS
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 02:18:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAF9WMU026910;
	Wed, 11 Dec 2024 02:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	308AwFRUc8/2z3xgz5XLjNsQzSeVHTgxgSRlrNZcop8=; b=NdV+3Iu5Nd472R4O
	PQwmPpjzreBsHIKTcdiAnZNwyzDFWLQbXMbsxASzdMJarm9SfGbPw7IBI0RRFrAT
	TZrXpufr2POmGphuYpdWII1yWegZrrKohd4dT02TPsjwCsCOyQWXOcxkmQfWjDsa
	djtjCFssnIrbe6wXXcSM3+0H/vZIsJi0Gtb6Jpyd0VWIbu5d1to2S1RG43ITEDCD
	DBJBOs4XEbjoEiEtF/GiQ6q9jOqv8E+8NC4CnGcu+Vk/oMrwATtmXu7KTJeTyTnQ
	dmlsvycvoH6uMG00Wggm1un7BqfmyAE7kd9i3+aCac2igThcF0Bmgx9+gID0VOp2
	Oo2Gqg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eg9ek4sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 02:18:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB2IIaW026660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 02:18:18 GMT
Received: from [10.253.11.142] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 18:18:17 -0800
Message-ID: <3e22a453-5667-4c02-8b74-65db2f8b776a@quicinc.com>
Date: Wed, 11 Dec 2024 10:18:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH] wifi: ath12k: wait for chan update in reg_notifier
To: Ionic <ionic@ionic.de>, <ath12k@lists.infradead.org>
References: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
 <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
 <8b2a2c54f34c60f2170bd0cfc01c602dbb8e5d96.1733780780.git.ionic@ionic.de>
 <71b9b05a-55b0-4727-a1a1-eb57afe55637@ionic.de>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <71b9b05a-55b0-4727-a1a1-eb57afe55637@ionic.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o6_7S_Lk90TY2ZQtOfli3sIoaCvE2_8r
X-Proofpoint-ORIG-GUID: o6_7S_Lk90TY2ZQtOfli3sIoaCvE2_8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_181822_891425_A9884332 
X-CRM114-Status: GOOD (  26.46  )
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



On 12/10/2024 6:00 AM, Ionic wrote:
> * On 12/9/24 22:47, Mihai Moldovan wrote:
>> Currently, setting a new regdomain is asynchronous in ath12k, in the
>> [...]
> 
> Making the reg_notifier synchronous with the actual reg update fixes the 
> issue.
> 
> In short, when setting a new reg domain, the reg notifier is called as 
> the last step by cfg80211 before sending a regdom change event over 
> netlink, but since the reg_notifier is not waiting for the hardware to 
> apply the new country code to the firmware and update things like the 
> channel list, things can fail in user space.
> 
> 
> I implemented a regd_update completion in ah and added a wait call in 
> reg_notifier, as well as completing it in regd_update, with 
> (re-)initializers in mac_hw_register and mac_hw_unregister.
> 
> I'm not quite sure if ah is the correct place for that, but it felt like 
> the most appropriate. 

I think this place is right.


> ar is too low-level (since multiple ar can share 
> an ah IIRC) and it should generally not be possible to set per-ar 
> regdomains, although per-phy regdomains are possible, but every phy 
> should have an ah (I guess?). 


If the "phy" you mentioned is one wifi chip, i think you are right.

> Not sure how vdevs play into this.

Each chip at least have one vdev.

> 
> 
> Can you please test and review this? If it's already good, feel free to 
> include it in your series.

I will review and test your "RFC v2"


> 
> 
> ath11k is suffering from the same issue - I just haven't noticed it 
> before because the default regdomain of the ath11k-based card I use is 
> set to US, which allows operations on channel 96 to 144. If I set CN 
> first, I can easily reproduce the same issue with ath11k, so I'll have 
> to backport a good patch to ath11k as well.
> 
> 
> 
> Mihai


