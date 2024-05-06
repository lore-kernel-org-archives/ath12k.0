Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB681C25B10
	for <ath12k@archiver.kernel.org>; Mon,  6 May 2024 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znCC9Wj8UrFkjd8KrMGgvDVcqjr7DGjW5JkzK6S/3wE=; b=Wo77ggIB5O7xFFfh3gmbmOKt8s
	0zrtVy04B8PuaxYdQbHkjZj2b1vX10Xwtfo6pLbF98xrxIl5+a/fE/uyLCHDCN70veBlSlUoKp0p2
	c4UdxqqpEl3+HLkFSjgfhJI7Vau9WL1bTMGfGUiKk/w7WDlY5rB5yXvAxBJX/oT1+BY6LLHI+wwsv
	PtMvjTCRfnA7Gbxx9n/Zjfp0Ko/Zc1XobGXdQAFweV1UvqFq4JgnoD9h1+Gl0mZZ2HYFEU8XchDHU
	+wW6Qfvxj8lYuxrYkJRK2hhmhFqjzoCTuOlvbGx3wwBjVlO5LyYcSYspUpPbKeZt7TwhT75ufkd6w
	oJCcJJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s44V0-00000008bKn-2o4n
	for ath12k@archiver.kernel.org;
	Mon, 06 May 2024 19:59:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s44Uw-00000008bJM-329r
	for ath12k@lists.infradead.org;
	Mon, 06 May 2024 19:59:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446HtbAG026861;
	Mon, 6 May 2024 19:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=znCC9Wj8UrFkjd8KrMGgvDVcqjr7DGjW5JkzK6S/3wE=; b=oX
	PINUF0NW5KB+fAaa8MeWh9+Fh5D9rxLg4MH2RYpbYdDbPfVJ6gF3N7Of4XgM/to2
	OkpnIkidVrYBG1Ofqr1Ucrjar2z2xluA+EwfJeCEkS7LSaCpktFVaA8rMekSbf5j
	twpG+eWmyvmQaYma4UDDm6aYE0fJY92ymGmEgFGdgZwqYwuzYtREgYZ4JBZpRA4m
	AzxpErIUIEJEz4RBP/xhbcH1rEIIEK/GOkZlvsfAvrHaQi5T+zX61B2NurdxO7w5
	/nhfTN++0H3WdDExO6j73SWEG5KxHbQK+4FglF4h7RUxtoH6ycT9FKqJzi2hH6LU
	WuJuQbFyrCl2keWzWzOg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxw9a972b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 19:59:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446JxTpt022143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 19:59:29 GMT
Received: from [10.110.82.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 12:59:29 -0700
Message-ID: <1dc900a6-b972-4a86-995c-c0b965792cdd@quicinc.com>
Date: Mon, 6 May 2024 12:59:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: avoid double SW2HW_MACID conversion
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240506173017.597715-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240506173017.597715-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _E_ur83NNsYkF3i1HgqtMcIRvL9YcWeJ
X-Proofpoint-ORIG-GUID: _E_ur83NNsYkF3i1HgqtMcIRvL9YcWeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_14,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=698 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_125942_824942_161CDF47 
X-CRM114-Status: UNSURE (   9.61  )
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

On 5/6/2024 10:30 AM, Karthikeyan Periyasamy wrote:
> Currently, ath12k_wmi_pdev_dma_ring_cfg() fails due to an invalid pdev_id
> parameter passed to the WMI_PDEV_DMA_RING_CFG_REQ_CMDID WMI command. This
> invalid pdev_id is caused by a double conversion of the MAC ID. Since the
> the caller of ath12k_wmi_pdev_dma_ring_cfg() already performs the MAC ID
> conversion, it is unnecessary to do it again within the function. To fix
> this, remove the software (SW) to hardware (HW) MAC ID conversion from
> ath12k_wmi_pdev_dma_ring_cfg() to avoid this redundant conversion.
> 
> Found in code review.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


