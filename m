Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED1DD59F53
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQKIT6c74vByRYBdMjUT89Dd/ZlSwel2Hjs5bBgGbYM=; b=s6cl7ApXSZqNnepxzpMoYE7a17
	azf6WyLxltlabYquQQn1wMyvaQINDJtVmKVLX/qfGBolQJc7T113B2QP/kJtYTvsi4++y4g/gU5uh
	wyewYuEjcniCeRDY9ouRGx549mjzQQCoMfwLWkyUzE54pxuYPNkigY6mxvvHbcroOk9qG3fjNZUV5
	QLCHWLyz2bAjkwumxNaghlXLui+YMkjOmWLz1thki2fJay8qXxT9LHYXIIbnU6nwsbsfvx3DS4oeY
	gOwaGOgHuruWLPB6xe89cTUMlraBRhtnfHkWMq+9loF8edrD4AZyxw0ovPJTtXhguN3J2YsjeT8Ae
	2wtouNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyJ-000000042XH-3kws
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:33:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyG-000000042W5-1DMh
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:33:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6EEbsj002132;
	Wed, 6 Nov 2024 16:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQKIT6c74vByRYBdMjUT89Dd/ZlSwel2Hjs5bBgGbYM=; b=jxopp3eJsEERLr4K
	tvAlbb8uJbBe8eub5rdJOkOC3e9s6Fn5fMYM55+Pnk+0wki2ws8y4KeCIbAJmlCD
	GQeboA4TtWWpys8UQMdr3m899sO3DOlaz6VqFu0+87aa9WSlXX5lGF8f1x8QvahV
	Oxa10uRkDAY9zR80vzhf4kV5FdOBl23Z36pVwqDgqotJTWcU89IXb6LDISdFS65B
	wLJOiXkEgMfttkN9zFErRycMpyFza2jnmm4RQywxhViNZ81ZpTkOdtgQ4a/fTmK6
	PkM6l0R7VKsqWXyU7tzhepKOCL2gRHAHz1/gfHuuc/mheVdtPqE2bMh2KPDNiSVi
	mYVJNw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072hybd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:33:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6GXIex001001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 16:33:18 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 08:33:18 -0800
Message-ID: <c1303d43-47a0-4369-b5ab-e307c05dfd2b@quicinc.com>
Date: Wed, 6 Nov 2024 08:33:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-2-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106142617.660901-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YUBtJy1rWW3ooa7UlRf8Ut0jdmTp2-EB
X-Proofpoint-GUID: YUBtJy1rWW3ooa7UlRf8Ut0jdmTp2-EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=877 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083328_367820_7EBAE413 
X-CRM114-Status: UNSURE (   7.95  )
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
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Add changes to handle multi-link station state change with proper
> link handling and add code changes for ML peer creation, peer deletion.
> 
> In ath12k_mac_assign_link_sta() initialise all arsta fields first and only then
> call rcu_assign_pointer(). This is to make sure that readers don't have access
> to arsta which is still modified.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



