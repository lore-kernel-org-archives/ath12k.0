Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6CDC3DA70
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgvwmUx7WWga9XwH6ssYGou8Wht/qrRh2V2hzXQcXbg=; b=NbT2G/cinFRLxKA+x3YY/LwwY5
	VlSTabMisQgxnZ9xPomdy9PcGa1PXYJoFovU+t4Pgg5H+IroCzTl3mGQDfSJJVRFQ2t4dRjZJg7VQ
	grXqfYbwilwXtU/cfYRipG7FY6MdRY776ex/BHhh3xhdUS/YjyHH0kVFm/RBds9CCzj1PSv+U14qJ
	gIERdppSWEeLYOfZaI7JOCNKf2S+nBukAvvW+qHOLVhQ33IC+LFYcgJQ9IaAjHpHUznRt/yK4CB5+
	WcYKXrr1jF52/G228O3mHGNn1RA/Imn5R9Li2OdNO3yMrCWwDw5T8bUXX5NcOfGF7qvGsB8MUaYeq
	Zew32ATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8es-00000002VDP-0akP
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:18:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8ep-00000002VBi-0pWI
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:18:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PMulN3001207;
	Fri, 26 Jul 2024 00:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgvwmUx7WWga9XwH6ssYGou8Wht/qrRh2V2hzXQcXbg=; b=BmAa6wlnSKOyzKmC
	JPMLD4d/K3Q6qtrn25q5HN24AyMKVR2QLN60EZQbbEpNO9DDiETbyQytI9if/rju
	zjKleBxiuAEPG3EYdonMA3d4mnIRGhTorn2BVRhVBHA7qz9i4gM01TPIgLv8tdov
	b2XiMoNxOSx98JxvNhK4AvOqRevQc7paShLqlNjo16KlMeYB9xSNYak1Qbo37u85
	H3qxALBQCniZ0p+TwICjcLudO0+/r7CiI/6YUQoC+H+rrIYNjYPq58YA/p5MIxhf
	+Idx//75WIEaCOv+q6yipXx9OUuhi5Y3XesdellnEVicxO11cAdiUeMQT0934MRD
	A/+eRA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40k40ym7c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:18:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0I1i5031166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:18:01 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:18:00 -0700
Message-ID: <00729c2c-532e-426a-a503-4d000f20a838@quicinc.com>
Date: Thu, 25 Jul 2024 17:18:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] wifi: ath12k: fix A-MSDU indication in monitor mode
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-11-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-11-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 45ZbXXs5hf2kLN_rbuBZ7Xb3YMtDBvpj
X-Proofpoint-ORIG-GUID: 45ZbXXs5hf2kLN_rbuBZ7Xb3YMtDBvpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxlogscore=825
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407260000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171803_390552_2D6485ED 
X-CRM114-Status: UNSURE (   8.97  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> In monitor mode, host will reap MSDUs and then the MSDUs with same PPDU
> ID will be aggregated into an A-MSDU in ath12k_dp_mon_rx_merg_msdus().
> 
> However, ath12k_dp_mon_rx_merg_msdus() doesn't calculate the total
> length of the A-MSDU. This causes Wireshark to display the A-MSDU
> incorrectly.
> 
> Therefore, need to add calculation of the A-MSDU length.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>



