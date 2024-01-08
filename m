Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48507C3DA6E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 18:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExJy1HsthPXKtXdpCjDcwwZl22fBW64Xv58HlXJV0+I=; b=jU17ZKj3m9qYbkev+Fu/l/OWaF
	Ri4ZYqOKPCF30njMTDKlh5tETYdTn80WY9tewjswwDZn25iJjLousGAJiWhEbKnpRZV16SEAe32yA
	Uy/3F9EdQ7RxNO8q/2Z5wA51/cSG5gklYMJZ2OZErt/5SYkCn+FYPBm/XgWj+LAGyNp3WinlE6AAg
	UtKJQKbeplf58kiytwgw/pcVvqB/Qok3hOhDm8cjAkAf6liBg0w0OwPlUfQfhKBsH8nfs3MLMZeYJ
	jHWC7qal8D/LaTBKZ+ejgw1CSvcHY9/z0qiYaEuZIviVGXHxxQrIpVvXVtxNY7AJ1Pf23IfOzI8UD
	zuYJAU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtyG-005pcV-05
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 18:03:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtyD-005pba-2e
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 18:03:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408GsJxX032565;
	Mon, 8 Jan 2024 18:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ExJy1HsthPXKtXdpCjDcwwZl22fBW64Xv58HlXJV0+I=; b=Re
	Ty7iDy2fjPr/k90ApLKwPmdmpK9SxW13O3Fh8fyW/UCE5x9JXCuC4Vv1NqbKV76i
	znr5k831ei9JtUmDmTxT3ABSYJJL3vKCc0/4Bu4O0LOm+lDkZLsFZE842ZqHb+WD
	oprv8cJXQN9pikBDbK1QGn7NVQTj907SSw2w+WwJrEjxOQ6SWHoZnJ3rr/YHmdvH
	ljvcoXCoJnSw+AvzrYHjtbGCpQN4NKW9ZIhHZJHNcb5yhOLis22JwSxrHUa6y939
	XYjgcl8Sq6L6x2+07uh7muloMacVvf1E64gMx2sItOFogzruwulq7c2KtymwbtJR
	G15847jOJ87FEqWebqwg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgkkh8dm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 18:03:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408I3STs021488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 18:03:28 GMT
Received: from [10.110.42.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 10:03:28 -0800
Message-ID: <e1ef292f-a331-40ff-a756-8df4549adb2a@quicinc.com>
Date: Mon, 8 Jan 2024 10:03:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] wifi: ath12k: advertise P2P dev support for WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240108082552.7227-1-quic_kangyang@quicinc.com>
 <20240108082552.7227-11-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240108082552.7227-11-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wmoRmp-NRGMxT7C8yI-bVtK5j6NedTVQ
X-Proofpoint-ORIG-GUID: wmoRmp-NRGMxT7C8yI-bVtK5j6NedTVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=473
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_100329_863665_21B40A27 
X-CRM114-Status: UNSURE (   8.26  )
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

On 1/8/2024 12:25 AM, Kang Yang wrote:
> Now that all the necessary pieces are implemented we can enable P2P
> support for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/hw.c  | 5 ++++-
Qualcomm Innovation Center copyright missing 2024

>  drivers/net/wireless/ath/ath12k/mac.c | 8 ++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)


