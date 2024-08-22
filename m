Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F9C3DA4A
	for <ath12k@archiver.kernel.org>; Thu, 22 Aug 2024 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl7miFXgrV2201IWVkxgpac+HCQbuJB8WNU4Rg/Ckmo=; b=2yg9ecZsxpKSvMJO/bBzvIh1ur
	g8WBTRMyhRDsY8JSjwhQvXsPjKLyhyu/KULKgENdy7USvD/msLiqeMJsdaLn2JWp/a6YiCyHyA4zs
	rQbeWMOI2FRFUGLz/F1LJDvY66AwEmjXS1F/qvBkAN+IzVS6EzWZC9If09KawoD3ku2JZk4DSylr0
	XcCJFXLBn/RvLWRm7aJukkQgbmxPnduQYIy9ch7I/GULgEf9zd0Zj4lLCdE2dNb4HZSfV37Ev0aPx
	n2Rg4BVUzEehCVSlzGS66nSTbR3k0Qi96D338A+zSRlbHZoixjp9QzwES/+O+0MKoQgPnQu0320TD
	/l6UkhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBCH-0000000Dhjr-48Xf
	for ath12k@archiver.kernel.org;
	Thu, 22 Aug 2024 17:02:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBBe-0000000Dhb0-0h2M
	for ath12k@lists.infradead.org;
	Thu, 22 Aug 2024 17:01:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M9v9O1030906;
	Thu, 22 Aug 2024 17:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl7miFXgrV2201IWVkxgpac+HCQbuJB8WNU4Rg/Ckmo=; b=B50uwlNEKirzCWvv
	vmtAiKsqegjmF0BDQUB6DLqouaTJXcf42MIbMBI/GNtCRsnqOchLnZUKAZz5vHMG
	edTED7b3WvaxTlMnOKpOn+xBLlqcudgZ+0HPxBC36sqTv82eqNkOKMBXibGY7UYK
	Xm/W6arm0cNc8qlq0aad69+INiPt3M5EPDmPRIBgLYixEE8VWkhDsdN7OH0YM0aW
	peSSKMuAy4sc9cwyXY4J+n++eRfC/VkfU3E6/JV/Jh+gHwxYdT8aDifd4QtvdXWf
	8oYBBl437CIzBTRitFkHTpxWtvruwI0L2Jj27Jhha7YYWZ0zoq5MLtadvuS00tBu
	iWyRkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415ck9d0bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 17:01:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MH1LmO022640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 17:01:21 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 10:01:20 -0700
Message-ID: <547af05e-0110-425e-be11-2cea261776fa@quicinc.com>
Date: Thu, 22 Aug 2024 10:01:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] wifi: ath12k: Avoid -Wflex-array-member-not-at-end
 warnings
To: Kalle Valo <kvalo@kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>
References: <ZrZEuxJihMzAaTVh@cute>
 <172434545943.2469785.15733185765753701476.kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <172434545943.2469785.15733185765753701476.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oCJUQw1zs7xtFFqKa0Fj5N_3BbPK-AtB
X-Proofpoint-ORIG-GUID: oCJUQw1zs7xtFFqKa0Fj5N_3BbPK-AtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_10,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=777
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_100126_249627_B4DB700B 
X-CRM114-Status: GOOD (  10.15  )
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

On 8/22/2024 9:51 AM, Kalle Valo wrote:
> "Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:
> 
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Move the conflicting declaration to the end of the structure. Notice
>> that `struct ieee80211_chanctx_conf` is a flexible structure --a
>> structure that contains a flexible-array member.
>>
>> Also, remove an unused structure.
>>
>> Fix the following warnings:
>> drivers/net/wireless/ath/ath12k/core.h:290:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/net/wireless/ath/ath12k/dp.h:1499:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Should I add a similar comment as with the ath11k patch:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/ZrZB3Rjswe0ZXtug@cute/
> 

Sounds reasonable to me

