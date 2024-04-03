Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A18CCD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KMiA296Ptd+9tb2LFiHnnw/Lhb+ppX8TnWQIk0J4KU=; b=smcQOXeqk8gLI8V4qOHyRFn8En
	zwJQpe4EYJP90pcDiNweRNjLpD3adBGuE5Zp294bJTV1Eq35Iux42Ac1N1sYD5Aek45MU8xIb6ccZ
	Z4Tvv5o5Qfx+mWxSGxGY9E3jOhh1h9faWahP/dWwCnb0cwEfsmZa07TQ2EzeeIMPfvJwbjmQfBW1I
	+NgpCGu4pLo4AH3evgZHocE/GFGpXQik4dr/IaaDjeW34abY0nDjP9r7OUfXFzcyXxRbDsXtIZ7zw
	sNFvYV96MmrlUeAVtdmjJKy/+ILulR9Q9H8vbl6h2FvYW4XpKOCn6jCsgDCK31D+pM9csNbnWxyL3
	GN9JTopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ab-0000000HLaI-46cO
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5AZ-0000000HLYj-2Vvr
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433CAHOF025635;
	Wed, 3 Apr 2024 18:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5KMiA296Ptd+9tb2LFiHnnw/Lhb+ppX8TnWQIk0J4KU=; b=WK
	2+UiOXiNtX4k/LZy1XWnH6AvpUF/PiN18XQcf2A3ruWo5dxHzkXq8TwBse5NXRJt
	9fAnTbsetGHWCS5N3dQH7V5JFq3wR3WmKU61kGmGf2HzJd2z1Uv/KGUKwiKcvyHb
	bPbk2icolYXiQCHSw0tPo9NvMjRDGx8ylvKyoN/kcnfusqQbeY7bLROzg5KUy6hB
	DaxuLhGB5JUE1Q81rPZ7pWLZz1eR54kFeVI2Zlt9BgcosCfr4q2Rv6nUG8wSs3Tq
	AcHiCuBRsu1bM6milngBWHGpHbfxcXG85P/eHySAA6Xbv/pGOi67S5jgYCGURsoW
	Tp0LDJGmOMJCyqN6OqlA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x93pw9fcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IH6XD021240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:06 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:17:05 -0700
Message-ID: <cdc839f8-0898-4bbc-bdf2-b06ec76e071b@quicinc.com>
Date: Wed, 3 Apr 2024 11:17:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] wifi: ath12k: create a structure for WMI vdev up
 parameters
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-5-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-5-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y3eUFeXgeMulK9_jnSXt8m1OX1DSkMsM
X-Proofpoint-ORIG-GUID: y3eUFeXgeMulK9_jnSXt8m1OX1DSkMsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=586
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111707_726134_BDC2FC51 
X-CRM114-Status: UNSURE (   8.01  )
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

On 4/2/2024 2:05 PM, Aloka Dixit wrote:
> Host needs to send multiple BSSID configurations to firmware for
> each vdev in ath12k_wmi_vdev_up() for AP mode. This function accepts
> individual input parameters hence any new argument will require changes
> to all callers. Most of these will use default value (0 or NULL).
> Create a structure for the function arguments and include objects with
> all members initialized to zero to minimize future changes.
> 
> Tested-on : QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



