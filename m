Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9621C47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBGk2egJQPpE0Tsw5+N5pjNE+8vWFz/oA0Thbx478/s=; b=hHoBVMo2qgAZNzRJGjkAXrreJB
	lKyNuGLA+uEtOWzf+1zbpWeNgnbuwe4LxuDS3KuLG9n9kio6DZb2raXb2ZWGFm/y6fA2k49R4UKAu
	aGDbd7OKSizZRn0k/GpCBkTInQuxykSnVv5zU3imnPrA4rBWsv+1o/nUNS/ibOSTWxKHwSCbndLfE
	uimrNKfDu91TtOU0H+b0yrHoFku8i4kkFTF2eJkWaS9yae5wwxGbSg2UmitK7VQ7UBQPkdf7HRFOu
	b9iiu6lj2iDAMgeW2cUPTvDgpVSaQr14NpuyeIRx+0vYbWE66mGQdkYz7ZxB+KooatkjQHzvreq0j
	uOtt5PHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrh4-0000000HWgj-1HH4
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 17:14:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrh1-0000000HWgG-1DxF
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 17:14:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U9S6x4023347;
	Tue, 30 Jan 2024 17:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vBGk2egJQPpE0Tsw5+N5pjNE+8vWFz/oA0Thbx478/s=; b=Bd
	fO4LBjZT56pSRbY7u51XTWPjanfqeONQmYV4zAo0CBW6xiKzknl6Id69fYKomBwI
	1xm2qsWSQu8B9Fas7GkSLsHrChrcVUgcQCYEzf9o9uDPYD47qUij+6B6vbfEGRcR
	D8KqwDwrFNsoU7dop0nohH481MlBqiLrLspmTlZOQRSUSXhO2pExNEuHH0eLTXyY
	ZB1Nw+fNYFM4WlQxAigF5ZqHak48lzQPAXCG6zmYmxLUEAP9LvP0tXtHHPsdScLL
	4FdqOMPJ7pMDhn2J7LZej6IeJHnW0NR2UsUQrdXLDQLRr0/xzoox+6WVp8O+W+s8
	rUVpzLKw36OaRcmb9SYQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxwwv95df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:14:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UHEb9b026953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:14:37 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 09:14:36 -0800
Message-ID: <603ad5e1-5e2e-4945-97bb-4908000a2f52@quicinc.com>
Date: Tue, 30 Jan 2024 09:14:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] wifi: ath12k: implement handling of P2P NoA
 event
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-6-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dxgOmKE98FEpRXur7N-93Fk3TUmCW06O
X-Proofpoint-ORIG-GUID: dxgOmKE98FEpRXur7N-93Fk3TUmCW06O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_08,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=698 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_091439_369215_5010D131 
X-CRM114-Status: GOOD (  11.03  )
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

On 1/29/2024 8:02 PM, Kang Yang wrote:
> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
> signal its absence due to power save timing, concurrent operation, or
> off-channel scanning. It is also used in the P2P Presence Request-Response
> mechanism.
> 
> The NoA attribute shall be present in the P2P IE in the beacon frames
> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
> or when the CTWindow is non-zero.
> 
> So add support to update P2P information after P2P GO is up through
> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
> 
> Create p2p.c and p2p.h for P2P related functions and definitions.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


