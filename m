Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D097C47422
	for <ath12k@archiver.kernel.org>; Sat, 27 Jan 2024 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzrm00QaGunc+hQJiP1hfEkIfsiOnqhKHNOlWdLK098=; b=kIjBmu2MSBeYTlN4CH+NavD8X+
	4SawUFNdXGniq/uv2Gj2I0VL5NP5dyAQhSxeOMLeX1cp8bJk/qghdrR9MORff+Q6o148a0ZjsYFk+
	2GS6RQEtkvyM9+EmU9fbdw/Lw/rjcY2eb0UMeDhYlje3o3DjD40LEwCr161HhnJJpRTbTVGDxRTp8
	38Efvph9hXoaY3vHpx8Of/1K1fqvfBEHw2L+JK5pOLcVhCDfVqwkn/LPZ8U7DISWac+bdstiXGwbI
	OYg4RehiyPFq+u1usPWAyxZLwEorwT4IpUXDhE4kyH2eY6vMQbXREhH0fQtGAj1E0Ot6D5aELyYW8
	rsiTh0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWVV-00000005yGz-39Lq
	for ath12k@archiver.kernel.org;
	Sat, 27 Jan 2024 00:25:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWVT-00000005yGd-29nA
	for ath12k@lists.infradead.org;
	Sat, 27 Jan 2024 00:25:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R0H0Qq032394;
	Sat, 27 Jan 2024 00:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wzrm00QaGunc+hQJiP1hfEkIfsiOnqhKHNOlWdLK098=; b=FG
	wqrqcB4Yzo3R2VD7qXbPG3H04dZb2Eb629UG8iaKoFGwucdXmc8ts7bNSs/qrldq
	vqNqcSkYr9Hq1hRAH1Mj2atv6poopIxC5rUUUKhvtAIL5g+QAeMDZ6CyIlueuQUr
	Pan2m4wdOtm82WE4l7zYANvjeUmlghL6TsqKaxOROeJrqKRMFntDE60Whda2RpIy
	6as6uwPR3NM/s5sVJCT8mhFKVbMlPa71+vL4YrD3VwQIUpinEOLRZ8i2VAvm1Feq
	bPcslPgAVfY1Tuculg75HMeNaCAcwu4xqbQGGAlwIy2uvE6syIwKHb9eeD/EQ6Yt
	2MwD4dohe2HWPGNi3UUg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv6c8j7jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:25:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0P9R9011190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:25:09 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:25:08 -0800
Message-ID: <c3479244-4e12-451c-a20d-d1323e93056a@quicinc.com>
Date: Fri, 26 Jan 2024 16:25:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] wifi: ath12k: move peer delete after vdev stop
 of station for WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-9-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-9-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pN3LYMTnuCxZmrZrrwQoFwvHcO7bntp-
X-Proofpoint-ORIG-GUID: pN3LYMTnuCxZmrZrrwQoFwvHcO7bntp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=883
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_162511_710353_A1D161CC 
X-CRM114-Status: UNSURE (   9.07  )
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

On 1/26/2024 3:52 AM, Kang Yang wrote:
> In current code, when STA/P2P Client connect to AP/P2P GO, the WMI
> command sequence is:
> 
> peer_create->vdev_start->vdev_up
> 
> And sequence of STA/P2P Client disconnect from AP/P2P GO is:
> 
> peer_delete->vdev_down->vdev_stop
> 
> This sequence of disconnect is not opposite of connect. For STA or P2P
> GO, bss peer is not needed by firmware during handling vdev stop
> command. So with this sequence, STA and P2P GO can work normally.
> 
> But for P2P Client, firmware needs bss peer in some functions during
> handling vdev stop command. The opposite sequence of disconnect should
> be:
> 
> vdev_down->vdev_stop->peer_delete
> 
> So change the sequence of disconnect as above opposite sequence for
> WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


