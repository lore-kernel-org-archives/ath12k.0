Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CCDCDB47E
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYWIJyi3InCDrSF449E/GX0COiDObZGToHZxQWDFOcU=; b=vNErql0DEEXDUM
	zJ8Ra1TEdcZGXIh3hVeD3yrzRWiIWPsTm545XO4ShdtDXlHojJo+JJ2whkQNoEvouDPzcSd7Dk1d1
	3EfKJOJqzAxx9XbPx/nBfYMmHS3hg4Hl8kzCAEJYhl8RntHSeVvwwmxMxZGE+Zse5SJWFrYL0t6SB
	yvawwhett7qhXuFtH889DWB5K+/k+WHmLLJBJmEUIH1Mx2rDuOOQYpMM64Q/Yjxu14p/YJoXHWPAt
	GHZu0r4telGa2ShXmKMAAivycKnkZQqygBs7Co1/8MiRdr7R5VQTPIjKzezh9ozhnUYaWmSksdxE3
	kKDOFoqqat/1y06eQt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBOW-00FT13-0A
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 18:35:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBOS-00FT0Z-1n
	for ath12k@lists.infradead.org;
	Wed, 18 Oct 2023 18:35:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IHj7oZ007488;
	Wed, 18 Oct 2023 18:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vq480vmUrj2MIzvRgRGCVlhtrhb7dhDXa5Vqjn3LLj4=;
 b=V+GPafrKtOfzeuToxSAVm/RXUYhoelnCaNc2mNkOaXUutsefAAs8r54vmQ6yhTmhl/O2
 76qoKvLQPq7p7EXQS4XV63fhfvfvb5qUyMjWyF93z9RmD1Lnw/+piL74w9taVk+/z9jS
 J41stdwtocgxoz0dW/T/AccGH7IM4eLE1aj2c7bs9UNln01yfU9yuV8lBB1Y8t3aVtRR
 SRFpjX6bC0hIbYnqn+f156onKrFZe1uxQZl1/poZ5pTuykeGHJqVqld4fMXdFMMy5zZI
 dROreO0a3DFFkad0by3QDV9jv9o05QId4WmiESl7sDHnSihkKEb4eu8mPOrbBEla5xON dQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt5v82173-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 18:35:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IIZdIq010126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 18:35:39 GMT
Received: from [10.111.183.229] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 11:35:39 -0700
Message-ID: <1702e807-8153-4b4b-bd7d-8ffca7574c75@quicinc.com>
Date: Wed, 18 Oct 2023 11:35:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: rename the wmi_sc naming convention to
 wmi_ab
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231018153008.29820-1-quic_periyasa@quicinc.com>
 <20231018153008.29820-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231018153008.29820-2-quic_periyasa@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ymNIC_AIoSgfUtiZpeTnXoRzNEkNR4dU
X-Proofpoint-ORIG-GUID: ymNIC_AIoSgfUtiZpeTnXoRzNEkNR4dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_16,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=697 lowpriorityscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_113544_735828_F9114292 
X-CRM114-Status: GOOD (  10.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/18/2023 8:30 AM, Karthikeyan Periyasamy wrote:
> In WMI layer module, the identifier wmi_sc is used to represent
> an instance of ath12k_wmi_base structure. However, within ath12k,
> the convention is to use "ab" to represent an SoC "base" struct.
> So change the all instances of wmi_sc to wmi_ab.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
