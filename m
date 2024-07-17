Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE29C3DA60
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGSggL2quGbKk5SJkjTTNMGeWz0nfeXpJEVAnpAqMYE=; b=J8z0y/Dvs6qan4MKXgMs+PV6xw
	lxOAI0svALF57HrQrNY73Fu/h9DQ8Wc7Fz2yEbcEc5XXLngjeFASBPGfeQBWH9PM2/Xj5dO4g6kCq
	cmLFh0r9Rp2poWHl9GoK1ceUjMrCzUsahhhCXA+J/ng8Lniudf/dlR9/CnWMgFcRx64XIgkt8VwAz
	5zHippbqnpPCT6JJnTD2CawLYKqVw0NMUKA6bBHH4H8P9cotZUq5T84M6p773HfkIxAbOsxE4pePy
	gQO95IrpOAvxU8YgCeHk9oYu4jVEsBOYD7dHZPu0e+/Z50QaRHYkum3mw75gfiV9rcx7MJIN/xIL5
	MANmV+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7td-0000000EPT8-3GWC
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 16:52:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7tb-0000000EPSS-2qaB
	for ath12k@lists.infradead.org;
	Wed, 17 Jul 2024 16:52:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HG02aE006989;
	Wed, 17 Jul 2024 16:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGSggL2quGbKk5SJkjTTNMGeWz0nfeXpJEVAnpAqMYE=; b=B+0bSuBVfI9ePslE
	4N+M4eGywXdtUw8YVKvFN9BsstWisYXMiF+TwW/111ZqpDKBepdsYFq/fNLowV9v
	pdggRSd1xlTzcYdSFZ6kEN37K3yiRdO559tnjp7bR2log63vkv0XOMaMoJC8jFYp
	baunndC7xP19wYKY44fOPkHf3i3LfaabjgdfDETMthb1coKsnXSAsNVvK+d8zADv
	77hr3W8XzopAyJYwbFVrMrhu5PXk+NW0hGPTM6iAmtvAh2sXx3RT9RPu3sfd3LN5
	dPZm38AGPCvw/duX2/r+H8bgczmpsCiEYj4XYO+3z5U9fC9ipLykUJfLjCiV28gG
	mQLyVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfxb4vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 16:52:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HGqnGU023501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 16:52:49 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 09:52:49 -0700
Message-ID: <cf9e8dee-092a-4212-8d64-2a8689be6fa2@quicinc.com>
Date: Wed, 17 Jul 2024 09:52:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling
 specific features based on ACPI bitflag
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240717111023.78798-1-quic_lingbok@quicinc.com>
 <20240717111023.78798-3-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240717111023.78798-3-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DhO1WhzkJu8ajfLcbntikirOBkIuiSWm
X-Proofpoint-GUID: DhO1WhzkJu8ajfLcbntikirOBkIuiSWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_13,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=733 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_095251_753780_49ECF17B 
X-CRM114-Status: UNSURE (   8.64  )
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

On 7/17/2024 4:10 AM, Lingbo Kong wrote:
> Currently, ath12k does not support enable or disable specific features by
> ACPI bitflag.
> 
> To address this issue, obtain the ACPI bitflag value and use it to
> selectively enable or disable specific features.
> 
> This patch will not affect QCN9274, because only WCN7850 supports ACPI.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


