Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED277C54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+WhH3GXYyzEzRVu9QxZwTfRAfgprcISvWQoDCqhOAs=; b=Qs0E3hxqL6DBRbPHocLKNcdP9i
	mznn59sBqDYYaUIeVD2+zo/xJ0Xgx8GMTcrfJl8RgLYWRyX0bZ2EGl9PLm+eD4/XU8zRL4nDFdvvf
	HJqtKay2pABN14vlAN+VY/142fwqijeB5uPNr8uByPEMweiDe9AUXb8jxCr59RfKk/GVKmLB9glZl
	ej8Ov9/22mm3j0Mf9PXWdYvz7lbT55UR/Rb+Lz0dBY2xsGfZG44CbMjNzAflGUkfXSqmQDA5C9oiC
	qikXw793r6gGIC9oCYQbW2GKgLpfLds+h5jBRX6/rszyqhgReCT+Cl5cAFoaKLGRs9cSky+QTxR2B
	76L7vNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rksZE-0000000FjkI-2JHq
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 21:24:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rksZA-0000000Fjib-30go
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 21:24:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42ELAXHm014510;
	Thu, 14 Mar 2024 21:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5+WhH3GXYyzEzRVu9QxZwTfRAfgprcISvWQoDCqhOAs=; b=Ey
	F0I4kQKf21gLaVkdVCk1/JtLK8MdYI6L+Z+R2wYmgjgxBt0sr7pta20B8L+gxXml
	C2vC+xon4n8c7QM9RS/fwib0Ojd7mbQJIm+K87FvI0M8eFPBOI09p4zEVztulDqL
	Gt+l4Z+xmEw9vf7Da5/Nq90uO3wVokNIyEryP8R2DPpAV2GjrhX7ixtCPRoOTAxP
	xqx/e+0HhIVZ5h6hdoj5DNEUOO2+yXRDDdGfBq2pvTBhaQ/feBOzrYL8gcBHEfKA
	LhFBev9HcmfDHSKq9UIr8EMXJDWjBDKN4pdsqkljZmqhc5+Q1E/iIy22gfphyGBB
	dqu3HBH7d1f4OxITIJPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuruqtayr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 21:24:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42ELOhTm002271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 21:24:43 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 14:24:43 -0700
Message-ID: <8014476e-dc2e-4658-97ef-d03478299a1e@quicinc.com>
Date: Thu, 14 Mar 2024 14:24:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240314204651.11075-1-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ONzGfhLnjI4j-PwPuz-E7ZttnTRaffRI
X-Proofpoint-GUID: ONzGfhLnjI4j-PwPuz-E7ZttnTRaffRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=571 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_142444_806601_7B99518E 
X-CRM114-Status: UNSURE (   5.90  )
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

On 3/14/2024 1:46 PM, Aloka Dixit wrote:
> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
> peer_flags by peer_flags_ext while sending peer data.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


