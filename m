Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D5FC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcYG4I3SJlYJirkt3h/m2Js27K4Ck+QRy+tSEtKGSo8=; b=imPxNBP+lOkhpoNTufW352jLYv
	POvwpg5o390ANg8xiKeRdJBtUp/Y6QBT/bU4xgu1SmTn+78e8tC4ri4/ct/cYWa/b/uCx+DGXCP3G
	loWRHHu6tN+zczjX3GHuWHgz9cuQMGQPNt395kJCxW5wRePL5qlDW0Gigro4iQZmHtWg5MHVseC/G
	sGXrfC03RhHPLNgOzN88WzCH528rXK1q0AZZIC0nz3Hge7UqbevkwICK1RcmUdJLin2MiLrHX0iwJ
	1ui819zFwcdYiCblJV/QSBGkrygUV2EtxLDWL/EOzfONybbKdDIOtdwThQCya58EeGlvv2K8PBjtA
	x3RP2X7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03A1-00000009cku-1MRU
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 17:45:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s039y-00000009cjw-1NDi
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 17:45:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PHSYKo016817;
	Thu, 25 Apr 2024 17:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=LcYG4I3SJlYJirkt3h/m2Js27K4Ck+QRy+tSEtKGSo8=; b=SL
	k/3iHUv4FXTJjcxt2cvmW71srZ1P3MMnO9svpJct6DtJ4gDQwd9psgoBMt0/hhTH
	JNSD4T1/aruqNeErkxG4Svhk5iWfOSdi+XVn/qiPSJKuMZV2ZCWWGj1gpkSz2DY2
	rVR4xHaRgPbgNuTjTnvaMHvxza9C08bw6D0d2F/lV/7cB1/ZnFG0exQmcB8fb5ZU
	3rIa2m+VnVA9Hks2OIZ5UipWHFMjY3xhitBuj4Q/Ae0MzV9l3Y3Aq9P1605Vcmia
	2eTMWk6GgFUQvAvzD9r2zCwtA1Gk0scCvCktB7jmWj/OApjwXEwoLpxRe8zpPEC4
	KqZazwgXwMSL4fjxP4rQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqengkbqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:45:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PHjMHW024846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:45:22 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 10:45:22 -0700
Message-ID: <6eda8fe4-bd89-425c-8717-65ab42e073ba@quicinc.com>
Date: Thu, 25 Apr 2024 10:45:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/6] bug fixes and enhancements to 6 GHz band support
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RTi-JLS00vmt2ImIWAUzDs0NO5V7dGwx
X-Proofpoint-ORIG-GUID: RTi-JLS00vmt2ImIWAUzDs0NO5V7dGwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_17,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_104526_413761_E9A31F44 
X-CRM114-Status: GOOD (  11.23  )
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

On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
> In 6 GHz band, add support for
> 1. channel 2.
> 2. Fix packet drop issues.
> 3. AMPDU aggregation
> 4. SMPS configuration
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v3:
>  - address review comments for fixing ath12k-check issues.

this should be more specific. at a minimum it should indicate which patches in
the series have been modified

> 
> changes in v2:
>  - Disable smps for WCN7850 after review comment from Boachen
>  - Added Tested-on tag for WCN7850
> 
> Pradeep Kumar Chitrapu (6):
>   wifi: ath12k: add channel 2 into 6 GHz channel list
>   wifi: ath12k: Correct 6 GHz frequency value in rx status
>   wifi: ath12k: fix survey dump collection in 6 GHz
>   wifi: ath12k: add 6 GHz params in peer assoc command
>   wifi: ath12k: refactor smps configuration
>   wifi: ath12k: support SMPS configuration for 6 GHz
> 
>  drivers/net/wireless/ath/ath12k/core.h  |   2 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c |   9 +-
>  drivers/net/wireless/ath/ath12k/mac.c   | 121 ++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/wmi.c   |  10 +-
>  4 files changed, 117 insertions(+), 25 deletions(-)
> 
> 
> base-commit: 326f8f68f28b0b831233acfabffb486a5b0f4717


