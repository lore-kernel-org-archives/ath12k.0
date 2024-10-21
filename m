Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E2AD0E6D7
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzqwy4J6I5ZHt95NmhjTjIXEGtEdU1tw1bSphkPcuK4=; b=KJuBjO8/BQ02rYiNbOpYMpgS6u
	ybNpJg9GW1de93qCztfp4DfQLzBUxHSs4vVlb3xGuC5bkstbZQiXz/rT8Hl+JvvpSws5+QSea+io5
	ggF27xwo6nJrKzh7YQe5yy512cu6yQPJQ0UrdosPGm64VS0xpY/q6P6NnUjCqQKX92Q6sLcw0XkKc
	lgwzBNDI+LKmp994iL7buozJ2DKJSZjsPoiPZyIMdqaJ1pm0AkPQMkVXfXKdfS+9Jn4QFo4zwzEnH
	mcYFdmfdKf4UJMu+BXdBJEfHwi6zDypo7V+sTLweMgrfPR2PvntkGGSVhrsBunDUkqYqgVYsFtyJU
	ZQ15VbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2occ-00000006gMO-1wVo
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 09:22:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2obH-00000006gGK-3aPq
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 09:21:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L8VoqX014285;
	Mon, 21 Oct 2024 09:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzqwy4J6I5ZHt95NmhjTjIXEGtEdU1tw1bSphkPcuK4=; b=QOnTnnKF5Pnyhi9M
	3/ZTY7YVTB/RcDBuVor42/uCfRBzSkwq/sjHw/eS4KaeB6jr4USGV4/96ns1ewzw
	IB+FEdx/baSoQ4TT07fmcJNVa0x/Zps1yV6ElFkdolUIBoaoEks6dfaKxHTzfoih
	yT1wzbLJjKi62aKNpws8jZvRz/ugwPJnfDsUWjwkNvFOjDeOLRf02+frXVJYMngn
	AXs4qHiS7PjOu7jXEi9q7QRcOaQQUMSC2nhz6rDugKy4wj0e/yvIJ8UbzNJ2aBgq
	PXeFC1KYRntpJWnA6gitf1LIMLuUZNluIbS1W4Fk0NuhSiA70JgWRH42Nkwn+Yyo
	9nbR0Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd07a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:21:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L9LFKq022672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:21:15 GMT
Received: from [10.253.15.238] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 02:21:14 -0700
Message-ID: <f605fb9a-28ad-4aa8-a66a-085a7229f629@quicinc.com>
Date: Mon, 21 Oct 2024 17:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] wifi: ath12k: delete NSS and TX power setting
 for monitor vdev
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
 <20241016065700.1090-9-quic_kangyang@quicinc.com> <871q09rgg8.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <871q09rgg8.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nB0Mo-FPjhbU1xs7yxx1c37v2dlr0dzV
X-Proofpoint-GUID: nB0Mo-FPjhbU1xs7yxx1c37v2dlr0dzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=671
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_022120_049672_402EF56A 
X-CRM114-Status: UNSURE (   7.13  )
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



On 10/21/2024 4:46 PM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> ath12k_mac_monitor_vdev_create() will set NSS and TX power for monitor
>> vdev. But this is not needed for monitor vdev.
>>
>> So delete them.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> 
> Does this fix any known issues? Or is just cleanup?

Clean up

> 


