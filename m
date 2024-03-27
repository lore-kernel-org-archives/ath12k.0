Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0347C54E67
	for <ath12k@archiver.kernel.org>; Wed, 27 Mar 2024 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ortbRNvYxEhx0Bd9zy76vFAIs7gPqUZB/Y8Un8xGo8c=; b=P5QFVA9I6n9DdAsE35Ids2zo3K
	wZB/KUoEkNTnau1AriN2oykFyarI2ohRW4dtOwGHmmb3/J+ZBIfaM0TBzaAPp/tOZjAbTSQ7LfEol
	dwXMGuxbPmgNPY9Sl1UFGTgca2gBMDakp5w28jzbXtuyMczBrNxj4w5aIAVtyNWRr1Tl85c2ODYXV
	Fqw5OOum2e7VpLB+Vpim/0nqJgXzARgAAsgE9WmqmSNkyLVP3okEAKC5/7fNtmD64ab4NDIQf/rq0
	c8K0wuN+U1eG5XnUhlOoLMQfN9eBHsBT77uA7wqInvQH7NRSuZE6ZfNAT5N7uRC+4ehushkH+emhM
	FzisFM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVYo-00000009vOs-1Y1j
	for ath12k@archiver.kernel.org;
	Wed, 27 Mar 2024 15:51:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVYm-00000009vNk-03Q2
	for ath12k@lists.infradead.org;
	Wed, 27 Mar 2024 15:51:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42RAR4kM021804;
	Wed, 27 Mar 2024 15:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ortbRNvYxEhx0Bd9zy76vFAIs7gPqUZB/Y8Un8xGo8c=; b=g7
	yugMoR1E84Q6uv1SiZbJFKGXey/5uria1TjvjeFOoL6KcjV6nIciG7XMxoS6D1qg
	j9cz6oDQ+JR30tMFoWfhqBijwT/LdKYQFGc5uZ96U/Hbsaq65WD0q9SPqp+OYNUS
	4Pj+iwsU9RrcxFS31dDKlpZ4QnFLDdJy5A6/aKvcKsSREUo2XMklXN5hg77AQR3e
	V9ZpFnQFvJtGPXVsLu/zis3WhGEey27BR+ksm5nqsYhkdZvTKYJzOokRHyKIrvau
	FmmOVIoDYERAhcULM3bGvLzKW4jKfWz3AAlK7SVuHIMSHK3vCB2PRLVdLGDptbmr
	05/dvcVi4Wzfc8PkoxDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4etk9b9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 15:51:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42RFpQJW017303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 15:51:26 GMT
Received: from [10.110.28.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 08:51:26 -0700
Message-ID: <d4920835-9c5c-487e-8410-a802adfc74ec@quicinc.com>
Date: Wed, 27 Mar 2024 08:51:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: cfg80211: Clear mlo_links info when STA disconnect
Content-Language: en-US
To: Xin Deng <quic_deng@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240327032448.15098-1-quic_deng@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240327032448.15098-1-quic_deng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fDMTY5xysgcpnFb7SHpcw35g5mGPjwzx
X-Proofpoint-ORIG-GUID: fDMTY5xysgcpnFb7SHpcw35g5mGPjwzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=690
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_085128_108468_E11B124C 
X-CRM114-Status: UNSURE (   6.80  )
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

On 3/26/2024 8:24 PM, Xin Deng wrote:
> wdev->valid_links is not cleared when upper layer disconnect from a
> wdev->AP MLD. It has been observed that this would prevent offchannel
> operations like remain-on-channel which would be needed for user space
> operations with Public Action frame.
> Clear the wdev->valid_links when STA disconnect.
> 
> Signed-off-by: Xin Deng <quic_deng@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


