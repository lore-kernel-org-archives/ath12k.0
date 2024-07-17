Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32773C3DA42
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYTXZwwCrHfaGQVCMa2Noj2yv2XOmp1CwRQtdZDfUgQ=; b=NshbgmqWp/G6loUqxw2R0j14KX
	7ccPQ9gmBcquQsl1XDvM5Fnkd3FJk8AV74HPsF7aGOXhJcAaD7zJAKrhnB8d0dZuR3kOBaU2SWe7q
	03p8KnWFj55mvHEX3J0FAtLuN2+NAGaq703ygIzHh3/B4EhSEDj6l8Sl9jyd5F4kmAHIoZTCC6VQD
	JOQZd98/whl6nxEnznQhF3ZZELcRkNZkNgOZ3JGxu0LMW8OY+emrTnT6F8tOwVRu+7/Pmb4T/Dcbu
	TRxyEFymu9oBhEnEWGhbed2NxnHfQ4ydXTEw/kCg3uRhENyG/QV7jrkCGRRzbcjkCTpVlNIgjXATE
	Th/0PgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7tf-0000000EPTz-3Lrx
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 16:52:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7td-0000000EPSm-0Gk2
	for ath12k@lists.infradead.org;
	Wed, 17 Jul 2024 16:52:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HF072n029217;
	Wed, 17 Jul 2024 16:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYTXZwwCrHfaGQVCMa2Noj2yv2XOmp1CwRQtdZDfUgQ=; b=beoCzLIrSKSiVeZD
	brGNLWY0m65y6YV3yFIJK/RcamwK3lUjQwnN4F0zROU75r89LqfvJdE5Wihob9fg
	Qs7V2MPc1anZgnuL9QtiXJeaGnRWNRzyLsDGgeCXNN9g+E07Q+nDrug5AJssj19U
	yR00JgTtm7xGjKVt8+M+2+/K7HWkohSxaB88Y1xSTsILOq2hFsN4vYzRXnxDiiB5
	+HKtxBUH6W+UJ/qR9Jk6wvpKasVJPVWwiHH+usmh9f/OITqR/lp3qxfLpgla20Tx
	g4tEv9NVvZ0D4ruFcfnt521R2dbttS9HXEIw3HxT9jMoNsT6kQAIadIE1+rMtFFc
	nvnEFQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwj1k5e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 16:52:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HGqpP2026183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 16:52:51 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 09:52:51 -0700
Message-ID: <18f5a47d-3bef-4cfe-af7a-0185f89ccc5d@quicinc.com>
Date: Wed, 17 Jul 2024 09:52:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] wifi: ath12k: Adjust the timing to access ACPI table
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240717111023.78798-1-quic_lingbok@quicinc.com>
 <20240717111023.78798-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240717111023.78798-4-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NkSPUTMdx7eA1NX9U97GtPAu5YV4wvpp
X-Proofpoint-ORIG-GUID: NkSPUTMdx7eA1NX9U97GtPAu5YV4wvpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_13,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=850 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_095253_141938_BB440CEC 
X-CRM114-Status: UNSURE (   8.62  )
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
> Currently, the timing for accessing the ACPI table is inappropriate.
> 
> Due to special ACPI requirements, the ACPI table must be obtained before
> downloading the board data file. Therefore, adjust the timing for accessing
> the ACPI table accordingly.
> 
> This patch will not affect QCN9274, because only WCN7850 supports ACPI.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


