Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94CCC25B7A
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUxxfq9/ysoF4T/zCzom0D94X2iZGjGmhzqIIGldFvE=; b=FFUVOc0hAqzHBE23nEfnlTko6M
	eQHFiYnkUrTdtEPbFygWfmYp8WRKJXk/MLvAeMViHwJsltUDoQuaxv/6Kpgiv0JcaQGG438aL05vN
	MaKfwrvCnkzS7AZ3HKX+0VXtWWM7etOq+k8QWyd1qV83Z9HF6r+oFVxfdH5jC2ZQMueFCTkAG/0yH
	xzSVvgO3K3VGUIBlkXwcGMI7hxBwueWpWnp/lWe6sleYh5pyRa6d3uGQ3DTsqrp7qqHJ/5moCUzXn
	xiExeJW1Gx+PCmRiqqiXFm3zx57KakuIFPE8H3QoCmNRmc2I4GhANVKCblHV9yZ7BCMQc665mpHpc
	K5LOpYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Cak-0000000FpXs-2CMm
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 23:38:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Cah-0000000FpWd-2Hnu
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 23:38:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KBn7Xg026034;
	Mon, 20 May 2024 23:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UUxxfq9/ysoF4T/zCzom0D94X2iZGjGmhzqIIGldFvE=; b=fF
	3A4Qol0jbgxNe0bHPbny9PP5iSIIBwcB3ZA3lwI8PF5Xtg0srAj+aWgxfvWIr4ZH
	YFqIvvOcoF9UlcHh++fMSh8SSb/+OiAswa9aGnhQ6FFGtPK6BOA+mZmGWBTDJ1Nw
	LTH5uba3rrNSQ0EI0lxx3zjDDG1IxQF7GgvPvYvlckJwqeudJnHPWUDCwNr5h3Bo
	WjbL0FLihnQojvuVTBw2mjTZxAvTHxmMZP+IbyhJuDCoMHWOSc/aWrdJ6XVzIerd
	vR9UH7fooF0MuiMiSNoB1zClb9nvPis+tzGPRdh/ZHFsa3Ul8oQEfz0CDjoK3UyW
	gU+HXO42Aza2RIdUl7UQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3td0k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 23:38:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KNcmOw005437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 23:38:48 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 16:38:48 -0700
Message-ID: <2efd9e1a-7471-474b-a2c4-893f3afcbded@quicinc.com>
Date: Mon, 20 May 2024 16:38:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: fix invalid memory access while
 processing fragmented packets
Content-Language: en-US
To: P Praneesh <quic_ppranees@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
 <20240520070045.631029-3-quic_ppranees@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520070045.631029-3-quic_ppranees@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AaFdtoB8yZEv0F33kRN4HAA1Q3Pg5GHb
X-Proofpoint-ORIG-GUID: AaFdtoB8yZEv0F33kRN4HAA1Q3Pg5GHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=739
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_163851_736788_B9C5D178 
X-CRM114-Status: UNSURE (   8.13  )
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

On 5/20/2024 12:00 AM, P Praneesh wrote:
> The monitor ring and the reo reinject ring share the same ring mask index.
> When the driver receives an interrupt for the reo reinject ring, the
> monitor ring is also processed, leading to invalid memory access. Since
> monitor support is not yet enabled in ath12k, the ring mask for the monitor
> ring should be removed.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


