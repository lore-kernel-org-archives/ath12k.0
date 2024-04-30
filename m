Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3A8C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY1aYXl51VMJ/Qu2qu0nSWPVGquuELHBI3klAietru4=; b=BYfgGaHpivWkcEhAokumyBYTUe
	rn7Anzzj7Il1xRv5SgOzWIOBrjeEz15enf8wTVOsv4a1MDxyyYqAOoT/apeyPfQCJxG6htDCKnIC5
	Jusnb1NdHC0mjlgWA2XJjneaCXhCEtdqph2gCT7qclmNSD44dxIyK8Ykgi2zUe9OXGQemg9wsK915
	HHXAqoUoTCQDeEN8d368IaaerBj9TzjOxRoVAKYsH2HudN9TK9pjWuSGQwgNPRJEWBQUDvCVRfcjb
	zSoaqZwlpRV1855D6XZmgeX0LqfcoglQJstlxvEm9Nfh3PiyWuL3RSioMG++EScbsb04q+sy1Q2gn
	N+nEHkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sUh-00000007dIj-42HP
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 18:46:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sUd-00000007dHf-3nyb
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 18:46:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7EVBg002570;
	Tue, 30 Apr 2024 18:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EY1aYXl51VMJ/Qu2qu0nSWPVGquuELHBI3klAietru4=; b=lc
	y97az97UNHvvr1IP0W+uUhTiEmfmNNeVZSMlyRbypL/eFTZg2M8iO7icP5VFA/vm
	zcvOBD8AI6pA43nO75vlFT9qaUX9njgDui4GdaT7zCIoTd9L1yGmiIJVj2s6vhtj
	Vslv+7Pk2V3Fc2aoH0hp6ghlVmrFDZdNJqTg37Vs91+iTX1Eb/hkdeQFUHOH4r+g
	pzd5VujJ70dRMRR46IMdv0fl86m2yVO6Q3edm4BFzHpfQSk1BnAHwzZLyCtHgN5L
	dxWSZTYBTW4ngKpfN15Ko6pWx5WxEnExj8S+aw+s7b3EwsFJtuB9KNTIYyTDX0V0
	mzejdaxIgpbV66y1iyhw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xthgvux5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:46:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UIk5EH031278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:46:05 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 11:46:05 -0700
Message-ID: <67fdaee8-db68-4eae-897a-63d11f680103@quicinc.com>
Date: Tue, 30 Apr 2024 11:46:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: add multi device support for WBM
 idle ring buffer setup
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
 <20240430165811.1377182-5-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430165811.1377182-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ronWkXfjNpaUhu9PtlZQvOeJ80EbNjeX
X-Proofpoint-GUID: ronWkXfjNpaUhu9PtlZQvOeJ80EbNjeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_11,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=756 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_114621_082948_019937C8 
X-CRM114-Status: UNSURE (   7.65  )
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

On 4/30/2024 9:58 AM, Karthikeyan Periyasamy wrote:
> Currently, inter device MLO is not supported. Therefore, the WBM idle ring
> buffers choose the implicit return buffer manager (DEV0_IDLE_DESC_LIST).
> However, this implicit return buffer manager design not meeting the

Kalle, can you add the missing word in pending:
design *is* not meeting

> requirements to support inter device MLO. In inter device MLO, multiple
> devices participate. The device specific WBM idle ring buffers transmit
> to multiple device REO rings. To distinguish between device specific WBM
> idle buffers, the setup configuration need to choose a different return
> buffer manager based on the unique identifier (device index).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


