Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E02C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjJh1Dv9I/CKx9Qt+PkjvrrOsdV3HuBhVQesvmIQnC4=; b=EgVX41thcolhWDm4EFZ+U3UGVw
	X6qdtYzfoAWqCIHTNez50THZvySorVBPbjwx7RKT58ZF79IephPJ9xmBff1CGNO/0h6mNv9dKVz0V
	o0boejzy1nESv2PxjvGLuidjDW6h8HZSr4vbf24Tst+DZSNuJkUfEYpgr9NNcfU3eyoU4DGqmDjpk
	CzScW2nR+KoWmeIf/rrrX8Oo4Gu+jarh5+2jNwtHY1Zw0pUMJ/o2NKOSK6MqBlH6+H9E1bnLf/D1n
	x8ibdjWZkzrtmO7kF8YgTi7izsfLadNLuShaxh17OwNI81kdFNUt/oeukYfSuZcq4NAGlIITqWaxK
	Rb1O5lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pcs-00000002aDQ-0rcu
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 11:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pcq-00000002aDB-3jWA
	for ath12k@bombadil.infradead.org;
	Mon, 29 Apr 2024 11:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MjJh1Dv9I/CKx9Qt+PkjvrrOsdV3HuBhVQesvmIQnC4=; b=h/yeSlWKkxGXVtIZpcmIgASLYb
	ihsjWDrv/H9RIl1CFDspbmYJLdsDqLt3d77nRxdAWv8TMIZR5jLzkBEdO1FRZccY2vVXXCV9t1Htp
	HzV5jaxmVJ+HldKc6OwGbakKDTFXX1bAs8RVF7pmeUgFA45lHR3huKm4VY2TczbM+5QwgFFkO0tDR
	n2FDnAF6tQZj7HbBIvOt61JTegjDTrDtPKSwX/GRWha2v/zRxaHR72qJd3064JjLi4da96d8OwdAv
	nayop+kAYIe/FlSzj9Y2mb1tIHJfGM0ZKXu6xf3Se1VyfdlVQ6710/Qi0CnIJj3kZIC11oIdJWPD2
	dfdnHxEQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PaE-0000000GUDV-1wVv
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 11:56:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T4A3rr028353;
	Mon, 29 Apr 2024 11:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=MjJh1Dv9I/CKx9Qt+PkjvrrOsdV3HuBhVQesvmIQnC4=; b=II
	aw46/N0uo7UsBRB8uq9yS0cF3s++CRyab44Fm2IEE2nTnHmJo6qFYn1DCSRGoxf7
	7MQAnOpBNVSpSAYCfj1fPcuIK9yrmW54xtdpqGV0gqkVLqB5hdBkkoFcXYFo51Dv
	y4sZqp1kPPjbFZQpwbikKndxk/1n251DUATg8NO3LKL9ScIFuoBVdNhFXLB8T/QF
	1Ohk27HqdWilwds5VAJRxgPzz8QNRowHYISB7Vmox16ZS7U1goWl0vGff9IQ1HLE
	YZtbEVZzDfSwl3OyMp9Mqq1Petao4brxhAALrMDvMEPxSDHOdNhHv2Kq8fMD5eAj
	jb6Egrp+OwCbvCPu+Q8Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrpqruvqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 11:52:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TBqqtW010945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 11:52:52 GMT
Received: from [10.151.40.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 04:52:50 -0700
Message-ID: <2c7b4eb9-9666-4a98-9e43-cc8ffbfc3a8a@quicinc.com>
Date: Mon, 29 Apr 2024 17:22:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: drop failed transmitted frames from metric
 calculation.
To: Kalle Valo <kvalo@kernel.org>
CC: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240419170314.3117623-1-quic_kathirve@quicinc.com>
 <D0QHV8UV73N5.2N5E3MH37JQW7@gmail.com>
 <f4c65f7e-ccc7-4a0b-a6e8-df56d5c19d7f@quicinc.com>
 <874jbsv2hz.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
In-Reply-To: <874jbsv2hz.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WCPJXkBBUyI9BMQyTnyk5qzJhIMJgwC3
X-Proofpoint-ORIG-GUID: WCPJXkBBUyI9BMQyTnyk5qzJhIMJgwC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_08,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=823 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404290075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_125455_169420_A76D462F 
X-CRM114-Status: GOOD (  12.03  )
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



On 4/23/2024 3:12 PM, Kalle Valo wrote:
> Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:
> 
>> On 4/22/2024 1:35 PM, Nicolas Escande wrote:
>>> On Fri Apr 19, 2024 at 7:03 PM CEST, Karthikeyan Kathirvel wrote:
>>>
>>>> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_MPDU:
>>>> +	case HAL_WBM_TQM_REL_REASON_DROP_THRESHOLD:
>>>> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_AGED_FRAMES:
>>>> +		/* The failure status is due to internal firmware tx failure
>>>> +		 * hence drop the frame do not update the status of frame to
>>>> +		 * the upper layer
>>>> +		 */
>>>> +		dev_kfree_skb_any(msdu);
>>>
>>> Shouldn't this be ieee80211_free_txskb ? I'm not clear when to use
>>> which.
>>
>> Yes, there is an internal patch is in pipeline, that will take care of
>> addressing all dev_kfree_skb_any() to ieee80211_free_txskb() in
>> ath12k_dp_tx_complete_msdu(), this patch doesn't take care of that.
> 
> Let's not add new bugs knowingly. Please fix this patch to use
> ieee80211_free_txskb(), that is much more reliable than waiting for some
> other patch.
> 
Have addressed Nicolas comment(replaced dev_kfree_skb_any() with 
ieee80211_free_txskb()) in latest version "[PATCH v3 0/2] wifi: ath12k: 
drop failed transmitted frames from metric calculation"

