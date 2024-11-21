Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C182D7877B
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bcr8jG3EWKgK+m2+WXWciXV+V1rZmvpvzddTtxw42X4=; b=WWzUqFxYajDf7Crv9jiLe8Sh/G
	wNq2TpAI+daoget/2ox/0Udrz6jnLKvKjkOEQy0FV7hxOUQoZjKbe1SRCXOjPwpmzbyrtyTMZZckP
	n3eAoiBi5W3xqms8noZGEtACrXuVCQLr8YhOVfgYDDIz4bowcinXd6zbrma+AOBgkse3PhlqoNDeo
	91YNYK/VpqjxoQzU6xPOSq8kNv3sKlyR2lKuBEPDYcOPzuJBXU3CKcj+ib3nsWKlGqH5P3jivEv8J
	2zEO7EFVSoXV2o25M0tTPScxaFIihDJ5BBeh5o7ZbPbLdBzlcgkaOlleOaZvX+HAviRLoAprt3ru9
	k3uzGquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nR-00000000Qa3-3h4R
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 16:12:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nP-00000000QY4-1dYN
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 16:12:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL9DxjD007912;
	Thu, 21 Nov 2024 16:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bcr8jG3EWKgK+m2+WXWciXV+V1rZmvpvzddTtxw42X4=; b=YGfd3XF3LiPZaFpf
	pIwm97RGK85AFZX/cwvbI7FC/keJZNQDGXh1B+c46moY0zS1Fp9ktU5YjNCM2DT0
	cSut65ZfaYGUoPedqilMoBVSJ9MX5tFt5OUBwN8acUQYCuHRs/dM+brwMtK+BopS
	qbuBjaZXugnLS+kR+CepI4ybA4v1gwlikCmsTYLAPM2dReSgT1Hc7oIq+LrB+oSS
	Vq1m2aNogV72JfhTdtglX3dz235cD5sVcJVUvXXz+AIUjbU7xkb10rbBwQ2hpMjE
	4k29jiOUYGKzR831iqfRPIrkUabQjT59Rj9A7wOFM8PyDRVS8+dL/XUJFL7N25Y/
	JxLqOQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvn4f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALGCdqD032501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:39 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 08:12:39 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, P Praneesh <quic_ppranees@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241119164516.756478-1-quic_ppranees@quicinc.com>
References: <20241119164516.756478-1-quic_ppranees@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fix endianness issue in struct
 hal_tlv_64_hdr
Message-ID: <173220555940.3016923.419178704492681378.b4-ty@quicinc.com>
Date: Thu, 21 Nov 2024 08:12:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4iERozgS5OBPaMjMYkE7GadFmGIVyIhS
X-Proofpoint-GUID: 4iERozgS5OBPaMjMYkE7GadFmGIVyIhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=814 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_081243_548225_0FC8F341 
X-CRM114-Status: UNSURE (   9.22  )
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


On Tue, 19 Nov 2024 22:15:16 +0530, P Praneesh wrote:
> struct hal_tlv_64_hdr has a 64-bit member that should be in little-endian
> format, but the current definition uses host byte order. Fix this by
> changing the definition and updating the corresponding helper functions
> used for the byte order conversion.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix endianness issue in struct hal_tlv_64_hdr
      commit: 1cfa6d4e5bd9bfb15d165d8d843163363929ba1b

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


