Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139A2C47DAF
	for <ath12k@archiver.kernel.org>; Thu, 18 Jan 2024 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/c3cKyx1hLO3tyFUUGCn9PRx3UYBx3Lah6nksrs3/k=; b=OT0yPZGnoMeAJVtmiMehV3FTau
	rBI1F+fm6QkYngSwwGOhoPblhRXUaab8rXy2v6yrE/bvHGuwNcv1yrZdyIrX7Ik+PNDxB0HlMEzH2
	jYGq87R4iXl5HS4Y3NiKXH+R/Z6w1CQS364aYwDC4GYMz/ItVmU2mvoe0xj3umv94LxuHZViFltb5
	PMxUWb0tOBUVX+dLMoTCwAHJ3CxPWy+qFVsbxv7hWKq8ImnAS+hRwywE+TjtJf0mgTnj6u+s9isG8
	PT7bUMb8sQNyo5hKZH1n6MxGxvxcRXPhCj046/dbTPIgH6wsJtgnzp7S5baCjAZoTpG8KHYXJeTGX
	lU3aSIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQUr7-003BuR-2D
	for ath12k@archiver.kernel.org;
	Thu, 18 Jan 2024 16:03:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQUr4-003Bu5-25
	for ath12k@lists.infradead.org;
	Thu, 18 Jan 2024 16:03:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I62LLL008862;
	Thu, 18 Jan 2024 16:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2/c3cKyx1hLO3tyFUUGCn9PRx3UYBx3Lah6nksrs3/k=; b=V2
	m/5Qx+CFPycIoqxO/IZIQDvVVeIFGQYt09GeR/eYNqs5KlLyH7xpSvAmf2JaeYwT
	cZZkhOUFBpoyx93j3fSzV0Wp4vMoF5oZdptTDRoSL3RuPvg7oaPIkjMWHsw3LjHm
	ZktoBwfz8aq+Pa621265s3+TMh2FnwsZ0IIw8b4n0YqAoHM32KSEbXdlxN8AeEJI
	nPE1/6O3XgcCQ8NsJgw2AMeFG8JKvJDCiszlskSK3+/p4dTfd9766KKSYOcI6ZlO
	4C8x+WPpikv7vV9kJLRrtQcGxDTIXCjvtkVSogbuizUc/dxcpBQWdio8NwCEZxKG
	9dRk8rpWOnvACWRoWheg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vpx8shfb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:02:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IG2t6r015993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:02:55 GMT
Received: from [10.110.99.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 18 Jan
 2024 08:02:54 -0800
Message-ID: <ae765cc9-31c6-49f4-8061-5bc7671e36a8@quicinc.com>
Date: Thu, 18 Jan 2024 08:02:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Refactor the mac80211 hw access from
 link/radio
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240118010320.3918136-1-quic_periyasa@quicinc.com>
 <20240118010320.3918136-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240118010320.3918136-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CKDY6Sebcv2KBEhR_HZAN99-GpagChOf
X-Proofpoint-GUID: CKDY6Sebcv2KBEhR_HZAN99-GpagChOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=568 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_080258_690895_DFE1827B 
X-CRM114-Status: UNSURE (   6.47  )
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

On 1/17/2024 5:03 PM, Karthikeyan Periyasamy wrote:
> Currently, mac80211 hardware accesses link/radio structure directly in
> multiple locations. Introduce helper function to avoid this direct
> access, as this change will facilitate refactoring for Multi-link
> operation support.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


