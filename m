Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59525C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6/TvoTpI/IEOQ8fdz/kQj4fOdnmlQAAoqC0Qu4RtWY=; b=zOaKq1f4D6s7RH/Zc1vuh0sjyB
	8EQnSpmEJT835WvjHkhYbFcwt/5f/e/WjMDpifJNjzkgBYpAi+7L4On+9LquRjn0zCAS8vX4/NaA7
	Cuv3j2DYj/8JwP3mQh4e0upHOyo0F9VJpLNsGrPwdh339xh3VZgBTLRxo+cj8nJPYGBF5wa0GKUL3
	9lV/jW1ZcsblmDLXaCrY1A/C39agQTwQZ805fKWnsalOo7eeu2Bife5o0/jY453cU9/NuHomw+GgV
	ASLgQqk5ax8QKSXDBWS6tHs9J5j5AzWPJfv3VkpfWN1KtI5/fmtCU3BSA8PLuNkzi/XNYfBFS0qv1
	u70YessA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryvnB-0000000E9l0-0DlT
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 15:41:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryvn8-0000000E9kg-2uYc
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 15:41:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M9P02m026628;
	Mon, 22 Apr 2024 15:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=x6/TvoTpI/IEOQ8fdz/kQj4fOdnmlQAAoqC0Qu4RtWY=; b=bi
	21P3t/d+sooxaYp0mfwgn94KIT98yjiK5TZVC559bgglEWuQoKzov4fd/yKod+Pz
	c5aV/SLsBlb6XkTl48H+EATQgJKcvk0sqAJZU7K7A0NM8rWv1IbSWRyNv3jGjz3o
	OR/610nu2jxDe0xicpF58sHUFG3oNdSTv0y+UYIQ1R9KVvgsyQr5EhHUGoAQYtAy
	BM2NtWOnemBSy2Bf92U6kRUs9+gTOyAGvUQksvigWzMsZ8UHLiiDHrBdsKvSM3gy
	szX7fRE39lY0aXiQg/8iLAjb/cY44e6ocRgXfJfmeW2ctoUw9Gr2nCgbDdwzn//p
	nozsVkzGJF8IvnuCMZCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnn82gxgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 15:41:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MFfBSc006803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 15:41:11 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 08:41:11 -0700
Message-ID: <5f63982a-eba9-4c5d-8ac0-52970316f940@quicinc.com>
Date: Mon, 22 Apr 2024 08:41:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix kernel crash during resume
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240419034034.2842-1-quic_bqiang@quicinc.com>
 <87cyqmhtoi.fsf@kernel.org> <87frvivufg.fsf@kernel.org>
 <87h6ftv8w6.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87h6ftv8w6.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6u3Z31HmjNFpErWWDKIvVYlwtNxiZdIk
X-Proofpoint-ORIG-GUID: 6u3Z31HmjNFpErWWDKIvVYlwtNxiZdIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=827 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_084114_774568_917E4C6D 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On 4/22/2024 6:12 AM, Kalle Valo wrote:
> To avoid breaking git bisect I now reshuffled the pending branch so that
> 'wifi: ath12k: fix kernel crash during resume' is before the suspend
> patchset and my plan is to commit the patches in same order. Does this
> make sense for everyone?
> 
> I had a simple conflict in ath12k_core_reset() in these commits:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=052a6a7c74ae4f20a31a632184f4439edcb0f40c
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6bc740619993535cb64c4dcebb83c66acd506763
> 
> Please check my changes.
> 
These look OK to me.
I'll test the pending branch on my laptop

