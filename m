Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA05E77188
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Stx8O2lgbohE1wXcrHRFXRZBfFx2YRl1Mu1H9t4soM=; b=FLhQk8Y5yY2rBnbkvwVvVJXUXS
	nVfqMhkaeSfh3606keqDOWhI0D0syymQ+rdk92ycFnXZHypwm9WSw2cVsBDn8zXigf3TWH5QV9a/u
	HZazOXDQN9bF0r8AVh6t2fkwJPjZtviGhplgJLtQbL4R/2uCTK27PsCYsAD/mJ7OfIAfVp6BI0WAr
	vb+VaODLeJXrJChp2eZOQgengDb3SSHT/RdX/IQ248ZhCprxpI0vr7LoiR54a6fpa4gtqe56uwN0f
	bkMmsY1HpZJFAbD7hoZDfXuHyuk1puUBgfXALX02kYzQVYdsHiTAlcwnMcmiJF0yrMbZ7ahqnR4D8
	ErewTB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ21L-0000000Bjar-3O7r
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 10:20:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ21J-0000000BjaE-1e8O
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 10:20:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO6HjUZ003231;
	Tue, 24 Dec 2024 10:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Stx8O2lgbohE1wXcrHRFXRZBfFx2YRl1Mu1H9t4soM=; b=huiOGkTXhUOLKtCC
	2BjHC3OXYr0JnWslQG1CRcDUoJJ4y2RFYrKZ8Xuq6hJ0xmH7q/ScDSGQijObNlh7
	r1Xc+fSCRhJQATFYPtKIGCt8R1kXfdJvO4YPWZ5oVPn+Rq5QwjuqRTcLL4q0cISQ
	UtXCWcb9oPLdXRGzWb55s1qBzjJPG84GWfq7Zhu6tkOf35Istjnj1GajP00Lnr17
	YylBetPVB+3mnmhzkdwQPz5sj72qKAxXIiViWa+5/A55pF+8qCGIxjL0DK/j82zw
	mXD2ImPqJT+6fi5YHIA/xMM4RMpg7UJ5wl8maEhkOzF5k8a7qIN3FuPmbhQ7Ex7B
	tzYJUA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qqjh174s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOAK6Fv018784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:06 GMT
Received: from [10.152.206.29] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 02:20:04 -0800
Message-ID: <088e894b-5e73-4a0e-ad68-f32b8f21aab7@quicinc.com>
Date: Tue, 24 Dec 2024 15:50:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] wifi: ath12k: Support Received FSE Stats
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
 <20241217095216.1543923-7-quic_rdevanat@quicinc.com>
 <87r063hkpt.fsf@kernel.org>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <87r063hkpt.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KShU2J7Px6tVXWImYopgDh2FSHlDYMvZ
X-Proofpoint-ORIG-GUID: KShU2J7Px6tVXWImYopgDh2FSHlDYMvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=820
 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_022009_449784_42A62360 
X-CRM114-Status: UNSURE (   7.82  )
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



On 12/19/2024 6:51 PM, Kalle Valo wrote:
> Roopni Devanathan <quic_rdevanat@quicinc.com> writes:
> 
>> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>>
>> Add support to request received FSE stats from firmware through
>> HTT stats type 28. These stats give software and hardware FSE
>> stats such as cache entry count, full cache count, current and
>> peak occupancy count, pending search counts, etc.
> 
> What does FSE mean? It would be nice to spell that out.

I'll modify the commit message in next version.

> 
> Acked-by: Kalle Valo <kvalo@kernel.org>
> 

