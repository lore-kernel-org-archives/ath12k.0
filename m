Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DE9C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjLNQSr7MXL+jo0Hqwe/pztdR07h/jsDy4S2LUII5is=; b=TKgBPZveNAb7LNjnh/kymDNk8Z
	wR63h/10SQjPvT3ZNwqUTDH/2E50+JCWfC9jCQLCpDvRxjr0l7j+ZrQJGGwRuxDcOt0j0KsXAMo5v
	EKEWcRY4qbOLe3AJOMAYNDuC1ui8a6RipEnM6zGnuW6Gg4TUolYCCBfTuLui0RGamzYVa7LbMUjJt
	NphuVk+syclJXucqQDTZ8mp8Q0W3liDozdpCsscLsJsh3wHLZc1a5DrMzo3vYlC/CV8HKFP0QitCe
	V4HjIC1f7DuPuVgBuzGfik8sQczgijqNjU+ba4NTTqZBRKkPZ/oSQ5MiB6q+LA47zojhFidjwl79i
	8BeXhmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seITh-00000007uLQ-08cj
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 18:12:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seITd-00000007uKz-2sqR
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 18:12:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47ECvSTZ017225;
	Wed, 14 Aug 2024 18:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjLNQSr7MXL+jo0Hqwe/pztdR07h/jsDy4S2LUII5is=; b=pNvwOL8sb9Rrf7EQ
	iut0UJp1NgkM2vKRnpN0ehthmCLbAKVAMa+tZyCl30/2jJeIwQ2RfD3ruVkwqKNm
	W8V8chqT2VaRwDd/kVpEVhbu99qMMVCi02vheSCcwTVwEgu/Lt8kOoS53lqpn0fH
	BcRZuVh70DzPxJ6X2c6wtOwZA3ZzfKurjoIhqQUtP3H8hlgwugo+A8Hu1ntZaJg/
	hEM0O56yzNWrA4425kbE+z2mNCPVvAW/ukFlHBga+MgEGmR+xtcqLTV0ulxmzDtS
	n8OOkOqbzdCX6gKzkRPN4Kduhm2M8jkNUN7a0IwnBR2dbQ8MvLlwTAk2zeWyZlEL
	oB1Idg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywjcdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 18:12:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EIC2L0013589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 18:12:02 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 11:12:02 -0700
Message-ID: <9e3ff5bf-cd73-46a3-8d43-81f452b5b5a3@quicinc.com>
Date: Wed, 14 Aug 2024 11:12:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: Introduce iface combination cleanup
 helper
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240814103423.3980958-1-quic_periyasa@quicinc.com>
 <20240814103423.3980958-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240814103423.3980958-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rfTKKhbsGqL-raJuAtVbOiajO4XLIsVZ
X-Proofpoint-GUID: rfTKKhbsGqL-raJuAtVbOiajO4XLIsVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_14,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=725 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_111205_770553_DF2A83A9 
X-CRM114-Status: UNSURE (   7.34  )
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

On 8/14/2024 3:34 AM, Karthikeyan Periyasamy wrote:
> Introduce a cleanup helper function to avoid redundant code for iface
> combination cleanup. Remove the cleanup code from
> ath12k_mac_hw_unregister() and ath12k_mac_hw_register() and replace it
> with new cleanup helper function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


