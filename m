Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9FDC54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNPHlBdYkUZSf1G1/L2zsqXGaiSzXuU1Y8qLYhyS7n4=; b=M0z6+zmlwrXGKe6xjrpu7JdkEK
	o739Hm3t52bTCkhgZgDOCO7s1M+rlnxyCGqPHD2WUXKpNzm+WUvdHVUTOfBnpEsyvADB56XMj+5wo
	6FjntAe66waMd6YVXowpHxe/Zo+8++jqmyGRity9d4gOnz3j6QXvzSMOok8png3DPU1v7CYvNs5/H
	opUEicWIgrlWJj77+teEoRUuZzG0MJi0oGavkV+oNumnbq155gk76SJJMeEemo0yTn5MFHkNf01vR
	E4G7uC//Cz/lbJQ9y8Cm6IdJK/JJaTNNKMfE8GE/ubN6niTEUblvU0mArH4ia73pt2m/CSucsgVL6
	vP7uPU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkoAI-0000000F2PP-3HQS
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:42:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkoAE-0000000F2NS-1TTx
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:42:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E7K1W4026029;
	Thu, 14 Mar 2024 16:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=XNPHlBdYkUZSf1G1/L2zsqXGaiSzXuU1Y8qLYhyS7n4=; b=S3
	WqRZ0/A20poPzbK8ckE0we12pcGvjOAclaohWAMmHshCeaLBDCPzpYkBfLFf6LtA
	2soAtE9aSprHEhS5JtzeTb8guCq+cOXKgEq9GsxRQZ+t4ZnG/97DT6aJKvAv21H4
	UHURdywCKiJsbdNaFFwsV3rdHq7PUFAABhzyp2SSSsz/gRetJZAq+Cb3cL1K7k8D
	WXtaZGO+Yz64LRqe6OfC2StTWViv5yYwha1j8031PySwLpoupq4Z8EWf3vw1GhGG
	3y/y76V7wjxVEXRUHe3qHqj9PszQzQ6Hlbjh0gIalNadBsUqzYdmXIAyAUjLuBJ0
	2IohEjSLSu+e6ESFbyFA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wusxghjv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 16:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EGg9WK003821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 16:42:09 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 09:42:08 -0700
Message-ID: <50b2d162-00a1-4001-894b-d5560c4226b2@quicinc.com>
Date: Thu, 14 Mar 2024 09:42:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Miri Korenblit
	<miriam.rachel.korenblit@intel.com>,
        <ath12k@lists.infradead.org>
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
 <20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
 <87bk7g4x08.fsf@kernel.org>
 <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
 <87plvwepjq.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87plvwepjq.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6jbGhKt9NOXLPI7f8T7XdVSOqNIWxqhl
X-Proofpoint-GUID: 6jbGhKt9NOXLPI7f8T7XdVSOqNIWxqhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=377 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_094242_898711_51A07CEC 
X-CRM114-Status: GOOD (  10.82  )
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

On 3/14/2024 9:39 AM, Kalle Valo wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
> 
>> On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
>>>
>>>> -		hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
>>>> +		hw->wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
>>>
>>> I think we should add the same for ath12k, right?
>>>
>>
>> It's really up to you, I think. I'm hoping to even get this into stable,
>> FWIW.
> 
> ath12k doesn't support MLO yet but I feel that disabling wext already
> now would be consistent from user's point of view.

Now that I understand what this is doing I completely agree. We should prevent
the use of wext with ath12k.

/jeff


