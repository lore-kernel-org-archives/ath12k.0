Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32443D59F53
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOBv98caloMnQ5eldDCXhGpaYdMfDY5H3PCOeAOxzN0=; b=4B0Yx/bQVOo6lmQ2mlxtIbMX4e
	K3EJk7GZOlqcaSnIxW/0pV1QALQSCJ6nUiL26Lb9/YjmaAJliSnCXs0ZrqNU7X0YFcM1zfhhqgx6F
	QBdkgxtc9E+xuO+c3/SDrdE8Ul+05s/tALb0FyNr4+ctUcdhC6C3msGYJArzM9itD9EOHICEfovpF
	nvsVb20IO2GBswW9KO00OaqUXbLehPrj3y8Nyzjxts+mSWKBEHY7sdlkuANUVQVdYsTMN2FEtFo3T
	ewtKnO1Fq/K6yq8UP9Ldv6NHt4bX390N6HxugVaViJ/RqHDpJGb7TujJl13WrS2tTS/1qlnasbEBV
	YKkCS4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyT-000000042br-3jg0
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:33:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyR-000000042b0-1HhL
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:33:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A66vJTW003812;
	Wed, 6 Nov 2024 16:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOBv98caloMnQ5eldDCXhGpaYdMfDY5H3PCOeAOxzN0=; b=VRvMv7Ae1QZUOD0I
	bGEU8hKE8M+quPDW4V3lmUP3SpHqLuBJ6IP5bYGgVH5oRdbvbxN6+/V3XM8CVzw7
	te+kUBsZWNRFVYtEqhXIfRKt18S69Noz8Ja955TR2T+R1zh1N4b1qFiGkO0mplB6
	5WIqLKgmMTLKt2A2WyRezDrXg4wQChGZoFlI0Yiu6XvUyyIW5/oGpcKitcTe5rm0
	5IGiNnaEcESsiruO/IcxE51qS1VBKqWO5IYK3BYJFgobZ404/ekNd5GCFI+pvedQ
	qzDYU13SlqZbknyflaGpQSqZyjWIVi3VSolacgevsD2tSAEcb+fq7VVaGGH7Z9kM
	3uG1Mw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx4srm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:33:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6GXabu004756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 16:33:36 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 08:33:36 -0800
Message-ID: <395e1dfb-2918-4a97-84f1-c61a8ab68278@quicinc.com>
Date: Wed, 6 Nov 2024 08:33:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] wifi: ath12k: modify chanctx iterators for MLO
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-7-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106142617.660901-7-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PSNHGsb-1iFe9wRXdlGcOkk1cktjtEO7
X-Proofpoint-ORIG-GUID: PSNHGsb-1iFe9wRXdlGcOkk1cktjtEO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=641
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083339_390893_54F8C461 
X-CRM114-Status: UNSURE (   7.04  )
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

On 11/6/2024 6:26 AM, Kalle Valo wrote:
> From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> 
> Currently ath12k's chanctx iterator functions use deflink of given ahvif and
> bss_conf of corresponding vif to make sure the iterator returns intended vif.
> An ML vif can have multiple affiliated links each having its own channel
> context, hence iterate through the links of the given ahvif and use the link
> objects (arvif and link_conf) to make sure the chan ctx iterator returns
> intended link of the given vif.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


